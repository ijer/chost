#install dokku
wget -qO- https://raw.github.com/progrium/dokku/v0.2.2/bootstrap.sh | sudo DOKKU_TAG=v0.2.2 bash
echo 'dokku installed\n'

#install dokku plugins
cd /var/lib/dokku/plugins
git clone https://github.com/wmluke/dokku-domains-plugin.git domains-plugin
git clone https://github.com/hughfletcher/dokku-mysql-plugin mysql
chmod +x mysql/install mysql/commands mysql/pre-release
dokku plugins-install
echo 'domains and mysql plugins installed\n'

#add swap if the amount of memory is below 1Go
dd if=/dev/zero of=/extraswap bs=1M count=512
mkswap /extraswap
echo '/extraswap         none            swap    sw                0       0' >> /etc/fstab
swapon -a
echo 'swap space added\n'

echo 'installation completed\n'