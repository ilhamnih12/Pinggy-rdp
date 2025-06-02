#!/bin/bash

PASSWORD="08771661"

sudo apt update -y && sudo apt install -y xfce4 xfce4-goodies wget curl git xterm
echo "root:$PASSWORD" | sudo chpasswd

git clone https://github.com/LibVNC/kasmvnc.git 2>/dev/null
cd kasmvnc
./get.sh
./run.sh --desktop xfce --user root &

sleep 5
ssh -o StrictHostKeyChecking=no -R 80:localhost:6901 ssh.localhost.run
