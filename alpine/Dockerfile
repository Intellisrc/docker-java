FROM adoptopenjdk/openjdk11:jre-11.0.11_9-alpine

ENV TZ="Asia/Tokyo"
ENV ALPINE="v3.14"
ENV CUSTOM_REP="http://ftp.tsukuba.wide.ad.jp/Linux/alpine"
# -------------- OS -----------------------
RUN { \
    echo "$CUSTOM_REP/$ALPINE/main/" ; \
    echo "$CUSTOM_REP/$ALPINE/community/" ; \
    echo "http://dl-cdn.alpinelinux.org/alpine/$ALPINE/main" ; \
    echo "http://dl-cdn.alpinelinux.org/alpine/$ALPINE/community" ; \
    } >/etc/apk/repositories

COPY inputrc.patch /etc/inputrc.patch

RUN apk update && \
    apk add bash tzdata gzip logrotate patch && \
    cp "/usr/share/zoneinfo/$TZ" /etc/localtime && \
    echo "$TZ" > /etc/timezone && \
    update-ca-certificates && \
    patch -u /etc/inputrc -i /etc/inputrc.patch && \
    rm /etc/inputrc.patch && \
    apk del patch && \
    rm -rf /var/cache/apk/*

RUN echo "alias l='ls -lh'" >> /root/.bashrc && \
    echo "alias ll='ls -lAh'" >> /root/.bashrc && \
    echo "alias vim='vi'" >> /root/.bashrc

COPY logrotate.conf /etc/logrotate.d/java
RUN chmod 644 /etc/logrotate.d/java

# --------------- SYSTEM ------------------
WORKDIR /var/java
RUN mkdir -p /var/java/log/
RUN ln -s /var/java/log/last-system.log /var/log/system.log
