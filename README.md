# DockerRails
A benevolent docker image for Ruby on Rails. Along with Rails, this image includes common tools and utilities required to get
Rails applications up and running such as:
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
cd ./AwesomeApp
bundle
```

### Create your docker image
Having created an application to run, you'll need to create a docker image  for it.
Firstly create a Dockerfile as shown below:

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

### Viewing Application
To view your application, open your browser of choice and point it to
http://localhost:80

