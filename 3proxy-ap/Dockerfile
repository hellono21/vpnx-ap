FROM alpine:edge

ENV PROXY_VER 0.8.11

RUN echo "http://mirrors.ustc.edu.cn/alpine/edge/main" >/etc/apk/repositories \
 && apk add --no-cache --virtual .build-deps \ 
    gcc \
    linux-headers \
    make \
    musl-dev \
    tar \
    openssl \
 && apk add --no-cache \
    bash iptables iproute2 ipset \
    tcpdump wget curl bind-tools \
 && mv /usr/sbin/tcpdump /usr/bin/tcpdump \
 && ln -s /usr/bin/tcpdump /usr/sbin/tcpdump \
 && wget https://github.com/z3APA3A/3proxy/archive/${PROXY_VER}.tar.gz \
 && tar xzfv ${PROXY_VER}.tar.gz -C /tmp \
 && echo '#define ANONYMOUS 1' >> /tmp/3proxy-${PROXY_VER}/src/proxy.h \
 && make -C /tmp/3proxy-${PROXY_VER} -f Makefile.Linux \
 && make -C /tmp/3proxy-${PROXY_VER} -f Makefile.Linux install \
 && rm ${PROXY_VER}.tar.gz \
 && ln -sf /dev/stdout /var/log/3proxy.log \
 && apk del .build-deps

COPY rootfs /

EXPOSE 3128/tcp

ENTRYPOINT [ "/init" ]
#CMD ["/opt/xtun/entry.sh"]
