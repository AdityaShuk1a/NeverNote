from api.views import *
from django.urls import path
from api.views import *

urlpatterns = [
    path('yaha/<str:pk>', UserDataList.as_view(), name="userDetail"),
    path('yaha', UserDataList.as_view(), name="usersList"),
 
    path('notes', NotesModelList.as_view(), name="notesList"),
    path('notes/<str:pk>/', NotesModelList.as_view(), name="userNotesList"),
    path('note/<str:pk>/', NoteUpdateDeleteView.as_view(), name='update/delete-note'),
    path('home/<str:pk>/', FetchGlobalNotes.as_view(), name='update/delete-note'),
    path('register', RegisterUserView.as_view(), name='register-user'),
    path('login', LoginUserView.as_view(), name='login-user'),
       
]