from django.test import TestCase

from models import Cupcake, Person


class ModelTestCase(TestCase):
    def setUp(self):
        self.cupcake = Cupcake.objects.create(
            name="Cardamom",
            owner=Person.objects.create(name="Bob"))

    def test_model(self):
        self.assertEqual(self.cupcake.name, "Cardamom")


class ViewTestCase(TestCase):
    def setUp(self):
        self.cupcake = Cupcake.objects.create(
            name="Cardamom",
            owner=Person.objects.create(name="Bob"))

    def test_app(self):
        response = self.client.get("/")
        self.assertContains(response, "Hey")
