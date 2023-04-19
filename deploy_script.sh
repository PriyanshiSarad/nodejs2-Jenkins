ssh ubuntu@172.31.38.201 <<EOF
PROCESS_NAME="express_web_server"
ECOSYSTEM_FILE="/home/ubuntu/nodejs2-Jenkins"
cd /home/ubuntu/nodejs2-Jenkins
npm install --production
pm2 delete $PROCESS_NAME
while pm2 list|grep $PROCESS_NAME|awk '{print $18}'|grep 'online'; do
    sleep 1
done
pm2 start $ECOSYSTEM_FILE --name $PROCESS_NAME --wait-ready --listen-timeout 5000
exit
EOF
