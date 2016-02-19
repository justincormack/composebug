#!/bin/sh

[ -f debian.iso ] || curl -o debian.iso http://debian-iso.mirror.anlx.net/8.3.0/amd64/iso-cd/debian-update-8.3.0-amd64-CD-1.iso

docker rmi -f composebug_default || true

echo "compose 1"
docker-compose run -T default cat debian.iso > debian2.iso
ls -la debian*.iso

echo "compose 2"
docker-compose run -T default cat debian.iso > debian2.iso
ls -la debian*.iso

echo "docker"
docker build -t dockertest:build .
docker run -i dockertest:build cat debian.iso > debian2.iso
ls -la debian*.iso
