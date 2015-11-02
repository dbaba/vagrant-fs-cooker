vagrant-fs-cooker
===

A file system (e.g. ext4) image cooking tool on Vagrant box.

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

## Revision History

* 1.0.0
  - Initial Release
