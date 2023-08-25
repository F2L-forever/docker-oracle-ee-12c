FROM quay.io/maksymbilenko/oracle-ee-12c-base

ENV ORACLE_SID=ee
ENV ORACLE_PWD=123456
ENV ORACLE_CHARACTER_SET=AL32UTF8
ENV DBCA_TOTAL_MEMORY 4096

ENV ORACLE_HOME=/u01/app/oracle/product/12.2.0/EE
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/u01/app/oracle/product/12.2.0/EE/bin

ADD entrypoint.sh /entrypoint.sh

EXPOSE 1521

VOLUME ["/u01/app/oracle"]
VOLUME ["/docker-entrypoint-initdb.d"]

ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
