--项目程序操作数据库用账号
drop user sxdxsj;
create user sxdxsj identified by sxdxsj default tablespace sxdxsj_data;
grant "CONNECT" to sxdxsj;
grant "RESOURCE" to sxdxsj;
grant create view to sxdxsj;
grant unlimited tablespace to sxdxsj;