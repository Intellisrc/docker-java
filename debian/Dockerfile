FROM adoptopenjdk/openjdk11:jre-11.0.11_9-debian

ENV TZ="Asia/Tokyo"
RUN apt update && \
    apt install -y ca-certificates tzdata && \
    update-ca-certificates \
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# --------------- SYSTEM ------------------
WORKDIR /var/java
RUN mkdir -p /var/java/log/
RUN ln -s /var/java/log/last-system.log /var/log/system.log
