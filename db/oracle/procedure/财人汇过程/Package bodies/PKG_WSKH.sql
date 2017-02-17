create or replace package body PKG_WSKH is
  /*�����ȫ�ֵı���*/
  v_vc_zzyc   varchar2(1) := '';  --�����쳣
  v_vc_ycbz   varchar2(1);       --�쳣��־ N:ϵͳ�Զ��쳣��׽ Y:��Ϊ����ϵͳ�쳣 C:��Ϊ���������쳣

  procedure pkgsp_wskh_userRegByMobile(p_mobile       in varchar2,
                                       p_open_type    in varchar2,
                                       p_register_way in varchar2,
                                       p_app_id       in varchar2,
                                       p_ip_address   in varchar2,
                                       p_op_station   in varchar2,
                                       p_user_id      out varchar2,
                                       error_no       out number,
                                       error_info     out varchar2) is
    /* ���巽���ڵ���ʱ���� */
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
      error_info := '���ֻ�������ע�ᣬ�������ٴ�ע�ᡣ';
      return;
    end if;

    select count(*)
      into v_count
      from user_profile up
     where up.mobile = trim(p_mobile);
    if v_count > 0 then
      error_no   := 10000;
      error_info := '���ֻ�������ע�ᣬ�������ٴ�ע�ᡣ';
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
        error_info := '����ǰ̨�û���ʧ��[user_profile][mobile=' || trim(p_mobile) || ']';
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
        error_info := '����ǰ̨�û���ʧ��[user_presence][mobile=' || trim(p_mobile) ||
                      ';user_id=' || p_user_id || ']';
        rollback;
        return;
    end;
    commit;
  end pkgsp_wskh_userRegByMobile;

  --��ȡ������񡢻�ȡ��������
  procedure pkgsp_wskh_MessTaskFetch(p_audit_type in varchar2, -- 1-��ˡ� 2-����
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
      error_info := '�����������[p_audit_type=' || trim(p_audit_type) || ']';
      return;
    end if;

    select count(*)
      into v_count
      from user_presence up
     where up.user_id = trim(p_user_id);

    if v_count <= 0 then
      error_no   := 10001;
      error_info := '�ͻ��Ų�����[user_id=' || trim(p_user_id) || ']';
      return;
    end if;

    error_no   := 0;
    error_info := '';
    --task_type --2-������� 3- ��������
    if '1' = p_audit_type then
      --v_task_type   := ',2,6,7,';
      v_task_status := '2'; --������
      v_status      := '3'; --�����7
      v_user_status := '3'; --�����
    else
      --v_task_type   := ',3,';
      v_task_status := '2'; -- ������
      v_status      := '5'; --������
      v_user_status := '3'; --�����
    end if;

    select count(*)
      into v_count
      from mess_task mt
     where mt.task_id = trim(p_task_id);
       --and instr(v_task_type, ',' || mt.task_type || ',') > 0; -- mt.task_type in (v_task_type);
    if v_count <= 0 then
      error_no   := 10022;
      error_info := '���������Ϣ������[task_id=' || trim(p_task_id) || ']';
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
        error_info := '���������״̬ʧ��';
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
        error_info := '�����û���չ��Ϣ��״̬ʧ��';
        rollback;
        return;
    end;

    commit;
  end pkgsp_wskh_MessTaskFetch;

  /*������ɫ�� ����func_role ����func_role_resource*/
  procedure pkgsp_wskh_AddRole(p_role_code       in varchar2,
                               p_role_name       in varchar2,
                               p_memo            in varchar2,
                               p_org_id_str      in varchar2, --�����Ӣ�Ķ��ŷָ�
                               p_resource_id_str in varchar2, --�����ԴȨ����Ӣ�Ķ��ŷָ�
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
     error_info := '��ɫ�Ѵ���[role_code=' || trim(p_role_code) || ']';
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
       error_info := '���ӽ�ɫ��ʧ��';
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
         error_info := 'ɾ����ɫ��Դ��ϵ��ʧ��';
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
                                               ROLE_ID��
                 values( func_role_resource_seq.nextval,
                                               trim(v_res_id),
                                               trim(v_role_id));
        exception
          when others then
          error_no   := 11111113;
          error_info := '���ӽ�ɫ��Դ��ϵ��ʧ��';
          rollback;
          return;
        end;
     end if;

    END LOOP;
    commit;
  end pkgsp_wskh_AddRole;

  --��ɫ�޸ģ� �޸�func_role ����func_role_resource
  procedure pkgsp_wskh_UpdateRole(p_role_id         in varchar2,
                                  p_role_code       in varchar2,
                                  p_role_name       in varchar2,
                                  p_memo            in varchar2,
                                  p_org_id_str      in varchar2, --�����Ӣ�Ķ��ŷָ�
                                  p_resource_id_str in varchar2, --�����ԴȨ����Ӣ�Ķ��ŷָ�
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
       error_info := '�޸Ľ�ɫ��ʧ��[role_id='||trim(p_role_id) ||']';
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
            error_info := 'ɾ����ɫ��Դ��ϵ��ʧ��';
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
                                               ROLE_ID��
                 values( func_role_resource_seq.nextval,
                                               trim(v_res_id),
                                               trim(p_role_id));
        exception
          when others then
          error_no   := 11111113;
          error_info := '���ӽ�ɫ��Դ��ϵ��ʧ��';
          rollback;
          return;
        end;
     end if;

    END LOOP;
    commit;
  end pkgsp_wskh_UpdateRole;

  --��˸��˻�ȡ������Ϣ���û���ϸ��Ϣ
  procedure pkgsp_wskh_MessTaskQry(p_user_id                    in varchar2,
                                   p_task_id                    in varchar2,
                                   p_revisit_paper_id           in varchar2, --�ط��ʾ����� 1-�ط��ʾ�
                                   cur_audit_mess_task          out myrctype, --����ĸ�������
                                   cur_mess_task                out myrctype, --��ǰ����
                                   cur_pre_mess_task            out myrctype, --�ϴ�����
                                   cur_user_amendments          out myrctype, --�������
                                   cur_user_id_info             out myrctype, --�û������Ϣ
                                   cur_user_presence            out myrctype, --�û���չ��Ϣ
                                   cur_user_id_upload           out myrctype, --�û����֤ͼƬ�ϴ���Ϣ
                                   cur_user_video_verify        out myrctype, --��Ƶ��֤
                                   cur_user_bank_verify         out myrctype, --������֤
                                   cur_user_id_verify           out myrctype, --����ϵͳ��֤
                                   cur_exam_test_result_1       out myrctype, --����������
                                   cur_exam_test_result_n       out myrctype, --�۹�ͨ����
                                   cur_user_agreement_sign      out myrctype, --Э��ǩ��
                                   cur_user_accounts            out myrctype, --ѡ����˻�
                                   cur_user_third_deposity      out myrctype, --�������
                                   cur_exam_test_result_x       out myrctype, --��Ʊ��Ѻ�����ʾ�
                                   cur_revisit_question         out myrctype, --�ط��ʾ���Ŀ
                                   cur_revisit_question_options out myrctype, --�ط��ʾ�ѡ����
                                   cur_channel_define           out myrctype, --��������
                                   cur_user_revisit             out myrctype, --�û��ط��ʾ������
                                   error_no                     out number,
                                   error_info                   out varchar2) is
    v_revisit_paper_id varchar2(4);
  begin
    if (trim(p_user_id) is null) or (trim(p_task_id) is null) then
      error_no   := 100012;
      error_info := '�����������[p_user_id=' || trim(p_user_id) || ',p_task_id=' ||
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

  --�������ͨ��
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
       '�����������ͨ��',
       '01',
       null,
       v_org_id,
       v_org_name,
       v_user_name,
       v_identity_code,
       v_mobile);

    update mess_task mt
       set mt.status         = '3',
           mt.result_comment = '�����������ͨ��',
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
                                       p_isOpenNewFlow  in varchar2,  --0�� 1��
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
    --1������״̬ user_profile_change
    update user_profile_change upc
       set upc.status      = '1',
           upc.update_time = sysdate,
           upc.update_by   = trim(p_emp_id)
     where upc.change_user_id = trim(p_user_id)
       and upc.status = '0';
    --2������ user_business_flow
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
    --3����������״̬��3-���δͨ��
    update mess_task mt
       set mt.status         = '3',
           mt.result_comment = '���δͨ��' || p_result_comment,
           mt.emp_id         = p_emp_id,
           mt.emp_name       = v_emp_name,
           mt.finish_time    = sysdate
     where mt.task_id = trim(p_task_id);
    --4�������û���չ��Ϣ
    update user_presence up
       set up.status           = '4',
           up.user_status      = '3',
           up.user_flow_status = nvl(trim(p_flow_status),
                                     up.user_flow_status),
           up.last_update_time = sysdate,
           up.last_update_by   = trim(p_emp_id)
     where up.user_id = trim(p_user_id);
    --5������p_flow_status��������������Ӧ��ṹ�м�¼��״̬
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
            set t.status = 13  --����ʧ��
          where t.user_id = p_user_id;
       elsif  trim(p_isOpenNewFlow)='1' then
              update USER_VIDEO_VERIFY set status='1',video_addres='',snap_image1='',snap_image2='',snap_image3='' where user_id= p_user_id;
              update USER_ID_VERIFY set status='9',validate_time=sysdate where  user_id= p_user_id;
              update User_Id_Upload  set front_pic='',back_pic='',attr1='' where   user_id= p_user_id;
              update user_presence set status='0'   where   user_id= p_user_id;
       end if;

     end if;

  end pkgsp_wskh_TaskAuditReject;

  procedure pkgsp_wskh_PubExec(p_vc_SqlBlock in varchar2,  --����sql�飬֧�ִ�����SQL
                               p_vc_SplitStr in varchar2,  --sql�ָ��ַ���������Ĭ���Էֺŷָ�
                               error_no out number,
                               error_info out varchar2)
  /**********************************************************
  ��  �ƣ�ͨ��SQLִ��
  ��  �ܣ�ͨ��SQLִ��
          ֧�ִ�����SQL���ѷֺŷָ�
  �����ߣ�xiaoen
  ��  ������Σ�p_vc_SqlBlock SQL����
                p_vc_SplitStr SQL�ָ�����Ĭ���Էֺŷָ�

          ���Σ�error_no �����
                error_info ������Ϣ
  ��  �ڣ�2015-07-28
  ��  ����V1.0.0.0
  ***********************************************************/
  is
    v_vc_SplitStr varchar2(10);--�ָ���
    v_l_Pos number;
    v_vc_SqlBlock varchar2(16000);
    v_vc_Sql varchar2(16000);
  begin
    v_vc_ycbz := 'N';

    if trim(p_vc_SplitStr) is null then
      v_vc_SplitStr := ';'; --Ĭ�Ϸֺŷָ�
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
    error_info := '����ɹ�';
  exception when others then
    rollback;
    --ϵͳ�Զ��쳣��׽
    if v_vc_ycbz = 'N' then
      error_no:=-1;
      error_info := '[pkg_wskh.pkgsp_wskh_PubExec]���쳣����:'||chr(13)||sqlerrm||'��v_vc_Sql = '||v_vc_Sql;
    end if;
    --��Ϊ����ϵͳ�쳣
    if v_vc_ycbz = 'Y' then
      error_info := error_info||chr(13)||sqlerrm;
    end if;
    --��Ϊ���������쳣
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
  ��  �ƣ������������
  ��  �ܣ������������
  �����ߣ�xiaoen
  ��  ������Σ�p_vc_userId ��ǰ������û�
                p_vc_proxNode ҵ����� �ο� @ProgressNodes �ļ�
                p_vc_empId ������ԱID Ҳ�������û�����
                p_vc_taskId ����˲����漰ϵͳ������Ҫ�������״̬
                p_vc_BusinessFlowDesc ��¼ҵ����־��Ҫ����������Ϣ
                p_vc_BuisnessFlowDetailId ��¼ҵ����־ʱ����ҪһЩ������Ϣ�������û�����ʱ����Ҫ��user_profile_change.change_id���룬�Ա�ϵͳ����
                p_vc_AuditType �������� ��reviewonly,auditandreview��
                p_vc_smsContext �������� Ϊ���򲻷�����

          ���Σ�error_no �����
                error_info ������Ϣ

  ��  �ڣ�2015-07-28
  ��  ����V1.0.0.0
  ***********************************************************/
  is
    v_l_count number;
    v_vc_TaskFlag number;--�Ƿ������������ 0 ������ 1 ����
    v_vc_taskType varchar2(20);--���������������
    v_vc_userPresenceStatus number; --�޸��û�״̬

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
    ��  �ƣ����Ͷ���
    ��  �ܣ����Ͷ���
    �����ߣ�xiaoen
    ��  ����
    ��  �ڣ�2015-07-28
    ��  ����V1.0.0.0
    ******************/
    begin
      --����֪ͨ����, �������򲻷���
      if trim(a_vc_Context) is not null then
        v_vc_ycbz := 'Y';
        error_no := -101;
        error_info := '[pkg_wskh.ApplychangeStatus.inner_proc_sendMessage]���ŷ���ʧ�ܣ�����ϵϵͳ����Ա��';
        insert into mess_sms
              (mess_id,business_type,tel_number,content,create_time,emp_id,
               status,redo_times)
        select mess_sms_seq.nextval,a_vc_BusinessType,a_vc_Mobile,a_vc_Context,sysdate,a_vc_EmpId,
               1,a_l_redotimes
           from dual;
        v_vc_ycbz := 'N';
      end if;

      error_no := 0;
      error_info := '����ɹ�';
    exception when others then
      --ϵͳ�Զ��쳣��׽
      if v_vc_ycbz = 'N' then
        error_no:=-1;
        error_info := '[pkg_wskh.ApplychangeStatus.inner_proc_sendMessage]���쳣����:'||chr(13)||sqlerrm;
      end if;
      --��Ϊ����ϵͳ�쳣
      if v_vc_ycbz = 'Y' then
        error_info := error_info||chr(13)||sqlerrm;
      end if;
      --��Ϊ���������쳣
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
    ��  �ƣ������������
    ��  �ܣ������������
    �����ߣ�xiaoen
    ��  ����
    ��  �ڣ�2015-07-28
    ��  ����V1.0.0.0
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
                           t.status = '0'); --����δ����

      if v_l_count = 0 then --����
        v_vc_ycbz := 'Y';
        error_no := -101;
        error_info := '[pkg_wskh.ApplychangeStatus.inner_proc_createTask]�����������ʧ�ܣ�����ϵϵͳ����Ա��';
        insert into mess_task
              (task_id,task_type,create_time,user_id,org_id,user_name,status,
               anti_emp_id,app_id)
        select mess_task_seq.nextval,a_vc_TaskType,sysdate,a_vc_UserId,a_vc_OrgId,a_vc_UserName,'0',
               a_vc_EmpId, nvl(trim(a_vc_AppId),0)
          from dual;
        v_vc_ycbz := 'N';
      else --�޸�
        v_vc_ycbz := 'Y';
        error_no := -101;
        error_info := '[pkg_wskh.ApplychangeStatus.inner_proc_createTask]�����������ʧ�ܣ�����ϵϵͳ����Ա��';
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
      error_info := '����ɹ�';
    exception when others then
      --ϵͳ�Զ��쳣��׽
      if v_vc_ycbz = 'N' then
        error_no:=-1;
        error_info := '[pkg_wskh.ApplychangeStatus.inner_proc_createTask]���쳣����:'||chr(13)||sqlerrm;
      end if;
      --��Ϊ����ϵͳ�쳣
      if v_vc_ycbz = 'Y' then
        error_info := error_info||chr(13)||sqlerrm;
      end if;
      --��Ϊ���������쳣
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
    ��  �ƣ��޸Ĵ���ĸ�������״̬
    ��  �ܣ��޸Ĵ���ĸ�������״̬
    �����ߣ�xiaoen
    ��  ����
    ��  �ڣ�2015-07-28
    ��  ����V1.0.0.0
    ******************/
      v_l_count number;
      v_vc_taskType varchar2(10); --�������ˣ��û��ݽ���
    begin
      --�޸Ĵ���ĸ�������״̬
      select count(1)
        into v_l_count
        from dual
       where exists(select 1
                      from mess_task t
                     where t.user_id = a_vc_UserId and
                           t.emp_id = a_vc_EmpId and
                           t.status = 2 and  --�����Ѿ����ܴ���
                           t.task_type = '3'); --�������ˣ��û��ݽ���
      if v_l_count = 0 then
        v_vc_taskType :='9';--������Ա���˹�̨Ԥ����ʧ��
      else
        v_vc_taskType := '3';--�������ˣ��û��ݽ���
      end if;

      v_vc_ycbz := 'Y';
      error_no := -101;
      error_info := '[pkg_wskh.ApplychangeStatus.inner_proc_modifyMessTask]�����������ʧ�ܣ�����ϵϵͳ����Ա��';
      update mess_task t
         set t.finish_time = sysdate,
             t.status = 3, --���������
             t.result_comment = a_vc_ResutComment
       where t.user_id = a_vc_UserId and
             t.emp_id = a_vc_EmpId and
             t.status = 2 and
             t.task_type = v_vc_taskType;
      v_vc_ycbz := 'N';

      error_no := 0;
      error_info := '����ɹ�';
    exception when others then
      --ϵͳ�Զ��쳣��׽
      if v_vc_ycbz = 'N' then
        error_no:=-1;
        error_info := '[pkg_wskh.ApplychangeStatus.inner_proc_createTask]���쳣����:'||chr(13)||sqlerrm;
      end if;
      --��Ϊ����ϵͳ�쳣
      if v_vc_ycbz = 'Y' then
        error_info := error_info||chr(13)||sqlerrm;
      end if;
      --��Ϊ���������쳣
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

      if p_vc_ProxNode = '33207' then --���˿��������أ�

        v_vc_TaskFlag := '0';
        if p_vc_AuditType = 'reviewonly' then
          --����΢���������
          if cur.open_type = '21' and not((instr(p_vc_BusinessFlowDesc,'�˻�ѡ�����') > 0) or (instr(p_vc_BusinessFlowDesc,'���ղ�������') > 0)) then
            --��Ҫ�����������
            v_vc_TaskFlag := '1'; --��Ҫ�����������
            v_vc_taskType := '20'; --����δͨ��
          end if;

          --�û�״̬
          v_vc_userPresenceStatus := 4;--�û�����
        elsif p_vc_AuditType = 'auditandreview' then
          --��Ҫ�����������
          v_vc_TaskFlag := '1'; --��Ҫ�����������
          v_vc_taskType := '7'; --����δͨ��

          --�û�״̬
          v_vc_userPresenceStatus := 7;--����δͨ��
        end if;

        --��Ҫ�����������
        if v_vc_TaskFlag = '1' then
          inner_proc_createTask(p_vc_UserId,v_vc_taskType,cur.org_id,cur.user_name,p_vc_EmpId,cur.app_id,p_vc_BusinessFlowDesc,error_no,error_info);
          if error_no < 0 then
            v_vc_ycbz := 'C';
            v_vc_zzyc := 'Cairenhui';
          end if;
        end if;

        --�޸Ĵ���ĸ�������״̬
        inner_proc_modifyMessTask(p_vc_UserId,p_vc_EmpId,'����δͨ�� :'||p_vc_BusinessFlowDesc,error_no,error_info);
        if error_no < 0 then
          v_vc_ycbz := 'C';
          v_vc_zzyc := 'Cairenhui';
        end if;

        --�޸��û�״̬
        update user_presence t
           set t.status = v_vc_userPresenceStatus,
               t.user_status = 3 --�����
         where t.user_id = p_vc_UserId;

        --����֪ͨ����
        --20151021 laijb mod,�����ɺ󣬷��Ͷ����г��򵥶�ʵ���ˣ����ŵ��洢����
        /*inner_proc_sendMessage(p_vc_UserId,p_vc_EmpId,cur.mobile,p_vc_smsContext,'����δͨ��',1,error_no,error_info);
        if error_no < 0 then
          v_vc_ycbz := 'C';
          v_vc_zzyc := 'Cairenhui';
        end if;*/
      elsif  p_vc_ProxNode = '33229' then --�����ƽ�
          inner_proc_createTask(p_vc_UserId,'16',cur.org_id,cur.user_name,p_vc_EmpId,cur.app_id,p_vc_BusinessFlowDesc,error_no,error_info);
          if error_no < 0 then
            v_vc_ycbz := 'C';
            v_vc_zzyc := 'Cairenhui';
          end if;
          inner_proc_modifyMessTask(p_vc_UserId,p_vc_EmpId,'�ƽ�����ͨ�� :'||p_vc_BusinessFlowDesc,error_no,error_info);
          if error_no < 0 then
            v_vc_ycbz := 'C';
            v_vc_zzyc := 'Cairenhui';
          end if;
      end if;
    end loop;

    error_no := 0;
    error_info := '�����������ɹ�';
  exception when others then
    --ϵͳ�Զ��쳣��׽
    if v_vc_ycbz = 'N' then
      error_no:=-1;
      error_info := '[pkg_wskh.pkgsp_billetl_etlstktype]���쳣����:'||chr(13)||sqlerrm;
    end if;
    --��Ϊ����ϵͳ�쳣
    if v_vc_ycbz = 'Y' then
      error_info := error_info||chr(13)||sqlerrm;
    end if;
    --��Ϊ���������쳣
    if v_vc_ycbz = 'C' then
      error_info := error_info;
    end if;
    null;
  end pkgsp_wskh_ApplychangeStatus;

  procedure pkgsp_wskh_ReviewSubmit(p_vc_UserId in varchar2,       --�����û���
                                    p_vc_EmpId in varchar2,        --������ԱID
                                    p_vc_AuditFlag in varchar2,    --���˽��
                                    p_vc_ExchangeKind_Str in varchar2, --���ŷָ�
                                    p_vc_StockAccount_Str in varchar2, --���ŷָ�
                                    p_vc_AuditType in varchar2,  --reviewonly ֻ��Ҫ���� ,auditandreview ��Ҫ��� ����
                                    p_vc_reasonDesc_Str in varchar2, --���ŷָ�
                                    p_vc_UserFlowStatus in varchar2, --��������״̬
                                    --p_vc_PresenceUserStatus in varchar2, --�û�״̬
                                    --p_vc_Content in varchar2,        --���˽���
                                    p_vc_smsContext in varchar2,     --�������� Ϊ���򲻷�����
                                    p_isOpenNewFlow  in varchar2,    --0�� 1��
                                    error_no out number,
                                    error_info out varchar2)
  /**********************************************************
  ��  �ƣ������ύ
  ��  �ܣ������ύ
  �����ߣ�xiaoen
  ��  ������Σ�

          ���Σ�error_no �����
                error_info ������Ϣ
  ��  �ڣ�2015-07-28
  ��  ����V1.0.0.0
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
    --M201502020029 20150312 wmy add ��齻���г��Ƿ����¹��˺���Ը������������ݿ�
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
               t.biz_op_type = decode(nvl(v_vc_stockaccount,'*'),'*','1','2')   --1 �¿���2 �¹�
         where t.user_id = p_vc_UserId and
               t.invset_type = '1002' and  --1002 ��Ʊ�˻�
               t.account_type = v_vc_exchangekind and
               t.apply_success_flag = '0';
      end loop;
    end if;

    if p_vc_AuditFlag = '2' then --���ͨ��
      --���ÿ���ʧ���˺�״̬
      update user_accounts t
         set apply_success_flag = 0
       where t.user_id = p_vc_UserId and
             t.apply_success_flag = 2;
    elsif p_vc_AuditFlag = '1' then --��Ҫ����
      --�޸�USER_AMDNDMENTS��
      if p_vc_AuditType = 'auditandreview' then
        select count(1)
          into v_l_count
          from dual
         where exists(select 1
                        from user_amendments t
                       where t.user_id = p_vc_UserId and
                             t.status = 9); --�������״̬(UserAmendments)

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
        --���½���
        update user_presence t
           set t.user_flow_status = p_vc_UserFlowStatus/*,
               t.status = p_vc_PresenceUserStatus*/
         where t.user_id = p_vc_UserId;

        --��Ƶλ������λ
        if substr(p_vc_UserFlowStatus,3,1) = '4' then
          update user_video_verify t
             set t.status = '1'
           where t.user_id = p_vc_UserId;
        elsif substr(p_vc_UserFlowStatus,3,1) = '3' then
          update user_video_verify t
             set t.status = '8'
           where t.user_id = p_vc_UserId;

          update user_accounts t
             set t.apply_success_flag = '3' --�û��˻�ע��״̬ 3;//�˻��쳣
           where t.user_id = p_vc_UserId and
                 t.invset_type = '1002'; --��Ʊ�˻�
        end if;

       --�ܾ�����λ����һλ
       if substr(p_vc_UserFlowStatus,1,1) = '9' then
        if trim(p_isOpenNewFlow)='0' then
          update user_presence t
            set t.status = 13  --����ʧ��
          where t.user_id = p_vc_UserId;
       elsif  trim(p_isOpenNewFlow)='1' then
              update USER_VIDEO_VERIFY set status='1',video_addres='',snap_image1='',snap_image2='',snap_image3='' where user_id= p_vc_UserId;
              update USER_ID_VERIFY set status='9',validate_time=sysdate where  user_id= p_vc_UserId;
              update User_Id_Upload  set front_pic='',back_pic='',attr1='' where   user_id= p_vc_UserId;
              update user_presence set status='0'   where   user_id= p_vc_UserId;
       end if;

     end if;


     end if;
      --changeStatus ����������� 33207 ���˿��������أ�
      pkgsp_wskh_ApplychangeStatus(p_vc_UserId,33207,p_vc_EmpId,-1,p_vc_reasonDesc_Str,'',p_vc_AuditType,p_vc_smsContext,error_no,error_info); --���˿��������أ�
      if error_no < 0 then
        v_vc_ycbz := 'C';
        v_vc_zzyc := 'Cairenhui';
      end if;
     elsif p_vc_AuditFlag = '3' then --�����ƽ�

        select count(1)
          into v_l_count
          from dual
         where exists(select 1
                        from user_amendments t
                       where t.user_id = p_vc_UserId and
                             t.status = 9); --�������״̬(UserAmendments)

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
        pkgsp_wskh_ApplychangeStatus(p_vc_UserId,33229,p_vc_EmpId,-1,p_vc_reasonDesc_Str,'',p_vc_AuditType,p_vc_smsContext,error_no,error_info); --���˿��������أ�
        if error_no < 0 then
          v_vc_ycbz := 'C';
          v_vc_zzyc := 'Cairenhui';
        end if;

    end if;

    commit;
    error_no := 0;
    error_info := '����ɹ�';
  exception when others then
    rollback;
    --ϵͳ�Զ��쳣��׽
    if v_vc_ycbz = 'N' then
      error_no:=-1;
      error_info := '[pkg_wskh.pkgsp_billetl_etlstktype]���쳣����:'||chr(13)||sqlerrm;
    end if;
    --��Ϊ����ϵͳ�쳣
    if v_vc_ycbz = 'Y' then
      error_info := error_info||chr(13)||sqlerrm;
    end if;
    --��Ϊ���������쳣
    if v_vc_ycbz = 'C' then
      error_info := error_info;
    end if;
    null;
  end pkgsp_wskh_ReviewSubmit;

  procedure pkgsp_wskh_AuditChange(p_vc_UserId in varchar2,               --�޸��û�ID
                                   p_vc_EmpId in varchar2,                --�޸ĵĲ���Ա��ID
                                   p_vc_TableName in varchar2,            --�޸ı���
                                   p_vc_FieldName in varchar2,            --�޸��ֶ�����
                                   p_vc_FieldInfo in varchar2,            --�޸�ҵ�������Ϣ ����ο� front  UserProperties�ļ�
                                   p_vc_FieldValueOld in varchar2,        --�޸��ֶ���ֵ
                                   p_vc_FieldValueNew in varchar2,        --�޸��ֶ�ԭֵ
                                   p_vc_ChangeID in varchar2, --change_id
                                   p_vc_FieldValueNew_t in varchar2,
                                   error_no out number,
                                   error_info out varchar2)
  /**********************************************************
  ��  �ƣ�����û������޸�(������Ϣ)
  ��  �ܣ�����û������޸�(������Ϣ)

  �����ߣ�xiaoen
  ��  ������Σ�
          �������p_vc_FieldInfo Ϊ CRH_STOCK_ACCOUNT �� CRH_FUND_ACCOUNT ʱ
                    p_vc_FieldValueNew Ϊ  accountType,accountName;accountType,accountName;

          ���Σ�error_no �����
                error_info ������Ϣ
  ��  �ڣ�2015-07-28
  ��  ����V1.0.0.0
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
    --���⴦������
    if upper(p_vc_FieldInfo) = 'CRH_INDENTITY_DUE_DATE' then
      --���֤��Ч�� p_vc_FieldValueNew = 20090317-20150101 ���� 20090317-  ������Ч��־����Ҫ����enddate������
      v_l_Pos := instr(p_vc_FieldValueNew,'-');
      if v_l_Pos > 0 then
        v_vc_idbegindate := trim(substr(p_vc_FieldValueNew,1,v_l_Pos - 1));
        v_vc_idenddate := trim(substr(p_vc_FieldValueNew,v_l_Pos + 1,100));

        v_vc_ycbz := 'Y';
        error_no := -101;
        error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]���¿ͻ������Ϣ��ʧ�ܣ�����ϵϵͳ����Ա��';
        update user_id_info t
           set t.delivery_date = to_date(v_vc_idbegindate,'yyyymmdd'),
               t.due_date = to_date(v_vc_idenddate,'yyyymmdd'),
               t.forever_flag = decode(nvl(v_vc_idenddate,'������Ч'),'������Ч','1','0')   --0 ��ʱ��Ч 1 ������Ч
         where t.user_id = p_vc_UserId;
        v_vc_ycbz :='N';
      end if;
    elsif upper(p_vc_FieldInfo) = 'CRH_STOCK_ACCOUNT' then
      --֤ȯ�˻�
      v_vc_ycbz := 'Y';
      error_no := -101;
      error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]ɾ���ͻ������˺ű�ʧ��[CRH_STOCK_ACCOUNT]������ϵϵͳ����Ա��';
      delete from user_accounts t
            where t.user_id = p_vc_UserId and
                  t.invset_type = 1002 and
            t.apply_success_flag != 1;
      v_vc_ycbz := 'N';

      --����δ�ɹ��� p_vc_FieldValueNew Ϊ  accountType,accountName;accountType,accountName;
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
      error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]��ѯ�ͻ������˺ű�ʧ��[CRH_STOCK_ACCOUNT]������ϵϵͳ����Ա��';
      select count(1)
        into v_l_count
        from dual
       where exists(select 1
                      from user_accounts t
                     where t.user_id = p_vc_UserId and
                           t.invset_type = 1002 and
                           t.account_type = v_vc_accountType and
                           t.apply_success_flag = '1'); --�����ɹ�
      v_vc_ycbz := 'N';

      if v_l_count = 0 then  --�����ڳɹ��ľ�����
        v_vc_ycbz := 'Y';
        error_no := -101;
        error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]���ӿͻ������˺ű�ʧ��[CRH_STOCK_ACCOUNT]������ϵϵͳ����Ա��';
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
      --�����˻�
      v_vc_ycbz := 'Y';
      error_no := -101;
      error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]ɾ���ͻ������˺ű�ʧ��[CRH_FUND_ACCOUNT]������ϵϵͳ����Ա��';
      delete from user_accounts t
            where t.user_id = p_vc_UserId and
              t.invset_type = 1003 and
            t.apply_success_flag != 1;
      v_vc_ycbz := 'N';

      --����δ�ɹ��� p_vc_FieldValueNew Ϊ  accountType,accountName;accountType,accountName;
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
      error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]��ѯ�ͻ������˺ű�ʧ��[CRH_FUND_ACCOUNT]������ϵϵͳ����Ա��';
      select count(1)
        into v_l_count
        from dual
       where exists(select 1
                      from user_accounts t
               where t.user_id = p_vc_UserId and
                     t.invset_type = 1003 and
                 t.account_type = v_vc_accountType and
                 t.apply_success_flag = '1'); --�����ɹ�
      v_vc_ycbz := 'N';

      if v_l_count = 0 then  --�����ڳɹ��ľ�����
        --��ȡv_vc_BranchId��v_vc_BranchName
        select nvl(max(t.id),'')
          into v_vc_FundCompanyId
          from base_fund_company t
         where t.company_name = v_vc_accountName;

        v_vc_ycbz := 'Y';
        error_no := -101;
        error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]���ӿͻ������˺ű�ʧ��[CRH_FUND_ACCOUNT]������ϵϵͳ����Ա��';
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
      --ͨ�ø��´���
      v_vc_Sql := 'update '||p_vc_TableName||' t set t.'||p_vc_FieldName||' = '''||p_vc_FieldValueNew||''' where t.user_id = '''||p_vc_UserId||'''';
      execute immediate v_vc_Sql;
    end if;

    /*�޸�user_change_detail��*/
    v_vc_ycbz := 'Y';
    error_no := -101;
    error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]��ѯ�ͻ��޸���Ϣ��ʧ�ܣ�����ϵϵͳ����Ա��';
    select count(1)
      into v_l_count
      from dual
     where exists(select 1
                    from user_change_detail t
                   where t.change_id = p_vc_ChangeID and
                         t.field_info = p_vc_FieldInfo); --δ�ύ
    v_vc_ycbz := 'N';

    if v_l_count = 0 then
      --������������
      v_vc_ycbz := 'Y';
      error_no := -101;
      error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]���ӿͻ��޸���Ϣ��ʧ�ܣ�����ϵϵͳ����Ա��';
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
      error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]���¿ͻ��޸���Ϣ��ʧ�ܣ�����ϵϵͳ����Ա��';
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
    error_info := '����ɹ�';
  exception when others then
    rollback;
    --ϵͳ�Զ��쳣��׽
    if v_vc_ycbz = 'N' then
      error_no:=-1;
      error_info := '[pkg_wskh.pkgsp_wskh_AuditChange]���쳣����:'||chr(13)||sqlerrm||'��v_vc_Sql = '||v_vc_Sql;
    end if;
    --��Ϊ����ϵͳ�쳣
    if v_vc_ycbz = 'Y' then
      error_info := error_info||chr(13)||sqlerrm;
    end if;
    --��Ϊ���������쳣
    if v_vc_ycbz = 'C' then
      error_info := error_info;
    end if;
    null;
  end pkgsp_wskh_AuditChange;
  procedure pkgsp_wskh_issueAudit(p_vc_UserId       in varchar2, --�޸��û�ID
                                p_vc_EmpId        in varchar2, --�޸ĵĲ���Ա��ID
                                p_vc_TaskId       in varchar2,
                                p_vc_RejectReason in varchar2, --�޸��ֶ�����
                                p_vc_ResultType   in varchar2, --�޸�ҵ�������Ϣ ����ο� front  UserProperties�ļ�
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
    --����
    error_no   := -3;
    error_info := '[֤��䷢������Ϣ�����ڣ�]';
    return;
  else
    --�޸�
    select max(verify_id)
      into v_verify_id
      from USER_CA_VERIFY
     where USER_ID = p_vc_UserId
       and CA_TYPE = '1'
       and verify_flag != '2';

    if p_vc_ResultType = '1' then
      v_vc_BusinessFlowDesc := '֤��䷢�ɹ�';
      v_vc_ProxNode := 33219;
      v_status := 2;
      update USER_CA_VERIFY t
         set t.verify_flag = 2
       where t.verify_id = v_verify_id;
    elsif p_vc_ResultType = '2' then
      v_vc_BusinessFlowDesc := '��˲�ͨ��';
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
  error_info := '����ɹ�';
  commit;
end pkgsp_wskh_issueAudit;

procedure pkgsp_wskh_openFail(p_vc_UserId in varchar2, --�û�ID
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
               '����ʧ��',
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
    error_info := '����ɹ�';
    commit;
  end;

  /*�û�������Ƶ*/
  procedure pkgsp_wskh_acptVideo(p_vc_UserId in varchar2, --�û�ID
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
               '������Ƶ��֤',
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
    error_info := '����ɹ�';
    commit;
  end;

  procedure pkgsp_wskh_FinishVideo(p_vc_UserId    in varchar2, --�û�ID
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
                 '�����Ƶ��֤',
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
      v_reasonStr := '�����Ƶ��֤';

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
                 '�����Ƶ��֤',
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
               mt.result_comment = 'ͨ��'
         where mt.task_id = v_TaskID;

        if trim(p_cert_flag) = '1' then
          select count(*)
            into v_rowCount
            from user_ca_verify ucv
           where ucv.user_id = trim(p_vc_userId)
             and ucv.ca_type = '1'
             and trim(ucv.ca_cert) is not null
             and ucv.verify_flag = 2;
          --���û����Ч������֤�飬������һ������֤�������
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
    error_info := '����ɹ�';
    commit;
  end;


end PKG_WSKH;
