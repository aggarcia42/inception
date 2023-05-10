FROM debian:buster

RUN apt-get update && apt-get install nginx openssl -y
#Since the cert is fake the domain doesnt matter
RUN openssl req -x509 -nodes -newkey rsa:4096 -keyout /etc/ssl/private/ssl-cert.key -out /etc/ssl/certs/ssl-cert.pem -days 365 -subj "/C=ES/ST=Madrid/L=Madrid/O=42/CN=intra.42.fr" -addtext "subjectAltName=DNS:aggarcia.42.fr"

RUN rm -rf /etc/nginx/sites-enabled/*

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf

CMD ["nginx", "-g", "daemon off;"]