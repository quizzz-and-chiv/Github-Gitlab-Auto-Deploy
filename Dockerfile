FROM alpine:3.11.6

RUN apk --update add python3 && pip3 install --upgrade pip
#     apt-get -y install openssh-client
COPY requirements.txt .
RUN pip3 install -r requirements.txt
ENTRYPOINT ["/env/bin/python", "-u", "GitAutoDeploy.py", "--ssh-keyscan"]

ONBUILD ARG UID
ONBUILD ARG GID
ONBUILD RUN addgroup -S gad -g $GID && adduser -S gad -G gad -u $UID && \
    mkdir -p /home/gad && \
    chown gad:gad -R /home/gad
ONBUILD USER gad
ONBUILD WORKDIR /home/gad
ONBUILD RUN mkdir $HOME/.ssh && chmod 600 $HOME/.ssh
# COPY deploy_rsa /root/.ssh/id_rsa
