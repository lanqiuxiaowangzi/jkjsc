#coding=utf-8
from django import forms
from User.models import  User
class RegisterForm(forms.Form):

    account = forms.EmailField(max_length=20,error_messages={'max_length':'长度不能超过20','required':'邮箱不能为空'})
    password = forms.CharField(max_length=32,min_length=32,error_messages={'max_length':'密码格式不正确','min_length':'密码格式不正确','required':'密码不能为空'})

    def clean(self):
        forms.Form.clean(self)
        email = self.cleaned_data.get('account', '')
        if  email :
            import re
            if not re.match(r'^[a-zA-Z0-9_-]{6,}@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$',email) :
                self.errors['account']=['邮箱格式不正确']
            elif  User.is_exist(email):
                    self.errors['account'] = ['当前账号已经存在']


