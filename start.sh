#!/bin/bash

cd "$(dirname "$(readlink -f $0)")"

docker-compose up --build
