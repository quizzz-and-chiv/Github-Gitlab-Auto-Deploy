FROM alpine:3.11.6

RUN apk --update add python3 openssh-client && pip3 install --upgrade pip

RUN mkdir $HOME/.ssh && chmod 600 $HOME/.ssh
# COPY deploy_rsa /root/.ssh/id_rsa

ENTRYPOINT ["/env/bin/python", "-u", "GitAutoDeploy.py", "--ssh-keyscan"]
