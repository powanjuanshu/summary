--nuance语音分析员专用账号
drop user telanal;
create user telanal identified by telanal;
grant "CONNECT" to telanal;
grant select on  sxdxsj.shcpic_outdata to telanal;
grant select on  sxdxsj.c_cpic_dial to telanal;
grant update on  sxdxsj.c_cpic_dial to telanal;
grant select on  sxdxsj.v_nuance_batch to telanal;
grant update on  sxdxsj.v_nuance_batch to telanal;