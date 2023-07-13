#!/bin/bash

source .env
cd "$(pwd)/frontend" || exit

screen -XS flowback-"${INSTANCE_NAME}"-frontend quit

git pull "${FRONTEND_REPO}"
npm install
screen -S flowback-"${INSTANCE_NAME}"-frontend -dm bash -c "yarn run dev"
