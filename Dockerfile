FROM ubuntu:20.04

RUN apt-get update && apt-get install -y bind9 bind9utils bind9-doc

RUN apt-get update && apt-get install -y bind9 bind9utils bind9-doc iproute2 net-tools 
RUN apt-get -y install systemd dnsutils
RUN apt-get install -y iputils-ping
RUN apt-get install -y nano

COPY named.conf /etc/bind/
COPY named.conf.options /etc/bind/
COPY named.conf.local /etc/bind/
COPY zones /etc/bind/zones/

EXPOSE 53/udp
EXPOSE 53/tcp

CMD ["named", "-g"]


