# -*- coding: utf-8 -*-
from django.db import models
from django.utils.encoding import smart_unicode
from django.contrib.auth.models import User,Group
from projects.models import *

# Create your models here.

class projects(models.Model):

    project_name = models.CharField(verbose_name=" ", max_length=250, blank=True, null=True)
    description = models.CharField(verbose_name=" ", max_length=500, blank=True, null=True)
    create_date = models.DateField(verbose_name='', auto_now_add=True, null=True, blank=True,
        help_text="")
    start_date = models.DateField(verbose_name='', null=True, blank=True,
        help_text="")
    end_date   = models.DateField(verbose_name='', null=True, blank=True,help_text="")
    url = models.CharField(max_length=50)

    user = models.ManyToManyField(User)

    def __unicode__(self):
        return u"%s" % (self.project_name)


class image_user(models.Model):
    imagePath = models.FileField(upload_to='userAvatar/')
    user = models.ForeignKey(User)

class projects_users_groupRel(models.Model):
    user = models.ForeignKey(User,null=True)
    project = models.ForeignKey(projects,null=True)
    group = models.ForeignKey(Group,null=True)

