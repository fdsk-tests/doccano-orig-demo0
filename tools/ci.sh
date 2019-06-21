#!/usr/bin/env bash

set -o errexit

python3 -m pip install -r requirements.txt
flake8
python3 -m python app/manage.py migrate
coverage run --source=app app/manage.py test server.tests
coverage report
