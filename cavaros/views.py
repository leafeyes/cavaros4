# -*- coding: utf-8 -*-
from django.template import loader, RequestContext, Context, Template
from django.http import HttpResponse, HttpRequest, HttpResponseRedirect, HttpResponseServerError
from django.shortcuts import render_to_response, render
from django.conf import settings
from django import http
from django.template.loader import get_template
from django.utils.encoding import iri_to_uri
from django.contrib.auth.models import User
from django.core.mail import send_mail, BadHeaderError, EmailMessage
from django import forms

from django.contrib.auth.models import User,Group




def error404(request, template_name='front/404.html'):
    dictInit = getInitialVariable(request)
    t = loader.get_template(template_name) # You need to create a 404.html template.
    return http.HttpResponseServerError(t.render(Context(dictInit)))


def error500(request, template_name='front/500.html'):
    dictInit = getInitialVariable(request)
    t = loader.get_template(template_name) # You need to create a 500.html template.
    return http.HttpResponseServerError(t.render(Context(dictInit)))
def uploadsuccess(request):
    return render_to_response('front/uploadsuccess.html', {})


def getInitialVariable(request):

    dictData = {}


    dictData['FULL_PATH'] = request.path
    dictData['SITE_MEDIA'] = settings.MEDIA_URL

    if request.user.is_authenticated():
        dictData["USER"] = User.objects.get(username=request.user)
        dictData["USER_ROLE"] = Group.objects.filter(user__id=dictData["USER"].id)

    return dictData

