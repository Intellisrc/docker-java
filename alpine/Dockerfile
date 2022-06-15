FROM adoptopenjdk/openjdk11:jre-11.0.11_9-alpine
# -------------- OS -----------------------
RUN { \
    echo 'http://ftp.tsukuba.wide.ad.jp/Linux/alpine/v3.14/main/' ; \
    echo 'http://ftp.tsukuba.wide.ad.jp/Linux/alpine/v3.14/community/' ; \
    } > /etc/apk/repositories
RUN apk update && \
    apk add bash tzdata gzip && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo "Asia/Tokyo" > /etc/timezone && \
    apk del tzdata

# --------------- SYSTEM ------------------
WORKDIR /var/java
RUN mkdir -p /var/java/log/
RUN ln -s /var/java/log/last-system.log /var/log/system.log
