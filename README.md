citiushost
=======
Install on Ubuntu 12.04
```
wget -qO- https://raw.github.com/ijer/citiushost/master/bootstrap.sh | sudo bash
```

Add users
```
cat ~/.ssh/id_rsa.pub | ssh root@XXX.XXX.X.XXX "sudo sshcommand acl-add dokku citius"
``