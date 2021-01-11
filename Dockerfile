FROM alpine:3.9
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
RUN mkdir /app
WORKDIR /app
RUN set -x \
    # Runtime dependencies.
 && apk add --no-cache \
        libcurl \
        libgcc \
        libstdc++ \
        openssl \
    # Build dependencies.
 && apk add --no-cache -t .build-deps \
        autoconf \
        automake \
        build-base \
        curl \
        curl-dev \
        git \
        openssl-dev \
 && wget http://ck.kolivas.org/apps/cgminer/cgminer-4.11.0.tar.bz2 \
 && tar jxvf cgminer-4.11.0.tar.bz2 \
 && cd  cgminer-4.10.0.tar.bz2 、
 && ./configure --prefix=/usr/local/cgminer --enable-opencl --enable-maintainer-mode --enable-scrypt --enable-cpumining 、
 && make \
 && make check \
 && make install \
 && ln -s /usr/local/cgminer/bin/cgminer /usr/bin \
 && vim /usr/local/cgminer/etc/cgminer.conf

CMD ["./cgminer ","--help"]
