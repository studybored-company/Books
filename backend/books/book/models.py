from django.db import models

# Create your models here.
       
class Book(models.Model):
    name = models.CharField(max_length=100)
    category = models.CharField(max_length=100)
    # ForeignKey(Category, on_delete=models.CASCADE)

    def __str__(self):
        return self.name
