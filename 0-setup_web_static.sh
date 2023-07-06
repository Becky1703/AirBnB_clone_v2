#!/usr/bin/env bash
#Bash script to set up a web server for deployment
sudo apt -y update
sudo apt install -y nginx

mkdir -p /data/
mkdir -p /data/web_static/
mkdir -p /data/web_static/releases/
mkdir -p /data/web_static/shared/
mkdir -p /data/web_static/releases/test/
touch /data/web_static/releases/test/index.html
printf %s "
<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>
" > /data/web_static/releases/test/index.html

sudo ln -sf /data/web_static/releases/test  /data/web_static/current

chown -R ubuntu:ubuntu /data/

printf %s "server {
        listen 80;
        listen [::]:80;
        add_header X-Served-By $HOSTNAME;
        
        root /var/www/html;
        index index.html index.htm;

        location /redirect_me {
            return 301 https://youtube.com;
        }
   
        location /hbnb_static/ {
            alias /data/web_static/current/;
            index index.html index.htm;
        }
       
        error_page 404 /custom_404.html;
        location /404 {
          root /var/www/html;
          internal;
        }
}" > default


sudo service nginx restart

