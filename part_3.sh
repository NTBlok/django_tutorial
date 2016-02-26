# Template system
cd mysite/polls
mkdir templates

cd templates
mkdir polls

# Template for index view needs to be located at polls/templates/polls/index.html
# The reason for this is because of how the app_directories template loader works.
# Refer to this template within Django with the abbreviation of polls/index.html
# This is template namespacing (e.g., putting templates inside another dir named for the application) 
cd polls
touch index.html
