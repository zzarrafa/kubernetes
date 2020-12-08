

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/ST=MA/L=bengrir/O=s1337/OU=zzarrafa/CN=kkk"
mkdir -p /var/ftp
adduser -D -h /var/ftp  zineb
echo "zineb:zineb" | chpasswd