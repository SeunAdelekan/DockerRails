FROM ruby:2.5

LABEL name="DockerRails"
LABEL maintainer="Iyanu Adelekan <iyanuadelekan@gmail.com>"
LABEL description="A benevolent docker container for Rails."
LABEL build_version=1.0
LABEL license="MIT"

RUN bundle config --global frozen 1

ARG rails_version=5.2.1
LABEL rails_version=${rails_version}

# Rails installation.
RUN gem install rails -v ${rails_version}

# Update apt-get package registry.
RUN apt-get update -y && \
    apt-get -y upgrade && \
    apt-get install -y build-essential tcl

# MySQL installation.
RUN apt-get install mysql-server

# PostgreSQL installation.
RUN apt-get install -y postgresql postgresql-contrib

# RabbitMQ installation.
RUN echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list && \
    curl http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | sudo apt-key add - && \
    apt-get update -y && \
    apt-get install rabbit-mq-server

# Redis installation.
RUN cd /temp && \
    curl -O http://download.redis.io/redis-stable.tar.gz && \
    tar xzvf redis-stable.tar.gz && \
    cd redis-stable && \
    make && \
    make install && \
    cd ~

# ImageMagick installation.
RUN apt-get install imagemagick -y

WORKDIR /app
COPY . /app

#RUN rails new TestApp -d postgresql
#RUN cd ./TestApp
#RUN ls

EXPOSE 80 81 3000

CMD cd ./TestApp && rails server