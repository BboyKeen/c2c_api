#!/bin/sh -e

cd /var/www
echo 'include Makefile' > config/envs/docker
env >> config/envs/docker
make -f config/envs/docker template
