# MSSQL Docker Images

These images are pre-seeded images, so building them can be a bit tricky:

### 1) Pull the base images

-   `docker pull beumergroup/html5_sqlserver:build-1903`
-   `docker pull beumergroup/html5_sqlserver:build`

### 2) Make sure test data and images are up to date:

-   Update images by pulling or building the containers.
-   Update SAC TestData as described in `sac4base_docker/testDataGen/README.md`

### 3) Build the seeded images.

-   Make sure you don't have any BGFusionHTML containers running
-   Run build-1903.ps1
-   It will then start all the containers in a special mode where they write data to the db only
-   When you can see using `docker ps -a that` SAC, CWS, Alarmlink and sorter have finished, press enter
-   Done. Do the same for build.ps1
-   Run push.ps1 when done.

## Updating the base images

This should only be done if the empty sql image needs to be updated (SQL Server update or general configuration update)

Build the base images (Which just installs MSSQL). The builds fail at random, but when you have build them once on your pc you shouldn't have to do it again.

-   `docker build -t beumergroup/html5_sqlserver:build-1903 -f 1903.Dockerfile .`
-   `docker build -t beumergroup/html5_sqlserver:build .`

-   `docker push beumergroup/html5_sqlserver:build-1903`
-   `docker push beumergroup/html5_sqlserver:build`
