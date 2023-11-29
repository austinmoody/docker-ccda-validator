# docker-ccda-validator

CCDA Validator in a docker container

## What You'll need

- Docker
- A Reference CCDA Validator Service war file

## Basic Usage

### Clone The Repository

git clone this repo (and submodules! **VERY** important!)

```
git clone --recurse-submodules https://github.com/austinmoody/docker-ccda-validator.git
```

### Build the Docker Image

```
cd docker-ccda-validator
docker build -t docker-ccda-validator .
```
### Run the Docker Image in a Container

Run a Docker container using the built image.
```
docker run -d --rm \
-p 8080:8080 \
-v /Users/moodya/Dev/Fed/site/reference-ccda-validator/target:/usr/local/tomcat/webapps \
docker-ccda-validator \
/usr/local/tomcat/bin/catalina.sh run
```

_Notes_

- Remove the ```-d``` to run the container in the foreground.
- Remove the ```--rm``` to prevent the container from being removed once it is stopped.

### Use / Verify

Once up and running, try opening up any of the following URLS:

http://localhost:8080/referenceccdaservice/static/validationui.html
![validationui](https://i.imgur.com/DM3E6ny.png)

http://localhost:8080/referenceccdaservice/swagger-ui.html#/reference-ccda-validation-controller
![swagger-ui](https://i.imgur.com/1OdtDyg.png)

*Note:* Using localhost above assuming you are running on your local machine using he default Tomcat port.  Obviously update the hostname and port as necessary.

## Debug Usage

To be able to debug the running war, you'll need to start tomcat with jdpa as well as expose an extra port and configure a couple other settings.

The *Clone The Repository* and *Build the Docker Image* steps above will be the same.

However, when you start the Container there are a few more options to add:

- JPDA_ADDRESS & JPDA_TRANSPORT environment variables
  - ```-e JPDA_ADDRESS=8000```
  - ```-e JPDA_TRANSPORT=dt_socket```
- Publish the JDPA port 
  - ```-p 8000:8000```
- Start tomcat with jdpa
  - ```/usr/local/tomcat/bin/catalina.sh jpda run```

So now your _docker run_ command looks like:

```Bash
docker run -d --rm \
-e JPDA_ADDRESS=8000 \
-e JPDA_TRANSPORT=dt_socket \
-p 8080:8080 \
-p 8000:8000 \
-v /Users/moodya/Dev/Fed/site/reference-ccda-validator/target:/usr/local/tomcat/webapps \
docker-ccda-validator \
/usr/local/tomcat/bin/catalina.sh jpda run
```

Once this is running you can connect to port 8000 on the running container for remote debugging.

### Example Debug Setup

#### IntelliJ

Example _Run/Debug Configuration_ for IntelliJ:

![IntelliJ Remote Jvm Debug Configuration Example](docs/images/intellij-remote-debug-config.png)

Once configured, you will start the configuration in Debug mode.  You'll see a connection made in the console:

![IntelliJ Remote Debug Connect](docs/images/intellij-debug-connected.png)

Then set breakpoints as normal, and when you execute functionality on the running Docker container hosted validator they will be hit.

![IntelliJ Remote Debug Breakpoints](docs/images/intellij-debug-breakpoint.png)

#### Eclipse

TODO