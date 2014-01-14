Role Name
========

Role for base setup and configure postgresql server and client with
trust authentication be default

Requirements
------------

None

Role Variables
--------------

Defaults:

    # default vars file for postgresql
    pg_version: 9.2
    pg_encoding: 'UTF-8'
    pg_locale: 'en_US.UTF-8'
    pg_recreate_cluster: false

    # pg_hba.conf
    pg_cfg_pg_hba_default:
      - { type: local,
          database: all,
          user: postgres,
          address: '',
          method: trust,
          comment: '' }
      - { type: local,
          database: all,
          user: all,
          address: '',
          method: trust,
          comment: '"local" is for Unix domain socket connections only' }
      - { type: host,
          database: all,
          user: all,
          address: '127.0.0.1/32',
          method: trust,
          comment: 'IPv4 local connections:' }
      - { type: host,
          database: all,
          user: all,
          address: '::1/128',
          method: trust,
          comment: 'IPv6 local connections:' }

    pg_cfg_pg_hba_passwd_hosts: []
    pg_cfg_pg_hba_trust_hosts: []
    pg_cfg_pg_hba_custom: []

    # postgresql.conf settings
    pg_cfg_srv_listen_addresses: localhost
    pg_cfg_srv_listen_port: 5432
    pg_cfg_srv_max_connections: 50
    pg_cfg_srv_superuser_reserved_connections: 3
    pg_cfg_srv_unix_socket_directory: '/var/run/postgresql'
    pg_cfg_srv_unix_socket_group: ''
    pg_cfg_srv_unix_socket_permissions: '0777'
    pg_cfg_srv_shared_buffers: '128kB'
    pg_cfg_srv_effective_cache_size: '128kB'
    pg_cfg_srv_work_mem: '8MB'

Dependencies
------------

None

License
-------

MIT

ToDo
-------

 - Extensions
 - More config variables

Author Information
------------------

[Andrew Kumanyaev](https://github.com/zzet)

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/zzet/ansible-postgresql-role/trend.png)](https://bitdeli.com/free "Bitdeli Badge")


Contributors Information
------------------

[Alexander Vagin](https://github.com/PlugIN73)

[DAUPHANT Julien](https://github.com/jdauphant)
