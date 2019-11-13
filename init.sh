#!/bin/bash
echo "cala_syncthing is the syncthing config/log dir, is a local dir mount, is not checked into Git. Will be empty, syncthing will create a new config, a new instance."
mkdir cala_syncthing
docker build -t syncthing:0.4 .
docker create --name syncthing -p 8384:8384 -p 22000:22000 -p 21027:21027/udp --volume /Users/robert/Documents:/root/Documents --volume /Users/robert/docker/syncthing/cala_syncthing:/root/.config/syncthing syncthing:0.4
