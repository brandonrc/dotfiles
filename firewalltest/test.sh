killdock
docker network create --subnet=10.11.1.0/24 test1
docker network create --subnet=10.11.2.0/24 test2

#sudo iptables -I DOCKER-ISOLATION-STAGE-1 --protocol all --src 10.10.1.0/24 --dst 10.1.1.12 --jump ACCEPT
#sudo iptables -I DOCKER-ISOLATION-STAGE-1 --protocol all --src 10.1.1.12 --dst 10.10.1.0/24 --jump ACCEPT

sleep 1

docker run --net test1 -d -it --name test1 --user 0 -p 192.168.203.155:45645:6901 -e VNC_RESOLUTION=800x600 atr2600/zenmap-vnc-ubuntu
docker run --net test2 -d -it --name test2 --user 0 -p 192.168.203.155:45678:6901 -e VNC_RESOLUTION=800x600 -e VNC_PW=password atr2600/zenmap-vnc-ubuntu

#watch -n 0.5 docker container ls --all


docker run --net test2 -d -it --name test3 --user 0 -p 192.168.203.155:45679:6901 -e VNC_RESOLUTION=800x600 -e VNC_PW=password atr2600/zenmap-vnc-ubuntu