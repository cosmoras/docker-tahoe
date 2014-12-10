#!/bin/sh

if [ ! -f /root/.tahoe/tahoe.cfg ]; then
  echo "No tahoe.cfg. Building it."
  cd /root/.tahoe
  wget --no-check-certificate https://raw.githubusercontent.com/maccam912/docker-tahoe/master/tahoe1
  wget --no-check-certificate https://raw.githubusercontent.com/maccam912/docker-tahoe/master/tahoe2
  cat ./tahoe1 >> tahoe.cfg
  echo "nickname = "$(< /dev/urandom tr -dc A-Za-z | head -c${1:-32};echo;) >> tahoe.cfg
  echo "tub.location = "$(curl -s icanhazip.com) >> tahoe.cfg
  cat ./tahoe2 >> tahoe.cfg
  rm tahoe1
  rm tahoe2
fi

/allmydata-1.10.0/bin/tahoe restart