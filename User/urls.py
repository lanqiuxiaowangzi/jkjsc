from django.conf.urls import url
from User import views
urlpatterns=[
    url(r'^register/',views.RegisterView.as_view()),
    url(r'^login/',views.LoginView.as_view()),
    url(r'^verify/',views.VerifyView.as_view()),
    url(r'^verifycode/',views.VerifyCodeView.as_view()),
    url(r'^usercenter/',views.UserCenterView.as_view()),
    url(r'^logout/',views.LogoutView.as_view()),
    url(r'^address/',views.UserAddressView.as_view()),
]