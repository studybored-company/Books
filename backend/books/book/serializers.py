from rest_framework import serializers

from . models import Book


# class CategorySerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Category
#         fields = ['category']

    

class BookSerializer(serializers.ModelSerializer):
    class Meta:
        model = Book
        fields = [
            'id',
            'name',
            # 'price',
            'category'
        ]
    # def to_representation(self, instance):
    #     rep = super().to_representation(instance)
    #     rep['category'] = BookSerializer(instance.book).data
    #     return rep
