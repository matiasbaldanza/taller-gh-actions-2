#!/bin/bash

DOMAIN="next-basic.cloudfor.fun"
EMAIL="matiasbaldanza.donweb@gmail.com"
WEBROOT="/var/www/certbot"

# Wait for nginx to start
sleep 5

# Check if the certificate already exists
if [ ! -f "/etc/letsencrypt/live/$DOMAIN/fullchain.pem" ]; then
  echo "No existing certificate found. Requesting a new one..."
  certbot certonly --non-interactive --agree-tos --email $EMAIL \
    --webroot -w $WEBROOT -d $DOMAIN
else
  echo "Certificate already exists. Checking for renewal..."
fi

# Renewal loop
while :; do
  echo "Checking for certificate renewal..."
  certbot renew --webroot -w "$WEBROOT"
  echo "Certbot renewal process completed."
  sleep 12h
done 