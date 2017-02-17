create or replace procedure PROC_EXP_update
(
	i_task_id in number,
	i_exp_type in number default 0,
	o_updated_rows out number
)as
v_sql varchar2(8000);
v_start_time:=sysdate;
begin

execute immediate v_sql using v_source_type;

commit;
exception when others then
rollback;
end;