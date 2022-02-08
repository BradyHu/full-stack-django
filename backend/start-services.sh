#!/usr/bin/env bash

echo "DEPLOY_ENV: ${DEPLOY_ENV}"
export PYTHONPATH=$PYTHONPATH:/www/wwwroot/src/
ulimit -c 0
cd src
if [[ "${ENABLE_LOCAL_FILE}" == "True" ]];then
  python manage collectstatic --noinput
fi

if [[ "${RUN_MODE}" == "RUNSERVER" ]]; then
  echo "RUNSERVER MODE"
  python manage.py runserver 0.0.0.0:80
elif [[ "${RUN_MODE}" == "SUPERVISORD" ]]; then
  echo "SUPERVISORD MODE"
  /usr/bin/supervisord -c /www/wwwroot/deploy/supervisor.ini
#elif [[ "${RUN_MODE}" == "CELERY_WORKER" ]]; then
#  echo "CELERY WORKER MODE"
#  celery worker --workdir /www/wwwroot/src -A config -l info
fi