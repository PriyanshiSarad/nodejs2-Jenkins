ssh ubuntu@13.234.116.70 <<EOF
cd /home/ubuntu/nodejs2-Jenkins
git pull
npm install --production
pm2 restart all
exit
EOF