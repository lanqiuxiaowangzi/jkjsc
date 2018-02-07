#coding:utf-8
from django.conf.urls import url
from order import views
urlpatterns=[
url(r'^$',views.OrderView.as_view()),
url(r'^order.html$',views.OrderListView.as_view()),
url(r'^toorder/$',views.ToOrderView.as_view()),
url(r'^checkorder/$',views.CheckOrderView.as_view()),
]