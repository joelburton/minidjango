import sys
from django import setup
from django.conf import settings
from django.core.management import execute_from_command_line


def init(**kwargs):
    settings.configure(**{
        "ROOT_URLCONF": "app",
        "INSTALLED_APPS": ["app"],
        "DEBUG": True,
        "SECRET_KEY": "abc123",
        "TEMPLATES": [
            {
                'BACKEND': 'django.template.backends.django.DjangoTemplates',
                'DIRS': ["templates"],
                'OPTIONS': {
                    'context_processors': [
                        'django.template.context_processors.debug',
                        'django.template.context_processors.request',
                ]}
                }],
        "MIDDLEWARE": ['django.contrib.sessions.middleware.SessionMiddleware', 'fake.before_middleware'],
        "SESSION_ENGINE": 'django.contrib.sessions.backends.signed_cookies',
        **kwargs
    })
    setup()


def run():
    execute_from_command_line(sys.argv)


_befores = []

def before_middleware(get_response):
    def middleware(request):
        for before in _befores:
            before(request)
        return get_response(request)
    return middleware

def before_request(func):
    _befores.append(func)
