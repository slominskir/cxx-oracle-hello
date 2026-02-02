alter session set container = XEPDB1;

ALTER SYSTEM SET db_create_file_dest = '/opt/oracle/oradata';

create tablespace oralib;

create user "ORALIB" profile "DEFAULT" identified by "password" default tablespace "ORALIB" account unlock;

grant connect to ORALIB;
grant unlimited tablespace to ORALIB;

grant create view to ORALIB;
grant create sequence to ORALIB;
grant create table to ORALIB;
grant create procedure to ORALIB;
grant create type to ORALIB;
grant create trigger to ORALIB;