# Automation of Cloudera installation (SaltStack + Cloudera Manager tempate)

## Introduction

This document describes how to automate Cloudera installation.

## Servers preparation

### AWS ec2 instances
Create following type of servers:

 - **Salt Master** - server, which serve as main orchestration server. Use minimal configuration - t2.micro with AMI Linux. It is mandatory component.

  - **Master + Data Node** - Set of servers, which serve as master and data node. For example, m5.xlarge with CenOS. It depends on performed tasks and installed components
 

### Preparation of salt-master
Set appropriate hostnames for all servers. It must be hostname+domain. For example: salt-master.test

In addition add line "IP-ADDRESS-OF-SALTMASTER salt" to /etc/hosts.

This is manual operation, which must be executed on all servers. 
Use the following code:
```
TBD
```
 - download salt-stack scripts from git
```
sudo git clone https://github.com/vdovychenko/cloudera-deployment.git /srv
```

### Preparation of Cloudera servers

 - set hostname
 - add salt-master to /etc/hosts
 - disable SELunux
 - reboot

```
echo name-node.test | sudo tee /etc/hostname
echo '172.31.2.152 salt' | sudo tee --append /etc/hosts
sudo sed -i "s/SELINUX=.*/SELINUX=disabled/g" /etc/sysconfig/selinux
sudo sed -i "s/SELINUX=.*/SELINUX=disabled/g" /etc/selinux/config
sudo setenforce 0
sudo reboot
```
 - wait when all servers are up and running again
 - install salt minion
```
sudo yum install -y wget nano
sudo curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh
```

### Add salt minions to salt master
Run following command to salt-master and confirm with "Y"
```
sudo salt-key -A
```

## Manual Settings

 - set correct hostnames in ```sudo nano /srv/pillar/hosts/init.sls```
 - 

## Start cluster installation

```
sudo salt '*.test' state.apply
``` 