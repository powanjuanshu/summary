create or replace package PKG_REPORT is

  -- Author  : �����
  -- Created : 2015/9/6 9:29:44
  -- Purpose : ��Ӫͳ�Ʒ�����ϵͳ

/*�޸ļ�¼
20151026 �޸� ����� ��ͳ�ƺ���ͳ�ƣ����ܴ���ϸ���ܣ�Ҫʵʱ���㣬��ΪСʱ�����п��ܻ��޸ģ����»������ݲ�׼ȷ��
                     ��ͳ�ƺ���ͳ�Ƶ�ʱ����Ҫ������֮ǰ����Ľ���������¼��㣬����ͻ���Ϣ�޸ĺ󣬼��㲻׼ȷ�����⡣
20150924 �޸� ����� �·ݺϼƺ���ϼƣ�����յ�ǰ����ֱ�Ӳ��롣 trim(app_id) ���ܺ�trim()�Ƚϣ�������nvl�ı���

*/

  TYPE myrctype IS REF CURSOR;

  /*����������Ϣͳ�ƣ�ÿ�죩 yyyymmdd ����ÿСʱִ��
  ������ڣ�ϵͳ����- 1Сʱ��ȥβȡ���� �������賿�������⣩
  */
  procedure pkgsp_report_rptUserApplyDaily(p_report_date in varchar2,
                                           p_org_id      in varchar2,
                                           p_app_id      in varchar2,
                                           p_channel_id  in varchar2,
                                           error_no      out number,
                                           error_info    out varchar2);

  /*--����������Ϣͳ�ƣ�ÿ�£�yyyymmdd �³���һ�쵽��ǰ���ڵ�����
  ������ڣ���ǰ����YYYYMMDD- 1 ��
  --1��ע���û����� register_count
  --2�������ύ���� apply_count
  --3������֤�鰲װ���� cert_count
  --4����Ƶ��֤���� video_count
  --5��֤���ϴ����� id_upload_count
  --6��������а����� bank_count
  --7�� �ʽ��˻��������� capital_count
  --8�� �����ɹ����� success_count
  --9�� ����ʧ������ fail_count
  --10������������� audit_count
  --11�����ͨ���������� audit_pass_count
  --12�������������� review_count
  --13������ͨ���������� review_pass_count                                     */
  procedure pkgsp_report_rptUserApplyMonth(p_report_date in varchar2,
                                           p_org_id      in varchar2,
                                           p_app_id      in varchar2,
                                           p_channel_id  in varchar2,
                                           error_no      out number,
                                           error_info    out varchar2);
  /*--����������Ϣͳ�ƣ�ÿСʱ�� ÿСʱִ��
  ���ʱ��Ϊ��Сʱ����130000��ͳ��13-14��֮��Ŀ�������
  ��Σ���ǰʱ�� - 1Сʱ��ȡ YYYYMMDD��Ϊ���ڣ�ʱ����Ϊʱ��
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

  /*  ��Ƶ��ˮͳ�ƣ�ÿʮ���ӣ� ����ÿʮ����ִ��
  ��Σ���ǰʱ�� - 10���ӣ�ȡ���ں�ʱ�䣬��Ϊ���
  */
  procedure pkgsp_report_rptVideoFlowMins(p_report_date in varchar2,
                                          p_report_time in varchar2,
                                          p_org_id      in varchar2,
                                          p_app_id      in varchar2,
                                          error_no      out number,
                                          error_info    out varchar2);
  /*  ��Ƶ��ˮͳ�ƣ�ÿ�죩 ��������ÿСʱִ��
  ��Σ���ǰʱ�� - 1Сʱ��ȡyyyymmdd������Ϊ���
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
  /*  ������ˮ������ÿ�죩 ��������ÿСʱִ��
  ��Σ���ǰʱ�� - 1Сʱ��ȡyyyymmdd������Ϊ���
  */
  procedure pkgsp_report_rptKHflowAnalyse(p_report_date in varchar2,
                                          p_org_id      in varchar2,
                                          p_app_id      in varchar2,
                                          --p_open_type   in varchar2,
                                          error_no   out number,
                                          error_info out varchar2);
end PKG_REPORT;
