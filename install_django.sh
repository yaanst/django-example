#!/bin/bash
#Installation de l'application
#zf170421.1035

echo ------------ Tequila DJANGO admin user
echo "Enter your Tequila username: " ; read zUSER
echo "Enter your email adress: " ; read zEMAIL

echo ------------ install DJANGO requirements
source ./.venv/bin/activate
pip install -r requirements/base.txt

echo ------------ DJANGO make migrations
python ./django_example/manage.py makemigrations
python ./django_example/manage.py migrate
echo "from django.contrib.auth.models import User; User.objects.create_superuser('$zUSER', '=$zEMAIL', 'pass')" | python ./django_example/manage.py shell
