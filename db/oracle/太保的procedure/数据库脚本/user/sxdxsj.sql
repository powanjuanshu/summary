--��Ŀ����������ݿ����˺�
drop user sxdxsj;
create user sxdxsj identified by sxdxsj default tablespace sxdxsj_data;
grant "CONNECT" to sxdxsj;
grant "RESOURCE" to sxdxsj;
grant create view to sxdxsj;
grant unlimited tablespace to sxdxsj;