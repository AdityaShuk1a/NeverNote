from api.views import *
from django.urls import path
from api.views import *

urlpatterns = [
    path('yaha/<str:pk>', UserDataList.as_view(), name="userList"),
    path('yaha', UserDataList.as_view(), name="userList"),
<<<<<<< HEAD
 
    path('notes', NotesModelList.as_view(), name="notesList"),
    path('notes/<str:pk>',AllUserNotesList.as_view(), name="userNotesList"),
=======
    path('createData', InsertUserData.as_view(), name="createdUser"),
    path('pdata', UserDataLeo.as_view(), name="User"),
>>>>>>> b1144980cbdb1967608c346798922b59a7529f6d
]
