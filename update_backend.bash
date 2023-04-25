#!/bin/bash

source .env
cd "$(pwd)/backend" || exit

screen -XS flowback-"${INSTANCE_NAME}"-backend quit
screen -XS flowback-"${INSTANCE_NAME}"-celery-beat quit
screen -XS flowback-"${INSTANCE_NAME}"-celery-worker quit
source venv/bin/activate
git pull https://github.com/lokehagberg/flowback-backend.git
python3.10 -m pip install -r requirements.txt
python3.10 manage.py migrate
screen -S flowback-"${INSTANCE_NAME}"-backend -dm bash -c "source venv/bin/activate; python manage.py runserver localhost:${BACKEND_PORT}"
screen -S flowback-"${INSTANCE_NAME}"-celery-worker -dm bash -c "source venv/bin/activate; celery -A backend worker --loglevel=info"
screen -S flowback-"${INSTANCE_NAME}"-celery-beat -dm bash -c "source venv/bin/activate; celery -A backend beat -l info --scheduler django_celery_beat.schedulers:DatabaseScheduler"
deactivate

caddy reload --config /etc/caddy/Caddyfile