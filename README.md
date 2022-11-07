# GPIO Docker
This project aims to test the gpio functionality in a raspberry pi with Docker.  
Gpio are mapped into a docker container.

## Pre-check
Copy ***.env*** file into ***.env.local*** and fill it with right values.  
Create a ***.docker_pass** file with docker personal toker inside.

## Build and push docker image
To build and push docker image use the command: 
```
$ ./build-push.sh
```

## Run application
In the raspberry pi (with docker) use the following command:
```
$ docker run --privileged 7exx:raspi-led-blink
```
Or for a more recent version
```
$ docker run --device /dev/gpiomem 7exx:raspi-led-blink
```