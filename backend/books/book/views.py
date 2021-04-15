from django.shortcuts import render
from rest_framework import generics
from rest_framework import serializers, viewsets
from . models import Book
from .serializers import BookSerializer
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status

# Create your views here.
from . models import Book
from .serializers import BookSerializer
from . import serializers

class ListBook(generics.ListCreateAPIView):
    queryset =Book.objects.all()
    serializer_class = BookSerializer


class DetailedBook(generics.RetrieveUpdateDestroyAPIView):
    queryset = Book.objects.all()
    serializer_class = BookSerializer

    def put(self, request, pk=None):
        return Response({'http_method': 'PUT'})

    def patch(self, request, pk=None):
        return Response({'http_method': 'PATCH'})
 
# class BookView(viewsets.ViewSet):
#     queryset =Book.objects.all()
#     serializer_class = serializers.BookSerializer


# class BookView(APIView):
#     queryset =Book.objects.all()
#     serializer_class = serializers.BookSerializer

#     def list(self, request):
#         queryset =Book.objects.all()
#         serializer_class = BookSerializer

#     def post(self, request):
#         serializer = serializers.BookSerializer(data=request.data)

#         if serializer.is_valid():
#             name = serializer.data.get('name'),
#             category = serializer.data.get('category')

#             return Response({'name':name, 'category':category})
#         else:
#             return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#     def get(self, request, pk=None):
#         return Response({'http_method': 'GET'})
    
#     def put(self, request, pk=None):
#         return Response({'http_method': 'PUT'})

#     def patch(self, request, pk=None):
#         return Response({'http_method': 'PATCH'})

#     def delete(self, request, pk=None):
#         return Response({'http_method': 'DELETE'})      



# def update(request,pk=None):
#     data=request.data.get("data")
#     cat_data=request.data.get("data_cat")
#     Book_update=Book.objects.get(id=pk)
#     Book_update.name=data
#     Book_update.category=cat_data
#     Book_update.save()
    