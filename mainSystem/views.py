from django.shortcuts import render
from cavaros.views import *
from mainSystem.views import *
from projects.models import image_user
from mainSystem.formsImageUser import imageUserForm
from projects.views import *
from sections.views import *

from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.contrib.auth import logout
from django.contrib.auth.models import User
# Create your views here.
def main(request):
    dictData = getInitialVariable(request)

    return render(request, 'front/index.html', dictData)

def changePass(request):
    dictData = getInitialVariable(request)
    dictData['change'] = 'change!!!'
    return render(request, 'front/changePassword.html', dictData)

def test(request):
    dictData = getInitialVariable(request)
    return render(request, 'front/profile.html', dictData)

def register(request):
    dictData = getInitialVariable(request)
    dup_username="true"
    txt_username = " "
    txt_fname = " "
    txt_lname = " "
    txt_email = " "
    txt_password = " "

    if "POST" in request.method:
        if request.POST['txt_firstname'] != "":
            txt_fname = request.POST['txt_firstname']
        if request.POST['txt_lastname'] != "":
            txt_lname = request.POST['txt_lastname']
        if request.POST['txt_email'] != "":
            txt_email = request.POST['txt_email']
        if request.POST['txt_username'] != "":
            txt_username = request.POST['txt_username']
        if request.POST['txt_password'] != "":
            txt_password = request.POST['txt_password']

        for obj_members in User.objects.all():
          if obj_members.username==txt_username:
                dictData["REG_MESSAGE"] = 'This username has been used'
                dup_username="true"
                return render(request, 'front/register.html', dictData)
          else:
                dup_username="false"

        if dup_username=="false":

            user = User.objects.create_user(txt_username,txt_email,txt_password)

            # At this point, user is a User object that has already been saved
            #to the database. You can continue to change its attributes
            # if you want to change other fields.
            user.first_name = txt_fname
            user.last_name = txt_lname

            user.is_staff = True
            user.save()
            user.groups.add(Group.objects.get(name='Team member'))
            return HttpResponseRedirect('/register_thanks/')
    return render(request, 'front/register.html', dictData)

def register_thanks(request):
    dictData = getInitialVariable(request)
    return render(request, 'front/registered.html', dictData)

def change_passwordPage(request):
    dictData = getInitialVariable(request)

    dictData['USERNAME'] = dictData['USER'].username
    return render(request, 'front/changePassword.html', dictData)

def change_password(request):
    dictData = getInitialVariable(request)

    in_username = "";
    in_password = "";
    in_new_password = "";

    in_username = request.POST['txt_username']
    in_password = request.POST['txt_password']
    in_new_password = request.POST['txt_new_password']


    user = authenticate(username=in_username, password=in_password)
    if user is not None:
        if user.is_active:
            u = User.objects.get(username=in_username)
            u.set_password(in_new_password)
            u.save()

            # Redirect to a success page.
            return HttpResponseRedirect('/profiles/'+in_username)

    else:
        # Return an 'invalid login' error message.
        dictData["ERROR"] = 'wrong passwod, please re-type again'
    return render(request, 'front/changePassword.html', dictData)

def user_login(request):
    dictData = getInitialVariable(request)

    txt_username = "";
    txt_password = "";

    if request.POST['txt_username'] != "":
        txt_username = request.POST['txt_username']
    if request.POST['txt_password'] != "":
        txt_password = request.POST['txt_password']

    user = authenticate(username=txt_username, password=txt_password)

    if user is not None:
        if user.is_active:
            login(request,user)
            # Redirect to a success page.
            return HttpResponseRedirect('/profiles/'+txt_username)
        else:
        # Return a 'disabled account' error message
            dictData["ERROR"] = 'the account does not exits'

    else:
        # Return an 'invalid login' error message.
        dictData["ERROR"] = 'wrong username or passwod, please type again'
    return render(request, 'front/index.html', dictData)

def logout_view(request):
    dictData = getInitialVariable(request)
    logout(request)
    # Redirect to a success page.
    return render(request, 'front/index.html', dictData)

