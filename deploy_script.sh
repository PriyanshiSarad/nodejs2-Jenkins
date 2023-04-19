PROCESS_NAME="express_web_server"
ECOSYSTEM_FILE="/home/ubuntu/nodejs2-Jenkins"
cd /home/ubuntu/nodejs2-Jenkins
npm install --production
pm2 delete $PROCESS_NAME
