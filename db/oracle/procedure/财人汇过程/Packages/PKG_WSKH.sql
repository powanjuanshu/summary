create or replace package PKG_WSKH is
  TYPE myrctype IS REF CURSOR;
  -- Author  : laijb
  -- Created : 2015/7/31 10:42:11
  -- Purpose : 网上开户业务
  -- error_no 为零表示正常退出，否则表示执行中有报错。
  /*
  20151008 laijb mod pkgsp_wskh_MessTaskQry增加输出游标：用户渠道定义信息
  20151010 laijb mod pkgsp_wskh_FinishVideo完成视频时，如果传入的证书标志为1，则需要生成证书任务，判断行数应为等于。
  20151019 laijb mod pkgsp_wskh_AuditChange增加入参修改后新值的名称
  20151021 laijb mod,inner_proc_modifyMessTask审核完成后，发送短信有程序单独实现了，不放到存储过程
  20151021 laijb mod,pkgsp_wskh_MessTaskFetch有任务ID做为主键，取消任务列表作为条件的查询。
  */
  --用户注册：根据手机号码和登陆信息，注册返回user_id
  procedure pkgsp_wskh_UserRegByMobile(p_mobile       in varchar2,
                                       p_open_type    in varchar2,
                                       p_register_way in varchar2,
                                       p_app_id       in varchar2,
                                       p_ip_address   in varchar2,
                                       p_op_station   in varchar2,
                                       p_user_id      out varchar2,
                                       error_no       out number,
                                       error_info     out varchar2);
  --获取审核任务、获取复核任务
  procedure pkgsp_wskh_MessTaskFetch(p_audit_type in varchar2, -- 1-审核、 2-复核
                                     p_user_id    in varchar2,
                                     p_task_id    in varchar2,
                                     p_emp_id     in varchar2,
                                     p_emp_name   in varchar2,
                                     error_no     out number,
                                     error_info   out varchar2);

  --新增角色： 新增func_role 新增func_role_resource
  procedure pkgsp_wskh_AddRole(p_role_code       in varchar2,
                               p_role_name       in varchar2,
                               p_memo            in varchar2,
                               p_org_id_str      in varchar2, --多个用英文逗号分隔
                               p_resource_id_str in varchar2, --多个资源权限用英文逗号分隔
                               error_no          out number,
                               error_info        out varchar2);

  --角色修改： 修改func_role 新增func_role_resource
  procedure pkgsp_wskh_UpdateRole(p_role_id         in varchar2,
                                  p_role_code       in varchar2,
                                  p_role_name       in varchar2,
                                  p_memo            in varchar2,
                                  p_org_id_str      in varchar2, --多个用英文逗号分隔
                                  p_resource_id_str in varchar2, --多个资源权限用英文逗号分隔
                                  error_no          out number,
                                  error_info        out varchar2);

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
                                   cur_user_revisit             out myrctype, --用户回访记录
                                   error_no                     out number,
                                   error_info                   out varchar2);

  --任务审核通过
  procedure pkgsp_wskh_TaskAuditPass(p_user_id in varchar2,
                                     p_task_id in varchar2,
                                     p_emp_id  in varchar2,
                                     --p_result_comment in varchar2,
                                     error_no   out number,
                                     error_info out varchar2);
  --任务审核驳回
  procedure pkgsp_wskh_TaskAuditReject(p_user_id        in varchar2,
                                       p_task_id        in varchar2,
                                       p_emp_id         in varchar2,
                                       p_result_comment in varchar2,
                                       p_flow_status    in varchar2,
                                       p_isOpenNewFlow  in varchar2,--0否 1是
                                       error_no         out number,
                                       error_info       out varchar2);

  /*通用SQL执行*/
  procedure pkgsp_wskh_PubExec(p_vc_SqlBlock in varchar2, --传入sql块，支持传多条SQL
                               p_vc_SplitStr in varchar2, --sql分隔字符串，不传默认以分号分隔
                               error_no      out number,
                               error_info    out varchar2);

  /*开户变更引擎，不单独使用，仅供内部存储过程调用，无commit事件*/
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

  /*复核结果提交*/
  procedure pkgsp_wskh_ReviewSubmit(p_vc_UserId           in varchar2, --复核用户号
                                    p_vc_EmpId            in varchar2, --复核人员ID
                                    p_vc_AuditFlag        in varchar2, --复核结果
                                    p_vc_ExchangeKind_Str in varchar2, --逗号分隔
                                    p_vc_StockAccount_Str in varchar2, --逗号分隔
                                    p_vc_AuditType        in varchar2, --reviewonly 只需要复核 ,auditandreview 需要审核 复核
                                    p_vc_reasonDesc_Str   in varchar2, --逗号分隔
                                    p_vc_UserFlowStatus   in varchar2, --开户进度状态
                                    --p_vc_PresenceUserStatus in varchar2, --用户状态
                                    --p_vc_Content in varchar2,        --复核结论
                                    p_vc_smsContext in varchar2, --短信内容 为空则不发短信
                                    p_isOpenNewFlow  in varchar2, --0否 1是
                                    error_no        out number,
                                    error_info      out varchar2);

  /*审核用户主动修改(单项信息)*/
  procedure pkgsp_wskh_AuditChange(p_vc_UserId          in varchar2, --修改用户ID
                                   p_vc_EmpId           in varchar2, --修改的操作员的ID
                                   p_vc_TableName       in varchar2, --修改表名
                                   p_vc_FieldName       in varchar2, --修改字段名串
                                   p_vc_FieldInfo       in varchar2, --修改业务表列信息 详情参考 front  UserProperties文件
                                   p_vc_FieldValueOld   in varchar2, --修改字段新值
                                   p_vc_FieldValueNew   in varchar2, --修改字段原值
                                   p_vc_ChangeID        in varchar2, --change_id
                                   p_vc_FieldValueNew_t in varchar2,
                                   error_no             out number,
                                   error_info           out varchar2);

  /*证书颁发结果提交*/
  procedure pkgsp_wskh_issueAudit(p_vc_UserId       in varchar2, --修改用户ID
                                  p_vc_EmpId        in varchar2, --修改的操作员的ID
                                  p_vc_TaskId       in varchar2,
                                  p_vc_RejectReason in varchar2, --修改字段名串
                                  p_vc_ResultType   in varchar2, --修改业务表列信息 详情参考 front  UserProperties文件
                                  error_no          out number,
                                  error_info        out varchar2);
  /*开户失败*/
  procedure pkgsp_wskh_openFail(p_vc_UserId in varchar2, --用户ID
                                p_vc_EmpId  in varchar2,
                                error_no    out number,
                                error_info  out varchar2);
  /*用户接受视频*/
  procedure pkgsp_wskh_acptVideo(p_vc_UserId in varchar2, --用户ID
                                 p_vc_EmpId  in varchar2,
                                 error_no    out number,
                                 error_info  out varchar2);

  /*视频结束
  p_success_flag =1-成功  0-失败
  p_cert_flag=1 读取系统配置 oss.manual.audit.cert = true
  */
  procedure pkgsp_wskh_FinishVideo(p_vc_UserId    in varchar2, --用户ID
                                   p_vc_EmpId     in varchar2,
                                   p_success_flag in varchar2,
                                   p_cert_flag    in varchar2,
                                   error_no       out number,
                                   error_info     out varchar2);

end PKG_WSKH;
