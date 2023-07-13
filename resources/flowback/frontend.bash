#!/bin/bash

# Setup Frontend
source .env
git clone "${FRONTEND_REPO}" frontend

cd frontend || exit
npm install
