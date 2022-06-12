FROM eclipse-temurin:17-jre-alpine

# default versions
# "latest" automatically updates when a new version is released
# set a version number, i.e ""
ENV VELOCITY_VERSION="3.1.1"
ENV VELOCITY_BUILD="latest"
ENV GEYSER_BUILD="latest"
ENV FLOODGATE_BUILD="latest"

ENV VERSION_FILE=/data/versions.txt

# JVM Options
ENV JAVA_MEMORY="512M"
ENV JAVA_FLAGS="-XX:+UseStringDeduplication -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch"

# placeholder envs for version tracking
ENV CURRENT_VELOCITY_BUILD=0
ENV CURRENT_GEYSER_BUILD=0
ENV CURRENT_FLOODGATE_BUILD=0

WORKDIR /data

COPY scripts/ /usr/local/bin/
RUN chmod 755 /usr/local/bin/*

# jq and curl are needed for downloading files
RUN apk add jq curl

RUN addgroup -g 1000 -S velocity && \
    adduser -u 1000 -S velocity && \
    chown velocity:velocity /data

USER velocity

VOLUME /data

EXPOSE 25577

ENTRYPOINT start-velocity
