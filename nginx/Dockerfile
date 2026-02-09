FROM nginx:1.27-alpine

# Install openssl for dummy cert generation
RUN apk add --no-cache openssl certbot

# Remove default config
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom config
COPY conf.d/default.conf /etc/nginx/conf.d/default.conf

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
