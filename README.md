## DJANGO Tutorial: https://docs.djangoproject.com

Run on Ubuntu
    
    django-admin --version

1.9.2

    git clone https://github.com/NTBlok/django_tutorial.git

Follow tutorial at url above to create directories and files identical to mysite directory

For part 1 the following shell commands are executed:

    ./part_1.sh

Preview run:

    python manage.py runserver 0.0.0.0:8000

Edit mysite/polls/views.py

Remove secret key from settings.py and store it as environmental variable in env.sh file outside of project directory

    cd ../
    source env.sh

For part 2 shell commands are:

    ./part_2.sh


