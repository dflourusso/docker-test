```
docker-machine create --driver virtualbox node1
eval $(docker-machine env node1)
docker swarm init --listen-addr $(docker-machine ip node1) --advertise-addr $(docker-machine ip node1)
docker network create --scope swarm --driver=overlay traefik-public
docker stack deploy -c docker-compose.yml daniel


docker service create -d -p 80:8000 --name whoami jwilder/whoami
docker service scale whoami=5
```