FROM alpine:3.12.0

ENV GAD_USER=gad GAD_UID=1001

RUN apk --no-cache --update add \
        python2 dumb-init \
        ca-certificates git openssh-client && \
    python --version && which python && \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && pip install --upgrade pip && rm get-pip.py && \
    mkdir -p /home/$GAD_USER && \
    adduser -s /bin/sh -D -u $GAD_UID $GAD_USER && \
    mkdir /home/$GAD_USER/.ssh && chmod 500 /home/$GAD_USER/.ssh && \
    touch /home/$GAD_USER/.ssh/known_hosts && \
    chmod 600 /home/$GAD_USER/.ssh/known_hosts && \
    chown -R $GAD_USER:$GAD_USER /home/$GAD_USER && \
    rm -rf /var/cache/apk/*

COPY requirements.txt .
RUN pip install -r requirements.txt

USER $GAD_USER
WORKDIR /home/$GAD_USER
COPY gitautodeploy gitautodeploy

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/usr/bin/python", "-m", "gitautodeploy", "--config", "./config.json", "--ssh-keyscan"]
