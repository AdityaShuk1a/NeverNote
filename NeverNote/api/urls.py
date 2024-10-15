from api.views import *
from django.urls import path
from api.views import *

urlpatterns = [
    path('yaha/<str:pk>', UserDataList.as_view(), name="userList"),
    path('yaha', UserDataList.as_view(), name="userList"),
 
    path('notes', NotesModelList.as_view(), name="notesList"),
    path('notes/<str:pk>',AllUserNotesList.as_view(), name="userNotesList"),
]
