FROM debian:11

ENV LANG C.UTF-8

RUN apt update && apt upgrade
RUN set -x && \
    apt install -y openrc \
                   libreswan \
                   xl2tpd \
                   ppp \
                   net-tools \
    && mkdir -p /var/run/pluto \
    && mkdir -p /var/run/xl2tpd \
    && touch /var/run/xl2tpd/l2tp-control

COPY ipsec.conf /etc/ipsec.conf
COPY ipsec.secrets /etc/ipsec.secrets
COPY xl2tpd.conf /etc/xl2tpd/xl2tpd.conf
COPY options.l2tpd.client /etc/ppp/options.l2tpd.client
COPY startup.sh /

CMD ["/startup.sh"]
