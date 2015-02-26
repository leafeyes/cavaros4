from django.conf.urls import patterns, include, url

from django.contrib import admin
import os
from cavaros.views import *
from mainSystem.views import *
from projects.views import *
from sections.views import *
admin.autodiscover()
PROJECT_DIR = os.path.dirname(__file__)

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'cavaros.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    (r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': PROJECT_DIR + r'/media/'}),

    (u'^$', main),
    url(r'^test/$',test),

    url(r'^change/$' , changePass),

    url(r'^register/$',register),
    url(r'^register_thanks/$',register_thanks),
    url(r'^changePassword/$',change_passwordPage),
    url(r'^searchProject/$',searchProject),
    url(r'^searchMember/$',searchMember),
    url(r'^change_password/$',change_password),


    url(r'^login/$',user_login),
    url(r'^logout/$',logout_view),
    url(r'^project/(?P<username_url>.+)/$','mainSystem.views.project'),
    url(r'^accounts/login/$', loginRequire),
    url(r'^profiles/(?P<username_url>.+)/$',profiles),
    url(r'^profiles_edit/(?P<username_url>.+)/$',profiles_edit),
    url(r'^profiles_editInfo/(?P<username_url>.+)/$',profiles_editInfo),
    url(r'^projectManagerDashboard/$', projectList),
    url(r'^addProject/$', addProject),
    url(r'^addSection2/(?P<project_url>.+)/$', addSection2),
    url(r'^addTaskSection/(?P<project_url>.+)/$', addTask),
    url(r'^addTask/(?P<project_url>.+)/$', addTask),
    url(r'^addCheckList/(?P<project_url>.+)/$', addCheckList),
    url(r'^addFile/(?P<project_url>.+)/$', addFile),

    url(r'^addMember/$', addMember),
    url(r'^addMember2/(?P<project_url>.+)/$', addMember2),

    url(r'^addMemberTask/(?P<project_url>.+)/$', addMemberTask),
    url(r'^addMemberSection/(?P<project_url>.+)/$', addMemberSection),

    url(r'^projectDetail/(?P<project_url>.+)/$',projectDetail),
    url(r'^delete_project/$', delete_project),
    url(r'^delete_projectObject/(?P<project_url>.+)/$', delete_projectObject),

    url(r'^assignedProject/$', assignedProject),

    url(r'^search_member/$', search_member),
    url(r'^search_member2/$', search_member2),
    url(r'^search_member_section/$', search_member_section),
    url(r'^search_member_task/$', search_member_task),
    url(r'^search_titles/$',search_titles),

    (r'^site_media/(?P<path>.*)$', 'django.views.static.serve',
     {'document_root': settings.BASE_DIR + '/site_media/', 'show_indexes': True}),
    (r'^static/(?P<path>.*)$', 'django.views.static.serve',
     {'document_root': settings.BASE_DIR + '/static/', 'show_indexes': True}),
)
