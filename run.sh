#!/bin/sh

set -e

python manage.py migrate --noinput
# python manage.py collectstatic --noinput
python manage.py check --deploy

# python ./manage.py runserver 0.0.0.0:8000
gunicorn core.wsgi:application \
  --bind 0.0.0.0:8000 \
  --workers 3 \
  --timeout 120 \
  --access-logfile '-' \
  --error-logfile '-'
