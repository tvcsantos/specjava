FROM --platform=linux/amd64 ubuntu:10.04

RUN  sed -i.bak -r \
    's/(archive|security).ubuntu.com/old-releases.ubuntu.com/g' \
    /etc/apt/sources.list

RUN  apt-get update \
  && apt-get install -y build-essential \
  && apt-get install -y bison \
  && apt-get install -y flex

ADD gmp-4.3.2.tar.gz /opt

RUN cd /opt/gmp-4.3.2 \
    && ./configure \
    && make \
    && make install

COPY jdk-7u80-linux-x64.tar.gz_* /tmp

RUN cat /tmp/jdk-7u80-linux-x64.tar.gz_* | tar -C /opt -xzvf -

RUN rm /tmp/jdk-7u80-linux-x64.tar.gz_*

ENV JAVA_HOME /opt/jdk1.7.0_80
ENV PATH="/opt/jdk1.7.0_80/bin:${PATH}"

ADD cvc3-2.2.tar.gz /opt

RUN cd /opt/cvc3-2.2 \
    && ./configure --enable-dynamic --enable-java \
    && make \
    && make install

ENV LD_LIBRARY_PATH /opt/cvc3-2.2/lib:/usr/local/lib

ADD specjava_docker.tar.gz /opt

RUN cd /opt/specjava \
    && cp -r ../cvc3-2.2/java/include/ . \
    && cp -r ../cvc3-2.2/java/lib/ . \
    && cp -r ../cvc3-2.2/lib/ .

ENV PATH="/opt/specjava/bin:${PATH}"
