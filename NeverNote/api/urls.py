from api.views import UserDataList
from django.urls import path
from api.views import *

urlpatterns = [
    path('yaha', UserDataList.as_view(), name="userList"),
]
