#!/bin/bash

set -u

vmname=$(basename $(pwd))
vmname=${vmname}
vagrant destroy ${vmname}

set -e

sed -i 's/pg_version: [0-9].[0-9],/pg_version: 9.2,/g' Vagrantfile
sed -i 's/pg_cfg_srv_listen_port: [0-9]\{4\}$/pg_cfg_srv_listen_port: 5432/g' \
        Vagrantfile

echo '### Install 9.2 ###'
vagrant up ${vmname}
echo '### Install 9.2 for idempotence test ###'
vagrant provision ${vmname} | tee >(grep -q 'changed=0.*failed=0' \
        && (echo '### Idempotence test: pass ###' && exit 0) \
        || (echo '### Idempotence test: fail ###' && exit 1))

sed -i 's/pg_version: [0-9].[0-9],/pg_version: 9.3,/g' Vagrantfile
sed -i 's/pg_cfg_srv_listen_port: [0-9]\{4\}$/pg_cfg_srv_listen_port: 5433/g' \
        Vagrantfile

echo '### Second round: install 9.3 ###'
vagrant provision ${vmname}
echo '### Second round: install 9.3 for idempotence test ###'
vagrant provision ${vmname} | tee >(grep -q 'changed=0.*failed=0' \
        && (echo '### Idempotence test: pass ###' && exit 0) \
        || (echo '### Idempotence test: fail ###' && exit 1))

echo "Destroy vm..."
vagrant destroy ${vmname}

