Role Name
========

Role for base setup and configure postgresql server and client

Requirements
------------

None

Role Variables
--------------

Defaults:

    postgresql:
      version: 9.2
      encoding: 'UTF-8'
      locale: 'en_US.UTF-8'
      recreate_cluster: yes
      configuration:
        pg_hba:
          default:
            - { type: local, database: all, user: postgres, address: '',             method: trust, comment: '' }
            - { type: local, database: all, user: all,      address: '',             method: trust, comment: '"local" is for Unix domain socket connections only' }
            - { type: local, database: all, user: all,      address: '127.0.0.1/32', method: trust, comment: 'IPv4 local connections:' }
            - { type: local, database: all, user: all,      address: '::1/128',      method: trust, comment: 'IPv6 local connections:' }
          passwd_hosts: []
          trust_hosts: []
          custom: []

        server:
          # postgresql.conf settings
          listen_addresses: localhost
          listen_port: 5432
          max_connections: 50
          superuser_reserved_connections: 3
          unix_socket_directory: '/var/run/postgresql'
          unix_socket_group: ''
          unix_socket_permissions: 0777

          shared_buffers: 0
          effective_cache_size: 0
          work_mem: '8MB'


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

