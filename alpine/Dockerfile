FROM intellisrc/alpine:3.21

ENV JAVA_VER=21
# -------------- OS -----------------------
COPY inputrc.patch /etc/inputrc.patch

RUN apk update && \
    apk add openjdk${JAVA_VER}-jre-headless logrotate && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*

COPY logrotate.conf /etc/logrotate.d/java
RUN chmod 644 /etc/logrotate.d/java

# --------------- SYSTEM ------------------
WORKDIR /var/java
RUN mkdir -p /var/java/log/
RUN ln -s /var/java/log/last-system.log /var/log/system.log
