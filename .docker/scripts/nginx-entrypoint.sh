#!/bin/bash

# Create dummy self-signed certificate for initial startup
if [ ! -f /etc/nginx/certs/dummy-cert.pem ]; then
  echo "Creating dummy SSL certificate"
  mkdir -p /etc/nginx/certs
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/certs/dummy-key.pem \
    -out /etc/nginx/certs/dummy-cert.pem \
    -subj "/CN=next-basic.cloudfor.fun"
fi

# Start nginx
nginx -g "daemon off;" &
NGINX_PID=$!

# Watch for changes to SSL config
while true; do
  if [ -f /etc/letsencrypt/live/next-basic.cloudfor.fun/fullchain.pem ] && \
     [ -f /etc/letsencrypt/live/next-basic.cloudfor.fun/privkey.pem ] && \
     [ ! -f /etc/nginx/certs/live-ssl.conf ]; then
    echo "Real certificates detected, updating nginx configuration"
    cp /etc/nginx/certs/live-ssl.conf.disabled /etc/nginx/certs/live-ssl.conf
    nginx -s reload
  fi
  sleep 6h
  # Reload nginx periodically to pick up any certificate changes
  nginx -s reload
done 