#!/usr/bin/dumb-init /bin/sh
set -e
uid=$(id -u)
echo "initializing as $(whoami) (${uid})"
if [[ ${uid} -eq 0 ]]; then
    # set UID for user gad
    if [[ "${GAD_UID}" -ne "1001" ]]; then
        echo "set custom GAD_UID=${GAD_UID}"
        sed -i "s/:1001:1001:/:${GAD_UID}:${GAD_UID}:/g" /etc/passwd
    else
        echo "custom GAD_UID not defined, using default uid=1001"
    fi
    chown -R gad:gad /app /home/gad
fi

if [[ -f "/home/gad/init.sh" ]]; then
    echo "execute /home/gad/init.sh"
    chmod +x /home/gad/init.sh
    /home/gad/init.sh
    if [[ "$?" -ne "0" ]]; then
      echo "/home/gad/init.sh failed"
      exit 1
    fi
fi

if [[ ${uid} -eq 0 ]]; then
    if [[ -d /home/gad/.ssh ]]; then
        chown -R gad:gad /home/gad/.ssh
    fi
fi

echo "execute \"$@\""
if [[ ${uid} -eq 0 ]]; then
   exec su-exec gad $@
else
   exec $@
fi
