# Borg backup automation

Backup krusty onto the NAS drive attached to the router. This drive is mounted using sshfs with this fstab entry:

```
sshfs#root@192.168.1.1:/mnt/sda1/ /mnt/NAS_drive/ fuse auto,user,_netdev,reconnect,uid=1000,gid=1000,IdentityFile=/home/mike/.ssh/id_rsa_nas,idmap=user,allow_other
```

## Setup

1. Initialize a repository

    ```
    sudo borg init --encryption=none /mnt/NAS_drive/krusty_backup/
    ```

2. Add cronjob (as root) to run this script

    ```
    30 03 1 * * /usr/bin/bash /home/mike/compile/linux-automation/borg_backup/borg_backup.sh
    ```
