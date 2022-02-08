# !/usr/bin/python3
# -*- coding:utf-8 -*-
# @File: schema.py
# @Author: BradyHu
# @Email: baoshenghu@citydnatech.com
# @Time: 2021/12/20 下午2:07
from drf_yasg.views import get_schema_view
from drf_yasg import openapi
from rest_framework.permissions import AllowAny

schema_view = get_schema_view(
    openapi.Info(
        title="Snippets API",
        default_version='v1',
        description="Test description",
        terms_of_service="https://www.google.com/policies/terms/",
        contact=openapi.Contact(email="contact@snippets.local"),
        license=openapi.License(name="BSD License"),
    ),
    public=True,
    permission_classes=(AllowAny,),
)