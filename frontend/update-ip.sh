#!/bin/bash

API_URL="http://169.254.169.254/latest/meta-data"
IP_V4=$(curl -s $API_URL/public-ipv4)

sudo sed -i "s|http://__BACKEND_IP__:3000|http://$IP_V4:3000|g" /home/ubuntu/app/frontend/nginx.conf
sudo sed -i "s|http://localhost:3000|http://$IP_V4:3000|g" /home/ubuntu/app/frontend/index.html
sudo sed -i "s|http://<YOUR_BACKEND_URL>|http://$IP_V4:3000|g" /home/ubuntu/app/frontend/index.html
sudo sed -i "s|https://<YOUR_S3_BUCKET_NAME>.s3.amazonaws.com|https://tictactoe-profile-pictures-unique-name.s3.amazonaws.com|g" /home/ubuntu/app/frontend/index.html

echo "Updated IP address and S3 bucket name in index.html and nginx.conf to $IP_V4"
