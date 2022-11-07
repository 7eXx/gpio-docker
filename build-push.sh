#!/bin/bash

[ -f .env ] && . ./.env
[ -f .env.local ] && . ./.env.local

cat ./.docker_pass | docker login -u $USERNAME --password-stdin

docker build -t $full_image_name .

docker push $full_image_name 

docker logout
