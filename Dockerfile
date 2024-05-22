# Dockerfile
FROM kalilinux/kali-rolling

# Use HTTP for the repository to avoid certificate verification issues
RUN sed -i 's|https://http.kali.org/kali|http://http.kali.org/kali|g' /etc/apt/sources.list

# Disable APT HTTPS to avoid certificate verification issues
RUN echo 'Acquire::https::Verify-Peer "false";' > /etc/apt/apt.conf.d/99verify-peer.conf

# Update package lists and install essential packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates && \
    apt-get clean

# Install security tools in smaller batches to avoid issues
RUN apt-get update && apt-get install -y \
    nmap \
    curl \
    wget \
    netcat && \
    apt-get clean

RUN apt-get update && apt-get install -y \
    metasploit-framework \
    sqlmap \
    john \
    hydra && \
    apt-get clean

RUN apt-get update && apt-get install -y \
    wireshark \
    aircrack-ng \
    hashcat \
    nikto && \
    apt-get clean

RUN apt-get update && apt-get install -y \
    tshark \
    dnsutils \
    iputils-ping \
    traceroute \
    tcpdump \
    git \
    vim && \
    apt-get clean

# Create a new user with passwordless sudo
RUN useradd -m kali && echo "kali:kali" | chpasswd && adduser kali sudo

# Switch to the new user
USER kali
WORKDIR /home/kali

# Set up environment variables
ENV TERM xterm-256color

# Default command
CMD ["/bin/bash"]