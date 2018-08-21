FROM ruby:2.5
MAINTAINER "Iyanu Adelekan <iyanuadelekan@gmail.com>"

RUN bundle config --global frozen 1

WORKDIR /app

COPY . /app

# Install Rails.
RUN gem install rails

# Installation of MySQL for use with Rails applications.
#RUN apt-get update && \
#    apt-get install mysql-server && \
#    mysql_secure_installation && \
#    mysql_install_db

# Installation of PostgreSQL for use with Rails applications.
RUN apt-get update -y
RUN apt-get install -y postgresql postgresql-contrib

# ImageMagick installation.
RUN apt-get install imagemagick -y

RUN rails new TestApp -d postgresql
RUN cd ./TestApp
RUN ls

EXPOSE 80 81 3000

CMD cd ./TestApp && rails server