# Opinionated base image.
# It adds a non-root user and few other things to the indifferent base image.
ARG TAG
ARG REPO
FROM docker.pkg.github.com/$REPO/git-auto-deploy:$TAG
LABEL maintainer="Chivorotkiv <git@chiv.info>"

ENV GAD_USER=gad GAD_UID=1001

RUN apk --no-cache --update add su-exec && \
    mkdir -p /home/$GAD_USER && \
    adduser -s /bin/sh -D -u $GAD_UID $GAD_USER && \
    chown -R $GAD_USER:$GAD_USER /home/$GAD_USER && \
    rm -rf /var/cache/apk/*

COPY init.sh ./init.sh
ENTRYPOINT ["./init.sh", "/usr/bin/python", "-m", "gitautodeploy"]
