#!/bin/bash

# create config file
readonly env_vars=$({
    echo '$$SERVER_HOSTNAME'
    echo '$$SERVER_PORT'
} | tr '\n' ' ')
cat /etc/nginx/template/default.template | envsubst "${env_vars}" > /etc/nginx/conf.d/default.conf

is_running=1

handler(){
    echo sigterm accepted

    is_running=0
}
trap handler 1 2 3 15

# start programs
echo "[nginx]" $(date "+%Y/%m/%d-%H:%M:%S") start
/usr/sbin/nginx

while [ ${is_running} -eq 1 ]; do
    sleep 1
done
