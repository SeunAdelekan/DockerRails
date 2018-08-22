FROM ruby:2.5

LABEL name="DockerRails"
LABEL maintainer="Iyanu Adelekan <iyanuadelekan@gmail.com>"
LABEL description="A benevolent Docker container for Rails."
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
RUN apt-get install mysql-server -y

# PostgreSQL installation.
RUN apt-get install -y postgresql postgresql-contrib

# Redis installation.
RUN curl -O http://download.redis.io/redis-stable.tar.gz && \
    tar xzvf redis-stable.tar.gz && \
    cd redis-stable && \
    make && \
    make install

# ImageMagick installation.
RUN apt-get install imagemagick -y

# Node.js installation.
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install nodejs -y && \
    apt-get install npm -y

# Start Postgres and MySQL services.
RUN service postgresql start && \
    service mysql start

WORKDIR /src
COPY . /src

RUN bundle install

EXPOSE 80 3000

CMD ["bundle", "exec", "rails", "server"]