FROM python:3.4

MAINTAINER Mesut Tasci

ENV PYTHONUNBUFFERED 1

RUN apt-get update
RUN apt-get install --no-install-recommends -y openjdk-7-jdk openjdk-7-jre

RUN pip install --upgrade pip

ADD https://download-cf.jetbrains.com/python/pycharm-professional-2016.2.3.tar.gz  /opt

ADD requirements.txt /srv/requirements.txt
RUN pip install -r /srv/requirements.txt

CMD ["/opt/pycharm-2016.2.3/bin/pycharm.sh"]
