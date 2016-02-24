## Part 1
# Create a project (e.g., collection of configuration and apps for a website)
django-admin startproject mysite

# Create an app (e.g., web application within a website)
cd mysite
python manage.py startapp polls

## Part 2
# Create tables in the database
python manage.py migrate
