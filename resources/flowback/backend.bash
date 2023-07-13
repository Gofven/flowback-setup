#!/bin/bash

# Setup Backend
source .env
git clone "${BACKEND_REPO}" backend

cd backend || exit
python3.10 -m venv venv
source venv/bin/activate
python3.10 -m pip install -r requirements.txt
python3.10 manage.py makemigrations
python3.10 manage.py migrate
deactivate