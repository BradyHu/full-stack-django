FROM python:3.9.1

COPY deploy/sources.list /etc/apt/sources.list
RUN apt clean && apt update && apt install -y supervisor vim
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

COPY . /www/wwwroot
WORKDIR /www/wwwroot/

RUN pip install poetry -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
RUN /usr/local/bin/python -m pip install --upgrade pip -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
RUN POETRY_VIRTUALENVS_CREATE=false poetry install --no-dev

RUN ["chmod", "+x", "./start-services.sh"]

EXPOSE 80
CMD ["./start-services.sh"]