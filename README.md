## DJANGO Tutorial: https://docs.djangoproject.com

This is a summarized walkthrough of the Django tutorial at the above url implemented on an EC2 Ubuntu Server 14.04 LTS.

Setup server (e.g., vim + pluggins to use as IDE, update and install framework) and verify django version installed with the following shell commands

    ./setup.sh
    django-admin --version

Terminal returns  

    1.9.2


Follow tutorial at url above to create directories and files identical to mysite directory in this repo.


#### Part 1

Shell commands with comments

    ./part_1.sh

Start development server and preview at http://localhost:8000

    python manage.py runserver 0.0.0.0:8000

Edit the follwing files as directed in https://docs.djangoproject.com/en/1.9/intro/tutorial01/

1) To create a view:

    vim mysite/polls/views.py

2) To call the view map it to a url by creating a URLconf in urls.py

    vim mysite/polls/urls.py

3) To wire the new view into the root URLconf

    vim mysite/urls.py

Start development server and preview at http://localhost:8000

    python manage.py runserver 0.0.0.0:8000


#### Part 2

Before continuing with the tutorial, remove the secret key string provided by django framework from inside mysite/settings.py and store it as environmental variable in a newly created ../env.sh file outside of project directory

    cd ../
    vim env.sh

    #env.sh file in Vim
    SECRETKEY=paste-secret-key-string-here
    #Write and Quit Vim

    source env.sh
    export SECRETKEY

Edit secret key string in mysite/settings.py according to the following

    #mysite/settings.py
    SECRET_KEY = os.environ.get('SECRETKEY')


Edit the follwing files as directed in https://docs.djangoproject.com/en/1.9/intro/tutorial02/

1) To create models (e.g., database layout and metadata)

    vim polls/models.py

2) Activate models

    vim mysite/settings.py


Shell commands with comments

    ./part_2.sh

Play with API using django interactive shell (uses ipython, if installed)

    python manage.py shell

    In []: import django
    In []: django.setup()
    In []: from polls.models import Question, Choice
    In []: Question.objects.all()
    In []: from django.utils import timezone
    In []: q = Question(question_text="What's new?", pub_date=timezone.now())
    In []: q.save()
    In []: q.id
    In []: q.question_text
    In []: q.pub_date
    In []: q.question_text = "What's up?"
    In []: q.save()
    In []: Question.objects.all()
