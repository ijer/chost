chost
=======
A basic dokku installation that includes plugins to support :
 - multiple domains
 - mysql databases
 - supervisord to keep processes up

This was tested on Ubuntu 14.04 on Digital Ocean droplets with 512Mb of memory

Installation
```
wget -qO- https://raw.github.com/ijer/chost/master/bootstrap.sh | sudo bash
```

(optional) On OSX, add the entry to your hosts file
```
sudo echo 'XXX.XXX.X.XXX chost' >> /private/etc/hosts
```

Add users
```
cat ~/.ssh/id_rsa.pub | ssh root@chost "sudo sshcommand acl-add dokku chost"
```

Deploy projects
```
git remote remove chost
git remote add chost dokku@chost:appname
git push chost master
```

Set domains
```
ssh -t dokku@chost domains:set appname domain.com www.domain.com
```
