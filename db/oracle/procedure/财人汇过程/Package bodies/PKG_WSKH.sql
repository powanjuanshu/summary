create or replace package body PKG_WSKH is
  /*定义的全局的变量*/
  v_vc_zzyc   varchar2(1) := '';  --制造异常
  v_vc_ycbz   varchar2(1);       --异常标志 N:系统自动异常捕捉 Y:人为考虑系统异常 C:人为的制造了异常

  procedure pkgsp_wskh_userRegByMobile(p_mobile       in varchar2,
                                       p_open_type    in varchar2,
                                       p_register_way in varchar2,
                                       p_app_id       in varchar2,
                                       p_ip_address   in varchar2,
                                       p_op_station   in varchar2,
                                       p_user_id      out varchar2,
                                       error_no       out number,
                                       error_info     out varchar2) is
    /* 定义方法内的临时变量 */
    v_count number(4);
    --v_l_user_id number(14);
  begin
    error_no   := 0;
    error_info := '';
    p_user_id  := '';
    select count(*)
      into v_count
      from user_presence up
     where up.mobile = p_mobile;
    if v_count > 0 then
      error_no   := 10000;
      error_info := '此手机号码已注册，不允许再次注册。';
      return;
    end if;

    select count(*)
      into v_count
      from user_profile up
     where up.mobile = trim(p_mobile);
    if v_count > 0 then
      error_no   := 10000;
      error_info := '此手机号码已注册，不允许再次注册。';
      return;
    end if;

    begin
      insert into user_profile
        (user_id,
         mobile,
         create_time,
         last_login_time,
         last_ip,
         status,
         op_station)
      values
        (user_profile_seq.nextval,
         trim(p_mobile),
         sysdate,
         sysdate,
         trim(p_ip_address),
         '0',
         trim(p_op_station))
      returning user_id into p_user_id;
    exception
      when others then
        error_no   := 10001;
        error_info := '新增前台用户表失败[user_profile][mobile=' || trim(p_mobile) || ']';
        rollback;
        return;
    end;

    begin
      insert into user_presence
        (id,
         user_id,
         mobile,
         create_time,
         last_update_time,
         last_update_by,
         status,
         user_status,
         open_type,
         user_flow_status,
         register_way,
         app_id,
         revisit_status,
         hkstock_status,
         op_station)
      values
        (USER_PRESENCE_SEQ.nextVal,
         p_user_id,
         trim(p_mobile),
         sysdate,
         sysdate,
         p_user_id,
         '0',
         '0',
         trim(p_open_type),
         '0000000000',
         trim(p_register_way),
         trim(p_app_id),
         '1',
         '0',
         trim(p_op_station));
    exception
      when others then
        error_no   := 10007;
        error_info := '新增前台用户表失败[user_presence][mobile=' || trim(p_mobile) ||
                      ';user_id=' || p_user_id || ']';
        rollback;
        return;
    end;
    commit;
  end pkgsp_wskh_userRegByMobile;

  --获取审核任务、获取复核任务
  procedure pkgsp_wskh_MessTaskFetch(p_audit_type in varchar2, -- 1-审核、 2-复核
                                     p_user_id    in varchar2,
                                     p_task_id    in varchar2,
                                     p_emp_id     in varchar2,
                                     p_emp_name   in varchar2,
                                     error_no     out number,
                                     error_info   out varchar2) is
    --v_task_type   varchar2(20);
    v_task_status varchar2(1);
    v_status      varchar2(1);
    v_user_status varchar2(1);
    v_count       number(4);
  begin
    if (trim(p_audit_type) != '1') and (trim(p_audit_type) != '2') then
      error_no   := 100012;
      error_info := '输入参数错误[p_audit_type=' || trim(p_audit_type) || ']';
      return;
    end if;

    select count(*)
      into v_count
      from user_presence up
     where up.user_id = trim(p_user_id);

    if v_count <= 0 then
      error_no   := 10001;
      error_info := '客户号不存在[user_id=' || trim(p_user_id) || ']';
      return;
    end if;

    error_no   := 0;
    error_info := '';
    --task_type --2-开户审核 3- 开户复核
    if '1' = p_audit_type then
      --v_task_type   := ',2,6,7,';
      v_task_status := '2'; --处理中
      v_status      := '3'; --审核中7
      v_user_status := '3'; --审核中
    else
      --v_task_type   := ',3,';
      v_task_status := '2'; -- 处理中
      v_status      := '5'; --复核中
      v_user_status := '3'; --审核中
    end if;

    select count(*)
      into v_count
      from mess_task mt
     where mt.task_id = trim(p_task_id);
       --and instr(v_task_type, ',' || mt.task_type || ',') > 0; -- mt.task_type in (v_task_type);
    if v_count <= 0 then
      error_no   := 10022;
      error_info := '审核任务信息不存在[task_id=' || trim(p_task_id) || ']';
      return;
    end if;

    begin
      update mess_task mt
         set mt.status      = v_task_status,
             mt.locked_flag = '0',
             mt.deal_time   = sysdate,
             mt.emp_id      = p_emp_id,
             mt.emp_name    = p_emp_name
       where mt.task_id = p_task_id;
         --and mt.task_type = v_task_type;
    exception
      when others then
        error_no   := 11111111;
        error_info := '更新任务表状态失败';
        rollback;
        return;
    end;

    begin
      update user_presence up
         set up.status = v_status, up.user_status = v_user_status
       where up.user_id = p_user_id;
    exception
      when others then
        error_no   := 11111112;
        error_info := '更新用户扩展信息表状态失败';
        rollback;
        return;
    end;

    commit;
  end pkgsp_wskh_MessTaskFetch;

  /*新增角色： 新增func_role 新增func_role_resource*/
  procedure pkgsp_wskh_AddRole(p_role_code       in varchar2,
                               p_role_name       in varchar2,
                               p_memo            in varchar2,
                               p_org_id_str      in varchar2, --多个用英文逗号分隔
                               p_resource_id_str in varchar2, --多个资源权限用英文逗号分隔
                               error_no          out number,
                               error_info        out varchar2) is
  v_RowCount number(4);
  v_str      varchar2(4000);
  v_res_id   varchar2(10);
  v_role_id  varchar2(14);
  begin
    error_no := 0;
    error_info := '';

   select count(*)
     into v_RowCount
     from func_role
    where role_code = trim(p_role_code);
   if v_RowCount > 0 then
     error_no   := 1;
     error_info := '角色已存在[role_code=' || trim(p_role_code) || ']';
     return;
   end if;

   begin
     insert into func_role
       (ROLE_ID, ROLE_CODE, ROLE_NAME, MEMO, ORG_ID)
     values
       (func_role_seq.nextval,
        trim(p_role_code),
        trim(p_role_name),
        trim(p_memo),
        trim(p_org_id_str))
     returning role_id into v_role_id;
   exception
     when others then
       error_no   := -1;
       error_info := '增加角色表失败';
       rollback;
       return;
   end;

   select count(*)
     into v_RowCount
     from func_role_resource
    where role_id = trim(v_role_id);
   if v_RowCount > 0 then
     begin
       delete from func_role_resource where role_id = trim(v_role_id);
     exception
       when others then
         error_no   := 2;
         error_info := '删除角色资源关系表失败';
         rollback;
         return;
     end;
   end if;

    v_str := p_resource_id_str;
    while length(v_str) > 0 LOOP
      IF (instr(v_str, ',') > 0) THEN
        v_res_id := substr(v_str, 1, instr(v_str, ',') - 1);
        v_str    := substr(v_str, instr(v_str, ',') + 1);
      else
        v_res_id := v_str;
        v_str    := '';
      END IF;
      if length(v_res_id) > 0 then
        begin
          insert into func_role_resource(ROLE_RESOURCE_ID,
                                               RESOURCE_ID,
                                               ROLE_ID）
                 values( func_role_resource_seq.nextval,
                                               trim(v_res_id),
                                               trim(v_role_id));
        exception
          when others then
          error_no   := 11111113;
          error_info := '增加角色资源关系表失败';
          rollback;
          return;
        end;
     end if;

    END LOOP;
    commit;
  end pkgsp_wskh_AddRole;

  --角色修改： 修改func_role 新增func_role_resource
  procedure pkgsp_wskh_UpdateRole(p_role_id         in varchar2,
                                  p_role_code       in varchar2,
                                  p_role_name       in varchar2,
                                  p_memo            in varchar2,
                                  p_org_id_str      in varchar2, --多个用英文逗号分隔
                                  p_resource_id_str in varchar2, --多个资源权限用英文逗号分隔
                                  error_no          out number,
                                  error_info        out varchar2) is

  v_RowCount number(4);
  v_str      varchar2(4000);
  v_res_id   varchar2(10);
  begin
    error_no := 0;
    error_info := '';

   begin
     update func_role
     set ROLE_CODE = nvl(trim(p_role_code), ROLE_CODE),
         ROLE_NAME = nvl(trim(p_role_name), ROLE_NAME),
         MEMO = nvl(trim(p_memo), MEMO),
         ORG_ID = nvl(trim(p_org_id_str), ORG_ID)
      where role_id = trim(p_role_id);
   exception
     when others then
       error_no   := -2;
       error_info := '修改角色表失败[role_id='||trim(p_role_id) ||']';
       rollback;
       return;
   end;

   if trim(p_resource_id_str) is not null then
     select count(*)
        into v_RowCount
        from func_role_resource
       where role_id = trim(p_role_id);
      if v_RowCount > 0 then
        begin
          delete from func_role_resource where role_id = trim(p_role_id);
        exception
          when others then
            error_no   := 2;
            error_info := '删除角色资源关系表失败';
            rollback;
            return;
        end;
      end if;
    end if;

    v_str := p_resource_id_str;
    while length(v_str) > 0 LOOP
      IF (instr(v_str, ',') > 0) THEN
        v_res_id := substr(v_str, 1, instr(v_str, ',') - 1);
        v_str    := substr(v_str, instr(v_str, ',') + 1);
      else
        v_res_id := v_str;
        v_str    := '';
      END IF;
      if length(v_res_id) > 0 then
        begin
          insert into func_role_resource(ROLE_RESOURCE_ID,
                                               RESOURCE_ID,
                                               ROLE_ID）
                 values( func_role_resource_seq.nextval,
                                               trim(v_res_id),
                                               trim(p_role_id));
        exception
          when others then
          error_no   := 11111113;
          error_info := '增加角色资源关系表失败';
          rollback;
          return;
        end;
     end if;

    END LOOP;
    commit;
  end pkgsp_wskh_UpdateRole;

  --审核复核获取任务信息及用户详细信息
  procedure pkgsp_wskh_MessTaskQry(p_user_id                    in varchar2,
                                   p_task_id                    in varchar2,
                                   p_revisit_paper_id           in varchar2, --回访问卷类型 1-回访问卷
                                   cur_audit_mess_task          out myrctype, --最近的复核任务
                                   cur_mess_task                out myrctype, --当前任务
                                   cur_pre_mess_task            out myrctype, --上次任务
                                   cur_user_amendments          out myrctype, --复核意见
                                   cur_user_id_info             out myrctype, --用户身份信息
                                   cur_user_presence            out myrctype, --用户扩展信息
                                   cur_user_id_upload           out myrctype, --用户身份证图片上传信息
                                   cur_user_video_verify        out myrctype, --视频认证
                                   cur_user_bank_verify         out myrctype, --银行认证
                                   cur_user_id_verify           out myrctype, --公安系统认证
                                   cur_exam_test_result_1       out myrctype, --风险评测结果
                                   cur_exam_test_result_n       out myrctype, --港股通测评
                                   cur_user_agreement_sign      out myrctype, --协议签署
                                   cur_user_accounts            out myrctype, --选择的账户
                                   cur_user_third_deposity      out myrctype, --三方存管
                                   cur_exam_test_result_x       out myrctype, --股票质押征信问卷
                                   cur_revisit_question         out myrctype, --回访问卷题目
                                   cur_revisit_question_options out myrctype, --回访问卷选择项
                                   cur_channel_define           out myrctype, --渠道定义
                                   cur_user_revisit             out myrctype, --用户回访问卷答题结果
                                   error_no                     out number,
                                   error_info                   out varchar2) is
    v_revisit_paper_id varchar2(4);
  begin
    if (trim(p_user_id) is null) or (trim(p_task_id) is null) then
      error_no   := 100012;
      error_info := '输入参数错误[p_user_id=' || trim(p_user_id) || ',p_task_id=' ||
                    trim(p_task_id) || ']';
      return;
    end if;

    v_revisit_paper_id := trim(p_revisit_paper_id);
    if trim(v_revisit_paper_id) is null then
      v_revisit_paper_id := '1';
    end if;
    error_no   := -1;
    error_info := '';
    open cur_audit_mess_task for
      select *
        from (select *
                from MESS_TASK
               where USER_ID = trim(p_user_id)
                 and TASK_TYPE = '3'
               order by TASK_ID desc)
       where rownum = 1;
    open cur_mess_task for
      select * from mess_task where task_id = trim(p_task_id);
    open cur_pre_mess_task for
      select t.*, u.emp_no, u.emp_name, u.mobile
        from (select *
                from mess_task
               where user_id = trim(p_user_id)
                 and task_id < trim(p_task_id)
               order by task_id desc) t
        left join base_sys_user u
          on t.emp_id = u.emp_id;
    open cur_user_amendments for
      select *
        from user_amendments
       where user_id = trim(p_user_id)
         and status = 9;
    open cur_user_id_info for
      select * from user_id_info where user_id = trim(p_user_id);
    open cur_user_presence for
      select * from user_presence where user_id = trim(p_user_id);
    open cur_user_id_upload for
      select * from user_id_upload where user_id = trim(p_user_id);
    open cur_user_video_verify for
      select t.*, u.emp_name
        from (select *
                from user_video_verify
               where user_id = trim(p_user_id)
               order by verify_id desc) t
        left join base_sys_user u
          on t.operator_id = u.emp_id
       where rownum = 1;
    open cur_user_bank_verify for
      select t.*, b.bank_name
        from (select *
                from user_bank_verify
               where user_id = trim(p_user_id)
               order by verify_id desc) t
        left join base_bank b
          on t.bank_id = b.bank_id
       where rownum = 1;
    open cur_user_id_verify for
      select * from user_id_verify where user_id = trim(p_user_id);
    open cur_exam_test_result_1 for
      select *
        from (select tr.*
                from exam_test_result tr, exam_paper p
               where tr.user_id = trim(p_user_id) 	AND tr.local_paper_id = p.local_paper_id
                 and p.paper_type = '1'
               order by tr.result_id desc)
       where rownum = 1;
    open cur_exam_test_result_n for
      select *
        from (select tr.*
                from exam_test_result tr, exam_paper p
               where tr.user_id = trim(p_user_id) 	AND tr.local_paper_id = p.local_paper_id
                 and p.paper_type = 'n'
               order by tr.result_id desc)
       where rownum = 1;
    open cur_user_agreement_sign for
      select d.*
        from obs_user_agreement_sign s
        left join obs_doc_agreement d
          on s.agreement_id = d.agreement_id
       where s.user_id = trim(p_user_id)
       order by s.sign_id desc;
    open cur_user_accounts for
      select * from user_accounts where user_id = trim(p_user_id);
    open cur_user_third_deposity for
        select a.*,b.bank_name from user_third_deposity a left join base_bank b on a.bank_id=b.bank_id where user_id = trim(p_user_id);
    open cur_exam_test_result_x for
      select *
        from (select tr.*
                from exam_test_result tr, exam_paper p
               where tr.user_id = trim(p_user_id)
                 and p.paper_type = 'x'
               order by tr.result_id desc)
       where rownum = 1;
    open cur_revisit_question for
      select *
        from revisit_question
       where revisit_paper_id = trim(v_revisit_paper_id)
       order by question_no asc;
    open cur_revisit_question_options for
      select *
        from revisit_question_options
       where revisit_paper_id = trim(v_revisit_paper_id)
       order by option_id asc;
    open cur_channel_define for
      select * from channel_define
      where channel_id=(select channel_id  from user_presence where user_id = trim(p_user_id));
    open cur_user_revisit for
      select * from user_revisit where user_id = trim(p_user_id);
    error_no   := 0;
    error_info := '';
  end pkgsp_wskh_MessTaskQry;

  --任务审核通过
  procedure pkgsp_wskh_TaskAuditPass(p_user_id in varchar2,
                                     p_task_id in varchar2,
                                     p_emp_id  in varchar2,
                                     --p_result_comment in varchar2,
                                     error_no   out number,
                                     error_info out varchar2) is
    v_org_id        varchar2(100);
    v_org_name      varchar2(100);
    v_user_name     varchar2(100);
    v_identity_code varchar2(32);
    v_mobile        varchar2(20);
    v_app_id        varchar2(32);
    v_emp_name      varchar2(100);
  begin
    error_no   := 0;
    error_info := '';
    select (select t.name
              from base_organization t
             where t.org_id = up.open_org_id
               and rownum = 1),
           up.open_org_id,
           up.user_name,
           up.mobile,
           up.app_id
      into v_org_name, v_org_id, v_user_name, v_mobile, v_app_id
      from user_presence up
     where user_id = trim(p_user_id)
       and rownum = 1;

    select identity_code
      into v_identity_code
      from user_id_info
     where user_id = trim(p_user_id)
       and rownum = 1;

    select t.emp_name
      into v_emp_name
      from base_sys_user t
     where t.emp_id = trim(p_emp_id)
       and rownum = 1;

    insert into user_business_flow
      (business_id,
       business_type,
       user_id,
       create_time,
       create_by,
       create_user_name,
       description,
       status,
       source_detail_id,
       org_id,
       org_name,
       user_name,
       identity_code,
       mobile)
    values
      (user_business_flow_seq.nextval,
       '33206',
       trim(p_user_id),
       sysdate,
       trim(p_emp_id),
       v_emp_name,
       '开户申请审核通过',
       '01',
       null,
       v_org_id,
       v_org_name,
       v_user_name,
       v_identity_code,
       v_mobile);

    update mess_task mt
       set mt.status         = '3',
           mt.result_comment = '开户申请审核通过',
           mt.emp_id         = p_emp_id,
           mt.emp_name       = v_emp_name,
           mt.finish_time    = sysdate
     where mt.task_id = trim(p_task_id);

    update user_presence up
       set up.status           = '5',
           up.user_status      = '3',
           up.last_update_time = sysdate,
           up.last_update_by   = trim(p_emp_id)
     where up.user_id = trim(p_user_id);

    insert into mess_task
      (task_id,
       task_type,
       create_time,
       user_id,
       user_name,
       org_id,
       anti_emp_id,
       app_id,
       status,
       locked_flag)
    values
      (mess_task_seq.nextval,
       '3',
       sysdate,
       trim(p_user_id),
       v_user_name,
       v_org_id,
       trim(p_emp_id),
       v_app_id,
       '0',
       '0');

    update user_amendments ua
       set ua.status = '8'
     where ua.user_id = trim(p_user_id)
       and ua.status = '9';

    update user_profile_change upc
       set upc.status      = '8',
           upc.update_time = sysdate,
           upc.update_by   = trim(p_emp_id)
     where upc.change_user_id = trim(p_user_id)
       and upc.status = '0';

  end pkgsp_wskh_TaskAuditPass;

  procedure pkgsp_wskh_TaskAuditReject(p_user_id        in varchar2,
                                       p_task_id        in varchar2,
                                       p_emp_id         in varchar2,
                                       p_result_comment in varchar2,
                                       p_flow_status    in varchar2,
                                       p_isOpenNewFlow  in varchar2,  --0否 1是
                                       error_no         out number,
                                       error_info       out varchar2) is
    v_org_id        varchar2(100);
    v_org_name      varchar2(100);
    v_user_name     varchar2(100);
    v_identity_code varchar2(32);
    v_mobile        varchar2(20);
    v_app_id        varchar2(32);
    v_emp_name      varchar2(100);
  begin
    error_no   := 0;
    error_info := '';
    select (select t.name
              from base_organization t
             where t.org_id = up.open_org_id
               and rownum = 1),
           up.open_org_id,
           up.user_name,
           up.mobile,
           up.app_id
      into v_org_name, v_org_id, v_user_name, v_mobile, v_app_id
      from user_presence up
     where user_id = trim(p_user_id)
       and rownum = 1;

    select identity_code
      into v_identity_code
      from user_id_info
     where user_id = trim(p_user_id)
       and rownum = 1;

    select t.emp_name
      into v_emp_name
      from base_sys_user t
     where t.emp_id = trim(p_emp_id)
       and rownum = 1;
    --1、更新状态 user_profile_change
    update user_profile_change upc
       set upc.status      = '1',
           upc.update_time = sysdate,
           upc.update_by   = trim(p_emp_id)
     where upc.change_user_id = trim(p_user_id)
       and upc.status = '0';
    --2、插入 user_business_flow
    insert into user_business_flow
      (business_id,
       business_type,
       user_id,
       create_time,
       create_by,
       create_user_name,
       description,
       status,
       source_detail_id,
       org_id,
       org_name,
       user_name,
       identity_code,
       mobile)
    values
      (user_business_flow_seq.nextval,
       '33205',
       trim(p_user_id),
       sysdate,
       trim(p_emp_id),
       v_emp_name,
       nvl(trim(p_result_comment), ' '),
       '01',
       null,
       v_org_id,
       v_org_name,
       v_user_name,
       v_identity_code,
       v_mobile);
    --3、更新任务状态：3-审核未通过
    update mess_task mt
       set mt.status         = '3',
           mt.result_comment = '审核未通过' || p_result_comment,
           mt.emp_id         = p_emp_id,
           mt.emp_name       = v_emp_name,
           mt.finish_time    = sysdate
     where mt.task_id = trim(p_task_id);
    --4、更新用户扩展信息
    update user_presence up
       set up.status           = '4',
           up.user_status      = '3',
           up.user_flow_status = nvl(trim(p_flow_status),
                                     up.user_flow_status),
           up.last_update_time = sysdate,
           up.last_update_by   = trim(p_emp_id)
     where up.user_id = trim(p_user_id);
    --5、根据p_flow_status解析，并更新相应表结构中记录的状态
    if substr(trim(p_flow_status), 3, 1) = '4' then
      update user_video_verify uvv
         set uvv.status = '1'
       where uvv.user_id = trim(p_user_id);
    elsif substr(trim(p_flow_status), 3, 1) = '3' then
      update user_video_verify uvv
         set uvv.status = '8'
       where uvv.user_id = trim(p_user_id);
    end if;

     if substr(p_flow_status,1,1) = '9' then
       if trim(p_isOpenNewFlow)='0' then
          update user_presence t
            set t.status = 13  --开户失败
          where t.user_id = p_user_id;
       elsif  trim(p_isOpenNewFlow)='1' then
              update USER_VIDEO_VERIFY set status='1',video_addres='',snap_image1='',snap_image2='',snap_image3='' where user_id= p_user_id;
              update USER_ID_VERIFY set status='9',validate_time=sysdate where  user_id= p_user_id;
              update User_Id_Upload  set front_pic='',back_pic='',attr1='' where   user_id= p_user_id;
              update user_presence set status='0'   where   user_id= p_user_id;
       end if;

     end if;

  end pkgsp_wskh_TaskAuditReject;

  procedure pkgsp_wskh_PubExec(p_vc_SqlBlock in varchar2,  --传入sql块，支持传多条SQL
                               p_vc_SplitStr in varchar2,  --sql分隔字符串，不传默认以分号分隔
                               error_no out number,
                               error_info out varchar2)
  /**********************************************************
  名  称：通用SQL执行
  功  能：通用SQL执行
          支持传多条SQL，已分号分隔
  创建者：xiaoen
  描  述：入参：p_vc_SqlBlock SQL语句块
                p_vc_SplitStr SQL分隔符，默认以分号分隔

          出参：error_no 错误号
                error_info 错误信息
  日  期：2015-07-28
  版  本：V1.0.0.0
  ***********************************************************/
  is
    v_vc_SplitStr varchar2(10);--分隔符
    v_l_Pos number;
    v_vc_SqlBlock varchar2(16000);
    v_vc_Sql varchar2(16000);
  begin
    v_vc_ycbz := 'N';

    if trim(p_vc_SplitStr) is null then
      v_vc_SplitStr := ';'; --默认分号分隔
    else
      v_vc_SplitStr := p_vc_SplitStr;
    end if;

    v_vc_SqlBlock := p_vc_SqlBlock;

    while Trim(v_vc_SqlBlock) is not null
    loop
      v_l_Pos := instr(v_vc_SqlBlock,v_vc_SplitStr);
      if v_l_Pos > 0 then
        v_vc_Sql := substr(v_vc_SqlBlock,1,v_l_Pos - 1);
        v_vc_SqlBlock := substr(v_vc_SqlBlock,v_l_Pos + length(v_vc_SplitStr),16000);
      else
        v_vc_Sql := v_vc_SqlBlock;
        v_vc_SqlBlock := '';
      end if;

      if trim(v_vc_Sql) is not null then
        execute immediate v_vc_Sql;
      end if;
    end loop;

    commit;
    error_no := 0;
    error_info := '处理成功';
  exception when others then
    rollback;
    --系统自动异常捕捉
    if v_vc_ycbz = 'N' then
      error_no:=-1;
      error_info := '[pkg_wskh.pkgsp_wskh_PubExec]报异常错误:'||chr(13)||sqlerrm||'。v_vc_Sql = '||v_vc_Sql;
    end if;
    --人为考虑系统异常
    if v_vc_ycbz = 'Y' then
      error_info := error_info||chr(13)||sqlerrm;
    end if;
    --人为的制造了异常
    if v_vc_ycbz = 'C' then
      error_info := error_info;
    end if;
    null;
  end pkgsp_wskh_PubExec;

  procedure pkgsp_wskh_ApplychangeStatus(p_vc_UserId in varchar2,
                                         p_vc_ProxNode in varchar2,
                                         p_vc_EmpId in varchar2,
                                         p_vc_TaskId in varchar2,
                                         p_vc_BusinessFlowDesc in varchar2,
                                         p_vc_BuisnessFlowDetailId in varchar2,
                                         p_vc_AuditType in varchar2, --reviewonly,auditandreview
                                         p_vc_smsContext in varchar2,
                                         error_no out number,
                                         error_info out varchar2)
  /**********************************************************
  名  称：开户变更引擎
  功  能：开户变更引擎
  创建者：xiaoen
  描  述：入参：p_vc_userId 当前申请的用户
                p_vc_proxNode 业务操作 参看 @ProgressNodes 文件
                p_vc_empId 操作人员ID 也可能是用户本身
                p_vc_taskId 如果此步骤涉及系统任务，需要变更任务状态
                p_vc_BusinessFlowDesc 记录业务日志需要的描述性信息
                p_vc_BuisnessFlowDetailId 记录业务日志时，需要一些关联信息，比如用户整改时候，需要将user_profile_change.change_id传入，以便系统跟踪
                p_vc_AuditType 复核类型 【reviewonly,auditandreview】
                p_vc_smsContext 短信内容 为空则不发短信

          出参：error_no 错误号
                error_info 错误信息

  日  期：2015-07-28
  版  本：V1.0.0.0
  ***********************************************************/
  is
    v_l_count number;
    v_vc_TaskFlag number;--是否生成审核任务 0 不生成 1 生成
    v_vc_taskType varchar2(20);--生成审核任务类型
    v_vc_userPresenceStatus number; --修改用户状态

    procedure inner_proc_sendMessage(a_vc_UserId in varchar2,
                                     a_vc_EmpId in varchar2,
                                     a_vc_Mobile in varchar2,
                                     a_vc_Context in varchar2,
                                     a_vc_BusinessType in varchar2,
                                     a_l_redotimes in number,
                                     error_no out number,
                                     error_info out varchar2)
    is
    /*****************
    名  称：发送短信
    功  能：发送短信
    创建者：xiaoen
    描  述：
    日  期：2015-07-28
    版  本：V1.0.0.0
    ******************/
    begin
      --发送通知短信, 无配置则不发送
      if trim(a_vc_Context) is not null then
        v_vc_ycbz := 'Y';
        error_no := -101;
        error_info := '[pkg_wskh.ApplychangeStatus.inner_proc_sendMessage]短信发送失败，请联系系统管理员！';
        insert into mess_sms
              (mess_id,business_type,tel_number,content,create_time,emp_id,
               status,redo_times)
        select mess_sms_seq.nextval,a_vc_BusinessType,a_vc_Mobile,a_vc_Context,sysdate,a_vc_EmpId,
               1,a_l_redotimes
           from dual;
        v_vc_ycbz := 'N';
      end if;

      error_no := 0;
      error_info := '处理成功';
    exception when others then
      --系统自动异常捕捉
      if v_vc_ycbz = 'N' then
        error_no:=-1;
        error_info := '[pkg_wskh.ApplychangeStatus.inner_proc_sendMessage]报异常错误:'||chr(13)||sqlerrm;
      end if;
      --人为考虑系统异常
      if v_vc_ycbz = 'Y' then
        error_info := error_info||chr(13)||sqlerrm;
      end if;
      --人为的制造了异常
      if v_vc_ycbz = 'C' then
        error_info := error_info;
      end if;
      null;
    end;

    procedure inner_proc_createTask(a_vc_UserId in varchar2,
                                    a_vc_TaskType in varchar2,
                                    a_vc_OrgId in varchar2,
                                    a_vc_UserName in varchar2,
                                    a_vc_EmpId in varchar2,
                                    a_vc_AppId in varchar2,
                                    a_vc_ResutComment in varchar2,
                                    error_no out number,
                                    error_info out varchar2)
    is
    /*****************
    名  称：生成审核任务
    功  能：生成审核任务
    创建者：xiaoen
    描  述：
    日  期：2015-07-28
    版  本：V1.0.0.0
    ******************/
      v_l_count number;
    begin
      select count(1)
        into v_l_count
        from dual
       where exists(select 1
                      from mess_task t
                     where t.user_id = a_vc_UserId and
                           t.task_type = a_vc_TaskType and
                           t.status = '0'); --任务未处理

      if v_l_count = 0 then --新增
        v_vc_ycbz := 'Y';
        error_no := -101;
        error_info := '[pkg_wskh.ApplychangeStatus.inner_proc_createTask]新增审核任务失败，请联系系统管理员！';
        insert into mess_task
              (task_id,task_type,create_time,user_id,org_id,user_name,status,
               anti_emp_id,app_id)
        select mess_task_seq.nextval,a_vc_TaskType,sysdate,a_vc_UserId,a_vc_OrgId,a_vc_UserName,'0',
               a_vc_EmpId, nvl(trim(a_vc_AppId),0)
          from dual;
        v_vc_ycbz := 'N';
      else --修改
        v_vc_ycbz := 'Y';
        error_no := -101;
        error_info := '[pkg_wskh.ApplychangeStatus.inner_proc_createTask]更新审核任务失败，请联系系统管理员！';
        update mess_task t
           set t.create_time = sysdate,
               t.org_id = a_vc_OrgId,
               t.anti_emp_id = a_vc_EmpId
         where t.user_id = a_vc_UserId and
               t.task_type = a_vc_TaskType and
               t.status = '0';
        v_vc_ycbz := 'N';
      end if;

      error_no := 0;
      error_info := '处理成功';
    exception when others then
      --系统自动异常捕捉
      if v_vc_ycbz = 'N' then
        error_no:=-1;
        error_info := '[pkg_wskh.ApplychangeStatus.inner_proc_createTask]报异常错误:'||chr(13)||sqlerrm;
      end if;
      --人为考虑系统异常
      if v_vc_ycbz = 'Y' then
        error_info := error_info||chr(13)||sqlerrm;
      end if;
      --人为的制造了异常
      if v_vc_ycbz = 'C' then
        error_info := error_info;
      end if;
      null;
    end;

    procedure inner_proc_modifyMessTask(a_vc_UserId in varchar2,
                                        a_vc_EmpId in varchar2,
                                        a_vc_ResutComment in varchar2,
                                        error_no out number,
                                        error_info out varchar2)
    is
    /*****************
    名  称：修改处理的复核任务状态
    功  能：修改处理的复核任务状态
    创建者：xiaoen
    描  述：
    日  期：2015-07-28
    版  本：V1.0.0.0
    ******************/
      v_l_count number;
      v_vc_taskType varchar2(10); --开户复核（用户递交）
    begin
      --修改处理的复核任务状态
      select count(1)
        into v_l_count
        from dual
       where exists(select 1
                      from mess_task t
                     where t.user_id = a_vc_UserId and
                           t.emp_id = a_vc_EmpId and
                           t.status = 2 and  --任务已经接受处理
                           t.task_type = '3'); --开户复核（用户递交）
      if v_l_count = 0 then
        v_vc_taskType :='9';--复核人员复核柜台预开户失败
      else
        v_vc_taskType := '3';--开户复核（用户递交）
      end if;

      v_vc_ycbz := 'Y';
      error_no := -101;
      error_info := '[pkg_wskh.ApplychangeStatus.inner_proc_modifyMessTask]更新审核任务失败，请联系系统管理员！';
      update mess_task t
         set t.finish_time = sysdate,
             t.status = 3, --任务处理完成
             t.result_comment = a_vc_ResutComment
       where t.user_id = a_vc_UserId and
             t.emp_id = a_vc_EmpId and
             t.status = 2 and
             t.task_type = v_vc_taskType;
      v_vc_ycbz := 'N';

      error_no := 0;
      error_info := '处理成功';
    exception when others then
      --系统自动异常捕捉
      if v_vc_ycbz = 'N' then
        error_no:=-1;
        error_info := '[pkg_wskh.ApplychangeStatus.inner_proc_createTask]报异常错误:'||chr(13)||sqlerrm;
      end if;
      --人为考虑系统异常
      if v_vc_ycbz = 'Y' then
        error_info := error_info||chr(13)||sqlerrm;
      end if;
      --人为的制造了异常
      if v_vc_ycbz = 'C' then
        error_info := error_info;
      end if;
      null;
    end;
  begin
    for cur in (select b.user_name,b.identity_code,a.mobile,c.emp_name,a.open_org_id as org_id,
                       d.name as org_name,a.open_type,a.app_id
                  from user_presence a,
                       user_id_info b,
                       base_sys_user c,
                       base_organization d
                 where a.user_id = p_vc_UserId and
                       b.user_id = p_vc_UserId and
                       c.emp_id = p_vc_EmpId and
                       a.open_org_id = d.org_id(+))
    loop
      insert into user_business_flow
            (business_id,business_type,user_id,create_time,create_by,
             create_user_name,description,status,source_detail_id,
             org_id,org_name,user_name,identity_code,mobile)
      select user_business_flow_seq.nextval,p_vc_ProxNode,p_vc_UserId,sysdate,p_vc_EmpId,
             cur.emp_name,replace(p_vc_BusinessFlowDesc,',+',','),0,p_vc_BuisnessFlowDetailId,
             cur.org_id,cur.org_name,cur.user_name,cur.identity_code,cur.mobile
        from dual;

      if p_vc_ProxNode = '33207' then --复核开户（驳回）

        v_vc_TaskFlag := '0';
        if p_vc_AuditType = 'reviewonly' then
          --生成微信审核任务
          if cur.open_type = '21' and not((instr(p_vc_BusinessFlowDesc,'账户选择错误') > 0) or (instr(p_vc_BusinessFlowDesc,'风险测评有误') > 0)) then
            --需要生成审核任务
            v_vc_TaskFlag := '1'; --需要生成审核任务
            v_vc_taskType := '20'; --复核未通过
          end if;

          --用户状态
          v_vc_userPresenceStatus := 4;--用户整改
        elsif p_vc_AuditType = 'auditandreview' then
          --需要生成审核任务
          v_vc_TaskFlag := '1'; --需要生成审核任务
          v_vc_taskType := '7'; --复核未通过

          --用户状态
          v_vc_userPresenceStatus := 7;--复核未通过
        end if;

        --需要生成审核任务
        if v_vc_TaskFlag = '1' then
          inner_proc_createTask(p_vc_UserId,v_vc_taskType,cur.org_id,cur.user_name,p_vc_EmpId,cur.app_id,p_vc_BusinessFlowDesc,error_no,error_info);
          if error_no < 0 then
            v_vc_ycbz := 'C';
            v_vc_zzyc := 'Cairenhui';
          end if;
        end if;

        --修改处理的复核任务状态
        inner_proc_modifyMessTask(p_vc_UserId,p_vc_EmpId,'复核未通过 :'||p_vc_BusinessFlowDesc,error_no,error_info);
        if error_no < 0 then
          v_vc_ycbz := 'C';
          v_vc_zzyc := 'Cairenhui';
        end if;

        --修改用户状态
        update user_presence t
           set t.status = v_vc_userPresenceStatus,
               t.user_status = 3 --审核中
         where t.user_id = p_vc_UserId;

        --发送通知短信
        --20151021 laijb mod,审核完成后，发送短信有程序单独实现了，不放到存储过程
        /*inner_proc_sendMessage(p_vc_UserId,p_vc_EmpId,cur.mobile,p_vc_smsContext,'复核未通过',1,error_no,error_info);
        if error_no < 0 then
          v_vc_ycbz := 'C';
          v_vc_zzyc := 'Cairenhui';
        end if;*/
      elsif  p_vc_ProxNode = '33229' then --任务移交
          inner_proc_createTask(p_vc_UserId,'16',cur.org_id,cur.user_name,p_vc_EmpId,cur.app_id,p_vc_BusinessFlowDesc,error_no,error_info);
          if error_no < 0 then
            v_vc_ycbz := 'C';
            v_vc_zzyc := 'Cairenhui';
          end if;
          inner_proc_modifyMessTask(p_vc_UserId,p_vc_EmpId,'移交任务通过 :'||p_vc_BusinessFlowDesc,error_no,error_info);
          if error_no < 0 then
            v_vc_ycbz := 'C';
            v_vc_zzyc := 'Cairenhui';
          end if;
      end if;
    end loop;

    error_no := 0;
    error_info := '开户变更引擎成功';
  exception when others then
    --系统自动异常捕捉
    if v_vc_ycbz = 'N' then
      error_no:=-1;
      error_info := '[pkg_wskh.pkgsp_billetl_etlstktype]报异常错误:'||chr(13)||sqlerrm;
    end if;
    --人为考虑系统异常
    if v_vc_ycbz = 'Y' then
      error_info := error_info||chr(13)||sqlerrm;
    end if;
    --人为的制造了异常
    if v_vc_ycbz = 'C' then
      error_info := error_info;
    end if;
    null;
  end pkgsp_wskh_ApplychangeStatus;

  procedure pkgsp_wskh_ReviewSubmit(p_vc_UserId in varchar2,       --复核用户号
                                    p_vc_EmpId in varchar2,        --复核人员ID
                                    p_vc_AuditFlag in varchar2,    --复核结果
                                    p_vc_ExchangeKind_Str in varchar2, --逗号分隔
                                    p_vc_StockAccount_Str in varchar2, --逗号分隔
                                    p_vc_AuditType in varchar2,  --reviewonly 只需要复核 ,auditandreview 需要审核 复核
                                    p_vc_reasonDesc_Str in varchar2, --逗号分隔
                                    p_vc_UserFlowStatus in varchar2, --开户进度状态
                                    --p_vc_PresenceUserStatus in varchar2, --用户状态
                                    --p_vc_Content in varchar2,        --复核结论
                                    p_vc_smsContext in varchar2,     --短信内容 为空则不发短信
                                    p_isOpenNewFlow  in varchar2,    --0否 1是
                                    error_no out number,
                                    error_info out varchar2)
  /**********************************************************
  名  称：复核提交
  功  能：复核提交
  创建者：xiaoen
  描  述：入参：

          出参：error_no 错误号
                error_info 错误信息
  日  期：2015-07-28
  版  本：V1.0.0.0
  ***********************************************************/
  is
    v_l_count number;
    v_l_pos_exKind number;
    v_l_pos_exAcct number;
    v_vc_exchangekind_str varchar2(100);
    v_vc_stockaccount_str varchar2(300);
    v_vc_exchangekind varchar2(10);
    v_vc_stockaccount varchar2(20);
  begin
    v_vc_ycbz := 'N';
    --M201502020029 20150312 wmy add 检查交易市场是否有下挂账号意愿，有则更新数据库
    if trim(p_vc_ExchangeKind_Str) is not null then
      v_vc_exchangekind_str := trim(p_vc_ExchangeKind_Str);
      v_vc_stockaccount_str := trim(p_vc_StockAccount_Str);

      while length(v_vc_exchangekind_str) > 0
      loop
        v_l_pos_exKind := instr(v_vc_exchangekind_str,',');
        v_l_pos_exAcct := instr(v_vc_stockaccount_str,',');

        if v_l_pos_exKind > 0 then
          v_vc_exchangekind := substr(v_vc_exchangekind_str,1,v_l_pos_exKind - 1);
          v_vc_stockaccount := substr(v_vc_stockaccount_str,1,v_l_pos_exAcct - 1);

          v_vc_exchangekind_str := substr(v_vc_exchangekind_str,v_l_pos_exKind + 1,1000);
          v_vc_stockaccount_str := substr(v_vc_stockaccount_str,v_l_pos_exAcct + 1,1000);
        else
          v_vc_exchangekind := v_vc_exchangekind_str;
          v_vc_stockaccount := v_vc_stockaccount_str;

          v_vc_exchangekind_str := '';
          v_vc_stockaccount_str := '';
        end if;

        update user_accounts t
           set t.stock_account_under = v_vc_stockaccount,
               t.biz_op_type = decode(nvl(v_vc_stockaccount,'*'),'*','1','2')   --1 新开、2 下挂
         where t.user_id = p_vc_UserId and
               t.invset_type = '1002' and  --1002 股票账户
               t.account_type = v_vc_exchangekind and
               t.apply_success_flag = '0';
      end loop;
    end if;

    if p_vc_AuditFlag = '2' then --审核通过
      --重置开户失败账号状态
      update user_accounts t
         set apply_success_flag = 0
       where t.user_id = p_vc_UserId and
             t.apply_success_flag = 2;
    elsif p_vc_AuditFlag = '1' then --需要整改
      --修改USER_AMDNDMENTS表
      if p_vc_AuditType = 'auditandreview' then
        select count(1)
          into v_l_count
          from dual
         where exists(select 1
                        from user_amendments t
                       where t.user_id = p_vc_UserId and
                             t.status = 9); --复核意见状态(UserAmendments)

        if v_l_count = 0 then
          insert into user_amendments t
                  (amendments_id,user_id,status,amendments,create_time,create_by)
            select user_amendments_seq.nextval,p_vc_UserId,9,p_vc_reasonDesc_Str,sysdate,p_vc_EmpId
              from dual;
        else
          update user_amendments t
             set t.amendments = p_vc_reasonDesc_Str,
                 t.create_time = sysdate,
                 t.create_by = p_vc_EmpId
           where t.user_id = p_vc_UserId and
                 t.status = 9;
        end if;
      end if;
       if p_vc_AuditType = 'reviewonly' then
        --更新进度
        update user_presence t
           set t.user_flow_status = p_vc_UserFlowStatus/*,
               t.status = p_vc_PresenceUserStatus*/
         where t.user_id = p_vc_UserId;

        --视频位，第三位
        if substr(p_vc_UserFlowStatus,3,1) = '4' then
          update user_video_verify t
             set t.status = '1'
           where t.user_id = p_vc_UserId;
        elsif substr(p_vc_UserFlowStatus,3,1) = '3' then
          update user_video_verify t
             set t.status = '8'
           where t.user_id = p_vc_UserId;

          update user_accounts t
             set t.apply_success_flag = '3' --用户账户注册状态 3;//账户异常
           where t.user_id = p_vc_UserId and
                 t.invset_type = '1002'; --股票账户
        end if;

       --拒绝开户位，第一位
       if substr(p_vc_UserFlowStatus,1,1) = '9' then
        if trim(p_isOpenNewFlow)='0' then
          update user_presence t
            set t.status = 13  --开户失败
          where t.user_id = p_vc_UserId;
       elsif  trim(p_isOpenNewFlow)='1' then
              update USER_VIDEO_VERIFY set status='1',video_addres='',snap_image1='',snap_image2='',snap_image3='' where user_id= p_vc_UserId;
              update USER_ID_VERIFY set status='9',validate_time=sysdate where  user_id= p_vc_UserId;
              update User_Id_Upload  set front_pic='',back_pic='',attr1='' where   user_id= p_vc_UserId;
              update user_presence set status='0'   where   user_id= p_vc_UserId;
       end if;

     end if;


     end if;
      --changeStatus 开户变更引擎 33207 复核开户（驳回）
      pkgsp_wskh_ApplychangeStatus(p_vc_UserId,33207,p_vc_EmpId,-1,p_vc_reasonDesc_Str,'',p_vc_AuditType,p_vc_smsContext,error_no,error_info); --复核开户（驳回）
      if error_no < 0 then
        v_vc_ycbz := 'C';
        v_vc_zzyc := 'Cairenhui';
      end if;
     elsif p_vc_AuditFlag = '3' then --任务移交

        select count(1)
          into v_l_count
          from dual
         where exists(select 1
                        from user_amendments t
                       where t.user_id = p_vc_UserId and
                             t.status = 9); --复核意见状态(UserAmendments)

        if v_l_count = 0 then
          insert into user_amendments t
                  (amendments_id,user_id,status,amendments,create_time,create_by)
            select user_amendments_seq.nextval,p_vc_UserId,9,p_vc_reasonDesc_Str,sysdate,p_vc_EmpId
              from dual;
        else
          update user_amendments t
             set t.amendments = p_vc_reasonDesc_Str,
                 t.create_time = sysdate,
                 t.create_by = p_vc_EmpId
           where t.user_id = p_vc_UserId and
                 t.status = 9;
        end if;
        pkgsp_wskh_ApplychangeStatus(p_vc_UserId,33229,p_vc_EmpId,-1,p_vc_reasonDesc_Str,'',p_vc_AuditType,p_vc_smsContext,error_no,error_info); --复核开户（驳回）
        if error_no < 0 then
          v_vc_ycbz := 'C';
          v_vc_zzyc := 'Cairenhui';
        end if;

    end if;

    commit;
    error_no := 0;
    error_info := '处理成功';
  exception when others then
    rollback;
    --系统自动异常捕捉
    if v_vc_ycbz = 'N' then
      error_no:=-1;
      error_info := '[pkg_wskh.pkgsp_billetl_etlstktype]报异常错误:'||chr(13)||sqlerrm;
    end if;
    --人为考虑系统异常
    if v_vc_ycbz = 'Y' then
      error_info := error_info||chr(13)||sqlerrm;
    end if;
    --人为的制造了异常
    if v_vc_ycbz = 'C' then
      error_info := error_info;
    end if;
    null;
  end pkgsp_wskh_ReviewSubmit;

  procedure pkgsp_wskh_AuditChange(p_vc_UserId in varchar2,               --修改用户ID
                                   p_vc_EmpId in varchar2,                --修改的操作员的ID
                                   p_vc_TableName in varchar2,            --修改表名
                                   p_vc_FieldName in varchar2,            --修改字段名串
                                   p_vc_FieldInfo in varchar2,            --修改业务表列信息 详情参考 front  UserProperties文件
                                   p_vc_FieldValueOld in varchar2,        --修改字段新值
                                   p_vc_FieldValueNew in varchar2,        --修改字段原值
                                   p_vc_ChangeID in varchar2, --change_id
                                   p_vc_FieldValueNew_t in varchar2,
                                   error_no out number,
                                   error_info out varchar2)
  /**********************************************************
  名  称：审核用户主动修改(单项信息)
  功  能：审核用户主动修改(单项信息)

  创建者：xiaoen
  描  述：入参：
          特殊项：当p_vc_FieldInfo 为 CRH_STOCK_ACCOUNT 或 CRH_FUND_ACCOUNT 时
                    p_vc_FieldValueNew 为  accountType,accountName;accountType,accountName;

          出参：error_no 错误号
                error_info 错误信息
  日  期：2015-07-28
  版  本：V1.0.0.0
  ***********************************************************/
  is
    v_vc_Sql varchar2(16000);
    v_l_count number;
    v_l_Pos number;
    v_vc_TmpStr varchar2(1000);
    v_vc_accountType varchar2(100);
    v_vc_accountName varchar2(200);
    v_vc_FundCompanyId number;
    v_vc_idbegindate varchar2(10);
    v_vc_idenddate varchar2(10);
    v_vc_branchId varchar2(10);

  begin
    v_vc_ycbz := 'N';

    select open_org_id into v_vc_branchId  from user_presence u where u.user_id=p_vc_UserId;
    --特殊处理数据
    if upper(p_vc_FieldInfo) = 'CRH_INDENTITY_DUE_DATE' then
      --身份证有效期 p_vc_FieldValueNew = 20090317-20150101 或者 20090317-  长期有效标志，需要根据enddate来计算
      v_l_Pos := instr(p_vc_FieldValueNew,'-');
      if v_l_Pos > 0 then
        v_vc_idbegindate := trim(substr(p_vc_FieldValueNew,1,v_l_Pos - 1));
        v_vc_idenddate := trim(substr(p_vc_FieldValueNew,v_l_Pos + 1,100));

        v_vc_ycbz := 'Y';
        error_no := -101;
        error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]更新客户身份信息表失败，请联系系统管理员！';
        update user_id_info t
           set t.delivery_date = to_date(v_vc_idbegindate,'yyyymmdd'),
               t.due_date = to_date(v_vc_idenddate,'yyyymmdd'),
               t.forever_flag = decode(nvl(v_vc_idenddate,'长期有效'),'长期有效','1','0')   --0 暂时有效 1 永久有效
         where t.user_id = p_vc_UserId;
        v_vc_ycbz :='N';
      end if;
    elsif upper(p_vc_FieldInfo) = 'CRH_STOCK_ACCOUNT' then
      --证券账户
      v_vc_ycbz := 'Y';
      error_no := -101;
      error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]删除客户开户账号表失败[CRH_STOCK_ACCOUNT]，请联系系统管理员！';
      delete from user_accounts t
            where t.user_id = p_vc_UserId and
                  t.invset_type = 1002 and
            t.apply_success_flag != 1;
      v_vc_ycbz := 'N';

      --插入未成功的 p_vc_FieldValueNew 为  accountType,accountName;accountType,accountName;
      v_vc_TmpStr := trim(p_vc_FieldValueNew);

      while trim(v_vc_TmpStr) is not null
      loop
        v_l_Pos := instr(v_vc_TmpStr,';');
      if v_l_Pos > 0 then
        v_vc_accountType := substr(v_vc_TmpStr,1,instr(v_vc_TmpStr,',') - 1);
        v_vc_accountName := substr(v_vc_TmpStr,instr(v_vc_TmpStr,',') + 1,instr(v_vc_TmpStr,';') - instr(v_vc_TmpStr,',') - 1);

        v_vc_TmpStr := substr(v_vc_TmpStr,v_l_Pos + 1,1000);
      else
        v_vc_accountType := substr(v_vc_TmpStr,1,instr(v_vc_TmpStr,',') - 1);
        v_vc_accountName := substr(v_vc_TmpStr,instr(v_vc_TmpStr,',') + 1,1000);

        v_vc_TmpStr := '';
      end if;

      v_vc_ycbz := 'Y';
      error_no := -101;
      error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]查询客户开户账号表失败[CRH_STOCK_ACCOUNT]，请联系系统管理员！';
      select count(1)
        into v_l_count
        from dual
       where exists(select 1
                      from user_accounts t
                     where t.user_id = p_vc_UserId and
                           t.invset_type = 1002 and
                           t.account_type = v_vc_accountType and
                           t.apply_success_flag = '1'); --开户成功
      v_vc_ycbz := 'N';

      if v_l_count = 0 then  --不存在成功的就新增
        v_vc_ycbz := 'Y';
        error_no := -101;
        error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]增加客户开户账号表失败[CRH_STOCK_ACCOUNT]，请联系系统管理员！';
        insert into user_accounts
               (account_id,user_id,invset_type,account_type,account_name,
                start_time,apply_success_flag,validate_flag,branch_id)
         select user_accounts_seq.nextval,p_vc_UserId,1002,v_vc_accountType,v_vc_accountName,
                sysdate,0,2,v_vc_branchId
           from dual;
        v_vc_ycbz := 'N';

      end if;
      end loop;
    elsif upper(p_vc_FieldInfo) = 'CRH_FUND_ACCOUNT' then
      --基金账户
      v_vc_ycbz := 'Y';
      error_no := -101;
      error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]删除客户开户账号表失败[CRH_FUND_ACCOUNT]，请联系系统管理员！';
      delete from user_accounts t
            where t.user_id = p_vc_UserId and
              t.invset_type = 1003 and
            t.apply_success_flag != 1;
      v_vc_ycbz := 'N';

      --插入未成功的 p_vc_FieldValueNew 为  accountType,accountName;accountType,accountName;
      v_vc_TmpStr := trim(p_vc_FieldValueNew);

      while trim(v_vc_TmpStr) is not null
      loop
        v_l_Pos := instr(v_vc_TmpStr,';');
      if v_l_Pos > 0 then
        v_vc_accountType := substr(v_vc_TmpStr,1,instr(v_vc_TmpStr,',') - 1);
        v_vc_accountName := substr(v_vc_TmpStr,instr(v_vc_TmpStr,',') + 1,instr(v_vc_TmpStr,';') - instr(v_vc_TmpStr,',') - 1);

        v_vc_TmpStr := substr(v_vc_TmpStr,v_l_Pos + 1,1000);
      else
        v_vc_accountType := substr(v_vc_TmpStr,1,instr(v_vc_TmpStr,',') - 1);
        v_vc_accountName := substr(v_vc_TmpStr,instr(v_vc_TmpStr,',') + 1,1000);

        v_vc_TmpStr := '';
      end if;

      v_vc_ycbz := 'Y';
      error_no := -101;
      error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]查询客户开户账号表失败[CRH_FUND_ACCOUNT]，请联系系统管理员！';
      select count(1)
        into v_l_count
        from dual
       where exists(select 1
                      from user_accounts t
               where t.user_id = p_vc_UserId and
                     t.invset_type = 1003 and
                 t.account_type = v_vc_accountType and
                 t.apply_success_flag = '1'); --开户成功
      v_vc_ycbz := 'N';

      if v_l_count = 0 then  --不存在成功的就新增
        --获取v_vc_BranchId，v_vc_BranchName
        select nvl(max(t.id),'')
          into v_vc_FundCompanyId
          from base_fund_company t
         where t.company_name = v_vc_accountName;

        v_vc_ycbz := 'Y';
        error_no := -101;
        error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]增加客户开户账号表失败[CRH_FUND_ACCOUNT]，请联系系统管理员！';
        insert into user_accounts
               (account_id,user_id,invset_type,account_type,account_name,
                start_time,apply_success_flag,validate_flag,
                branch_id,branch_name)
         select user_accounts_seq.nextval,p_vc_UserId,1003,v_vc_accountType,v_vc_accountName,
                sysdate,0,2,
                v_vc_FundCompanyId,v_vc_accountName
           from dual;
        v_vc_ycbz := 'N';
      end if;
      end loop;
    else
      --通用更新处理
      v_vc_Sql := 'update '||p_vc_TableName||' t set t.'||p_vc_FieldName||' = '''||p_vc_FieldValueNew||''' where t.user_id = '''||p_vc_UserId||'''';
      execute immediate v_vc_Sql;
    end if;

    /*修改user_change_detail表*/
    v_vc_ycbz := 'Y';
    error_no := -101;
    error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]查询客户修改信息表失败，请联系系统管理员！';
    select count(1)
      into v_l_count
      from dual
     where exists(select 1
                    from user_change_detail t
                   where t.change_id = p_vc_ChangeID and
                         t.field_info = p_vc_FieldInfo); --未提交
    v_vc_ycbz := 'N';

    if v_l_count = 0 then
      --不存在则新增
      v_vc_ycbz := 'Y';
      error_no := -101;
      error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]增加客户修改信息表失败，请联系系统管理员！';
      insert into user_change_detail
             (change_detail_id,change_id, field_info, old_info,
              changed_info,status,create_by,create_time,update_by,update_time)
       select user_change_detail_seq.nextval,p_vc_ChangeID,p_vc_FieldInfo,p_vc_FieldValueOld,
              trim(p_vc_FieldValueNew_t),8,p_vc_EmpId,sysdate,p_vc_EmpId,sysdate
         from dual;
      v_vc_ycbz := 'N';
    else
      v_vc_ycbz := 'Y';
      error_no := -101;
      error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]更新客户修改信息表失败，请联系系统管理员！';
      update user_change_detail t
         set t.changed_info = p_vc_FieldValueNew,
             t.status = 8,
             t.update_by = p_vc_EmpId,
             t.update_time = sysdate
       where t.change_id = p_vc_ChangeID and
             t.field_info = p_vc_FieldInfo;
      v_vc_ycbz := 'N';
    end if;

    commit;
    error_no := 0;
    error_info := '处理成功';
  exception when others then
    rollback;
    --系统自动异常捕捉
    if v_vc_ycbz = 'N' then
      error_no:=-1;
      error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]报异常错误:'||chr(13)||sqlerrm||'。v_vc_Sql = '||v_vc_Sql;
    end if;
    --人为考虑系统异常
    if v_vc_ycbz = 'Y' then
      error_info := error_info||chr(13)||sqlerrm;
    end if;
    --人为的制造了异常
    if v_vc_ycbz = 'C' then
      error_info := error_info;
    end if;
    null;
  end pkgsp_wskh_AuditChange;
  procedure pkgsp_wskh_issueAudit(p_vc_UserId       in varchar2, --修改用户ID
                                p_vc_EmpId        in varchar2, --修改的操作员的ID
                                p_vc_TaskId       in varchar2,
                                p_vc_RejectReason in varchar2, --修改字段名串
                                p_vc_ResultType   in varchar2, --修改业务表列信息 详情参考 front  UserProperties文件
                                error_no          out number,
                                error_info        out varchar2)

 is
  v_l_count             number;
  v_verify_id           varchar2(10);
  v_vc_BusinessFlowDesc varchar2(100);
  v_vc_ProxNode  varchar2(6);
  v_status varchar2(4);
begin
  select count(1)
    into v_l_count
    from dual
   where exists (select 1
            from (select 1
                    from USER_CA_VERIFY
                   where USER_ID = p_vc_UserId
                     and CA_TYPE = '1'
                     and verify_flag != '2'
                   order by VERIFY_ID desc)
           where rownum = 1);

  if v_l_count = 0 then
    --新增
    error_no   := -3;
    error_info := '[证书颁发任务信息不存在！]';
    return;
  else
    --修改
    select max(verify_id)
      into v_verify_id
      from USER_CA_VERIFY
     where USER_ID = p_vc_UserId
       and CA_TYPE = '1'
       and verify_flag != '2';

    if p_vc_ResultType = '1' then
      v_vc_BusinessFlowDesc := '证书颁发成功';
      v_vc_ProxNode := 33219;
      v_status := 2;
      update USER_CA_VERIFY t
         set t.verify_flag = 2
       where t.verify_id = v_verify_id;
    elsif p_vc_ResultType = '2' then
      v_vc_BusinessFlowDesc := '审核不通过';
      v_vc_ProxNode := 33220;
      v_status := 15;
      update USER_CA_VERIFY t
         set t.verify_flag = 1, t.reject_reason = p_vc_RejectReason
       where t.verify_id = v_verify_id;
    end if;

    update user_presence up
    set up.status = trim(v_status),
        up.last_update_time=sysdate,
        up.last_update_by = p_vc_EmpId
    where up.user_id= p_vc_UserId;

   update mess_task mt
      set mt.status         = '3',
          mt.result_comment = trim(v_vc_BusinessFlowDesc),
          mt.emp_id         = p_vc_EmpId,
          mt.emp_name      =
          (select emp_name
             from base_sys_user
            where emp_id = p_vc_EmpId
              and rownum = 1),
          mt.finish_time    = sysdate
    where mt.task_id = trim(p_vc_TaskId);

    for cur in (select b.user_name,
                       b.identity_code,
                       a.mobile,
                       c.emp_name,
                       a.open_org_id   as org_id,
                       d.name          as org_name,
                       a.open_type,
                       a.app_id
                  from user_presence     a,
                       user_id_info      b,
                       base_sys_user     c,
                       base_organization d
                 where a.user_id = p_vc_UserId
                   and b.user_id = p_vc_UserId
                   and c.emp_id = p_vc_EmpId
                   and a.open_org_id = d.org_id(+)) loop
      insert into user_business_flow
        (business_id,
         business_type,
         user_id,
         create_time,
         create_by,
         create_user_name,
         description,
         status,
         source_detail_id,
         org_id,
         org_name,
         user_name,
         identity_code,
         mobile)
        select user_business_flow_seq.nextval,
               v_vc_ProxNode,
               p_vc_UserId,
               sysdate,
               p_vc_EmpId,
               cur.emp_name,
               trim(v_vc_BusinessFlowDesc),
               0,
               null,
               cur.org_id,
               cur.org_name,
               cur.user_name,
               cur.identity_code,
               cur.mobile
          from dual;
    end loop;
  end if;

  error_no   := 0;
  error_info := '处理成功';
  commit;
end pkgsp_wskh_issueAudit;

procedure pkgsp_wskh_openFail(p_vc_UserId in varchar2, --用户ID
                                p_vc_EmpId  in varchar2,
                                error_no    out number,
                                error_info  out varchar2) is

  begin
    error_no := -1;
    for cur in (select b.user_name,
                       b.identity_code,
                       a.mobile,
                       c.emp_name,
                       a.open_org_id   as org_id,
                       d.name          as org_name,
                       a.open_type,
                       a.app_id
                  from user_presence     a,
                       user_id_info      b,
                       base_sys_user     c,
                       base_organization d
                 where a.user_id = p_vc_UserId
                   and b.user_id = p_vc_UserId
                   and c.emp_id = p_vc_EmpId
                   and a.open_org_id = d.org_id(+)) loop
      insert into user_business_flow
        (business_id,
         business_type,
         user_id,
         create_time,
         create_by,
         create_user_name,
         description,
         status,
         source_detail_id,
         org_id,
         org_name,
         user_name,
         identity_code,
         mobile)
        select user_business_flow_seq.nextval,
               '33214',
               p_vc_UserId,
               sysdate,
               p_vc_EmpId,
               cur.emp_name,
               '开户失败',
               0,
               null,
               cur.org_id,
               cur.org_name,
               cur.user_name,
               cur.identity_code,
               cur.mobile
          from dual;
    end loop;

    update user_presence up
       set up.status           = '13',
           up.last_update_time = sysdate,
           up.last_update_by   = p_vc_EmpId,
           up.end_time         = sysdate
     where up.user_id = p_vc_UserId;

    error_no   := 0;
    error_info := '处理成功';
    commit;
  end;

  /*用户接受视频*/
  procedure pkgsp_wskh_acptVideo(p_vc_UserId in varchar2, --用户ID
                                 p_vc_EmpId  in varchar2,
                                 error_no    out number,
                                 error_info  out varchar2) is
    v_rowcount number(4);
  begin

    error_no := -1;
    for cur in (select b.user_name,
                       b.identity_code,
                       a.mobile,
                       c.emp_name,
                       a.open_org_id   as org_id,
                       d.name          as org_name,
                       a.open_type,
                       a.app_id
                  from user_presence     a,
                       user_id_info      b,
                       base_sys_user     c,
                       base_organization d
                 where a.user_id = p_vc_UserId
                   and b.user_id = p_vc_UserId
                   and c.emp_id = p_vc_EmpId
                   and a.open_org_id = d.org_id(+)) loop
      insert into user_business_flow
        (business_id,
         business_type,
         user_id,
         create_time,
         create_by,
         create_user_name,
         description,
         status,
         source_detail_id,
         org_id,
         org_name,
         user_name,
         identity_code,
         mobile)
        select user_business_flow_seq.nextval,
               '33201',
               p_vc_UserId,
               sysdate,
               p_vc_EmpId,
               cur.emp_name,
               '接受视频验证',
               0,
               null,
               cur.org_id,
               cur.org_name,
               cur.user_name,
               cur.identity_code,
               cur.mobile
          from dual;

      select count(*)
        into v_rowcount
        from mess_task mt
       where mt.user_id = p_vc_UserId
         and mt.task_type = '1'
         and mt.status = 0;

      if v_rowcount > 0 then
        update mess_task mt
           set mt.create_time = sysdate, mt.org_id = cur.org_id,
           mt.deal_time = sysdate,mt.emp_id = trim(p_vc_EmpId),
           mt.emp_name = trim(cur.emp_name),mt.app_id = trim(cur.app_id),
           mt.status = '2'
         where mt.user_id = p_vc_UserId
           and mt.task_type = '1'
           and mt.status = 0;
      else
        insert into mess_task
          (task_id,
           task_type,
           create_time,
           user_id,
           user_name,
           org_id,
           emp_id,
           emp_name,
           deal_time,
           app_id,
           status)
        values
          (mess_task_seq.nextval,
           '1',
           sysdate,
           trim(p_vc_UserId),
           cur.user_name,
           cur.org_id,
           trim(p_vc_EmpId),
           trim(cur.emp_name),
           sysdate,
           cur.app_id,
           '2');
      end if;
    end loop;
    error_no   := 0;
    error_info := '处理成功';
    commit;
  end;

  procedure pkgsp_wskh_FinishVideo(p_vc_UserId    in varchar2, --用户ID
                                   p_vc_EmpId     in varchar2,
                                   p_success_flag in varchar2,
                                   p_cert_flag    in varchar2,
                                   error_no       out number,
                                   error_info     out varchar2) is

    v_videoStatus varchar2(4);
    v_proxNode    varchar2(8);
    v_reasonStr   varchar2(200);
    v_TaskID      number(14);
    v_rowCount    number(4);
  begin
    error_no := -1;
    select count(1)
      into v_rowCount
      from mess_task mt
     where mt.user_id = trim(p_vc_UserId)
       and mt.emp_id = trim(p_vc_EmpId)
       and mt.task_type = '1'
       and mt.status = '2';
    if v_rowCount > 0 then
      select max(mt.task_id)
        into v_TaskID
        from mess_task mt
       where mt.user_id = trim(p_vc_UserId)
         and mt.emp_id = trim(p_vc_EmpId)
         and mt.task_type = '1'
         and mt.status = '2';
    end if;

    if trim(p_success_flag) <> '1' then
      v_proxNode := '33221';
      for cur in (select b.user_name,
                         b.identity_code,
                         a.mobile,
                         c.emp_name,
                         a.open_org_id   as org_id,
                         d.name          as org_name,
                         a.open_type,
                         a.app_id
                    from user_presence     a,
                         user_id_info      b,
                         base_sys_user     c,
                         base_organization d
                   where a.user_id = p_vc_UserId
                     and b.user_id = p_vc_UserId
                     and c.emp_id = p_vc_EmpId
                     and a.open_org_id = d.org_id(+)) loop
        insert into user_business_flow
          (business_id,
           business_type,
           user_id,
           create_time,
           create_by,
           create_user_name,
           description,
           status,
           source_detail_id,
           org_id,
           org_name,
           user_name,
           identity_code,
           mobile)
          select user_business_flow_seq.nextval,
                 v_proxNode,
                 p_vc_UserId,
                 sysdate,
                 p_vc_EmpId,
                 cur.emp_name,
                 '完成视频验证',
                 0,
                 ' ',
                 cur.org_id,
                 cur.org_name,
                 cur.user_name,
                 cur.identity_code,
                 cur.mobile
            from dual;
      end loop;
    else
      v_proxNode  := '33203';
      v_reasonStr := '完成视频验证';

      select count(*)
            into v_rowCount
            from user_ca_verify ucv
           where ucv.user_id = trim(p_vc_userId)
             and ucv.ca_type = '1';
             --and trim(ucv.ca_cert) is not null
             --and ucv.verify_flag = 2;
      if v_rowCount <= 0 then
        insert into user_ca_verify(verify_id,user_id,setup_flag,verify_flag,ca_type)
        values(user_ca_verify_seq.nextval, trim(p_vc_userID),0,0,1 );

      else
        update user_ca_verify
        set setup_flag= 0,
        verify_flag = 0
        where user_id = trim(p_vc_userId)
             and ca_type = '1'
             and verify_flag <> '2';

      end if;

      for cur in (select b.user_name,
                         b.identity_code,
                         a.mobile,
                         c.emp_name,
                         a.open_org_id   as org_id,
                         d.name          as org_name,
                         a.open_type,
                         a.app_id
                    from user_presence     a,
                         user_id_info      b,
                         base_sys_user     c,
                         base_organization d
                   where a.user_id = p_vc_UserId
                     and b.user_id = p_vc_UserId
                     and c.emp_id = p_vc_EmpId
                     and a.open_org_id = d.org_id(+)) loop
        insert into user_business_flow
          (business_id,
           business_type,
           user_id,
           create_time,
           create_by,
           create_user_name,
           description,
           status,
           source_detail_id,
           org_id,
           org_name,
           user_name,
           identity_code,
           mobile)
          select user_business_flow_seq.nextval,
                 v_proxNode,
                 p_vc_UserId,
                 sysdate,
                 p_vc_EmpId,
                 cur.emp_name,
                 '完成视频验证',
                 0,
                 (select max(verify_id) from user_video_verify where user_id = trim(p_vc_userId)),
                 cur.org_id,
                 cur.org_name,
                 cur.user_name,
                 cur.identity_code,
                 cur.mobile
            from dual;
        update mess_task mt
           set mt.finish_time    = sysdate,
               --mt.org_id         = cur.org_id,
               mt.status         = '3',
               mt.result_comment = '通过'
         where mt.task_id = v_TaskID;

        if trim(p_cert_flag) = '1' then
          select count(*)
            into v_rowCount
            from user_ca_verify ucv
           where ucv.user_id = trim(p_vc_userId)
             and ucv.ca_type = '1'
             and trim(ucv.ca_cert) is not null
             and ucv.verify_flag = 2;
          --如果没有有效的数字证书，则生成一笔数字证书的任务
          if v_rowCount <= 0 then
            select count(*)
              into v_rowCount
              from mess_task
             where user_id = trim(p_vc_UserId)
               and task_type = '5'
               and status = '0';
            if v_rowCount = 0 then
              insert into mess_task
                (task_id,
                 task_type,
                 create_time,
                 user_id,
                 user_name,
                 org_id,
                 anti_emp_id,
                 app_id,
                 status,
                 locked_flag)
              values
                (mess_task_seq.nextval,
                 '5',
                 sysdate,
                 trim(p_vc_UserId),
                 cur.user_name,
                 cur.org_id,
                 trim(p_vc_EmpId),
                 cur.app_id,
                 '0',
                 '0');
            else
              update mess_task
                 set create_time = sysdate,
                     org_id      = cur.org_id,
                     anti_emp_id = trim(p_vc_EmpId)
               where user_id = trim(p_vc_UserId)
                 and task_type = '5'
                 and status = '0';
            end if;

            update user_presence up
               set up.status          = 1,
                   up.identified_flag = '1',
                   up.source_type     = '2',
                   up.source_detail_id = (select max(verify_id) from user_video_verify where user_id = trim(p_vc_userId))
             where up.user_id = trim(p_vc_UserId);
          end if;
        else
          update user_presence up
             set up.status          = 2,
                 up.identified_flag = '1',
                 up.source_type     = '2',
                 up.source_detail_id = (select max(verify_id) from user_video_verify where user_id = trim(p_vc_userId))
           where up.user_id = trim(p_vc_UserId);

          update user_ca_verify ucv
             set ucv.verify_flag = '2'
           where ucv.user_id = trim(p_vc_userId)
             and ucv.ca_type = '1';
        end if;
      end loop;

    end if;

    error_no   := 0;
    error_info := '处理成功';
    commit;
  end;


end PKG_WSKH;
