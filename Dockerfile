FROM ingensi/oracle-jdk
MAINTAINER Ingensi labs <contact@ingensi.com>

RUN yum update -y && yum install -y unzip

RUN curl -O https://downloads.typesafe.com/typesafe-activator/1.3.10/typesafe-activator-1.3.10.zip
RUN unzip typesafe-activator-1.3.10.zip -d / && rm typesafe-activator-1.3.10.zip && chmod a+x /activator-dist-1.3.10/bin/activator
ENV PATH $PATH:/activator-dist-1.3.10/bin

EXPOSE 9000 8888
RUN mkdir /app
WORKDIR /app

CMD ["activator", "run"]
