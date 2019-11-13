FROM ubuntu:latest    

WORKDIR /root

RUN apt update &&\
    apt -y install gnupg2 curl apt-transport-https vim &&\
    curl -s https://syncthing.net/release-key.txt | apt-key add - &&\
    echo "deb https://apt.syncthing.net/ syncthing release" > /etc/apt/sources.list.d/syncthing.list &&\
    apt-get update &&\
    apt-get -y install syncthing &&\
    mkdir -p ~/.config/syncthing

EXPOSE 8384/tcp 22000/tcp 21027/udp

ENTRYPOINT ["syncthing", "-no-browser", "-no-restart"]
