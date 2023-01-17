FROM alpine:latest

RUN apk update && apk add nginx openssl

RUN openssl req -x509 -nodes -newkey rsa:4096 -keyout /etc/ssl/private/ssl-cert.key -out /etc/ssl/certs/ssl-cert.pem -days 365 -subj "/C=ES/ST=Madrid/L=Madrid/O=42/CN=intra.42.fr"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ssl-cert.pem /etc/ssl/certs/ssl-cert.pem
COPY ssl-cert.key /etc/ssl/private/ssl-cert.key

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]