from django.shortcuts import render
from cavaros.views import *
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.contrib.auth import logout
from django.contrib.auth.models import User,Group
from projects.models import *
from projects.views import *
from sections.models import *
from tasks.models import *

import datetime

from django.contrib import messages
# Create your views here.


@login_required(login_url='/accounts/login/')
def addProject(request):
    dictData = getInitialVariable(request)

    dictData["USERNAME"] = dictData["USER"].username

    txt_projectname = " "
    txt_desc = " "
    startdate = " "
    enddate = " "
    members=" "
    if "POST" in request.method:
        if request.POST['txt_projectname'] != "":
            txt_projectname = request.POST['txt_projectname']
        if request.POST['txt_desc'] != "":
            txt_desc = request.POST['txt_desc']
        if request.POST['start_date'] != "":
            startdate = request.POST['start_date']
        if request.POST['end_date'] != "":
            enddate = request.POST['end_date']

        if request.POST['searchmember'] != "":
            searchmember = request.POST['searchmember']

        p = projects(
            project_name= txt_projectname,
            description = txt_desc,
            create_date = datetime.datetime.now(),
            start_date  = startdate,
            end_date    = enddate,
            url         = txt_projectname,
        )
        p.save()


        u = User.objects.filter(id=dictData["USER"].id)[0].id
        p.user.add(u)

        u = User.objects.filter(username=dictData["USER"].username)[0]
        u.groups.add(Group.objects.filter(name='project manager')[0])

        pug = projects_users_groupRel(
            user=     User.objects.filter(id=dictData["USER"].id)[0],
            project = p,
            group =   Group.objects.filter(name='project manager')[0],

        )
        pug.save()

        au = User.objects.filter(username=searchmember)[0]
        p.user.add(au)

        pug = projects_users_groupRel(
            user=    au,
            project = p,
            group =   Group.objects.filter(name='team member')[0],

        )
        pug.save()



    return HttpResponseRedirect('/projectManagerDashboard/')

@login_required(login_url='/accounts/login/')
def addSection2(request,project_url):
    dictData = getInitialVariable(request)
    dictData["USERNAME"] = dictData["USER"].username

    txt_sectionname = " "
    txt_sectiondesc = " "
    section_start_date = " "
    section_end_date = " "

    if "POST" in request.method:
        if request.POST['txt_sectionname'] != "":
            txt_sectionname = request.POST['txt_sectionname']

        if request.POST['txt_sectiondesc'] != "":

            txt_sectiondesc = request.POST['txt_sectiondesc']
        if request.POST['sectionstart_date'] != "":
            section_start_date = request.POST['sectionstart_date']

        if request.POST['sectionend_date'] != "":
            section_end_date = request.POST['sectionend_date']
        if request.POST['searchmemberSection'] != "":
            searchmemberSection = request.POST['searchmemberSection']



        p = projects.objects.filter(id=project_url)[0]

        s = sections(
            sections_name= txt_sectionname,
            description = txt_sectiondesc,
            create_date = datetime.datetime.now(),
            start_date  = section_start_date,
            end_date    = section_end_date,
            url         = txt_sectionname,
            project    = p
        )
        s.save()
        au = User.objects.filter(username=searchmemberSection)[0]
        s.user.add(au)

        return HttpResponseRedirect('/projectDetail/'+project_url)



@login_required(login_url='/accounts/login/')
def addTask(request,project_url):
    dictData = getInitialVariable(request)
    dictData["USERNAME"] = dictData["USER"].username

    if "POST" in request.method:
        if request.POST['sectionSelected'] != "":
            sectionSelected = request.POST['sectionSelected']

        if request.POST['txt_taskname'] != "":
            txt_taskname = request.POST['txt_taskname']

        if request.POST['txt_taskdesc'] != "":

            txt_staskdesc = request.POST['txt_taskdesc']
        if request.POST['taskstart_date'] != "":
            taskstart_date = request.POST['taskstart_date']

        if request.POST['taskend_date'] != "":
            taskend_date = request.POST['taskend_date']
        if request.POST['searchmemberTask'] != "":
            searchmemberTask = request.POST['searchmemberTask']

        s = sections.objects.filter(sections_name=sectionSelected,project_id=project_url)[0]

        task = tasks(
            tasks_name= txt_taskname,
            description = txt_staskdesc,
            create_date = datetime.datetime.now(),
            start_date  = taskstart_date,
            end_date    = taskend_date,
            url         = txt_taskname,
            section    =  s
        )
        task.save()
        u = User.objects.filter(username=searchmemberTask)[0]
        task.user.add(u)

        s.user.add(u)


        return HttpResponseRedirect('/projectDetail/'+project_url)

