## Download the script

- curl -O https://raw.githubusercontent.com/diana-hui-yang/rman-cohesity/master/nfs/duplicate-ora-coh-nfs/linux/duplicate-ora-coh-nfs.bash
- curl -O https://raw.githubusercontent.com/diana-hui-yang/rman-cohesity/master/nfs/duplicate-ora-coh-nfs/sun/sun-duplicate-ora-coh-nfs.bash
- /opt/freeware/bin/curl -O https://raw.githubusercontent.com/diana-hui-yang/rman-cohesity/master/nfs/duplicate-ora-coh-nfs/aix/aix-duplicate-ora-coh-nfs.bash
- chmod 750 duplicate-ora-coh-nfs.bash
- chmod 750 sun-duplicate-ora-coh-nfs.bash
- chmod 750 aix-duplicate-ora-coh-nfs.bash

## Duplicate scripts Description
This bash script utilize RMAN duplicate command to duplicate (clone) a database from the backup taken by using backup-ora-coh-nfs.bash/backup-ora-coh-oim.bash on Linux ,sbackup-ora-coh-nfs.bash/sbackup-ora-coh-oim.bash on Solaris, or aix-backup-ora-coh-nfs.bash/aix-backup-ora-oim.bash on AIX. This duplicate bash script supports RMAN duplicate "SET" option before duplicate command. It does not support RMAN duplicate "SPFILE" option. Any "SPFILE" option can be set in init<database>.ora file first. 
 
