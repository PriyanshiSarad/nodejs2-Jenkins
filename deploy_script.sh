PROCESS_NAME="express_web_server"
ECOSYSTEM_FILE="/home/ubuntu/nodejs2-Jenkins/ecosystem.config.js"
pm2 delete $PROCESS_NAME
pm2 save --force
pm2 start $ECOSYSTEM_FILE --name $PROCESS_NAME
pm2 save --force