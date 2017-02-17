create or replace package body PKG_REPORT is

  /*--开户数据信息统计（每天） yyyymmdd 建议每小时执行，入参日期为当天
  --1、注册用户数量 register_count
  --2、申请提交数量 apply_count
  --3、数字证书安装数量 cert_count
  --4、视频见证数量 video_count
  --5、证件上传数量 id_upload_count
  --6、存管银行绑定数量 bank_count
  --7、 资金账户开户数量 capital_count
  --8、 开户成功数量 success_count
  --9、 开户失败数量 fail_count
  --10、审核任务数量 audit_count
  --11、审核通过任务数量 audit_pass_count
  --12、复核任务数量 review_count
  --13、复核通过任务数量 review_pass_count        */
  procedure pkgsp_report_rptUserApplyDaily(p_report_date in varchar2,
                                           p_org_id      in varchar2,
                                           p_app_id      in varchar2,
                                           p_channel_id  in varchar2,
                                           error_no      out number,
                                           error_info    out varchar2) is
    --v_tmp_time   varchar2(6);
    v_begin_time date;
    v_end_time   date;
    v_row_count  number(8);
    tmp_cur      myrctype;
    cursor cur_1 is
      select 0 count, -1 org_id, '      ' app_id, -1 channel_id from dual;
    tmp_rec cur_1%rowtype;
  begin
    error_no := -1;
    --v_tmp_time   := '000000';
    v_begin_time := to_date(p_report_date || '000000', 'yyyymmddhh24miss');
    v_end_time   := v_begin_time + 1;

      --0、先重置之前的计算结果。 20151026 laijb mod
      update rpt_user_apply_daily
         set register_count    = 0,
             apply_count       = 0,
             cert_count        = 0,
             video_count       = 0,
             id_upload_count   = 0,
             bank_count        = 0,
             capital_count     = 0,
             success_count     = 0,
             fail_count        = 0,
             audit_count       = 0,
             audit_pass_count  = 0,
             review_count      = 0,
             review_pass_count = 0
       where report_date = p_report_date;
      --1、统计注册人数
      tmp_cur := pkgsf_report_rptUserApplyReg(v_begin_time,
                                              v_end_time,
                                              p_org_id,
                                              p_app_id,
                                              p_channel_id,
                                              error_no,
                                              error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_daily
         where report_date = p_report_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_daily
             set register_count = tmp_rec.count
           where report_date = p_report_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_daily
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             register_count)
          values
            (rpt_user_apply_daily_seq.nextval,
             p_report_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;

      --2、统计开户申请提交人数
      tmp_cur := pkgsf_report_rptUserApplyApl(v_begin_time,
                                              v_end_time,
                                              p_org_id,
                                              trim(p_app_id),
                                              p_channel_id,
                                              error_no,
                                              error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_daily
         where report_date = p_report_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;

        if v_row_count > 0 then
          update rpt_user_apply_daily
             set apply_count = tmp_rec.count
           where report_date = p_report_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_daily
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             apply_count)
          values
            (rpt_user_apply_daily_seq.nextval,
             p_report_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --3、统计CA数字证书安装情况
      tmp_cur := pkgsf_report_rptUserApplyCert(v_begin_time,
                                               v_end_time,
                                               p_org_id,
                                               trim(p_app_id),
                                               p_channel_id,
                                               error_no,
                                               error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_daily
         where report_date = p_report_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_daily
             set cert_count = tmp_rec.count
           where report_date = p_report_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_daily
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             cert_count)
          values
            (rpt_user_apply_daily_seq.nextval,
             p_report_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --4、视频见证数量
      tmp_cur := pkgsf_report_rptUserApplyVideo(v_begin_time,
                                                v_end_time,
                                                p_org_id,
                                                trim(p_app_id),
                                                p_channel_id,
                                                error_no,
                                                error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_daily
         where report_date = p_report_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_daily
             set video_count = tmp_rec.count
           where report_date = p_report_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_daily
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             video_count)
          values
            (rpt_user_apply_daily_seq.nextval,
             p_report_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --5、证件上传数量 id_upload_count
      tmp_cur := pkgsf_report_rptUserApplyID(v_begin_time,
                                             v_end_time,
                                             p_org_id,
                                             trim(p_app_id),
                                             p_channel_id,
                                             error_no,
                                             error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_daily
         where report_date = p_report_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_daily
             set id_upload_count = tmp_rec.count
           where report_date = p_report_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_daily
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             id_upload_count)
          values
            (rpt_user_apply_daily_seq.nextval,
             p_report_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --6、存管银行绑定数量 bank_count
      tmp_cur := pkgsf_report_rptUserApplyBank(v_begin_time,
                                               v_end_time,
                                               p_org_id,
                                               trim(p_app_id),
                                               p_channel_id,
                                               error_no,
                                               error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_daily
         where report_date = p_report_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_daily
             set bank_count = tmp_rec.count
           where report_date = p_report_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_daily
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             bank_count)
          values
            (rpt_user_apply_daily_seq.nextval,
             p_report_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --7、 资金账户开户数量 capital_count
      tmp_cur := pkgsf_report_rptUserApplyFund(v_begin_time,
                                               v_end_time,
                                               p_org_id,
                                               trim(p_app_id),
                                               p_channel_id,
                                               error_no,
                                               error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_daily
         where report_date = p_report_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_daily
             set capital_count = tmp_rec.count
           where report_date = p_report_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_daily
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             capital_count)
          values
            (rpt_user_apply_daily_seq.nextval,
             p_report_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --8、 开户成功数量 success_count
      tmp_cur := pkgsf_report_rptUserApplySucc(v_begin_time,
                                               v_end_time,
                                               p_org_id,
                                               trim(p_app_id),
                                               p_channel_id,
                                               error_no,
                                               error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_daily
         where report_date = p_report_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_daily
             set success_count = tmp_rec.count
           where report_date = p_report_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_daily
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             success_count)
          values
            (rpt_user_apply_daily_seq.nextval,
             p_report_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --9、 开户失败数量 fail_count
      tmp_cur := pkgsf_report_rptUserApplyFail(v_begin_time,
                                               v_end_time,
                                               p_org_id,
                                               trim(p_app_id),
                                               p_channel_id,
                                               error_no,
                                               error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_daily
         where report_date = p_report_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_daily
             set fail_count = tmp_rec.count
           where report_date = p_report_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_daily
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             fail_count)
          values
            (rpt_user_apply_daily_seq.nextval,
             p_report_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --10、审核任务数量 audit_count
      tmp_cur := pkgsf_report_rptUserApplyAudit(v_begin_time,
                                                v_end_time,
                                                p_org_id,
                                                trim(p_app_id),
                                                p_channel_id,
                                                error_no,
                                                error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_daily
         where report_date = p_report_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_daily
             set audit_count = tmp_rec.count
           where report_date = p_report_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_daily
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             audit_count)
          values
            (rpt_user_apply_daily_seq.nextval,
             p_report_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --11、审核通过任务数量 audit_pass_count
      tmp_cur := pkgsf_report_rptUserApplyAdtP(v_begin_time,
                                               v_end_time,
                                               p_org_id,
                                               trim(p_app_id),
                                               p_channel_id,
                                               error_no,
                                               error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_daily
         where report_date = p_report_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_daily
             set audit_pass_count = tmp_rec.count
           where report_date = p_report_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_daily
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             audit_pass_count)
          values
            (rpt_user_apply_daily_seq.nextval,
             p_report_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --12、复核任务数量 review_count
      tmp_cur := pkgsf_report_rptUserApplyRev(v_begin_time,
                                              v_end_time,
                                              p_org_id,
                                              trim(p_app_id),
                                              p_channel_id,
                                              error_no,
                                              error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_daily
         where report_date = p_report_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_daily
             set review_count = tmp_rec.count
           where report_date = p_report_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_daily
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             review_count)
          values
            (rpt_user_apply_daily_seq.nextval,
             p_report_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --13、复核通过任务数量 review_pass_count
      tmp_cur := pkgsf_report_rptUserApplyRevP(v_begin_time,
                                               v_end_time,
                                               p_org_id,
                                               trim(p_app_id),
                                               p_channel_id,
                                               error_no,
                                               error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_daily
         where report_date = p_report_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_daily
             set review_pass_count = tmp_rec.count
           where report_date = p_report_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_daily
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             review_pass_count)
          values
            (rpt_user_apply_daily_seq.nextval,
             p_report_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
    --14、最后一步，如果没有数据，增加一条为零的记录
    select nvl(count(*), 0)
      into v_row_count
      from rpt_user_apply_daily
     where report_date = p_report_date;
    if v_row_count <= 0 then
      insert into rpt_user_apply_daily
        (report_id, report_date, org_id, app_id, channel_id)
      values
        (rpt_user_apply_daily_seq.nextval, p_report_date, 0, ' ', 0);
    end if;
    commit;
    error_no   := 0;
    error_info := '处理成功';
  end;

  /*--开户数据信息统计（每月）yyyymmdd 月初第一天到当前日期的数据 建议凌晨执行，入参日期为前一天
  --1、注册用户数量 register_count
  --2、申请提交数量 apply_count
  --3、数字证书安装数量 cert_count
  --4、视频见证数量 video_count
  --5、证件上传数量 id_upload_count
  --6、存管银行绑定数量 bank_count
  --7、 资金账户开户数量 capital_count
  --8、 开户成功数量 success_count
  --9、 开户失败数量 fail_count
  --10、审核任务数量 audit_count
  --11、审核通过任务数量 audit_pass_count
  --12、复核任务数量 review_count
  --13、复核通过任务数量 review_pass_count        */
  procedure pkgsp_report_rptUserApplyMonth(p_report_date in varchar2,
                                           p_org_id      in varchar2,
                                           p_app_id      in varchar2,
                                           p_channel_id  in varchar2,
                                           error_no      out number,
                                           error_info    out varchar2) is
    v_begin_time date;
    v_end_time   date;
    v_row_count  number(8);
    v_tmp_date   varchar2(8);
    tmp_cur      myrctype;
    cursor cur_1 is
      select 0 count, -1 org_id, '      ' app_id, -1 channel_id from dual;
    tmp_rec cur_1%rowtype;
  begin
    error_no := -1;
    --201502 + 01000000
    v_begin_time := to_date(substr(p_report_date, 1, 6) || '01000000',
                            'yyyymmddhh24miss');
    v_end_time   := add_months(v_begin_time, 1);
    v_tmp_date   := to_char(last_day(v_begin_time), 'yyyymmdd');

      --0、先重置之前的计算结果。 20151026 laijb mod
      update rpt_user_apply_month
         set register_count    = 0,
             apply_count       = 0,
             cert_count        = 0,
             video_count       = 0,
             id_upload_count   = 0,
             bank_count        = 0,
             capital_count     = 0,
             success_count     = 0,
             fail_count        = 0,
             audit_count       = 0,
             audit_pass_count  = 0,
             review_count      = 0,
             review_pass_count = 0
       where report_date = p_report_date;
      --1、统计注册人数
      tmp_cur := pkgsf_report_rptUserApplyReg(v_begin_time,
                                              v_end_time,
                                              p_org_id,
                                              p_app_id,
                                              p_channel_id,
                                              error_no,
                                              error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_month
         where report_date = v_tmp_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_month
             set register_count = tmp_rec.count
           where report_date = v_tmp_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_month
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             register_count)
          values
            (rpt_user_apply_month_seq.nextval,
             v_tmp_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --2、统计开户申请提交人数
      tmp_cur := pkgsf_report_rptUserApplyApl(v_begin_time,
                                              v_end_time,
                                              p_org_id,
                                              trim(p_app_id),
                                              p_channel_id,
                                              error_no,
                                              error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_month
         where report_date = v_tmp_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;

        if v_row_count > 0 then
          update rpt_user_apply_month
             set apply_count = tmp_rec.count
           where report_date = v_tmp_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_month
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             apply_count)
          values
            (rpt_user_apply_month_seq.nextval,
             v_tmp_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --3、统计CA数字证书安装情况
      tmp_cur := pkgsf_report_rptUserApplyCert(v_begin_time,
                                               v_end_time,
                                               p_org_id,
                                               trim(p_app_id),
                                               p_channel_id,
                                               error_no,
                                               error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_month
         where report_date = v_tmp_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_month
             set cert_count = tmp_rec.count
           where report_date = v_tmp_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_month
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             cert_count)
          values
            (rpt_user_apply_month_seq.nextval,
             v_tmp_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --4、视频见证数量
      tmp_cur := pkgsf_report_rptUserApplyVideo(v_begin_time,
                                                v_end_time,
                                                p_org_id,
                                                trim(p_app_id),
                                                p_channel_id,
                                                error_no,
                                                error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_month
         where report_date = v_tmp_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_month
             set video_count = tmp_rec.count
           where report_date = v_tmp_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_month
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             video_count)
          values
            (rpt_user_apply_month_seq.nextval,
             v_tmp_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --5、证件上传数量 id_upload_count
      tmp_cur := pkgsf_report_rptUserApplyID(v_begin_time,
                                             v_end_time,
                                             p_org_id,
                                             trim(p_app_id),
                                             p_channel_id,
                                             error_no,
                                             error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_month
         where report_date = v_tmp_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_month
             set id_upload_count = tmp_rec.count
           where report_date = v_tmp_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_month
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             id_upload_count)
          values
            (rpt_user_apply_month_seq.nextval,
             v_tmp_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --6、存管银行绑定数量 bank_count
      tmp_cur := pkgsf_report_rptUserApplyBank(v_begin_time,
                                               v_end_time,
                                               p_org_id,
                                               trim(p_app_id),
                                               p_channel_id,
                                               error_no,
                                               error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_month
         where report_date = v_tmp_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_month
             set bank_count = tmp_rec.count
           where report_date = v_tmp_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_month
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             bank_count)
          values
            (rpt_user_apply_month_seq.nextval,
             v_tmp_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --7、 资金账户开户数量 capital_count
      tmp_cur := pkgsf_report_rptUserApplyFund(v_begin_time,
                                               v_end_time,
                                               p_org_id,
                                               trim(p_app_id),
                                               p_channel_id,
                                               error_no,
                                               error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_month
         where report_date = v_tmp_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_month
             set capital_count = tmp_rec.count
           where report_date = v_tmp_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_month
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             capital_count)
          values
            (rpt_user_apply_month_seq.nextval,
             v_tmp_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --8、 开户成功数量 success_count
      tmp_cur := pkgsf_report_rptUserApplySucc(v_begin_time,
                                               v_end_time,
                                               p_org_id,
                                               trim(p_app_id),
                                               p_channel_id,
                                               error_no,
                                               error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_month
         where report_date = v_tmp_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_month
             set success_count = tmp_rec.count
           where report_date = v_tmp_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_month
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             success_count)
          values
            (rpt_user_apply_month_seq.nextval,
             v_tmp_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --9、 开户失败数量 fail_count
      tmp_cur := pkgsf_report_rptUserApplyFail(v_begin_time,
                                               v_end_time,
                                               p_org_id,
                                               trim(p_app_id),
                                               p_channel_id,
                                               error_no,
                                               error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_month
         where report_date = v_tmp_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_month
             set fail_count = tmp_rec.count
           where report_date = v_tmp_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_month
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             fail_count)
          values
            (rpt_user_apply_month_seq.nextval,
             v_tmp_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --10、审核任务数量 audit_count
      tmp_cur := pkgsf_report_rptUserApplyAudit(v_begin_time,
                                                v_end_time,
                                                p_org_id,
                                                trim(p_app_id),
                                                p_channel_id,
                                                error_no,
                                                error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_month
         where report_date = v_tmp_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_month
             set audit_count = tmp_rec.count
           where report_date = v_tmp_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_month
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             audit_count)
          values
            (rpt_user_apply_month_seq.nextval,
             v_tmp_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --11、审核通过任务数量 audit_pass_count
      tmp_cur := pkgsf_report_rptUserApplyAdtP(v_begin_time,
                                               v_end_time,
                                               p_org_id,
                                               trim(p_app_id),
                                               p_channel_id,
                                               error_no,
                                               error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_month
         where report_date = v_tmp_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_month
             set audit_pass_count = tmp_rec.count
           where report_date = v_tmp_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_month
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             audit_pass_count)
          values
            (rpt_user_apply_month_seq.nextval,
             v_tmp_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --12、复核任务数量 review_count
      tmp_cur := pkgsf_report_rptUserApplyRev(v_begin_time,
                                              v_end_time,
                                              p_org_id,
                                              trim(p_app_id),
                                              p_channel_id,
                                              error_no,
                                              error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_month
         where report_date = v_tmp_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_month
             set review_count = tmp_rec.count
           where report_date = v_tmp_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_month
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             review_count)
          values
            (rpt_user_apply_month_seq.nextval,
             v_tmp_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
      --13、复核通过任务数量 review_pass_count
      tmp_cur := pkgsf_report_rptUserApplyRevP(v_begin_time,
                                               v_end_time,
                                               p_org_id,
                                               trim(p_app_id),
                                               p_channel_id,
                                               error_no,
                                               error_info);
      loop
        fetch tmp_cur
          into tmp_rec;
        exit when tmp_cur%NOTFOUND;
        select nvl(count(*), 0)
          into v_row_count
          from rpt_user_apply_month
         where report_date = v_tmp_date
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
        if v_row_count > 0 then
          update rpt_user_apply_month
             set review_pass_count = tmp_rec.count
           where report_date = v_tmp_date
             and org_id = tmp_rec.org_id
             and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
             and channel_id = tmp_rec.channel_id;
        else
          insert into rpt_user_apply_month
            (report_id,
             report_date,
             org_id,
             app_id,
             channel_id,
             review_pass_count)
          values
            (rpt_user_apply_month_seq.nextval,
             v_tmp_date,
             tmp_rec.org_id,
             nvl(trim(tmp_rec.app_id), ' '),
             tmp_rec.channel_id,
             tmp_rec.count);
        end if;
      end loop;
      commit;
    --14、最后一步，如果没有数据，增加一条为零的记录
    select nvl(count(*), 0)
      into v_row_count
      from rpt_user_apply_month
     where report_date = v_tmp_date;
    if v_row_count <= 0 then
      insert into rpt_user_apply_month
        (report_id, report_date, org_id, app_id, channel_id)
      values
        (rpt_user_apply_month_seq.nextval, v_tmp_date, 0, ' ', 0);
    end if;
    commit;
    error_no   := 0;
    error_info := '处理成功';
  end;

  /*--开户数据信息统计（每小时） 入参时间为整小时，如130000，统计13-14点之间的开户数据
  --1、注册用户数量 register_count
  --2、申请提交数量 apply_count
  --3、数字证书安装数量 cert_count
  --4、视频见证数量 video_count
  --5、证件上传数量 id_upload_count
  --6、存管银行绑定数量 bank_count
  --7、 资金账户开户数量 capital_count
  --8、 开户成功数量 success_count
  --9、 开户失败数量 fail_count
  --10、审核任务数量 audit_count
  --11、审核通过任务数量 audit_pass_count
  --12、复核任务数量 review_count
  --13、复核通过任务数量 review_pass_count        */
  procedure pkgsp_report_rptUserApplyHour(p_report_date in varchar2,
                                          p_report_time in varchar2,
                                          p_org_id      in varchar2,
                                          p_app_id      in varchar2,
                                          p_channel_id  in varchar2,
                                          error_no      out number,
                                          error_info    out varchar2) is
    v_tmp_time   varchar2(6);
    v_begin_time date;
    v_end_time   date;
    v_row_count  number(8);
    tmp_cur      myrctype;
    cursor cur_1 is
      select 0 count, -1 org_id, '      ' app_id, -1 channel_id from dual;
    tmp_rec cur_1%rowtype;
  begin
    error_no     := -1;
    v_tmp_time   := substr(p_report_time, 1, 2) || '0000';
    v_begin_time := to_date(p_report_date || v_tmp_time, 'yyyymmddhh24miss');
    v_end_time   := v_begin_time + 1 / 24;

    --1、统计注册人数
    tmp_cur := pkgsf_report_rptUserApplyReg(v_begin_time,
                                            v_end_time,
                                            p_org_id,
                                            p_app_id,
                                            p_channel_id,
                                            error_no,
                                            error_info);
    loop
      fetch tmp_cur
        into tmp_rec;
      exit when tmp_cur%NOTFOUND;
      select nvl(count(*), 0)
        into v_row_count
        from rpt_user_apply_hour
       where report_date = p_report_date
         and report_time = v_tmp_time
         and org_id = tmp_rec.org_id
         and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
         and channel_id = tmp_rec.channel_id;
      if v_row_count > 0 then
        update rpt_user_apply_hour
           set register_count = tmp_rec.count
         where report_date = p_report_date
           and report_time = v_tmp_time
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
      else
        insert into rpt_user_apply_hour
          (report_id,
           report_date,
           report_time,
           org_id,
           app_id,
           channel_id,
           register_count)
        values
          (rpt_user_apply_hour_seq.nextval,
           p_report_date,
           v_tmp_time,
           tmp_rec.org_id,
           nvl(trim(tmp_rec.app_id), ' '),
           tmp_rec.channel_id,
           tmp_rec.count);
      end if;
    end loop;
    commit;
    --2、统计开户申请提交人数
    tmp_cur := pkgsf_report_rptUserApplyApl(v_begin_time,
                                            v_end_time,
                                            p_org_id,
                                            trim(p_app_id),
                                            p_channel_id,
                                            error_no,
                                            error_info);
    loop
      fetch tmp_cur
        into tmp_rec;
      exit when tmp_cur%NOTFOUND;
      select nvl(count(*), 0)
        into v_row_count
        from rpt_user_apply_hour
       where report_date = p_report_date
         and report_time = v_tmp_time
         and org_id = tmp_rec.org_id
         and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
         and channel_id = tmp_rec.channel_id;

      if v_row_count > 0 then
        update rpt_user_apply_hour
           set apply_count = tmp_rec.count
         where report_date = p_report_date
           and report_time = v_tmp_time
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
      else
        insert into rpt_user_apply_hour
          (report_id,
           report_date,
           report_time,
           org_id,
           app_id,
           channel_id,
           apply_count)
        values
          (rpt_user_apply_hour_seq.nextval,
           p_report_date,
           v_tmp_time,
           tmp_rec.org_id,
           nvl(trim(tmp_rec.app_id), ' '),
           tmp_rec.channel_id,
           tmp_rec.count);
      end if;
    end loop;
    commit;
    --3、统计CA数字证书安装情况
    tmp_cur := pkgsf_report_rptUserApplyCert(v_begin_time,
                                             v_end_time,
                                             p_org_id,
                                             trim(p_app_id),
                                             p_channel_id,
                                             error_no,
                                             error_info);
    loop
      fetch tmp_cur
        into tmp_rec;
      exit when tmp_cur%NOTFOUND;
      select nvl(count(*), 0)
        into v_row_count
        from rpt_user_apply_hour
       where report_date = p_report_date
         and report_time = v_tmp_time
         and org_id = tmp_rec.org_id
         and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
         and channel_id = tmp_rec.channel_id;
      if v_row_count > 0 then
        update rpt_user_apply_hour
           set cert_count = tmp_rec.count
         where report_date = p_report_date
           and report_time = v_tmp_time
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
      else
        insert into rpt_user_apply_hour
          (report_id,
           report_date,
           report_time,
           org_id,
           app_id,
           channel_id,
           cert_count)
        values
          (rpt_user_apply_hour_seq.nextval,
           p_report_date,
           v_tmp_time,
           tmp_rec.org_id,
           nvl(trim(tmp_rec.app_id), ' '),
           tmp_rec.channel_id,
           tmp_rec.count);
      end if;
    end loop;
    commit;
    --4、视频见证数量
    tmp_cur := pkgsf_report_rptUserApplyVideo(v_begin_time,
                                              v_end_time,
                                              p_org_id,
                                              trim(p_app_id),
                                              p_channel_id,
                                              error_no,
                                              error_info);
    loop
      fetch tmp_cur
        into tmp_rec;
      exit when tmp_cur%NOTFOUND;
      select nvl(count(*), 0)
        into v_row_count
        from rpt_user_apply_hour
       where report_date = p_report_date
         and report_time = v_tmp_time
         and org_id = tmp_rec.org_id
         and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
         and channel_id = tmp_rec.channel_id;
      if v_row_count > 0 then
        update rpt_user_apply_hour
           set video_count = tmp_rec.count
         where report_date = p_report_date
           and report_time = v_tmp_time
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
      else
        insert into rpt_user_apply_hour
          (report_id,
           report_date,
           report_time,
           org_id,
           app_id,
           channel_id,
           video_count)
        values
          (rpt_user_apply_hour_seq.nextval,
           p_report_date,
           v_tmp_time,
           tmp_rec.org_id,
           nvl(trim(tmp_rec.app_id), ' '),
           tmp_rec.channel_id,
           tmp_rec.count);
      end if;
    end loop;
    commit;
    --5、证件上传数量 id_upload_count
    tmp_cur := pkgsf_report_rptUserApplyID(v_begin_time,
                                           v_end_time,
                                           p_org_id,
                                           trim(p_app_id),
                                           p_channel_id,
                                           error_no,
                                           error_info);
    loop
      fetch tmp_cur
        into tmp_rec;
      exit when tmp_cur%NOTFOUND;
      select nvl(count(*), 0)
        into v_row_count
        from rpt_user_apply_hour
       where report_date = p_report_date
         and report_time = v_tmp_time
         and org_id = tmp_rec.org_id
         and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
         and channel_id = tmp_rec.channel_id;
      if v_row_count > 0 then
        update rpt_user_apply_hour
           set id_upload_count = tmp_rec.count
         where report_date = p_report_date
           and report_time = v_tmp_time
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
      else
        insert into rpt_user_apply_hour
          (report_id,
           report_date,
           report_time,
           org_id,
           app_id,
           channel_id,
           id_upload_count)
        values
          (rpt_user_apply_hour_seq.nextval,
           p_report_date,
           v_tmp_time,
           tmp_rec.org_id,
           nvl(trim(tmp_rec.app_id), ' '),
           tmp_rec.channel_id,
           tmp_rec.count);
      end if;
    end loop;
    commit;
    --6、存管银行绑定数量 bank_count
    tmp_cur := pkgsf_report_rptUserApplyBank(v_begin_time,
                                             v_end_time,
                                             p_org_id,
                                             trim(p_app_id),
                                             p_channel_id,
                                             error_no,
                                             error_info);
    loop
      fetch tmp_cur
        into tmp_rec;
      exit when tmp_cur%NOTFOUND;
      select nvl(count(*), 0)
        into v_row_count
        from rpt_user_apply_hour
       where report_date = p_report_date
         and report_time = v_tmp_time
         and org_id = tmp_rec.org_id
         and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
         and channel_id = tmp_rec.channel_id;
      if v_row_count > 0 then
        update rpt_user_apply_hour
           set bank_count = tmp_rec.count
         where report_date = p_report_date
           and report_time = v_tmp_time
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
      else
        insert into rpt_user_apply_hour
          (report_id,
           report_date,
           report_time,
           org_id,
           app_id,
           channel_id,
           bank_count)
        values
          (rpt_user_apply_hour_seq.nextval,
           p_report_date,
           v_tmp_time,
           tmp_rec.org_id,
           nvl(trim(tmp_rec.app_id), ' '),
           tmp_rec.channel_id,
           tmp_rec.count);
      end if;
    end loop;
    commit;
    --7、 资金账户开户数量 capital_count
    tmp_cur := pkgsf_report_rptUserApplyFund(v_begin_time,
                                             v_end_time,
                                             p_org_id,
                                             trim(p_app_id),
                                             p_channel_id,
                                             error_no,
                                             error_info);
    loop
      fetch tmp_cur
        into tmp_rec;
      exit when tmp_cur%NOTFOUND;
      select nvl(count(*), 0)
        into v_row_count
        from rpt_user_apply_hour
       where report_date = p_report_date
         and report_time = v_tmp_time
         and org_id = tmp_rec.org_id
         and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
         and channel_id = tmp_rec.channel_id;
      if v_row_count > 0 then
        update rpt_user_apply_hour
           set capital_count = tmp_rec.count
         where report_date = p_report_date
           and report_time = v_tmp_time
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
      else
        insert into rpt_user_apply_hour
          (report_id,
           report_date,
           report_time,
           org_id,
           app_id,
           channel_id,
           capital_count)
        values
          (rpt_user_apply_hour_seq.nextval,
           p_report_date,
           v_tmp_time,
           tmp_rec.org_id,
           nvl(trim(tmp_rec.app_id), ' '),
           tmp_rec.channel_id,
           tmp_rec.count);
      end if;
    end loop;
    commit;
    --8、 开户成功数量 success_count
    tmp_cur := pkgsf_report_rptUserApplySucc(v_begin_time,
                                             v_end_time,
                                             p_org_id,
                                             trim(p_app_id),
                                             p_channel_id,
                                             error_no,
                                             error_info);
    loop
      fetch tmp_cur
        into tmp_rec;
      exit when tmp_cur%NOTFOUND;
      select nvl(count(*), 0)
        into v_row_count
        from rpt_user_apply_hour
       where report_date = p_report_date
         and report_time = v_tmp_time
         and org_id = tmp_rec.org_id
         and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
         and channel_id = tmp_rec.channel_id;
      if v_row_count > 0 then
        update rpt_user_apply_hour
           set success_count = tmp_rec.count
         where report_date = p_report_date
           and report_time = v_tmp_time
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
      else
        insert into rpt_user_apply_hour
          (report_id,
           report_date,
           report_time,
           org_id,
           app_id,
           channel_id,
           success_count)
        values
          (rpt_user_apply_hour_seq.nextval,
           p_report_date,
           v_tmp_time,
           tmp_rec.org_id,
           nvl(trim(tmp_rec.app_id), ' '),
           tmp_rec.channel_id,
           tmp_rec.count);
      end if;
    end loop;
    commit;
    --9、 开户失败数量 fail_count
    tmp_cur := pkgsf_report_rptUserApplyFail(v_begin_time,
                                             v_end_time,
                                             p_org_id,
                                             trim(p_app_id),
                                             p_channel_id,
                                             error_no,
                                             error_info);
    loop
      fetch tmp_cur
        into tmp_rec;
      exit when tmp_cur%NOTFOUND;
      select nvl(count(*), 0)
        into v_row_count
        from rpt_user_apply_hour
       where report_date = p_report_date
         and report_time = v_tmp_time
         and org_id = tmp_rec.org_id
         and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
         and channel_id = tmp_rec.channel_id;
      if v_row_count > 0 then
        update rpt_user_apply_hour
           set fail_count = tmp_rec.count
         where report_date = p_report_date
           and report_time = v_tmp_time
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
      else
        insert into rpt_user_apply_hour
          (report_id,
           report_date,
           report_time,
           org_id,
           app_id,
           channel_id,
           fail_count)
        values
          (rpt_user_apply_hour_seq.nextval,
           p_report_date,
           v_tmp_time,
           tmp_rec.org_id,
           nvl(trim(tmp_rec.app_id), ' '),
           tmp_rec.channel_id,
           tmp_rec.count);
      end if;
    end loop;
    commit;
    --10、审核任务数量 audit_count
    tmp_cur := pkgsf_report_rptUserApplyAudit(v_begin_time,
                                              v_end_time,
                                              p_org_id,
                                              trim(p_app_id),
                                              p_channel_id,
                                              error_no,
                                              error_info);
    loop
      fetch tmp_cur
        into tmp_rec;
      exit when tmp_cur%NOTFOUND;
      select nvl(count(*), 0)
        into v_row_count
        from rpt_user_apply_hour
       where report_date = p_report_date
         and report_time = v_tmp_time
         and org_id = tmp_rec.org_id
         and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
         and channel_id = tmp_rec.channel_id;
      if v_row_count > 0 then
        update rpt_user_apply_hour
           set audit_count = tmp_rec.count
         where report_date = p_report_date
           and report_time = v_tmp_time
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
      else
        insert into rpt_user_apply_hour
          (report_id,
           report_date,
           report_time,
           org_id,
           app_id,
           channel_id,
           audit_count)
        values
          (rpt_user_apply_hour_seq.nextval,
           p_report_date,
           v_tmp_time,
           tmp_rec.org_id,
           nvl(trim(tmp_rec.app_id), ' '),
           tmp_rec.channel_id,
           tmp_rec.count);
      end if;
    end loop;
    commit;
    --11、审核通过任务数量 audit_pass_count
    tmp_cur := pkgsf_report_rptUserApplyAdtP(v_begin_time,
                                             v_end_time,
                                             p_org_id,
                                             trim(p_app_id),
                                             p_channel_id,
                                             error_no,
                                             error_info);
    loop
      fetch tmp_cur
        into tmp_rec;
      exit when tmp_cur%NOTFOUND;
      select nvl(count(*), 0)
        into v_row_count
        from rpt_user_apply_hour
       where report_date = p_report_date
         and report_time = v_tmp_time
         and org_id = tmp_rec.org_id
         and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
         and channel_id = tmp_rec.channel_id;
      if v_row_count > 0 then
        update rpt_user_apply_hour
           set audit_pass_count = tmp_rec.count
         where report_date = p_report_date
           and report_time = v_tmp_time
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
      else
        insert into rpt_user_apply_hour
          (report_id,
           report_date,
           report_time,
           org_id,
           app_id,
           channel_id,
           audit_pass_count)
        values
          (rpt_user_apply_hour_seq.nextval,
           p_report_date,
           v_tmp_time,
           tmp_rec.org_id,
           nvl(trim(tmp_rec.app_id), ' '),
           tmp_rec.channel_id,
           tmp_rec.count);
      end if;
    end loop;
    commit;
    --12、复核任务数量 review_count
    tmp_cur := pkgsf_report_rptUserApplyRev(v_begin_time,
                                            v_end_time,
                                            p_org_id,
                                            trim(p_app_id),
                                            p_channel_id,
                                            error_no,
                                            error_info);
    loop
      fetch tmp_cur
        into tmp_rec;
      exit when tmp_cur%NOTFOUND;
      select nvl(count(*), 0)
        into v_row_count
        from rpt_user_apply_hour
       where report_date = p_report_date
         and report_time = v_tmp_time
         and org_id = tmp_rec.org_id
         and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
         and channel_id = tmp_rec.channel_id;
      if v_row_count > 0 then
        update rpt_user_apply_hour
           set review_count = tmp_rec.count
         where report_date = p_report_date
           and report_time = v_tmp_time
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
      else
        insert into rpt_user_apply_hour
          (report_id,
           report_date,
           report_time,
           org_id,
           app_id,
           channel_id,
           review_count)
        values
          (rpt_user_apply_hour_seq.nextval,
           p_report_date,
           v_tmp_time,
           tmp_rec.org_id,
           nvl(trim(tmp_rec.app_id), ' '),
           tmp_rec.channel_id,
           tmp_rec.count);
      end if;
    end loop;
    commit;
    --13、复核通过任务数量 review_pass_count
    tmp_cur := pkgsf_report_rptUserApplyRevP(v_begin_time,
                                             v_end_time,
                                             p_org_id,
                                             trim(p_app_id),
                                             p_channel_id,
                                             error_no,
                                             error_info);
    loop
      fetch tmp_cur
        into tmp_rec;
      exit when tmp_cur%NOTFOUND;
      select nvl(count(*), 0)
        into v_row_count
        from rpt_user_apply_hour
       where report_date = p_report_date
         and report_time = v_tmp_time
         and org_id = tmp_rec.org_id
         and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
         and channel_id = tmp_rec.channel_id;
      if v_row_count > 0 then
        update rpt_user_apply_hour
           set review_pass_count = tmp_rec.count
         where report_date = p_report_date
           and report_time = v_tmp_time
           and org_id = tmp_rec.org_id
           and nvl(trim(app_id), ' ') = nvl(trim(tmp_rec.app_id), ' ')
           and channel_id = tmp_rec.channel_id;
      else
        insert into rpt_user_apply_hour
          (report_id,
           report_date,
           report_time,
           org_id,
           app_id,
           channel_id,
           review_pass_count)
        values
          (rpt_user_apply_hour_seq.nextval,
           p_report_date,
           v_tmp_time,
           tmp_rec.org_id,
           nvl(trim(tmp_rec.app_id), ' '),
           tmp_rec.channel_id,
           tmp_rec.count);
      end if;
    end loop;
    commit;
    --14、最后一步，如果没有数据，增加一条为零的记录
    select nvl(count(*), 0)
      into v_row_count
      from rpt_user_apply_hour
     where report_date = p_report_date
       and report_time = v_tmp_time;
    if v_row_count <= 0 then
      insert into rpt_user_apply_hour
        (report_id, report_date, report_time, org_id, app_id, channel_id)
      values
        (rpt_user_apply_hour_seq.nextval,
         p_report_date,
         v_tmp_time,
         0,
         ' ',
         0);
    end if;
    commit;
    error_no   := 0;
    error_info := '处理成功';
  end;

  function pkgsf_report_rptUserApplyReg(p_begin_time in date,
                                        p_end_time   in date,
                                        p_org_id     in varchar2,
                                        p_app_id     in varchar2,
                                        p_channel_id in varchar2,
                                        error_no     out number,
                                        error_info   out varchar2)
    return myrctype is
    rc myrctype; --定义ref cursor变量
  begin
    open rc for
      select nvl(count(*), 0) as count,
             nvl(open_org_id, 0) as org_id,
             nvl(app_id, ' ') as app_id,
             nvl(channel_id, 0) as channel_id
        from user_presence up
       where up.create_time >= p_begin_time
         and up.create_time < p_end_time
         and (up.open_org_id = p_org_id or trim(p_org_id) is null)
         and (up.app_id = p_app_id or trim(p_app_id) is null)
         and (up.channel_id = p_channel_id or trim(p_channel_id) is null)
       group by open_org_id, app_id, channel_id
       order by open_org_id, app_id, channel_id;
    error_no   := 0;
    error_info := '处理成功';
    return rc;
  end;

  function pkgsf_report_rptUserApplyApl(p_begin_time in date,
                                        p_end_time   in date,
                                        p_org_id     in varchar2,
                                        p_app_id     in varchar2,
                                        p_channel_id in varchar2,
                                        error_no     out number,
                                        error_info   out varchar2)
    return myrctype is
    rc myrctype; --定义ref cursor变量
  begin
    open rc for
      select nvl(count(*), 0) as count,
             nvl(open_org_id, 0) as org_id,
             nvl(app_id, ' ') as app_id,
             nvl(channel_id, 0) as channel_id
        from user_presence up
       where up.submit_time >= p_begin_time
         and up.submit_time < p_end_time
         and (up.open_org_id = p_org_id or trim(p_org_id) is null)
         and (up.app_id = p_app_id or trim(p_app_id) is null)
         and (up.channel_id = p_channel_id or trim(p_channel_id) is null)
       group by open_org_id, app_id, channel_id
       order by open_org_id, app_id, channel_id;
    error_no   := 0;
    error_info := '处理成功';
    return rc;
  end;

  function pkgsf_report_rptUserApplyCert(p_begin_time in date,
                                         p_end_time   in date,
                                         p_org_id     in varchar2,
                                         p_app_id     in varchar2,
                                         p_channel_id in varchar2,
                                         error_no     out number,
                                         error_info   out varchar2)
    return myrctype is
    rc myrctype; --定义ref cursor变量
  begin
    open rc for
      select nvl(count(up.user_id), 0) as count,
             nvl(up.open_org_id, 0) as org_id,
             nvl(up.app_id, ' ') as app_id,
             nvl(up.channel_id, 0) as channel_id
        from user_ca_verify ucv, user_presence up
       where ucv.user_id = up.user_id
         and ucv.setup_flag = '1'
         and ucv.setup_time >= p_begin_time
         and ucv.setup_time < p_end_time
         and (up.open_org_id = p_org_id or trim(p_org_id) is null)
         and (up.app_id = p_app_id or trim(p_app_id) is null)
         and (up.channel_id = p_channel_id or trim(p_channel_id) is null)
       group by up.open_org_id, up.app_id, up.channel_id
       order by up.open_org_id, up.app_id, up.channel_id;
    error_no   := 0;
    error_info := '处理成功';
    return rc;
  end;

  function pkgsf_report_rptUserApplyVideo(p_begin_time in date,
                                          p_end_time   in date,
                                          p_org_id     in varchar2,
                                          p_app_id     in varchar2,
                                          p_channel_id in varchar2,
                                          error_no     out number,
                                          error_info   out varchar2)
    return myrctype is
    rc myrctype; --定义ref cursor变量
  begin
    open rc for
      select nvl(count(up.user_id), 0) as count,
             nvl(up.open_org_id, 0) as org_id,
             nvl(up.app_id, ' ') as app_id,
             nvl(up.channel_id, 0) as channel_id
        from user_video_verify uvv, user_presence up
       where uvv.user_id = up.user_id
         and uvv.end_time >= p_begin_time
         and uvv.end_time < p_end_time
         and (up.open_org_id = p_org_id or trim(p_org_id) is null)
         and (up.app_id = p_app_id or trim(p_app_id) is null)
         and (up.channel_id = p_channel_id or trim(p_channel_id) is null)
       group by up.open_org_id, up.app_id, up.channel_id
       order by up.open_org_id, up.app_id, up.channel_id;
    error_no   := 0;
    error_info := '处理成功';
    return rc;
  end;

  function pkgsf_report_rptUserApplyID(p_begin_time in date,
                                       p_end_time   in date,
                                       p_org_id     in varchar2,
                                       p_app_id     in varchar2,
                                       p_channel_id in varchar2,
                                       error_no     out number,
                                       error_info   out varchar2)
    return myrctype is
    rc myrctype; --定义ref cursor变量
  begin
    open rc for
      select nvl(count(up.user_id), 0) as count,
             nvl(up.open_org_id, 0) as org_id,
             nvl(up.app_id, ' ') as app_id,
             nvl(up.channel_id, 0) as channel_id
        from user_id_upload uiu, user_presence up
       where uiu.user_id = up.user_id
         and uiu.end_time >= p_begin_time
         and uiu.end_time < p_end_time
         and (up.open_org_id = p_org_id or trim(p_org_id) is null)
         and (up.app_id = p_app_id or trim(p_app_id) is null)
         and (up.channel_id = p_channel_id or trim(p_channel_id) is null)
       group by up.open_org_id, up.app_id, up.channel_id
       order by up.open_org_id, up.app_id, up.channel_id;
    error_no   := 0;
    error_info := '处理成功';
    return rc;
  end;

  function pkgsf_report_rptUserApplyBank(p_begin_time in date,
                                         p_end_time   in date,
                                         p_org_id     in varchar2,
                                         p_app_id     in varchar2,
                                         p_channel_id in varchar2,
                                         error_no     out number,
                                         error_info   out varchar2)
    return myrctype is
    rc myrctype; --定义ref cursor变量
  begin
    open rc for
      select nvl(count(up.user_id), 0) as count,
             nvl(up.open_org_id, 0) as org_id,
             nvl(up.app_id, ' ') as app_id,
             nvl(up.channel_id, 0) as channel_id
        from user_third_deposity utd, user_presence up
       where utd.user_id = up.user_id
         and utd.apply_success_flag = 1
         and utd.end_time >= p_begin_time
         and utd.end_time < p_end_time
         and (up.open_org_id = p_org_id or trim(p_org_id) is null)
         and (up.app_id = p_app_id or trim(p_app_id) is null)
         and (up.channel_id = p_channel_id or trim(p_channel_id) is null)
       group by up.open_org_id, up.app_id, up.channel_id
       order by up.open_org_id, up.app_id, up.channel_id;
    error_no   := 0;
    error_info := '处理成功';
    return rc;
  end;

  function pkgsf_report_rptUserApplyFund(p_begin_time in date,
                                         p_end_time   in date,
                                         p_org_id     in varchar2,
                                         p_app_id     in varchar2,
                                         p_channel_id in varchar2,
                                         error_no     out number,
                                         error_info   out varchar2)
    return myrctype is
    rc myrctype; --定义ref cursor变量
  begin
    open rc for
      select nvl(count(up.user_id), 0) as count,
             nvl(up.open_org_id, 0) as org_id,
             nvl(up.app_id, ' ') as app_id,
             nvl(up.channel_id, 0) as channel_id
        from user_accounts ua, user_presence up
       where ua.user_id = up.user_id
         and ua.invset_type = '1001'
         and ua.account_type = '1001'
         and ua.end_time >= p_begin_time
         and ua.end_time < p_end_time
         and (up.open_org_id = p_org_id or trim(p_org_id) is null)
         and (up.app_id = p_app_id or trim(p_app_id) is null)
         and (up.channel_id = p_channel_id or trim(p_channel_id) is null)
       group by up.open_org_id, up.app_id, up.channel_id
       order by up.open_org_id, up.app_id, up.channel_id;
    error_no   := 0;
    error_info := '处理成功';
    return rc;
  end;

  function pkgsf_report_rptUserApplySucc(p_begin_time in date,
                                         p_end_time   in date,
                                         p_org_id     in varchar2,
                                         p_app_id     in varchar2,
                                         p_channel_id in varchar2,
                                         error_no     out number,
                                         error_info   out varchar2)
    return myrctype is
    rc myrctype; --定义ref cursor变量
  begin
    open rc for
      select nvl(count(*), 0) as count,
             nvl(open_org_id, 0) as org_id,
             nvl(app_id, ' ') as app_id,
             nvl(channel_id, 0) as channel_id
        from user_presence up
       where up.end_time >= p_begin_time
         and up.end_time < p_end_time
         and up.status = 12
         and (up.open_org_id = p_org_id or trim(p_org_id) is null)
         and (up.app_id = p_app_id or trim(p_app_id) is null)
         and (up.channel_id = p_channel_id or trim(p_channel_id) is null)
       group by open_org_id, app_id, channel_id
       order by open_org_id, app_id, channel_id;
    error_no   := 0;
    error_info := '处理成功';
    return rc;
  end;

  function pkgsf_report_rptUserApplyFail(p_begin_time in date,
                                         p_end_time   in date,
                                         p_org_id     in varchar2,
                                         p_app_id     in varchar2,
                                         p_channel_id in varchar2,
                                         error_no     out number,
                                         error_info   out varchar2)
    return myrctype is
    rc myrctype; --定义ref cursor变量
  begin
    open rc for
      select nvl(count(*), 0) as count,
             nvl(open_org_id, 0) as org_id,
             nvl(app_id, ' ') as app_id,
             nvl(channel_id, 0) as channel_id
        from user_presence up
       where up.end_time >= p_begin_time
         and up.end_time < p_end_time
         and up.status = 13
         and (up.open_org_id = p_org_id or trim(p_org_id) is null)
         and (up.app_id = p_app_id or trim(p_app_id) is null)
         and (up.channel_id = p_channel_id or trim(p_channel_id) is null)
       group by open_org_id, app_id, channel_id
       order by open_org_id, app_id, channel_id;
    error_no   := 0;
    error_info := '处理成功';
    return rc;
  end;

  function pkgsf_report_rptUserApplyAudit(p_begin_time in date,
                                          p_end_time   in date,
                                          p_org_id     in varchar2,
                                          p_app_id     in varchar2,
                                          p_channel_id in varchar2,
                                          error_no     out number,
                                          error_info   out varchar2)
    return myrctype is
    rc myrctype; --定义ref cursor变量
  begin
    open rc for
      select nvl(count(up.user_id), 0) as count,
             nvl(up.open_org_id, 0) as org_id,
             nvl(up.app_id, ' ') as app_id,
             nvl(up.channel_id, 0) as channel_id
        from mess_task mt, user_presence up
       where mt.user_id = up.user_id
         and mt.task_type = '2'
         and mt.deal_time >= p_begin_time
         and mt.deal_time < p_end_time
         and (up.open_org_id = p_org_id or trim(p_org_id) is null)
         and (up.app_id = p_app_id or trim(p_app_id) is null)
         and (up.channel_id = p_channel_id or trim(p_channel_id) is null)
       group by up.open_org_id, up.app_id, up.channel_id
       order by up.open_org_id, up.app_id, up.channel_id;
    error_no   := 0;
    error_info := '处理成功';
    return rc;
  end;

  function pkgsf_report_rptUserApplyAdtP(p_begin_time in date,
                                         p_end_time   in date,
                                         p_org_id     in varchar2,
                                         p_app_id     in varchar2,
                                         p_channel_id in varchar2,
                                         error_no     out number,
                                         error_info   out varchar2)
    return myrctype is
    rc myrctype; --定义ref cursor变量
  begin
    open rc for
      select nvl(count(up.user_id), 0) as count,
             nvl(up.open_org_id, 0) as org_id,
             nvl(up.app_id, ' ') as app_id,
             nvl(up.channel_id, 0) as channel_id
        from mess_task mt, user_presence up
       where mt.user_id = up.user_id
         and mt.task_type = '2'
         and mt.status = '3'
         and mt.finish_time >= p_begin_time
         and mt.finish_time < p_end_time
         and (up.open_org_id = p_org_id or trim(p_org_id) is null)
         and (up.app_id = p_app_id or trim(p_app_id) is null)
         and (up.channel_id = p_channel_id or trim(p_channel_id) is null)
       group by up.open_org_id, up.app_id, up.channel_id
       order by up.open_org_id, up.app_id, up.channel_id;
    error_no   := 0;
    error_info := '处理成功';
    return rc;
  end;

  function pkgsf_report_rptUserApplyRev(p_begin_time in date,
                                        p_end_time   in date,
                                        p_org_id     in varchar2,
                                        p_app_id     in varchar2,
                                        p_channel_id in varchar2,
                                        error_no     out number,
                                        error_info   out varchar2)
    return myrctype is
    rc myrctype; --定义ref cursor变量
  begin
    open rc for
      select nvl(count(up.user_id), 0) as count,
             nvl(up.open_org_id, 0) as org_id,
             nvl(up.app_id, ' ') as app_id,
             nvl(up.channel_id, 0) as channel_id
        from mess_task mt, user_presence up
       where mt.user_id = up.user_id
         and mt.task_type = '3'
         and mt.deal_time >= p_begin_time
         and mt.deal_time < p_end_time
         and (up.open_org_id = p_org_id or trim(p_org_id) is null)
         and (up.app_id = p_app_id or trim(p_app_id) is null)
         and (up.channel_id = p_channel_id or trim(p_channel_id) is null)
       group by up.open_org_id, up.app_id, up.channel_id
       order by up.open_org_id, up.app_id, up.channel_id;
    error_no   := 0;
    error_info := '处理成功';
    return rc;
  end;

  function pkgsf_report_rptUserApplyRevP(p_begin_time in date,
                                         p_end_time   in date,
                                         p_org_id     in varchar2,
                                         p_app_id     in varchar2,
                                         p_channel_id in varchar2,
                                         error_no     out number,
                                         error_info   out varchar2)
    return myrctype is
    rc myrctype; --定义ref cursor变量
  begin
    open rc for
      select nvl(count(up.user_id), 0) as count,
             nvl(up.open_org_id, 0) as org_id,
             nvl(up.app_id, ' ') as app_id,
             nvl(up.channel_id, 0) as channel_id
        from mess_task mt, user_presence up
       where mt.user_id = up.user_id
         and mt.task_type = '3'
         and mt.status = '3'
         and mt.finish_time >= p_begin_time
         and mt.finish_time < p_end_time
         and (up.open_org_id = p_org_id or trim(p_org_id) is null)
         and (up.app_id = p_app_id or trim(p_app_id) is null)
         and (up.channel_id = p_channel_id or trim(p_channel_id) is null)
       group by up.open_org_id, up.app_id, up.channel_id
       order by up.open_org_id, up.app_id, up.channel_id;
    error_no   := 0;
    error_info := '处理成功';
    return rc;
  end;

  function pkgsf_report_rptVideoFlowQry(p_begin_time in date,
                                        p_end_time   in date,
                                        p_org_id     in varchar2,
                                        p_app_id     in varchar2,
                                        error_no     out number,
                                        error_info   out varchar2)
    return myrctype is
    rc myrctype; --定义ref cursor变量
  begin
    open rc for
      select count(uvf.user_id) as count,
             max(uvf.queue_length) as queue_length_max,
             min(uvf.queue_length) as queue_length_min,
             sum(uvf.queue_length) as queue_length_sum,
             nvl(up.open_org_id, 0) as org_id,
             nvl(up.app_id, ' ') app_id,
             uvf.flow_type
        from user_video_flow uvf, user_presence up
       where uvf.user_id = up.user_id
         and uvf.create_time >= p_begin_time
         and uvf.create_time < p_end_time
         and (up.open_org_id = p_org_id or trim(p_org_id) is null)
         and (up.app_id = p_app_id or trim(p_app_id) is null)
       group by up.open_org_id, up.app_id, uvf.flow_type
       order by up.open_org_id, up.app_id, uvf.flow_type;
    error_no   := 0;
    error_info := '处理成功';
    return rc;
  end;

  function pkgsf_report_rptVideoFlowTime(p_begin_time in date,
                                         p_end_time   in date,
                                         p_org_id     in varchar2,
                                         p_app_id     in varchar2,
                                         error_no     out number,
                                         error_info   out varchar2)
    return myrctype is
    rc myrctype; --定义ref cursor变量
  begin
    open rc for
      select sum(round((uvf.create_time -
                       nvl((select min(t.create_time)
                              from user_video_flow t
                             where t.user_id = uvf.user_id
                               and t.create_time < uvf.create_time
                               and t.flow_type = '1'),
                            uvf.create_time)) * 24 * 60 * 60,
                       3)) time_sum,
             max(round((uvf.create_time -
                       nvl((select min(t.create_time)
                              from user_video_flow t
                             where t.user_id = uvf.user_id
                               and t.create_time < uvf.create_time
                               and t.flow_type = '1'),
                            uvf.create_time)) * 24 * 60 * 60,
                       3)) time_max,
             min(round((uvf.create_time -
                       nvl((select min(t.create_time)
                              from user_video_flow t
                             where t.user_id = uvf.user_id
                               and t.create_time < uvf.create_time
                               and t.flow_type = '1'),
                            uvf.create_time)) * 24 * 60 * 60,
                       3)) time_min,
             sum(round((uvf.create_time -
                       nvl((select min(t.create_time)
                              from user_video_flow t
                             where t.user_id = uvf.user_id
                               and t.create_time < uvf.create_time
                               and t.flow_type = (case uvf.flow_type
                                     when '3' then
                                      '11'
                                     else
                                      '1'
                                   end)),
                            uvf.create_time)) * 24 * 60 * 60,
                       3)) time_sum_t,
             max(round((uvf.create_time -
                       nvl((select min(t.create_time)
                              from user_video_flow t
                             where t.user_id = uvf.user_id
                               and t.create_time < uvf.create_time
                               and t.flow_type = (case uvf.flow_type
                                     when '3' then
                                      '11'
                                     else
                                      '1'
                                   end)),
                            uvf.create_time)) * 24 * 60 * 60,
                       3)) time_max_t,
             min(round((uvf.create_time -
                       nvl((select min(t.create_time)
                              from user_video_flow t
                             where t.user_id = uvf.user_id
                               and t.create_time < uvf.create_time
                               and t.flow_type = (case uvf.flow_type
                                     when '3' then
                                      '11'
                                     else
                                      '1'
                                   end)),
                            uvf.create_time)) * 24 * 60 * 60,
                       3)) time_min_t,
             nvl(up.open_org_id, 0) as org_id,
             nvl(up.app_id, ' ') app_id,
             uvf.flow_type
        from user_video_flow uvf, user_presence up
       where uvf.user_id = up.user_id
         and uvf.flow_type in ('2', '3')
         and uvf.create_time >= p_begin_time
         and uvf.create_time < p_end_time
         and (up.open_org_id = p_org_id or trim(p_org_id) is null)
         and (up.app_id = p_app_id or trim(p_app_id) is null)
       group by up.open_org_id, up.app_id, uvf.flow_type
       order by up.open_org_id, up.app_id, uvf.flow_type;
    error_no   := 0;
    error_info := '处理成功';
    return rc;
  end;

  function pkgsf_report_rptVideoFlowUser(p_begin_time in date,
                                         p_end_time   in date,
                                         p_org_id     in varchar2,
                                         p_app_id     in varchar2,
                                         error_no     out number,
                                         error_info   out varchar2)
    return myrctype is
    rc myrctype; --定义ref cursor变量
  begin
    open rc for
      select count(distinct up.user_id) as count,
             nvl(up.open_org_id, 0) as org_id,
             nvl(up.app_id, ' ') app_id
        from user_video_flow uvf, user_presence up
       where uvf.user_id = up.user_id
         and uvf.create_time >= p_begin_time
         and uvf.create_time < p_end_time
         and (up.open_org_id = p_org_id or trim(p_org_id) is null)
         and (up.app_id = p_app_id or trim(p_app_id) is null)
       group by up.open_org_id, up.app_id
       order by up.open_org_id, up.app_id;
    error_no   := 0;
    error_info := '处理成功';
    return rc;
  end;

  function pkgsf_report_rptVideoFlowEmp(p_begin_time in date,
                                        p_end_time   in date,
                                        p_org_id     in varchar2,
                                        p_app_id     in varchar2,
                                        error_no     out number,
                                        error_info   out varchar2)
    return myrctype is
    rc myrctype; --定义ref cursor变量
  begin
    open rc for
      select count(distinct uvf.emp_id) as count,
             nvl(up.open_org_id, 0) as org_id,
             nvl(up.app_id, ' ') app_id
        from user_video_flow uvf, user_presence up
       where uvf.user_id = up.user_id
         and uvf.emp_id <> -1
         and uvf.create_time >= p_begin_time
         and uvf.create_time < p_end_time
         and (up.open_org_id = p_org_id or trim(p_org_id) is null)
         and (up.app_id = p_app_id or trim(p_app_id) is null)
       group by up.open_org_id, up.app_id
       order by up.open_org_id, up.app_id;
    error_no   := 0;
    error_info := '处理成功';
    return rc;
  end;

  procedure pkgsp_report_rptVideoFlowMins(p_report_date in varchar2,
                                          p_report_time in varchar2,
                                          p_org_id      in varchar2,
                                          p_app_id      in varchar2,
                                          error_no      out number,
                                          error_info    out varchar2) is
    v_tmp_time   varchar2(6);
    v_begin_time date;
    v_end_time   date;
    v_row_count  number(8);
    tmp_cur      myrctype;
    cursor cur_1 is
      select 0 count,
             0 queue_length_max,
             0 queue_length_min,
             0 queue_length_sum,
             0 org_id,
             '      ' app_id,
             '  ' flow_type
        from dual;
    tmp_rec1 cur_1%rowtype;
    cursor cur_2 is
      select 0 as time_sum,
             0 as time_max,
             0 as time_min,
             0 as time_sum_t,
             0 as time_max_t,
             0 as time_min_t,
             0 org_id,
             '      ' app_id,
             '  ' flow_type
        from dual;
    tmp_rec2 cur_2%rowtype;

    cursor cur_3 is
      select 0 count, 0 org_id, '      ' app_id from dual;
    tmp_rec3 cur_3%rowtype;

  begin
    v_tmp_time   := substr(p_report_time, 1, 3) || '000';
    v_begin_time := to_date(p_report_date || v_tmp_time, 'yyyymmddhh24miss');
    v_end_time   := v_begin_time + 1 / (24 * 6); --十分钟

    --1、统计队列人数
    --2、计算最大排队长度、最小排队长度、平均排队长度
    tmp_cur := pkgsf_report_rptVideoFlowQry(v_begin_time,
                                            v_end_time,
                                            p_org_id,
                                            p_app_id,
                                            --p_flow_type,
                                            error_no,
                                            error_info);
    loop
      fetch tmp_cur
        into tmp_rec1;
      exit when tmp_cur%NOTFOUND;

      select nvl(count(*), 0)
        into v_row_count
        from rpt_video_flow_minute
       where report_date = p_report_date
         and report_time = v_tmp_time
         and org_id = tmp_rec1.org_id
         and trim(app_id) = trim(tmp_rec1.app_id);
      if v_row_count > 0 then
        update rpt_video_flow_minute t
           set entry_queue_count =
               (case trim(tmp_rec1.flow_type)
                 when '1' then
                  tmp_rec1.count
                 else
                  entry_queue_count
               end),
               echoed_count     =
               (case trim(tmp_rec1.flow_type)
                 when '2' then
                  tmp_rec1.count
                 else
                  echoed_count
               end),
               pass_count       =
               (case trim(tmp_rec1.flow_type)
                 when '3' then
                  tmp_rec1.count
                 else
                  pass_count
               end),
               reject_count     =
               (case trim(tmp_rec1.flow_type)
                 when '4' then
                  tmp_rec1.count
                 else
                  reject_count
               end),
               user_abort_count =
               (case trim(tmp_rec1.flow_type)
                 when '5' then
                  tmp_rec1.count
                 else
                  user_abort_count
               end),
               emp_abort_count  =
               (case trim(tmp_rec1.flow_type)
                 when '6' then
                  tmp_rec1.count
                 else
                  emp_abort_count
               end),
               time_out_count   =
               (case trim(tmp_rec1.flow_type)
                 when '7' then
                  tmp_rec1.count
                 else
                  time_out_count
               end),
               requeue_count    =
               (case trim(tmp_rec1.flow_type)
                 when '8' then
                  tmp_rec1.count
                 else
                  requeue_count
               end),
               requeue_count_t  =
               (case trim(tmp_rec1.flow_type)
                 when '9' then
                  tmp_rec1.count
                 else
                  requeue_count_t
               end),
               leave_count      =
               (case trim(tmp_rec1.flow_type)
                 when '10' then
                  tmp_rec1.count
                 else
                  leave_count
               end),
               entry_room_count =
               (case trim(tmp_rec1.flow_type)
                 when '11' then
                  tmp_rec1.count
                 else
                  entry_room_count
               end),
               queue_length_max =
               (case trim(tmp_rec1.flow_type)
                 when '1' then
                  tmp_rec1.queue_length_max
                 else
                  queue_length_max
               end),
               queue_length_min =
               (case trim(tmp_rec1.flow_type)
                 when '1' then
                  tmp_rec1.queue_length_min
                 else
                  queue_length_min
               end),
               queue_length_sum =
               (case trim(tmp_rec1.flow_type)
                 when '1' then
                  tmp_rec1.queue_length_sum
                 else
                  queue_length_sum
               end)
         where report_date = p_report_date
           and report_time = v_tmp_time
           and org_id = tmp_rec1.org_id
           and trim(app_id) = trim(tmp_rec1.app_id);
      else
        insert into rpt_video_flow_minute
          (report_id,
           report_date,
           report_time,
           org_id,
           app_id,
           entry_queue_count,
           echoed_count,
           pass_count,
           reject_count,
           user_abort_count,
           emp_abort_count,
           time_out_count,
           requeue_count,
           requeue_count_t,
           leave_count,
           entry_room_count,
           queue_length_max,
           queue_length_min,
           queue_length_sum)
        values
          (rpt_video_flow_minute_seq.nextval,
           p_report_date,
           v_tmp_time,
           tmp_rec1.org_id,
           nvl(trim(tmp_rec1.app_id), ' '),
           (case trim(tmp_rec1.flow_type) when '1' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '2' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '3' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '4' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '5' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '6' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '7' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '8' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '9' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '10' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '11' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '1' then
            tmp_rec1.queue_length_max else 0 end),
           (case trim(tmp_rec1.flow_type) when '1' then
            tmp_rec1.queue_length_min else 0 end),
           (case trim(tmp_rec1.flow_type) when '1' then
            tmp_rec1.queue_length_sum else 0 end));
      end if;
    end loop;
    commit;
    --3、计算等待时长  被应答 -回溯-> 进入队列，时间差为等待时间。 被应答人数为分母，计算平均时长
    --   进入房间 -> 视频完成 = video_time
    --   进入队列 -> 视频完成 = deal_time
    tmp_cur := pkgsf_report_rptVideoFlowTime(v_begin_time,
                                             v_end_time,
                                             p_org_id,
                                             p_app_id,
                                             error_no,
                                             error_info);
    loop
      fetch tmp_cur
        into tmp_rec2;
      exit when tmp_cur%NOTFOUND;
      update rpt_video_flow_minute t
         set t.wait_time_max =
             (case trim(tmp_rec2.flow_type)
               when '2' then
                tmp_rec2.time_max
               else
                t.wait_time_max
             end),
             t.wait_time_min =
             (case trim(tmp_rec2.flow_type)
               when '2' then
                tmp_rec2.time_min
               else
                t.wait_time_min
             end),
             t.wait_time_sum =
             (case trim(tmp_rec2.flow_type)
               when '2' then
                tmp_rec2.time_sum
               else
                t.wait_time_sum
             end),
             t.video_time_max =
             (case trim(tmp_rec2.flow_type)
               when '3' then
                tmp_rec2.time_max
               else
                t.video_time_max
             end),
             t.video_time_min =
             (case trim(tmp_rec2.flow_type)
               when '3' then
                tmp_rec2.time_min
               else
                t.video_time_min
             end),
             t.video_time_sum =
             (case trim(tmp_rec2.flow_type)
               when '3' then
                tmp_rec2.time_sum
               else
                t.video_time_sum
             end),
             t.deal_time_max =
             (case trim(tmp_rec2.flow_type)
               when '3' then
                tmp_rec2.time_max_t
               else
                t.deal_time_max
             end),
             t.deal_time_min =
             (case trim(tmp_rec2.flow_type)
               when '3' then
                tmp_rec2.time_min_t
               else
                t.deal_time_min
             end),
             t.deal_time_sum =
             (case trim(tmp_rec2.flow_type)
               when '3' then
                tmp_rec2.time_sum_t
               else
                t.deal_time_sum
             end)
       where report_date = p_report_date
         and report_time = v_tmp_time
         and org_id = tmp_rec2.org_id
         and trim(app_id) = trim(tmp_rec2.app_id);
    end loop;
    commit;
    --4、排重后参与视频的 用户数量
    tmp_cur := pkgsf_report_rptVideoFlowUser(v_begin_time,
                                             v_end_time,
                                             p_org_id,
                                             p_app_id,
                                             error_no,
                                             error_info);
    loop
      fetch tmp_cur
        into tmp_rec3;
      exit when tmp_cur%NOTFOUND;
      update rpt_video_flow_minute t
         set t.video_user_count = tmp_rec3.count
       where report_date = p_report_date
         and report_time = v_tmp_time
         and org_id = tmp_rec3.org_id
         and trim(app_id) = trim(tmp_rec3.app_id);
    end loop;
    commit;
    --5、排重后参与视频的 操作员数量
    tmp_cur := pkgsf_report_rptVideoFlowEmp(v_begin_time,
                                            v_end_time,
                                            p_org_id,
                                            p_app_id,
                                            error_no,
                                            error_info);
    loop
      fetch tmp_cur
        into tmp_rec3;
      exit when tmp_cur%NOTFOUND;
      update rpt_video_flow_minute t
         set t.video_emp_count = tmp_rec3.count
       where report_date = p_report_date
         and report_time = v_tmp_time
         and org_id = tmp_rec3.org_id
         and trim(app_id) = trim(tmp_rec3.app_id);
    end loop;
    commit;

    select count(*)
      into v_row_count
      from rpt_video_flow_minute
     where report_date = trim(p_report_date)
       and report_time = trim(p_report_time);

    if v_row_count <= 0 then
      insert into rpt_video_flow_minute
        (report_id, report_date, report_time)
      values
        (rpt_video_flow_minute_seq.nextval, p_report_date, v_tmp_time);
      commit;
    end if;

    error_no   := 0;
    error_info := '处理成功';
  end;

  procedure pkgsp_report_rptVideoFlowDaily(p_report_date in varchar2,
                                           p_org_id      in varchar2,
                                           p_app_id      in varchar2,
                                           error_no      out number,
                                           error_info    out varchar2) is
    v_begin_time date;
    v_end_time   date;
    v_row_count  number(8);
    tmp_cur      myrctype;
    cursor cur_1 is
      select 0 count,
             0 queue_length_max,
             0 queue_length_min,
             0 queue_length_sum,
             0 org_id,
             '      ' app_id,
             '  ' flow_type
        from dual;
    tmp_rec1 cur_1%rowtype;
    cursor cur_2 is
      select 0 as time_sum,
             0 as time_max,
             0 as time_min,
             0 as time_sum_t,
             0 as time_max_t,
             0 as time_min_t,
             0 org_id,
             '      ' app_id,
             '  ' flow_type
        from dual;
    tmp_rec2 cur_2%rowtype;

    cursor cur_3 is
      select 0 count, 0 org_id, '      ' app_id from dual;
    tmp_rec3 cur_3%rowtype;
  begin
    v_begin_time := to_date(p_report_date || '000000', 'yyyymmddhh24miss');
    v_end_time   := v_begin_time + 1;

    --1、统计队列人数
    --2、计算最大排队长度、最小排队长度、平均排队长度
    tmp_cur := pkgsf_report_rptVideoFlowQry(v_begin_time,
                                            v_end_time,
                                            p_org_id,
                                            p_app_id,
                                            error_no,
                                            error_info);
    loop
      fetch tmp_cur
        into tmp_rec1;
      exit when tmp_cur%NOTFOUND;

      select nvl(count(*), 0)
        into v_row_count
        from rpt_video_flow_daily
       where report_date = p_report_date
         and org_id = tmp_rec1.org_id
         and trim(app_id) = trim(tmp_rec1.app_id);
      if v_row_count > 0 then
        update rpt_video_flow_daily t
           set entry_queue_count =
               (case trim(tmp_rec1.flow_type)
                 when '1' then
                  tmp_rec1.count
                 else
                  entry_queue_count
               end),
               echoed_count     =
               (case trim(tmp_rec1.flow_type)
                 when '2' then
                  tmp_rec1.count
                 else
                  echoed_count
               end),
               pass_count       =
               (case trim(tmp_rec1.flow_type)
                 when '3' then
                  tmp_rec1.count
                 else
                  pass_count
               end),
               reject_count     =
               (case trim(tmp_rec1.flow_type)
                 when '4' then
                  tmp_rec1.count
                 else
                  reject_count
               end),
               user_abort_count =
               (case trim(tmp_rec1.flow_type)
                 when '5' then
                  tmp_rec1.count
                 else
                  user_abort_count
               end),
               emp_abort_count  =
               (case trim(tmp_rec1.flow_type)
                 when '6' then
                  tmp_rec1.count
                 else
                  emp_abort_count
               end),
               time_out_count   =
               (case trim(tmp_rec1.flow_type)
                 when '7' then
                  tmp_rec1.count
                 else
                  time_out_count
               end),
               requeue_count    =
               (case trim(tmp_rec1.flow_type)
                 when '8' then
                  tmp_rec1.count
                 else
                  requeue_count
               end),
               requeue_count_t  =
               (case trim(tmp_rec1.flow_type)
                 when '9' then
                  tmp_rec1.count
                 else
                  requeue_count_t
               end),
               leave_count      =
               (case trim(tmp_rec1.flow_type)
                 when '10' then
                  tmp_rec1.count
                 else
                  leave_count
               end),
               entry_room_count =
               (case trim(tmp_rec1.flow_type)
                 when '11' then
                  tmp_rec1.count
                 else
                  entry_room_count
               end),
               queue_length_max =
               (case trim(tmp_rec1.flow_type)
                 when '1' then
                  tmp_rec1.queue_length_max
                 else
                  queue_length_max
               end),
               queue_length_min =
               (case trim(tmp_rec1.flow_type)
                 when '1' then
                  tmp_rec1.queue_length_min
                 else
                  queue_length_min
               end),
               queue_length_sum =
               (case trim(tmp_rec1.flow_type)
                 when '1' then
                  tmp_rec1.queue_length_sum
                 else
                  queue_length_sum
               end)
         where report_date = p_report_date
           and org_id = tmp_rec1.org_id
           and trim(app_id) = trim(tmp_rec1.app_id);
      else
        insert into rpt_video_flow_daily
          (report_id,
           report_date,
           org_id,
           app_id,
           entry_queue_count,
           echoed_count,
           pass_count,
           reject_count,
           user_abort_count,
           emp_abort_count,
           time_out_count,
           requeue_count,
           requeue_count_t,
           leave_count,
           entry_room_count,
           queue_length_max,
           queue_length_min,
           queue_length_sum)
        values
          (rpt_video_flow_daily_seq.nextval,
           p_report_date,
           tmp_rec1.org_id,
           nvl(trim(tmp_rec1.app_id), ' '),
           (case trim(tmp_rec1.flow_type) when '1' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '2' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '3' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '4' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '5' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '6' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '7' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '8' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '9' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '10' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '11' then tmp_rec1.count else 0 end),
           (case trim(tmp_rec1.flow_type) when '1' then
            tmp_rec1.queue_length_max else 0 end),
           (case trim(tmp_rec1.flow_type) when '1' then
            tmp_rec1.queue_length_min else 0 end),
           (case trim(tmp_rec1.flow_type) when '1' then
            tmp_rec1.queue_length_sum else 0 end));
      end if;
    end loop;
    commit;
    --3、计算等待时长  被应答 -回溯-> 进入队列，时间差为等待时间。 被应答人数为分母，计算平均时长
    --   进入房间 -> 视频完成 = video_time
    --   进入队列 -> 视频完成 = deal_time
    tmp_cur := pkgsf_report_rptVideoFlowTime(v_begin_time,
                                             v_end_time,
                                             p_org_id,
                                             p_app_id,
                                             error_no,
                                             error_info);
    loop
      fetch tmp_cur
        into tmp_rec2;
      exit when tmp_cur%NOTFOUND;
      update rpt_video_flow_daily t
         set t.wait_time_max =
             (case trim(tmp_rec2.flow_type)
               when '2' then
                tmp_rec2.time_max
               else
                t.wait_time_max
             end),
             t.wait_time_min =
             (case trim(tmp_rec2.flow_type)
               when '2' then
                tmp_rec2.time_min
               else
                t.wait_time_min
             end),
             t.wait_time_sum =
             (case trim(tmp_rec2.flow_type)
               when '2' then
                tmp_rec2.time_sum
               else
                t.wait_time_sum
             end),
             t.video_time_max =
             (case trim(tmp_rec2.flow_type)
               when '3' then
                tmp_rec2.time_max
               else
                t.video_time_max
             end),
             t.video_time_min =
             (case trim(tmp_rec2.flow_type)
               when '3' then
                tmp_rec2.time_min
               else
                t.video_time_min
             end),
             t.video_time_sum =
             (case trim(tmp_rec2.flow_type)
               when '3' then
                tmp_rec2.time_sum
               else
                t.video_time_sum
             end),
             t.deal_time_max =
             (case trim(tmp_rec2.flow_type)
               when '3' then
                tmp_rec2.time_max_t
               else
                t.deal_time_max
             end),
             t.deal_time_min =
             (case trim(tmp_rec2.flow_type)
               when '3' then
                tmp_rec2.time_min_t
               else
                t.deal_time_min
             end),
             t.deal_time_sum =
             (case trim(tmp_rec2.flow_type)
               when '3' then
                tmp_rec2.time_sum_t
               else
                t.deal_time_sum
             end)
       where report_date = p_report_date
         and org_id = tmp_rec2.org_id
         and trim(app_id) = trim(tmp_rec2.app_id);
    end loop;
    commit;
    --4、排重后参与视频的 用户数量
    tmp_cur := pkgsf_report_rptVideoFlowUser(v_begin_time,
                                             v_end_time,
                                             p_org_id,
                                             p_app_id,
                                             error_no,
                                             error_info);
    loop
      fetch tmp_cur
        into tmp_rec3;
      exit when tmp_cur%NOTFOUND;
      update rpt_video_flow_daily t
         set t.video_user_count = tmp_rec3.count
       where report_date = p_report_date
         and org_id = tmp_rec3.org_id
         and trim(app_id) = trim(tmp_rec3.app_id);
    end loop;
    commit;
    --5、排重后参与视频的 操作员数量
    tmp_cur := pkgsf_report_rptVideoFlowEmp(v_begin_time,
                                            v_end_time,
                                            p_org_id,
                                            p_app_id,
                                            error_no,
                                            error_info);
    loop
      fetch tmp_cur
        into tmp_rec3;
      exit when tmp_cur%NOTFOUND;
      update rpt_video_flow_daily t
         set t.video_emp_count = tmp_rec3.count
       where report_date = p_report_date
         and org_id = tmp_rec3.org_id
         and trim(app_id) = trim(tmp_rec3.app_id);
    end loop;
    commit;

    select count(*)
      into v_row_count
      from rpt_video_flow_daily
     where report_date = trim(p_report_date);

    if v_row_count <= 0 then
      insert into rpt_video_flow_daily
        (report_id, report_date)
      values
        (rpt_video_flow_daily_seq.nextval, p_report_date);
      commit;
    end if;

    error_no   := 0;
    error_info := '处理成功';
  end;

  function pkgsf_report_rptKHflowQry(p_begin_time in date,
                                     p_end_time   in date,
                                     p_org_id     in varchar2,
                                     p_app_id     in varchar2,
                                     error_no     out number,
                                     error_info   out varchar2)
    return myrctype is
    rc myrctype; --定义ref cursor变量
  begin
    open rc for
      select count(ubf.user_id) as total_record,
             count(distinct ubf.user_id) as total_user,
             count(case
                     when trunc(ubf.create_time) = trunc(up.create_time) then
                      1
                   end) inday_total_record,
             sum(ubf.create_time -
                 nvl((select max(t.create_time)
                       from user_business_flow t
                      where t.user_id = ubf.user_id
                        and t.create_time < ubf.create_time
                        and t.business_type <> ubf.business_type),
                     ubf.create_time)) * 24 * 60 * 60 as total_time,
             max(ubf.create_time -
                 nvl((select max(t.create_time)
                       from user_business_flow t
                      where t.user_id = ubf.user_id
                        and t.create_time < ubf.create_time
                        and t.business_type <> ubf.business_type),
                     ubf.create_time)) * 24 * 60 * 60 as max_time,
             min(ubf.create_time -
                 nvl((select max(t.create_time)
                       from user_business_flow t
                      where t.user_id = ubf.user_id
                        and t.create_time < ubf.create_time
                        and t.business_type <> ubf.business_type),
                     ubf.create_time)) * 24 * 60 * 60 as min_time,
             nvl(up.open_org_id, 0) as org_id,
             nvl(up.app_id, ' ') app_id,
             ubf.business_type,
             up.open_type
        from user_business_flow ubf, user_presence up
       where ubf.user_id = up.user_id
         and ubf.create_time >= p_begin_time
         and ubf.create_time < p_end_time
         and (up.open_org_id = p_org_id or trim(p_org_id) is null)
         and (up.app_id = p_app_id or trim(p_app_id) is null)
       group by up.open_org_id, up.app_id, up.open_type, ubf.business_type
       order by up.open_org_id, up.app_id, up.open_type, ubf.business_type;
    error_no   := 0;
    error_info := '处理成功';
    return rc;
  end;

  procedure pkgsp_report_rptKHflowAnalyse(p_report_date in varchar2,
                                          p_org_id      in varchar2,
                                          p_app_id      in varchar2,
                                          --p_open_type   in varchar2,
                                          error_no   out number,
                                          error_info out varchar2) is

    v_begin_time date;
    v_end_time   date;
    v_row_count  number(8);
    tmp_cur      myrctype;
    cursor cur_1 is
      select 0 total_record,
             0 total_user,
             0 inday_total_record,
             0 total_time,
             0 max_time,
             0 min_time,
             0 org_id,
             '      ' app_id,
             '          ' business_type,
             '      ' open_type
        from dual;
    tmp_rec1 cur_1%rowtype;
  begin
    v_begin_time := to_date(p_report_date || '000000', 'yyyymmddhh24miss');
    v_end_time   := v_begin_time + 1;
    --1、统计 total_record total_user inday_total_record inday_total_user
    --2 统计耗时
    tmp_cur := pkgsf_report_rptKHflowQry(v_begin_time,
                                         v_end_time,
                                         p_org_id,
                                         p_app_id,
                                         error_no,
                                         error_info);
    loop
      fetch tmp_cur
        into tmp_rec1;
      exit when tmp_cur%NOTFOUND;

      select count(*)
        into v_row_count
        from rpt_kh_flow_analyse t
       where report_date = p_report_date
         and org_id = tmp_rec1.org_id
         and trim(app_id) = trim(tmp_rec1.app_id)
         and trim(open_type) = trim(tmp_rec1.open_type)
         and trim(business_type) = trim(tmp_rec1.business_type);
      if v_row_count > 0 then
        update rpt_kh_flow_analyse
           set total_record       = tmp_rec1.total_record,
               total_user         = tmp_rec1.total_user,
               inday_total_record = tmp_rec1.inday_total_record,
               inday_total_user  =
               (tmp_rec1.total_record - tmp_rec1.inday_total_record),
               max_time           = tmp_rec1.max_time,
               min_time           = tmp_rec1.min_time,
               total_time         = tmp_rec1.total_time
         where report_date = p_report_date
           and org_id = tmp_rec1.org_id
           and trim(app_id) = trim(tmp_rec1.app_id)
           and trim(open_type) = trim(tmp_rec1.open_type)
           and trim(business_type) = trim(tmp_rec1.business_type);
      else
        insert into rpt_kh_flow_analyse
          (report_id,
           report_date,
           org_id,
           app_id,
           open_type,
           business_type,
           total_record,
           total_user,
           inday_total_record,
           inday_total_user,
           max_time,
           min_time,
           total_time)
        values
          (rpt_kh_flow_analyse_seq.nextval,
           p_report_date,
           tmp_rec1.org_id,
           nvl(trim(tmp_rec1.app_id), ' '),
           nvl(trim(tmp_rec1.open_type), ' '),
           nvl(trim(tmp_rec1.business_type), ' '),
           tmp_rec1.total_record,
           tmp_rec1.total_user,
           tmp_rec1.inday_total_record,
           (tmp_rec1.total_record - tmp_rec1.inday_total_record),
           tmp_rec1.max_time,
           tmp_rec1.min_time,
           tmp_rec1.total_time);
      end if;
    end loop;

    select count(*)
      into v_row_count
      from rpt_kh_flow_analyse
     where report_date = trim(p_report_date);

    if v_row_count <= 0 then
      insert into rpt_kh_flow_analyse
        (report_id, report_date)
      values
        (rpt_kh_flow_analyse_seq.nextval, p_report_date);
    end if;

    commit;
    error_no   := 0;
    error_info := '处理成功';
  end;

end PKG_REPORT;
