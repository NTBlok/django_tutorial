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

3) Make app modifiable in the admin site by telling admin that model objects have an admin interface

   vim polls/admin.py


Shell commands with comments

    ./part_2.sh

Play with API using django interactive shell (defaults to use ipython, if installed)

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


#### Part 3

Edit the follwing files as directed in https://docs.djangoproject.com/en/1.9/intro/tutorial03/

1) To add more views

    vim polls/views.py

2) Write new views into urls

    vim polls/urls.py

3) Create html templates

    vim polls/templates/polls/index.html
    vim polls/templates/polls/detail.html

#### Part 4

Edit the following files as directed in https://docs.djangoproject.com/en/1.9/intro/tutorial04/

1) To update the detail view to add a simple form

    vim polls/templates/polls/detail.html

2) Update the dummy implementation of the vote view to a real version
 
3) Implement the results view for when the vote view redirects to results after the user votes on a question

    vim polls/views.py

4) To create a results template

    vim polls/templates/polls/results.html

5) To update urls

    vim polls/urls.py

6) Amend views to use Django's generic views instead

    # Change <question_id> to <pk> because the generic views module expects "pk" to be the abbreviation for the primary key
    vim polls/urls.py
    
    # Overhaul views.py to use the generic.ListView and generic.DetailView of django.views 
    vim polls/views.py


#### Part 5 - Automated Testing

Edit the following files as directed in https://docs.djangoproject.com/en/1.9/intro/tutorial05/

1) To create a test

    vim polls/tests.py

2) Fix the bug uncovered by automated testing

    vim polls/models.py

3) Improve the view using the QuerySet API from model Question to filter out bad pub_dates (set as future dates)
   and add a constraint to exclude questions with bad pub_dates (so users can't see them by guessing the right URL)

    vim polls/views.py

#### Part 6 - Static File Management

Edit the following files as directed in https://docs.djangoproject.com/en/1.9/intro/tutorial06/

1) Edit a newly created stylsheet at polls/static/polls/style.css

    vim style.css

2) Edit polls/templates/polls/index.html to load the new stylesheet

    vim index.html

3) Add a reference to a new background image to the stylesheet

    vim style.css

4) In the style.css, to resize the image to cover the whole area

    body {
        background: white url("images/background.jpg") no-repeat right bottom;
        background-size: cover;
        }

5) Or to resize the image to have the area contain the whole image

    body {
        background: white url("images/background.jpg") no-repeat right bottom;
        background-size: contain;
        }

#### Part 7 - Customize Admin Form

Edit the following files as directed in https://docs.djangoproject.com/en/1.9/intro/tutorial07/

1) Edit polls/admin.py
1.1) Use **admin.site.register()** to reorder fields on the edit form
1.2) Split the form up into fieldsets

    vim polls/admin.py
