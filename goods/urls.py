#coding=utf-8
from django.conf.urls import url
from goods import views
urlpatterns=[
    url(r'^$',views.IndexView.as_view()),
    url(r'^category/(\d+)$',views.IndexView.as_view()),
    url(r'^category/(\d+)/page/(\d+)$',views.IndexView.as_view()),
    url(r'^category/(\d+)/page/(\d+)$',views.IndexView.as_view()),
    url(r'^.*/goods/(\d+)$',views.GoodsDetailsView.as_view())
]

# url(r'^$', view.index_view), ---->view.index_view(request)
#url(r'^$',views.IndexView.as_view()),--->views.IndexView.as_view()(request)