FROM python:3.4

MAINTAINER Mesut Tasci

ENV PYTHONUNBUFFERED 1

RUN apt-get update
RUN apt-get install --no-install-recommends -y openjdk-7-jdk openjdk-7-jre

RUN pip install --upgrade pip

# You can download tarball yourself for fast build.
# If you download tarball in Dockerfile with ADD instruction, 
# docker will download tarball every time.
# If you download tarball yourself and want to use it
# edit and uncomment following ADD instruction and remove/comment out other releted three line.
#ADD ./pycharm.tar.gz /opt

ADD https://download-cf.jetbrains.com/python/pycharm-professional-2016.2.3.tar.gz  /opt/pycharm.tar.gz
RUN tar -xzf /opt/pycharm.tar.gz -C /opt
RUN rm /opt/pycharm.tar.gz

ADD ./requirements.txt /srv
RUN pip install -r /srv/requirements.txt

CMD ["/opt/pycharm-2016.2.3/bin/pycharm.sh"]
