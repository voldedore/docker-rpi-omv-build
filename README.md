# Dockerize OpenMediaVault for your Raspberry Pi 3

[![Build Status](https://travis-ci.org/voldedore/docker-rpi-omv-build.svg?branch=master)](https://travis-ci.org/voldedore/docker-rpi-omv-build)

Source build for docker image `voldedore/rpi-omv`

## Maintainer

Vinh VO <voldedore@gmail.com>

## Instruction

This image is built to be used along with Resin.io. For now it cannot be used as simple as run a docker  container by `docker run` command. Because the image itself does not expose any port while ResinIO does that for us.

Please refer to https://github.com/voldedore/docker-rpi-omv to know how to use it on your RPi3.

## Information

### Docker image

* Tested and run on Raspberry Pi 3. Other Pi can also be able to use this image as well, but I didn't test it. Any feedback would be very appreciated.
* Automatically build by awesome Travis CI, based on [this help](https://blog.hypriot.com/post/setup-simple-ci-pipeline-for-arm-images/) for ARM arch.
* Docker registry: docker.com

### OpenMediaVault

* Version Erasmus
* Has pre-installed omv-extras
* All other settings are default

## License

MIT License - Copyright (c) 2017 Vo The Vinh
