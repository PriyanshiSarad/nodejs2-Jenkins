ssh ubuntu@172.31.38.201 <<EOF
cd /home/ubuntu/nodejs2-Jenkins
npm install --production
pm2 restart ecosystem.config.js
exit
EOF