@login_required(login_url='/accounts/login/')
def addTaskSection(request,project_url):
    dictData = getInitialVariable(request)
    dictData["USERNAME"] = dictData["USER"].username

    if "POST" in request.method:
        if request.POST['sectionSelected'] != "":
            sectionSelected = request.POST['sectionSelected']

        if request.POST['txt_taskname'] != "":
            txt_taskname = request.POST['txt_taskname']

        if request.POST['txt_taskdesc'] != "":

            txt_staskdesc = request.POST['txt_taskdesc']
        if request.POST['taskstart_date'] != "":
            taskstart_date = request.POST['taskstart_date']

        if request.POST['taskend_date'] != "":
            taskend_date = request.POST['taskend_date']

        if request.POST['searchmemberTask'] != "":
            searchmemberTask = request.POST['searchmemberTask']

        s = sections.objects.filter(sections_name=sectionSelected,project_id=project_url)[0]

        task = tasks(
            tasks_name= txt_taskname,
            description = txt_staskdesc,
            create_date = datetime.datetime.now(),
            start_date  = taskstart_date,
            end_date    = taskend_date,
            url         = txt_taskname,
            section    =  s
        )
        task.save()
        u = User.objects.filter(username=searchmemberTask)[0]
        task.user.add(u)



        return HttpResponseRedirect('/projectDetail/'+project_url)

@login_required(login_url='/accounts/login/')
def  addMemberSection(request,project_url):
    dictData = getInitialVariable(request)

    object_project = projects.objects.filter(user__id=dictData["USER"].id)[0]
    if "POST" in request.method:
        if request.POST['sectionSelectedAddmeberMore'] != "":
            sectionSelectedAddmeberMore = request.POST['sectionSelectedAddmeberMore']
        if request.POST['searchmemberSectionMore'] != "":
            searchmemberSectionMore = request.POST['searchmemberSectionMore']

        s = sections.objects.filter(sections_name=sectionSelectedAddmeberMore,project_id=project_url)[0]
        u = User.objects.filter(username=searchmemberSectionMore)[0]
        s.user.add(u)


        return HttpResponseRedirect('/projectDetail/'+project_url)

@login_required(login_url='/accounts/login/')
def addMemberTask(request,project_url):
    dictData = getInitialVariable(request)

    if "POST" in request.method:
        if request.POST['taskSelectedAddmeberMore'] != "":
            taskSelectedAddmeberMore = request.POST['taskSelectedAddmeberMore']
        if request.POST['searchmemberTaskMore'] != "":
            searchmemberTaskMore = request.POST['searchmemberTaskMore']
        if request.POST['taskSelectedAddmeberMoreID'] != "":
            taskSelectedAddmeberMoreID = request.POST['taskSelectedAddmeberMoreID']
            object_project = projects.objects.filter(user__id=dictData["USER"].id)[0]



        object_project = projects.objects.filter(user__id=dictData["USER"].id)[0]
        t = tasks.objects.filter(id=taskSelectedAddmeberMoreID)[0]
        u = User.objects.filter(username=searchmemberTaskMore)[0]
        t.user.add(u)

        return HttpResponseRedirect('/projectDetail/'+project_url)

@login_required(login_url='/accounts/login/')
def addMember(request):

    dictData = getInitialVariable(request)

    dictData["USERNAME"] = dictData["USER"].username

    if "POST" in request.method:

        if request.POST['searchmember'] != "":
            members = request.POST['searchmember']

            object_project = projects.objects.filter(user__id=dictData["USER"].id)[0]
            u = User.objects.filter(username=members)[0].id
            object_project.user.add(u)

            pug = projects_users_groupRel(
                user=     u,
                project = object_project,
                group =   Group.objects.filter(name='Team Member')[0],

            )
            pug.save()

            return HttpResponseRedirect('/projectDetail/'+project_url)


