--nuance外拨专用用户
drop user nuance;
create user nuance identified by nuance;
grant "CONNECT" to nuance;
grant select on  sxdxsj.c_cpic_dial to nuance;
grant update on  sxdxsj.c_cpic_dial to nuance;
grant select on  sxdxsj.shcpic_outdata to nuance;
grant delete on  sxdxsj.shcpic_outdata to nuance;
grant insert on  sxdxsj.shcpic_outdata to nuance;