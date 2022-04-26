[Oracle Enterprise Edition 12c Release 2](https://github.com/ashimjk/docker-oracle-ee-12c)
===============================================

### Installation

    docker pull ashimjk/oracle-ee-12c

Run with `1521` ports opened:

    docker run -d -p 1521:1521 ashimjk/oracle-ee-12c

Run with Custom `DBCA_TOTAL_MEMORY` (in Mb):

    docker run -d -p 1521:1521 -e DBCA_TOTAL_MEMORY=1024 ashimjk/oracle-ee-12c

### Connect Database

Connect database with following setting:

    hostname: localhost
    port: 1521
    sid: ee
    service name: ee.oracle.docker
    username: system
    password: oracle

To connect using `sqlplus`:

    sqlplus system/oracle@//localhost:1521/ee.oracle.docker

Password for `SYS` & `SYSTEM`:

    oracle

### Start with additional initial scripts

    docker run -d -p 1521:1521 -v /my/oracle/init/SCRIPTSorSQL:docker-entrypoint-initdb.d ashimjk/oracle-ee-12c

By default, import from `docker-entrypoint-initdb.d` enabled only if you are initializing database (1st run).

If you need to run import at any case - add `-e IMPORT_FROM_VOLUME=true`

### Uses

Connect to `sqlplus`

    docker run -d -p 1521:1521 --name oracle-ee ashimjk/oracle-ee-12c
    docker exec -it oracle-ee /bin/bash
    # change user
    su oracle
    cd $ORACLE_HOME
    bin/sqlplus / as sysdba
    # now you are inside sqlplus
    select database_status from v$instance;

### Many Thanks To

- [Maksym Bilenko](https://github.com/MaksymBilenko/docker-oracle-ee-12c)
