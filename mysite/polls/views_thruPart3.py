from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse , HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.template import loader
from django.http import Http404

from .models import Question, Choice

##Write a new index view to return latest 5 poll question in the system.
#def index(request):
#    return HttpResponse("Hello, world. You're at the polls index.")
def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
   ##No longer need 'output =' statement because added 'template =' and 'context =' statements
   # output = ', '.join([q.question_text for q in latest_question_list])
    template = loader.get_template('polls/index.html')
    context = {
            'latest_question_list': latest_question_list,
    }
    ##Revised return statement to return new context variable redered inside template
    #return HttpResponse(output)
    return HttpResponse(template.render(context, request))
    ##Alternatively, use 'django.shortcuts import render' for the shortcut: render() which makes importing loader and HttpResponse not necessary here.

'''
def detail(request, question_id):
    try:
        question = Question.objects.get(pk=question_id)
    except: Question.DoesNotExist:
        raise Http404("Question does not exist")
    return render(request, 'polls/detail.html', {'question':question})
'''
#Rewrite detail view with shortcut get_object_or_404()
def detail(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'polls/detail.html', {'question': question})

def results(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'polls/results.html', {'question': question})

def vote(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    try:
        selected_choice = question.choice_set.get(pk=request.POST['choice'])
    except (KeyError, Choice.DoesNotExist):
        return render(request, 'polls/detail.html', {
            'question': question,
            'error_message': "You didn't select a choice.",
            })
    else:
        selected_choice.votes += 1
        selected_choice.save()
        return HttpResponseRedirect(reverse('polls:results', args=(question.id,)))
