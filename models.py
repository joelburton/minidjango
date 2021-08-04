from django.db import models


class Person(models.Model):
    name = models.CharField(max_length=50)

    class Meta:
        app_label = "minidjango"
        db_table = "persons"


class Cupcake(models.Model):
    name = models.CharField(max_length=50)
    owner = models.ForeignKey(Person, on_delete=models.PROTECT)

    class Meta:
        app_label = "minidjango"
        db_table = "cupcakes"
