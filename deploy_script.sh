REMOTE_SERVER=ubuntu@172.31.38.201
REMOTE_PATH=/home/ubuntu/nodejs2-Jenkins

ssh ubuntu@172.31.38.201 <<EOF
cd /home/ubuntu/nodejs2-Jenkins
rm -rf *
scp -r /var/lib/jenkins/workspace/nodeApp/* $REMOTE_SERVER:$REMOTE_PATH
npm install --production
pm2 restart ecosystem.config.js
exit
EOF