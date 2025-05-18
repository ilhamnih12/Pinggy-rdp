#!/bin/bash

echo "Starting X11 server..."
Xvfb :1 -screen 0 1024x768x16 &
export DISPLAY=:1

echo "Starting desktop..."
fluxbox &

echo "Starting VNC server..."
x11vnc -display :1 -nopw -forever &

echo "Starting xrdp..."
/etc/init.d/xrdp start

echo "Starting Pinggy tunnel..."
ssh -o StrictHostKeyChecking=no -p 443 -R0:localhost:3389 tcp@free.pinggy.io

sleep infinity
