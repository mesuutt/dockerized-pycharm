FROM python:3.6

MAINTAINER Mesut Tasci

ENV PYTHONUNBUFFERED 1

RUN echo deb http://http.debian.net/debian jessie-backports main >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install --no-install-recommends -y openjdk-8-jdk openjdk-8-jre

RUN pip install --upgrade pip

ENV USER=developer
ENV UID=1000
RUN useradd -m -u $UID $USER

# You can download tarball yourself for fast build.
# If you download tarball in Dockerfile with ADD instruction, 
# docker will download tarball every time.
# If you download tarball yourself and want to use it
# edit and uncomment following ADD instruction and remove/comment out other releted three line.
#ADD ./pycharm.tar.gz /opt

ADD https://download-cf.jetbrains.com/python/pycharm-professional-2018.3.5.tar.gz  /opt/pycharm.tar.gz
RUN tar -xzf /opt/pycharm.tar.gz -C /opt
RUN rm /opt/pycharm.tar.gz

ADD ./requirements.txt /srv
RUN pip install -r /srv/requirements.txt

USER $USER

CMD ["/opt/pycharm-2018.3.5/bin/pycharm.sh"]
