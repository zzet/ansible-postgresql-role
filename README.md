Role Name
========

Role for base setup and configure postgresql server and client

Requirements
------------

None

Role Variables
--------------

Defaults:

    # default vars file for postgresql
    postgresql_version: 9.2
    postgresql_encoding: 'UTF-8'
    postgresql_locale: 'en_US.UTF-8'
    postgresql_recreate_cluster: yes
    # pg_hba.conf
    postgresql_configuration_pg_hba_default:
      - { type: local, database: all, user: postgres, address: '',             method: trust, comment: '' }
      - { type: local, database: all, user: all,      address: '',             method: trust, comment: '"local" is for Unix domain socket connections only' }
      - { type: local, database: all, user: all,      address: '127.0.0.1/32', method: trust, comment: 'IPv4 local connections:' }
      - { type: local, database: all, user: all,      address: '::1/128',      method: trust, comment: 'IPv6 local connections:' }
    postgresql_configuration_pg_hba_passwd_hosts: []
    postgresql_configuration_pg_hba_trust_hosts: []
    postgresql_configuration_pg_hba_custom: []

    # postgresql.conf settings
    postgresql_configuration_server_listen_addresses: localhost
    postgresql_configuration_server_listen_port: 5432
    postgresql_configuration_server_max_connections: 50
    postgresql_configuration_server_superuser_reserved_connections: 3
    postgresql_configuration_server_unix_socket_directory: '/var/run/postgresql'
    postgresql_configuration_server_unix_socket_group: ''
    postgresql_configuration_server_unix_socket_permissions: 0777

    postgresql_configuration_server_shared_buffers: 128kB
    postgresql_configuration_server_effective_cache_size: 128kB
    postgresql_configuration_server_work_mem: '8MB'

Dependencies
------------

zzet.common

License
-------

MIT

Author Information
------------------

[Andrew Kumanyaev](https://github.com/zzet)
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/zzet/ansible-postgresql-role/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

