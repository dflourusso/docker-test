[Docs](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux_atomic_host/7/html-single/getting_started_with_containers/index)


Register
```
subscription-manager register
```

Find valid RHEL pool ID
```
subscription-manager list --available
subscription-manager attach --pool=pool_id

subscription-manager repos --enable=rhel-7-server-rpms
subscription-manager repos --enable=rhel-7-server-extras-rpms
subscription-manager repos --enable=rhel-7-server-optional-rpms
```

Install docker
```
yum install docker device-mapper-libs device-mapper-event-libs
systemctl start docker.service
systemctl enable docker.service
systemctl status docker.service
sudo ln -s /usr/libexec/docker/docker-runc-current /usr/bin/docker-runc
sudo ln -s /usr/libexec/docker/docker-proxy-current /usr/bin/docker-proxy
systemctl restart docker.service
```

Install docker compose
[Docs](https://docs.docker.com/compose/install/)
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

Test
```
docker run alpine date
```

Liberar porta no redhat para docker-machine
```
firewall-cmd --zone=public --add-port=2376/tcp --permanent
firewall-cmd --add-port=2377/tcp --permanent
firewall-cmd --add-port=7946/tcp --permanent
firewall-cmd --add-port=7946/udp --permanent
firewall-cmd --add-port=4789/udp --permanent

sudo firewall-cmd --reload
```

Verificar se a porta foi liberada
```
firewall-cmd --list-all
```

Criar docker-machine
```
docker-machine create --driver generic --generic-ip-address=192.168.25.31  --generic-ssh-key ./id_rsa --generic-ssh-user root redhat
```