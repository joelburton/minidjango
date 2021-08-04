from easydjango import init
from django.urls import include, path

init(
    DATABASES={
        'default': {
            'ENGINE': 'django.db.backends.postgresql',
            'NAME': "cupcakes",
        }
    }
)


urlpatterns = [
    path('', include('routes')),
]
