from django.shortcuts import render
from django.urls import path
from easydjango import before_request

from models import Cupcake


@before_request
def up_session(request):
    request.session['num'] = request.session.get("num", 0) + 1


def index(request):
    cupcake = Cupcake.objects.first()
    return render(
        request, "homepage.html",
        context={"name": cupcake.name})


urlpatterns = [
    path('', index)
]
