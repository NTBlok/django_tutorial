## Part 2
# Create initial tables in the database
python mysite/manage.py migrate

# Store changes in models in files on disk (e.g., polls/migrations/0001_initial.py)
python mysite/manage.py makemigrations polls


## Optional BEGIN
# Return SQL run by migration
python mysite/manage.py sqlmigrate polls 0001
# Use check command to look for problems without making migrations
python mysite/manage.py check
## Optional END


# Re-run to create tables in the database by applying all migrations to synchronize changes
python mysite/manage.py migrate
