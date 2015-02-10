from django.shortcuts import render
from cavaros.views import *
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.contrib.auth import logout
from django.contrib.auth.models import User,Group
from projects.models import *
from projects.views import *
import datetime

from django.contrib import messages
# Create your views here.
