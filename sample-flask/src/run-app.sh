#!/bin/bash
source ./bin/activate
gunicorn -w 2 --bind 0.0.0.0:${PORT} --access-logfile - --error-logfile - wsgi:app