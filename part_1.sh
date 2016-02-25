## Part 1
# Create a project called mysite (project = collection of configuration and apps for a website)
django-admin startproject mysite

# Create an app called polls (app = web application within a website)
cd mysite
python mysite/ manage.py startapp polls

# Create URLconf in polls directory to call views
cd polls
touch urls.py
