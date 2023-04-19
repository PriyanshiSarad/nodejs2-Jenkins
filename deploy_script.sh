#!/bin/bash
PROCESS_NAME="express_web_server"
ECOSYSTEM_FILE="/home/ubuntu/nodejs2-Jenkins"
cd /home/ubuntu/nodejs2-Jenkins
npm install --production
pm2 delete $PROCESS_NAME

while pm2 list|grep $PROCESS_NAME|awk '{print $18}'|grep -q 'online'; do
    sleep 1
done

pm2 start $ECOSYSTEM_FILE --name $PROCESS_NAME --wait-ready --listen-timeout 5000

