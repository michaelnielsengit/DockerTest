if ($args.Length -eq 0) {
    Write-Error "ERROR: Parameter missing. Usage: 'bggetPackages.ps1 project_folder_name' (i.e. 'bgalarmlink')";
    exit;
}

$project_folder_name = $args[0];
$docker_folder_name = "$($project_folder_name)_docker";

Write-Output "Checking if the project packages are present - they are needed inside the docker";

# There are two different versions of the package file depending on the project
$package_xml_location = "$PSScriptRoot\$docker_folder_name\$project_folder_name\package.xml";
$package_xml_exists = Test-Path $package_xml_location;
Write-Output "Checked path for package.xml: $package_xml_location : $package_xml_exists";

$packages_txt_location = "$PSScriptRoot\$docker_folder_name\$($project_folder_name)\install\packages.txt";
$packages_txt_exists = Test-Path $packages_txt_location;
Write-Output "Checked path for packages.txt: $packages_txt_location : $packages_txt_exists";

if (-Not $package_xml_exists -And -Not $packages_txt_exists) {
    Write-Error "ERROR: Neither package.xml nor packages.txt was found. Did you specify the correct project_folder_name?";
    exit;
}

$packages = @();

# Finds packages using package.xml file (bgalarmlink, bgcws)
if ($package_xml_exists) {
    Foreach ($line in Get-Content $package_xml_location) {
        if ($line -Match "<package ") {
            Write-Output "Found required package: $line";
    
            $matches = ([regex]'"(.*?)"').Matches($line);
            
            $packages += , @($matches[0].Value.Replace('"', ''), $matches[1].Value.Replace('"', ''));
        }
    }    
}

# Finds packages using packages.txt file (sorter5base)
# Each line alternates between being a package name and a version
if ($packages_txt_exists) {
    $count = 0;
    Foreach ($line in Get-Content $packages_txt_location) {
        $is_even = $count % 2;

        if ($is_even -eq 0) {
            $output = "Found required package: $line-";
            $package = @();
            $package += $line;
        } else {
            $package += $line;
            $packages += , $package;
            Write-Output "$output$line";
            Clear-Variable -Name "package";
        }

        $count++;
    }
}

Write-Output "Checking if packages are already present...";

$packages_to_download = @();
Foreach ($package in $packages) {
    $path = "$PSScriptRoot\$docker_folder_name\packages\$($package[0])\$($package[0])-$($package[1])"; 

    $path_exists = Test-Path $path;
    if ($path_exists) {
        Write-Output "Package already present:     $path";
    } else {
        Write-Output "Package flagged for download:     $($package[0])-$($package[1])";
        $packages_to_download += , $package;
    }
}

if ($packages_to_download.Length -gt 0) {
    Write-Output "Downloading flagged packages...";

    Foreach ($package in $packages_to_download) {
        $name = $package[0];
        $version = $package[1];
        # Write-Output "bgget $name $version $PSScriptRoot\$docker_folder_name\packages";

        & "bgget" $name $version "$PSScriptRoot\$docker_folder_name\packages";
    }
    
} else {
    Write-Output "There were no packages to download";        
}

Write-Output "SUCCESS: Package check completed - necessary packages are present. You can run docker builds now.";
