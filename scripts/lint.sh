#!/bin/bash

docker-compose exec api make -f config/envs/docker-dev lint
