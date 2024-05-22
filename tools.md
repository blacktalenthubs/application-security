version: '3.8'

services:
  dvwa:
    image: vulnerables/web-dvwa
    restart: always
    ports:
      - "8081:80"
    networks:
      - vuln-net
    volumes:
      - dvwa-data:/var/www/html/config

  juice-shop:
    image: bkimminich/juice-shop
    restart: always
    ports:
      - "3000:3000"
    networks:
      - vuln-net
    volumes:
      - juice-shop-data:/juice-shop

  mutillidae:
    image: citizenstig/nowasp
    restart: always
    ports:
      - "8082:80"
    networks:
      - vuln-net
    volumes:
      - mutillidae-data:/var/www/html

  webgoat:
    image: webgoat/webgoat-8.0
    restart: always
    ports:
      - "8083:8080"
    networks:
      - vuln-net
    volumes:
      - webgoat-data:/home/webgoat

  bwapp:
    image: raesene/bwapp
    restart: always
    ports:
      - "8084:80"
    networks:
      - vuln-net
    volumes:
      - bwapp-data:/var/www/html

  openvas:
    image: mikesplain/openvas
    restart: always
    ports:
      - "9392:9392"
    networks:
      - vuln-net
    volumes:
      - openvas-data:/var/lib/openvas/mgr

  nessus:
    image: tenableofficial/nessus
    restart: always
    ports:
      - "8834:8834"
    networks:
      - vuln-net
    volumes:
      - nessus-data:/opt/nessus

  metasploit:
    image: metasploitframework/metasploit-framework
    restart: always
    ports:
      - "4444:4444"
      - "55553:55553"
    networks:
      - vuln-net
    volumes:
      - metasploit-data:/metasploit

  sqlmap:
    image: paoloo/sqlmap
    restart: always
    entrypoint: /bin/sh -c "while true; do sleep 30; done;"
    networks:
      - vuln-net
    volumes:
      - sqlmap-data:/sqlmap

  john:
    image: kalilinux/kali-rolling
    restart: always
    command: ["tail", "-f", "/dev/null"]
    networks:
      - vuln-net
    volumes:
      - john-data:/john

  hydra:
    image: kalilinux/kali-rolling
    restart: always
    command: ["tail", "-f", "/dev/null"]
    networks:
      - vuln-net
    volumes:
      - hydra-data:/hydra

  wireshark:
    image: jess/wireshark
    restart: always
    ports:
      - "8087:8087"
    networks:
      - vuln-net
    volumes:
      - wireshark-data:/wireshark

  aircrack-ng:
    image: kalilinux/kali-rolling
    restart: always
    command: ["tail", "-f", "/dev/null"]
    networks:
      - vuln-net
    volumes:
      - aircrack-ng-data:/aircrack-ng

  tcpdump:
    image: kalilinux/kali-rolling
    restart: always
    command: ["tail", "-f", "/dev/null"]
    networks:
      - vuln-net
    volumes:
      - tcpdump-data:/tcpdump

networks:
  vuln-net:
    driver: bridge

volumes:
  dvwa-data:
  juice-shop-data:
  mutillidae-data:
  webgoat-data:
  bwapp-data:
  openvas-data:
  nessus-data:
  metasploit-data:
  sqlmap-data:
  john-data:
  hydra-data:
  wireshark-data:
  aircrack-ng-data:
  tcpdump-data: