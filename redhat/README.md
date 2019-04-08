[Docs](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux_atomic_host/7/html-single/getting_started_with_containers/index)


Register
```
subscription-manager register
```

Find valid RHEL pool ID
```
subscription-manager list --available
```

Attatch
```
subscription-manager attach --pool=pool_id
```

```
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
systemctl restart docker.service
```

Test
```
docker run alpine date
```

Liberar porta no redhat para docker-machine
```
sudo firewall-cmd --zone=public --add-port=2376/tcp --permanent
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