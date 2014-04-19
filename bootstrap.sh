#add 512Mb of swap
echo '--- adding swap space ---\n'
dd if=/dev/zero of=/extraswap bs=1M count=512
mkswap /extraswap
echo '/extraswap         none            swap    sw                0       0' >> /etc/fstab
swapon -a

#install dokku 2.3
echo '--- installing dokku ---\n'
sudo apt-get update
sudo apt-get install linux-image-extra-`uname -r`
wget -qO- https://raw.github.com/progrium/dokku/v0.2.3/bootstrap.sh | sudo DOKKU_TAG=v0.2.3 bash

#install dokku plugins
echo '--- installing dokku plugins (domains and mariadb) ---\n'
cd /var/lib/dokku/plugins
git clone https://github.com/wmluke/dokku-domains-plugin.git domains-plugin
git clone https://github.com/statianzo/dokku-supervisord.git dokku-supervisord
git clone https://github.com/Kloadut/dokku-md-plugin mariadb
dokku plugins-install

echo '--- installation completed ---\n'
