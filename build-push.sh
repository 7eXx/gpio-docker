#!/bin/bash

set -ex

[ -f .env ] && . ./.env
[ -f .env.local ] && . ./.env.local

image_name=${USERNAME}/${DOCKER_IMAGE}

full_image_name=${image_name}:${DOCKER_IMAGE_TAG}

current_branch=$(git branch --show-current)
branch_image_name=${image_name}:${current_branch}

commit_hash=$(git log -1 --format=%h)
commit_image_name=${image_name}:${commit_hash}

docker build \
    --platform linux/arm/v6 \
    -t ${full_image_name} \
    -t ${branch_image_name} \
    -t ${commit_image_name} .

cat ./.docker_pass | docker login -u $USERNAME --password-stdin

docker push --all-tags ${image_name} 

docker logout

exit 0