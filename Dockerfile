FROM ubuntu:precise

MAINTAINER Doug Tangren <d.tangren@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list                     

ADD http://www.rabbitmq.com/rabbitmq-signing-key-public.asc /apt_key.asc

RUN apt-key add /apt_key.asc

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y dist-upgrade

RUN apt-get -y --force-yes \
            install supervisor \
            rabbitmq-server

RUN rabbitmq-plugins enable rabbitmq_management

RUN mkdir -p /var/log/supervisor

COPY ./etc/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY ./bin/run /bin/run

EXPOSE 5672 15672

CMD /bin/run