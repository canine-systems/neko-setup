#!/bin/bash

cd "$(dirname "$(readlink -f $0)")"

if [ ! -f neko.env ]; then
  echo "Please run"
  echo "    $ cp neko.env.dist neko.env"
  echo "then edit neko.env."
  exit 1
fi

source neko.env

cat docker-compose.yaml.template | sed "s/{{VIEW_PASSWORD}}/$VIEW_PASSWORD/" | sed "s/{{ADMIN_PASSWORD}}/$ADMIN_PASSWORD/" > docker-compose.yaml

docker-compose up --build "$@"