@login_required(login_url='/accounts/login/')
def profiles(request,username_url):
    dictData = getInitialVariable(request)

    dictData['USERNAME'] = dictData['USER'].username
    dictData['FIRSTNAME'] = dictData['USER'].first_name
    dictData['LASTNAME'] = dictData['USER'].last_name
    dictData['EMAIL'] = dictData['USER'].email
    dictData["USERID"] = dictData["USER"].id


    ownproject = projects_users_groupRel.objects.filter(user_id=dictData["USER"],group_id=1)
    assignproject = projects_users_groupRel.objects.filter(user_id=dictData["USER"],group_id=3)

    projectAll = projects.objects.filter(user__id = dictData["USER"].id )

    dictData["PROJECTALL"] = projectAll
    dictData["OWN_PROJECT"] = ownproject
    dictData["ASSIGN_PROJECT"] = assignproject

    if ownproject.count() > 0 :
        object_member = User.objects.filter(projects__id=ownproject[0].id)
        dictData["MEBERS_P"] = object_member

    return render(request, 'front/profile.html', dictData)


def profiles_editInfo(request,username_url):
    dictData = getInitialVariable(request)

    txt_fname=""
    sentFile=""
    if request.POST['txt_fname'] != "":
        txt_fname = request.POST['txt_fname']
    if request.POST['sentFile'] != "":
        sentFile = request.POST['sentFile']

        dictData['USER'].first_name =  txt_fname
        dictData['USER'].save()

        u = User.objects.filter(username= dictData['USER'])[0]
        image = image_user(imagePath = sentFile,user = u )
        image.save()

    return HttpResponseRedirect('/profiles/'+dictData['USER'].username)




def profiles_edit(request,username_url):
    dictData = getInitialVariable(request)

    dictData['USERNAME'] = dictData['USER'].username
    dictData['FIRSTNAME'] = dictData['USER'].first_name
    dictData['LASTNAME'] = dictData['USER'].last_name
    dictData['EMAIL'] = dictData['USER'].email

    return render(request, 'front/profile_edit.html', dictData)

@login_required(login_url='/accounts/login/')
def project(request,username_url):
    dictData = getInitialVariable(request)

    if "USER" in dictData:
        for obj_members in dictData["USER_ROLE"]:

            if obj_members.name == "Project Manager":
                dictData["d"] = obj_members.name
                return HttpResponseRedirect('/projectManagerDashboard/')
            else:
                dictData["USERNAME"] = dictData["USER"].first_name
                dictData["d"] = obj_members.name
                return render(request, 'front/myProject.html', dictData)
    return HttpResponseRedirect('/projectManagerDashboard/')

def is_member(user):
    return user.groups.filter(name='Team Memebr').exists()

def loginRequire(request):
    dictData = getInitialVariable(request)

    dictData["ERROR"] = 'PLEASE LOGIN'
    return render(request, 'front/index.html', dictData)

@login_required(login_url='/accounts/login/')
def search_member(request):
    dictData = getInitialVariable(request)

    if request.POST['search_member'] != "":
        search_member = request.POST['search_member']

        object_member = User.objects.filter(username = search_member)
        dictData["MEMBERS"] = object_member


    dictData["USERNAME"] = dictData["USER"].first_name

    object_project = projects.objects.filter(user__id=dictData["USER"].id)

    dictData["PROJECTS"] = object_project
    return render(request, 'front/projectManager_Dashboard_member_search.html', dictData)

def searchProject(request):
    dictData = getInitialVariable(request)
    if request.method == "GET":
        search_text = request.GET['search_text']

    pros = projects.objects.filter(project_name__contains=search_text)

    return render(request, 'front/ajax_search.html', {'pros':pros })


def searchMember(request):
    dictData = getInitialVariable(request)
    if request.method == "GET":
        search_text = request.GET['search_text']

    members = User.objects.filter(username__contains=search_text)

    return render(request, 'front/ajax_member_search.html', {'members':members })

def search_member2(request):
    dictData = getInitialVariable(request)
    if request.method == "GET":
        search_text2 = request.GET['search_text2']
    members = User.objects.filter(username__contains=search_text2)

    return render(request, 'front/ajax_member_search2.html', {'members':members })

def search_member_section(request):
    dictData = getInitialVariable(request)

    if request.method == "GET":
        search_textSection = request.GET['search_textSection']


    members = User.objects.filter(username__contains=search_textSection)

    return render(request, 'front/ajax_member_search_section.html', {'members':members })

def search_member_task(request):
    dictData = getInitialVariable(request)

    if request.method == "GET":
        search_textTask = request.GET['search_textTask']

    members = User.objects.filter(username__contains=search_textTask)

    return render(request, 'front/ajax_member_search_task.html', {'members':members })

