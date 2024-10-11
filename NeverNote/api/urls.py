
from django.urls import path

from api.views import *

urlpatterns = [
    path('yaha/<str:pk>', UserDataList.as_view(), name="userList"),
    path('yaha', UserDataList.as_view(), name="userList"),
 
    path('snote', NotesModelList.as_view(), name="notesList"),
    path('notes/<str:pk>',AllUserNotesList.as_view(), name="userNotesList"),







    # path('api/login/', login_view, name='login'),                       #testing by Abhijit

    path('register', RegisterUserView.as_view(), name='register-user'),
    path('login', LoginUserView.as_view(), name='login-user'),
    # path('home', home, name='home'), ------------------------------------------>to test

]



