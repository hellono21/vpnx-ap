FROM alpine:edge

RUN echo "http://mirrors.ustc.edu.cn/alpine/edge/main" >/etc/apk/repositories \
 && apk add --no-cache \
    bash iptables \
    tcpdump wget curl bind-tools \
 && mv /usr/sbin/tcpdump /usr/bin/tcpdump \
 && ln -s /usr/bin/tcpdump /usr/sbin/tcpdump

COPY rootfs /

EXPOSE 443/udp

#ENTRYPOINT [ "/init" ]
CMD ["/opt/udp2raw/entry.sh"]
