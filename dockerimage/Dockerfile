FROM alpine:3.11.6

RUN apk --update add python3 && pip3 install --upgrade pip
#     apt-get -y install openssh-client # not sure if we need this
COPY requirements.txt .
RUN pip3 install -r requirements.txt

ONBUILD RUN mkdir $HOME/.ssh && chmod 600 $HOME/.ssh

ENTRYPOINT ["/env/bin/python", "-u", "GitAutoDeploy.py", "--ssh-keyscan"]
