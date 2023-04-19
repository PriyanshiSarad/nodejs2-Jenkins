PROCESS_NAME="express_web_server"
ECOSYSTEM_FILE="/home/ubuntu/nodejs2-Jenkins"
cd /home/ubuntu/nodejs2-Jenkins
npm install --production
pm2 delete $PROCESS_NAME
while pm2 describe $PROCESS_NAME | grep -q "online"; do
  sleep 1
done
pm2 start $ECOSYSTEM_FILE --name $PROCESS_NAME
while ! pm2 describe $processName | grep -q "online"; do
  sleep 1
done
pm2 status $PROCESS_NAME
