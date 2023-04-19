#!/bin/bash
PROCESS_NAME="express_web_server"
ECOSYSTEM_FILE="/home/ubuntu/nodejs2-Jenkins"
cd /home/ubuntu/nodejs2-Jenkins
npm install --production
pm2 delete $PROCESS_NAME

while pm2 list $PROCESS_NAME|grep express_web_server|awk '{print $18}'; do
    sleep 1
done

pm2 start $ECOSYSTEM_FILE --name $PROCESS_NAME --wait-ready --listen-timeout 5000

