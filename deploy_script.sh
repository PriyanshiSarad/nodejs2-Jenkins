REMOTE_SERVER=ubuntu@13.234.116.70
REMOTE_PATH=/home/ubuntu/nodejs2-Jenkins
LOCAL_PATH=${WORKSPACE}

ssh ubuntu@13.234.116.70 <<EOF
cd /home/ubuntu/nodejs2-Jenkins
rm -rf *
scp -r $LOCAL_PATH/* $REMOTE_SERVER:$REMOTE_PATH
npm install --production
pm2 restart ecosystem.config.js
exit
EOF