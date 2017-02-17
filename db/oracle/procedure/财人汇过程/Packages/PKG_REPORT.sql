create or replace package PKG_REPORT is

  -- Author  : 来金彪
  -- Created : 2015/9/6 9:29:44
  -- Purpose : 运营统计分析子系统

/*修改记录
20151026 修改 来金彪 月统计和天统计，不能从明细汇总，要实时计算，因为小时数据有可能会修改，导致汇总数据不准确。
                     月统计和天统计的时候，需要先重置之前计算的结果，再重新计算，避免客户信息修改后，计算不准确的问题。
20150924 修改 来金彪 月份合计和天合计，先清空当前，再直接插入。 trim(app_id) 不能和trim()比较，增加了nvl的保护

*/

  TYPE myrctype IS REF CURSOR;

  /*开户数据信息统计（每天） yyyymmdd 建议每小时执行
  入参日期：系统日期- 1小时，去尾取日期 （避免凌晨跨天问题）
  */
  procedure pkgsp_report_rptUserApplyDaily(p_report_date in varchar2,
                                           p_org_id      in varchar2,
                                           p_app_id      in varchar2,
                                           p_channel_id  in varchar2,
                                           error_no      out number,
                                           error_info    out varchar2);

  /*--开户数据信息统计（每月）yyyymmdd 月初第一天到当前日期的数据
  入参日期：当前日期YYYYMMDD- 1 天
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
  --13、复核通过任务数量 review_pass_count                                     */
  procedure pkgsp_report_rptUserApplyMonth(p_report_date in varchar2,
                                           p_org_id      in varchar2,
                                           p_app_id      in varchar2,
                                           p_channel_id  in varchar2,
                                           error_no      out number,
                                           error_info    out varchar2);
  /*--开户数据信息统计（每小时） 每小时执行
  入参时间为整小时，如130000，统计13-14点之间的开户数据
  入参：当前时间 - 1小时，取 YYYYMMDD作为日期，时间作为时间
                                   */
  procedure pkgsp_report_rptUserApplyHour(p_report_date in varchar2,
                                          p_report_time in varchar2,
                                          p_org_id      in varchar2,
                                          p_app_id      in varchar2,
                                          p_channel_id  in varchar2,
                                          error_no      out number,
                                          error_info    out varchar2);

  function pkgsf_report_rptUserApplyReg(p_begin_time in date,
                                        p_end_time   in date,
                                        p_org_id     in varchar2,
                                        p_app_id     in varchar2,
                                        p_channel_id in varchar2,
                                        error_no     out number,
                                        error_info   out varchar2)
    return myrctype;

  function pkgsf_report_rptUserApplyApl(p_begin_time in date,
                                        p_end_time   in date,
                                        p_org_id     in varchar2,
                                        p_app_id     in varchar2,
                                        p_channel_id in varchar2,
                                        error_no     out number,
                                        error_info   out varchar2)
    return myrctype;

  function pkgsf_report_rptUserApplyCert(p_begin_time in date,
                                         p_end_time   in date,
                                         p_org_id     in varchar2,
                                         p_app_id     in varchar2,
                                         p_channel_id in varchar2,
                                         error_no     out number,
                                         error_info   out varchar2)
    return myrctype;

  function pkgsf_report_rptUserApplyVideo(p_begin_time in date,
                                          p_end_time   in date,
                                          p_org_id     in varchar2,
                                          p_app_id     in varchar2,
                                          p_channel_id in varchar2,
                                          error_no     out number,
                                          error_info   out varchar2)
    return myrctype;

  function pkgsf_report_rptUserApplyID(p_begin_time in date,
                                       p_end_time   in date,
                                       p_org_id     in varchar2,
                                       p_app_id     in varchar2,
                                       p_channel_id in varchar2,
                                       error_no     out number,
                                       error_info   out varchar2)
    return myrctype;

  function pkgsf_report_rptUserApplyBank(p_begin_time in date,
                                         p_end_time   in date,
                                         p_org_id     in varchar2,
                                         p_app_id     in varchar2,
                                         p_channel_id in varchar2,
                                         error_no     out number,
                                         error_info   out varchar2)
    return myrctype;

  function pkgsf_report_rptUserApplyFund(p_begin_time in date,
                                         p_end_time   in date,
                                         p_org_id     in varchar2,
                                         p_app_id     in varchar2,
                                         p_channel_id in varchar2,
                                         error_no     out number,
                                         error_info   out varchar2)
    return myrctype;

  function pkgsf_report_rptUserApplySucc(p_begin_time in date,
                                         p_end_time   in date,
                                         p_org_id     in varchar2,
                                         p_app_id     in varchar2,
                                         p_channel_id in varchar2,
                                         error_no     out number,
                                         error_info   out varchar2)
    return myrctype;

  function pkgsf_report_rptUserApplyFail(p_begin_time in date,
                                         p_end_time   in date,
                                         p_org_id     in varchar2,
                                         p_app_id     in varchar2,
                                         p_channel_id in varchar2,
                                         error_no     out number,
                                         error_info   out varchar2)
    return myrctype;

  function pkgsf_report_rptUserApplyAudit(p_begin_time in date,
                                          p_end_time   in date,
                                          p_org_id     in varchar2,
                                          p_app_id     in varchar2,
                                          p_channel_id in varchar2,
                                          error_no     out number,
                                          error_info   out varchar2)
    return myrctype;

  function pkgsf_report_rptUserApplyAdtP(p_begin_time in date,
                                         p_end_time   in date,
                                         p_org_id     in varchar2,
                                         p_app_id     in varchar2,
                                         p_channel_id in varchar2,
                                         error_no     out number,
                                         error_info   out varchar2)
    return myrctype;
  function pkgsf_report_rptUserApplyRev(p_begin_time in date,
                                        p_end_time   in date,
                                        p_org_id     in varchar2,
                                        p_app_id     in varchar2,
                                        p_channel_id in varchar2,
                                        error_no     out number,
                                        error_info   out varchar2)
    return myrctype;
  function pkgsf_report_rptUserApplyRevP(p_begin_time in date,
                                         p_end_time   in date,
                                         p_org_id     in varchar2,
                                         p_app_id     in varchar2,
                                         p_channel_id in varchar2,
                                         error_no     out number,
                                         error_info   out varchar2)
    return myrctype;
  function pkgsf_report_rptVideoFlowQry(p_begin_time in date,
                                        p_end_time   in date,
                                        p_org_id     in varchar2,
                                        p_app_id     in varchar2,
                                        error_no     out number,
                                        error_info   out varchar2)
    return myrctype;
  function pkgsf_report_rptVideoFlowTime(p_begin_time in date,
                                         p_end_time   in date,
                                         p_org_id     in varchar2,
                                         p_app_id     in varchar2,
                                         error_no     out number,
                                         error_info   out varchar2)
    return myrctype;

  function pkgsf_report_rptVideoFlowUser(p_begin_time in date,
                                         p_end_time   in date,
                                         p_org_id     in varchar2,
                                         p_app_id     in varchar2,
                                         error_no     out number,
                                         error_info   out varchar2)
    return myrctype;
  function pkgsf_report_rptVideoFlowEmp(p_begin_time in date,
                                        p_end_time   in date,
                                        p_org_id     in varchar2,
                                        p_app_id     in varchar2,
                                        error_no     out number,
                                        error_info   out varchar2)
    return myrctype;

  /*  视频流水统计（每十分钟） 设置每十分钟执行
  入参：当前时间 - 10分钟，取日期和时间，作为入参
  */
  procedure pkgsp_report_rptVideoFlowMins(p_report_date in varchar2,
                                          p_report_time in varchar2,
                                          p_org_id      in varchar2,
                                          p_app_id      in varchar2,
                                          error_no      out number,
                                          error_info    out varchar2);
  /*  视频流水统计（每天） 建议设置每小时执行
  入参：当前时间 - 1小时，取yyyymmdd日期作为入参
  */
  procedure pkgsp_report_rptVideoFlowDaily(p_report_date in varchar2,
                                           p_org_id      in varchar2,
                                           p_app_id      in varchar2,
                                           error_no      out number,
                                           error_info    out varchar2);

  function pkgsf_report_rptKHflowQry(p_begin_time in date,
                                     p_end_time   in date,
                                     p_org_id     in varchar2,
                                     p_app_id     in varchar2,
                                     error_no     out number,
                                     error_info   out varchar2)
    return myrctype;
  /*  开户流水分析（每天） 建议设置每小时执行
  入参：当前时间 - 1小时，取yyyymmdd日期作为入参
  */
  procedure pkgsp_report_rptKHflowAnalyse(p_report_date in varchar2,
                                          p_org_id      in varchar2,
                                          p_app_id      in varchar2,
                                          --p_open_type   in varchar2,
                                          error_no   out number,
                                          error_info out varchar2);
end PKG_REPORT;
