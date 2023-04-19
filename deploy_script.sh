PROCESS_NAME="express_web_server"
ECOSYSTEM_FILE="/home/ubuntu/nodejs2-Jenkins"
cd /home/ubuntu/nodejs2-Jenkins
npm install --production
pm2 delete $PROCESS_NAME
pm2 save --force
while pm2 list|grep $PROCESS_NAME|awk '{print $18}'|grep 'online'; do
    sleep 1
done
pm2 start $ECOSYSTEM_FILE --name $PROCESS_NAME
pm2 save --force
