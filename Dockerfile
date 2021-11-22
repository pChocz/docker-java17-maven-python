# OpenJDK alpine image with Java 17
# Maven 3.6.0
# Python 3
# Anybadge

openjdk:17-jdk-alpine

MAINTAINER Piotr Choczynski

# this is a non-interactive automated build - avoid some warning messages
ENV DEBIAN_FRONTEND noninteractive

# update dpkg repositories
RUN apt-get update 

# install wget
RUN apt-get install -y wget

# get maven 3.3.9
RUN wget --no-verbose -O /tmp/apache-maven-3.6.0.tar.gz http://archive.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz

# verify checksum
# RUN echo "fae9c12b570c3ba18116a4e26ea524b29f7279c17cbaadc3326ca72927368924d9131d11b9e851b8dc9162228b6fdea955446be41207a5cfc61283dd8a561d2f /tmp/apache-maven-3.6.0.tar.gz" | md5sum -c

# install maven
RUN tar xzf /tmp/apache-maven-3.6.0.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.6.0 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.6.0.tar.gz
ENV MAVEN_HOME /opt/maven

# install python
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update
RUN apt -y install python3.6
RUN apt-get -y install python3-pip

# install bc (bash calculator)
RUN apt-get -y install bc

# install xmllint
RUN apt-get -y install libxml2-utils

# remove download archive files
RUN apt-get clean

# install anybadge
RUN pip3 install anybadge



# remove download archive files
RUN apt-get clean

CMD [""]
