# SoftEther VPN server
FROM ubuntu

# MAINTAINER Frank Rosquin <frank.rosquin@gmail.com>
# MAINTAINER Pooya Parsa<pooya@pi0.ir>

WORKDIR /usr/local/vpnserver
EXPOSE 443/tcp 992/tcp 1194/tcp 1194/udp 5555/tcp 500/udp 4500/udp
ENTRYPOINT ["/usr/local/vpnserver/entrypoint"]

RUN apt-get update && \
    apt-get -y -q install gcc make wget && \
    apt-get clean && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*

RUN     export VERSION=v4.22-9634-beta-2016.11.27 && \
        wget http://www.softether-download.com/files/softether/${VERSION}-tree\
        /Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver\
        -${VERSION}-linux-x64-64bit.tar.gz -O /tmp/softether-vpnserver.tar.gz &&\
        tar -xzvf /tmp/softether-vpnserver.tar.gz -C /usr/local/ &&\
        rm /tmp/softether-vpnserver.tar.gz &&\
        make i_read_and_agree_the_license_agreement &&\
        apt-get purge -y -q --auto-remove gcc make wget

COPY entrypoint /usr/local/vpnserver/entrypoint
