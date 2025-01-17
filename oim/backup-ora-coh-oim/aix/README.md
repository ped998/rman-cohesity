## Download the script
- /opt/freeware/bin/curl -O https://raw.githubusercontent.com/diana-hui-yang/rman-cohesity/master/oim/backup-ora-coh-oim/aix/aix-backup-ora-coh-oim.bash
- chmod 750 backup-ora-coh-oim.bash


## Backup scripts Description

aix-backup-ora-coh-oim.bash can utilize mutiple mount points to backup Oracle databases. It uses Oracle incremental merge. The backup is incremental and the result is full backup after the merge. It should be used with Cohesity snapshot feature as a complete backup solution. backup-ora-coh-oim.bash supports Linux and sbackup-ora-coh-oim.bash supports Solaris. Cohesity Remote adapter will run Cohesity snapshow after the backup is done. 
This script supports full, incremental, and archive logs backup options. It also supports recvoery catalog.

When run the script without any options, it displays the script usage

 Required Parameters
- -h : host (scanname is required if it is RAC. optional if it is standalone.)
- -o : ORACLE_DB_NAME (Need to have an entry of this database in /etc/oratab. If it is RAC, it is db_unique_name)
- -t : backup type: Full or Incre
- -a : yes (yes means archivelog backup only, no means database backup plus archivelog backup, no is optional)
- -y : Cohesity Cluster DNS name
- -v : Cohesity View that is configured to be the target for Oracle backup
- -u : Cohesity Oracle User. The user should have access permission on the view
- -g : Active Directory Domain of the Cohesity Oracle user. If the user ic created on Cohesity, use local as the input
- -m : mount-prefix (like /mnt/ora)
- -n : number of mounts
- -e : Retention time (days to retain the backups, apply only after uncomment "Delete obsolete" in this script)

 Optional Parameters
- -r : RMAN login (example: "rman target /", optional)
- -c : Catalog connection (example: "<dbuser>/<dbpass>@<catalog connection string>", optional)
- -d : Rac nodes connectons strings that will be used to do backup (example: "<rac1-node connection string,ora2-node connection string>")
- -p : number of channels (Optional, default is 4)
- -s : CloneDirectory.py directory (default directory is <current script directory>/python)
- -l : Archive logs retain days (days to retain the local archivelogs before deleting them. default is 1 day)
- -f : Number of times backing Archive logs (default is 1.)
- -b : ORACLE_HOME (default is /etc/oratab, optional.)
- -x : Maximum throughput (default is no limit. Unit is MB/sec. Archivelog backup throughput will be 20% of max throughput if database backup is running)
- -w : yes means preview rman backup scripts


##aix-backup-ora-coh-oim.bash Backup Example

### Incremental merge backup example (incremental backup and the result is full backup)
./aix-backup-ora-coh-oim.bash -o orcl -t incre -m /coh/ora -n 4 -p 3 -e 3 -y cohesity1 -v ora_oim -u oraadmin -g sa.com 
 
 ### Log backup example
./aix-backup-ora-coh-oim.bash -o orcl -a yes -m /coh/ora -n 4 -p 3 -e 3
