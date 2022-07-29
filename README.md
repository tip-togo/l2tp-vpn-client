l2tp-ipsec-vpn-client
===

##Run
Setup environment variables for your credentials and config:

    export VPN_SERVER_IPV4='1.2.3.4'
    export VPN_PSK='my pre shared key'
    export VPN_USERNAME='myuser@myhost.com'
    export VPN_PASSWORD='mypass'

Run:

    docker run --rm -it --privileged --dns=8.8.8.8 \
               -e VPN_SERVER_IPV4 \
               -e VPN_PSK \
               -e VPN_USERNAME \
               -e VPN_PASSWORD \
                  <image>

## Route

    route add <vpn ip> gw 172.17.0.1 dev eth0
    route add default ppp0
    route del default gw 172.17.0.1 dev eth0
