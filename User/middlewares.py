#coding=utf-8
from django.http.request import HttpRequest
from django.http.response import HttpResponseRedirect

from jiukuaijiu.settings import AUTH_LIST

class Auth(object):
    def __init__(self,get_response):
        self.get_response = get_response
    def __call__(self,request, *args, **kwargs):
        'user/asd'
        # print request.path
        if request.path in  AUTH_LIST:
            if not  request.session.get('user'):
                return HttpResponseRedirect('/user/login')

        return self.get_response(request,*args,**kwargs)