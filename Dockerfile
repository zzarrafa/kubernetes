FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get -y install nginx
COPY start.sh ./
CMD bash start.sh && tail -f /dev/null
EXPOSE 80 443

#docker build .
#docker run -it -p 80:80 -p 443:443