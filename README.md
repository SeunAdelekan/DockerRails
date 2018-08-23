# DockerRails
[![](https://images.microbadger.com/badges/version/iyanu/rails.svg)](https://microbadger.com/images/iyanu/rails "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/license/iyanu/rails.svg)](https://microbadger.com/images/iyanu/rails "Get your own license badge on microbadger.com")

A benevolent [Docker](http://docker.com/) image for [Ruby on Rails](https://rubyonrails.org). Along with Rails, this image comes bundles with common tools and utilities used in Rails applications such as:
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

**NOTE**: DockerRails installs Rails 5.2.1 by default. To specify the rails version to be installed with your image pass a `rails_version` build argument to the `docker build` command as shown below:

```bash
docker build -t awesome-app . --build-arg rails_version=<version>
```

After building an image, create and run a container with the built image:

```bash
docker run -p 80:3000 awesome-app
```

A container for your application will be created.

### View Application
To view your application, open your browser of choice and point it to
http://localhost:80.

![alt_text](images/AwesomeApp.jpg?raw=true "")

Want to try out a quick test app? Try out the docker-rails-sample application [here](https://github.com/SeunAdelekan/docker-rails-sample)

## License
[MIT](LICENSE)

