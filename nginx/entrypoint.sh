#!/bin/sh

# Set domain
DOMAIN=${DOMAIN_NAME:-localhost}
EMAIL=${EMAIL:-admin@localhost}

# Check if certificates exist
if [ ! -f /etc/letsencrypt/live/$DOMAIN/fullchain.pem ]; then
    echo "Creating dummy certificate for $DOMAIN ..."
    mkdir -p /etc/letsencrypt/live/$DOMAIN
    openssl req -x509 -nodes -newkey rsa:4096 -days 1 \
        -keyout /etc/letsencrypt/live/$DOMAIN/privkey.pem \
        -out /etc/letsencrypt/live/$DOMAIN/fullchain.pem \
        -subj "/CN=$DOMAIN"
fi

# Apply domain name in nginx config
sed -i "s/example.com/$DOMAIN/g" /etc/nginx/conf.d/default.conf

# Start Nginx
exec nginx -g "daemon off;"
