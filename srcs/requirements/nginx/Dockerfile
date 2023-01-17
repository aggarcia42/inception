FROM Debian:Buster
RUN apt-get update
RUN apt-get install -y nginx
RUN sudo docker run -d -p 80:80 -p 443:443 -v ./conf/nginx.conf nginx