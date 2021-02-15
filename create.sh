#!/bin/bash

source digital_ocean.env
source neko.env

IMAGE="docker-20-04"
SSH_KEYS=''

COMMAND="git clone https://github.com/canine-systems/neko-setup.git /root/neko-setup && echo 'NEKO_PASSWORD=\'$NEKO_PASSWORD\'' >> /root/neko-setup/neko.env && echo 'NEKO_PASSWORD_ADMIN=\'$NEKO_PASSWORD_ADMIN\'' >> /root/neko-setup/neko.env && /root/neko-setup/start.sh"
COMMAND="$(echo $COMMAND | base64)"
#COMMAND="$(echo $COMMAND | sed 's/ /%20/g')"

curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" -d '{"name":"neko","region":"nyc1","size":"s-4vcpu-8gb","image":"'$IMAGE'","ssh_keys":['$SSH_KEYS'],"backups":false,"ipv6":false,"user_data":"'"$COMMAND"'","private_networking":null,"volumes": null,"tags":["neko"]}' "https://api.digitalocean.com/v2/droplets"
