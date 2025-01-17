## Download the script

- curl -O https://raw.githubusercontent.com/diana-hui-yang/rman-cohesity/master/nfs/duplicate-ora-coh-nfs/sun/sun-duplicate-ora-coh-nfs.bash
- chmod 750 sun-duplicate-ora-coh-nfs.bash

## Oracle duplicate scripts Description
This Oracle duplicate script can duplicate Oracle database using the backup files backed up by **backup-ora-coh-nfs.bash** script. It can duplicate Oracle database on the same server of the original Oracle database or an alternate server. It can duplicate CDB database or a PDB database to another CDB. 

When run the script without any options, it displays the script usage

sun-duplicate-ora-coh-nfs.bash basic parameter
Required Parameters
- -r : Target connection (example: "<dbuser>/<dbpass>@<target db connection>")
- -b : Oracle database host that the backup was run.
- -d : Source Oracle_DB_Name, If Source is not a RAC database, it is the same as Instance name. If it is RAC, it is DB name, not instance name
- -t : Target Oracle instance name. If it is not RAC, it is the same as DB name. If it is RAC, it is the instance name like cohcdba2
- -l : File contains duplicate settting, example: set newname for database to '/oradata/restore/orcl/%b'; Provide full path
- -m : mount-prefix (like /coh/ora)
- -n : number of mounts

Optional Parameters
- -e : Catalog connection (example: "<dbuser>/<dbpass>@<catalog connection string>", optional)
- -a : target host (Optional, default is localhost)
- -p : number of channels (Optional, default is same as the number of mounts4)
- -o : ORACLE_HOME (Optional, default is current environment)
- -c : pluggable database (if this input is empty, it is CDB database restore
- -f : yes means force. It will refresh the target database without prompt
- -w : yes means preview rman duplicate scripts


### ora_file example (File contains duplicate settting)
set newname for database to "'/oradata/restore/cdb1res';"


## duplicate-ora-coh-nfs.bash Backup Example
Note: before running this commaand, several prepare steps should be done first. init file should be created.
### Duplicate a traditional Oracle database or CDB database example without connecting to Oracle database that the backup was taking
./sun-duplicate-ora-coh-nfs.bash  -h oracle-01 -d cdb1 -i cdb1res -m  /coh/oranfs -n 4

### Duplicate a PDB database (cohpdb1) from CDB database cdb1 to a CDB staging database cdb2 example without connecting to Oracle database that the backup was taking
./sun-duplicate-ora-coh-nfs.bash -h oracle-01 -d cdb1 -i cdb2  -m  /coh/oranfs -n 4 -u cohpdb1

### duplidate a traditional Oracle database or CDB database example
./sun-duplicate-ora-coh-nfs.bash -r "user/password@oracle-01:/cdb1" -h oracle-01 -d cdb1 -i cdb1res -m  /coh/oranfs -n 4
  
###  PDB database (cohpdb1) from CDB database cdb1 to a CDB staging database cdb2 example
./sun-duplicate-ora-coh-nfs.bash -r "user/password@oracle-01:/cdb1" -h oracle-01 -d cdb1 -i cdb2  -m  /coh/oranfs -n 4 -u cohpdb1
