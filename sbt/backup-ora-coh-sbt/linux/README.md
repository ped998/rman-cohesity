## Download the script
- curl -O https://raw.githubusercontent.com/diana-hui-yang/rman-cohesity/master/sbt/backup-ora-coh-sbt/linux/backup-ora-coh-sbt.bash
- chmod 750 backup-ora-coh-sbt.bash

## Description
When run the script without any options, it displays the script usage

Required parameters

- -h : host (scanname is required if it is RAC. optional if it is standalone.)
- -o : ORACLE_DB_NAME (Need to have an entry of this database in /etc/oratab. If it is RAC, it is db_unique_name)
- -y : Cohesity Cluster DNS name
- -a : archivelog only backup (yes means archivelog backup only, no means database backup plus archivelog backup, default is no)
- -i : If not archivelog only backup, it is full or incremental backup. 0 is full backup, and 1 is cumulative incremental backup
- -v : Cohesity View that is configured to be the target for Oracle backup
- -u : Retention time (days to retain the backups, expired file are deleted by SBT. It is only required if -e option is not used)
- -e : Retention time (days to retain the backups, expired file are deleted by Oracle. Apply only after uncomment "Delete obsolete" in this script. It is only required if -u option is not used)

Optional parameters
- -r : Target connection (example: "dbuser/dbpass@target connection string as sysbackup", optional if it is local backup)
- -c : Catalog connection (example: "dbuser/dbpass@catalog connection string", optional)
- -n : RAC nodes connectons strings that will be used to do backup (example: "rac1-node connection string,ora2-node connection string")
- -p : number of channels (Optional, default is 4)
- -f : The file lists Cohesity Cluster VIPs (default name is vip-list and default directory is config)
- -s : Cohesity SBT library name including directoy or just directory (default name is libsbt_6_and_7_linux-x86_64.so, default directory is lib)
- -l : Archive logs retain days (days to retain the local archivelogs before deleting them. default is 1 day, "no" means not deleting local archivelogs on disk)
- -m : ORACLE_HOME (provide ORACLE_HOME if the database is not in /etc/oratab. Otherwise, it is optional.)
- -z : section size in GB (Optional, default is no section size)
- -t : RMAN TAG
- -g : yes means encryption-in-flight is used. The default is no
- -j : encryption certificate file directory, default directory is lib
- -x : yes means gRPC is used. no means SunRPC is used. The default is yes
- -d : yes means source side dedup is used. The default is yes
- -w : yes means print rman backup scripts only. The RMAN script is not executed

## Backup to Cohesity view "orasbt1" exmaple

### Full backup example when sbt library is in lib directory under the script directory
./backup-ora-coh-sbt.bash -o orcl -i 0 -y cohesity_name -v orasbt1 -p 4 -e 30
### Cumulative backup example when sbt library is in directory /u01/app/cohesity
./backup-ora-coh-sbt.bash -o orcl -i 1 -y cohesity_name -v orasbt1 -p 3 -e 30 -s /u01/app/cohesity
### Archive log backup example when sbt library is in lib directory under the script directory
./backup-ora-coh-sbt.bash -o orcl -a yes -y cohesity_name -v orasbt1 -p 2 -e 30

## Backup to directory "orawest/orcl" under view "orasbt1" exmaple
The directory needs to created first by mounting the view "orasbt1" on a Unix server through nfs. The following example uses the directory "orawest/orcl" (host is orawest, the database is orcl) under view "orasbt1". 

### Full backup example when sbt library is in lib directory under the script directory
./backup-ora-coh-sbt.bash -o orcl -i 0 -y cohesity_name -v orasbt1/orawest/orcl -p 4 -e 30
### Cumulative backup example when sbt library is in lib directory under the script directory
./backup-ora-coh-sbt.bash -o orcl -i 1 -y cohesity_name -v orasbt1/orawest/orcl -p 3 -e 30
### Archive log backup example when sbt library is in directory /u01/app/cohesity
./backup-ora-coh-sbt.bash -o orcl -a yes -y cohesity_name -v orasbt1/orawest/orcl -p 2 -e 30 -s /u01/app/cohesity


## Note
RMAN "delete obsolete" command is used in this script to delete expired backups. Be default, it is commmented out. Please check Oracle Bug report and apply the necessary fixes before you uncomment that line. 

"Oracle Bug 29633753  delete obsolete removes backup created inside recovery window of read only datafiles in nocatalog mode"


The other option to control retention is by using NFS mount. The bash script can be download from 
https://github.com/diana-hui-yang/rman-cohesity/tree/master/sbt/delete-ora-expired

