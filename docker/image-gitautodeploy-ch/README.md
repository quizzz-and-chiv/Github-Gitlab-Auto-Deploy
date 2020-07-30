# Image "gitautodeploy-ch"

Opinionated base image. It adds a few things to the indifferent base image:

+ Overrides ENTRYPOINT /app/init.sh
+ Enforces to run with init system
+ Adds the user `gad` (uid=1001)
+ Container command runs under `gad` user with uid $GAD_UID (default 1001).
+ It enforces non-root execution of the command.
+ Optionally runs /home/gad/init.sh
+ Packages su-exec, dumb-init pre-installed

This approach is based on https://github.com/umputun/baseimage/tree/master/base.alpine

The image:
- doesn't propose default config.json, SSL keys, certs etc.
- doesn't expose any port because the port should match to what is configured in config.json

Possible usage can look like a child image with following Dockerfile:

    FROM docker.pkg.github.com/evoja/docker-git-auto-deploy/gitautodeploy-ch:dv0.17
    COPY config.json .
    EXPOSE 8080
    CMD ["--ssh-keyscan"]

That runs as:

    docker build -t the-example .
    docker run --rm -p 8080:8080 the-example
