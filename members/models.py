# -*- coding: utf-8 -*-
from django.db import models
from django.contrib.auth.models import User


# Create your models here.
class members(models.Model):
    user = models.ForeignKey(User, null=True)
