create or replace package PKG_WSKH is
  TYPE myrctype IS REF CURSOR;
  -- Author  : laijb
  -- Created : 2015/7/31 10:42:11
  -- Purpose : ���Ͽ���ҵ��
  -- error_no Ϊ���ʾ�����˳��������ʾִ�����б���
  /*
  20151008 laijb mod pkgsp_wskh_MessTaskQry��������α꣺�û�����������Ϣ
  20151010 laijb mod pkgsp_wskh_FinishVideo�����Ƶʱ����������֤���־Ϊ1������Ҫ����֤�������ж�����ӦΪ���ڡ�
  20151019 laijb mod pkgsp_wskh_AuditChange��������޸ĺ���ֵ������
  20151021 laijb mod,inner_proc_modifyMessTask�����ɺ󣬷��Ͷ����г��򵥶�ʵ���ˣ����ŵ��洢����
  20151021 laijb mod,pkgsp_wskh_MessTaskFetch������ID��Ϊ������ȡ�������б���Ϊ�����Ĳ�ѯ��
  */
  --�û�ע�᣺�����ֻ�����͵�½��Ϣ��ע�᷵��user_id
  procedure pkgsp_wskh_UserRegByMobile(p_mobile       in varchar2,
                                       p_open_type    in varchar2,
                                       p_register_way in varchar2,
                                       p_app_id       in varchar2,
                                       p_ip_address   in varchar2,
                                       p_op_station   in varchar2,
                                       p_user_id      out varchar2,
                                       error_no       out number,
                                       error_info     out varchar2);
  --��ȡ������񡢻�ȡ��������
  procedure pkgsp_wskh_MessTaskFetch(p_audit_type in varchar2, -- 1-��ˡ� 2-����
                                     p_user_id    in varchar2,
                                     p_task_id    in varchar2,
                                     p_emp_id     in varchar2,
                                     p_emp_name   in varchar2,
                                     error_no     out number,
                                     error_info   out varchar2);

  --������ɫ�� ����func_role ����func_role_resource
  procedure pkgsp_wskh_AddRole(p_role_code       in varchar2,
                               p_role_name       in varchar2,
                               p_memo            in varchar2,
                               p_org_id_str      in varchar2, --�����Ӣ�Ķ��ŷָ�
                               p_resource_id_str in varchar2, --�����ԴȨ����Ӣ�Ķ��ŷָ�
                               error_no          out number,
                               error_info        out varchar2);

  --��ɫ�޸ģ� �޸�func_role ����func_role_resource
  procedure pkgsp_wskh_UpdateRole(p_role_id         in varchar2,
                                  p_role_code       in varchar2,
                                  p_role_name       in varchar2,
                                  p_memo            in varchar2,
                                  p_org_id_str      in varchar2, --�����Ӣ�Ķ��ŷָ�
                                  p_resource_id_str in varchar2, --�����ԴȨ����Ӣ�Ķ��ŷָ�
                                  error_no          out number,
                                  error_info        out varchar2);

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
                                   cur_user_revisit             out myrctype, --�û��طü�¼
                                   error_no                     out number,
                                   error_info                   out varchar2);

  --�������ͨ��
  procedure pkgsp_wskh_TaskAuditPass(p_user_id in varchar2,
                                     p_task_id in varchar2,
                                     p_emp_id  in varchar2,
                                     --p_result_comment in varchar2,
                                     error_no   out number,
                                     error_info out varchar2);
  --������˲���
  procedure pkgsp_wskh_TaskAuditReject(p_user_id        in varchar2,
                                       p_task_id        in varchar2,
                                       p_emp_id         in varchar2,
                                       p_result_comment in varchar2,
                                       p_flow_status    in varchar2,
                                       p_isOpenNewFlow  in varchar2,--0�� 1��
                                       error_no         out number,
                                       error_info       out varchar2);

  /*ͨ��SQLִ��*/
  procedure pkgsp_wskh_PubExec(p_vc_SqlBlock in varchar2, --����sql�飬֧�ִ�����SQL
                               p_vc_SplitStr in varchar2, --sql�ָ��ַ���������Ĭ���Էֺŷָ�
                               error_no      out number,
                               error_info    out varchar2);

  /*����������棬������ʹ�ã������ڲ��洢���̵��ã���commit�¼�*/
  procedure pkgsp_wskh_ApplychangeStatus(p_vc_UserId               in varchar2,
                                         p_vc_ProxNode             in varchar2,
                                         p_vc_EmpId                in varchar2,
                                         p_vc_TaskId               in varchar2,
                                         p_vc_BusinessFlowDesc     in varchar2,
                                         p_vc_BuisnessFlowDetailId in varchar2,
                                         p_vc_AuditType            in varchar2, --reviewonly,auditandreview
                                         p_vc_smsContext           in varchar2,
                                         error_no                  out number,
                                         error_info                out varchar2);

  /*���˽���ύ*/
  procedure pkgsp_wskh_ReviewSubmit(p_vc_UserId           in varchar2, --�����û���
                                    p_vc_EmpId            in varchar2, --������ԱID
                                    p_vc_AuditFlag        in varchar2, --���˽��
                                    p_vc_ExchangeKind_Str in varchar2, --���ŷָ�
                                    p_vc_StockAccount_Str in varchar2, --���ŷָ�
                                    p_vc_AuditType        in varchar2, --reviewonly ֻ��Ҫ���� ,auditandreview ��Ҫ��� ����
                                    p_vc_reasonDesc_Str   in varchar2, --���ŷָ�
                                    p_vc_UserFlowStatus   in varchar2, --��������״̬
                                    --p_vc_PresenceUserStatus in varchar2, --�û�״̬
                                    --p_vc_Content in varchar2,        --���˽���
                                    p_vc_smsContext in varchar2, --�������� Ϊ���򲻷�����
                                    p_isOpenNewFlow  in varchar2, --0�� 1��
                                    error_no        out number,
                                    error_info      out varchar2);

  /*����û������޸�(������Ϣ)*/
  procedure pkgsp_wskh_AuditChange(p_vc_UserId          in varchar2, --�޸��û�ID
                                   p_vc_EmpId           in varchar2, --�޸ĵĲ���Ա��ID
                                   p_vc_TableName       in varchar2, --�޸ı���
                                   p_vc_FieldName       in varchar2, --�޸��ֶ�����
                                   p_vc_FieldInfo       in varchar2, --�޸�ҵ�������Ϣ ����ο� front  UserProperties�ļ�
                                   p_vc_FieldValueOld   in varchar2, --�޸��ֶ���ֵ
                                   p_vc_FieldValueNew   in varchar2, --�޸��ֶ�ԭֵ
                                   p_vc_ChangeID        in varchar2, --change_id
                                   p_vc_FieldValueNew_t in varchar2,
                                   error_no             out number,
                                   error_info           out varchar2);

  /*֤��䷢����ύ*/
  procedure pkgsp_wskh_issueAudit(p_vc_UserId       in varchar2, --�޸��û�ID
                                  p_vc_EmpId        in varchar2, --�޸ĵĲ���Ա��ID
                                  p_vc_TaskId       in varchar2,
                                  p_vc_RejectReason in varchar2, --�޸��ֶ�����
                                  p_vc_ResultType   in varchar2, --�޸�ҵ�������Ϣ ����ο� front  UserProperties�ļ�
                                  error_no          out number,
                                  error_info        out varchar2);
  /*����ʧ��*/
  procedure pkgsp_wskh_openFail(p_vc_UserId in varchar2, --�û�ID
                                p_vc_EmpId  in varchar2,
                                error_no    out number,
                                error_info  out varchar2);
  /*�û�������Ƶ*/
  procedure pkgsp_wskh_acptVideo(p_vc_UserId in varchar2, --�û�ID
                                 p_vc_EmpId  in varchar2,
                                 error_no    out number,
                                 error_info  out varchar2);

  /*��Ƶ����
  p_success_flag =1-�ɹ�  0-ʧ��
  p_cert_flag=1 ��ȡϵͳ���� oss.manual.audit.cert = true
  */
  procedure pkgsp_wskh_FinishVideo(p_vc_UserId    in varchar2, --�û�ID
                                   p_vc_EmpId     in varchar2,
                                   p_success_flag in varchar2,
                                   p_cert_flag    in varchar2,
                                   error_no       out number,
                                   error_info     out varchar2);

end PKG_WSKH;
