# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
# account,password,sex,birthday,token(uuid产生的标示)（-----》）
# ip,time ,action(login/logout)
# Create your models here.
from User.exceptions import UserExistException, UserNotExistException

# nikename,img,account,token(sessionid)
class User(models.Model):
    account = models.EmailField(unique=True)
    password = models.CharField(max_length=100)
    # android/ios使用的时候只序列化部分字段
    def __getstate__(self):
        d = self.__dict__.copy()
        del d['password']
        return d
    @classmethod
    def register(cls,account,password,*args,**kwargs):
        if cls.objects.filter(account=account).count()==1:
            raise UserExistException('账号已经被占用')
        user = cls.objects.create(account=account,password=password)
        return user
    @classmethod
    def login(cls,account,password,time ,*args,**kwargs):
        if cls.objects.filter(account=account,password=password).count()==0:
            raise UserNotExistException('账号密码不对')
        else:
            import  time as t
            current = t.time()*1000
            time = int(time)
            start = current-1000*60*10
            if not (time>start and time<current) :
                raise  Exception('时间不对')
            # p = cls.objects.get(account=account).password
            # md5.update(p+str(time))
            # md4.hexdegiste() == password
            return cls.objects.get(account=account,password=password)

    @classmethod
    def is_exist(cls, email):
        return  cls.objects.filter(account=email).count()==1

#1;n (外键)
class Address(models.Model):
    name = models.CharField(max_length=20)
    phone = models.CharField(max_length=20)
    address = models.CharField(max_length=100)
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    isdefault = models.BooleanField(default=False)
    # isdelte = models.BooleanField(default=F)
