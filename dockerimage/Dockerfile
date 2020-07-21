FROM alpine:3.11.6

ENV \
    GAD_USER=gad               \
    GAD_UID=1001               \
    DOCKER_GID=999

RUN apk --no-cache --update add python3 && \
    pip3 install --upgrade pip && \
    mkdir -p /home/$GAD_USER && \
    adduser -s /bin/sh -D -u $GAD_UID $GAD_USER && \
    mkdir /home/$GAD_USER/.ssh && chmod 600 /home/$GAD_USER/.ssh && \
    chown -R $GAD_USER:$GAD_USER /home/$GAD_USER && \
    addgroup -g ${DOCKER_GID} docker && addgroup ${GAD_USER} docker && \
    rm -rf /var/cache/apk/*
#     apt-get -y install openssh-client # not sure if we need this
COPY requirements.txt .
RUN pip3 install -r requirements.txt

USER $GAD_USER
WORKDIR /home/$GAD_USER

ENTRYPOINT ["/env/bin/python", "-u", "GitAutoDeploy.py", "--ssh-keyscan"]
