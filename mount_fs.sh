#!/usr/bin/env bash

FSIMG=${FSIMG:-fs.img}
FSIMG_PATH="/vagrant/${FSIMG}"
LOCAL_FSIMG_PATH="${HOME}/${FSIMG}"
MOUNT_POINT=${MOUNT_POINT:-"/mnt/fsimg"}

function err {
 echo -e "\033[91m$1\033[0m"
}

function info {
 echo -e "\033[92m$1\033[0m"
}

if [ ! -f ${LOCAL_FSIMG_PATH} ]; then
  if [ ! -f ${FSIMG_PATH} ]; then
    err "The image file [${FSIMG}] is missing in the Vagrantfile directory"
    exit 1
  fi
  # Copy the image in order to avoid weird behaviors used in conjunction with nfs
  cp -f ${FSIMG_PATH} ${LOCAL_FSIMG_PATH}
fi

if [ -d ${MOUNT_POINT} ]; then
  sudo umount ${MOUNT_POINT} >/dev/null 2>&1
else
  sudo mkdir -p ${MOUNT_POINT}
fi
sudo mount -o loop,rw ${LOCAL_FSIMG_PATH} ${MOUNT_POINT}

# take effect only when 'source'd
cd ${MOUNT_POINT}

info "The image file [${FSIMG}] is mounted on ${MOUNT_POINT}!"
