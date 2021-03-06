FROM node:10-jessie

RUN sh -c 'echo "deb http://archive.debian.org/debian/ jessie-backports main contrib non-free" >> /etc/apt/sources.list.d/backports.list'
RUN sh -c 'echo "deb-src http://archive.debian.org/debian/ jessie-backports main contrib non-free" >> /etc/apt/sources.list.d/backports.list'
RUN cat /etc/apt/sources.list.d/backports.list
RUN echo 'Acquire::Check-Valid-Until no;' > /etc/apt/apt.conf.d/99no-check-valid-until
RUN apt-get update

#Install Google Chrome
RUN wget --quiet https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb || apt-get -qq install -y -f
RUN dpkg -i google-chrome-stable_current_amd64.deb

#Install Openjdk 8
RUN apt-get install -y -t jessie-backports openjdk-8-jdk-headless ca-certificates-java
