#!/bin/sh

docker-compose stop nextcloud-app nextcloud-db
sudo cp -r nextcloud nextcloud-backup
docker-compose pull nextcloud-app
docker-compose up -d nextcloud-db
sleep 10;
docker-compose up -d nextcloud-app
sleep 5;
docker-compose exec -u 33 nextcloud-app php /var/www/html/occ upgrade
