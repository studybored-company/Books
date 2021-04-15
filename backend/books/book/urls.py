from django.urls import path,include

from . import views

from rest_framework.routers import DefaultRouter
from.views import ListBook, DetailedBook
# from .views import BookView
# from.views import DetailedBook

# router = DefaultRouter()
urlpatterns = [
    path('',ListBook.as_view()),
    path('/<int:pk>/',DetailedBook.as_view())
    # path('/<int:pk>/<string:name>/<string:category>/',DetailedBook.as_view()),
    # path('/<int:pk>/',views.update)
    # path('',views.BookView.as_view()),
    # path('',include(router.urls))  
]