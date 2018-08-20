yum install -y java-devel
yum install -y ntp
systemctl enable ntpd
systemctl start ntpd

/etc/sysconfig/network
NETWORKING=yes
HOSTNAME=host[1-3].localdomain

systemctl disable firewalld
service firewalld stop

sed -i.bak "/SELINUX/s/.*/SELINUX=disabled/" /etc/selinux/config

yum install -y ambari-agent
sed -i.bak "/hostname/s/.*/hostname=host1.localdomain/" /etc/ambari-agent/conf/ambari-agent.ini
ambari-agent start

yum install -y ambari-server
ambari-server setup -s
ambari-server start

curl  -u admin:admin -H "X-Requested-By: ambari" -X GET http://192.168.56.102:8080/api/v1/clusters/ambari1?format=
blueprint -o /tmp/ambari1_bp.json
curl -H "X-Requested-By: ambari" -X POST -u admin:admin -d @/tmp/ambari1_bp.json http://192.168.64.101:8080/api/v1/blueprints/ambari1_bp
curl -H "X-Requested-By: ambari" -X POST -u admin:admin -d @/vagrant/roles/blueprint/templates/cluster_template http://192.168.64.101:8080/api/v1/clusters/ambari1

curl -H "X-Requested-By: ambari" -X POST -u admin:admin -d @ambari1_bp.json http://192.168.56.102:8080/api/v1/blueprints/ambari1_bp
curl -H "X-Requested-By: ambari" -X POST -u admin:admin -d @cluster_template.json http://192.168.56.102:8080/api/v1/clusters/ambari2