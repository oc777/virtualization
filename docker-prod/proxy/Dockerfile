FROM nginx:1.7

MAINTAINER oc222ba

# configs
RUN rm -v /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

# certificates
COPY ./sslcerts/cert.pem /etc/nginx/cert.pem
COPY ./sslcerts/key.pem /etc/nginx/key.pem

# Expose both the HTTP (80) and HTTPS (443) ports
EXPOSE 80 443

CMD ["nginx"]