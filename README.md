vagrant-fs-cooker
===

A file system (e.g. ext4) image cooking tool on Vagrant box.

## Prerequisites

1. Vagrant 1.8.1+
1. VirtualBox 5+
1. Git
1. Internet Connection

## Installation

```bash
$ git clone https://github.com/dbaba/vagrant-fs-cooker.git
$ cd vagrant-fs-cooker
```

### Starting without Auto-Conf Script

```bash
$ vagrant up && vagrant ssh
```

### Starting with Auto-Conf Script

```bash
$ cp /path/to/your/auto_conf.sh .
$ vagrant up
```
The instance will be terminated automatically when the script finishes with exit code 0.

### Discarding VM

```bash
$ vagrant destroy -f
```

## Examples

 * [docker-edison-yocto](https://github.com/dbaba/docker-edison-yocto) ... A docker image building script to create a poky-yocto edison image

## Revision History

* 1.0.1
  - Fix an issue where setup.sh always ignored AUTO_CONF_SCRIPT

* 1.0.0
  - Initial Release
