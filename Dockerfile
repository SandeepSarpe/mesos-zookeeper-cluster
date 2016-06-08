FROM nimmis/ubuntu:14.04
MAINTAINER Sandeep Sarpe <sarpe.sandeep@gmail.com>

RUN apt-get update && \
    apt-get install --no-install-recommends -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible

RUN apt-get install -y vim
