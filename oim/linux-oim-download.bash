if [[ ! -d rman ]]; then
   mkdir rman
fi
cd rman
if [[ ! -d python ]]; then
   mkdir python
fi
curl -O https://raw.githubusercontent.com/diana-hui-yang/rman-cohesity/master/oim/backup-ora-coh-oim/linux/backup-ora-coh-oim.bash
curl -O https://raw.githubusercontent.com/diana-hui-yang/rman-cohesity/master/nfs/duplicate-ora-coh-nfs/linux/duplicate-ora-coh-nfs.bash
curl -O https://raw.githubusercontent.com/diana-hui-yang/rman-cohesity/master/nfs/restore-ora-coh-nfs/linux/restore-ora-coh-nfs.bash
chmod 750 backup-ora-coh-oim.bash
chmod 750 duplicate-ora-coh-nfs.bash
chmod 750 restore-ora-coh-nfs.bash
cd python
curl -O https://raw.githubusercontent.com/bseltz-cohesity/scripts/master/python/pyhesity.py
curl -O https://raw.githubusercontent.com/bseltz-cohesity/scripts/master/python/cloneDirectory/cloneDirectory.py
curl -O https://raw.githubusercontent.com/bseltz-cohesity/scripts/master/python/storePassword/storePassword.py
curl -O https://raw.githubusercontent.com/bseltz-cohesity/scripts/master/python/storePasswordInFile/storePasswordInFile.py
chmod 750 cloneDirectory.py
chmod 750 storePassword.py
chmod 750 storePasswordInFile.py
cd ..

