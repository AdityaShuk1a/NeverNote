from django.urls import path
from api.views import *

urlpatterns = [
    path('yaha/<str:pk>', UserDataList.as_view(), name="userList"),
    path('yaha', UserDataList.as_view(), name="userList"),
    path('createData', InsertUserData.as_view(), name="createdUser"),
    path('api/register/', RegisterView.as_view(), name='register'),

    
]
