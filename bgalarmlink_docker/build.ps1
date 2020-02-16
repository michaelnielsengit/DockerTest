$error.clear();

try {
    & ..\bggetPackages.ps1 bgalarmlink;
} catch {
    "ERROR: Package check failed - see output above";
    exit;
}

if (!$error) {
    & docker build -t beumergroup/html5_bgalarmlink:latest .;
    & docker build -t beumergroup/html5_bgalarmlink:1903 -f 1903.Dockerfile .;
}

Write-Output "SUCCESS: Build complete. Now test the results with 'docker run' or 'docker-compose up'.";
Write-Output "SUCCESS: When you are satisfied with the results, run the 'push.ps1' script to push changes to the global Docker repository.";

pause