#!/usr/bin/env bash
set -e

IMAGE_NAME="${STS_EXAMPLE_DOCKER_IMAGE_NAME}:${TRAVIS_TAG}"
LATEST_IMAGE_NAME="${STS_EXAMPLE_DOCKER_IMAGE_NAME}:latest"

docker login -u $DOCKER_HUB_USER -p $DOCKER_HUB_PASSWORD

docker build -t $IMAGE_NAME ./sts-example
docker tag $IMAGE_NAME $LATEST_IMAGE_NAME

docker push $IMAGE_NAME
docker push $LATEST_IMAGE_NAME
