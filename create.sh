#!/bin/bash

source digital_ocean.env
source neko.env

IMAGE="docker-20-04"

#COMMAND="#!/bin/bash\ngit clone https://github.com/canine-systems/neko-setup.git /root/neko-setup && echo 'NEKO_PASSWORD=\'$NEKO_PASSWORD\'' >> /root/neko-setup/neko.env && echo 'NEKO_PASSWORD_ADMIN=\'$NEKO_PASSWORD_ADMIN\'' >> /root/neko-setup/neko.env && /root/neko-setup/start.sh"
#COMMAND="$(printf "$COMMAND" | base64)"
#COMMAND="$(echo $COMMAND | sed 's/ /%20/g')"
COMMAND="$(cat user-data.yml | sed "s/{{NEKO_PASSWORD}}/$NEKO_PASSWORD/" | sed "s/{{NEKO_PASSWORD_ADMIN}}/$NEKO_PASSWORD_ADMIN/")"

curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" \
    -d '{"name":"neko","region":"nyc1","size":"s-4vcpu-8gb","image":"'$IMAGE'","user_data":"'"$COMMAND"'"}' \
    "https://api.digitalocean.com/v2/droplets"
