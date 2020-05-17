#!/bin/bash

docker-compose run --rm rails rails new $1
mv $1/* .
rm -r ./$1

