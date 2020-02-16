if (! (Test-Path "./install/packages/perl")) {
    & bgget perl 5.12.3-win .\install\packages;
}


& docker build -t beumergroup/html5_baseimage:latest .;
& docker build -t beumergroup/html5_baseimage:1903 -f 1903.Dockerfile .;