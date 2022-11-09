#!/bin/bash

set -xe

[ -f .env ] && . ./.env
[ -f .env.local ] && . ./.env.local

cat ./.docker_pass | docker login -u $USERNAME --password-stdin

full_image_name=${USERNAME}/${DOCKER_IMAGE}:${DOCKER_IMAGE_TAG}

docker build --platform linux/arm/v6 -t ${full_image_name} .

docker push ${full_image_name} 

docker logout
