#!/bin/bash

# Create certs directory
mkdir -p /etc/nginx/certs

# Create dummy self-signed certificate for initial startup
if [ ! -f /etc/nginx/certs/dummy-cert.pem ]; then
  echo "Creating dummy SSL certificate"
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/certs/dummy-key.pem \
    -out /etc/nginx/certs/dummy-cert.pem \
    -subj "/CN=next-basic.cloudfor.fun"
fi

# Create a dynamic config file instead of copying the template
cat > /etc/nginx/certs/live-ssl.conf.disabled << EOF
# This is a placeholder config
EOF

# Start nginx
nginx -g "daemon off;" &
NGINX_PID=$!

# Watch for changes to SSL config
while true; do
  if [ -f /etc/letsencrypt/live/next-basic.cloudfor.fun/fullchain.pem ] && \
     [ -f /etc/letsencrypt/live/next-basic.cloudfor.fun/privkey.pem ]; then
    echo "Real certificates detected, updating nginx configuration"
    cat > /etc/nginx/certs/live-ssl.conf << EOF
ssl_certificate /etc/letsencrypt/live/next-basic.cloudfor.fun/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/next-basic.cloudfor.fun/privkey.pem;
EOF
    nginx -s reload
  fi
  sleep 6h
  # Reload nginx periodically to pick up any certificate changes
  nginx -s reload
done 