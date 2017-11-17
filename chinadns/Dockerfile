FROM alpine:edge

RUN echo "http://mirrors.ustc.edu.cn/alpine/edge/main" >/etc/apk/repositories \
 && apk add --no-cache bash iptables iproute2 ipset \
    tcpdump wget unbound bind-tools \
 && mv /usr/sbin/tcpdump /usr/bin/tcpdump \
 && ln -s /usr/bin/tcpdump /usr/sbin/tcpdump

COPY rootfs /

EXPOSE 53/udp

ENTRYPOINT [ "/init" ]
#CMD ["/opt/xtun/entry.sh"]
