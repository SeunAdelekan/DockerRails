# DockerRails
A benevolent (Docker)[http://docker.com/] image for (Ruby on Rails)[https://rubyonrails.org]. Along with Rails, this image comes bundles with common tools and utilities used in Rails applications such as:
- MySQL
- PostgreSQL
- Node.js
- ImageMagick
- Redis

## Getting Started
Create a Rails application to be containerized:
```bash
rails new AwesomeApp 
```
Open your generated application's directory and run bundle:

```bash
cd ./AwesomeApp && bundle
```

### Create Docker Image
Having created an application to run, you'll need to create a docker image for it. Firstly create a Dockerfile as shown below:

```Dockerfile
FROM iyanu/rails:latest

LABEL maintainer="John Wick"
LABEL name="AwesomeApp Image"
LABEL description="An image for my awesome app."

WORKDIR /src
COPY . /src

RUN bundle install

EXPOSE 3000

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server"]
```

Now build your Docker image:

```bash
docker build -t awesome-app .
```

Create and run a container with your built image:

```bash
docker run -p 80:3000 awesome-app
```

A container for your application will be created.

### View Application
To view your application, open your browser of choice and point it to
http://localhost:80

![alt_text](images/AwesomeApp.jpg?raw=true "")

