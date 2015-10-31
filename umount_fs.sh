#!/usr/bin/env bash

FSIMG=${FSIMG:-fs.img}
FSIMG_PATH="/vagrant/${FSIMG}"
LOCAL_FSIMG_PATH="${HOME}/${FSIMG}"
MOUNT_POINT=${MOUNT_POINT:-"/mnt/fsimg"}

function info {
 echo -e "\033[92m$1\e[0m"
}

cd ~

if [ -d ${MOUNT_POINT} ]; then
  sudo umount ${MOUNT_POINT} >/dev/null 2>&1
else
  sudo rm -fr ${MOUNT_POINT}
fi

if [ ! -f ${LOCAL_FSIMG_PATH} ]; then
  err "The image file [${FSIMG}] is missing in the home directory"
  exit 1
fi

cp -f ${LOCAL_FSIMG_PATH} ${FSIMG_PATH}
[ "$(ls -A ${MOUNT_POINT})" ] || sudo rmdir ${MOUNT_POINT}

info "The image file [${FSIMG}] is unounted!"
