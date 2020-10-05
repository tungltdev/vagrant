echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null
# update server
apt-get update -y
apt-get upgrade -y
#LAMP
#apche server
apt-get install -y apache2
#mysql server
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
apt-get install -y mysql-server

#php
apt-get install -y software-properties-common
apt-add-repository ppa:ondrej/php
apt-get update -y
apt-get install -y php7.4 php-pear php7.4-curl php7.4-dev php7.4-gd php7.4-mbstring php7.4-zip php7.4-mysql php7.4-xml
#enable rewrite mode
a2enmode rewrite
service apache2 restart

#composer
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
