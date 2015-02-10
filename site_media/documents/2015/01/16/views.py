from django.shortcuts import render, render_to_response
from head_banner.models import *
from ttd.views import *
# Create your views here.


def listingDetail(request):
    dictData = {}

    return render_to_response('front/listingDetail.html', dictData)


def newsContent(request):
    dictData = {}

    return render_to_response('front/newsContent.html', dictData)
