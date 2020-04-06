#!/bin/bash

cd "$(dirname "$(readlink -f $0)")"

if [ ! -f neko.env ]; then
  echo "Please run"
  echo "    $ cp neko.env.dist neko.env"
  echo "then edit neko.env."
  exit 1
fi

source neko.env

cat docker-compose.yaml.template | sed "s/{{NEKO_PASSWORD}}/$NEKO_PASSWORD/" | sed "s/{{NEKO_PASSWORD_ADMIN}}/$NEKO_PASSWORD_ADMIN/" > docker-compose.yaml

docker-compose up --build "$@"
