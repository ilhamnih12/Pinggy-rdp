FROM ubuntu:22.04

RUN apt update && apt install -y \
    wget curl unzip sudo xvfb x11vnc fluxbox \
    wine64 xrdp git openssh-client

# Setup user
RUN useradd -m rdpuser && echo "rdpuser:rdppass" | chpasswd && adduser rdpuser sudo

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
