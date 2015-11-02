#!/usr/bin/env bash

AUTO_CONF_SCRIPT_PATH="/vagrant/${AUTO_CONF_SCRIPT:-auto_conf.sh}"

function err {
 echo -e "\033[91m$1\033[0m"
}

function info {
 echo -e "\033[92m$1\033[0m"
}

for f in mount_fs umount_fs
do
  rm -f /home/vagrant/${f}.sh
  ln -sn /vagrant/${f}.sh /home/vagrant/${f}.sh
done

if [ -f ${AUTO_CONF_SCRIPT_PATH} ]; then
  rm -f "${AUTO_CONF_SCRIPT_PATH}.exit"
  info "::: Starting the automatic configuration script.... :::"
  . /home/vagrant/mount_fs.sh
  RET=$?
  if [ "${RET}" != "0" ]; then
    err "Failed to set up"
    exit 1
  fi
  if [ ! -x ${AUTO_CONF_SCRIPT_PATH} ]; then
    chmod +x ${AUTO_CONF_SCRIPT_PATH}
  fi
  . ${AUTO_CONF_SCRIPT_PATH}
  RET=$?
  . /home/vagrant/umount_fs.sh
  info "::: The automatic configuration script is terminated :::"
  if [ "${RET}" == "0" ]; then
    echo "0" > "${AUTO_CONF_SCRIPT_PATH}.exit"
    info "HALTING..."
    sudo shutdown -h now
    exit 1
  fi
fi
