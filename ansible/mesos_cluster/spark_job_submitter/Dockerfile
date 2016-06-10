FROM nimmis/ubuntu:14.04
MAINTAINER Sandeep Sarpe <sarpe.sandeep@gmail.com>

Run echo 'Updating the base ubuntu image with dependencies needed for Spark.......'
RUN apt-get update

# Install Oracle JDK instead of OpenJDK
RUN sudo apt-get remove -y --auto-remove openjdk* && \
    sudo apt-get update && \
    sudo apt-get install -y software-properties-common && \
    sudo add-apt-repository -y ppa:webupd8team/java && \
    sudo apt-get update && \
    sudo echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections && \
    sudo echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections && \
    sudo apt-get install -y oracle-java8-installer oracle-java8-set-default && \
    sudo rm -r /var/cache/oracle-jdk*

#Install wget
RUN apt-get install -y wget

#Install spark
RUN mkdir /opt/spark
RUN wget http://ts.teranetworks.com:9080/nexus/content/repositories/thirdparty/org/spark/spark/1.6.0/spark-1.6.0.tgz -P /home/ubuntu
RUN tar --strip-components=1 -xzf /home/ubuntu/spark-1.6.0.tgz -C /opt/spark
RUN echo 'Updated the base ubuntu image with dependencies needed for Spark.'

RUN echo 'Setting up environment variables for spark.......'
ENV SPARK_HOME /opt/spark
ENV PATH $PATH:/opt/spark/bin
ENV MESOS_NATIVE_JAVA_LIBRARY /usr/local/lib/libmesos.so
RUN echo 'Set environment variables for spark.'

#Install mesos

RUN apt-get update && \
apt-get install --no-install-recommends -y ca-certificates curl && \
rm -rf /var/lib/apt/lists/*

# https://github.com/Yelp/dumb-init
RUN curl -fLsS -o /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.0.2/dumb-init_1.0.2_amd64 && chmod +x /usr/local/bin/dumb-init

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
echo deb http://repos.mesosphere.io/ubuntu trusty main > /etc/apt/sources.list.d/mesosphere.list && \
apt-get update && \
apt-get install --no-install-recommends -y mesos=0.28.1-2.0.20.ubuntu1404 && \
rm -rf /var/lib/apt/lists/*

