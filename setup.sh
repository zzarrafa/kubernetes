#/bin/sh
docker rmi -f $(docker images -qa)
 kubectl delete all --all 




function build_image {
		docker build -t $1 srcs/$1/  
		
}

function apply_yaml {
		kubectl apply -f srcs/$1/
}
# echo -e "I \033[0;31m love Stack Overflow \033[0m"
echo  " \033[1;33m *********MYSQL********** \033[0m"
build_image mysql
echo  " \033[1;33m *********WORDPRESS********** \033[0m"
build_image wordpress
echo  " \033[1;33m *********PHPMYADMIN********** \033[0m"
build_image phpmyadmin
echo  " \033[1;33m *********GRAFANA********** \033[0m"
build_image grafana
echo  " \033[1;33m *********NGINX********** \033[0m"
build_image nginx
echo  " \033[1;33m *********INFLUXDB********** \033[0m"
build_image influxdb
echo  " \033[1;33m *********FTPS********** \033[0m"
build_image ftps

echo  "\033[032;34m ********* apply yhe Loadbalancer********** \033[0m"


kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f srcs/Loadbalancer/metallb.yaml




apply_yaml mysql
apply_yaml wordpress
apply_yaml phpmyadmin
apply_yaml grafana
apply_yaml nginx
apply_yaml influxdb
apply_yaml ftps