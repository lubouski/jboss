#!/bin/bash


mkdir /tmp/jdk
cp /vagrant/jboss-eap-5.1.2.zip .
cp /vagrant/jdk-6u45-linux-x64-rpm.bin .
mv jdk-6u45-linux-x64-rpm.bin /tmp/jdk/
rm -rf jdk-6u45-linux-x64-rpm.bin
yum install -y net-tools
yum install -y epel-release
yum install -y unzip
cd /tmp/jdk
chmod a+x jdk-6u45-linux-x64-rpm.bin
./jdk-6u45-linux-x64-rpm.bin
yum localinstall jdk-6u45-linux-amd64.rpm
cd /home/vagrant
unzip jboss-eap-5.1.2.zip
#instance 1
cd /home/vagrant/jboss-eap-5.1
cp -r jboss-as/ /opt/
cd /opt/
mv jboss-as jboss
#instance 2
#cd /home/vagrant/jboss-eap-5.1
#cp -r jboss-as/ /opt/
#cd /opt/
#mv jboss-as jboss2
#instance 1
cd /home/vagrant/jboss-eap-5.1/jboss-as/server
cp -r all/ /home/vagrant/
cd /home/vagrant
mv all node1
#instance 2
cd /home/vagrant/jboss-eap-5.1/jboss-as/server
cp -r all/ /home/vagrant/
cd /home/vagrant
mv all node2



sed -i 's/# admin=admin/admin=admin/' /home/vagrant/node1/conf/props/jmx-console-users.properties
sed -i 's/# admin=admin/admin=admin/' /home/vagrant/node2/conf/props/jmx-console-users.properties
#sed -i 's/8080/9090/' /home/vagrant/node2/deploy/jbossweb.sar/server.xml
#sed -i 's/8009/9091/' /home/vagrant/node2/deploy/jbossweb.sar/server.xml
#cp /vagrant/hsr-test.war /home/vagrant/custom/deploy/
#cd /home/vagrant/custom/deploy
#unzip hsr-test.war -d hsr-test2.war
#mr -f hsr-test.war
#mv hsr-test2.war hsr-test.war
 
#cp -r default/ custom
#/usr/java/jdk1.6.0_45/
#./run.sh -Djboss.server.config.url=file:/home/vagrant/custom/conf -Djboss.server.base.dir=/opt/jboss/jboss-as -Djboss.server.log.dir=/home/vagrant/custom/log -Djboss.server.temp.dir=/home/vagrant/custom/tmp -Djboss.server.data.dir=/home/vagrant/custom/data

#./shutdown.sh -s jnp://192.168.56.2:1099 --shutdown -u admin -p admin
#/usr/java/jdk1.6.0_45/bin/keytool -genkey -alias jbosskey -keypass changeit -keyalg RSA -keystore server.keystore

#-Djboss.server.config.url=file:/home/vagrant/custom/conf -Djboss.server.base.dir=/home/vagrant/custom -Djboss.home.dir=/opt/jboss -Djboss.server.base.url=file:/home/vagrant/custom

#JAVA_OPTS="$JAVA_OPTS -Djava.net.preferIPv4Stack=true -Djboss.server.config.url=file:/home/vagrant/custom/default/conf -Djboss.server.base.dir=/home/vagrant/custom -Djboss.home.dir=/opt/jboss -Djboss.server.base.url=file:/home/vagrant/custom"
#./run.sh -Djboss.server.config.url=file:/home/vagrant/custom/conf -Djboss.server.base.dir=/home/vagrant -Djboss.home.dir=/opt/jboss -Djboss.server.base.url=file:/home/vagrant -c custom
