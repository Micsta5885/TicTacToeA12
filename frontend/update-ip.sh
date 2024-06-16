#!/bin/bash

API_URL="http://169.254.169.254/latest/meta-data"
IP_V4=$(curl -s $API_URL/public-ipv4)

sudo sed -i "s|http://__BACKEND_IP__:3000|http://$IP_V4:3000|g" /home/ubuntu/app/frontend/nginx.conf
sudo sed -i "s|http://localhost:3000|http://$IP_V4:3000|g" /home/ubuntu/app/frontend/index.html

echo "Updated IP address in index.html and nginx.conf to $IP_V4"