@login_required(login_url='/accounts/login/')
def addMember2(request,project_url):

    dictData = getInitialVariable(request)

    dictData["USERNAME"] = dictData["USER"].username

    if "POST" in request.method:

        if request.POST['searchmember'] != "":
            members = request.POST['searchmember']

            object_project = projects.objects.filter(id=project_url)[0]
            u = User.objects.filter(username=members)[0]
            object_project.user.add(u)

            pug = projects_users_groupRel(
                user=     u,
                project = object_project,
                group =   Group.objects.filter(name='Team Member')[0],

            )
            pug.save()

            return HttpResponseRedirect('/projectDetail/'+project_url)
    return HttpResponseRedirect('/projectDetail/'+project_url)



@login_required(login_url='/accounts/login/')
def projectList(request):

    dictData = getInitialVariable(request)
    dictData["USERNAME"] = dictData["USER"].username

    project = projects_users_groupRel.objects.filter(user_id=dictData["USER"],group_id=1)
    projectAll = projects.objects.filter(user__id = dictData["USER"].id )

    dictData["PROJECTALL"] = projectAll
    dictData["SELECT_PROJECT"] = project
    dictData["USERID"] = dictData["USER"].id

    if project.count() > 0 :
        object_member = User.objects.filter(projects__id=project[0].id)
        dictData["MEBERS_P"] = object_member

    return render(request, 'front/projectManager_Dashboard.html', dictData)


@login_required(login_url='/accounts/login/')
def assignedProject(request):

    dictData = getInitialVariable(request)
    dictData["USERNAME"] = dictData["USER"].username

    assignproject = projects_users_groupRel.objects.filter(user_id=dictData["USER"],group_id=3)

    projectAll = projects.objects.filter(user__id = dictData["USER"].id )
    sectionSelect = sections.objects.filter(user__id = dictData["USER"].id )
    taskSelect = tasks.objects.filter(user__id = dictData["USER"].id )

    dictData["USERID"] = dictData["USER"].id

    if assignproject.count() > 0 :
        dictData['ASSIGNEDPROJECT'] = assignproject
        dictData['PROJECTALL'] = projectAll
        dictData['SECTIONALL'] = sectionSelect
        dictData['TASKALL'] = taskSelect
        return render(request, 'front/myProject.html', dictData)

    return render(request, 'front/myProject.html', dictData)



def projectDetail(request, project_url):
    dictData = getInitialVariable(request)

    dictData["USERNAME"] = dictData["USER"].username

    object_project = projects.objects.filter(id=project_url)[0]
    dictData["PROJECTS_DETAIL"] = object_project



    return render_to_response('front/projectDetail.html', dictData)

@login_required(login_url='/accounts/login/')
def delete_project(request):

    dictData = getInitialVariable(request)
    dictData["USERNAME"] = dictData["USER"].username

    project = projects_users_groupRel.objects.filter(user_id=dictData["USER"],group_id=1)
    projectAll = projects.objects.filter(user__id = dictData["USER"].id )

    dictData["PROJECTALL"] = projectAll
    dictData["SELECT_PROJECT"] = project
    dictData["USERID"] = dictData["USER"].id

    if projectAll.count() > 0 :
        object_member = User.objects.filter(projects__id=project[0].id)
        dictData["MEBERS_P"] = object_member

    return render_to_response('front/projectManager_Dashboard_delete.html', dictData)




@login_required(login_url='/accounts/login/')
def delete_projectObject(request,project_url):
    dictData = getInitialVariable(request)

    projects.objects.filter(url=project_url).delete()
    messages.add_message(request, messages.INFO, 'Hello world.')

    return HttpResponseRedirect('/delete_project/')

def search_titles(request):
    if request.method == "POST":
        search_text = request.POST['search_text']
    else:
        search_text = ''
    pros = projects.objects.filter(project_name=search_text)
    return render_to_response('front/ajax_search.html',{'pros':pros})