from channels.routing import URLRouter
from django.conf import settings
from django.urls import path

_urlpatterns = []

websocket_urlpatterns = URLRouter([
    path('ws/v1/', URLRouter(_urlpatterns)),
])
