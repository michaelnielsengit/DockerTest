# remove all containers
docker ps -a -q | % { docker rm $_ }

# remove all images
docker images -q | % { docker rmi $_ }

pause