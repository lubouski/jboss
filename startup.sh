#!/bin/bash

#this vm is provisioned with net-tools
ip=$(ifconfig enp0s8 | awk 'FNR == 2 {print$2}')


nohup /opt/jboss/bin/run.sh -Djboss.server.config.url=file:/home/vagrant/node1/conf -Djboss.server.base.dir=/home/vagrant -Djboss.home.dir=/opt/jboss -Djboss.server.base.url=file:/home/vagrant -c node1 -b $ip -Djboss.service.binding.set=ports-01  2>&1 > /home/vagrant/output-"$(date "+%Y-%m-%d")".log &
