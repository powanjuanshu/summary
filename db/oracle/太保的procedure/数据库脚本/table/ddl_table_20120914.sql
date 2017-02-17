----------------------------------------------------
-- Export file for user SXDXSJ                    --
-- Created by Administrator on 2012-9-14, 9:53:15 --
----------------------------------------------------

spool ddl_table_20120914.log

prompt
prompt Creating table BANK_ACCOUNTS
prompt ============================
prompt
create table SXDXSJ.BANK_ACCOUNTS
(
  customer_id   CHAR(18),
  account_no    CHAR(40) not null,
  bank_code     CHAR(20),
  bank_name     VARCHAR2(120),
  partition_col NUMBER(6) not null
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.BANK_ACCOUNTS
  is '客户的银行账号信息';
comment on column SXDXSJ.BANK_ACCOUNTS.customer_id
  is '客户身份证号码';
comment on column SXDXSJ.BANK_ACCOUNTS.account_no
  is '账户号';
comment on column SXDXSJ.BANK_ACCOUNTS.bank_code
  is '开户行代码';
comment on column SXDXSJ.BANK_ACCOUNTS.bank_name
  is '开户银行名称';
comment on column SXDXSJ.BANK_ACCOUNTS.partition_col
  is '客户分区列';
create index SXDXSJ.IDX_BANCKACCOUNTS_CUSTOMERID on SXDXSJ.BANK_ACCOUNTS (CUSTOMER_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.INDEX_BA_PART on SXDXSJ.BANK_ACCOUNTS (PARTITION_COL)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.BANK_ACCOUNTS
  add constraint PK_BANK_ACCOUNTS primary key (ACCOUNT_NO)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.BANK_ACCOUNTS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.BANK_ACCOUNTS to SXDXSJAPP;
grant select on SXDXSJ.BANK_ACCOUNTS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.BANK_ACCOUNTS to SXDXSJMOD;

prompt
prompt Creating table BAN_SHCPIC_PREINS_CUS_INF
prompt ========================================
prompt
create table SXDXSJ.BAN_SHCPIC_PREINS_CUS_INF
(
  ban_shcpic_preins_cus_inf_id  NUMBER(10) not null,
  ban_shcpic_preins_cus_inf_num VARCHAR2(20),
  c_agentcompany_code           VARCHAR2(100),
  ban_shcpic_preins_cus_inf_nam VARCHAR2(100),
  ban_shcpic_preins_cus_inf_tab VARCHAR2(100),
  ban_shcpic_preins_cus_inf_dat VARCHAR2(100)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.BAN_SHCPIC_PREINS_CUS_INF to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.BAN_SHCPIC_PREINS_CUS_INF to SXDXSJAPP;
grant select on SXDXSJ.BAN_SHCPIC_PREINS_CUS_INF to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.BAN_SHCPIC_PREINS_CUS_INF to SXDXSJMOD;

prompt
prompt Creating table BARRING_NAME
prompt ===========================
prompt
create table SXDXSJ.BARRING_NAME
(
  barringname_id NUMBER not null,
  customer_name  VARCHAR2(50),
  customer_id    VARCHAR2(50),
  birthday       VARCHAR2(20),
  phone          VARCHAR2(20),
  barring_time   DATE,
  barring_type   VARCHAR2(2),
  flag           VARCHAR2(2)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.BARRING_NAME
  is '禁拨名单表';
comment on column SXDXSJ.BARRING_NAME.barringname_id
  is '禁拨名单ID';
comment on column SXDXSJ.BARRING_NAME.customer_name
  is '客户姓名';
comment on column SXDXSJ.BARRING_NAME.customer_id
  is '身份证号码';
comment on column SXDXSJ.BARRING_NAME.birthday
  is '出生日期';
comment on column SXDXSJ.BARRING_NAME.phone
  is '电话号码';
comment on column SXDXSJ.BARRING_NAME.barring_time
  is '禁拨时间';
comment on column SXDXSJ.BARRING_NAME.barring_type
  is '禁拨类型:01红名单,02黑名单,03投拆客户';
comment on column SXDXSJ.BARRING_NAME.flag
  is '有效状态:01有效';
create index SXDXSJ.IDX_BARRING_NAME_01 on SXDXSJ.BARRING_NAME (CUSTOMER_NAME, BIRTHDAY, PHONE, CUSTOMER_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.BARRING_NAME
  add constraint PK_BARRING_NAME01 primary key (BARRINGNAME_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.BARRING_NAME to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.BARRING_NAME to SXDXSJAPP;
grant select on SXDXSJ.BARRING_NAME to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.BARRING_NAME to SXDXSJMOD;

prompt
prompt Creating table BATCH_MANAGEMENT
prompt ===============================
prompt
create table SXDXSJ.BATCH_MANAGEMENT
(
  batch_code              NUMBER not null,
  clean_status            NUMBER(3),
  mobile_dial_status      NUMBER(3),
  tel_dial_status         NUMBER(3),
  mobile_begin_dial       DATE,
  sms_send_end_time       DATE,
  mobile_end_dial         DATE,
  tel_begin_dial          DATE,
  tel_end_dial            DATE,
  commit_time             DATE,
  writeback_time          DATE,
  init_mobile_count       NUMBER(10),
  init_tel_count          NUMBER(10),
  success_mobile_count    NUMBER(10),
  success_tel_count       NUMBER(10),
  init_count              NUMBER(10),
  success_count           NUMBER(10),
  send_clean_tel_count    NUMBER(10),
  send_clean_mobile_count NUMBER(10)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.BATCH_MANAGEMENT
  is '电话清洗的批次管理表
tel_dial_status:
-3：暂停
-2：取消，
-1：异常，
0或null：外拨中（初始状态），
1：回写完成
mobile_dial_status:
-3：暂停
-2：取消，
-1：异常，
0或null：外拨中（初始状态），
1：回写完成
clean_status:
-3：暂停
-2：取消，
-1：异常，
0或null：外拨中（初始状态），
1：回写完成';
comment on column SXDXSJ.BATCH_MANAGEMENT.batch_code
  is '批号';
comment on column SXDXSJ.BATCH_MANAGEMENT.clean_status
  is '状态';
comment on column SXDXSJ.BATCH_MANAGEMENT.mobile_dial_status
  is '手机清洗状态';
comment on column SXDXSJ.BATCH_MANAGEMENT.tel_dial_status
  is '固话清洗状态';
comment on column SXDXSJ.BATCH_MANAGEMENT.mobile_begin_dial
  is '手机开始清洗时间';
comment on column SXDXSJ.BATCH_MANAGEMENT.sms_send_end_time
  is '预计短信发送结束时间';
comment on column SXDXSJ.BATCH_MANAGEMENT.mobile_end_dial
  is '手机结束清洗时间';
comment on column SXDXSJ.BATCH_MANAGEMENT.tel_begin_dial
  is '固话开始清洗时间';
comment on column SXDXSJ.BATCH_MANAGEMENT.tel_end_dial
  is '固话结束清洗时间';
comment on column SXDXSJ.BATCH_MANAGEMENT.commit_time
  is '提交清洗时间';
comment on column SXDXSJ.BATCH_MANAGEMENT.writeback_time
  is '回写清洗时间';
comment on column SXDXSJ.BATCH_MANAGEMENT.init_mobile_count
  is '手机初始数量';
comment on column SXDXSJ.BATCH_MANAGEMENT.init_tel_count
  is '固话初始数量';
comment on column SXDXSJ.BATCH_MANAGEMENT.success_mobile_count
  is '手机成功数量';
comment on column SXDXSJ.BATCH_MANAGEMENT.success_tel_count
  is '固话成功数量';
comment on column SXDXSJ.BATCH_MANAGEMENT.init_count
  is '初始总数';
comment on column SXDXSJ.BATCH_MANAGEMENT.success_count
  is '成功总数';
alter table SXDXSJ.BATCH_MANAGEMENT
  add constraint PK_BATCH_MANAGEMENT primary key (BATCH_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.BATCH_MANAGEMENT to DXSJDBEXTR;
grant select on SXDXSJ.BATCH_MANAGEMENT to NUANCE;
grant select, insert, update, delete on SXDXSJ.BATCH_MANAGEMENT to SXDXSJAPP;
grant select on SXDXSJ.BATCH_MANAGEMENT to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.BATCH_MANAGEMENT to SXDXSJMOD;

prompt
prompt Creating table CLEANING_PHONE
prompt =============================
prompt
create table SXDXSJ.CLEANING_PHONE
(
  batch_code  NUMBER(20),
  customer_id VARCHAR2(30),
  phone       VARCHAR2(30) not null,
  is_mobile   NUMBER(1),
  status      NUMBER(3) default 0
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.CLEANING_PHONE
  is '清洗中的电话号码，包括手机和固定电话
status
1:成功
0:失败';
comment on column SXDXSJ.CLEANING_PHONE.batch_code
  is '批次编号';
comment on column SXDXSJ.CLEANING_PHONE.customer_id
  is '身份证号码';
comment on column SXDXSJ.CLEANING_PHONE.phone
  is '电话号码';
comment on column SXDXSJ.CLEANING_PHONE.is_mobile
  is '电话类型号码';
comment on column SXDXSJ.CLEANING_PHONE.status
  is '清洗结果';
alter table SXDXSJ.CLEANING_PHONE
  add constraint PK_CLEANING_PHONE primary key (PHONE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.CLEANING_PHONE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.CLEANING_PHONE to SXDXSJAPP;
grant select on SXDXSJ.CLEANING_PHONE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.CLEANING_PHONE to SXDXSJMOD;

prompt
prompt Creating table CLEANING_PHONE_TEST
prompt ==================================
prompt
create table SXDXSJ.CLEANING_PHONE_TEST
(
  batch_code  NUMBER(20),
  customer_id VARCHAR2(30),
  phone       VARCHAR2(30) not null,
  is_mobile   NUMBER(1),
  status      NUMBER(3) default 0
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.CLEANING_PHONE_TEST to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.CLEANING_PHONE_TEST to SXDXSJAPP;
grant select on SXDXSJ.CLEANING_PHONE_TEST to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.CLEANING_PHONE_TEST to SXDXSJMOD;

prompt
prompt Creating table CLEAN_PHONE_HISTORY
prompt ==================================
prompt
create table SXDXSJ.CLEAN_PHONE_HISTORY
(
  phone       VARCHAR2(30),
  dial_time   DATE,
  dial_result NUMBER(1)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.CLEAN_PHONE_HISTORY
  is '半年内清洗过的所有电话号码及其清洗结果
dial_result
0 :失败
1：成功';
comment on column SXDXSJ.CLEAN_PHONE_HISTORY.phone
  is '电话号码';
comment on column SXDXSJ.CLEAN_PHONE_HISTORY.dial_time
  is '清洗时间';
comment on column SXDXSJ.CLEAN_PHONE_HISTORY.dial_result
  is '清洗结果';
grant select on SXDXSJ.CLEAN_PHONE_HISTORY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.CLEAN_PHONE_HISTORY to SXDXSJAPP;
grant select on SXDXSJ.CLEAN_PHONE_HISTORY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.CLEAN_PHONE_HISTORY to SXDXSJMOD;

prompt
prompt Creating table CPIC_AGENTCOMPANY_CUS_INFO
prompt =========================================
prompt
create table SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO
(
  agentcompany_id   NUMBER(10),
  agentcompany_name VARCHAR2(100),
  salecall_status   VARCHAR2(2),
  name_status       VARCHAR2(2),
  birth_staus       VARCHAR2(2),
  cus_phone         VARCHAR2(30) not null,
  ins_id            VARCHAR2(30),
  ins_name          VARCHAR2(100),
  ins_fee           NUMBER(20,2),
  statis_date       DATE,
  call_date         DATE,
  oper_name         VARCHAR2(100),
  cus_name          VARCHAR2(100)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO
  is '中介机构用户明细信息表';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.agentcompany_id
  is '中介机构ID';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.agentcompany_name
  is '中介机构名称';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.salecall_status
  is '营销拨打结果状态';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.name_status
  is '姓名是否正确状态';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.birth_staus
  is '生日是否正确状态';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.cus_phone
  is '客户电话号码';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.ins_id
  is '险种ID';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.ins_name
  is '险种名称';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.ins_fee
  is '费用';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.statis_date
  is '统计时间';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.call_date
  is '拨打时间';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.oper_name
  is '电销员姓名';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.cus_name
  is '客户姓名';
alter table SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO
  add constraint PK_CPIC_AGENTCOMPANY_CUS_INFO primary key (CUS_PHONE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO to SXDXSJAPP;
grant select on SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO to SXDXSJMOD;

prompt
prompt Creating table CPIC_COMPANY
prompt ===========================
prompt
create table SXDXSJ.CPIC_COMPANY
(
  id                   NUMBER(10) not null,
  company_code         VARCHAR2(20),
  company_name         VARCHAR2(50),
  operate_user_code    VARCHAR2(20),
  operate_user_name    VARCHAR2(20),
  is_del               VARCHAR2(2),
  is_branch_company    VARCHAR2(2),
  parent_company_id    NUMBER(10),
  isff                 VARCHAR2(2),
  company_finance_code VARCHAR2(10),
  region_code          VARCHAR2(30),
  company_type         CHAR(2)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.CPIC_COMPANY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.CPIC_COMPANY to SXDXSJAPP;
grant select on SXDXSJ.CPIC_COMPANY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.CPIC_COMPANY to SXDXSJMOD;

prompt
prompt Creating table CPIC_PRESENTINS_DETAIL_INFO
prompt ==========================================
prompt
create table SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO
(
  grp_id        NUMBER(10),
  grp_name      VARCHAR2(100),
  prj_id        NUMBER(10),
  prj_name      VARCHAR2(100),
  region_code   VARCHAR2(30),
  region_name   VARCHAR2(200),
  appno         VARCHAR2(18) not null,
  ins_status    VARCHAR2(3),
  policy_holder VARCHAR2(100),
  policy_phone  VARCHAR2(30),
  ins_id        VARCHAR2(30),
  ins_name      VARCHAR2(200),
  policyfee     NUMBER(20,2),
  bank_name     VARCHAR2(120),
  bank_account  VARCHAR2(40),
  create_date   DATE,
  modify_date   DATE,
  import_date   DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO
  is '赠险投保单明细表';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.grp_id
  is '项目群id';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.grp_name
  is '项目群名称';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.prj_id
  is '项目id';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.prj_name
  is '项目名称';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.region_code
  is '地区id';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.region_name
  is '地区名称';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.appno
  is '投保单号';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.ins_status
  is '投保单状态';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.policy_holder
  is '投保人姓名';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.policy_phone
  is '联系方式';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.ins_id
  is '险种代码';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.ins_name
  is '险种名称';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.policyfee
  is '保费';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.bank_name
  is '开户银行';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.bank_account
  is '银行账号';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.create_date
  is '投保日期';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.modify_date
  is '最后修改日期';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.import_date
  is '成功导入日期';
alter table SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO
  add constraint PK_CPIC_PRESENTINS_DETAIL_INFO primary key (APPNO)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO to SXDXSJAPP;
grant select on SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO to SXDXSJMOD;

prompt
prompt Creating table CPIC_PRESENTINS_STACHANGE_HIS
prompt ============================================
prompt
create table SXDXSJ.CPIC_PRESENTINS_STACHANGE_HIS
(
  appno       VARCHAR2(18) not null,
  ins_status  VARCHAR2(3),
  change_date DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.CPIC_PRESENTINS_STACHANGE_HIS
  is '赠险投保单状态变更历史表';
comment on column SXDXSJ.CPIC_PRESENTINS_STACHANGE_HIS.appno
  is '投保单号';
comment on column SXDXSJ.CPIC_PRESENTINS_STACHANGE_HIS.ins_status
  is '投保单状态';
comment on column SXDXSJ.CPIC_PRESENTINS_STACHANGE_HIS.change_date
  is '变更时间';
create index SXDXSJ.IDX_CPIC_PRESENTINS_01 on SXDXSJ.CPIC_PRESENTINS_STACHANGE_HIS (APPNO)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.CPIC_PRESENTINS_STACHANGE_HIS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.CPIC_PRESENTINS_STACHANGE_HIS to SXDXSJAPP;
grant select on SXDXSJ.CPIC_PRESENTINS_STACHANGE_HIS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.CPIC_PRESENTINS_STACHANGE_HIS to SXDXSJMOD;

prompt
prompt Creating table CPIC_PRESENTINS_WORKLIST_HIS
prompt ===========================================
prompt
create table SXDXSJ.CPIC_PRESENTINS_WORKLIST_HIS
(
  oper_id     VARCHAR2(10),
  nc_status   VARCHAR2(2),
  appno       VARCHAR2(18) not null,
  create_date DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.CPIC_PRESENTINS_WORKLIST_HIS
  is '工单历史信息表';
comment on column SXDXSJ.CPIC_PRESENTINS_WORKLIST_HIS.oper_id
  is '操作员工号';
comment on column SXDXSJ.CPIC_PRESENTINS_WORKLIST_HIS.nc_status
  is '提醒状态码';
comment on column SXDXSJ.CPIC_PRESENTINS_WORKLIST_HIS.appno
  is '投保单号';
comment on column SXDXSJ.CPIC_PRESENTINS_WORKLIST_HIS.create_date
  is '生成时间';
create index SXDXSJ.IDX_PRESENTINS_WORKLIST_HIS_01 on SXDXSJ.CPIC_PRESENTINS_WORKLIST_HIS (APPNO)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.CPIC_PRESENTINS_WORKLIST_HIS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.CPIC_PRESENTINS_WORKLIST_HIS to SXDXSJAPP;
grant select on SXDXSJ.CPIC_PRESENTINS_WORKLIST_HIS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.CPIC_PRESENTINS_WORKLIST_HIS to SXDXSJMOD;

prompt
prompt Creating table CUSTOMER
prompt =======================
prompt
create table SXDXSJ.CUSTOMER
(
  customer_id                CHAR(18) not null,
  copy_id                    CHAR(40),
  customer_name              VARCHAR2(120),
  birthday                   DATE,
  age                        NUMBER(3),
  gender_code                NUMBER(3),
  marital_status             VARCHAR2(10),
  death_critical_illness     VARCHAR2(6),
  fax                        VARCHAR2(30),
  family_zip_code            VARCHAR2(10),
  company_zip_code           VARCHAR2(10),
  family_address             VARCHAR2(508),
  company_address            VARCHAR2(508),
  company                    VARCHAR2(508),
  contact_address            VARCHAR2(508),
  job_name                   VARCHAR2(40),
  education_level            VARCHAR2(40),
  income                     NUMBER(12,2),
  email                      VARCHAR2(40),
  month_amount               NUMBER(15,2),
  zone_code                  VARCHAR2(20),
  update_time                VARCHAR2(20),
  govern_id                  VARCHAR2(30),
  latest_sale_date           DATE,
  revist_time                DATE,
  revist_result              NUMBER(3) default 0,
  source_type_code           NUMBER(3),
  age_zone_code              NUMBER(3),
  birthdate_month_day_code   NUMBER(3),
  from_last_sale_time_code   NUMBER(3) default 0,
  dial_times_code            NUMBER(3) default 0,
  clear_status_code          NUMBER(3),
  operation_status_code      NUMBER(3) default 0,
  sale_status_code           NUMBER(3) default 0,
  orphan_status_code         NUMBER(3) default 0,
  bank_status_code           NUMBER(3),
  policy_status_code         NUMBER(3) default 4,
  branch_delivery_code       NUMBER(3),
  company_delivery_code      NUMBER(3),
  pay_by_pos_code            NUMBER(3),
  pay_by_bank_code           NUMBER(3),
  has_rectele_code           NUMBER(3),
  has_ftele_code             NUMBER(3),
  has_ctele_code             NUMBER(3),
  has_mobile_code            NUMBER(3),
  month_amount_code          NUMBER(3) default 0,
  zone_type_code             NUMBER(3) default 3,
  dial_time_length_code      NUMBER(3) default 0,
  level_code                 NUMBER(3),
  city                       VARCHAR2(120),
  province                   VARCHAR2(120),
  from_last_revist_time_code NUMBER(3) default 0,
  branch_code                NUMBER(6) default 0,
  note                       VARCHAR2(2000),
  any_date                   DATE,
  other_info_1               VARCHAR2(100),
  other_info_2               VARCHAR2(100),
  other_info_3               VARCHAR2(100),
  other_info_5               VARCHAR2(100),
  other_info_4               VARCHAR2(100),
  batch_id                   NUMBER(20),
  task_id                    NUMBER(20),
  tel_code                   VARCHAR2(20),
  purchase_product_list      VARCHAR2(20),
  d_donation_code            NUMBER(3) default 0,
  partition_col              NUMBER(6) not null,
  ismeet                     NUMBER(3)
)
partition by list (PARTITION_COL)
(
  partition PART01 values (1)
    tablespace SXDXSJ_DATA_P01
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART02 values (2)
    tablespace SXDXSJ_DATA_P02
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART03 values (3)
    tablespace SXDXSJ_DATA_P03
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART04 values (4)
    tablespace SXDXSJ_DATA_P04
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART05 values (5)
    tablespace SXDXSJ_DATA_P05
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART06 values (6)
    tablespace SXDXSJ_DATA_P06
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART07 values (7)
    tablespace SXDXSJ_DATA_P07
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART08 values (8)
    tablespace SXDXSJ_DATA_P08
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART09 values (9)
    tablespace SXDXSJ_DATA_P09
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART00 values (default)
    tablespace SXDXSJ_DATA_P10
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    )
);
comment on table SXDXSJ.CUSTOMER
  is '客户信息表，包含多有的维度信息';
comment on column SXDXSJ.CUSTOMER.customer_id
  is '身份证号码';
comment on column SXDXSJ.CUSTOMER.copy_id
  is '身份证号码副本';
comment on column SXDXSJ.CUSTOMER.customer_name
  is '姓名';
comment on column SXDXSJ.CUSTOMER.birthday
  is '出生年月日';
comment on column SXDXSJ.CUSTOMER.age
  is '年龄';
comment on column SXDXSJ.CUSTOMER.gender_code
  is '性别代码';
comment on column SXDXSJ.CUSTOMER.marital_status
  is '婚姻状况';
comment on column SXDXSJ.CUSTOMER.death_critical_illness
  is '死亡及重大疾病记录';
comment on column SXDXSJ.CUSTOMER.fax
  is '传真';
comment on column SXDXSJ.CUSTOMER.family_zip_code
  is '家庭邮政编码';
comment on column SXDXSJ.CUSTOMER.company_zip_code
  is '单位邮政编码';
comment on column SXDXSJ.CUSTOMER.family_address
  is '家庭地址';
comment on column SXDXSJ.CUSTOMER.company_address
  is '单位地址';
comment on column SXDXSJ.CUSTOMER.company
  is '企业名称';
comment on column SXDXSJ.CUSTOMER.contact_address
  is '通讯地址';
comment on column SXDXSJ.CUSTOMER.job_name
  is '职业名称';
comment on column SXDXSJ.CUSTOMER.education_level
  is '教育程度/学历';
comment on column SXDXSJ.CUSTOMER.income
  is '收入';
comment on column SXDXSJ.CUSTOMER.email
  is '电子邮件';
comment on column SXDXSJ.CUSTOMER.month_amount
  is '月缴保费';
comment on column SXDXSJ.CUSTOMER.zone_code
  is '区域编码';
comment on column SXDXSJ.CUSTOMER.update_time
  is '最后更新日期';
comment on column SXDXSJ.CUSTOMER.govern_id
  is '机构码';
comment on column SXDXSJ.CUSTOMER.latest_sale_date
  is '最近一次销售时间';
comment on column SXDXSJ.CUSTOMER.revist_time
  is '回访时间';
comment on column SXDXSJ.CUSTOMER.revist_result
  is '回访结果';
comment on column SXDXSJ.CUSTOMER.source_type_code
  is '信息来源';
comment on column SXDXSJ.CUSTOMER.age_zone_code
  is '年龄编码';
comment on column SXDXSJ.CUSTOMER.birthdate_month_day_code
  is '生日月份';
comment on column SXDXSJ.CUSTOMER.from_last_sale_time_code
  is '最近一次销售据现在时间';
comment on column SXDXSJ.CUSTOMER.dial_times_code
  is '电销次数';
comment on column SXDXSJ.CUSTOMER.clear_status_code
  is '清洗状态码';
comment on column SXDXSJ.CUSTOMER.operation_status_code
  is '保全状态码';
comment on column SXDXSJ.CUSTOMER.sale_status_code
  is '销售状态码';
comment on column SXDXSJ.CUSTOMER.orphan_status_code
  is '孤儿单状态码';
comment on column SXDXSJ.CUSTOMER.bank_status_code
  is '银行状态码';
comment on column SXDXSJ.CUSTOMER.policy_status_code
  is '保单状态码';
comment on column SXDXSJ.CUSTOMER.branch_delivery_code
  is '是否可分公司快递';
comment on column SXDXSJ.CUSTOMER.company_delivery_code
  is '是否可总公司快递';
comment on column SXDXSJ.CUSTOMER.pay_by_pos_code
  is '是否可pos机付费';
comment on column SXDXSJ.CUSTOMER.pay_by_bank_code
  is '是否可银行代扣';
comment on column SXDXSJ.CUSTOMER.has_rectele_code
  is '是否有收费电话';
comment on column SXDXSJ.CUSTOMER.has_ftele_code
  is '是否有家庭电话';
comment on column SXDXSJ.CUSTOMER.has_ctele_code
  is '是否有办公电话';
comment on column SXDXSJ.CUSTOMER.has_mobile_code
  is '是否有手机';
comment on column SXDXSJ.CUSTOMER.month_amount_code
  is '月缴保费区间';
comment on column SXDXSJ.CUSTOMER.zone_type_code
  is '区域类型';
comment on column SXDXSJ.CUSTOMER.dial_time_length_code
  is '通话时长编码';
comment on column SXDXSJ.CUSTOMER.level_code
  is '客户等级';
comment on column SXDXSJ.CUSTOMER.city
  is '市';
comment on column SXDXSJ.CUSTOMER.province
  is '省';
comment on column SXDXSJ.CUSTOMER.from_last_revist_time_code
  is '回访距离现在时间';
comment on column SXDXSJ.CUSTOMER.branch_code
  is '分公司中支编码';
comment on column SXDXSJ.CUSTOMER.note
  is '备注';
comment on column SXDXSJ.CUSTOMER.any_date
  is '日期';
comment on column SXDXSJ.CUSTOMER.other_info_1
  is '其他1';
comment on column SXDXSJ.CUSTOMER.other_info_2
  is '其他2';
comment on column SXDXSJ.CUSTOMER.other_info_3
  is '其他3';
comment on column SXDXSJ.CUSTOMER.other_info_5
  is '其他5';
comment on column SXDXSJ.CUSTOMER.other_info_4
  is '其他4';
comment on column SXDXSJ.CUSTOMER.batch_id
  is '批次号';
comment on column SXDXSJ.CUSTOMER.task_id
  is '任务编号';
comment on column SXDXSJ.CUSTOMER.tel_code
  is '电话区号';
comment on column SXDXSJ.CUSTOMER.purchase_product_list
  is '已购买产品列表';
comment on column SXDXSJ.CUSTOMER.d_donation_code
  is '是否接受赠险';
comment on column SXDXSJ.CUSTOMER.partition_col
  is '客户分区列';
comment on column SXDXSJ.CUSTOMER.ismeet
  is '期缴/趸缴标志;';
create index SXDXSJ.IDX_CUSTOMER_01 on SXDXSJ.CUSTOMER (CUSTOMER_NAME, BIRTHDAY)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_CUSTOMER_02 on SXDXSJ.CUSTOMER (SOURCE_TYPE_CODE)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.INDEX_C_PART on SXDXSJ.CUSTOMER (PARTITION_COL)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.CUSTOMER
  add constraint PK_CUSTOMER primary key (CUSTOMER_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.CUSTOMER to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.CUSTOMER to SXDXSJAPP;
grant select on SXDXSJ.CUSTOMER to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.CUSTOMER to SXDXSJMOD;

prompt
prompt Creating table CUSTOMER2
prompt ========================
prompt
create table SXDXSJ.CUSTOMER2
(
  customer_id              VARCHAR2(4000),
  copy_id                  CHAR(40),
  customer_name            VARCHAR2(120),
  birthday                 DATE,
  gender_code              NUMBER,
  family_zip_code          VARCHAR2(10),
  job_name                 VARCHAR2(40),
  family_address           VARCHAR2(508),
  company                  VARCHAR2(508),
  email                    VARCHAR2(40),
  fax                      VARCHAR2(30),
  tel_code                 VARCHAR2(20),
  zone_code                CHAR(1),
  govern_id                VARCHAR2(30),
  age_zone_code            NUMBER,
  birthdate_month_day_code NUMBER,
  partition_col            NUMBER,
  company_delivery_code    NUMBER,
  branch_delivery_code     NUMBER,
  pay_by_pos_code          NUMBER,
  pay_by_bank_code         NUMBER,
  policy_status_code       NUMBER,
  branch_code              NUMBER,
  bank_status_code         NUMBER,
  zone_type_code           NUMBER,
  has_ftele_code           NUMBER,
  has_ctele_code           NUMBER,
  has_mobile_code          NUMBER,
  has_rectele_code         NUMBER,
  clear_status_code        NUMBER,
  source_type_code         NUMBER,
  level_code               NUMBER,
  orphan_status_code       NUMBER,
  task_id                  NUMBER,
  note                     VARCHAR2(2000)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.CUSTOMER2 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.CUSTOMER2 to SXDXSJAPP;
grant select on SXDXSJ.CUSTOMER2 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.CUSTOMER2 to SXDXSJMOD;

prompt
prompt Creating table CUSTOMER_PHONE
prompt =============================
prompt
create table SXDXSJ.CUSTOMER_PHONE
(
  customer_id      CHAR(18),
  phone            VARCHAR2(30) not null,
  phone_type       NUMBER(3),
  tel_code         VARCHAR2(10),
  dial_status_code NUMBER(3) default 1,
  batch_no         NUMBER(20),
  begin_dial       DATE,
  end_dial         DATE,
  partition_col    NUMBER(6) not null
)
partition by list (PARTITION_COL)
(
  partition PART01 values (1)
    tablespace SXDXSJ_DATA_P11
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART02 values (2)
    tablespace SXDXSJ_DATA_P12
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART03 values (3)
    tablespace SXDXSJ_DATA_P13
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART04 values (4)
    tablespace SXDXSJ_DATA_P14
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART05 values (5)
    tablespace SXDXSJ_DATA_P15
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART06 values (6)
    tablespace SXDXSJ_DATA_P16
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART07 values (7)
    tablespace SXDXSJ_DATA_P17
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART08 values (8)
    tablespace SXDXSJ_DATA_P18
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART09 values (9)
    tablespace SXDXSJ_DATA_P19
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART00 values (default)
    tablespace SXDXSJ_DATA_P20
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    )
);
comment on table SXDXSJ.CUSTOMER_PHONE
  is '所有客户的电话号码，包括手机和固定电话';
comment on column SXDXSJ.CUSTOMER_PHONE.customer_id
  is '客户身份证号码';
comment on column SXDXSJ.CUSTOMER_PHONE.phone
  is '电话号码';
comment on column SXDXSJ.CUSTOMER_PHONE.phone_type
  is '电话类型';
comment on column SXDXSJ.CUSTOMER_PHONE.tel_code
  is '电话区号';
comment on column SXDXSJ.CUSTOMER_PHONE.dial_status_code
  is '清洗状态码';
comment on column SXDXSJ.CUSTOMER_PHONE.batch_no
  is '批次编号';
comment on column SXDXSJ.CUSTOMER_PHONE.begin_dial
  is '开始清洗时间';
comment on column SXDXSJ.CUSTOMER_PHONE.end_dial
  is '结束清洗时间';
comment on column SXDXSJ.CUSTOMER_PHONE.partition_col
  is '客户分区列';
create index SXDXSJ.IDX_CUSTOMER_PHONE_CUSTOMERID on SXDXSJ.CUSTOMER_PHONE (CUSTOMER_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.INDEX_CP_PART on SXDXSJ.CUSTOMER_PHONE (PARTITION_COL)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.CUSTOMER_PHONE
  add constraint PK_CUSTOMER_PHONE primary key (PHONE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.CUSTOMER_PHONE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.CUSTOMER_PHONE to SXDXSJAPP;
grant select on SXDXSJ.CUSTOMER_PHONE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.CUSTOMER_PHONE to SXDXSJMOD;

prompt
prompt Creating table CUSTOMER_PHONE2
prompt ==============================
prompt
create table SXDXSJ.CUSTOMER_PHONE2
(
  customer_id   VARCHAR2(4000),
  partition_col NUMBER,
  tel_code      VARCHAR2(20),
  phone_type    NUMBER,
  phone         VARCHAR2(206)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.CUSTOMER_PHONE2 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.CUSTOMER_PHONE2 to SXDXSJAPP;
grant select on SXDXSJ.CUSTOMER_PHONE2 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.CUSTOMER_PHONE2 to SXDXSJMOD;

prompt
prompt Creating table CUSTOMER_PHONE_BACK
prompt ==================================
prompt
create table SXDXSJ.CUSTOMER_PHONE_BACK
(
  customer_id      CHAR(18),
  phone            VARCHAR2(30) not null,
  phone_type       NUMBER(3),
  tel_code         VARCHAR2(10),
  dial_status_code NUMBER(3) default 1,
  batch_no         NUMBER(20),
  begin_dial       DATE,
  end_dial         DATE,
  partition_col    NUMBER(6) not null
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.CUSTOMER_PHONE_BACK
  add constraint PK_CUSTOMER_PHONE_BACK primary key (PHONE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.CUSTOMER_PHONE_BACK to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.CUSTOMER_PHONE_BACK to SXDXSJAPP;
grant select on SXDXSJ.CUSTOMER_PHONE_BACK to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.CUSTOMER_PHONE_BACK to SXDXSJMOD;

prompt
prompt Creating table C_AGENTCOMPANY
prompt =============================
prompt
create table SXDXSJ.C_AGENTCOMPANY
(
  c_agentcompany_id          NUMBER(10) not null,
  t_agentcompany_type_id     NUMBER(10),
  c_agentcompany_name        VARCHAR2(100),
  c_agentcompany_code        VARCHAR2(100),
  c_company_id               NUMBER(10),
  c_agentcompany_contact     VARCHAR2(100),
  c_agentcompany_contact_sub VARCHAR2(100),
  c_agentcompany_addr        VARCHAR2(500),
  c_agentcompany_status      NUMBER(10)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.C_AGENTCOMPANY
  is '中介机构表信息';
comment on column SXDXSJ.C_AGENTCOMPANY.c_agentcompany_id
  is '中介机构ID';
comment on column SXDXSJ.C_AGENTCOMPANY.t_agentcompany_type_id
  is '中介机构类型ID';
comment on column SXDXSJ.C_AGENTCOMPANY.c_agentcompany_name
  is '中介机构名称';
comment on column SXDXSJ.C_AGENTCOMPANY.c_agentcompany_code
  is '中介机构代码';
comment on column SXDXSJ.C_AGENTCOMPANY.c_company_id
  is '所属分公司';
comment on column SXDXSJ.C_AGENTCOMPANY.c_agentcompany_contact
  is '联系人';
comment on column SXDXSJ.C_AGENTCOMPANY.c_agentcompany_contact_sub
  is '联系电话';
comment on column SXDXSJ.C_AGENTCOMPANY.c_agentcompany_addr
  is '地址';
comment on column SXDXSJ.C_AGENTCOMPANY.c_agentcompany_status
  is '中介机构状态：1为启用，2为禁用';
create unique index SXDXSJ.UK_C_AGENTCOMPANY_01 on SXDXSJ.C_AGENTCOMPANY (C_AGENTCOMPANY_CODE)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.C_AGENTCOMPANY
  add constraint PK_C_AGENTCOMPANY primary key (C_AGENTCOMPANY_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.C_AGENTCOMPANY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.C_AGENTCOMPANY to SXDXSJAPP;
grant select on SXDXSJ.C_AGENTCOMPANY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.C_AGENTCOMPANY to SXDXSJMOD;

prompt
prompt Creating table C_AGENTCOMPANY_FACTOR
prompt ====================================
prompt
create table SXDXSJ.C_AGENTCOMPANY_FACTOR
(
  c_agentcompany_factor_id   NUMBER(10) not null,
  c_agentcompany_id          NUMBER(10),
  c_agentcompany_factor_sale VARCHAR2(100),
  c_agentcompany_factor_grow VARCHAR2(100),
  c_agentcompany_factor_com  VARCHAR2(100),
  c_agentcompany_factor_new  VARCHAR2(100),
  c_agentcompany_factor_date VARCHAR2(15)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column SXDXSJ.C_AGENTCOMPANY_FACTOR.c_agentcompany_factor_id
  is '中介机构月度系数id';
comment on column SXDXSJ.C_AGENTCOMPANY_FACTOR.c_agentcompany_id
  is '中介机构代码：同d_agentcompany.deptcode关联';
comment on column SXDXSJ.C_AGENTCOMPANY_FACTOR.c_agentcompany_factor_sale
  is '销售人力';
comment on column SXDXSJ.C_AGENTCOMPANY_FACTOR.c_agentcompany_factor_grow
  is '月度年化标保环比增长率';
comment on column SXDXSJ.C_AGENTCOMPANY_FACTOR.c_agentcompany_factor_com
  is '投诉率系数';
comment on column SXDXSJ.C_AGENTCOMPANY_FACTOR.c_agentcompany_factor_new
  is '上一季度各销售机构年化新保占比';
comment on column SXDXSJ.C_AGENTCOMPANY_FACTOR.c_agentcompany_factor_date
  is '录入时间';
alter table SXDXSJ.C_AGENTCOMPANY_FACTOR
  add constraint PK_C_AGENTCOMPANY_FACTOR primary key (C_AGENTCOMPANY_FACTOR_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
alter table SXDXSJ.C_AGENTCOMPANY_FACTOR
  add constraint FK_C_AGENTC_C_AGENTCO_C_AGENTC foreign key (C_AGENTCOMPANY_ID)
  references SXDXSJ.C_AGENTCOMPANY (C_AGENTCOMPANY_ID);
grant select on SXDXSJ.C_AGENTCOMPANY_FACTOR to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.C_AGENTCOMPANY_FACTOR to SXDXSJAPP;
grant select on SXDXSJ.C_AGENTCOMPANY_FACTOR to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.C_AGENTCOMPANY_FACTOR to SXDXSJMOD;

prompt
prompt Creating table C_CPIC_DIAL
prompt ==========================
prompt
create table SXDXSJ.C_CPIC_DIAL
(
  id         NUMBER not null,
  name       VARCHAR2(20),
  sex        VARCHAR2(2),
  card_type  VARCHAR2(2),
  card_id    VARCHAR2(30),
  birth      VARCHAR2(30),
  ftel       VARCHAR2(50),
  ctel       VARCHAR2(50),
  mobie      VARCHAR2(50),
  otel       VARCHAR2(50),
  fax        VARCHAR2(30),
  zipcode    VARCHAR2(30),
  addr       VARCHAR2(200),
  pro        VARCHAR2(20),
  company    VARCHAR2(50),
  e_mail     VARCHAR2(50),
  bank       VARCHAR2(50),
  bank_acc   VARCHAR2(50),
  insurace   VARCHAR2(50),
  remark     VARCHAR2(500),
  ftel_sta   VARCHAR2(3),
  ctel_sta   VARCHAR2(3),
  mobie_sta  VARCHAR2(3),
  otel_sta   VARCHAR2(3),
  exp_flag   VARCHAR2(1),
  ftel_time  VARCHAR2(30),
  ctel_time  VARCHAR2(30),
  mobie_time VARCHAR2(30),
  otel_time  VARCHAR2(30),
  fgs_code   VARCHAR2(30),
  ext1       VARCHAR2(30),
  ext2       VARCHAR2(30),
  ext3       VARCHAR2(30)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.C_CPIC_DIAL
  is '与表SHCPIC_OUTDATA一起协作，共同完成固定电话的清洗。C_CPIC_DIAL用于存放清洗的电话及电话相关的信息、清洗结果及与结果相关的时间等信息。';
create index SXDXSJ.INDEX_FTEL on SXDXSJ.C_CPIC_DIAL (FTEL)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.INDEX_FTEL_INFO on SXDXSJ.C_CPIC_DIAL (FTEL_STA, EXT1)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.C_CPIC_DIAL
  add constraint PK_C_CPIC_DIAL primary key (ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.C_CPIC_DIAL to DXSJDBEXTR;
grant select, insert, update on SXDXSJ.C_CPIC_DIAL to NUANCE;
grant select, insert, update on SXDXSJ.C_CPIC_DIAL to NUANCEAPP;
grant select, insert, update, delete on SXDXSJ.C_CPIC_DIAL to SXDXSJAPP;
grant select on SXDXSJ.C_CPIC_DIAL to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.C_CPIC_DIAL to SXDXSJMOD;
grant select, update on SXDXSJ.C_CPIC_DIAL to TELANAL;
grant select, update on SXDXSJ.C_CPIC_DIAL to TELANALAPP;

prompt
prompt Creating table C_DICTIONARY
prompt ===========================
prompt
create table SXDXSJ.C_DICTIONARY
(
  dictionry_id    VARCHAR2(32) not null,
  dictionary_code VARCHAR2(15) not null,
  tree_parent_id  VARCHAR2(15),
  disorder        VARCHAR2(15) not null,
  dictdesc        VARCHAR2(50) not null,
  parent_id       VARCHAR2(20) not null,
  tenementid      NUMBER(4) not null,
  isdel           NUMBER(1) default 0 not null,
  istenementshare NUMBER(1) default 0 not null,
  isegeneratepage NUMBER(1) default 0 not null,
  isdefaultvalue  NUMBER(1) default 0 not null,
  userid          VARCHAR2(32),
  createdate      DATE,
  population_tsmp DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.C_DICTIONARY
  is '数据字典表："DICTIONRY_CODE, TENEMENTID, PARENT_ID和DISORDER, PARENT_ID treeparentid两个唯一约束一定存在!';
comment on column SXDXSJ.C_DICTIONARY.dictionry_id
  is '主键,该值由 PARENT_ID+''|''+TENEMENTID+''|''+DICTIONRY_CODE';
comment on column SXDXSJ.C_DICTIONARY.dictionary_code
  is '字典代码,DICTIONRY_CODE, TENEMENTID, PARENT_ID三者唯一';
comment on column SXDXSJ.C_DICTIONARY.tree_parent_id
  is 'TREE_PARENT_ID';
comment on column SXDXSJ.C_DICTIONARY.disorder
  is '排序字典,DISORDER, PARENT_ID treeparentid三者唯一';
comment on column SXDXSJ.C_DICTIONARY.dictdesc
  is '字典描述';
comment on column SXDXSJ.C_DICTIONARY.parent_id
  is 'PARENT_ID';
comment on column SXDXSJ.C_DICTIONARY.tenementid
  is '租户ID, 如果tenementId为空则为共享的数据字典表。';
comment on column SXDXSJ.C_DICTIONARY.isdel
  is '1删除。默认0';
comment on column SXDXSJ.C_DICTIONARY.istenementshare
  is '是否为所有租户间共享,默认0. 1是';
comment on column SXDXSJ.C_DICTIONARY.isegeneratepage
  is '是否允许代码生成器生成代码, 默认0. 1允许';
comment on column SXDXSJ.C_DICTIONARY.isdefaultvalue
  is '是否为默认值,1是, 默认0';
comment on column SXDXSJ.C_DICTIONARY.userid
  is '创建用户';
comment on column SXDXSJ.C_DICTIONARY.createdate
  is '创建人';
comment on column SXDXSJ.C_DICTIONARY.population_tsmp
  is '发布时间戳';
grant select on SXDXSJ.C_DICTIONARY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.C_DICTIONARY to SXDXETL;
grant select, insert, update, delete on SXDXSJ.C_DICTIONARY to SXDXSJAPP;
grant select on SXDXSJ.C_DICTIONARY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.C_DICTIONARY to SXDXSJMOD;

prompt
prompt Creating table C_ROLE
prompt =====================
prompt
create table SXDXSJ.C_ROLE
(
  roleid          NUMBER(10) not null,
  tenementid      NUMBER(4),
  name            VARCHAR2(32),
  updatedate      DATE,
  updateuserid    VARCHAR2(24),
  isdel           NUMBER(1) default 0 not null,
  remark          VARCHAR2(128),
  role_type       CHAR(2),
  create_user     VARCHAR2(24),
  create_time     DATE,
  population_tsmp DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.C_ROLE
  is '角色表

特殊说明：
1、删除角色之前先将其关联的系统用户删除，否则不能删除角色记录。
2、删除时，同时将角色下的菜单权限也一样删除。
';
comment on column SXDXSJ.C_ROLE.roleid
  is 'ROLEID';
comment on column SXDXSJ.C_ROLE.tenementid
  is '主键';
comment on column SXDXSJ.C_ROLE.name
  is '角色名';
comment on column SXDXSJ.C_ROLE.updatedate
  is '更新时间';
comment on column SXDXSJ.C_ROLE.updateuserid
  is '更新用户';
comment on column SXDXSJ.C_ROLE.isdel
  is '默认0
删除为1';
comment on column SXDXSJ.C_ROLE.remark
  is 'REMARK';
comment on column SXDXSJ.C_ROLE.role_type
  is '角色类型';
comment on column SXDXSJ.C_ROLE.create_user
  is '创建人';
comment on column SXDXSJ.C_ROLE.create_time
  is '创建时间';
comment on column SXDXSJ.C_ROLE.population_tsmp
  is '发布时间戳';
grant select on SXDXSJ.C_ROLE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.C_ROLE to SXDXETL;
grant select, insert, update, delete on SXDXSJ.C_ROLE to SXDXSJAPP;
grant select on SXDXSJ.C_ROLE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.C_ROLE to SXDXSJMOD;

prompt
prompt Creating table C_USER
prompt =====================
prompt
create table SXDXSJ.C_USER
(
  userid            VARCHAR2(24) not null,
  loginid           VARCHAR2(16),
  employeename      VARCHAR2(32) not null,
  password          VARCHAR2(50) not null,
  isdel             NUMBER(1) default 0 not null,
  defaultlanguage   VARCHAR2(5) default 'zh_CN',
  issuperadmin      NUMBER(1) default 0,
  updatedate        DATE,
  updateuserid      VARCHAR2(24),
  employeeid        NUMBER(10),
  defaulttenementid NUMBER(4),
  defaultgroupid    VARCHAR2(20),
  org_id            NUMBER(10),
  workplace_id      NUMBER(10),
  sale_channel      NUMBER(3),
  max_lists         NUMBER(4),
  agentid           VARCHAR2(20),
  skill_id          NUMBER(10),
  create_user       VARCHAR2(24),
  create_time       DATE,
  population_tsmp   DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.C_USER
  is '用户表
1.  超级管理员可以查看所有的用户及组.
4. 系统里只能有一个超级管理员.
';
comment on column SXDXSJ.C_USER.userid
  is '主键,格式为(为tenmentId+"_"+loginId)';
comment on column SXDXSJ.C_USER.loginid
  is '登录帐号。';
comment on column SXDXSJ.C_USER.employeename
  is '用户名（即雇员信息中的雇员名）';
comment on column SXDXSJ.C_USER.password
  is '密码';
comment on column SXDXSJ.C_USER.isdel
  is '1，删除；0不删除。
默认0';
comment on column SXDXSJ.C_USER.defaultlanguage
  is '当前使用的登录语言，目前只有zh_CN.
字典：parent=SYSTEM_LANGUAGE  系统字典';
comment on column SXDXSJ.C_USER.issuperadmin
  is '是否为超级管理员(可看到所有的菜单，包括租户管理、表单定制等)
否为0
是为1. ';
comment on column SXDXSJ.C_USER.updatedate
  is '更新时间
';
comment on column SXDXSJ.C_USER.updateuserid
  is '更新帐号';
comment on column SXDXSJ.C_USER.employeeid
  is 'C_EMPLOYEE外键';
comment on column SXDXSJ.C_USER.defaulttenementid
  is '默认租户外键(当前选中的租户)';
comment on column SXDXSJ.C_USER.defaultgroupid
  is '默认用户组';
comment on column SXDXSJ.C_USER.org_id
  is '机构ID';
comment on column SXDXSJ.C_USER.workplace_id
  is '职场管理表中的职场编号';
comment on column SXDXSJ.C_USER.sale_channel
  is '销售渠道';
comment on column SXDXSJ.C_USER.max_lists
  is '最大名单数';
comment on column SXDXSJ.C_USER.agentid
  is 'AGENTID';
comment on column SXDXSJ.C_USER.skill_id
  is '技能组ID';
comment on column SXDXSJ.C_USER.create_user
  is '创建人';
comment on column SXDXSJ.C_USER.create_time
  is '创建时间';
comment on column SXDXSJ.C_USER.population_tsmp
  is '发布时间戳';
create index SXDXSJ.IDX_C_USER_01 on SXDXSJ.C_USER (ORG_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.C_USER
  add constraint PK_C_USER primary key (USERID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.C_USER to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.C_USER to SXDXETL;
grant select, insert, update, delete on SXDXSJ.C_USER to SXDXSJAPP;
grant select on SXDXSJ.C_USER to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.C_USER to SXDXSJMOD;

prompt
prompt Creating table C_USER_ROLE
prompt ==========================
prompt
create table SXDXSJ.C_USER_ROLE
(
  roleid          NUMBER(10) not null,
  userid          VARCHAR2(32) not null,
  tenementid      NUMBER(4),
  population_tsmp DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.C_USER_ROLE
  is '用户与角色关系表';
comment on column SXDXSJ.C_USER_ROLE.roleid
  is 'ROLEID';
comment on column SXDXSJ.C_USER_ROLE.userid
  is 'USERID';
comment on column SXDXSJ.C_USER_ROLE.tenementid
  is '租户ID';
comment on column SXDXSJ.C_USER_ROLE.population_tsmp
  is '发布时间戳';
grant select on SXDXSJ.C_USER_ROLE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.C_USER_ROLE to SXDXETL;
grant select, insert, update, delete on SXDXSJ.C_USER_ROLE to SXDXSJAPP;
grant select on SXDXSJ.C_USER_ROLE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.C_USER_ROLE to SXDXSJMOD;

prompt
prompt Creating table DICT_OBJ
prompt =======================
prompt
create table SXDXSJ.DICT_OBJ
(
  object_name    VARCHAR2(128),
  subobject_name VARCHAR2(30),
  object_type    VARCHAR2(19),
  object_desc    VARCHAR2(200)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.DICT_OBJ to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.DICT_OBJ to SXDXSJAPP;
grant select on SXDXSJ.DICT_OBJ to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.DICT_OBJ to SXDXSJMOD;

prompt
prompt Creating table DX_ACTIVITY
prompt ==========================
prompt
create table SXDXSJ.DX_ACTIVITY
(
  activity_id          VARCHAR2(20) not null,
  activity_name        VARCHAR2(200),
  activity_start_time  DATE,
  activity_end_time    DATE,
  product_code         VARCHAR2(30),
  product_name         VARCHAR2(200),
  status               NUMBER(3),
  activity_description VARCHAR2(200),
  note                 VARCHAR2(500),
  batch_id             NUMBER
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.DX_ACTIVITY
  is '电销活动信息';
comment on column SXDXSJ.DX_ACTIVITY.activity_id
  is '活动ID';
comment on column SXDXSJ.DX_ACTIVITY.activity_name
  is '活动名';
comment on column SXDXSJ.DX_ACTIVITY.activity_start_time
  is '活动开始时间';
comment on column SXDXSJ.DX_ACTIVITY.activity_end_time
  is '活动结束时间';
comment on column SXDXSJ.DX_ACTIVITY.product_code
  is '产品代码';
comment on column SXDXSJ.DX_ACTIVITY.product_name
  is '产品名';
comment on column SXDXSJ.DX_ACTIVITY.status
  is '活动状态';
comment on column SXDXSJ.DX_ACTIVITY.activity_description
  is '活动描述';
comment on column SXDXSJ.DX_ACTIVITY.note
  is '备注';
comment on column SXDXSJ.DX_ACTIVITY.batch_id
  is '批次编号';
alter table SXDXSJ.DX_ACTIVITY
  add constraint PK_DX_ACTIVITY primary key (ACTIVITY_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.DX_ACTIVITY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.DX_ACTIVITY to SXDXSJAPP;
grant select on SXDXSJ.DX_ACTIVITY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.DX_ACTIVITY to SXDXSJMOD;

prompt
prompt Creating table DX_ACTIVITY_CUSTOMER
prompt ===================================
prompt
create table SXDXSJ.DX_ACTIVITY_CUSTOMER
(
  activity_id VARCHAR2(20) not null,
  customer_id CHAR(18) not null
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.DX_ACTIVITY_CUSTOMER
  is '客户与电销活动的关系表';
comment on column SXDXSJ.DX_ACTIVITY_CUSTOMER.activity_id
  is '活动ID';
comment on column SXDXSJ.DX_ACTIVITY_CUSTOMER.customer_id
  is '客户身份证号';
alter table SXDXSJ.DX_ACTIVITY_CUSTOMER
  add constraint PK_DX_ACTIVITY_CUSTOMER primary key (ACTIVITY_ID, CUSTOMER_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.DX_ACTIVITY_CUSTOMER to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.DX_ACTIVITY_CUSTOMER to SXDXSJAPP;
grant select on SXDXSJ.DX_ACTIVITY_CUSTOMER to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.DX_ACTIVITY_CUSTOMER to SXDXSJMOD;

prompt
prompt Creating table DX_DIAL_RESULT
prompt =============================
prompt
create table SXDXSJ.DX_DIAL_RESULT
(
  activity_id      VARCHAR2(20) not null,
  customer_id      CHAR(18) not null,
  mobile_phone     VARCHAR2(20),
  family_phone     VARCHAR2(20),
  office_phone     VARCHAR2(20),
  charge_phone     VARCHAR2(20),
  other_phone      VARCHAR2(20),
  status           NUMBER,
  passed_phone     VARCHAR2(20),
  dial_time_length NUMBER,
  dial_time        DATE,
  partition_col    NUMBER(6)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.DX_DIAL_RESULT
  is '电销拨打结果信息';
comment on column SXDXSJ.DX_DIAL_RESULT.activity_id
  is '活动ID';
comment on column SXDXSJ.DX_DIAL_RESULT.customer_id
  is '证件号码';
comment on column SXDXSJ.DX_DIAL_RESULT.mobile_phone
  is '手机号码';
comment on column SXDXSJ.DX_DIAL_RESULT.family_phone
  is '家庭电话';
comment on column SXDXSJ.DX_DIAL_RESULT.office_phone
  is '办公电话';
comment on column SXDXSJ.DX_DIAL_RESULT.charge_phone
  is '收费电话';
comment on column SXDXSJ.DX_DIAL_RESULT.other_phone
  is '其他电话';
comment on column SXDXSJ.DX_DIAL_RESULT.status
  is '状态';
comment on column SXDXSJ.DX_DIAL_RESULT.passed_phone
  is '接通电话';
comment on column SXDXSJ.DX_DIAL_RESULT.dial_time_length
  is '通话时长';
comment on column SXDXSJ.DX_DIAL_RESULT.dial_time
  is '拨打时间';
comment on column SXDXSJ.DX_DIAL_RESULT.partition_col
  is '分区码';
alter table SXDXSJ.DX_DIAL_RESULT
  add constraint PK_DX_DIAL_RESULT primary key (ACTIVITY_ID, CUSTOMER_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.DX_DIAL_RESULT to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.DX_DIAL_RESULT to SXDXSJAPP;
grant select on SXDXSJ.DX_DIAL_RESULT to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.DX_DIAL_RESULT to SXDXSJMOD;

prompt
prompt Creating table DX_PRODUCT
prompt =========================
prompt
create table SXDXSJ.DX_PRODUCT
(
  product_code        NUMBER not null,
  product_alpha       CHAR(1),
  product_name        VARCHAR2(200),
  product_description VARCHAR2(500),
  contain_class_list  VARCHAR2(500),
  create_time         DATE,
  create_user         VARCHAR2(20)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.DX_PRODUCT
  is '所有电销产品信息';
comment on column SXDXSJ.DX_PRODUCT.product_code
  is '产品代码';
comment on column SXDXSJ.DX_PRODUCT.product_alpha
  is '产品对应字母';
comment on column SXDXSJ.DX_PRODUCT.product_name
  is '产品名';
comment on column SXDXSJ.DX_PRODUCT.product_description
  is '产品描述';
comment on column SXDXSJ.DX_PRODUCT.contain_class_list
  is '包含险种列表';
comment on column SXDXSJ.DX_PRODUCT.create_time
  is '创建时间';
comment on column SXDXSJ.DX_PRODUCT.create_user
  is '创建人';
alter table SXDXSJ.DX_PRODUCT
  add constraint PK_DX_PRODUCT primary key (PRODUCT_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.DX_PRODUCT to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.DX_PRODUCT to SXDXSJAPP;
grant select on SXDXSJ.DX_PRODUCT to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.DX_PRODUCT to SXDXSJMOD;

prompt
prompt Creating table DYNAMIC_FIELDS_TEMPLATE
prompt ======================================
prompt
create table SXDXSJ.DYNAMIC_FIELDS_TEMPLATE
(
  template_id            NUMBER not null,
  template_name          VARCHAR2(100),
  template_str           VARCHAR2(2000),
  template_header        VARCHAR2(2000),
  file_type              NUMBER(3),
  delimiter              VARCHAR2(20),
  export_type            NUMBER(3),
  branch_abbreviation    VARCHAR2(30),
  customer_id            VARCHAR2(30),
  id_type                VARCHAR2(30),
  customer_name          VARCHAR2(30),
  birthday               VARCHAR2(30),
  gender_code            VARCHAR2(30),
  marital_status         VARCHAR2(30),
  death_critical_illness VARCHAR2(30),
  family_phone           VARCHAR2(30),
  office_phone           VARCHAR2(30),
  mobile                 VARCHAR2(30),
  charge_phone           VARCHAR2(30),
  other_phone            VARCHAR2(30),
  fax                    VARCHAR2(30),
  family_zip_code        VARCHAR2(30),
  company_zip_code       VARCHAR2(30),
  family_address         VARCHAR2(30),
  company_address        VARCHAR2(30),
  contact_address        VARCHAR2(550),
  job_name               VARCHAR2(30),
  company                VARCHAR2(30),
  email                  VARCHAR2(30),
  bank_name              VARCHAR2(30),
  bank_account           VARCHAR2(30),
  policy_no              VARCHAR2(30),
  class_name             VARCHAR2(30),
  province               VARCHAR2(30),
  city                   VARCHAR2(30),
  phone_code             VARCHAR2(30),
  zone_code              VARCHAR2(30),
  age                    VARCHAR2(30),
  note                   VARCHAR2(30),
  any_date               VARCHAR2(30),
  other1                 VARCHAR2(30),
  other2                 VARCHAR2(30),
  other3                 VARCHAR2(30),
  other4                 VARCHAR2(30),
  other5                 VARCHAR2(30),
  active                 CHAR(1),
  creator                VARCHAR2(50),
  create_date            DATE,
  modifier               VARCHAR2(50),
  modify_date            DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.DYNAMIC_FIELDS_TEMPLATE
  is '数据导入导出的模板信息
第三方格式的字段如果过大，导入时候将会被截断。
由用户自行判断。
文件类型
0：txt
1:excel2003
2 excel2007
导出类型
0：分公司保全
1：第三方保全
2：导出电销';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.template_id
  is '模板编号';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.template_name
  is '模板名称';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.template_str
  is '模板字符串';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.template_header
  is '数据列名';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.file_type
  is '文件类型';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.delimiter
  is '字段分隔符';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.export_type
  is '导出类型';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.branch_abbreviation
  is '分公司简称';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.customer_id
  is '客户身份证号';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.id_type
  is '证件类型';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.customer_name
  is '客户姓名';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.birthday
  is '出生年月日';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.gender_code
  is '性别';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.marital_status
  is '婚姻状况';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.death_critical_illness
  is '死亡及重大疾病记录';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.family_phone
  is '家庭电话号码';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.office_phone
  is '办公电话号码';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.mobile
  is '移动电话号码';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.charge_phone
  is '收费电话';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.other_phone
  is '其它电话号码';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.fax
  is '传真';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.family_zip_code
  is '家庭邮编';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.company_zip_code
  is '单位邮编';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.family_address
  is '家庭地址';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.company_address
  is '办公地址';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.contact_address
  is '通讯地址';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.job_name
  is '职业';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.company
  is '所属企业名称';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.email
  is '电子邮件';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.bank_name
  is '开户银行名称';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.bank_account
  is '开户银行帐户';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.policy_no
  is '保单号';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.class_name
  is '险种名称';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.province
  is '所在省';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.city
  is '所在市';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.phone_code
  is '电话区号';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.zone_code
  is '区域编码';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.age
  is '年龄';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.note
  is '备注';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.any_date
  is '备用日期';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.other1
  is '其他1';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.other2
  is '其他2';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.other3
  is '其他3';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.other4
  is '其他4';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.other5
  is '其他5';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.active
  is '是否可用';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.creator
  is '创建人';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.create_date
  is '创建日期';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.modifier
  is '修改人';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.modify_date
  is '修改日期';
alter table SXDXSJ.DYNAMIC_FIELDS_TEMPLATE
  add constraint PK_DYNAMIC_FIELDS_TEMPLATE primary key (TEMPLATE_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.DYNAMIC_FIELDS_TEMPLATE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.DYNAMIC_FIELDS_TEMPLATE to SXDXSJAPP;
grant select on SXDXSJ.DYNAMIC_FIELDS_TEMPLATE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.DYNAMIC_FIELDS_TEMPLATE to SXDXSJMOD;

prompt
prompt Creating table DYNAMIC_PREINS_TEMPLATE
prompt ======================================
prompt
create table SXDXSJ.DYNAMIC_PREINS_TEMPLATE
(
  template_id     NUMBER(8) not null,
  template_name   VARCHAR2(100),
  template_str    VARCHAR2(2000),
  template_header VARCHAR2(2000),
  active          CHAR(1)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column SXDXSJ.DYNAMIC_PREINS_TEMPLATE.template_id
  is '模版id';
comment on column SXDXSJ.DYNAMIC_PREINS_TEMPLATE.template_name
  is '模版名称';
comment on column SXDXSJ.DYNAMIC_PREINS_TEMPLATE.template_str
  is '模版中所包含的字段名';
comment on column SXDXSJ.DYNAMIC_PREINS_TEMPLATE.template_header
  is '模版中所包含的中文字段名';
comment on column SXDXSJ.DYNAMIC_PREINS_TEMPLATE.active
  is '是否显示';
alter table SXDXSJ.DYNAMIC_PREINS_TEMPLATE
  add constraint PK_TEMPLATE_ID primary key (TEMPLATE_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select on SXDXSJ.DYNAMIC_PREINS_TEMPLATE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.DYNAMIC_PREINS_TEMPLATE to SXDXSJAPP;
grant select on SXDXSJ.DYNAMIC_PREINS_TEMPLATE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.DYNAMIC_PREINS_TEMPLATE to SXDXSJMOD;

prompt
prompt Creating table D_ACCEPT_DONATION
prompt ================================
prompt
create table SXDXSJ.D_ACCEPT_DONATION
(
  d_donation_code NUMBER(3) not null,
  d_donation_name VARCHAR2(120),
  d_donation_desc VARCHAR2(508),
  active          CHAR(1),
  creator         VARCHAR2(50),
  create_time     DATE,
  modifier        VARCHAR2(50),
  modify_date     DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_ACCEPT_DONATION
  is '维度枚举表：
客户是否接受赠险';
comment on column SXDXSJ.D_ACCEPT_DONATION.d_donation_code
  is '编号';
comment on column SXDXSJ.D_ACCEPT_DONATION.d_donation_name
  is '名称';
comment on column SXDXSJ.D_ACCEPT_DONATION.d_donation_desc
  is '描述';
comment on column SXDXSJ.D_ACCEPT_DONATION.active
  is '是否可用';
comment on column SXDXSJ.D_ACCEPT_DONATION.creator
  is '创建人';
comment on column SXDXSJ.D_ACCEPT_DONATION.create_time
  is '创建日期';
comment on column SXDXSJ.D_ACCEPT_DONATION.modifier
  is '修改人';
comment on column SXDXSJ.D_ACCEPT_DONATION.modify_date
  is '修改日期';
alter table SXDXSJ.D_ACCEPT_DONATION
  add constraint PK_D_ACCEPT_DONATION primary key (D_DONATION_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_ACCEPT_DONATION to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_ACCEPT_DONATION to SXDXSJAPP;
grant select on SXDXSJ.D_ACCEPT_DONATION to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_ACCEPT_DONATION to SXDXSJMOD;

prompt
prompt Creating table D_AGE_INFO
prompt =========================
prompt
create table SXDXSJ.D_AGE_INFO
(
  age_zone_code NUMBER(3) not null,
  age_zone_name VARCHAR2(120),
  min_age       NUMBER(3),
  max_age       NUMBER(3),
  active        CHAR(1),
  creator       VARCHAR2(50),
  create_date   DATE,
  modifier      VARCHAR2(50),
  modify_date   DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_AGE_INFO
  is '维度枚举表：
列举客户的年龄分段信息
age取值：
0-17岁	18-25岁	26-35岁	36-45岁	46-55岁	>55岁';
comment on column SXDXSJ.D_AGE_INFO.age_zone_code
  is '年龄编码';
comment on column SXDXSJ.D_AGE_INFO.age_zone_name
  is '年龄段';
comment on column SXDXSJ.D_AGE_INFO.min_age
  is '最小年龄';
comment on column SXDXSJ.D_AGE_INFO.max_age
  is '最大年龄';
comment on column SXDXSJ.D_AGE_INFO.active
  is '是否可用';
comment on column SXDXSJ.D_AGE_INFO.creator
  is '创建人';
comment on column SXDXSJ.D_AGE_INFO.create_date
  is '创建日期';
comment on column SXDXSJ.D_AGE_INFO.modifier
  is '修改人';
comment on column SXDXSJ.D_AGE_INFO.modify_date
  is '修改日期';
alter table SXDXSJ.D_AGE_INFO
  add constraint PK_D_AGE_INFO primary key (AGE_ZONE_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_AGE_INFO to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_AGE_INFO to SXDXSJAPP;
grant select on SXDXSJ.D_AGE_INFO to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_AGE_INFO to SXDXSJMOD;

prompt
prompt Creating table D_APPNO_STATUS
prompt =============================
prompt
create table SXDXSJ.D_APPNO_STATUS
(
  appno_status_code VARCHAR2(2) not null,
  appno_status_name VARCHAR2(100),
  active            CHAR(1),
  creator           VARCHAR2(50),
  create_date       DATE,
  modifier          VARCHAR2(50),
  modify_date       DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_APPNO_STATUS
  is '赠险投保单状态码维表';
comment on column SXDXSJ.D_APPNO_STATUS.appno_status_code
  is '投保单状态码';
comment on column SXDXSJ.D_APPNO_STATUS.appno_status_name
  is '投保单状态名称';
comment on column SXDXSJ.D_APPNO_STATUS.active
  is '是否可用';
comment on column SXDXSJ.D_APPNO_STATUS.creator
  is '创建人';
comment on column SXDXSJ.D_APPNO_STATUS.create_date
  is '创建日期';
comment on column SXDXSJ.D_APPNO_STATUS.modifier
  is '修改人';
comment on column SXDXSJ.D_APPNO_STATUS.modify_date
  is '修改日期';
alter table SXDXSJ.D_APPNO_STATUS
  add constraint PK_D_APPNO_STATUS primary key (APPNO_STATUS_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_APPNO_STATUS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_APPNO_STATUS to SXDXSJAPP;
grant select on SXDXSJ.D_APPNO_STATUS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_APPNO_STATUS to SXDXSJMOD;

prompt
prompt Creating table D_BANK_STATUS_INFO
prompt =================================
prompt
create table SXDXSJ.D_BANK_STATUS_INFO
(
  bank_status_code NUMBER(3) not null,
  bank_status_name VARCHAR2(120),
  active           CHAR(1),
  creator          VARCHAR2(50),
  createtime       DATE,
  modifier         VARCHAR2(50),
  modify_date      DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_BANK_STATUS_INFO
  is '维度枚举表：
银行状态代码和名称：';
comment on column SXDXSJ.D_BANK_STATUS_INFO.bank_status_code
  is '状态代码';
comment on column SXDXSJ.D_BANK_STATUS_INFO.bank_status_name
  is '状态名称';
comment on column SXDXSJ.D_BANK_STATUS_INFO.active
  is '是否可用';
comment on column SXDXSJ.D_BANK_STATUS_INFO.creator
  is '创建人';
comment on column SXDXSJ.D_BANK_STATUS_INFO.createtime
  is '创建日期';
comment on column SXDXSJ.D_BANK_STATUS_INFO.modifier
  is '修改人';
comment on column SXDXSJ.D_BANK_STATUS_INFO.modify_date
  is '修改日期';
alter table SXDXSJ.D_BANK_STATUS_INFO
  add constraint PK_D_BANK_STATUS_INFO primary key (BANK_STATUS_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_BANK_STATUS_INFO to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_BANK_STATUS_INFO to SXDXSJAPP;
grant select on SXDXSJ.D_BANK_STATUS_INFO to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_BANK_STATUS_INFO to SXDXSJMOD;

prompt
prompt Creating table D_BIRTHDATE_MONTH
prompt ================================
prompt
create table SXDXSJ.D_BIRTHDATE_MONTH
(
  birthdate_month_day_code NUMBER(3) not null,
  month_code               NUMBER(3),
  birthdate_month_name     VARCHAR2(120),
  day_code                 NUMBER(3),
  birthdate_day_name       VARCHAR2(120),
  min_day                  NUMBER(3),
  max_day                  NUMBER(3),
  birthdate_month_desc     VARCHAR2(120),
  birthdate_day_desc       VARCHAR2(120),
  active                   CHAR(1),
  creator                  VARCHAR2(50),
  create_time              DATE,
  modifier                 VARCHAR2(50),
  modify_date              DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_BIRTHDATE_MONTH
  is '维度枚举表：
客户生日所对应的月份和日区间划分信息';
comment on column SXDXSJ.D_BIRTHDATE_MONTH.min_day
  is '最小日';
comment on column SXDXSJ.D_BIRTHDATE_MONTH.max_day
  is '最大日';
comment on column SXDXSJ.D_BIRTHDATE_MONTH.active
  is '是否可用';
comment on column SXDXSJ.D_BIRTHDATE_MONTH.creator
  is '创建人';
comment on column SXDXSJ.D_BIRTHDATE_MONTH.create_time
  is '创建日期';
comment on column SXDXSJ.D_BIRTHDATE_MONTH.modifier
  is '修改人';
comment on column SXDXSJ.D_BIRTHDATE_MONTH.modify_date
  is '修改日期';
alter table SXDXSJ.D_BIRTHDATE_MONTH
  add constraint PK_D_BIRTHDATE_MONTH primary key (BIRTHDATE_MONTH_DAY_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_BIRTHDATE_MONTH to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_BIRTHDATE_MONTH to SXDXSJAPP;
grant select on SXDXSJ.D_BIRTHDATE_MONTH to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_BIRTHDATE_MONTH to SXDXSJMOD;

prompt
prompt Creating table D_BRANCH_DELIVERY
prompt ================================
prompt
create table SXDXSJ.D_BRANCH_DELIVERY
(
  branch_delivery_code NUMBER(3) not null,
  branch_delivery_name VARCHAR2(120),
  branch_delivery_desc VARCHAR2(508),
  active               CHAR(1),
  creator              VARCHAR2(50),
  create_time          DATE,
  modifier             VARCHAR2(50),
  modify_date          DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_BRANCH_DELIVERY
  is '维度枚举表：
分公司的快递是否可以送达';
alter table SXDXSJ.D_BRANCH_DELIVERY
  add constraint PK_D_BRANCH_DELIVERY primary key (BRANCH_DELIVERY_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_BRANCH_DELIVERY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_BRANCH_DELIVERY to SXDXSJAPP;
grant select on SXDXSJ.D_BRANCH_DELIVERY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_BRANCH_DELIVERY to SXDXSJMOD;

prompt
prompt Creating table D_BRANCH_INFO
prompt ============================
prompt
create table SXDXSJ.D_BRANCH_INFO
(
  branch_code         NUMBER(6) not null,
  d_branch_code       NUMBER(3),
  d_branch_name       VARCHAR2(120),
  child_branch_code   NUMBER(3),
  child_branch_name   VARCHAR2(508),
  branch_abbreviation VARCHAR2(20),
  active              CHAR(1),
  creator             VARCHAR2(50),
  create_time         DATE,
  modifier            VARCHAR2(50),
  modify_date         DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_BRANCH_INFO
  is '维度枚举表：
所有太保寿险分公司及其中支的信息表';
alter table SXDXSJ.D_BRANCH_INFO
  add constraint PK_D_BRANCH_INFO primary key (BRANCH_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_BRANCH_INFO to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_BRANCH_INFO to SXDXSJAPP;
grant select on SXDXSJ.D_BRANCH_INFO to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_BRANCH_INFO to SXDXSJMOD;

prompt
prompt Creating table D_CALENDAR_DIM
prompt =============================
prompt
create table SXDXSJ.D_CALENDAR_DIM
(
  cal_day_id       NUMBER(8) not null,
  cal_day_code     DATE not null,
  cal_day_nm       VARCHAR2(20),
  cal_week_id      NUMBER(4),
  cal_week_nm      VARCHAR2(20),
  cal_week_code    VARCHAR2(30),
  cal_week_day     VARCHAR2(10),
  cal_week_mon     VARCHAR2(10),
  cal_ten_day      NUMBER(1),
  cal_ten_day_desc VARCHAR2(20),
  cal_mon_id       NUMBER(9),
  cal_mon_nm       VARCHAR2(20),
  cal_mon_num      NUMBER(2),
  cal_quarter_id   NUMBER(9),
  cal_quarter_nm   VARCHAR2(30),
  cal_quarter_num  NUMBER(1),
  cal_yr_id        NUMBER(4),
  cal_yr_nm        VARCHAR2(20),
  year_segm        VARCHAR2(20),
  year_interval    VARCHAR2(30),
  quarter_interval VARCHAR2(30),
  month_interval   VARCHAR2(30),
  week_interval    VARCHAR2(30),
  week_interval_id VARCHAR2(16),
  load_date        NUMBER(14) default TO_NUMBER(TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'))
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_CALENDAR_DIM
  is '日期维度表';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_day_id
  is '日标识';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_day_code
  is '日格式';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_day_nm
  is '日全名';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_week_id
  is '周标识';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_week_nm
  is '年度第几周';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_week_code
  is '周全名';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_week_day
  is '周内星期几';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_week_mon
  is '本月第几周';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_ten_day
  is '旬标识：1、为上旬、2为中旬、3为下旬';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_ten_day_desc
  is '旬描述：上旬、中旬、下旬';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_mon_id
  is '月份标识';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_mon_nm
  is '月份名称';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_mon_num
  is '月份序号';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_quarter_id
  is '季度代码';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_quarter_nm
  is '季度名称';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_quarter_num
  is '季度序号';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_yr_id
  is '年份代码';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_yr_nm
  is '年份名称';
comment on column SXDXSJ.D_CALENDAR_DIM.year_segm
  is '年份段：上半年、下半年';
comment on column SXDXSJ.D_CALENDAR_DIM.year_interval
  is '年区间';
comment on column SXDXSJ.D_CALENDAR_DIM.quarter_interval
  is '季度区间';
comment on column SXDXSJ.D_CALENDAR_DIM.month_interval
  is '月区间';
comment on column SXDXSJ.D_CALENDAR_DIM.week_interval
  is '周区间';
comment on column SXDXSJ.D_CALENDAR_DIM.week_interval_id
  is '周区间标识';
comment on column SXDXSJ.D_CALENDAR_DIM.load_date
  is '导入日期';
alter table SXDXSJ.D_CALENDAR_DIM
  add constraint PK_CAL_DAYID primary key (CAL_DAY_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_CALENDAR_DIM to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_CALENDAR_DIM to SXDXSJAPP;
grant select on SXDXSJ.D_CALENDAR_DIM to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_CALENDAR_DIM to SXDXSJMOD;

prompt
prompt Creating table D_CALLRESULT_STATUS
prompt ==================================
prompt
create table SXDXSJ.D_CALLRESULT_STATUS
(
  callresult_code VARCHAR2(2) not null,
  callresult_name VARCHAR2(100),
  active          CHAR(1),
  create_date     DATE,
  creator         VARCHAR2(50),
  modify_date     DATE,
  modifier        VARCHAR2(50)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_CALLRESULT_STATUS
  is '营销赠险拨打结果状态维码';
comment on column SXDXSJ.D_CALLRESULT_STATUS.callresult_code
  is '拨打结果状态码';
comment on column SXDXSJ.D_CALLRESULT_STATUS.callresult_name
  is '拨打结果状态名称';
comment on column SXDXSJ.D_CALLRESULT_STATUS.active
  is '是否可用';
comment on column SXDXSJ.D_CALLRESULT_STATUS.create_date
  is '创建日期';
comment on column SXDXSJ.D_CALLRESULT_STATUS.creator
  is '创建人';
comment on column SXDXSJ.D_CALLRESULT_STATUS.modify_date
  is '修改日期';
alter table SXDXSJ.D_CALLRESULT_STATUS
  add constraint PK_CALLRESULT_CODE primary key (CALLRESULT_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_CALLRESULT_STATUS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_CALLRESULT_STATUS to SXDXSJAPP;
grant select on SXDXSJ.D_CALLRESULT_STATUS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_CALLRESULT_STATUS to SXDXSJMOD;

prompt
prompt Creating table D_CALL_TIMES
prompt ===========================
prompt
create table SXDXSJ.D_CALL_TIMES
(
  call_times_no NUMBER(1) not null,
  call_times_nm VARCHAR2(20),
  active        CHAR(1) default 1,
  creator       VARCHAR2(50) default 'admin',
  createtime    DATE default sysdate,
  modifier      VARCHAR2(50),
  modify_date   DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_CALL_TIMES
  is '维度枚举表：电销系统拨打次数代码信息：1、首拨，2、二拨，3、三拨，4、混拨';
comment on column SXDXSJ.D_CALL_TIMES.call_times_no
  is '拨打次数代码';
comment on column SXDXSJ.D_CALL_TIMES.call_times_nm
  is '拨打次数名称';
comment on column SXDXSJ.D_CALL_TIMES.active
  is '是否可用：1为可用，0为失效';
comment on column SXDXSJ.D_CALL_TIMES.creator
  is '创建人';
comment on column SXDXSJ.D_CALL_TIMES.createtime
  is '创建日期';
comment on column SXDXSJ.D_CALL_TIMES.modifier
  is '修改人';
comment on column SXDXSJ.D_CALL_TIMES.modify_date
  is '修改日期';
alter table SXDXSJ.D_CALL_TIMES
  add constraint PK_D_CALL_TIMES primary key (CALL_TIMES_NO)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_CALL_TIMES to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_CALL_TIMES to SXDXSJAPP;
grant select, insert, update, delete on SXDXSJ.D_CALL_TIMES to SXDXSJMOD;

prompt
prompt Creating table D_COMPANY_DELIVERY
prompt =================================
prompt
create table SXDXSJ.D_COMPANY_DELIVERY
(
  company_delivery_code NUMBER(3) not null,
  company_delivery_name VARCHAR2(120),
  company_delivery_desc VARCHAR2(508),
  active                CHAR(1),
  creator               VARCHAR2(50),
  create_time           DATE,
  modifier              VARCHAR2(50),
  modify_date           DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_COMPANY_DELIVERY
  is '维度枚举表：
总公司的快递是否可以送达';
alter table SXDXSJ.D_COMPANY_DELIVERY
  add constraint PK_D_COMPANY_DELIVERY primary key (COMPANY_DELIVERY_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_COMPANY_DELIVERY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_COMPANY_DELIVERY to SXDXSJAPP;
grant select on SXDXSJ.D_COMPANY_DELIVERY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_COMPANY_DELIVERY to SXDXSJMOD;

prompt
prompt Creating table D_COMTYPE_INFO
prompt =============================
prompt
create table SXDXSJ.D_COMTYPE_INFO
(
  com_type_code VARCHAR2(15) not null,
  com_type_name VARCHAR2(50),
  active        CHAR(1) default 1,
  creator       VARCHAR2(50) default 'admin',
  createtime    DATE default sysdate,
  modifier      VARCHAR2(50),
  modify_date   DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_COMTYPE_INFO
  is '维度枚举表：电销系统名单类型代码信息：1、孤儿单，2、银保';
comment on column SXDXSJ.D_COMTYPE_INFO.com_type_code
  is '名单类型代码';
comment on column SXDXSJ.D_COMTYPE_INFO.com_type_name
  is '名单类型名称';
comment on column SXDXSJ.D_COMTYPE_INFO.active
  is '是否可用：1为可用，0为失效';
comment on column SXDXSJ.D_COMTYPE_INFO.creator
  is '创建人';
comment on column SXDXSJ.D_COMTYPE_INFO.createtime
  is '创建日期';
comment on column SXDXSJ.D_COMTYPE_INFO.modifier
  is '修改人';
comment on column SXDXSJ.D_COMTYPE_INFO.modify_date
  is '修改日期';
alter table SXDXSJ.D_COMTYPE_INFO
  add constraint PK_D_COMTYPE_INFO primary key (COM_TYPE_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_COMTYPE_INFO to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_COMTYPE_INFO to SXDXSJAPP;
grant select on SXDXSJ.D_COMTYPE_INFO to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_COMTYPE_INFO to SXDXSJMOD;

prompt
prompt Creating table D_CUSTOMER_LEVEL
prompt ===============================
prompt
create table SXDXSJ.D_CUSTOMER_LEVEL
(
  level_code  NUMBER(3) not null,
  level_name  VARCHAR2(120),
  level_desc  VARCHAR2(508),
  active      CHAR(1),
  creator     VARCHAR2(50),
  create_time DATE,
  modifier    VARCHAR2(50),
  modify_date DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_CUSTOMER_LEVEL
  is '维度枚举表：
列举各种客户等级';
alter table SXDXSJ.D_CUSTOMER_LEVEL
  add constraint PK_D_CUSTOMER_LEVEL primary key (LEVEL_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_CUSTOMER_LEVEL to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_CUSTOMER_LEVEL to SXDXSJAPP;
grant select on SXDXSJ.D_CUSTOMER_LEVEL to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_CUSTOMER_LEVEL to SXDXSJMOD;

prompt
prompt Creating table D_DIAL_STATUS_INFO
prompt =================================
prompt
create table SXDXSJ.D_DIAL_STATUS_INFO
(
  clear_status_code NUMBER(3) not null,
  dial_status_name  VARCHAR2(120),
  active            CHAR(1),
  creator           VARCHAR2(50),
  createtime        DATE,
  modifier          VARCHAR2(50),
  modify_date       DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_DIAL_STATUS_INFO
  is '维度枚举表：
列举客户的各种清洗状态
';
alter table SXDXSJ.D_DIAL_STATUS_INFO
  add constraint PK_D_DIAL_STATUS_INFO primary key (CLEAR_STATUS_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_DIAL_STATUS_INFO to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_DIAL_STATUS_INFO to SXDXSJAPP;
grant select on SXDXSJ.D_DIAL_STATUS_INFO to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_DIAL_STATUS_INFO to SXDXSJMOD;

prompt
prompt Creating table D_DIAL_TIMES
prompt ===========================
prompt
create table SXDXSJ.D_DIAL_TIMES
(
  dial_times_code NUMBER(3) not null,
  dial_times_name VARCHAR2(120),
  dial_times_desc VARCHAR2(508),
  active          CHAR(1) default '1',
  creator         VARCHAR2(50),
  create_time     DATE,
  modifier        VARCHAR2(50),
  modify_date     DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_DIAL_TIMES
  is '维度枚举表：
客户参与的电销次数';
alter table SXDXSJ.D_DIAL_TIMES
  add constraint PK_D_DIAL_TIMES primary key (DIAL_TIMES_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_DIAL_TIMES to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_DIAL_TIMES to SXDXSJAPP;
grant select on SXDXSJ.D_DIAL_TIMES to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_DIAL_TIMES to SXDXSJMOD;

prompt
prompt Creating table D_DIAL_TIME_LENGTH
prompt =================================
prompt
create table SXDXSJ.D_DIAL_TIME_LENGTH
(
  dial_time_length_code    NUMBER(3) not null,
  dial_time_length_section VARCHAR2(508),
  active                   CHAR(1),
  creator                  VARCHAR2(50),
  create_date              DATE,
  modifier                 VARCHAR2(50),
  modify_date              DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_DIAL_TIME_LENGTH
  is '维度枚举表：
列举电销通话时长区间信息';
alter table SXDXSJ.D_DIAL_TIME_LENGTH
  add constraint PK_D_DIAL_TIME_LENGTH primary key (DIAL_TIME_LENGTH_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_DIAL_TIME_LENGTH to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_DIAL_TIME_LENGTH to SXDXSJAPP;
grant select on SXDXSJ.D_DIAL_TIME_LENGTH to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_DIAL_TIME_LENGTH to SXDXSJMOD;

prompt
prompt Creating table D_FROM_REVIST_TIME
prompt =================================
prompt
create table SXDXSJ.D_FROM_REVIST_TIME
(
  from_revist_time_code NUMBER(3) not null,
  from_revist_time_name VARCHAR2(120),
  from_revist_time_desc VARCHAR2(508),
  active                CHAR(1),
  creator               VARCHAR2(50),
  create_time           DATE,
  modifier              VARCHAR2(50),
  modify_date           DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_FROM_REVIST_TIME
  is '维度枚举表：
列举最后一次回访时间距离现在的时间，如3个月、6个月';
alter table SXDXSJ.D_FROM_REVIST_TIME
  add constraint PK_D_FROM_REVIST_TIME primary key (FROM_REVIST_TIME_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_FROM_REVIST_TIME to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_FROM_REVIST_TIME to SXDXSJAPP;
grant select on SXDXSJ.D_FROM_REVIST_TIME to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_FROM_REVIST_TIME to SXDXSJMOD;

prompt
prompt Creating table D_GENDER
prompt =======================
prompt
create table SXDXSJ.D_GENDER
(
  gender_code NUMBER(3) not null,
  gender_name VARCHAR2(120),
  gender_desc VARCHAR2(508),
  active      CHAR(1),
  creator     VARCHAR2(50),
  create_time DATE,
  modifier    VARCHAR2(50),
  modify_date DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_GENDER
  is '维度枚举表：
列举所有性别类型，如男，女，未知';
alter table SXDXSJ.D_GENDER
  add constraint PK_D_GENDER primary key (GENDER_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_GENDER to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_GENDER to SXDXSJAPP;
grant select on SXDXSJ.D_GENDER to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_GENDER to SXDXSJMOD;

prompt
prompt Creating table D_HAS_CTELE
prompt ==========================
prompt
create table SXDXSJ.D_HAS_CTELE
(
  has_ctele_code NUMBER(3) not null,
  has_ctele_name VARCHAR2(120),
  has_ctele_desc VARCHAR2(508),
  active         CHAR(1),
  creator        VARCHAR2(50),
  create_time    DATE,
  modifier       VARCHAR2(50),
  modify_date    DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_HAS_CTELE
  is '维度枚举表：
客户是否有办公电话';
alter table SXDXSJ.D_HAS_CTELE
  add constraint PK_D_HAS_CTELE primary key (HAS_CTELE_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_HAS_CTELE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_HAS_CTELE to SXDXSJAPP;
grant select on SXDXSJ.D_HAS_CTELE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_HAS_CTELE to SXDXSJMOD;

prompt
prompt Creating table D_HAS_FTELE
prompt ==========================
prompt
create table SXDXSJ.D_HAS_FTELE
(
  has_ftele_code NUMBER(3) not null,
  has_ftele_name VARCHAR2(120),
  has_ftele_desc VARCHAR2(508),
  active         CHAR(1),
  creator        VARCHAR2(50),
  create_time    DATE,
  modifier       VARCHAR2(50),
  modify_date    DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_HAS_FTELE
  is '维度枚举表：
客户是否有家庭电话';
alter table SXDXSJ.D_HAS_FTELE
  add constraint PK_D_HAS_FTELE primary key (HAS_FTELE_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_HAS_FTELE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_HAS_FTELE to SXDXSJAPP;
grant select on SXDXSJ.D_HAS_FTELE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_HAS_FTELE to SXDXSJMOD;

prompt
prompt Creating table D_HAS_MOBILE
prompt ===========================
prompt
create table SXDXSJ.D_HAS_MOBILE
(
  has_mobile_code NUMBER(3) not null,
  has_mobile_name VARCHAR2(120),
  has_mobile_desc VARCHAR2(508),
  active          CHAR(1),
  creator         VARCHAR2(50),
  create_time     DATE,
  modifier        VARCHAR2(50),
  modify_date     DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_HAS_MOBILE
  is '维度枚举表：
客户是否有移动电话（手机）';
alter table SXDXSJ.D_HAS_MOBILE
  add constraint PK_D_HAS_MOBILE primary key (HAS_MOBILE_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_HAS_MOBILE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_HAS_MOBILE to SXDXSJAPP;
grant select on SXDXSJ.D_HAS_MOBILE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_HAS_MOBILE to SXDXSJMOD;

prompt
prompt Creating table D_HAS_RECTELE
prompt ============================
prompt
create table SXDXSJ.D_HAS_RECTELE
(
  has_rectele_code NUMBER(3) not null,
  has_rectele_name VARCHAR2(120),
  has_rectele_desc VARCHAR2(508),
  active           CHAR(1),
  creator          VARCHAR2(50),
  create_time      DATE,
  modifier         VARCHAR2(50),
  modify_date      DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_HAS_RECTELE
  is '维度枚举表：
客户是否有收费电话';
alter table SXDXSJ.D_HAS_RECTELE
  add constraint PK_D_HAS_RECTELE primary key (HAS_RECTELE_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_HAS_RECTELE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_HAS_RECTELE to SXDXSJAPP;
grant select on SXDXSJ.D_HAS_RECTELE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_HAS_RECTELE to SXDXSJMOD;

prompt
prompt Creating table D_ISMEET_CHARGEWAY
prompt =================================
prompt
create table SXDXSJ.D_ISMEET_CHARGEWAY
(
  ismeet_code NUMBER(3) not null,
  ismeet_desc VARCHAR2(10),
  create_time DATE default SYSDATE,
  remark      VARCHAR2(100)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_ISMEET_CHARGEWAY
  is '期缴/趸缴信息维表';
comment on column SXDXSJ.D_ISMEET_CHARGEWAY.ismeet_code
  is '是否满足期缴趸缴数据标志';
comment on column SXDXSJ.D_ISMEET_CHARGEWAY.ismeet_desc
  is '是否满足期缴趸缴数据标志描述';
comment on column SXDXSJ.D_ISMEET_CHARGEWAY.create_time
  is '创建时间';
comment on column SXDXSJ.D_ISMEET_CHARGEWAY.remark
  is '备注';
alter table SXDXSJ.D_ISMEET_CHARGEWAY
  add constraint PK_D_ISMEET_CHARGEWAY primary key (ISMEET_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_ISMEET_CHARGEWAY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_ISMEET_CHARGEWAY to SXDXSJAPP;
grant select on SXDXSJ.D_ISMEET_CHARGEWAY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_ISMEET_CHARGEWAY to SXDXSJMOD;

prompt
prompt Creating table D_MONTH_AMOUNT
prompt =============================
prompt
create table SXDXSJ.D_MONTH_AMOUNT
(
  month_amount_code NUMBER(3) not null,
  month_amount_name VARCHAR2(120),
  month_amount_desc VARCHAR2(508),
  active            CHAR(1),
  creator           VARCHAR2(50),
  create_time       DATE,
  modifier          VARCHAR2(50),
  modify_date       DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_MONTH_AMOUNT
  is '维度枚举表：
某一客户所有电销线上成交保单的月缴保费总和的区间信息，如0~200元';
alter table SXDXSJ.D_MONTH_AMOUNT
  add constraint PK_D_MONTH_AMOUNT primary key (MONTH_AMOUNT_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_MONTH_AMOUNT to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_MONTH_AMOUNT to SXDXSJAPP;
grant select on SXDXSJ.D_MONTH_AMOUNT to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_MONTH_AMOUNT to SXDXSJMOD;

prompt
prompt Creating table D_OPERATION_STATUS_INFO
prompt ======================================
prompt
create table SXDXSJ.D_OPERATION_STATUS_INFO
(
  operation_status_code NUMBER(3) not null,
  operation_status_name VARCHAR2(120),
  active                CHAR(1),
  creator               VARCHAR2(50),
  createtime            DATE,
  modifier              VARCHAR2(50),
  modify_date           DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_OPERATION_STATUS_INFO
  is '维度枚举表：
保全状态代码和名称：
0  未保全
1  保全中
2  保全成功
3  保全失败';
alter table SXDXSJ.D_OPERATION_STATUS_INFO
  add constraint PK_D_OPERATION_STATUS_INFO primary key (OPERATION_STATUS_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_OPERATION_STATUS_INFO to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_OPERATION_STATUS_INFO to SXDXSJAPP;
grant select on SXDXSJ.D_OPERATION_STATUS_INFO to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_OPERATION_STATUS_INFO to SXDXSJMOD;

prompt
prompt Creating table D_ORPHAN_STATUS
prompt ==============================
prompt
create table SXDXSJ.D_ORPHAN_STATUS
(
  orphan_status_code NUMBER(3) not null,
  orphan_status_name VARCHAR2(120),
  orphan_status_desc VARCHAR2(508),
  active             CHAR(1),
  creator            VARCHAR2(50),
  create_time        DATE,
  modifier           VARCHAR2(50),
  modify_date        DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_ORPHAN_STATUS
  is '维度枚举表：
列举客户当前状态，如孤儿单、非孤儿单、电销客户';
alter table SXDXSJ.D_ORPHAN_STATUS
  add constraint PK_D_ORPHAN_STATUS primary key (ORPHAN_STATUS_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_ORPHAN_STATUS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_ORPHAN_STATUS to SXDXSJAPP;
grant select on SXDXSJ.D_ORPHAN_STATUS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_ORPHAN_STATUS to SXDXSJMOD;

prompt
prompt Creating table D_PAYMODE_INFO
prompt =============================
prompt
create table SXDXSJ.D_PAYMODE_INFO
(
  pay_mode_code VARCHAR2(15) not null,
  pay_mode_name VARCHAR2(50),
  active        CHAR(1) default 1,
  creator       VARCHAR2(50) default 'admin',
  createtime    DATE default sysdate,
  modifier      VARCHAR2(50),
  modify_date   DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_PAYMODE_INFO
  is '维度枚举表：电销系统缴费方式代码信息：一次缴清	1；年缴 13；月缴	10；趸缴 	01；季缴 11';
comment on column SXDXSJ.D_PAYMODE_INFO.pay_mode_code
  is '缴费方式代码';
comment on column SXDXSJ.D_PAYMODE_INFO.pay_mode_name
  is '缴费方式名称';
comment on column SXDXSJ.D_PAYMODE_INFO.active
  is '是否可用：1为可用，0为失效';
comment on column SXDXSJ.D_PAYMODE_INFO.creator
  is '创建人';
comment on column SXDXSJ.D_PAYMODE_INFO.createtime
  is '创建日期';
comment on column SXDXSJ.D_PAYMODE_INFO.modifier
  is '修改人';
comment on column SXDXSJ.D_PAYMODE_INFO.modify_date
  is '修改日期';
alter table SXDXSJ.D_PAYMODE_INFO
  add constraint PK_D_PAYMODE_INFO primary key (PAY_MODE_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_PAYMODE_INFO to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_PAYMODE_INFO to SXDXSJAPP;
grant select on SXDXSJ.D_PAYMODE_INFO to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_PAYMODE_INFO to SXDXSJMOD;

prompt
prompt Creating table D_PAY_BY_BANK
prompt ============================
prompt
create table SXDXSJ.D_PAY_BY_BANK
(
  pay_by_bank_code NUMBER(3) not null,
  pay_by_bank_name VARCHAR2(120),
  pay_by_bank_desc VARCHAR2(508),
  active           CHAR(1),
  creator          VARCHAR2(50),
  create_time      DATE,
  modifier         VARCHAR2(50),
  modify_date      DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_PAY_BY_BANK
  is '维度枚举表：
是否可通过银行代扣的方式成交保单';
alter table SXDXSJ.D_PAY_BY_BANK
  add constraint PK_D_PAY_BY_BANK primary key (PAY_BY_BANK_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_PAY_BY_BANK to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_PAY_BY_BANK to SXDXSJAPP;
grant select on SXDXSJ.D_PAY_BY_BANK to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_PAY_BY_BANK to SXDXSJMOD;

prompt
prompt Creating table D_PAY_BY_POS
prompt ===========================
prompt
create table SXDXSJ.D_PAY_BY_POS
(
  pay_by_pos_code NUMBER(3) not null,
  pay_by_pos_name VARCHAR2(120),
  pay_by_pos_desc VARCHAR2(508),
  active          CHAR(1),
  creator         VARCHAR2(50),
  create_time     DATE,
  modifier        VARCHAR2(50),
  modify_date     DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_PAY_BY_POS
  is '维度枚举表：
是否可以通过pos及付费购买保单';
alter table SXDXSJ.D_PAY_BY_POS
  add constraint PK_D_PAY_BY_POS primary key (PAY_BY_POS_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_PAY_BY_POS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_PAY_BY_POS to SXDXSJAPP;
grant select on SXDXSJ.D_PAY_BY_POS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_PAY_BY_POS to SXDXSJMOD;

prompt
prompt Creating table D_POLICY_STATUS
prompt ==============================
prompt
create table SXDXSJ.D_POLICY_STATUS
(
  policy_status_code NUMBER(3) not null,
  policy_status_name VARCHAR2(120),
  active             CHAR(1),
  creator            VARCHAR2(50),
  createtime         DATE,
  modifier           VARCHAR2(50),
  modify_date        DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_POLICY_STATUS
  is '维度枚举表：
保单状态代码和名称：
0 无效
1 无保单
2 有效
3 期满
';
alter table SXDXSJ.D_POLICY_STATUS
  add constraint PK_D_POLICY_STATUS primary key (POLICY_STATUS_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_POLICY_STATUS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_POLICY_STATUS to SXDXSJAPP;
grant select on SXDXSJ.D_POLICY_STATUS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_POLICY_STATUS to SXDXSJMOD;

prompt
prompt Creating table D_PREINS_BARRING
prompt ===============================
prompt
create table SXDXSJ.D_PREINS_BARRING
(
  c_preins_bar_flag VARCHAR2(3) not null,
  c_preins_bar_desc VARCHAR2(100),
  create_time       DATE,
  remark            VARCHAR2(100)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_PREINS_BARRING
  is '赠险禁拨标记枚举表';
comment on column SXDXSJ.D_PREINS_BARRING.c_preins_bar_flag
  is '赠险禁拨数据标志';
comment on column SXDXSJ.D_PREINS_BARRING.c_preins_bar_desc
  is '赠险禁拨数据标志描述';
comment on column SXDXSJ.D_PREINS_BARRING.create_time
  is '创建时间';
comment on column SXDXSJ.D_PREINS_BARRING.remark
  is '备注';
alter table SXDXSJ.D_PREINS_BARRING
  add constraint PK_D_PREINS_BARRING primary key (C_PREINS_BAR_FLAG)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_PREINS_BARRING to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_PREINS_BARRING to SXDXSJAPP;
grant select on SXDXSJ.D_PREINS_BARRING to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_PREINS_BARRING to SXDXSJMOD;

prompt
prompt Creating table D_PREINS_CARDID_REPEAT
prompt =====================================
prompt
create table SXDXSJ.D_PREINS_CARDID_REPEAT
(
  c_card_id_valid_flag VARCHAR2(3) not null,
  c_card_id_valid_desc VARCHAR2(100),
  create_time          DATE,
  remark               VARCHAR2(100)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_PREINS_CARDID_REPEAT
  is '身份证有效性枚举信息表';
comment on column SXDXSJ.D_PREINS_CARDID_REPEAT.c_card_id_valid_flag
  is '身份证有效数据标志';
comment on column SXDXSJ.D_PREINS_CARDID_REPEAT.c_card_id_valid_desc
  is '身份证有效数据标志描述';
comment on column SXDXSJ.D_PREINS_CARDID_REPEAT.create_time
  is '创建时间';
comment on column SXDXSJ.D_PREINS_CARDID_REPEAT.remark
  is '备注';
alter table SXDXSJ.D_PREINS_CARDID_REPEAT
  add constraint PK_D_PREINS_CARDID_REPEAT primary key (C_CARD_ID_VALID_FLAG)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_PREINS_CARDID_REPEAT to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_PREINS_CARDID_REPEAT to SXDXSJAPP;
grant select on SXDXSJ.D_PREINS_CARDID_REPEAT to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_PREINS_CARDID_REPEAT to SXDXSJMOD;

prompt
prompt Creating table D_PREINS_COMPANY
prompt ===============================
prompt
create table SXDXSJ.D_PREINS_COMPANY
(
  id                  NUMBER(18) not null,
  preins_company_code VARCHAR2(20),
  preins_company_name VARCHAR2(200),
  preins_middle_code  VARCHAR2(20),
  preins_middle_name  VARCHAR2(200),
  create_time         DATE,
  active              NUMBER(10),
  remark              VARCHAR2(200)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_PREINS_COMPANY
  is '赠险机构维表';
comment on column SXDXSJ.D_PREINS_COMPANY.preins_company_code
  is '分公司代码';
comment on column SXDXSJ.D_PREINS_COMPANY.preins_company_name
  is '分公司';
comment on column SXDXSJ.D_PREINS_COMPANY.preins_middle_code
  is '中支公司代码';
comment on column SXDXSJ.D_PREINS_COMPANY.preins_middle_name
  is '中支公司';
comment on column SXDXSJ.D_PREINS_COMPANY.create_time
  is '创建时间';
comment on column SXDXSJ.D_PREINS_COMPANY.active
  is '是否有效';
comment on column SXDXSJ.D_PREINS_COMPANY.remark
  is '备注';
grant select on SXDXSJ.D_PREINS_COMPANY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_PREINS_COMPANY to SXDXSJAPP;
grant select on SXDXSJ.D_PREINS_COMPANY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_PREINS_COMPANY to SXDXSJMOD;

prompt
prompt Creating table D_PREINS_CUS_NAMEVALID
prompt =====================================
prompt
create table SXDXSJ.D_PREINS_CUS_NAMEVALID
(
  c_name_invalid_flag VARCHAR2(3) not null,
  c_name_invalid_desc VARCHAR2(100),
  create_time         DATE,
  remark              VARCHAR2(100)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_PREINS_CUS_NAMEVALID
  is '赠险客户姓名枚举表';
comment on column SXDXSJ.D_PREINS_CUS_NAMEVALID.c_name_invalid_flag
  is '赠险客户姓名数据标志';
comment on column SXDXSJ.D_PREINS_CUS_NAMEVALID.c_name_invalid_desc
  is '赠险客户姓名数据描述';
comment on column SXDXSJ.D_PREINS_CUS_NAMEVALID.create_time
  is '创建时间';
comment on column SXDXSJ.D_PREINS_CUS_NAMEVALID.remark
  is '备注';
alter table SXDXSJ.D_PREINS_CUS_NAMEVALID
  add constraint PK_D_PREINS_CUS_NAMEVALID primary key (C_NAME_INVALID_FLAG)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_PREINS_CUS_NAMEVALID to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_PREINS_CUS_NAMEVALID to SXDXSJAPP;
grant select on SXDXSJ.D_PREINS_CUS_NAMEVALID to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_PREINS_CUS_NAMEVALID to SXDXSJMOD;

prompt
prompt Creating table D_PREINS_NAMEBIRTH
prompt =================================
prompt
create table SXDXSJ.D_PREINS_NAMEBIRTH
(
  name_status_code  VARCHAR2(3) not null,
  name_status_desc  VARCHAR2(30),
  birth_status_code VARCHAR2(3),
  birth_status_desc VARCHAR2(30),
  create_tme        DATE,
  remark            VARCHAR2(100)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_PREINS_NAMEBIRTH
  is '赠险客户姓名/生日枚举表';
comment on column SXDXSJ.D_PREINS_NAMEBIRTH.name_status_code
  is '姓名是否有效状态码';
comment on column SXDXSJ.D_PREINS_NAMEBIRTH.name_status_desc
  is '姓名是否有效描述';
comment on column SXDXSJ.D_PREINS_NAMEBIRTH.birth_status_code
  is '生日是否有效状态码';
comment on column SXDXSJ.D_PREINS_NAMEBIRTH.birth_status_desc
  is '生日是否有效描述';
comment on column SXDXSJ.D_PREINS_NAMEBIRTH.create_tme
  is '创建时间';
comment on column SXDXSJ.D_PREINS_NAMEBIRTH.remark
  is '备注';
grant select on SXDXSJ.D_PREINS_NAMEBIRTH to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_PREINS_NAMEBIRTH to SXDXSJAPP;
grant select on SXDXSJ.D_PREINS_NAMEBIRTH to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_PREINS_NAMEBIRTH to SXDXSJMOD;

prompt
prompt Creating table D_PREINS_OTHERORG_REPEAT
prompt =======================================
prompt
create table SXDXSJ.D_PREINS_OTHERORG_REPEAT
(
  c_preins_repeat_flag VARCHAR2(3) not null,
  c_preins_repeat_desc VARCHAR2(100),
  create_time          DATE,
  remark               VARCHAR2(100)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_PREINS_OTHERORG_REPEAT
  is '其他机构重复枚举信息表';
comment on column SXDXSJ.D_PREINS_OTHERORG_REPEAT.c_preins_repeat_flag
  is '赠险重复数据标志';
comment on column SXDXSJ.D_PREINS_OTHERORG_REPEAT.c_preins_repeat_desc
  is '赠险重复数据标志描述';
comment on column SXDXSJ.D_PREINS_OTHERORG_REPEAT.create_time
  is '创建时间';
comment on column SXDXSJ.D_PREINS_OTHERORG_REPEAT.remark
  is '备注';
alter table SXDXSJ.D_PREINS_OTHERORG_REPEAT
  add constraint PK_D_PREINS_OTHERORG_REPEAT primary key (C_PREINS_REPEAT_FLAG)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_PREINS_OTHERORG_REPEAT to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_PREINS_OTHERORG_REPEAT to SXDXSJAPP;
grant select on SXDXSJ.D_PREINS_OTHERORG_REPEAT to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_PREINS_OTHERORG_REPEAT to SXDXSJMOD;

prompt
prompt Creating table D_PREINS_OTHERTYPE_REPEAT
prompt ========================================
prompt
create table SXDXSJ.D_PREINS_OTHERTYPE_REPEAT
(
  c_othertype_repeat_flag VARCHAR2(3) not null,
  c_othertype_repeat_desc VARCHAR2(100),
  create_time             DATE,
  remark                  VARCHAR2(100)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_PREINS_OTHERTYPE_REPEAT
  is '其他类型重复枚举信息表';
comment on column SXDXSJ.D_PREINS_OTHERTYPE_REPEAT.c_othertype_repeat_flag
  is '与其他类型重复数据标志';
comment on column SXDXSJ.D_PREINS_OTHERTYPE_REPEAT.c_othertype_repeat_desc
  is '与其他类型重复数据标志描述';
comment on column SXDXSJ.D_PREINS_OTHERTYPE_REPEAT.create_time
  is '创建时间';
comment on column SXDXSJ.D_PREINS_OTHERTYPE_REPEAT.remark
  is '备注';
alter table SXDXSJ.D_PREINS_OTHERTYPE_REPEAT
  add constraint PK_D_PREINS_OTHERTYPE_REPEAT primary key (C_OTHERTYPE_REPEAT_FLAG)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_PREINS_OTHERTYPE_REPEAT to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_PREINS_OTHERTYPE_REPEAT to SXDXSJAPP;
grant select on SXDXSJ.D_PREINS_OTHERTYPE_REPEAT to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_PREINS_OTHERTYPE_REPEAT to SXDXSJMOD;

prompt
prompt Creating table D_PREINS_PHONE_VALID
prompt ===================================
prompt
create table SXDXSJ.D_PREINS_PHONE_VALID
(
  c_phone_invalid_flag VARCHAR2(3) not null,
  c_phone_invalid_desc VARCHAR2(100),
  create_time          DATE,
  remark               VARCHAR2(100)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_PREINS_PHONE_VALID
  is '赠险电话是否有效枚举表';
comment on column SXDXSJ.D_PREINS_PHONE_VALID.c_phone_invalid_flag
  is '电话有效数据标志';
comment on column SXDXSJ.D_PREINS_PHONE_VALID.c_phone_invalid_desc
  is '电话有效数据标志描述';
comment on column SXDXSJ.D_PREINS_PHONE_VALID.create_time
  is '创建时间';
comment on column SXDXSJ.D_PREINS_PHONE_VALID.remark
  is '备注';
alter table SXDXSJ.D_PREINS_PHONE_VALID
  add constraint PK_D_PREINS_PHONE_VALID primary key (C_PHONE_INVALID_FLAG)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_PREINS_PHONE_VALID to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_PREINS_PHONE_VALID to SXDXSJAPP;
grant select on SXDXSJ.D_PREINS_PHONE_VALID to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_PREINS_PHONE_VALID to SXDXSJMOD;

prompt
prompt Creating table D_PREINS_SALE_ORG
prompt ================================
prompt
create table SXDXSJ.D_PREINS_SALE_ORG
(
  c_sale_orgcode VARCHAR2(20) not null,
  c_sale_org     VARCHAR2(100),
  c_sale_creator VARCHAR2(100),
  c_create_time  DATE,
  c_active       NUMBER
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_PREINS_SALE_ORG
  is '销售机构';
comment on column SXDXSJ.D_PREINS_SALE_ORG.c_sale_orgcode
  is '销售机构代码';
comment on column SXDXSJ.D_PREINS_SALE_ORG.c_sale_org
  is '销售机构名称';
comment on column SXDXSJ.D_PREINS_SALE_ORG.c_sale_creator
  is '创建人';
comment on column SXDXSJ.D_PREINS_SALE_ORG.c_create_time
  is '创建时间';
comment on column SXDXSJ.D_PREINS_SALE_ORG.c_active
  is '有效状态';
alter table SXDXSJ.D_PREINS_SALE_ORG
  add constraint PK_D_PREINS_SALE_ORG primary key (C_SALE_ORGCODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_PREINS_SALE_ORG to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_PREINS_SALE_ORG to SXDXSJAPP;
grant select on SXDXSJ.D_PREINS_SALE_ORG to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_PREINS_SALE_ORG to SXDXSJMOD;

prompt
prompt Creating table D_PREINS_SALE_SITUATION
prompt ======================================
prompt
create table SXDXSJ.D_PREINS_SALE_SITUATION
(
  c_sale_situationcode VARCHAR2(20) not null,
  c_sale_situationdesc VARCHAR2(100),
  c_creator            VARCHAR2(100),
  c_crate_time         DATE,
  c_active             NUMBER
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_PREINS_SALE_SITUATION
  is '销售情况';
comment on column SXDXSJ.D_PREINS_SALE_SITUATION.c_sale_situationcode
  is '销售情况状态码';
comment on column SXDXSJ.D_PREINS_SALE_SITUATION.c_sale_situationdesc
  is '销售情况状态名称';
comment on column SXDXSJ.D_PREINS_SALE_SITUATION.c_creator
  is '创建人';
comment on column SXDXSJ.D_PREINS_SALE_SITUATION.c_crate_time
  is '创建时间';
comment on column SXDXSJ.D_PREINS_SALE_SITUATION.c_active
  is '有效状态';
alter table SXDXSJ.D_PREINS_SALE_SITUATION
  add constraint PK_D_PREINS_SALE_SITUATION primary key (C_SALE_SITUATIONCODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_PREINS_SALE_SITUATION to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_PREINS_SALE_SITUATION to SXDXSJAPP;
grant select on SXDXSJ.D_PREINS_SALE_SITUATION to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_PREINS_SALE_SITUATION to SXDXSJMOD;

prompt
prompt Creating table D_PREINS_SAMEORG_REPEAT
prompt ======================================
prompt
create table SXDXSJ.D_PREINS_SAMEORG_REPEAT
(
  c_sameorg_repeat_flag VARCHAR2(3) not null,
  c_sameorg_repeat_desc VARCHAR2(100),
  create_time           DATE,
  remark                VARCHAR2(100)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_PREINS_SAMEORG_REPEAT
  is '同机构重复枚举信息表';
comment on column SXDXSJ.D_PREINS_SAMEORG_REPEAT.c_sameorg_repeat_flag
  is '同机构重复数据标志';
comment on column SXDXSJ.D_PREINS_SAMEORG_REPEAT.c_sameorg_repeat_desc
  is '同机构重复数据标志描述';
comment on column SXDXSJ.D_PREINS_SAMEORG_REPEAT.create_time
  is '创建时间';
comment on column SXDXSJ.D_PREINS_SAMEORG_REPEAT.remark
  is '备注';
alter table SXDXSJ.D_PREINS_SAMEORG_REPEAT
  add constraint PK_D_PREINS_SAMEORG_REPEAT primary key (C_SAMEORG_REPEAT_FLAG)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_PREINS_SAMEORG_REPEAT to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_PREINS_SAMEORG_REPEAT to SXDXSJAPP;
grant select on SXDXSJ.D_PREINS_SAMEORG_REPEAT to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_PREINS_SAMEORG_REPEAT to SXDXSJMOD;

prompt
prompt Creating table D_PREINS_STATUS
prompt ==============================
prompt
create table SXDXSJ.D_PREINS_STATUS
(
  c_preins_code VARCHAR2(3) not null,
  c_preins_name VARCHAR2(100),
  c_creator     VARCHAR2(100),
  c_crate_time  DATE,
  c_active      NUMBER
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_PREINS_STATUS
  is '赠险状态';
comment on column SXDXSJ.D_PREINS_STATUS.c_preins_code
  is '赠险状态码';
comment on column SXDXSJ.D_PREINS_STATUS.c_preins_name
  is '赠险状态名称';
comment on column SXDXSJ.D_PREINS_STATUS.c_creator
  is '创建人';
comment on column SXDXSJ.D_PREINS_STATUS.c_crate_time
  is '创建时间';
comment on column SXDXSJ.D_PREINS_STATUS.c_active
  is '有效状态';
alter table SXDXSJ.D_PREINS_STATUS
  add constraint PK_D_PREINS_STATUS primary key (C_PREINS_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_PREINS_STATUS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_PREINS_STATUS to SXDXSJAPP;
grant select on SXDXSJ.D_PREINS_STATUS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_PREINS_STATUS to SXDXSJMOD;

prompt
prompt Creating table D_PREINS_TIME_DIM
prompt ================================
prompt
create table SXDXSJ.D_PREINS_TIME_DIM
(
  day_date   DATE not null,
  day_code   VARCHAR2(8) not null,
  month_code VARCHAR2(8),
  year_code  VARCHAR2(8),
  day_desc   VARCHAR2(30),
  month_desc VARCHAR2(30),
  year_desc  VARCHAR2(30)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_PREINS_TIME_DIM
  is '赠险日期枚举表';
comment on column SXDXSJ.D_PREINS_TIME_DIM.day_date
  is '日期';
comment on column SXDXSJ.D_PREINS_TIME_DIM.day_code
  is '日期键';
comment on column SXDXSJ.D_PREINS_TIME_DIM.month_code
  is '月键';
comment on column SXDXSJ.D_PREINS_TIME_DIM.year_code
  is '年键';
comment on column SXDXSJ.D_PREINS_TIME_DIM.day_desc
  is '日期名称';
comment on column SXDXSJ.D_PREINS_TIME_DIM.month_desc
  is '月名称';
comment on column SXDXSJ.D_PREINS_TIME_DIM.year_desc
  is '年名称';
alter table SXDXSJ.D_PREINS_TIME_DIM
  add constraint PK_D_PREINS_TIME_DIM primary key (DAY_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_PREINS_TIME_DIM to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_PREINS_TIME_DIM to SXDXSJAPP;
grant select on SXDXSJ.D_PREINS_TIME_DIM to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_PREINS_TIME_DIM to SXDXSJMOD;

prompt
prompt Creating table D_SALE_PERIOD
prompt ============================
prompt
create table SXDXSJ.D_SALE_PERIOD
(
  from_last_sale_time_code NUMBER(3) not null,
  from_last_sale_time_name VARCHAR2(120),
  active                   CHAR(1),
  creator                  VARCHAR2(50),
  create_date              DATE,
  modifier                 VARCHAR2(50),
  modify_date              DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_SALE_PERIOD
  is '维度枚举表：
列举最近一次销售距离现在的时间差分段信息';
alter table SXDXSJ.D_SALE_PERIOD
  add constraint PK_D_SALE_PERIOD primary key (FROM_LAST_SALE_TIME_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_SALE_PERIOD to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_SALE_PERIOD to SXDXSJAPP;
grant select on SXDXSJ.D_SALE_PERIOD to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_SALE_PERIOD to SXDXSJMOD;

prompt
prompt Creating table D_SALE_STATUS_INFO
prompt =================================
prompt
create table SXDXSJ.D_SALE_STATUS_INFO
(
  sale_status_code NUMBER(3) not null,
  sale_status_name VARCHAR2(120),
  active           CHAR(1),
  creator          VARCHAR2(50),
  createtime       DATE,
  modifier         VARCHAR2(50),
  modify_date      DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_SALE_STATUS_INFO
  is '维度枚举表：
销售状态代码和名称：
0  未销售
1  销售中
2  未接通
3  销售失败
4  线上成交
5  付费成功';
alter table SXDXSJ.D_SALE_STATUS_INFO
  add constraint PK_D_SALE_STATUS_INFO primary key (SALE_STATUS_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_SALE_STATUS_INFO to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_SALE_STATUS_INFO to SXDXSJAPP;
grant select on SXDXSJ.D_SALE_STATUS_INFO to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_SALE_STATUS_INFO to SXDXSJMOD;

prompt
prompt Creating table D_SOURCE_FROM_INFO
prompt =================================
prompt
create table SXDXSJ.D_SOURCE_FROM_INFO
(
  source_type_code NUMBER(3) not null,
  source_type_name VARCHAR2(120),
  source_type_desc VARCHAR2(508),
  active           CHAR(1),
  creator          VARCHAR2(50),
  createtime       DATE,
  modifier         VARCHAR2(50),
  modify_date      DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_SOURCE_FROM_INFO
  is '维度枚举表：
原始数据的来源类型。如孤儿单、银保、赠险等';
comment on column SXDXSJ.D_SOURCE_FROM_INFO.source_type_code
  is '信息来源类型码';
comment on column SXDXSJ.D_SOURCE_FROM_INFO.source_type_name
  is '信息来源名称';
comment on column SXDXSJ.D_SOURCE_FROM_INFO.source_type_desc
  is '信息来源说明';
comment on column SXDXSJ.D_SOURCE_FROM_INFO.active
  is '是否可用';
comment on column SXDXSJ.D_SOURCE_FROM_INFO.creator
  is '创建人';
comment on column SXDXSJ.D_SOURCE_FROM_INFO.createtime
  is '创建日期';
comment on column SXDXSJ.D_SOURCE_FROM_INFO.modifier
  is '修改人';
comment on column SXDXSJ.D_SOURCE_FROM_INFO.modify_date
  is '修改日期';
alter table SXDXSJ.D_SOURCE_FROM_INFO
  add constraint PK_D_SOURCE_FROM_INFO primary key (SOURCE_TYPE_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_SOURCE_FROM_INFO to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_SOURCE_FROM_INFO to SXDXSJAPP;
grant select on SXDXSJ.D_SOURCE_FROM_INFO to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_SOURCE_FROM_INFO to SXDXSJMOD;

prompt
prompt Creating table D_TELMARKET_TYPE
prompt ===============================
prompt
create table SXDXSJ.D_TELMARKET_TYPE
(
  sec_telemkt_no VARCHAR2(15) not null,
  sec_telemkt_nm VARCHAR2(50),
  fir_telemkt_no VARCHAR2(15),
  fir_telemkt_nm VARCHAR2(50),
  active         CHAR(1) default 1,
  creator        VARCHAR2(50) default 'admin',
  createtime     DATE default sysdate,
  modifier       VARCHAR2(50),
  modify_date    DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_TELMARKET_TYPE
  is '维度枚举表：电销结果类型表：1="空号",2= "错号", 3= "无人接听",4="挂机",5="红黑名单",6=开场白",7="促成",8="产品介绍",9="健康告知",10="录入资料",11="其它"';
comment on column SXDXSJ.D_TELMARKET_TYPE.sec_telemkt_no
  is '二级电销结果代码';
comment on column SXDXSJ.D_TELMARKET_TYPE.sec_telemkt_nm
  is '二级电销结果名称';
comment on column SXDXSJ.D_TELMARKET_TYPE.fir_telemkt_no
  is '一级电销结果代码';
comment on column SXDXSJ.D_TELMARKET_TYPE.fir_telemkt_nm
  is '一级电销结果名称';
comment on column SXDXSJ.D_TELMARKET_TYPE.active
  is '是否可用：1为可用，0为失效';
comment on column SXDXSJ.D_TELMARKET_TYPE.creator
  is '创建人';
comment on column SXDXSJ.D_TELMARKET_TYPE.createtime
  is '创建日期';
comment on column SXDXSJ.D_TELMARKET_TYPE.modifier
  is '修改人';
comment on column SXDXSJ.D_TELMARKET_TYPE.modify_date
  is '修改日期';
alter table SXDXSJ.D_TELMARKET_TYPE
  add constraint PK_D_TELMARKET_TYPE primary key (SEC_TELEMKT_NO)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_TELMARKET_TYPE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_TELMARKET_TYPE to SXDXSJAPP;
grant select on SXDXSJ.D_TELMARKET_TYPE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_TELMARKET_TYPE to SXDXSJMOD;

prompt
prompt Creating table D_TIME_DIMENSION
prompt ===============================
prompt
create table SXDXSJ.D_TIME_DIMENSION
(
  day_date         DATE not null,
  day_year         NUMBER,
  y_name           VARCHAR2(10),
  day_quarter      NUMBER,
  q_name           VARCHAR2(10),
  day_mon          NUMBER,
  m_name           VARCHAR2(10),
  day_week         NUMBER,
  w_name           VARCHAR2(10),
  year_interval    VARCHAR2(30),
  quarter_interval VARCHAR2(30),
  month_interval   VARCHAR2(30),
  week_interval    VARCHAR2(30)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.D_TIME_DIMENSION
  add constraint PK_DAY_DATE primary key (DAY_DATE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_TIME_DIMENSION to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_TIME_DIMENSION to SXDXSJAPP;
grant select on SXDXSJ.D_TIME_DIMENSION to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_TIME_DIMENSION to SXDXSJMOD;

prompt
prompt Creating table D_ZONE_STANDARD_SUC
prompt ==================================
prompt
create table SXDXSJ.D_ZONE_STANDARD_SUC
(
  c_standard_suc_flag VARCHAR2(3) not null,
  c_standard_suc_desc VARCHAR2(50),
  create_time         DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_ZONE_STANDARD_SUC
  is '归属地标准化枚举表';
comment on column SXDXSJ.D_ZONE_STANDARD_SUC.c_standard_suc_flag
  is '归属地标准化标志';
comment on column SXDXSJ.D_ZONE_STANDARD_SUC.c_standard_suc_desc
  is '归属地标准化标志描述';
comment on column SXDXSJ.D_ZONE_STANDARD_SUC.create_time
  is '创建时间';
alter table SXDXSJ.D_ZONE_STANDARD_SUC
  add constraint PK_D_ZONE_STANDARD_SUC primary key (C_STANDARD_SUC_FLAG)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_ZONE_STANDARD_SUC to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_ZONE_STANDARD_SUC to SXDXSJAPP;
grant select on SXDXSJ.D_ZONE_STANDARD_SUC to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_ZONE_STANDARD_SUC to SXDXSJMOD;

prompt
prompt Creating table D_ZONE_TYPE
prompt ==========================
prompt
create table SXDXSJ.D_ZONE_TYPE
(
  zone_type_code NUMBER(3) not null,
  zone_type_name VARCHAR2(120),
  zone_type_desc VARCHAR2(508),
  active         CHAR(1),
  creator        VARCHAR2(50),
  create_time    DATE,
  modifier       VARCHAR2(50),
  modify_date    DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.D_ZONE_TYPE
  is '维度枚举表：
列举各种区域类型，如：城市、县城、乡镇';
comment on column SXDXSJ.D_ZONE_TYPE.active
  is '是否可用';
comment on column SXDXSJ.D_ZONE_TYPE.creator
  is '创建人';
comment on column SXDXSJ.D_ZONE_TYPE.create_time
  is '创建日期';
comment on column SXDXSJ.D_ZONE_TYPE.modifier
  is '修改人';
comment on column SXDXSJ.D_ZONE_TYPE.modify_date
  is '修改日期';
alter table SXDXSJ.D_ZONE_TYPE
  add constraint PK_D_ZONE_TYPE primary key (ZONE_TYPE_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.D_ZONE_TYPE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.D_ZONE_TYPE to SXDXSJAPP;
grant select on SXDXSJ.D_ZONE_TYPE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.D_ZONE_TYPE to SXDXSJMOD;

prompt
prompt Creating table FIELDS_TEMPLATE
prompt ==============================
prompt
create table SXDXSJ.FIELDS_TEMPLATE
(
  template_id   INTEGER not null,
  template_name VARCHAR2(120),
  template_desc VARCHAR2(120),
  file_type     VARCHAR2(20),
  active        CHAR(1),
  delimiter     CHAR(1),
  creator       VARCHAR2(50),
  create_date   DATE,
  modifier      VARCHAR2(50),
  modify_date   DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SXDXSJ.FIELDS_TEMPLATE
  is '字段匹配模板（供导入导出是使用）
字段如果过大，导入时候将会被截断。
由用户自行判断。';
alter table SXDXSJ.FIELDS_TEMPLATE
  add constraint PK_FIELDS_TEMPLATE primary key (TEMPLATE_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select on SXDXSJ.FIELDS_TEMPLATE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.FIELDS_TEMPLATE to SXDXSJAPP;
grant select on SXDXSJ.FIELDS_TEMPLATE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.FIELDS_TEMPLATE to SXDXSJMOD;

prompt
prompt Creating table FILTER_CLASS_CODE
prompt ================================
prompt
create table SXDXSJ.FILTER_CLASS_CODE
(
  class_code   VARCHAR2(10) not null,
  class_type   VARCHAR2(200),
  old_code     VARCHAR2(10),
  class_name   VARCHAR2(300),
  clean_filter NUMBER(1) default 0,
  dx_filter    NUMBER(1) default 1,
  bq_filter    NUMBER(1) default 0,
  status       NUMBER(3) default 1,
  remark       VARCHAR2(300),
  update_time  DATE,
  create_time  DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.FILTER_CLASS_CODE
  add constraint PK_FILTER_CLASS_CODE primary key (CLASS_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.FILTER_CLASS_CODE to DXSJDBEXTR;
grant select on SXDXSJ.FILTER_CLASS_CODE to NUANCE;
grant select, insert, update, delete on SXDXSJ.FILTER_CLASS_CODE to SXDXSJAPP;
grant select on SXDXSJ.FILTER_CLASS_CODE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.FILTER_CLASS_CODE to SXDXSJMOD;

prompt
prompt Creating table FILTER_RED_BLACK
prompt ===============================
prompt
create table SXDXSJ.FILTER_RED_BLACK
(
  customer_name VARCHAR2(300),
  customer_id   VARCHAR2(20),
  telephone     VARCHAR2(20),
  clean_filter  NUMBER(1) default 1,
  dx_filter     NUMBER(1) default 1,
  bq_filter     NUMBER(1) default 1,
  status        NUMBER(3) default 1,
  remark        VARCHAR2(300),
  update_time   DATE,
  create_time   DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.FILTER_RED_BLACK
  is '导出电销时，凡与此清单中身份证号相同或电话相同的客户均不导出电销，也不能导出保全和清洗';
grant select on SXDXSJ.FILTER_RED_BLACK to DXSJDBEXTR;
grant select on SXDXSJ.FILTER_RED_BLACK to NUANCE;
grant select, insert, update, delete on SXDXSJ.FILTER_RED_BLACK to SXDXSJAPP;
grant select on SXDXSJ.FILTER_RED_BLACK to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.FILTER_RED_BLACK to SXDXSJMOD;

prompt
prompt Creating table F_LATEST_POLICY
prompt ==============================
prompt
create table SXDXSJ.F_LATEST_POLICY
(
  policy_no                 CHAR(30) not null,
  class_code                CHAR(10) not null,
  class_name                VARCHAR2(508),
  policy_status             VARCHAR2(6),
  claim_status              VARCHAR2(6),
  payment_status            VARCHAR2(6),
  pieces                    NUMBER(20,2),
  begin_date                DATE,
  end_date                  DATE,
  charge_copy               NUMBER(20,2),
  charge_way                VARCHAR2(6),
  charge_status             VARCHAR2(6),
  charge_end_date           DATE,
  charge_years              NUMBER(10),
  charge_end_ages           NUMBER(3),
  charge_total_times        NUMBER(3),
  charge_total_amount       NUMBER(20,2),
  relation                  VARCHAR2(20),
  recognizee_age            NUMBER(3),
  policy_holder_id          CHAR(18),
  policy_holder_copy_id     CHAR(40),
  recognizee_holder_id      CHAR(18),
  recognizee_holder_copy_id CHAR(40),
  employee_no               VARCHAR2(20),
  account_type              NUMBER(3),
  account_no                CHAR(40),
  bank_code                 CHAR(20),
  bank_name                 VARCHAR2(120),
  market_channel            NUMBER(3),
  govern_id                 CHAR(30),
  govern_name               VARCHAR2(120),
  tel_code                  CHAR(10),
  branch_abbreviation       VARCHAR2(10),
  branch_name               VARCHAR2(120),
  reczip                    VARCHAR2(30),
  charge_phone              VARCHAR2(30),
  mobile_phone              VARCHAR2(30),
  other_phone               VARCHAR2(30),
  fax                       VARCHAR2(30),
  email                     VARCHAR2(40),
  education_level           VARCHAR2(40),
  income                    NUMBER(12,2),
  update_time               DATE,
  recieve_time              DATE,
  bank_status               VARCHAR2(3),
  orphan_status             VARCHAR2(3),
  charge_info               NUMBER(10),
  partition_col             NUMBER(6) not null,
  policy_partition_col      NUMBER(6) not null
)
partition by list (PARTITION_COL)
(
  partition PART01 values (1)
    tablespace SXDXSJ_DATA_P21
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART02 values (2)
    tablespace SXDXSJ_DATA_P22
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART03 values (3)
    tablespace SXDXSJ_DATA_P23
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART04 values (4)
    tablespace SXDXSJ_DATA_P24
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART05 values (5)
    tablespace SXDXSJ_DATA_P25
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART06 values (6)
    tablespace SXDXSJ_DATA_P26
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART07 values (7)
    tablespace SXDXSJ_DATA_P27
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART08 values (8)
    tablespace SXDXSJ_DATA_P28
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART09 values (9)
    tablespace SXDXSJ_DATA_P29
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART00 values (default)
    tablespace SXDXSJ_DATA_P30
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    )
);
comment on table SXDXSJ.F_LATEST_POLICY
  is '经过处理后存放最新保单信息，不包括电销系统线上成交的保单信息
';
comment on column SXDXSJ.F_LATEST_POLICY.policy_no
  is '保单号码';
comment on column SXDXSJ.F_LATEST_POLICY.class_code
  is '险种代码';
comment on column SXDXSJ.F_LATEST_POLICY.class_name
  is '险种名称';
comment on column SXDXSJ.F_LATEST_POLICY.policy_status
  is '保单状况';
comment on column SXDXSJ.F_LATEST_POLICY.claim_status
  is '理赔状态';
comment on column SXDXSJ.F_LATEST_POLICY.payment_status
  is '给付状态';
comment on column SXDXSJ.F_LATEST_POLICY.pieces
  is '份数';
comment on column SXDXSJ.F_LATEST_POLICY.begin_date
  is '责任起始日期';
comment on column SXDXSJ.F_LATEST_POLICY.end_date
  is '责任终止日期';
comment on column SXDXSJ.F_LATEST_POLICY.charge_copy
  is '每份缴费标准';
comment on column SXDXSJ.F_LATEST_POLICY.charge_way
  is '缴费方式';
comment on column SXDXSJ.F_LATEST_POLICY.charge_status
  is '缴费状态';
comment on column SXDXSJ.F_LATEST_POLICY.charge_end_date
  is '缴费终止日期';
comment on column SXDXSJ.F_LATEST_POLICY.charge_years
  is '缴费年限';
comment on column SXDXSJ.F_LATEST_POLICY.charge_end_ages
  is '缴费终止年龄';
comment on column SXDXSJ.F_LATEST_POLICY.charge_total_times
  is '累计缴费次数';
comment on column SXDXSJ.F_LATEST_POLICY.charge_total_amount
  is '累计已缴保费';
comment on column SXDXSJ.F_LATEST_POLICY.relation
  is '投保人和被保人的关系';
comment on column SXDXSJ.F_LATEST_POLICY.recognizee_age
  is '投保时被保险人年龄';
comment on column SXDXSJ.F_LATEST_POLICY.policy_holder_id
  is '投保人身份证号码';
comment on column SXDXSJ.F_LATEST_POLICY.policy_holder_copy_id
  is '投保人身份证号码副本';
comment on column SXDXSJ.F_LATEST_POLICY.recognizee_holder_id
  is '被保人身份证号码';
comment on column SXDXSJ.F_LATEST_POLICY.recognizee_holder_copy_id
  is '被保人身份证号码副本';
comment on column SXDXSJ.F_LATEST_POLICY.employee_no
  is '业务员工号';
comment on column SXDXSJ.F_LATEST_POLICY.account_type
  is '帐户类型';
comment on column SXDXSJ.F_LATEST_POLICY.account_no
  is '账户号';
comment on column SXDXSJ.F_LATEST_POLICY.bank_code
  is '开户银行代码';
comment on column SXDXSJ.F_LATEST_POLICY.bank_name
  is '开户银行名称';
comment on column SXDXSJ.F_LATEST_POLICY.market_channel
  is '渠道';
comment on column SXDXSJ.F_LATEST_POLICY.govern_id
  is '行政机构代码';
comment on column SXDXSJ.F_LATEST_POLICY.govern_name
  is '行政机构名称';
comment on column SXDXSJ.F_LATEST_POLICY.tel_code
  is '电话区号';
comment on column SXDXSJ.F_LATEST_POLICY.branch_abbreviation
  is '分公司简称';
comment on column SXDXSJ.F_LATEST_POLICY.branch_name
  is '分公司全称';
comment on column SXDXSJ.F_LATEST_POLICY.reczip
  is '区域编码';
comment on column SXDXSJ.F_LATEST_POLICY.charge_phone
  is '收费电话';
comment on column SXDXSJ.F_LATEST_POLICY.mobile_phone
  is '投保人移动电话号码';
comment on column SXDXSJ.F_LATEST_POLICY.other_phone
  is '投保人其他电话号码';
comment on column SXDXSJ.F_LATEST_POLICY.fax
  is '投保人传真';
comment on column SXDXSJ.F_LATEST_POLICY.email
  is '投保人电子邮件';
comment on column SXDXSJ.F_LATEST_POLICY.education_level
  is '投保人教育程度/学历';
comment on column SXDXSJ.F_LATEST_POLICY.income
  is '投保人收入';
comment on column SXDXSJ.F_LATEST_POLICY.update_time
  is '最后更新日期';
comment on column SXDXSJ.F_LATEST_POLICY.recieve_time
  is '最近给付领取时间';
comment on column SXDXSJ.F_LATEST_POLICY.bank_status
  is '银行状态';
comment on column SXDXSJ.F_LATEST_POLICY.orphan_status
  is '孤儿单状态';
comment on column SXDXSJ.F_LATEST_POLICY.charge_info
  is '付费信息';
comment on column SXDXSJ.F_LATEST_POLICY.partition_col
  is '客户分区列';
comment on column SXDXSJ.F_LATEST_POLICY.policy_partition_col
  is '保单分区列';
create index SXDXSJ.IDX_F_LATEST_POLICY_NO on SXDXSJ.F_LATEST_POLICY (POLICY_NO)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.INDEX_LP_CUS on SXDXSJ.F_LATEST_POLICY (POLICY_HOLDER_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.INDEX_LP_PART on SXDXSJ.F_LATEST_POLICY (PARTITION_COL)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.F_LATEST_POLICY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.F_LATEST_POLICY to SXDXSJAPP;
grant select on SXDXSJ.F_LATEST_POLICY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.F_LATEST_POLICY to SXDXSJMOD;

prompt
prompt Creating table HELP_GOVERN_PHONE_CODE
prompt =====================================
prompt
create table SXDXSJ.HELP_GOVERN_PHONE_CODE
(
  branch_name         VARCHAR2(120),
  branch_code         NUMBER(6),
  child_branch_code   NUMBER(3),
  branch_abbreviation VARCHAR2(20),
  govern_name         VARCHAR2(120),
  govern_id           VARCHAR2(30) not null,
  phone_code          VARCHAR2(20),
  branch_type         CHAR(1),
  zone_type_code      NUMBER(3)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.HELP_GOVERN_PHONE_CODE
  is '机构码所对应的分公司、中支、区域类型、电话区号等信息表';
comment on column SXDXSJ.HELP_GOVERN_PHONE_CODE.branch_name
  is '分公司名称';
comment on column SXDXSJ.HELP_GOVERN_PHONE_CODE.branch_code
  is '中支代码';
comment on column SXDXSJ.HELP_GOVERN_PHONE_CODE.child_branch_code
  is '分公司代码';
comment on column SXDXSJ.HELP_GOVERN_PHONE_CODE.branch_abbreviation
  is '分公司简称';
comment on column SXDXSJ.HELP_GOVERN_PHONE_CODE.govern_name
  is '机构名';
comment on column SXDXSJ.HELP_GOVERN_PHONE_CODE.govern_id
  is '机构码';
comment on column SXDXSJ.HELP_GOVERN_PHONE_CODE.phone_code
  is '电话区号';
comment on column SXDXSJ.HELP_GOVERN_PHONE_CODE.branch_type
  is '分公司类型';
comment on column SXDXSJ.HELP_GOVERN_PHONE_CODE.zone_type_code
  is '分公司类型编码';
alter table SXDXSJ.HELP_GOVERN_PHONE_CODE
  add constraint PK_HELP_GOVERN_PHONE_CODE primary key (GOVERN_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.HELP_GOVERN_PHONE_CODE to DXSJDBEXTR;
grant select on SXDXSJ.HELP_GOVERN_PHONE_CODE to NUANCE;
grant select, insert, update, delete on SXDXSJ.HELP_GOVERN_PHONE_CODE to SXDXSJAPP;
grant select on SXDXSJ.HELP_GOVERN_PHONE_CODE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.HELP_GOVERN_PHONE_CODE to SXDXSJMOD;

prompt
prompt Creating table LOG_INFORMATION
prompt ==============================
prompt
create table SXDXSJ.LOG_INFORMATION
(
  command_name  VARCHAR2(120),
  command_type  VARCHAR2(120),
  start_time    DATE,
  end_time      DATE,
  add_number    NUMBER(20),
  update_number NUMBER(20),
  delete_number NUMBER(20),
  condition_id  NUMBER,
  creator       VARCHAR2(50),
  create_date   DATE,
  modifier      VARCHAR2(50),
  modify_date   DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.LOG_INFORMATION
  is '记录各种sql及存储过程的执行情况';
comment on column SXDXSJ.LOG_INFORMATION.command_name
  is '操作命令';
comment on column SXDXSJ.LOG_INFORMATION.command_type
  is '操作类型';
comment on column SXDXSJ.LOG_INFORMATION.start_time
  is '开始操作时间';
comment on column SXDXSJ.LOG_INFORMATION.end_time
  is '结束操作时间';
comment on column SXDXSJ.LOG_INFORMATION.add_number
  is '新增记录数';
comment on column SXDXSJ.LOG_INFORMATION.update_number
  is '修改记录数';
comment on column SXDXSJ.LOG_INFORMATION.delete_number
  is '删除记录数';
comment on column SXDXSJ.LOG_INFORMATION.condition_id
  is '条件编号';
comment on column SXDXSJ.LOG_INFORMATION.creator
  is '创建人';
comment on column SXDXSJ.LOG_INFORMATION.create_date
  is '创建日期';
comment on column SXDXSJ.LOG_INFORMATION.modifier
  is '修改人';
comment on column SXDXSJ.LOG_INFORMATION.modify_date
  is '修改日期';
grant select on SXDXSJ.LOG_INFORMATION to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.LOG_INFORMATION to SXDXSJAPP;
grant select on SXDXSJ.LOG_INFORMATION to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.LOG_INFORMATION to SXDXSJMOD;

prompt
prompt Creating table LOG_TRACE_STAT
prompt =============================
prompt
create table SXDXSJ.LOG_TRACE_STAT
(
  proc_name  VARCHAR2(200),
  work_date  NUMBER,
  report_id  NUMBER,
  step_no    VARCHAR2(20),
  elapsed    NUMBER,
  row_num    NUMBER,
  step_desc  VARCHAR2(2000),
  begin_time DATE,
  end_time   DATE,
  sql_code   NUMBER,
  sql_errm   VARCHAR2(2000)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.LOG_TRACE_STAT
  is '存储过程日志表';
grant select on SXDXSJ.LOG_TRACE_STAT to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.LOG_TRACE_STAT to SXDXSJAPP;
grant select on SXDXSJ.LOG_TRACE_STAT to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.LOG_TRACE_STAT to SXDXSJMOD;

prompt
prompt Creating table MSM_PLATFORM_ADMINISTRATION
prompt ==========================================
prompt
create table SXDXSJ.MSM_PLATFORM_ADMINISTRATION
(
  id           INTEGER not null,
  sms_governid VARCHAR2(10),
  sms_name     VARCHAR2(50),
  active       VARCHAR2(10),
  creator      VARCHAR2(50),
  create_date  DATE,
  modifier     VARCHAR2(50),
  modify_date  DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SXDXSJ.MSM_PLATFORM_ADMINISTRATION
  is '短信平台分公司信息';
comment on column SXDXSJ.MSM_PLATFORM_ADMINISTRATION.id
  is '编号';
comment on column SXDXSJ.MSM_PLATFORM_ADMINISTRATION.sms_governid
  is '短信平台分公司机构码';
comment on column SXDXSJ.MSM_PLATFORM_ADMINISTRATION.sms_name
  is '短信平台分公司名称';
comment on column SXDXSJ.MSM_PLATFORM_ADMINISTRATION.active
  is '是否可用';
comment on column SXDXSJ.MSM_PLATFORM_ADMINISTRATION.creator
  is '创建人';
comment on column SXDXSJ.MSM_PLATFORM_ADMINISTRATION.create_date
  is '创建日期';
comment on column SXDXSJ.MSM_PLATFORM_ADMINISTRATION.modifier
  is '修改人';
comment on column SXDXSJ.MSM_PLATFORM_ADMINISTRATION.modify_date
  is '修改日期';
alter table SXDXSJ.MSM_PLATFORM_ADMINISTRATION
  add constraint PK_MSM_PLATFORM_ADMINISTRATION primary key (ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select on SXDXSJ.MSM_PLATFORM_ADMINISTRATION to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.MSM_PLATFORM_ADMINISTRATION to SXDXSJAPP;
grant select on SXDXSJ.MSM_PLATFORM_ADMINISTRATION to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.MSM_PLATFORM_ADMINISTRATION to SXDXSJMOD;

prompt
prompt Creating table NUANCE_BATCH
prompt ===========================
prompt
create table SXDXSJ.NUANCE_BATCH
(
  batch_code           NUMBER not null,
  batch_description    VARCHAR2(200),
  total_count          NUMBER(10),
  clean_status         NUMBER(3),
  begin_id             NUMBER,
  end_id               NUMBER,
  begin_dial           DATE,
  end_dial             DATE,
  error_count          NUMBER(10),
  loss_count           NUMBER(10),
  succ_count           NUMBER(10),
  error_percent        NUMBER(10,2),
  loss_percent         NUMBER(10,2),
  succ_percent         NUMBER(10,2),
  send_clean_tel_count NUMBER(10),
  note                 VARCHAR2(200),
  new_clean_status     NUMBER(3)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.NUANCE_BATCH
  is '固定电话清洗的批次信息，如：初始数量、成功数量、是否完成或回写
其状态（clean_status）的代码及其意义如下：
-3：暂停
-2：取消，
-1：异常，
0：外拨中（初始状态），
1：nuance外拨结束，
2：（亿讯）人工识别完毕，一段时间后（如48小时），开始回写，
3：审核完毕，可以回写
4：回写完成';
comment on column SXDXSJ.NUANCE_BATCH.batch_code
  is '批次编号';
comment on column SXDXSJ.NUANCE_BATCH.batch_description
  is '批次说明';
comment on column SXDXSJ.NUANCE_BATCH.total_count
  is '数量';
comment on column SXDXSJ.NUANCE_BATCH.clean_status
  is '清洗状态';
comment on column SXDXSJ.NUANCE_BATCH.begin_id
  is '开始ID';
comment on column SXDXSJ.NUANCE_BATCH.end_id
  is '结束ID';
comment on column SXDXSJ.NUANCE_BATCH.begin_dial
  is '开始清洗时间';
comment on column SXDXSJ.NUANCE_BATCH.end_dial
  is '结束清洗时间';
comment on column SXDXSJ.NUANCE_BATCH.error_count
  is '异常数';
comment on column SXDXSJ.NUANCE_BATCH.loss_count
  is '漏拨数';
comment on column SXDXSJ.NUANCE_BATCH.succ_count
  is '成功数';
comment on column SXDXSJ.NUANCE_BATCH.error_percent
  is '异常率';
comment on column SXDXSJ.NUANCE_BATCH.loss_percent
  is '漏拨率';
comment on column SXDXSJ.NUANCE_BATCH.succ_percent
  is '成功率';
comment on column SXDXSJ.NUANCE_BATCH.note
  is '备注';
alter table SXDXSJ.NUANCE_BATCH
  add constraint PK_NUANCE_BATCH primary key (BATCH_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.NUANCE_BATCH to DXSJDBEXTR;
grant select on SXDXSJ.NUANCE_BATCH to NUANCE;
grant select, insert, update, delete on SXDXSJ.NUANCE_BATCH to SXDXSJAPP;
grant select on SXDXSJ.NUANCE_BATCH to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.NUANCE_BATCH to SXDXSJMOD;

prompt
prompt Creating table ONLINE_DEAL_POLICY
prompt =================================
prompt
create table SXDXSJ.ONLINE_DEAL_POLICY
(
  policy_no               CHAR(30),
  class_code              CHAR(10),
  class_name              VARCHAR2(508),
  product_code            VARCHAR2(20),
  application_create_time DATE,
  application_no          VARCHAR2(30) not null,
  policy_holder_id        CHAR(18),
  branch_abbreviation     VARCHAR2(10),
  branch_govern_id        VARCHAR2(30),
  payment_status          VARCHAR2(6),
  begin_date              DATE,
  pieces                  NUMBER(20),
  end_date                DATE,
  charge_years            NUMBER(10),
  charge_end_ages         NUMBER(3),
  charge_end_date         DATE,
  policy_status           VARCHAR2(6),
  charge_total_times      NUMBER(3),
  charge_copy             NUMBER(20,2),
  claim_status            VARCHAR2(6),
  charge_total_amount     NUMBER(20,2),
  charge_status           VARCHAR2(6),
  charge_way              VARCHAR2(6),
  month_amount            NUMBER,
  batch_id_deal           NUMBER,
  batch_id_fee            NUMBER,
  partition_col           NUMBER(6) not null,
  policy_partition_col    NUMBER(6)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.ONLINE_DEAL_POLICY
  is '电销线上成交保单信息';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.policy_no
  is '保单号';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.class_code
  is '险种代码';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.class_name
  is '险种名称';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.product_code
  is '产品代码';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.application_create_time
  is '投保单号创建时间';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.application_no
  is '投保单号';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.policy_holder_id
  is '投保人身份证';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.branch_abbreviation
  is '分公司简称';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.branch_govern_id
  is '分公司机构码';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.payment_status
  is '给付状态';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.begin_date
  is '责任起始日期';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.pieces
  is '份数';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.end_date
  is '责任终止日期';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.charge_years
  is '缴费年限';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.charge_end_ages
  is '缴费终止年龄';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.charge_end_date
  is '缴费终止日期';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.policy_status
  is '保单状况';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.charge_total_times
  is '累计缴费次数';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.charge_copy
  is '每份缴费标准';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.claim_status
  is '理赔状态';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.charge_total_amount
  is '累计已缴保费';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.charge_status
  is '缴费状态';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.charge_way
  is '缴费方式';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.month_amount
  is '月缴保费额';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.batch_id_deal
  is '线上成交批次';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.batch_id_fee
  is '付费信息回写批次';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.partition_col
  is '客户分区列';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.policy_partition_col
  is '保单分区列';
alter table SXDXSJ.ONLINE_DEAL_POLICY
  add constraint PK_ONLINE_DEAL_POLICY primary key (APPLICATION_NO)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.ONLINE_DEAL_POLICY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.ONLINE_DEAL_POLICY to SXDXSJAPP;
grant select on SXDXSJ.ONLINE_DEAL_POLICY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.ONLINE_DEAL_POLICY to SXDXSJMOD;

prompt
prompt Creating table OPERATION_CONDITION
prompt ==================================
prompt
create table SXDXSJ.OPERATION_CONDITION
(
  id                         NUMBER not null,
  task_id                    NUMBER,
  log_id                     NUMBER,
  source_type_code           NUMBER(3),
  branch_code                NUMBER(6),
  age_zone_code              NUMBER(3),
  birthdate_month_day_code   NUMBER(3),
  from_last_sale_time_code   NUMBER(3),
  dial_times_code            NUMBER(3),
  clear_status_code          NUMBER(3),
  operation_status_code      NUMBER(3),
  sale_status_code           NUMBER(3),
  orphan_status_code         NUMBER(3),
  bank_status_code           NUMBER(3),
  policy_status_code         NUMBER(3),
  branch_delivery_code       NUMBER(3),
  company_delivery_code      NUMBER(3),
  pay_by_pos_code            NUMBER(3),
  pay_by_bank_code           NUMBER(3),
  has_rectele_code           NUMBER(3),
  has_ftele_code             NUMBER(3),
  has_ctele_code             NUMBER(3),
  has_mobile_code            NUMBER(3),
  month_amount_code          NUMBER(3),
  zone_type_code             NUMBER(3),
  dial_time_length_code      NUMBER(3),
  level_code                 NUMBER(3),
  from_last_revist_time_code NUMBER(3),
  gender_code                NUMBER(3),
  revist_result              NUMBER(3),
  remark                     VARCHAR2(508)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SXDXSJ.OPERATION_CONDITION
  is '记录用户操作任务是所对应的客户过滤条件';
comment on column SXDXSJ.OPERATION_CONDITION.id
  is '编号';
comment on column SXDXSJ.OPERATION_CONDITION.task_id
  is '任务编号';
comment on column SXDXSJ.OPERATION_CONDITION.log_id
  is '日志编号';
comment on column SXDXSJ.OPERATION_CONDITION.source_type_code
  is '信息来源';
comment on column SXDXSJ.OPERATION_CONDITION.branch_code
  is '分公司简码';
comment on column SXDXSJ.OPERATION_CONDITION.age_zone_code
  is '年龄编码';
comment on column SXDXSJ.OPERATION_CONDITION.birthdate_month_day_code
  is '生日月份';
comment on column SXDXSJ.OPERATION_CONDITION.from_last_sale_time_code
  is '最近一次销售据现在时间';
comment on column SXDXSJ.OPERATION_CONDITION.dial_times_code
  is '电销次数';
comment on column SXDXSJ.OPERATION_CONDITION.clear_status_code
  is '清洗状态码';
comment on column SXDXSJ.OPERATION_CONDITION.operation_status_code
  is '保全状态码';
comment on column SXDXSJ.OPERATION_CONDITION.sale_status_code
  is '销售状态码';
comment on column SXDXSJ.OPERATION_CONDITION.orphan_status_code
  is '孤儿单状态码';
comment on column SXDXSJ.OPERATION_CONDITION.bank_status_code
  is '银行状态码';
comment on column SXDXSJ.OPERATION_CONDITION.policy_status_code
  is '保单状态码';
comment on column SXDXSJ.OPERATION_CONDITION.branch_delivery_code
  is '是否可分公司快递';
comment on column SXDXSJ.OPERATION_CONDITION.company_delivery_code
  is '是否可总公司快递';
comment on column SXDXSJ.OPERATION_CONDITION.pay_by_pos_code
  is '是否可pos机付费';
comment on column SXDXSJ.OPERATION_CONDITION.pay_by_bank_code
  is '是否可银行代扣';
comment on column SXDXSJ.OPERATION_CONDITION.has_rectele_code
  is '是否有收费电话';
comment on column SXDXSJ.OPERATION_CONDITION.has_ftele_code
  is '是否有家庭电话';
comment on column SXDXSJ.OPERATION_CONDITION.has_ctele_code
  is '是否有办公电话';
comment on column SXDXSJ.OPERATION_CONDITION.has_mobile_code
  is '是否有手机';
comment on column SXDXSJ.OPERATION_CONDITION.month_amount_code
  is '月缴保费区间';
comment on column SXDXSJ.OPERATION_CONDITION.zone_type_code
  is '区域类型';
comment on column SXDXSJ.OPERATION_CONDITION.dial_time_length_code
  is '通话时长编码';
comment on column SXDXSJ.OPERATION_CONDITION.level_code
  is '客户等级';
comment on column SXDXSJ.OPERATION_CONDITION.from_last_revist_time_code
  is '回访距离现在时间';
comment on column SXDXSJ.OPERATION_CONDITION.gender_code
  is '性别';
comment on column SXDXSJ.OPERATION_CONDITION.revist_result
  is '回访结果';
comment on column SXDXSJ.OPERATION_CONDITION.remark
  is '备注';
alter table SXDXSJ.OPERATION_CONDITION
  add constraint PK_OPERATION_CONDITION primary key (ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select on SXDXSJ.OPERATION_CONDITION to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.OPERATION_CONDITION to SXDXSJAPP;
grant select on SXDXSJ.OPERATION_CONDITION to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.OPERATION_CONDITION to SXDXSJMOD;

prompt
prompt Creating table ORGANIZATION_INFORMATION
prompt =======================================
prompt
create table SXDXSJ.ORGANIZATION_INFORMATION
(
  organization_id  VARCHAR2(20) not null,
  branch           VARCHAR2(100),
  org_third_level  VARCHAR2(100),
  org_fourth_level VARCHAR2(100),
  org_five_level   VARCHAR2(100),
  zone_type        VARCHAR2(10),
  active           VARCHAR2(10),
  creator          VARCHAR2(50),
  createtime       DATE,
  modifier         VARCHAR2(50),
  modify_date      DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SXDXSJ.ORGANIZATION_INFORMATION
  is '机构码与太保寿险2,3,4,5及机构的关系信息';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.organization_id
  is '机构代码';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.branch
  is '分公司';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.org_third_level
  is '中支';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.org_fourth_level
  is '四级机构';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.org_five_level
  is '五级机构';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.zone_type
  is '区域类型';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.active
  is '是否可用';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.creator
  is '创建人';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.createtime
  is '创建日期';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.modifier
  is '修改人';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.modify_date
  is '修改日期';
alter table SXDXSJ.ORGANIZATION_INFORMATION
  add constraint PK_ORGANIZATION_INFORMATION primary key (ORGANIZATION_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select on SXDXSJ.ORGANIZATION_INFORMATION to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.ORGANIZATION_INFORMATION to SXDXSJAPP;
grant select on SXDXSJ.ORGANIZATION_INFORMATION to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.ORGANIZATION_INFORMATION to SXDXSJMOD;

prompt
prompt Creating table ORGID_REF
prompt ========================
prompt
create table SXDXSJ.ORGID_REF
(
  org_id          NUMBER(10),
  org_id_lv       NUMBER(2),
  p_org_id_lv0    NUMBER(10),
  p_org_id_lv1    NUMBER(10),
  p_org_id_lv2    NUMBER(10),
  p_org_id_lv3    NUMBER(10),
  p_org_id_lv4    NUMBER(10),
  p_org_id_lv5    NUMBER(10),
  prjt_mgr_id     VARCHAR2(20),
  tem_lead_id     VARCHAR2(20),
  population_tsmp DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SXDXSJ.ORGID_REF.org_id
  is '机构ID';
comment on column SXDXSJ.ORGID_REF.org_id_lv
  is '机构层级';
comment on column SXDXSJ.ORGID_REF.p_org_id_lv0
  is '总公司';
comment on column SXDXSJ.ORGID_REF.p_org_id_lv1
  is '电销中心';
comment on column SXDXSJ.ORGID_REF.p_org_id_lv2
  is '电销分中心';
comment on column SXDXSJ.ORGID_REF.p_org_id_lv3
  is '项目';
comment on column SXDXSJ.ORGID_REF.p_org_id_lv4
  is '团队';
comment on column SXDXSJ.ORGID_REF.p_org_id_lv5
  is '扩展字段';
comment on column SXDXSJ.ORGID_REF.prjt_mgr_id
  is '项目经理';
comment on column SXDXSJ.ORGID_REF.tem_lead_id
  is '团队长';
comment on column SXDXSJ.ORGID_REF.population_tsmp
  is '发布时间戳';

prompt
prompt Creating table PATERN_FIELDS
prompt ============================
prompt
create table SXDXSJ.PATERN_FIELDS
(
  id                  NUMBER not null,
  template_id         NUMBER,
  file_column_cn_name VARCHAR2(120),
  db_column_cn_name   VARCHAR2(120),
  file_column_en_name VARCHAR2(120),
  db_column_en_name   VARCHAR2(120),
  is_show_data        NUMBER(1),
  active              CHAR(1),
  column_order        NUMBER
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SXDXSJ.PATERN_FIELDS
  is '存放模板的字段匹配项详细信息';
comment on column SXDXSJ.PATERN_FIELDS.id
  is '编号';
comment on column SXDXSJ.PATERN_FIELDS.template_id
  is '模板编号';
comment on column SXDXSJ.PATERN_FIELDS.file_column_cn_name
  is '文件字段中文名';
comment on column SXDXSJ.PATERN_FIELDS.db_column_cn_name
  is '数据库字段中文名';
comment on column SXDXSJ.PATERN_FIELDS.file_column_en_name
  is '文件字段英文名';
comment on column SXDXSJ.PATERN_FIELDS.db_column_en_name
  is '数据库字段英文名';
comment on column SXDXSJ.PATERN_FIELDS.is_show_data
  is '是否显示数据';
comment on column SXDXSJ.PATERN_FIELDS.active
  is '是否可用';
comment on column SXDXSJ.PATERN_FIELDS.column_order
  is '字段顺序';
alter table SXDXSJ.PATERN_FIELDS
  add constraint PK_PATERN_FIELDS primary key (ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select on SXDXSJ.PATERN_FIELDS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.PATERN_FIELDS to SXDXSJAPP;
grant select on SXDXSJ.PATERN_FIELDS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.PATERN_FIELDS to SXDXSJMOD;

prompt
prompt Creating table PHONE_RULE
prompt =========================
prompt
create table SXDXSJ.PHONE_RULE
(
  code                VARCHAR2(20),
  branch_abbreviation VARCHAR2(50),
  old_code            VARCHAR2(20),
  now_code            VARCHAR2(20),
  old_length          NUMBER(3),
  now_length          NUMBER(3),
  first_number_list   VARCHAR2(50),
  add_number          VARCHAR2(10),
  change_code         NUMBER(1),
  change_phone        NUMBER(1),
  province            VARCHAR2(120),
  city                VARCHAR2(120),
  govername           VARCHAR2(120),
  active              CHAR(1),
  creator             VARCHAR2(50),
  create_date         DATE,
  modifier            VARCHAR2(50),
  modify_date         DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.PHONE_RULE
  is '全国电话号码升位改好规则';
comment on column SXDXSJ.PHONE_RULE.code
  is '编码';
comment on column SXDXSJ.PHONE_RULE.branch_abbreviation
  is '分公司简称';
comment on column SXDXSJ.PHONE_RULE.old_code
  is '原区号';
comment on column SXDXSJ.PHONE_RULE.now_code
  is '现区号';
comment on column SXDXSJ.PHONE_RULE.old_length
  is '原电话位数';
comment on column SXDXSJ.PHONE_RULE.now_length
  is '现电话位数';
comment on column SXDXSJ.PHONE_RULE.first_number_list
  is '首位号列表';
comment on column SXDXSJ.PHONE_RULE.add_number
  is '增加号码';
comment on column SXDXSJ.PHONE_RULE.change_code
  is '区号是否变更';
comment on column SXDXSJ.PHONE_RULE.change_phone
  is '号码是否变更';
comment on column SXDXSJ.PHONE_RULE.province
  is '省';
comment on column SXDXSJ.PHONE_RULE.city
  is '市';
comment on column SXDXSJ.PHONE_RULE.govername
  is '地名';
comment on column SXDXSJ.PHONE_RULE.active
  is '是否可用';
comment on column SXDXSJ.PHONE_RULE.creator
  is '创建人';
comment on column SXDXSJ.PHONE_RULE.create_date
  is '创建日期';
comment on column SXDXSJ.PHONE_RULE.modifier
  is '修改人';
comment on column SXDXSJ.PHONE_RULE.modify_date
  is '修改日期';
grant select on SXDXSJ.PHONE_RULE to DXSJDBEXTR;
grant select on SXDXSJ.PHONE_RULE to NUANCE;
grant select, insert, update, delete on SXDXSJ.PHONE_RULE to SXDXSJAPP;
grant select on SXDXSJ.PHONE_RULE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.PHONE_RULE to SXDXSJMOD;

prompt
prompt Creating table PHONE_TYPE_INFO
prompt ==============================
prompt
create table SXDXSJ.PHONE_TYPE_INFO
(
  phone_type_code NUMBER(3) not null,
  dial_statusname VARCHAR2(30),
  active          CHAR(1),
  creator         VARCHAR2(50),
  createtime      DATE,
  modifier        VARCHAR2(50),
  modify_date     DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SXDXSJ.PHONE_TYPE_INFO
  is '电话类型信息
电话状态：
1 收费电话
2 家庭电话
3 办公电话
4 手机
';
comment on column SXDXSJ.PHONE_TYPE_INFO.phone_type_code
  is '电话类型代码';
comment on column SXDXSJ.PHONE_TYPE_INFO.dial_statusname
  is '电话类型名称';
comment on column SXDXSJ.PHONE_TYPE_INFO.active
  is '是否可用';
comment on column SXDXSJ.PHONE_TYPE_INFO.creator
  is '创建人';
comment on column SXDXSJ.PHONE_TYPE_INFO.createtime
  is '创建日期';
comment on column SXDXSJ.PHONE_TYPE_INFO.modifier
  is '修改人';
comment on column SXDXSJ.PHONE_TYPE_INFO.modify_date
  is '修改日期';
alter table SXDXSJ.PHONE_TYPE_INFO
  add constraint PK_PHONE_TYPE_INFO primary key (PHONE_TYPE_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select on SXDXSJ.PHONE_TYPE_INFO to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.PHONE_TYPE_INFO to SXDXSJAPP;
grant select on SXDXSJ.PHONE_TYPE_INFO to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.PHONE_TYPE_INFO to SXDXSJMOD;

prompt
prompt Creating table PLACE_INFO
prompt =========================
prompt
create table SXDXSJ.PLACE_INFO
(
  province    VARCHAR2(120) not null,
  city        VARCHAR2(120) not null,
  phone_code  VARCHAR2(20),
  active      NUMBER(1),
  creator     VARCHAR2(50),
  createtime  DATE,
  modifier    VARCHAR2(50),
  modify_date DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.PLACE_INFO
  is '全国所有省市信息表';
comment on column SXDXSJ.PLACE_INFO.province
  is '省';
comment on column SXDXSJ.PLACE_INFO.city
  is '城市';
comment on column SXDXSJ.PLACE_INFO.phone_code
  is '电话区号';
comment on column SXDXSJ.PLACE_INFO.active
  is '是否可用';
comment on column SXDXSJ.PLACE_INFO.creator
  is '创建人';
comment on column SXDXSJ.PLACE_INFO.createtime
  is '创建日期';
comment on column SXDXSJ.PLACE_INFO.modifier
  is '修改人';
comment on column SXDXSJ.PLACE_INFO.modify_date
  is '修改日期';
alter table SXDXSJ.PLACE_INFO
  add constraint PK_PLACE_INFO primary key (PROVINCE, CITY)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.PLACE_INFO to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.PLACE_INFO to SXDXSJAPP;
grant select on SXDXSJ.PLACE_INFO to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.PLACE_INFO to SXDXSJMOD;

prompt
prompt Creating table POLICY
prompt =====================
prompt
create table SXDXSJ.POLICY
(
  policy_no                 CHAR(30) not null,
  class_code                CHAR(10) not null,
  class_name                VARCHAR2(508),
  policy_status             VARCHAR2(6),
  claim_status              VARCHAR2(6),
  payment_status            VARCHAR2(6),
  pieces                    NUMBER(20,2),
  begin_date                DATE,
  end_date                  DATE,
  charge_copy               NUMBER(20,2),
  charge_way                VARCHAR2(6),
  charge_status             VARCHAR2(6),
  charge_end_date           DATE,
  charge_years              NUMBER(10),
  charge_end_ages           NUMBER(3),
  charge_total_times        NUMBER(3),
  charge_total_amount       NUMBER(20,2),
  relation                  VARCHAR2(20),
  recognizee_age            NUMBER(3),
  policy_holder_id          CHAR(18),
  policy_holder_copy_id     CHAR(40),
  recognizee_holder_id      CHAR(18),
  recognizee_holder_copy_id CHAR(40),
  employee_no               VARCHAR2(20),
  account_type              NUMBER(3),
  account_no                CHAR(40),
  bank_code                 CHAR(20),
  bank_name                 VARCHAR2(120),
  market_channel            NUMBER(3),
  govern_id                 CHAR(30),
  govern_name               VARCHAR2(120),
  tel_code                  CHAR(10),
  branch_abbreviation       VARCHAR2(10),
  branch_name               VARCHAR2(120),
  reczip                    VARCHAR2(30),
  charge_phone              VARCHAR2(30),
  mobile_phone              VARCHAR2(30),
  other_phone               VARCHAR2(30),
  fax                       VARCHAR2(30),
  email                     VARCHAR2(40),
  education_level           VARCHAR2(40),
  income                    NUMBER(12,2),
  update_time               DATE,
  recieve_time              DATE,
  bank_status               VARCHAR2(3),
  orphan_status             VARCHAR2(3),
  charge_info               NUMBER(10),
  partition_col             NUMBER(6) not null,
  policy_partition_col      NUMBER(6) not null
)
partition by list (PARTITION_COL)
(
  partition PART01 values (1)
    tablespace SXDXSJ_DATA_P21
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART02 values (2)
    tablespace SXDXSJ_DATA_P22
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART03 values (3)
    tablespace SXDXSJ_DATA_P23
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART04 values (4)
    tablespace SXDXSJ_DATA_P24
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART05 values (5)
    tablespace SXDXSJ_DATA_P25
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART06 values (6)
    tablespace SXDXSJ_DATA_P26
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART07 values (7)
    tablespace SXDXSJ_DATA_P27
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART08 values (8)
    tablespace SXDXSJ_DATA_P28
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART09 values (9)
    tablespace SXDXSJ_DATA_P29
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART00 values (default)
    tablespace SXDXSJ_DATA_P30
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    )
);
comment on table SXDXSJ.POLICY
  is '存放进过处理后的孤儿单和银保原始保单信息，不包括电销系统线上成交的保单信息
';
comment on column SXDXSJ.POLICY.policy_no
  is '保单号码';
comment on column SXDXSJ.POLICY.class_code
  is '险种代码';
comment on column SXDXSJ.POLICY.class_name
  is '险种名称';
comment on column SXDXSJ.POLICY.policy_status
  is '保单状况';
comment on column SXDXSJ.POLICY.claim_status
  is '理赔状态';
comment on column SXDXSJ.POLICY.payment_status
  is '给付状态';
comment on column SXDXSJ.POLICY.pieces
  is '份数';
comment on column SXDXSJ.POLICY.begin_date
  is '责任起始日期';
comment on column SXDXSJ.POLICY.end_date
  is '责任终止日期';
comment on column SXDXSJ.POLICY.charge_copy
  is '每份缴费标准';
comment on column SXDXSJ.POLICY.charge_way
  is '缴费方式';
comment on column SXDXSJ.POLICY.charge_status
  is '缴费状态';
comment on column SXDXSJ.POLICY.charge_end_date
  is '缴费终止日期';
comment on column SXDXSJ.POLICY.charge_years
  is '缴费年限';
comment on column SXDXSJ.POLICY.charge_end_ages
  is '缴费终止年龄';
comment on column SXDXSJ.POLICY.charge_total_times
  is '累计缴费次数';
comment on column SXDXSJ.POLICY.charge_total_amount
  is '累计已缴保费';
comment on column SXDXSJ.POLICY.relation
  is '投保人和被保人的关系';
comment on column SXDXSJ.POLICY.recognizee_age
  is '投保时被保险人年龄';
comment on column SXDXSJ.POLICY.policy_holder_id
  is '投保人身份证号码';
comment on column SXDXSJ.POLICY.policy_holder_copy_id
  is '投保人身份证号码副本';
comment on column SXDXSJ.POLICY.recognizee_holder_id
  is '被保人身份证号码';
comment on column SXDXSJ.POLICY.recognizee_holder_copy_id
  is '被保人身份证号码副本';
comment on column SXDXSJ.POLICY.employee_no
  is '业务员工号';
comment on column SXDXSJ.POLICY.account_type
  is '帐户类型';
comment on column SXDXSJ.POLICY.account_no
  is '账户号';
comment on column SXDXSJ.POLICY.bank_code
  is '开户银行代码';
comment on column SXDXSJ.POLICY.bank_name
  is '开户银行名称';
comment on column SXDXSJ.POLICY.market_channel
  is '渠道';
comment on column SXDXSJ.POLICY.govern_id
  is '行政机构代码';
comment on column SXDXSJ.POLICY.govern_name
  is '行政机构名称';
comment on column SXDXSJ.POLICY.tel_code
  is '电话区号';
comment on column SXDXSJ.POLICY.branch_abbreviation
  is '分公司简称';
comment on column SXDXSJ.POLICY.branch_name
  is '分公司全称';
comment on column SXDXSJ.POLICY.reczip
  is '区域编码';
comment on column SXDXSJ.POLICY.charge_phone
  is '收费电话';
comment on column SXDXSJ.POLICY.mobile_phone
  is '投保人移动电话号码';
comment on column SXDXSJ.POLICY.other_phone
  is '投保人其他电话号码';
comment on column SXDXSJ.POLICY.fax
  is '投保人传真';
comment on column SXDXSJ.POLICY.email
  is '投保人电子邮件';
comment on column SXDXSJ.POLICY.education_level
  is '投保人教育程度/学历';
comment on column SXDXSJ.POLICY.income
  is '投保人收入';
comment on column SXDXSJ.POLICY.update_time
  is '最后更新日期';
comment on column SXDXSJ.POLICY.recieve_time
  is '最近给付领取时间';
comment on column SXDXSJ.POLICY.bank_status
  is '银行状态';
comment on column SXDXSJ.POLICY.orphan_status
  is '孤儿单状态';
comment on column SXDXSJ.POLICY.charge_info
  is '付费信息';
comment on column SXDXSJ.POLICY.partition_col
  is '客户分区列';
comment on column SXDXSJ.POLICY.policy_partition_col
  is '保单分区列';
create index SXDXSJ.INDEX_P_CUS on SXDXSJ.POLICY (POLICY_HOLDER_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.INDEX_P_PART on SXDXSJ.POLICY (PARTITION_COL)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.POLICY
  add constraint PK_POLICY primary key (POLICY_NO, CLASS_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.POLICY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.POLICY to SXDXSJAPP;
grant select on SXDXSJ.POLICY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.POLICY to SXDXSJMOD;

prompt
prompt Creating table POLICY_SEND
prompt ==========================
prompt
create table SXDXSJ.POLICY_SEND
(
  sno             NUMBER(20),
  typeid          NUMBER(7) not null,
  policyno        VARCHAR2(20) not null,
  empno           VARCHAR2(20) not null,
  senddate        DATE not null,
  canceldate      DATE,
  process_date    DATE,
  sendoperno      VARCHAR2(20) not null,
  canceloperno    VARCHAR2(20),
  population_tsmp DATE not null
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_POLICY_SEND_POLICYNO on SXDXSJ.POLICY_SEND (POLICYNO)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_POLICY_SEND_SENDDATE on SXDXSJ.POLICY_SEND (SENDDATE)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.POLICY_SEND to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.POLICY_SEND to SXDXETL;
grant select, insert, update, delete on SXDXSJ.POLICY_SEND to SXDXSJAPP;
grant select on SXDXSJ.POLICY_SEND to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.POLICY_SEND to SXDXSJMOD;

prompt
prompt Creating table PREREC
prompt =====================
prompt
create table SXDXSJ.PREREC
(
  sno                    NUMBER(20),
  typeid                 NUMBER(7) not null,
  con_id                 NUMBER(20),
  policyno               VARCHAR2(20) not null,
  classcode              CHAR(8) not null,
  check_id               NUMBER(20),
  checkno                VARCHAR2(40),
  amount                 NUMBER(20,4) not null,
  stdrate                NUMBER(20,6) not null,
  unstdrate              NUMBER(20,6) not null,
  currency               CHAR(3) not null,
  yearnum                NUMBER(20) not null,
  paycode                CHAR(2) not null,
  setcode                CHAR(1) not null,
  movewhy                VARCHAR2(120),
  pcode                  CHAR(1) not null,
  paydate                DATE not null,
  oper_id                NUMBER(20),
  operno                 VARCHAR2(20) not null,
  empno_id               NUMBER(20),
  empno                  VARCHAR2(20) not null,
  csr_id                 NUMBER(20),
  csrno                  VARCHAR2(20),
  deptno                 VARCHAR2(20) not null,
  years                  NUMBER(20) not null,
  cover1                 DATE not null,
  cover2                 DATE not null,
  seckey                 VARCHAR2(20),
  source_payin_actvty_id VARCHAR2(35) not null,
  inner_settle_ind       CHAR(1),
  sale_mode              CHAR(4),
  the_thrdprt            CHAR(4),
  job                    CHAR(8),
  busi_branch            CHAR(14),
  fin_proc_type          NUMBER(7),
  insrnc_rate            NUMBER(7,4),
  third_order_no         VARCHAR2(20),
  yearno                 NUMBER(7),
  population_tsmp        DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.PREREC
  is '财务实收表';
create index SXDXSJ.IDX_PREREC_01 on SXDXSJ.PREREC (PAYCODE)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_PREREC_02 on SXDXSJ.PREREC (PAYDATE)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_PREREC_03 on SXDXSJ.PREREC (PCODE)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_PREREC_04 on SXDXSJ.PREREC (POLICYNO, CLASSCODE)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.PREREC to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.PREREC to SXDXETL;
grant select, insert, update, delete on SXDXSJ.PREREC to SXDXSJAPP;
grant select on SXDXSJ.PREREC to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.PREREC to SXDXSJMOD;

prompt
prompt Creating table P_CUSTOMER_PHONE
prompt ===============================
prompt
create table SXDXSJ.P_CUSTOMER_PHONE
(
  customer_id   CHAR(18),
  phone         VARCHAR2(30),
  phone_type    NUMBER(3),
  tel_code      VARCHAR2(10),
  partition_col NUMBER(6)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 10M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.P_CUSTOMER_PHONE
  is '预处理过程中，新插入电话的副本';
comment on column SXDXSJ.P_CUSTOMER_PHONE.customer_id
  is '客户身份证号码';
comment on column SXDXSJ.P_CUSTOMER_PHONE.phone
  is '电话号码';
comment on column SXDXSJ.P_CUSTOMER_PHONE.phone_type
  is '电话类型';
comment on column SXDXSJ.P_CUSTOMER_PHONE.tel_code
  is '电话区号';
comment on column SXDXSJ.P_CUSTOMER_PHONE.partition_col
  is '客户分区列';
create index SXDXSJ.INDEX_TCT_PART on SXDXSJ.P_CUSTOMER_PHONE (PARTITION_COL)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 10M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.P_CUSTOMER_PHONE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.P_CUSTOMER_PHONE to SXDXSJAPP;
grant select on SXDXSJ.P_CUSTOMER_PHONE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.P_CUSTOMER_PHONE to SXDXSJMOD;

prompt
prompt Creating table P_CUSTOMER_PHONE_PARTS
prompt =====================================
prompt
create table SXDXSJ.P_CUSTOMER_PHONE_PARTS
(
  customer_id   CHAR(18),
  phone         VARCHAR2(30),
  phone_type    NUMBER(3),
  tel_code      VARCHAR2(10),
  partition_col NUMBER(6)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SXDXSJ.P_CUSTOMER_PHONE_PARTS
  is '预处理过程中，存放各个分区处理后的电话号码';
comment on column SXDXSJ.P_CUSTOMER_PHONE_PARTS.customer_id
  is '客户身份证号码';
comment on column SXDXSJ.P_CUSTOMER_PHONE_PARTS.phone
  is '电话号码';
comment on column SXDXSJ.P_CUSTOMER_PHONE_PARTS.phone_type
  is '电话类型';
comment on column SXDXSJ.P_CUSTOMER_PHONE_PARTS.tel_code
  is '电话区号';
comment on column SXDXSJ.P_CUSTOMER_PHONE_PARTS.partition_col
  is '客户分区列';
create index SXDXSJ.INDEX_TCP_PART on SXDXSJ.P_CUSTOMER_PHONE_PARTS (PARTITION_COL)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select on SXDXSJ.P_CUSTOMER_PHONE_PARTS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.P_CUSTOMER_PHONE_PARTS to SXDXSJAPP;
grant select on SXDXSJ.P_CUSTOMER_PHONE_PARTS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.P_CUSTOMER_PHONE_PARTS to SXDXSJMOD;

prompt
prompt Creating table P_CUSTOMER_UPDATE
prompt ================================
prompt
create table SXDXSJ.P_CUSTOMER_UPDATE
(
  customer_id                CHAR(18) not null,
  copy_id                    CHAR(40),
  customer_name              VARCHAR2(120),
  birthday                   DATE,
  age                        NUMBER(3),
  gender_code                NUMBER(3),
  marital_status             VARCHAR2(10),
  death_critical_illness     VARCHAR2(6),
  fax                        VARCHAR2(30),
  family_zip_code            VARCHAR2(10),
  company_zip_code           VARCHAR2(10),
  family_address             VARCHAR2(508),
  company_address            VARCHAR2(508),
  company                    VARCHAR2(508),
  contact_address            VARCHAR2(508),
  job_name                   VARCHAR2(40),
  education_level            VARCHAR2(40),
  income                     NUMBER(12,2),
  email                      VARCHAR2(40),
  month_amount               NUMBER(15,2),
  zone_code                  VARCHAR2(20),
  update_time                VARCHAR2(20),
  govern_id                  VARCHAR2(30),
  latest_sale_date           DATE,
  revist_time                DATE,
  revist_result              NUMBER(3),
  source_type_code           NUMBER(3),
  age_zone_code              NUMBER(3),
  birthdate_month_day_code   NUMBER(3),
  from_last_sale_time_code   NUMBER(3),
  dial_times_code            NUMBER(3),
  clear_status_code          NUMBER(3),
  operation_status_code      NUMBER(3),
  sale_status_code           NUMBER(3),
  orphan_status_code         NUMBER(3),
  bank_status_code           NUMBER(3),
  policy_status_code         NUMBER(3),
  branch_delivery_code       NUMBER(3),
  company_delivery_code      NUMBER(3),
  pay_by_pos_code            NUMBER(3),
  pay_by_bank_code           NUMBER(3),
  has_rectele_code           NUMBER(3),
  has_ftele_code             NUMBER(3),
  has_ctele_code             NUMBER(3),
  has_mobile_code            NUMBER(3),
  month_amount_code          NUMBER(3),
  zone_type_code             NUMBER(3),
  dial_time_length_code      NUMBER(3),
  level_code                 NUMBER(3),
  city                       VARCHAR2(120),
  province                   VARCHAR2(120),
  from_last_revist_time_code NUMBER(3),
  branch_code                NUMBER(6),
  note                       VARCHAR2(2000),
  any_date                   DATE,
  other_info_1               VARCHAR2(100),
  other_info_2               VARCHAR2(100),
  other_info_3               VARCHAR2(100),
  other_info_5               VARCHAR2(100),
  other_info_4               VARCHAR2(100),
  batch_id                   NUMBER(20),
  task_id                    NUMBER(20),
  tel_code                   VARCHAR2(20),
  purchase_product_list      VARCHAR2(20),
  d_donation_code            NUMBER(3),
  partition_col              NUMBER(6)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SXDXSJ.P_CUSTOMER_UPDATE
  is '预处理中，存放待更新客户的最新信息';
create index SXDXSJ.INDEX_CU_PART on SXDXSJ.P_CUSTOMER_UPDATE (PARTITION_COL)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
alter table SXDXSJ.P_CUSTOMER_UPDATE
  add constraint PK_P_CUSTOMER_UPDATE primary key (CUSTOMER_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select on SXDXSJ.P_CUSTOMER_UPDATE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.P_CUSTOMER_UPDATE to SXDXSJAPP;
grant select on SXDXSJ.P_CUSTOMER_UPDATE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.P_CUSTOMER_UPDATE to SXDXSJMOD;

prompt
prompt Creating table P_CUSTOMER_UPDATE_PARTS
prompt ======================================
prompt
create table SXDXSJ.P_CUSTOMER_UPDATE_PARTS
(
  partition_col   NUMBER(6) not null,
  row_id          CHAR(18),
  customer_row_id CHAR(18)
)
partition by list (PARTITION_COL)
(
  partition PART01 values (1)
    tablespace SXDXSJ_DATA_P61
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART02 values (2)
    tablespace SXDXSJ_DATA_P62
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART03 values (3)
    tablespace SXDXSJ_DATA_P63
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART04 values (4)
    tablespace SXDXSJ_DATA_P64
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART05 values (5)
    tablespace SXDXSJ_DATA_P65
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART06 values (6)
    tablespace SXDXSJ_DATA_P66
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART07 values (7)
    tablespace SXDXSJ_DATA_P67
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART08 values (8)
    tablespace SXDXSJ_DATA_P68
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART09 values (9)
    tablespace SXDXSJ_DATA_P69
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART00 values (default)
    tablespace SXDXSJ_DATA_P70
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    )
);
comment on table SXDXSJ.P_CUSTOMER_UPDATE_PARTS
  is '预处理时，辅助客户（投保人）的更新和插入';
comment on column SXDXSJ.P_CUSTOMER_UPDATE_PARTS.partition_col
  is '投保人分区码';
comment on column SXDXSJ.P_CUSTOMER_UPDATE_PARTS.row_id
  is '临时客户行号';
comment on column SXDXSJ.P_CUSTOMER_UPDATE_PARTS.customer_row_id
  is '库中客户行号';
grant select on SXDXSJ.P_CUSTOMER_UPDATE_PARTS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.P_CUSTOMER_UPDATE_PARTS to SXDXSJAPP;
grant select on SXDXSJ.P_CUSTOMER_UPDATE_PARTS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.P_CUSTOMER_UPDATE_PARTS to SXDXSJMOD;

prompt
prompt Creating table P_CUSTOMER_UPDATE_PARTS2
prompt =======================================
prompt
create table SXDXSJ.P_CUSTOMER_UPDATE_PARTS2
(
  partition_col   NUMBER,
  row_id          CHAR(18),
  customer_row_id CHAR(18)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.P_CUSTOMER_UPDATE_PARTS2 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.P_CUSTOMER_UPDATE_PARTS2 to SXDXSJAPP;
grant select on SXDXSJ.P_CUSTOMER_UPDATE_PARTS2 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.P_CUSTOMER_UPDATE_PARTS2 to SXDXSJMOD;

prompt
prompt Creating table P_POLICY_UPDATE
prompt ==============================
prompt
create table SXDXSJ.P_POLICY_UPDATE
(
  policy_no                 CHAR(30) not null,
  class_code                CHAR(10) not null,
  class_name                VARCHAR2(508),
  policy_status             VARCHAR2(6),
  claim_status              VARCHAR2(6),
  payment_status            VARCHAR2(6),
  pieces                    NUMBER(20,2),
  begin_date                DATE,
  end_date                  DATE,
  charge_copy               NUMBER(20,2),
  charge_way                VARCHAR2(6),
  charge_status             VARCHAR2(6),
  charge_end_date           DATE,
  charge_years              NUMBER(10),
  charge_end_ages           NUMBER(3),
  charge_total_times        NUMBER(3),
  charge_total_amount       NUMBER(20,2),
  relation                  VARCHAR2(20),
  recognizee_age            NUMBER(3),
  policy_holder_id          CHAR(18),
  policy_holder_copy_id     CHAR(40),
  recognizee_holder_id      CHAR(18),
  recognizee_holder_copy_id CHAR(40),
  employee_no               VARCHAR2(20),
  account_type              NUMBER(3),
  account_no                CHAR(40),
  bank_code                 CHAR(20),
  bank_name                 VARCHAR2(120),
  market_channel            NUMBER(3),
  govern_id                 CHAR(30),
  govern_name               VARCHAR2(120),
  tel_code                  CHAR(10),
  branch_abbreviation       VARCHAR2(10),
  branch_name               VARCHAR2(120),
  reczip                    VARCHAR2(30),
  charge_phone              VARCHAR2(30),
  mobile_phone              VARCHAR2(30),
  other_phone               VARCHAR2(30),
  fax                       VARCHAR2(30),
  email                     VARCHAR2(40),
  education_level           VARCHAR2(40),
  income                    NUMBER(12,2),
  update_time               DATE,
  recieve_time              DATE,
  bank_status               VARCHAR2(3),
  orphan_status             VARCHAR2(3),
  charge_info               NUMBER(10),
  partition_col             NUMBER(6),
  policy_partition_col      NUMBER(6)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SXDXSJ.P_POLICY_UPDATE
  is '预处理时，保单处理辅助表
';
create index SXDXSJ.INDEX_TPH_PART on SXDXSJ.P_POLICY_UPDATE (PARTITION_COL)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
alter table SXDXSJ.P_POLICY_UPDATE
  add constraint PK_P_POLICY_UPDATE primary key (POLICY_NO, CLASS_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select on SXDXSJ.P_POLICY_UPDATE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.P_POLICY_UPDATE to SXDXSJAPP;
grant select on SXDXSJ.P_POLICY_UPDATE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.P_POLICY_UPDATE to SXDXSJMOD;

prompt
prompt Creating table P_POLICY_UPDATE_PARTS
prompt ====================================
prompt
create table SXDXSJ.P_POLICY_UPDATE_PARTS
(
  partition_col NUMBER(6) not null,
  row_id        CHAR(18),
  policy_row_id CHAR(18)
)
partition by list (PARTITION_COL)
(
  partition PART01 values (1)
    tablespace SXDXSJ_DATA_P61
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART02 values (2)
    tablespace SXDXSJ_DATA_P62
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART03 values (3)
    tablespace SXDXSJ_DATA_P63
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART04 values (4)
    tablespace SXDXSJ_DATA_P64
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART05 values (5)
    tablespace SXDXSJ_DATA_P65
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART06 values (6)
    tablespace SXDXSJ_DATA_P66
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART07 values (7)
    tablespace SXDXSJ_DATA_P67
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART08 values (8)
    tablespace SXDXSJ_DATA_P68
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART09 values (9)
    tablespace SXDXSJ_DATA_P68
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART00 values (default)
    tablespace SXDXSJ_DATA_P60
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    )
);
comment on table SXDXSJ.P_POLICY_UPDATE_PARTS
  is '预处理过程中，用于辅助保单插入和更新';
comment on column SXDXSJ.P_POLICY_UPDATE_PARTS.partition_col
  is '投保人分区码';
comment on column SXDXSJ.P_POLICY_UPDATE_PARTS.row_id
  is '临时保单行号';
comment on column SXDXSJ.P_POLICY_UPDATE_PARTS.policy_row_id
  is '库中保单行号';
grant select on SXDXSJ.P_POLICY_UPDATE_PARTS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.P_POLICY_UPDATE_PARTS to SXDXSJAPP;
grant select on SXDXSJ.P_POLICY_UPDATE_PARTS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.P_POLICY_UPDATE_PARTS to SXDXSJMOD;

prompt
prompt Creating table RISKCON
prompt ======================
prompt
create table SXDXSJ.RISKCON
(
  sno               NUMBER(20),
  typeid            NUMBER(7) not null,
  aperson_id        NUMBER(20),
  apid              VARCHAR2(40) not null,
  aidtype           CHAR(2) not null,
  riskcon_id        NUMBER(20),
  gcon_id           NUMBER(20),
  gpolicyno         VARCHAR2(20),
  deskpay           CHAR(1) not null,
  saleattr          CHAR(2) not null,
  renewid           CHAR(1) not null,
  renewdate         DATE,
  begdate           DATE not null,
  stopdate          DATE not null,
  polist            CHAR(1) not null,
  reason            VARCHAR2(200),
  policyno          VARCHAR2(20) not null,
  appno             VARCHAR2(20) not null,
  currency          CHAR(3) not null,
  pieces            NUMBER(20,6) not null,
  appf              CHAR(1) not null,
  opdate            DATE not null,
  tmount            NUMBER(16,2) not null,
  oper_id           NUMBER(20),
  operno            VARCHAR2(20) not null,
  empno_id          NUMBER(20),
  empno             VARCHAR2(20) not null,
  csr_id            NUMBER(20),
  csrno             VARCHAR2(20),
  classcode         CHAR(8) not null,
  appdate           DATE not null,
  comnum            NUMBER(20),
  person_id         NUMBER(20),
  idtype            CHAR(2) not null,
  pid               VARCHAR2(40) not null,
  job               CHAR(8) not null,
  sharetype         CHAR(2),
  specagr           VARCHAR2(2048),
  discount          NUMBER(20,6) not null,
  iscard            CHAR(1),
  npaylen           NUMBER(20,6) not null,
  stdrate           NUMBER(10,2) not null,
  unstdrate         NUMBER(10,2) not null,
  dcdm              CHAR(2),
  prelname          CHAR(3),
  bankflag          CHAR(2),
  payseq            VARCHAR2(2048),
  benparam          NUMBER(20),
  sale_prod_code    VARCHAR2(8),
  owner_source_id   VARCHAR2(20),
  insured_source_id VARCHAR2(20),
  workno            VARCHAR2(20),
  comb_policy_no    VARCHAR2(20),
  app_age           NUMBER(3),
  sub_agt_no        VARCHAR2(20),
  o_classcode       VARCHAR2(8),
  population_tsmp   DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_RISKCON_01 on SXDXSJ.RISKCON (APPNO)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_RISKCON_02 on SXDXSJ.RISKCON (POLICYNO, CLASSCODE)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.RISKCON to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.RISKCON to SXDXETL;
grant select, insert, update, delete on SXDXSJ.RISKCON to SXDXSJAPP;
grant select on SXDXSJ.RISKCON to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.RISKCON to SXDXSJMOD;

prompt
prompt Creating table RPT_CPIC_2CALL
prompt =============================
prompt
create table SXDXSJ.RPT_CPIC_2CALL
(
  batch_id                 VARCHAR2(20) not null,
  source_type_code         NUMBER(3) not null,
  d_branch_code            NUMBER(3) not null,
  from_last_sale_time_code NUMBER(3) not null,
  dial_time_length_code    NUMBER(3) not null,
  phone_type               NUMBER(3) not null,
  level_a                  NUMBER(15),
  level_b                  NUMBER(15),
  level_c                  NUMBER(15),
  level_d                  NUMBER(15),
  level_e                  NUMBER(15),
  level_f                  NUMBER(15),
  level_g                  NUMBER(15),
  total_left               NUMBER(15),
  level_x                  NUMBER(15),
  level_y                  NUMBER(15),
  level_z                  NUMBER(15),
  total_right              NUMBER(15),
  total_count              NUMBER(15),
  status                   NUMBER(3),
  create_time              DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.RPT_CPIC_2CALL
  is '存放2CALL（二销）统计数据。用户查询2CALL统计报表时，将直接从本表中查询最新批次的报表数据。刷新报表时，将更新本表中的最新数据。';
alter table SXDXSJ.RPT_CPIC_2CALL
  add constraint PK_RPT_CPIC_2CALL primary key (BATCH_ID, SOURCE_TYPE_CODE, D_BRANCH_CODE, FROM_LAST_SALE_TIME_CODE, DIAL_TIME_LENGTH_CODE, PHONE_TYPE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.RPT_CPIC_2CALL to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.RPT_CPIC_2CALL to SXDXSJAPP;
grant select on SXDXSJ.RPT_CPIC_2CALL to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.RPT_CPIC_2CALL to SXDXSJMOD;

prompt
prompt Creating table RPT_CPIC_BQ_ANALYSIS
prompt ===================================
prompt
create table SXDXSJ.RPT_CPIC_BQ_ANALYSIS
(
  batch_id         CHAR(10) not null,
  row_name         VARCHAR2(120) not null,
  source_type_code NUMBER not null,
  d_branch_code    NUMBER(3) not null,
  need_bq          NUMBER,
  already_bq       NUMBER,
  bq_pct           NUMBER,
  dial_bq          NUMBER,
  contact_pct      NUMBER,
  deal_count       NUMBER,
  charge_amount    NUMBER,
  bq_bonus         NUMBER
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.RPT_CPIC_BQ_ANALYSIS
  is '分析各数据源下各分公司的保全数据';
alter table SXDXSJ.RPT_CPIC_BQ_ANALYSIS
  add constraint PK_RPT_CPIC_BQ_ANALYSIS primary key (BATCH_ID, ROW_NAME, SOURCE_TYPE_CODE, D_BRANCH_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.RPT_CPIC_BQ_ANALYSIS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.RPT_CPIC_BQ_ANALYSIS to SXDXSJAPP;
grant select on SXDXSJ.RPT_CPIC_BQ_ANALYSIS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.RPT_CPIC_BQ_ANALYSIS to SXDXSJMOD;

prompt
prompt Creating table RPT_CPIC_CHILD_BRANCH
prompt ====================================
prompt
create table SXDXSJ.RPT_CPIC_CHILD_BRANCH
(
  batch_id             VARCHAR2(20) not null,
  source_type_code     NUMBER(3) not null,
  d_branch_code        NUMBER(3) not null,
  child_branch_code    NUMBER(3) not null,
  child_branch_name    VARCHAR2(508),
  birthdate_month_code NUMBER(3) not null,
  birthdate_month_name VARCHAR2(120),
  data_col             NUMBER,
  order_col            VARCHAR2(100),
  create_time          DATE,
  status               NUMBER(3)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.RPT_CPIC_CHILD_BRANCH
  is '存放报表：可用数据的统计数据。用户查询可用数据报表时，将直接从本表中查询最新批次的报表数据。刷新报表时，将更新本表中的最新数据。';
alter table SXDXSJ.RPT_CPIC_CHILD_BRANCH
  add constraint PK_RPT_CPIC_CHILD_BRANCH primary key (BATCH_ID, SOURCE_TYPE_CODE, D_BRANCH_CODE, CHILD_BRANCH_CODE, BIRTHDATE_MONTH_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.RPT_CPIC_CHILD_BRANCH to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.RPT_CPIC_CHILD_BRANCH to SXDXSJAPP;
grant select on SXDXSJ.RPT_CPIC_CHILD_BRANCH to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.RPT_CPIC_CHILD_BRANCH to SXDXSJMOD;

prompt
prompt Creating table RPT_CPIC_DIFF
prompt ============================
prompt
create table SXDXSJ.RPT_CPIC_DIFF
(
  batch_id           VARCHAR2(20) not null,
  source_type_code   NUMBER(3) not null,
  d_branch_code      NUMBER(6) not null,
  policy_status_code NUMBER(3) not null,
  bank_status_code   NUMBER(3) not null,
  phone_status_code  NUMBER(3) not null,
  clean_status_code  NUMBER(3) not null,
  data_col           NUMBER(20),
  order_col          VARCHAR2(100),
  col_description    VARCHAR2(500),
  create_time        DATE,
  status             NUMBER(3)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.RPT_CPIC_DIFF
  is '存放报表：分类清单的统计数据。用户查询分类清单报表时，将直接从本表中查询最新批次的报表数据。刷新报表时，将更新本表中的最新数据。';
alter table SXDXSJ.RPT_CPIC_DIFF
  add constraint PK_RPT_CPIC_DIFF primary key (BATCH_ID, SOURCE_TYPE_CODE, D_BRANCH_CODE, POLICY_STATUS_CODE, BANK_STATUS_CODE, PHONE_STATUS_CODE, CLEAN_STATUS_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.RPT_CPIC_DIFF to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.RPT_CPIC_DIFF to SXDXSJAPP;
grant select on SXDXSJ.RPT_CPIC_DIFF to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.RPT_CPIC_DIFF to SXDXSJMOD;

prompt
prompt Creating table RPT_CPIC_OPERATION_BONUS
prompt =======================================
prompt
create table SXDXSJ.RPT_CPIC_OPERATION_BONUS
(
  batch_id             CHAR(10) not null,
  branch_code          NUMBER(3) not null,
  month_code           NUMBER(3) not null,
  need_operation_count NUMBER,
  operation_count      NUMBER,
  operation_succ_count NUMBER,
  online_deal_count    NUMBER,
  online_deal_amount   NUMBER,
  bonus_percent        NUMBER(2,2),
  total_amount         NUMBER(10,2),
  is_pay               NUMBER(1),
  pay_date             DATE,
  payer                VARCHAR2(40),
  pay_way              VARCHAR2(40),
  report_date          DATE,
  note                 VARCHAR2(120)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SXDXSJ.RPT_CPIC_OPERATION_BONUS
  is '保存个分公司每月的保全奖金';
alter table SXDXSJ.RPT_CPIC_OPERATION_BONUS
  add constraint PK_RPT_CPIC_OPERATION_BONUS primary key (BATCH_ID, BRANCH_CODE, MONTH_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select on SXDXSJ.RPT_CPIC_OPERATION_BONUS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.RPT_CPIC_OPERATION_BONUS to SXDXSJAPP;
grant select on SXDXSJ.RPT_CPIC_OPERATION_BONUS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.RPT_CPIC_OPERATION_BONUS to SXDXSJMOD;

prompt
prompt Creating table RPT_CPIC_SCHEDULE
prompt ================================
prompt
create table SXDXSJ.RPT_CPIC_SCHEDULE
(
  batch_id       CHAR(10) not null,
  row_name       VARCHAR2(120) not null,
  orphan         NUMBER,
  orphan_persons NUMBER,
  yinbao         NUMBER,
  yinbao_persons NUMBER,
  avg_amount     NUMBER,
  new_amount     NUMBER,
  std_amount     NUMBER
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.RPT_CPIC_SCHEDULE
  is '统计库中孤儿单和银保所有可用数据';
alter table SXDXSJ.RPT_CPIC_SCHEDULE
  add constraint PK_RPT_CPIC_SCHEDULE primary key (BATCH_ID, ROW_NAME)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.RPT_CPIC_SCHEDULE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.RPT_CPIC_SCHEDULE to SXDXSJAPP;
grant select on SXDXSJ.RPT_CPIC_SCHEDULE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.RPT_CPIC_SCHEDULE to SXDXSJMOD;

prompt
prompt Creating table RPT_CPIC_STORAGE
prompt ===============================
prompt
create table SXDXSJ.RPT_CPIC_STORAGE
(
  batch_id         VARCHAR2(20) not null,
  source_type_code NUMBER(3) not null,
  d_branch_code    NUMBER(6) not null,
  project_name     VARCHAR2(200) not null,
  phone_type       VARCHAR2(200) not null,
  level_a          NUMBER(15),
  level_b          NUMBER(15),
  level_c          NUMBER(15),
  level_d          NUMBER(15),
  level_e          NUMBER(15),
  level_f          NUMBER(15),
  level_g          NUMBER(15),
  total_left       NUMBER(15),
  level_x          NUMBER(15),
  level_y          NUMBER(15),
  level_z          NUMBER(15),
  total_right      NUMBER(15),
  total_count      NUMBER(15),
  create_time      DATE,
  status           NUMBER(1)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.RPT_CPIC_STORAGE
  is '存放报表：仓库清单的统计数据。用户查询仓库清单报表时，将直接从本表中查询最新批次的报表数据。刷新报表时，将更新本表中的最新数据。';
alter table SXDXSJ.RPT_CPIC_STORAGE
  add constraint PK_RPT_CPIC_STORAGE primary key (BATCH_ID, SOURCE_TYPE_CODE, D_BRANCH_CODE, PROJECT_NAME, PHONE_TYPE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.RPT_CPIC_STORAGE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.RPT_CPIC_STORAGE to SXDXSJAPP;
grant select on SXDXSJ.RPT_CPIC_STORAGE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.RPT_CPIC_STORAGE to SXDXSJMOD;

prompt
prompt Creating table RPT_CPIC_TICKET
prompt ==============================
prompt
create table SXDXSJ.RPT_CPIC_TICKET
(
  batch_id         CHAR(10) not null,
  row_name         VARCHAR2(120) not null,
  source_type_code NUMBER(3) not null,
  d_branch_code    NUMBER(3) not null,
  online_deal      NUMBER,
  trace_high       NUMBER,
  trace_hesitate   NUMBER,
  trace_busy       NUMBER,
  trace_else       NUMBER,
  refuse_diff      NUMBER,
  refuse_unaccept  NUMBER,
  refuse_shutdown  NUMBER,
  refuse_else      NUMBER,
  invalid_lover    NUMBER,
  invalid_parent   NUMBER,
  invalid_family   NUMBER,
  invalid_friend   NUMBER,
  invalid_nobody   NUMBER,
  invalid_null     NUMBER,
  passed_pct       NUMBER,
  contacted_pct    NUMBER
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.RPT_CPIC_TICKET
  is '拨打后名单标记';
alter table SXDXSJ.RPT_CPIC_TICKET
  add constraint PK_RPT_CPIC_TICKET primary key (BATCH_ID, ROW_NAME, SOURCE_TYPE_CODE, D_BRANCH_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.RPT_CPIC_TICKET to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.RPT_CPIC_TICKET to SXDXSJAPP;
grant select on SXDXSJ.RPT_CPIC_TICKET to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.RPT_CPIC_TICKET to SXDXSJMOD;

prompt
prompt Creating table RPT_CPIC_TRACE
prompt =============================
prompt
create table SXDXSJ.RPT_CPIC_TRACE
(
  batch_id         CHAR(10) not null,
  row_name         VARCHAR2(120) not null,
  source_type_code NUMBER not null,
  d_branch_code    NUMBER not null,
  contact_pct      NUMBER,
  estimate_pct     NUMBER,
  deal_pct         NUMBER,
  progress_pct     NUMBER
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.RPT_CPIC_TRACE
  is '统计分析电销结果的业绩状况';
alter table SXDXSJ.RPT_CPIC_TRACE
  add constraint PK_RPT_CPIC_TRACE primary key (BATCH_ID, ROW_NAME, SOURCE_TYPE_CODE, D_BRANCH_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.RPT_CPIC_TRACE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.RPT_CPIC_TRACE to SXDXSJAPP;
grant select on SXDXSJ.RPT_CPIC_TRACE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.RPT_CPIC_TRACE to SXDXSJMOD;

prompt
prompt Creating table SHCPIC_OUTDATA
prompt =============================
prompt
create table SXDXSJ.SHCPIC_OUTDATA
(
  out_id   VARCHAR2(12) not null,
  phonenum VARCHAR2(30) not null
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.SHCPIC_OUTDATA
  is '与表C_CPIC_DIAL一起协作，共同完成固定电话的清洗。SHCPIC_OUTDATA用于存放等待nuance外拨的固定电话号码，其OUT_ID列与表SHCPIC_OUTDATA的ID列一一对应。';
grant select on SXDXSJ.SHCPIC_OUTDATA to DXSJDBEXTR;
grant select, insert, delete on SXDXSJ.SHCPIC_OUTDATA to NUANCE;
grant select, insert, delete on SXDXSJ.SHCPIC_OUTDATA to NUANCEAPP;
grant select, insert, update, delete on SXDXSJ.SHCPIC_OUTDATA to SXDXSJAPP;
grant select on SXDXSJ.SHCPIC_OUTDATA to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.SHCPIC_OUTDATA to SXDXSJMOD;
grant select on SXDXSJ.SHCPIC_OUTDATA to TELANAL;
grant select on SXDXSJ.SHCPIC_OUTDATA to TELANALAPP;

prompt
prompt Creating table SMS_MESSAGE_LIBRARY
prompt ==================================
prompt
create table SXDXSJ.SMS_MESSAGE_LIBRARY
(
  id              INTEGER not null,
  message_name    VARCHAR2(50),
  message_content VARCHAR2(1000),
  active          NUMBER(1),
  creator         VARCHAR2(50),
  create_date     DATE,
  modifier        VARCHAR2(50),
  modify_date     DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.SMS_MESSAGE_LIBRARY
  is '短信平台的短信库';
comment on column SXDXSJ.SMS_MESSAGE_LIBRARY.id
  is '编号';
comment on column SXDXSJ.SMS_MESSAGE_LIBRARY.message_name
  is '短信平台分公司名称';
comment on column SXDXSJ.SMS_MESSAGE_LIBRARY.message_content
  is '短信平台分公司机构码';
comment on column SXDXSJ.SMS_MESSAGE_LIBRARY.active
  is '是否可用';
comment on column SXDXSJ.SMS_MESSAGE_LIBRARY.creator
  is '创建人';
comment on column SXDXSJ.SMS_MESSAGE_LIBRARY.create_date
  is '创建日期';
comment on column SXDXSJ.SMS_MESSAGE_LIBRARY.modifier
  is '修改人';
comment on column SXDXSJ.SMS_MESSAGE_LIBRARY.modify_date
  is '修改日期';
grant select on SXDXSJ.SMS_MESSAGE_LIBRARY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.SMS_MESSAGE_LIBRARY to SXDXSJAPP;
grant select on SXDXSJ.SMS_MESSAGE_LIBRARY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.SMS_MESSAGE_LIBRARY to SXDXSJMOD;

prompt
prompt Creating table STATIC_BRANCH_ABBREVIATION
prompt =========================================
prompt
create table SXDXSJ.STATIC_BRANCH_ABBREVIATION
(
  zone_code_prefix     VARCHAR2(30),
  branch_name          VARCHAR2(120),
  branch_abbreviation  VARCHAR2(10),
  is_single_phone_code NUMBER(1),
  phone_code           VARCHAR2(20)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.STATIC_BRANCH_ABBREVIATION
  is '分公司全称及相对应的3位大写字母简称。如：上海分公司，3位分公司简称：SHH。部分分公司暂时没有3位分公司简称';
comment on column SXDXSJ.STATIC_BRANCH_ABBREVIATION.zone_code_prefix
  is '对应区域编码前七位';
comment on column SXDXSJ.STATIC_BRANCH_ABBREVIATION.branch_name
  is '分公司全称';
comment on column SXDXSJ.STATIC_BRANCH_ABBREVIATION.branch_abbreviation
  is '3位分公司简称';
comment on column SXDXSJ.STATIC_BRANCH_ABBREVIATION.is_single_phone_code
  is '是否是单电话区号分公司';
comment on column SXDXSJ.STATIC_BRANCH_ABBREVIATION.phone_code
  is '电话区号';
grant select on SXDXSJ.STATIC_BRANCH_ABBREVIATION to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.STATIC_BRANCH_ABBREVIATION to SXDXSJAPP;
grant select on SXDXSJ.STATIC_BRANCH_ABBREVIATION to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.STATIC_BRANCH_ABBREVIATION to SXDXSJMOD;

prompt
prompt Creating table STATIC_CONTACT_STATUS
prompt ====================================
prompt
create table SXDXSJ.STATIC_CONTACT_STATUS
(
  con_sta_id NUMBER not null,
  parent_id  NUMBER,
  des        VARCHAR2(108),
  vis_typ    NUMBER,
  level1     NUMBER,
  level2     NUMBER,
  level3     NUMBER,
  level4     NUMBER,
  level5     NUMBER,
  level6     NUMBER
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.STATIC_CONTACT_STATUS
  is '列举所有电销平台联系状态码及其说明';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.con_sta_id
  is '状态码';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.parent_id
  is '父级状态码';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.des
  is '描述';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.vis_typ
  is '联系类型';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.level1
  is '第一级状态码';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.level2
  is '第2级状态码';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.level3
  is '第3级状态码';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.level4
  is '第4级状态码';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.level5
  is '第5级状态码';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.level6
  is '第6级状态码';
alter table SXDXSJ.STATIC_CONTACT_STATUS
  add constraint PK_STATIC_CONTACT_STATUS primary key (CON_STA_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.STATIC_CONTACT_STATUS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.STATIC_CONTACT_STATUS to SXDXSJAPP;
grant select on SXDXSJ.STATIC_CONTACT_STATUS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.STATIC_CONTACT_STATUS to SXDXSJMOD;

prompt
prompt Creating table STATIC_DELIVERY_INFOR
prompt ====================================
prompt
create table SXDXSJ.STATIC_DELIVERY_INFOR
(
  zone_code                VARCHAR2(20) not null,
  is_head_company_delivery NUMBER(1),
  is_branchi_delivery      NUMBER(1),
  is_pos_pay               NUMBER(1),
  is_bank_proxy            NUMBER(1),
  update_time              DATE,
  active                   CHAR(1),
  creator                  VARCHAR2(50),
  create_date              DATE,
  modifier                 VARCHAR2(50),
  modify_date              DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SXDXSJ.STATIC_DELIVERY_INFOR
  is '根据区域编码标记每个区域编码对应的快递是否可送达，是否可pos付费等信息';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.zone_code
  is '区域编码';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.is_head_company_delivery
  is '是否可总公司快递';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.is_branchi_delivery
  is '是否可分公司快递';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.is_pos_pay
  is '是否可POS付费';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.is_bank_proxy
  is '是否可银行代扣';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.update_time
  is '更新时间';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.active
  is '是否可用';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.creator
  is '创建人';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.create_date
  is '创建日期';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.modifier
  is '修改人';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.modify_date
  is '修改日期';
alter table SXDXSJ.STATIC_DELIVERY_INFOR
  add constraint PK_STATIC_DELIVERY_INFOR primary key (ZONE_CODE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select on SXDXSJ.STATIC_DELIVERY_INFOR to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.STATIC_DELIVERY_INFOR to SXDXSJAPP;
grant select on SXDXSJ.STATIC_DELIVERY_INFOR to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.STATIC_DELIVERY_INFOR to SXDXSJMOD;

prompt
prompt Creating table STATIC_GOVERN_RECZIP
prompt ===================================
prompt
create table SXDXSJ.STATIC_GOVERN_RECZIP
(
  reczip_prefix7    VARCHAR2(20),
  child_branch_id   VARCHAR2(50),
  child_branch_name VARCHAR2(120),
  branch_id         VARCHAR2(50),
  branch_name       VARCHAR2(120)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.STATIC_GOVERN_RECZIP
  is '区域编码前七位所对应的分公司和中支信息';
comment on column SXDXSJ.STATIC_GOVERN_RECZIP.reczip_prefix7
  is '区域编码前七位';
comment on column SXDXSJ.STATIC_GOVERN_RECZIP.child_branch_id
  is '所属中支机构代码';
comment on column SXDXSJ.STATIC_GOVERN_RECZIP.child_branch_name
  is '所属中支';
comment on column SXDXSJ.STATIC_GOVERN_RECZIP.branch_id
  is '所属分公司机构代码';
comment on column SXDXSJ.STATIC_GOVERN_RECZIP.branch_name
  is '所属分公司';
grant select on SXDXSJ.STATIC_GOVERN_RECZIP to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.STATIC_GOVERN_RECZIP to SXDXSJAPP;
grant select on SXDXSJ.STATIC_GOVERN_RECZIP to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.STATIC_GOVERN_RECZIP to SXDXSJMOD;

prompt
prompt Creating table STATIC_GOVERN_TREE
prompt =================================
prompt
create table SXDXSJ.STATIC_GOVERN_TREE
(
  govern_name        VARCHAR2(120),
  govern_level       NUMBER(6),
  govern_level2_name VARCHAR2(120),
  govern_level2_type VARCHAR2(120),
  govern_level2_code VARCHAR2(120),
  govern_level3_name VARCHAR2(120),
  govern_level3_type VARCHAR2(120),
  govern_level3_code VARCHAR2(120),
  govern_level4_name VARCHAR2(120),
  govern_level4_type VARCHAR2(120),
  govern_level4_code VARCHAR2(120),
  govern_level5_name VARCHAR2(120),
  govern_level5_type VARCHAR2(120),
  economy_zone       VARCHAR2(120),
  govern_level5_code VARCHAR2(120),
  govern_attribute   VARCHAR2(120),
  city               VARCHAR2(120),
  town               VARCHAR2(120),
  zone_type          VARCHAR2(120),
  govern_id          VARCHAR2(30),
  change_record      VARCHAR2(508),
  active             CHAR(1),
  creator            VARCHAR2(50),
  create_date        DATE,
  modifier           VARCHAR2(50),
  modify_date        DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.STATIC_GOVERN_TREE
  is '太保寿险的所有机构信息';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_name
  is '机构名称';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level
  is '机构分级';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level2_name
  is '二级机构名称';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level2_type
  is '二级机构称谓';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level2_code
  is '二级机构代码';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level3_name
  is '三级机构名称';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level3_type
  is '三级机构称谓';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level3_code
  is '三级机构代码';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level4_name
  is '四级机构名称';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level4_type
  is '四级机构称谓';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level4_code
  is '四级机构代码';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level5_name
  is '五级机构名称';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level5_type
  is '五级机构称谓';
comment on column SXDXSJ.STATIC_GOVERN_TREE.economy_zone
  is '经济区域';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level5_code
  is '五级机构代码';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_attribute
  is '机构属性';
comment on column SXDXSJ.STATIC_GOVERN_TREE.city
  is '所属地市';
comment on column SXDXSJ.STATIC_GOVERN_TREE.town
  is '所属县区';
comment on column SXDXSJ.STATIC_GOVERN_TREE.zone_type
  is '区域分类';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_id
  is '机构代码';
comment on column SXDXSJ.STATIC_GOVERN_TREE.change_record
  is '代码变更记录';
comment on column SXDXSJ.STATIC_GOVERN_TREE.active
  is '是否可用';
comment on column SXDXSJ.STATIC_GOVERN_TREE.creator
  is '创建人';
comment on column SXDXSJ.STATIC_GOVERN_TREE.create_date
  is '创建日期';
comment on column SXDXSJ.STATIC_GOVERN_TREE.modifier
  is '修改人';
comment on column SXDXSJ.STATIC_GOVERN_TREE.modify_date
  is '修改日期';
grant select on SXDXSJ.STATIC_GOVERN_TREE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.STATIC_GOVERN_TREE to SXDXSJAPP;
grant select on SXDXSJ.STATIC_GOVERN_TREE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.STATIC_GOVERN_TREE to SXDXSJMOD;

prompt
prompt Creating table STATIC_SMS_GOVERN_INFO
prompt =====================================
prompt
create table SXDXSJ.STATIC_SMS_GOVERN_INFO
(
  og_key         VARCHAR2(20),
  og_parentkey   VARCHAR2(20),
  og_id          VARCHAR2(20),
  og_code        VARCHAR2(50),
  og_smextendnum VARCHAR2(20),
  og_p11code     VARCHAR2(50),
  og_parentlabel VARCHAR2(50),
  og_type        VARCHAR2(20),
  og_name        VARCHAR2(120)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.STATIC_SMS_GOVERN_INFO
  is '短信平台寿险机构码';
grant select on SXDXSJ.STATIC_SMS_GOVERN_INFO to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.STATIC_SMS_GOVERN_INFO to SXDXSJAPP;
grant select on SXDXSJ.STATIC_SMS_GOVERN_INFO to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.STATIC_SMS_GOVERN_INFO to SXDXSJMOD;

prompt
prompt Creating table TASKPROCESS
prompt ==========================
prompt
create table SXDXSJ.TASKPROCESS
(
  processcode  INTEGER,
  processname  VARCHAR2(120),
  processvalue NUMBER(2)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SXDXSJ.TASKPROCESS
  is '一些任务被分成多步，这些细分的步骤及其状态信息将记录在此表中。';
grant select on SXDXSJ.TASKPROCESS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TASKPROCESS to SXDXSJAPP;
grant select on SXDXSJ.TASKPROCESS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TASKPROCESS to SXDXSJMOD;

prompt
prompt Creating table TASKS
prompt ====================
prompt
create table SXDXSJ.TASKS
(
  id                  NUMBER not null,
  task_condition      VARCHAR2(2000),
  task_type           NUMBER(3),
  task_name           VARCHAR2(100),
  description         VARCHAR2(2000),
  create_time         DATE,
  initial_number      NUMBER(15),
  success_number      NUMBER(15),
  begin_time          DATE,
  end_time            DATE,
  file_type           NUMBER,
  file_path           VARCHAR2(200),
  template_id         NUMBER,
  source_type_code    NUMBER(3),
  branch_code         NUMBER(6),
  is_fix_number       NUMBER,
  operation_type      NUMBER(3),
  status              NUMBER(3),
  active              CHAR(1),
  creator             VARCHAR2(50),
  branch_abbreviation VARCHAR2(20),
  download_times      NUMBER(6),
  processcode         INTEGER default 1,
  success_part_list   VARCHAR2(200)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TASKS
  is '记录各种任务信息
status:
0 等待，1处理中， 2处理完成，3出错
task_type(优先级由高到低):
1 导出电销
2 清洗电话
3 导出保全
4 保全回写
5 原始导入';
comment on column SXDXSJ.TASKS.id
  is '编号';
comment on column SXDXSJ.TASKS.task_condition
  is '任务条件';
comment on column SXDXSJ.TASKS.task_type
  is '任务类型';
comment on column SXDXSJ.TASKS.task_name
  is '任务名称';
comment on column SXDXSJ.TASKS.description
  is '描述';
comment on column SXDXSJ.TASKS.create_time
  is '提交时间';
comment on column SXDXSJ.TASKS.initial_number
  is '初始数量';
comment on column SXDXSJ.TASKS.success_number
  is '成功数量';
comment on column SXDXSJ.TASKS.begin_time
  is '开始时间';
comment on column SXDXSJ.TASKS.end_time
  is '结束时间';
comment on column SXDXSJ.TASKS.file_type
  is '文件类型';
comment on column SXDXSJ.TASKS.file_path
  is '文件路径';
comment on column SXDXSJ.TASKS.template_id
  is '模板编号';
comment on column SXDXSJ.TASKS.source_type_code
  is '数据来源类型';
comment on column SXDXSJ.TASKS.branch_code
  is '分公司代码';
comment on column SXDXSJ.TASKS.is_fix_number
  is '是否修复电话';
comment on column SXDXSJ.TASKS.operation_type
  is '保全类型';
comment on column SXDXSJ.TASKS.status
  is '状态';
comment on column SXDXSJ.TASKS.active
  is '是否可用';
comment on column SXDXSJ.TASKS.creator
  is '创建人';
comment on column SXDXSJ.TASKS.branch_abbreviation
  is '分公司简称';
comment on column SXDXSJ.TASKS.download_times
  is '下载次数';
alter table SXDXSJ.TASKS
  add constraint PK_TASKS primary key (ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TASKS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TASKS to SXDXSJAPP;
grant select on SXDXSJ.TASKS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TASKS to SXDXSJMOD;

prompt
prompt Creating table TASK_DETAIL
prompt ==========================
prompt
create table SXDXSJ.TASK_DETAIL
(
  detail_id      NUMBER not null,
  task_id        NUMBER not null,
  detail_name    VARCHAR2(200),
  success_number NUMBER,
  begin_time     DATE,
  end_time       DATE,
  completed      NUMBER(3)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TASK_DETAIL
  is '部分任务被拆分成多批进行处理，拆分后的批次信息存放在此表中。
detail_id:
1：插入银行信息
100-109:向保单更新中间表插入数据
200-209：保单插入
299：更新保单
300-309：向电话中间表插入修复后电话
399：向电话表中插入去重后电话
400-409：向投保人更新中间表插入数据
499：更新投保人信息，并标记非孤儿单
500-509：插入投保人';
comment on column SXDXSJ.TASK_DETAIL.detail_id
  is '编号';
comment on column SXDXSJ.TASK_DETAIL.task_id
  is '任务编号';
comment on column SXDXSJ.TASK_DETAIL.detail_name
  is '名称';
comment on column SXDXSJ.TASK_DETAIL.success_number
  is '成功数量';
comment on column SXDXSJ.TASK_DETAIL.begin_time
  is '开始时间';
comment on column SXDXSJ.TASK_DETAIL.end_time
  is '结束时间';
comment on column SXDXSJ.TASK_DETAIL.completed
  is '是否结束';
alter table SXDXSJ.TASK_DETAIL
  add constraint PK_TASK_DETAIL primary key (DETAIL_ID, TASK_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TASK_DETAIL to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TASK_DETAIL to SXDXSJAPP;
grant select on SXDXSJ.TASK_DETAIL to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TASK_DETAIL to SXDXSJMOD;

prompt
prompt Creating table TA_CMP_RPT_DAY
prompt =============================
prompt
create table SXDXSJ.TA_CMP_RPT_DAY
(
  cal_day_id             DATE not null,
  schl_call_mon          VARCHAR2(20) not null,
  actv_id                VARCHAR2(1024) not null,
  bat_code               VARCHAR2(200) not null,
  com_typ                VARCHAR2(20) not null,
  bat_prjt               VARCHAR2(20) not null,
  comp_id                VARCHAR2(20) not null,
  city_id                VARCHAR2(20) not null,
  ctr_code               VARCHAR2(20) not null,
  sales_prjt             VARCHAR2(20) not null,
  tem_code               VARCHAR2(20) not null,
  cal_times              VARCHAR2(20) not null,
  prjt_mgr_id            VARCHAR2(20) not null,
  tem_lead_id            VARCHAR2(20) not null,
  user_id                VARCHAR2(20) not null,
  list_tno               NUMBER(14),
  fst_cal_list_qty       NUMBER(14),
  cal_comp_list_qty      NUMBER(14),
  connt_list_qty         NUMBER(14),
  cont_list_qty          NUMBER(14),
  cal_comp_cont_list_qty NUMBER(14),
  surp_trk_list_qty      NUMBER(14),
  oline_smit_qty         NUMBER(14),
  oline_smit_prm         NUMBER(20,3),
  oline_tran_qty         NUMBER(14),
  oline_tran_prm         NUMBER(20,3),
  fst_chargbk_succ_qty   NUMBER(14),
  fst_chargbk_succ_prm   NUMBER(20,3),
  annul_fst_prm_prm      NUMBER(20,3),
  actl_fst_prm_prm       NUMBER(20,3),
  wtn_qty                NUMBER(14),
  agg_cal_times          NUMBER(14),
  agg_cont_times         NUMBER(14),
  population_tsmp        DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SXDXSJ.TA_CMP_RPT_DAY.cal_day_id
  is '统计日期
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.schl_call_mon
  is '计划拨打年月
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.actv_id
  is '活动ID';
comment on column SXDXSJ.TA_CMP_RPT_DAY.bat_code
  is '批次代码
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.com_typ
  is '名单类型
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.bat_prjt
  is '批次项目
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.comp_id
  is '分公司ID
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.city_id
  is '城市ID
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.ctr_code
  is '分中心';
comment on column SXDXSJ.TA_CMP_RPT_DAY.sales_prjt
  is '销售项目';
comment on column SXDXSJ.TA_CMP_RPT_DAY.tem_code
  is '团队ID';
comment on column SXDXSJ.TA_CMP_RPT_DAY.cal_times
  is '拨打次数';
comment on column SXDXSJ.TA_CMP_RPT_DAY.prjt_mgr_id
  is '项目经理ID
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.tem_lead_id
  is '团队长ID
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.user_id
  is '座席ID
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.list_tno
  is '名单总量
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.fst_cal_list_qty
  is '首拨名单量
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.cal_comp_list_qty
  is '拨打完成名单量
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.connt_list_qty
  is '接通名单量
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.cont_list_qty
  is '接触名单量';
comment on column SXDXSJ.TA_CMP_RPT_DAY.cal_comp_cont_list_qty
  is '拨打完成接触名单量
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.surp_trk_list_qty
  is '剩余跟踪名单量
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.oline_smit_qty
  is '线上提交件数
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.oline_smit_prm
  is '线上提交保费';
comment on column SXDXSJ.TA_CMP_RPT_DAY.oline_tran_qty
  is '线上成交件数
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.oline_tran_prm
  is '线上成交保费
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.fst_chargbk_succ_qty
  is '首期扣款成功件数
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.fst_chargbk_succ_prm
  is '首期扣款成功保费
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.annul_fst_prm_prm
  is '年化新保保费

';
comment on column SXDXSJ.TA_CMP_RPT_DAY.actl_fst_prm_prm
  is '实收新保保费
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.wtn_qty
  is '保单配送成功件数
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.agg_cal_times
  is '累计拨打次数
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.agg_cont_times
  is '累计接触次数
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.population_tsmp
  is '发布时间戳';
alter table SXDXSJ.TA_CMP_RPT_DAY
  add constraint PK_TA_CMP_RPT_DAY primary key (CAL_DAY_ID, SCHL_CALL_MON, ACTV_ID, BAT_CODE, COM_TYP, BAT_PRJT, COMP_ID, CITY_ID, CTR_CODE, SALES_PRJT, TEM_CODE, CAL_TIMES, PRJT_MGR_ID, TEM_LEAD_ID, USER_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TA_CMP_RPT_DAY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TA_CMP_RPT_DAY to SXDXSJAPP;
grant select, insert, update, delete on SXDXSJ.TA_CMP_RPT_DAY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TA_CMP_RPT_DAY to SXDXSJMOD;

prompt
prompt Creating table TA_LIST_INV_RPT_DAY
prompt ==================================
prompt
create table SXDXSJ.TA_LIST_INV_RPT_DAY
(
  cal_day_id                     DATE not null,
  schl_call_mon                  VARCHAR2(10) not null,
  sec_telemkt_rslt               VARCHAR2(20) not null,
  com_typ                        VARCHAR2(20) not null,
  bat_prjt                       VARCHAR2(20) not null,
  ctr_code                       VARCHAR2(20) not null,
  sales_prjt                     VARCHAR2(20) not null,
  wp_id                          VARCHAR2(20) not null,
  prjt_mgr_id                    VARCHAR2(20) not null,
  tem_lead_id                    VARCHAR2(20) not null,
  user_id                        VARCHAR2(20) not null,
  t_1day_resvt_trk_list_qty      NUMBER(14),
  t_2day_resvt_trk_list_qty      NUMBER(14),
  t_third_day_resvt_trk_list_qty NUMBER(14),
  t_4day_resvt_trk_list_qty      NUMBER(14),
  t_5day_resvt_trk_list_qty      NUMBER(14),
  t_6day_resvt_trk_list_qty      NUMBER,
  t_seventh_day_resvt_trk_list_q NUMBER(14),
  population_tsmp                DATE default sysdate,
  cal_times                      VARCHAR2(20),
  bat_code                       VARCHAR2(400)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.cal_day_id
  is '统计日期
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.schl_call_mon
  is '计划拨打年月
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.sec_telemkt_rslt
  is '二级电销结果
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.com_typ
  is '名单类型
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.bat_prjt
  is '批次项目
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.ctr_code
  is '中心
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.sales_prjt
  is '销售项目
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.wp_id
  is '职场ID

';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.prjt_mgr_id
  is '项目经理ID
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.tem_lead_id
  is '团队长ID
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.user_id
  is '座席ID
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.t_1day_resvt_trk_list_qty
  is 'T+1日预约跟踪名单量
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.t_2day_resvt_trk_list_qty
  is 'T+2日预约跟踪名单量
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.t_third_day_resvt_trk_list_qty
  is 'T+3日预约跟踪名单量
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.t_4day_resvt_trk_list_qty
  is 'T+4日预约跟踪名单量
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.t_5day_resvt_trk_list_qty
  is 'T+5日预约跟踪名单量
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.t_6day_resvt_trk_list_qty
  is 'T+6日预约跟踪名单量
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.t_seventh_day_resvt_trk_list_q
  is 'T+7日以上预约跟踪名单量';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.population_tsmp
  is '发布时间戳';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.cal_times
  is '拨打次数';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.bat_code
  is '批次代码（存放中文）';
alter table SXDXSJ.TA_LIST_INV_RPT_DAY
  add constraint PK_TA_LIST_INV_RPT_DAY primary key (CAL_DAY_ID, SCHL_CALL_MON, SEC_TELEMKT_RSLT, COM_TYP, BAT_PRJT, CTR_CODE, SALES_PRJT, WP_ID, PRJT_MGR_ID, TEM_LEAD_ID, USER_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TA_LIST_INV_RPT_DAY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TA_LIST_INV_RPT_DAY to SXDXETL;
grant select, insert, update, delete on SXDXSJ.TA_LIST_INV_RPT_DAY to SXDXSJAPP;
grant select on SXDXSJ.TA_LIST_INV_RPT_DAY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TA_LIST_INV_RPT_DAY to SXDXSJMOD;

prompt
prompt Creating table TA_SALES_HUMAN_RPT_DAY
prompt =====================================
prompt
create table SXDXSJ.TA_SALES_HUMAN_RPT_DAY
(
  cal_day_id      DATE not null,
  actv_id         VARCHAR2(600) not null,
  bat_code        VARCHAR2(600) not null,
  com_typ         VARCHAR2(20) not null,
  bat_prjt        VARCHAR2(20) not null,
  comp_id         VARCHAR2(20) not null,
  city_id         VARCHAR2(20) not null,
  ctr_code        VARCHAR2(20) not null,
  sales_prjt      VARCHAR2(20) not null,
  tem_code        VARCHAR2(20) not null,
  wp_id           VARCHAR2(20) not null,
  prjt_mgr_id     VARCHAR2(20) not null,
  tem_lead_id     VARCHAR2(20) not null,
  on_line_human   NUMBER(14,2),
  population_tsmp DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TA_SALES_HUMAN_RPT_DAY
  is '销售人力报表';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.cal_day_id
  is '统计日期';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.actv_id
  is '活动ID';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.bat_code
  is '批次代码';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.com_typ
  is '名单类型';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.bat_prjt
  is '批次项目';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.comp_id
  is '分公司';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.city_id
  is '城市';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.ctr_code
  is '中心';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.sales_prjt
  is '销售项目';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.tem_code
  is '团队';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.wp_id
  is '职场';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.prjt_mgr_id
  is '项目经理id';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.tem_lead_id
  is '团队ID';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.on_line_human
  is '上线人力';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.population_tsmp
  is '发布时间戳';
alter table SXDXSJ.TA_SALES_HUMAN_RPT_DAY
  add constraint PK_TA_HUMAN_RPT_DAY primary key (CAL_DAY_ID, ACTV_ID, BAT_CODE, COM_TYP, BAT_PRJT, COMP_ID, CITY_ID, CTR_CODE, SALES_PRJT, TEM_CODE, WP_ID, PRJT_MGR_ID, TEM_LEAD_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TA_SALES_RPT_DAY
prompt ===============================
prompt
create table SXDXSJ.TA_SALES_RPT_DAY
(
  cal_day_id            DATE not null,
  pay_mode              VARCHAR2(20) not null,
  actv_id               VARCHAR2(1024) not null,
  bat_code              VARCHAR2(200) not null,
  com_typ               VARCHAR2(20) not null,
  bat_prjt              VARCHAR2(20) not null,
  comp_id               VARCHAR2(20) not null,
  city_id               VARCHAR2(20) not null,
  ctr_code              VARCHAR2(20) not null,
  sales_prjt            VARCHAR2(20) not null,
  tem_code              VARCHAR2(20) not null,
  wp_id                 VARCHAR2(20) not null,
  prjt_mgr_id           VARCHAR2(20) not null,
  tem_lead_id           VARCHAR2(20) not null,
  user_id               VARCHAR2(20) not null,
  fst_cal_list_qty      NUMBER(14),
  fst_cal_cont_list_qty NUMBER(14),
  trk_list_qty          NUMBER(14),
  cont_list_qty         NUMBER(14),
  rej_list_qty          NUMBER(14),
  oline_smit_qty        NUMBER(14),
  oline_smit_prm        NUMBER(20,3),
  oline_tran_qty        NUMBER(14),
  oline_tran_prm        NUMBER(20,3),
  fst_chargbk_succ_qty  NUMBER(14),
  annul_fst_prm_prm     NUMBER(20,3),
  actl_fst_prm_prm      NUMBER(20,3),
  cncl_qty              NUMBER(14),
  cncl_prm              NUMBER(20,3),
  population_tsmp       DATE default sysdate,
  land_succ_qty         NUMBER(14),
  land_succ_prm         NUMBER(20,3)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TA_SALES_RPT_DAY
  is '销售日报表';
comment on column SXDXSJ.TA_SALES_RPT_DAY.cal_day_id
  is '统计日期';
comment on column SXDXSJ.TA_SALES_RPT_DAY.pay_mode
  is '缴费方式';
comment on column SXDXSJ.TA_SALES_RPT_DAY.actv_id
  is '活动ID';
comment on column SXDXSJ.TA_SALES_RPT_DAY.bat_code
  is '批次代码';
comment on column SXDXSJ.TA_SALES_RPT_DAY.com_typ
  is '名单类型';
comment on column SXDXSJ.TA_SALES_RPT_DAY.bat_prjt
  is '批次项目';
comment on column SXDXSJ.TA_SALES_RPT_DAY.comp_id
  is '分公司代码
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.city_id
  is '城市ID
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.ctr_code
  is '中心';
comment on column SXDXSJ.TA_SALES_RPT_DAY.sales_prjt
  is '销售项目
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.tem_code
  is '团队代码
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.wp_id
  is '职场ID
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.prjt_mgr_id
  is '项目经理ID
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.tem_lead_id
  is '团队长ID
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.user_id
  is '座席ID
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.fst_cal_list_qty
  is '首拨名单量
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.fst_cal_cont_list_qty
  is '首拨接触名单量';
comment on column SXDXSJ.TA_SALES_RPT_DAY.trk_list_qty
  is '跟踪名单量
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.cont_list_qty
  is '接触名单量';
comment on column SXDXSJ.TA_SALES_RPT_DAY.rej_list_qty
  is '拒绝名单量
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.oline_smit_qty
  is '线上提交件数
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.oline_smit_prm
  is '线上提交保费
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.oline_tran_qty
  is '线上成交件数
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.oline_tran_prm
  is '线上成交保费
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.fst_chargbk_succ_qty
  is '首期扣款成功件';
comment on column SXDXSJ.TA_SALES_RPT_DAY.annul_fst_prm_prm
  is '
年化新保保费
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.actl_fst_prm_prm
  is '实收新保保费
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.cncl_qty
  is '犹豫期退保件数';
comment on column SXDXSJ.TA_SALES_RPT_DAY.cncl_prm
  is '犹豫期退保保费
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.population_tsmp
  is '发布时间戳
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.land_succ_qty
  is '落地成功件';
comment on column SXDXSJ.TA_SALES_RPT_DAY.land_succ_prm
  is '落地成功保费';
alter table SXDXSJ.TA_SALES_RPT_DAY
  add constraint PK_TA_SALES_RPT_DAY primary key (CAL_DAY_ID, PAY_MODE, ACTV_ID, BAT_CODE, COM_TYP, BAT_PRJT, COMP_ID, CITY_ID, CTR_CODE, SALES_PRJT, TEM_CODE, WP_ID, PRJT_MGR_ID, TEM_LEAD_ID, USER_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TA_SALES_RPT_DAY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TA_SALES_RPT_DAY to SXDXSJAPP;
grant select on SXDXSJ.TA_SALES_RPT_DAY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TA_SALES_RPT_DAY to SXDXSJMOD;

prompt
prompt Creating table TA_SALES_RPT_MON
prompt ===============================
prompt
create table SXDXSJ.TA_SALES_RPT_MON
(
  cal_mon_id            NUMBER(6) not null,
  pay_mode              VARCHAR2(20) not null,
  actv_id               VARCHAR2(1024) not null,
  bat_code              VARCHAR2(200) not null,
  com_typ               VARCHAR2(20) not null,
  bat_prjt              VARCHAR2(20) not null,
  comp_id               VARCHAR2(20) not null,
  city_id               VARCHAR2(20) not null,
  ctr_code              VARCHAR2(20) not null,
  sales_prjt            VARCHAR2(20) not null,
  tem_code              VARCHAR2(20) not null,
  wp_id                 VARCHAR2(20) not null,
  prjt_mgr_id           VARCHAR2(20) not null,
  tem_lead_id           VARCHAR2(20) not null,
  user_id               VARCHAR2(20) not null,
  fst_cal_list_qty      NUMBER(14),
  fst_cal_cont_list_qty NUMBER(14),
  trk_list_qty          NUMBER(14),
  cont_list_qty         NUMBER(14),
  rej_list_qty          NUMBER(14),
  oline_smit_qty        NUMBER(14),
  oline_smit_prm        NUMBER(20,3),
  oline_tran_qty        NUMBER(14),
  oline_tran_prm        NUMBER(20,3),
  fst_chargbk_succ_qty  NUMBER(14),
  annul_fst_prm_prm     NUMBER(20,3),
  actl_fst_prm_prm      NUMBER(20,3),
  cncl_qty              NUMBER(14),
  cncl_prm              NUMBER(20,3),
  population_tsmp       DATE default sysdate,
  land_succ_qty         NUMBER(14),
  land_succ_prm         NUMBER(20,3)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TA_SALES_RPT_MON
  is '销售月累计报表';
comment on column SXDXSJ.TA_SALES_RPT_MON.cal_mon_id
  is '统计日期';
comment on column SXDXSJ.TA_SALES_RPT_MON.pay_mode
  is '缴费方式';
comment on column SXDXSJ.TA_SALES_RPT_MON.actv_id
  is '活动ID';
comment on column SXDXSJ.TA_SALES_RPT_MON.bat_code
  is '批次代码';
comment on column SXDXSJ.TA_SALES_RPT_MON.com_typ
  is '名单类型';
comment on column SXDXSJ.TA_SALES_RPT_MON.bat_prjt
  is '批次项目';
comment on column SXDXSJ.TA_SALES_RPT_MON.comp_id
  is '分公司代码
';
comment on column SXDXSJ.TA_SALES_RPT_MON.city_id
  is '城市ID
';
comment on column SXDXSJ.TA_SALES_RPT_MON.ctr_code
  is '中心';
comment on column SXDXSJ.TA_SALES_RPT_MON.sales_prjt
  is '销售项目
';
comment on column SXDXSJ.TA_SALES_RPT_MON.tem_code
  is '团队代码
';
comment on column SXDXSJ.TA_SALES_RPT_MON.wp_id
  is '职场ID
';
comment on column SXDXSJ.TA_SALES_RPT_MON.prjt_mgr_id
  is '项目经理ID
';
comment on column SXDXSJ.TA_SALES_RPT_MON.tem_lead_id
  is '团队长ID
';
comment on column SXDXSJ.TA_SALES_RPT_MON.user_id
  is '座席ID
';
comment on column SXDXSJ.TA_SALES_RPT_MON.fst_cal_list_qty
  is '首拨名单量
';
comment on column SXDXSJ.TA_SALES_RPT_MON.fst_cal_cont_list_qty
  is '首拨接触名单量';
comment on column SXDXSJ.TA_SALES_RPT_MON.trk_list_qty
  is '跟踪名单量
';
comment on column SXDXSJ.TA_SALES_RPT_MON.cont_list_qty
  is '拒绝名单量
';
comment on column SXDXSJ.TA_SALES_RPT_MON.rej_list_qty
  is '拒绝名单量
';
comment on column SXDXSJ.TA_SALES_RPT_MON.oline_smit_qty
  is '线上提交件数
';
comment on column SXDXSJ.TA_SALES_RPT_MON.oline_smit_prm
  is '线上提交保费
';
comment on column SXDXSJ.TA_SALES_RPT_MON.oline_tran_qty
  is '线上成交件数
';
comment on column SXDXSJ.TA_SALES_RPT_MON.oline_tran_prm
  is '线上成交保费
';
comment on column SXDXSJ.TA_SALES_RPT_MON.fst_chargbk_succ_qty
  is '首期扣款成功件';
comment on column SXDXSJ.TA_SALES_RPT_MON.annul_fst_prm_prm
  is '
年化新保保费
';
comment on column SXDXSJ.TA_SALES_RPT_MON.actl_fst_prm_prm
  is '实收新保保费
';
comment on column SXDXSJ.TA_SALES_RPT_MON.cncl_qty
  is '犹豫期退保件数';
comment on column SXDXSJ.TA_SALES_RPT_MON.cncl_prm
  is '犹豫期退保保费
';
comment on column SXDXSJ.TA_SALES_RPT_MON.population_tsmp
  is '发布时间戳
';
comment on column SXDXSJ.TA_SALES_RPT_MON.land_succ_qty
  is '落地成功件';
comment on column SXDXSJ.TA_SALES_RPT_MON.land_succ_prm
  is '落地成功保费';
alter table SXDXSJ.TA_SALES_RPT_MON
  add constraint PK_TA_SALES_RPT_MON primary key (CAL_MON_ID, PAY_MODE, ACTV_ID, BAT_CODE, COM_TYP, BAT_PRJT, COMP_ID, CITY_ID, CTR_CODE, SALES_PRJT, TEM_CODE, WP_ID, PRJT_MGR_ID, TEM_LEAD_ID, USER_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TA_SALES_RPT_MON to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TA_SALES_RPT_MON to SXDXSJAPP;
grant select on SXDXSJ.TA_SALES_RPT_MON to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TA_SALES_RPT_MON to SXDXSJMOD;

prompt
prompt Creating table TA_SALES_RPT_WEK
prompt ===============================
prompt
create table SXDXSJ.TA_SALES_RPT_WEK
(
  cal_week_id           VARCHAR2(20) not null,
  pay_mode              VARCHAR2(20) not null,
  actv_id               VARCHAR2(1024) not null,
  bat_code              VARCHAR2(200) not null,
  com_typ               VARCHAR2(20) not null,
  bat_prjt              VARCHAR2(20) not null,
  comp_id               VARCHAR2(20) not null,
  city_id               VARCHAR2(20) not null,
  ctr_code              VARCHAR2(20) not null,
  sales_prjt            VARCHAR2(20) not null,
  tem_code              VARCHAR2(20) not null,
  wp_id                 VARCHAR2(20) not null,
  prjt_mgr_id           VARCHAR2(20) not null,
  tem_lead_id           VARCHAR2(20) not null,
  user_id               VARCHAR2(20) not null,
  fst_cal_list_qty      NUMBER(14),
  fst_cal_cont_list_qty NUMBER(14),
  trk_list_qty          NUMBER(14),
  cont_list_qty         NUMBER(14),
  rej_list_qty          NUMBER(14),
  oline_smit_qty        NUMBER(14),
  oline_smit_prm        NUMBER(20,3),
  oline_tran_qty        NUMBER(14),
  oline_tran_prm        NUMBER(20,3),
  fst_chargbk_succ_qty  NUMBER(14),
  annul_fst_prm_prm     NUMBER(20,3),
  actl_fst_prm_prm      NUMBER(20,3),
  cncl_qty              NUMBER(14),
  cncl_prm              NUMBER(20,3),
  population_tsmp       DATE default sysdate,
  land_succ_qty         NUMBER(14),
  land_succ_prm         NUMBER(20,3)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TA_SALES_RPT_WEK
  is '销售周累计报表';
comment on column SXDXSJ.TA_SALES_RPT_WEK.cal_week_id
  is '统计日期';
comment on column SXDXSJ.TA_SALES_RPT_WEK.pay_mode
  is '缴费方式';
comment on column SXDXSJ.TA_SALES_RPT_WEK.actv_id
  is '活动ID';
comment on column SXDXSJ.TA_SALES_RPT_WEK.bat_code
  is '批次代码';
comment on column SXDXSJ.TA_SALES_RPT_WEK.com_typ
  is '名单类型';
comment on column SXDXSJ.TA_SALES_RPT_WEK.bat_prjt
  is '批次项目';
comment on column SXDXSJ.TA_SALES_RPT_WEK.comp_id
  is '分公司代码
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.city_id
  is '城市ID
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.ctr_code
  is '中心';
comment on column SXDXSJ.TA_SALES_RPT_WEK.sales_prjt
  is '销售项目
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.tem_code
  is '团队代码
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.wp_id
  is '职场ID
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.prjt_mgr_id
  is '项目经理ID
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.tem_lead_id
  is '团队长ID
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.user_id
  is '座席ID
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.fst_cal_list_qty
  is '首拨名单量
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.fst_cal_cont_list_qty
  is '首拨接触名单量';
comment on column SXDXSJ.TA_SALES_RPT_WEK.trk_list_qty
  is '跟踪名单量
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.cont_list_qty
  is '接触名单量
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.rej_list_qty
  is '拒绝名单量
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.oline_smit_qty
  is '线上提交件数
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.oline_smit_prm
  is '线上提交保费
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.oline_tran_qty
  is '线上成交件数
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.oline_tran_prm
  is '线上成交保费
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.fst_chargbk_succ_qty
  is '首期扣款成功件';
comment on column SXDXSJ.TA_SALES_RPT_WEK.annul_fst_prm_prm
  is '
年化新保保费
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.actl_fst_prm_prm
  is '实收新保保费
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.cncl_qty
  is '犹豫期退保件数';
comment on column SXDXSJ.TA_SALES_RPT_WEK.cncl_prm
  is '犹豫期退保保费
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.population_tsmp
  is '发布时间戳
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.land_succ_qty
  is '落地成功件';
comment on column SXDXSJ.TA_SALES_RPT_WEK.land_succ_prm
  is '落地成功保费';
alter table SXDXSJ.TA_SALES_RPT_WEK
  add constraint PK_TA_SALES_RPT_WEK primary key (CAL_WEEK_ID, PAY_MODE, ACTV_ID, BAT_CODE, COM_TYP, BAT_PRJT, COMP_ID, CITY_ID, CTR_CODE, SALES_PRJT, TEM_CODE, WP_ID, PRJT_MGR_ID, TEM_LEAD_ID, USER_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TA_SALES_RPT_WEK to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TA_SALES_RPT_WEK to SXDXSJAPP;
grant select on SXDXSJ.TA_SALES_RPT_WEK to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TA_SALES_RPT_WEK to SXDXSJMOD;

prompt
prompt Creating table TB_APPLICATION
prompt =============================
prompt
create table SXDXSJ.TB_APPLICATION
(
  application_id  VARCHAR2(18) not null,
  appno           VARCHAR2(18) not null,
  policyno        VARCHAR2(18),
  idorg           VARCHAR2(18),
  iddmsystem      VARCHAR2(24),
  iddmtype        VARCHAR2(4),
  firstcreate     DATE,
  lastupdate      DATE,
  isubmit         VARCHAR2(1),
  iaccept         VARCHAR2(1),
  recordstatus    VARCHAR2(2),
  tsrid           VARCHAR2(16),
  last_log        NUMBER(10),
  product_name    VARCHAR2(50),
  campaign_name   VARCHAR2(1024),
  vaildaty        VARCHAR2(10),
  ialter          VARCHAR2(1),
  irepeal         VARCHAR2(1),
  iupdate         VARCHAR2(1),
  app_status      VARCHAR2(3),
  prj_id          NUMBER(10),
  ai_rel          VARCHAR2(3),
  acus_licno      VARCHAR2(50),
  acus_mob        VARCHAR2(50),
  acus_gender     VARCHAR2(2),
  acus_name       VARCHAR2(50),
  icus_licno      VARCHAR2(50),
  icus_mob        VARCHAR2(50),
  icus_gender     VARCHAR2(2),
  icus_name       VARCHAR2(50),
  agent_id        VARCHAR2(50),
  total_fee       NUMBER(20,4),
  org_id          NUMBER(10),
  site_status     VARCHAR2(2),
  pro_status      VARCHAR2(2),
  is_del          VARCHAR2(1) default '0' not null,
  ob_com_id       NUMBER(10),
  task_id         NUMBER(18),
  verify_status   CHAR(1),
  verify_note     VARCHAR2(1024),
  update_user     VARCHAR2(24),
  verify_date     DATE,
  product_id      NUMBER(20),
  export_flag     CHAR(1),
  export_time     DATE,
  fee_desc        VARCHAR2(1000),
  population_tsmp DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TB_APPLICATION
  is '投保单基本信息表';
comment on column SXDXSJ.TB_APPLICATION.application_id
  is '投保单ID';
comment on column SXDXSJ.TB_APPLICATION.appno
  is '投保单号';
comment on column SXDXSJ.TB_APPLICATION.policyno
  is '保单号';
comment on column SXDXSJ.TB_APPLICATION.idorg
  is '中支公司编码';
comment on column SXDXSJ.TB_APPLICATION.iddmsystem
  is '外部系统投保单ID';
comment on column SXDXSJ.TB_APPLICATION.iddmtype
  is '数据来源类型';
comment on column SXDXSJ.TB_APPLICATION.firstcreate
  is '创建时间';
comment on column SXDXSJ.TB_APPLICATION.lastupdate
  is '修改时间';
comment on column SXDXSJ.TB_APPLICATION.isubmit
  is '是否提交';
comment on column SXDXSJ.TB_APPLICATION.iaccept
  is '是否落地成功 默认 0 ，1 ：落地成功';
comment on column SXDXSJ.TB_APPLICATION.tsrid
  is '录单座席工号';
comment on column SXDXSJ.TB_APPLICATION.product_name
  is '产品名称';
comment on column SXDXSJ.TB_APPLICATION.campaign_name
  is '活动名称';
comment on column SXDXSJ.TB_APPLICATION.ialter
  is '是否已修改 1是';
comment on column SXDXSJ.TB_APPLICATION.irepeal
  is '是否撤销  1是';
comment on column SXDXSJ.TB_APPLICATION.iupdate
  is '是否更新  1是';
comment on column SXDXSJ.TB_APPLICATION.app_status
  is '投保单状态';
comment on column SXDXSJ.TB_APPLICATION.prj_id
  is '项目ID';
comment on column SXDXSJ.TB_APPLICATION.ai_rel
  is '投保人和被保人关系';
comment on column SXDXSJ.TB_APPLICATION.acus_licno
  is '投保人证件号';
comment on column SXDXSJ.TB_APPLICATION.acus_mob
  is '投保手机';
comment on column SXDXSJ.TB_APPLICATION.acus_gender
  is '投保人性别';
comment on column SXDXSJ.TB_APPLICATION.acus_name
  is '投保人姓名';
comment on column SXDXSJ.TB_APPLICATION.icus_licno
  is '被保人证件号';
comment on column SXDXSJ.TB_APPLICATION.icus_mob
  is '被保人投保手机';
comment on column SXDXSJ.TB_APPLICATION.icus_gender
  is '被保人性别';
comment on column SXDXSJ.TB_APPLICATION.icus_name
  is '被保人姓名';
comment on column SXDXSJ.TB_APPLICATION.agent_id
  is '业务员工号';
comment on column SXDXSJ.TB_APPLICATION.total_fee
  is '总保费';
comment on column SXDXSJ.TB_APPLICATION.org_id
  is '实现数据权限过滤';
comment on column SXDXSJ.TB_APPLICATION.site_status
  is '是否退回现场（00-自留处理，01-已经退回现场）';
comment on column SXDXSJ.TB_APPLICATION.pro_status
  is '00-审核中，审核通过和审核不通过为NULL';
comment on column SXDXSJ.TB_APPLICATION.is_del
  is '是否删除（0为否，1为是）';
comment on column SXDXSJ.TB_APPLICATION.ob_com_id
  is '活动代码';
comment on column SXDXSJ.TB_APPLICATION.verify_status
  is '审核状态';
comment on column SXDXSJ.TB_APPLICATION.verify_note
  is '审核备注';
comment on column SXDXSJ.TB_APPLICATION.update_user
  is '修改人';
comment on column SXDXSJ.TB_APPLICATION.verify_date
  is '审核日期（审核通过时为成交日期）';
comment on column SXDXSJ.TB_APPLICATION.product_id
  is '产品ID';
comment on column SXDXSJ.TB_APPLICATION.export_flag
  is '是否已经导出到UNICALL（N：否；Y：是）';
comment on column SXDXSJ.TB_APPLICATION.export_time
  is '导出时间';
comment on column SXDXSJ.TB_APPLICATION.fee_desc
  is '保费明细';
comment on column SXDXSJ.TB_APPLICATION.population_tsmp
  is '发布时间戳';
alter table SXDXSJ.TB_APPLICATION
  add constraint PK_TB_APPLICATION unique (APPLICATION_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.TB_APPLICATION
  add constraint UK_TB_APPLICATION unique (APPNO)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TB_APPLICATION to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TB_APPLICATION to SXDXETL;
grant select, insert, update, delete on SXDXSJ.TB_APPLICATION to SXDXSJAPP;
grant select on SXDXSJ.TB_APPLICATION to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TB_APPLICATION to SXDXSJMOD;

prompt
prompt Creating table TB_APP_PRD_INFO
prompt ==============================
prompt
create table SXDXSJ.TB_APP_PRD_INFO
(
  app_prd_id      NUMBER(20) not null,
  application_id  VARCHAR2(18),
  ins_code        VARCHAR2(8),
  main_flag       VARCHAR2(1),
  amount          NUMBER(20,4),
  pay_lev         NUMBER(20,4),
  job_fee         NUMBER(20,4),
  pay_typ         VARCHAR2(2),
  pay_period      VARCHAR2(2),
  ins_period      VARCHAR2(10),
  ins_perd_typ    VARCHAR2(3),
  recv_typ        VARCHAR2(3),
  recv_age        NUMBER(3),
  fixed_plc_no    VARCHAR2(18),
  pieces          NUMBER(6,1),
  population_tsmp DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TB_APP_PRD_INFO
  is '投保单产品信息表';
comment on column SXDXSJ.TB_APP_PRD_INFO.application_id
  is '投保单ID';
comment on column SXDXSJ.TB_APP_PRD_INFO.ins_code
  is '险种代码';
comment on column SXDXSJ.TB_APP_PRD_INFO.main_flag
  is '主附险标志';
comment on column SXDXSJ.TB_APP_PRD_INFO.amount
  is '保额';
comment on column SXDXSJ.TB_APP_PRD_INFO.pay_lev
  is '缴费标准';
comment on column SXDXSJ.TB_APP_PRD_INFO.job_fee
  is '职业加费';
comment on column SXDXSJ.TB_APP_PRD_INFO.pay_typ
  is '缴费方式';
comment on column SXDXSJ.TB_APP_PRD_INFO.pay_period
  is '缴费年限';
comment on column SXDXSJ.TB_APP_PRD_INFO.ins_period
  is '保险期间';
comment on column SXDXSJ.TB_APP_PRD_INFO.ins_perd_typ
  is '保险期间类型';
comment on column SXDXSJ.TB_APP_PRD_INFO.recv_typ
  is '领取方式';
comment on column SXDXSJ.TB_APP_PRD_INFO.recv_age
  is '领取年龄';
comment on column SXDXSJ.TB_APP_PRD_INFO.fixed_plc_no
  is '定额保单序号(默认00)';
comment on column SXDXSJ.TB_APP_PRD_INFO.pieces
  is '份数';
comment on column SXDXSJ.TB_APP_PRD_INFO.population_tsmp
  is '发布时间戳';
create index SXDXSJ.IDX_TB_APP_PRD_INFO_01 on SXDXSJ.TB_APP_PRD_INFO (APPLICATION_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.TB_APP_PRD_INFO
  add constraint PK_TB_APP_PRD_INFO unique (APP_PRD_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TB_APP_PRD_INFO to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TB_APP_PRD_INFO to SXDXETL;
grant select, insert, update, delete on SXDXSJ.TB_APP_PRD_INFO to SXDXSJAPP;
grant select on SXDXSJ.TB_APP_PRD_INFO to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TB_APP_PRD_INFO to SXDXSJMOD;

prompt
prompt Creating table TB_AREA
prompt ======================
prompt
create table SXDXSJ.TB_AREA
(
  area_id         NUMBER(6) not null,
  area_num        NUMBER(6) not null,
  area_name       VARCHAR2(100) not null,
  area_fath       NUMBER not null,
  simple_name     VARCHAR2(20) not null,
  area_level      CHAR(1) not null,
  area_order      NUMBER,
  del_flg         CHAR(1) default '0' not null,
  create_user     VARCHAR2(24),
  create_time     DATE,
  update_user     VARCHAR2(24),
  update_time     DATE,
  city_cnt        NUMBER,
  area_cnt        NUMBER,
  population_tsmp DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TB_AREA
  is '地区维护表';
comment on column SXDXSJ.TB_AREA.area_id
  is '行政单位序号，递增';
comment on column SXDXSJ.TB_AREA.area_num
  is '行政单位代码，同国家分配代码，也是下级行政单位的父代码内容';
comment on column SXDXSJ.TB_AREA.area_name
  is '行政单位名称';
comment on column SXDXSJ.TB_AREA.area_fath
  is '行政单位父代码';
comment on column SXDXSJ.TB_AREA.simple_name
  is '行政单位简称';
comment on column SXDXSJ.TB_AREA.area_level
  is '行政单位级别 1:省级 2:地级市 3:区县';
comment on column SXDXSJ.TB_AREA.area_order
  is '表示顺序，省级行政单位必须，间隔10，其他行政单位默认100';
comment on column SXDXSJ.TB_AREA.del_flg
  is '是否被删除的标示 0 未删除 1 已删除';
comment on column SXDXSJ.TB_AREA.create_user
  is '创建人 初始创建人为0_Admin';
comment on column SXDXSJ.TB_AREA.create_time
  is '创建时间';
comment on column SXDXSJ.TB_AREA.update_user
  is '修改人 初始修改人为空';
comment on column SXDXSJ.TB_AREA.update_time
  is '修改时间';
comment on column SXDXSJ.TB_AREA.city_cnt
  is '包含的地级市数量';
comment on column SXDXSJ.TB_AREA.area_cnt
  is '包含的区县数量';
comment on column SXDXSJ.TB_AREA.population_tsmp
  is '发布时间戳';
grant select on SXDXSJ.TB_AREA to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TB_AREA to SXDXETL;
grant select, insert, update, delete on SXDXSJ.TB_AREA to SXDXSJAPP;
grant select on SXDXSJ.TB_AREA to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TB_AREA to SXDXSJMOD;

prompt
prompt Creating table TB_CODE
prompt ======================
prompt
create table SXDXSJ.TB_CODE
(
  code_scheme VARCHAR2(20) not null,
  code_name   VARCHAR2(20) not null,
  code_value  VARCHAR2(20) not null,
  code_remark VARCHAR2(20)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TB_CODE
  is '代码定义表';
comment on column SXDXSJ.TB_CODE.code_name
  is '代码名称';
comment on column SXDXSJ.TB_CODE.code_value
  is '代码值';
comment on column SXDXSJ.TB_CODE.code_remark
  is '备注';
grant select on SXDXSJ.TB_CODE to DXSJDBEXTR;
grant select on SXDXSJ.TB_CODE to SXDXETL;
grant select, insert, update, delete on SXDXSJ.TB_CODE to SXDXSJAPP;
grant select, insert, update, delete on SXDXSJ.TB_CODE to SXDXSJMOD;

prompt
prompt Creating table TB_COMPANY
prompt =========================
prompt
create table SXDXSJ.TB_COMPANY
(
  company_id           NUMBER(10) not null,
  parent_company_id    NUMBER(10),
  company_name         VARCHAR2(50),
  company_code         VARCHAR2(30),
  is_branch_company    VARCHAR2(2),
  is_delete            VARCHAR2(2),
  company_finance_code VARCHAR2(10),
  region_code          VARCHAR2(30),
  operate_user_code    VARCHAR2(20),
  operate_user_name    VARCHAR2(20),
  is_ff                VARCHAR2(2),
  company_type         VARCHAR2(2),
  population_tsmp      DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SXDXSJ.TB_COMPANY.company_id
  is '业务机构ID';
comment on column SXDXSJ.TB_COMPANY.parent_company_id
  is '父业务机构ID';
comment on column SXDXSJ.TB_COMPANY.company_name
  is '机构名称';
comment on column SXDXSJ.TB_COMPANY.company_code
  is '机构编码';
comment on column SXDXSJ.TB_COMPANY.is_branch_company
  is '是否是分公司';
comment on column SXDXSJ.TB_COMPANY.is_delete
  is '删除标识';
comment on column SXDXSJ.TB_COMPANY.company_finance_code
  is '财务机构编码';
comment on column SXDXSJ.TB_COMPANY.region_code
  is '区域编码';
comment on column SXDXSJ.TB_COMPANY.operate_user_code
  is '业务员编码';
comment on column SXDXSJ.TB_COMPANY.operate_user_name
  is '业务员姓名';
comment on column SXDXSJ.TB_COMPANY.is_ff
  is '配送保单时辅助判断是否长险：1 是，0 否';
comment on column SXDXSJ.TB_COMPANY.company_type
  is '机构类型：01:分公司;02:中支公司;03:内部职场;04:外包职场;';
comment on column SXDXSJ.TB_COMPANY.population_tsmp
  is '发布时间戳';
grant select on SXDXSJ.TB_COMPANY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TB_COMPANY to SXDXETL;
grant select, insert, update, delete on SXDXSJ.TB_COMPANY to SXDXSJAPP;
grant select on SXDXSJ.TB_COMPANY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TB_COMPANY to SXDXSJMOD;

prompt
prompt Creating table TB_CUSTOMER_LIST
prompt ===============================
prompt
create table SXDXSJ.TB_CUSTOMER_LIST
(
  cus_list_id          NUMBER(20) not null,
  cus_unique_ide       VARCHAR2(30),
  cus_name             VARCHAR2(64),
  cus_sex              VARCHAR2(6),
  task_id              NUMBER(19),
  org_center           NUMBER(19),
  org_proj             NUMBER(19),
  org_team             NUMBER(19),
  user_id              VARCHAR2(24),
  call_status          NUMBER(19),
  status               VARCHAR2(3),
  cus_birthday         VARCHAR2(10),
  cus_age              VARCHAR2(2),
  ide_type             VARCHAR2(2),
  ide_number           VARCHAR2(64),
  cus_metier           VARCHAR2(7),
  mobile               VARCHAR2(32),
  mobile1              VARCHAR2(32),
  mobile2              VARCHAR2(32),
  contect_tel          VARCHAR2(32),
  home_tel             VARCHAR2(32),
  off_tel              VARCHAR2(32),
  contect_tel_type     VARCHAR2(2),
  detailed_address     VARCHAR2(800),
  postcode             VARCHAR2(16),
  add_type             VARCHAR2(4),
  emergency_con_person VARCHAR2(64),
  emergency_con_tel    VARCHAR2(32),
  emer_con_relation    VARCHAR2(3),
  contact_detailed_add VARCHAR2(800),
  contact_postcode     VARCHAR2(6),
  cus_company          VARCHAR2(800),
  metier_level         VARCHAR2(7),
  marital_status       VARCHAR2(3),
  bank_name            VARCHAR2(100),
  bank_account_holder  VARCHAR2(64),
  bank_account         VARCHAR2(64),
  is_vip               VARCHAR2(6),
  batch_id             NUMBER(19) not null,
  org_id               NUMBER(10) not null,
  creat_user           VARCHAR2(24),
  creat_time           DATE,
  modify_person        VARCHAR2(24),
  modify_time          DATE,
  is_blacklist         VARCHAR2(2) default 0,
  fax                  VARCHAR2(20),
  res                  VARCHAR2(300),
  marital_id           VARCHAR2(50),
  assign_date          DATE,
  population_tsmp      DATE default sysdate,
  introduction_id      VARCHAR2(18),
  is_introduction      VARCHAR2(2) default 0
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SXDXSJ.TB_CUSTOMER_LIST.cus_list_id
  is '名单ID';
comment on column SXDXSJ.TB_CUSTOMER_LIST.cus_unique_ide
  is '客户唯一标识';
comment on column SXDXSJ.TB_CUSTOMER_LIST.cus_name
  is '客户姓名';
comment on column SXDXSJ.TB_CUSTOMER_LIST.cus_sex
  is '客户性别';
comment on column SXDXSJ.TB_CUSTOMER_LIST.task_id
  is '任务编号';
comment on column SXDXSJ.TB_CUSTOMER_LIST.org_center
  is '电销中心';
comment on column SXDXSJ.TB_CUSTOMER_LIST.org_proj
  is '项目';
comment on column SXDXSJ.TB_CUSTOMER_LIST.org_team
  is '团队';
comment on column SXDXSJ.TB_CUSTOMER_LIST.user_id
  is '座席ID';
comment on column SXDXSJ.TB_CUSTOMER_LIST.call_status
  is '1表示已拨打，0表示未拨打';
comment on column SXDXSJ.TB_CUSTOMER_LIST.status
  is '名单状态  1表示已分配，0表示未分配';
comment on column SXDXSJ.TB_CUSTOMER_LIST.cus_birthday
  is '出生日期';
comment on column SXDXSJ.TB_CUSTOMER_LIST.cus_age
  is '年龄';
comment on column SXDXSJ.TB_CUSTOMER_LIST.ide_type
  is '证件类型';
comment on column SXDXSJ.TB_CUSTOMER_LIST.ide_number
  is '证件号码';
comment on column SXDXSJ.TB_CUSTOMER_LIST.cus_metier
  is '客户职业';
comment on column SXDXSJ.TB_CUSTOMER_LIST.mobile
  is '移动电话';
comment on column SXDXSJ.TB_CUSTOMER_LIST.mobile1
  is '移动电话1';
comment on column SXDXSJ.TB_CUSTOMER_LIST.mobile2
  is '移动电话2';
comment on column SXDXSJ.TB_CUSTOMER_LIST.contect_tel
  is '联系电话';
comment on column SXDXSJ.TB_CUSTOMER_LIST.home_tel
  is '家庭电话';
comment on column SXDXSJ.TB_CUSTOMER_LIST.off_tel
  is '单位电话';
comment on column SXDXSJ.TB_CUSTOMER_LIST.contect_tel_type
  is '联系电话类型（常用电话标志）';
comment on column SXDXSJ.TB_CUSTOMER_LIST.detailed_address
  is '地址_详址';
comment on column SXDXSJ.TB_CUSTOMER_LIST.postcode
  is '地址_邮编';
comment on column SXDXSJ.TB_CUSTOMER_LIST.add_type
  is '地址类型';
comment on column SXDXSJ.TB_CUSTOMER_LIST.emergency_con_person
  is '紧急联络人（姓名）';
comment on column SXDXSJ.TB_CUSTOMER_LIST.emergency_con_tel
  is '紧急联络人（电话）';
comment on column SXDXSJ.TB_CUSTOMER_LIST.emer_con_relation
  is '紧急联络人与客户关系';
comment on column SXDXSJ.TB_CUSTOMER_LIST.contact_detailed_add
  is '联络地址_详址';
comment on column SXDXSJ.TB_CUSTOMER_LIST.contact_postcode
  is '联络地址邮编';
comment on column SXDXSJ.TB_CUSTOMER_LIST.cus_company
  is '工作单位';
comment on column SXDXSJ.TB_CUSTOMER_LIST.metier_level
  is '职业等级';
comment on column SXDXSJ.TB_CUSTOMER_LIST.marital_status
  is '婚姻状况';
comment on column SXDXSJ.TB_CUSTOMER_LIST.bank_name
  is '银行（开户行）';
comment on column SXDXSJ.TB_CUSTOMER_LIST.bank_account_holder
  is '银行开户人（银行账户姓名）';
comment on column SXDXSJ.TB_CUSTOMER_LIST.bank_account
  is '银行账户（帐号）';
comment on column SXDXSJ.TB_CUSTOMER_LIST.is_vip
  is '是否寿险VIP';
comment on column SXDXSJ.TB_CUSTOMER_LIST.batch_id
  is '批次ID';
comment on column SXDXSJ.TB_CUSTOMER_LIST.org_id
  is '机构流水号';
comment on column SXDXSJ.TB_CUSTOMER_LIST.creat_user
  is '创建人(默认系统)';
comment on column SXDXSJ.TB_CUSTOMER_LIST.creat_time
  is '创建时间';
comment on column SXDXSJ.TB_CUSTOMER_LIST.modify_person
  is '修改人(最后一次修改)';
comment on column SXDXSJ.TB_CUSTOMER_LIST.modify_time
  is '修改时间(最后一次修改)';
comment on column SXDXSJ.TB_CUSTOMER_LIST.is_blacklist
  is '是否红黑名单 默认0  红黑名单为1';
comment on column SXDXSJ.TB_CUSTOMER_LIST.fax
  is '传真';
comment on column SXDXSJ.TB_CUSTOMER_LIST.res
  is '备注';
comment on column SXDXSJ.TB_CUSTOMER_LIST.marital_id
  is '职业';
comment on column SXDXSJ.TB_CUSTOMER_LIST.assign_date
  is '分配或调配时间';
comment on column SXDXSJ.TB_CUSTOMER_LIST.population_tsmp
  is '发布时间戳';
comment on column SXDXSJ.TB_CUSTOMER_LIST.introduction_id
  is '转介绍ID';
comment on column SXDXSJ.TB_CUSTOMER_LIST.is_introduction
  is '是否是转介绍名单 0=不是 1=是';
create index SXDXSJ.IDX_TB_CUSTOMER_LIST_01 on SXDXSJ.TB_CUSTOMER_LIST (BATCH_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_TB_CUSTOMER_LIST_02 on SXDXSJ.TB_CUSTOMER_LIST (ORG_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_TB_CUSTOMER_LIST_03 on SXDXSJ.TB_CUSTOMER_LIST (USER_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index SXDXSJ.UK_TB_CUSTOMER_LIST_01 on SXDXSJ.TB_CUSTOMER_LIST (TASK_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.TB_CUSTOMER_LIST
  add constraint PK_TB_CUSTOMER_CUS_LIST_ID primary key (CUS_LIST_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TB_CUSTOMER_LIST to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TB_CUSTOMER_LIST to SXDXETL;
grant select, insert, update, delete on SXDXSJ.TB_CUSTOMER_LIST to SXDXSJAPP;
grant select on SXDXSJ.TB_CUSTOMER_LIST to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TB_CUSTOMER_LIST to SXDXSJMOD;

prompt
prompt Creating table TB_LOG
prompt =====================
prompt
create table SXDXSJ.TB_LOG
(
  id              VARCHAR2(18) not null,
  ttime           DATE,
  idsort          CHAR(4),
  idobj           VARCHAR2(18),
  content         VARCHAR2(2000),
  population_tsmp DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TB_LOG
  is '投保单提交日志表';
grant select, insert, update, delete on SXDXSJ.TB_LOG to SXDXETL;

prompt
prompt Creating table TB_OB_COM
prompt ========================
prompt
create table SXDXSJ.TB_OB_COM
(
  ob_com_id       NUMBER(10) not null,
  ob_com_name     VARCHAR2(1024),
  sta_dat         DATE,
  ob_com_sta      CHAR(1),
  center          NUMBER(10),
  namlst_type     VARCHAR2(2),
  recv_type       CHAR(1),
  pay_type        VARCHAR2(8),
  repay_type      VARCHAR2(8),
  company_id      NUMBER(10),
  create_dat      DATE not null,
  creator         VARCHAR2(20) not null,
  modify_dat      DATE,
  modifier        VARCHAR2(20),
  prj_id          NUMBER(10),
  ob_com_code     VARCHAR2(20),
  population_tsmp DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TB_OB_COM
  is '活动管理';
comment on column SXDXSJ.TB_OB_COM.ob_com_id
  is '活动主键';
comment on column SXDXSJ.TB_OB_COM.ob_com_sta
  is '3-正常;4-删除.从标识字典中取';
comment on column SXDXSJ.TB_OB_COM.center
  is '从组织架构中读出';
comment on column SXDXSJ.TB_OB_COM.namlst_type
  is '从字典中取';
comment on column SXDXSJ.TB_OB_COM.recv_type
  is '1-先收费,2-出单,从标识字典表中获取';
comment on column SXDXSJ.TB_OB_COM.pay_type
  is '转账，现金，支票，POS';
comment on column SXDXSJ.TB_OB_COM.repay_type
  is '转账，现金，支票，POS';
comment on column SXDXSJ.TB_OB_COM.create_dat
  is '创建时间';
comment on column SXDXSJ.TB_OB_COM.creator
  is '创建人';
comment on column SXDXSJ.TB_OB_COM.modify_dat
  is '修改时间';
comment on column SXDXSJ.TB_OB_COM.modifier
  is '修改人';
comment on column SXDXSJ.TB_OB_COM.prj_id
  is '项目ID';
comment on column SXDXSJ.TB_OB_COM.ob_com_code
  is '活动代码';
comment on column SXDXSJ.TB_OB_COM.population_tsmp
  is '发布时间戳';
create index SXDXSJ.IDX_TB_OB_COM_01 on SXDXSJ.TB_OB_COM (PRJ_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.TB_OB_COM
  add constraint PK_OB_COM_ID primary key (OB_COM_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TB_OB_COM to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TB_OB_COM to SXDXETL;
grant select, insert, update, delete on SXDXSJ.TB_OB_COM to SXDXSJAPP;
grant select on SXDXSJ.TB_OB_COM to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TB_OB_COM to SXDXSJMOD;

prompt
prompt Creating table TB_ORGANIZATION
prompt ==============================
prompt
create table SXDXSJ.TB_ORGANIZATION
(
  org_id          NUMBER(10) not null,
  org_name        VARCHAR2(64) not null,
  company_id      NUMBER(10),
  parent_org_id   NUMBER(10) not null,
  org_level       NUMBER(2) not null,
  org_desc        VARCHAR2(500),
  org_type        CHAR(2),
  org_code        VARCHAR2(20),
  is_del          CHAR(1) not null,
  create_user     VARCHAR2(24) not null,
  create_time     DATE not null,
  update_user     VARCHAR2(24),
  update_time     DATE,
  population_tsmp DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TB_ORGANIZATION
  is '组织机构';
comment on column SXDXSJ.TB_ORGANIZATION.org_id
  is '机构流水号';
comment on column SXDXSJ.TB_ORGANIZATION.org_name
  is '机构名称';
comment on column SXDXSJ.TB_ORGANIZATION.company_id
  is '业务机构ID';
comment on column SXDXSJ.TB_ORGANIZATION.parent_org_id
  is '上级机构ID';
comment on column SXDXSJ.TB_ORGANIZATION.org_level
  is '机构级别  0:总公司 1:电销总中心 2:电销分中心 3:项目 4:团队';
comment on column SXDXSJ.TB_ORGANIZATION.org_desc
  is '机构备注';
comment on column SXDXSJ.TB_ORGANIZATION.org_type
  is '机构类型';
comment on column SXDXSJ.TB_ORGANIZATION.org_code
  is '机构代码';
comment on column SXDXSJ.TB_ORGANIZATION.is_del
  is '删除标志';
comment on column SXDXSJ.TB_ORGANIZATION.create_user
  is '创建人';
comment on column SXDXSJ.TB_ORGANIZATION.create_time
  is '创建时间';
comment on column SXDXSJ.TB_ORGANIZATION.update_user
  is '修改人';
comment on column SXDXSJ.TB_ORGANIZATION.update_time
  is '修改时间';
comment on column SXDXSJ.TB_ORGANIZATION.population_tsmp
  is '发布时间戳';
grant select on SXDXSJ.TB_ORGANIZATION to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TB_ORGANIZATION to SXDXETL;
grant select, insert, update, delete on SXDXSJ.TB_ORGANIZATION to SXDXSJAPP;
grant select on SXDXSJ.TB_ORGANIZATION to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TB_ORGANIZATION to SXDXSJMOD;

prompt
prompt Creating table TB_ORG_USERINFO
prompt ==============================
prompt
create table SXDXSJ.TB_ORG_USERINFO
(
  row_no     NUMBER(4) not null,
  org_id     NUMBER(10) not null,
  org_name   VARCHAR2(64) not null,
  user_code  VARCHAR2(50) not null,
  user_name  VARCHAR2(50) not null,
  user_email VARCHAR2(100) not null,
  notes      VARCHAR2(500),
  active     CHAR(1) default 1,
  creator    VARCHAR2(50) default 'admin',
  createtime DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TB_ORG_USERINFO
  is '机构与用户信息关系表（报表邮件发送专用）';
comment on column SXDXSJ.TB_ORG_USERINFO.row_no
  is '行标号';
comment on column SXDXSJ.TB_ORG_USERINFO.org_id
  is '机构编码';
comment on column SXDXSJ.TB_ORG_USERINFO.org_name
  is '机构名称';
comment on column SXDXSJ.TB_ORG_USERINFO.user_code
  is '用户编码';
comment on column SXDXSJ.TB_ORG_USERINFO.user_name
  is '用户名称';
comment on column SXDXSJ.TB_ORG_USERINFO.user_email
  is '用户Email地址';
comment on column SXDXSJ.TB_ORG_USERINFO.notes
  is '备注';
comment on column SXDXSJ.TB_ORG_USERINFO.active
  is '有效状态：1 默认有效；0失效';
comment on column SXDXSJ.TB_ORG_USERINFO.creator
  is '创建者：默认是admin';
comment on column SXDXSJ.TB_ORG_USERINFO.createtime
  is '系统时间：默认是sysdate';
create index SXDXSJ.IDX_ORGID on SXDXSJ.TB_ORG_USERINFO (ORG_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.TB_ORG_USERINFO
  add constraint PK_ROWNO primary key (ROW_NO)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TB_ORG_USERINFO to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TB_ORG_USERINFO to SXDXSJAPP;
grant select, insert, update, delete on SXDXSJ.TB_ORG_USERINFO to SXDXSJMOD;

prompt
prompt Creating table TB_PROJECT_INFO
prompt ==============================
prompt
create table SXDXSJ.TB_PROJECT_INFO
(
  prj_id          NUMBER(10) not null,
  grp_id          NUMBER(10),
  prj_name        VARCHAR2(100) not null,
  prj_status      VARCHAR2(2) not null,
  sale_cha        VARCHAR2(2),
  ins_src         VARCHAR2(2),
  oc_id           NUMBER(10),
  file_fmt        VARCHAR2(2),
  memo            VARCHAR2(300),
  sign_typ        VARCHAR2(2),
  deli_typ        VARCHAR2(2),
  bank_flag       CHAR(1),
  prj_typ         VARCHAR2(2),
  cus_typ         VARCHAR2(2),
  org_id          NUMBER(10),
  create_dat      DATE not null,
  creator         VARCHAR2(20) not null,
  modify_dat      DATE,
  modifier        VARCHAR2(20),
  population_tsmp DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SXDXSJ.TB_PROJECT_INFO.prj_id
  is '项目ID';
comment on column SXDXSJ.TB_PROJECT_INFO.grp_id
  is '项目群ID';
comment on column SXDXSJ.TB_PROJECT_INFO.prj_name
  is '项目名称';
comment on column SXDXSJ.TB_PROJECT_INFO.prj_status
  is '是否有效,1-有效;2-无效';
comment on column SXDXSJ.TB_PROJECT_INFO.sale_cha
  is '销售渠道';
comment on column SXDXSJ.TB_PROJECT_INFO.ins_src
  is '投保单来源';
comment on column SXDXSJ.TB_PROJECT_INFO.oc_id
  is '相关外包公司';
comment on column SXDXSJ.TB_PROJECT_INFO.file_fmt
  is '导入文件格式';
comment on column SXDXSJ.TB_PROJECT_INFO.memo
  is '项目说明';
comment on column SXDXSJ.TB_PROJECT_INFO.sign_typ
  is '出单方式';
comment on column SXDXSJ.TB_PROJECT_INFO.bank_flag
  is '是否银保通';
comment on column SXDXSJ.TB_PROJECT_INFO.prj_typ
  is '项目类别';
comment on column SXDXSJ.TB_PROJECT_INFO.cus_typ
  is '客户类别';
comment on column SXDXSJ.TB_PROJECT_INFO.org_id
  is '业务机构,项目所属机构';
comment on column SXDXSJ.TB_PROJECT_INFO.create_dat
  is '创建时间';
comment on column SXDXSJ.TB_PROJECT_INFO.creator
  is '创建人';
comment on column SXDXSJ.TB_PROJECT_INFO.modify_dat
  is '修改时间';
comment on column SXDXSJ.TB_PROJECT_INFO.modifier
  is '修改人';
comment on column SXDXSJ.TB_PROJECT_INFO.population_tsmp
  is '发布时间戳';
alter table SXDXSJ.TB_PROJECT_INFO
  add constraint PK_TB_PROJECT_INFO_PRJ_ID unique (PRJ_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TB_PROJECT_INFO to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TB_PROJECT_INFO to SXDXETL;
grant select, insert, update, delete on SXDXSJ.TB_PROJECT_INFO to SXDXSJAPP;
grant select on SXDXSJ.TB_PROJECT_INFO to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TB_PROJECT_INFO to SXDXSJMOD;

prompt
prompt Creating table TB_RPT_USER
prompt ==========================
prompt
create table SXDXSJ.TB_RPT_USER
(
  user_email VARCHAR2(100) not null,
  user_name  VARCHAR2(50) not null,
  rpt_id     NUMBER,
  rpt_name   VARCHAR2(22),
  active     CHAR(1) default 1,
  creator    VARCHAR2(50) default 'admin',
  createtime DATE default sysdate,
  updatetime DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TB_RPT_USER
  is '报表与用户关系表（报表邮件发送专用）';
comment on column SXDXSJ.TB_RPT_USER.user_email
  is '用户Email地址';
comment on column SXDXSJ.TB_RPT_USER.user_name
  is '用户名称';
comment on column SXDXSJ.TB_RPT_USER.rpt_id
  is '报表编码';
comment on column SXDXSJ.TB_RPT_USER.rpt_name
  is '报表名称';
comment on column SXDXSJ.TB_RPT_USER.active
  is '有效状态：1 默认生效；0失效';
comment on column SXDXSJ.TB_RPT_USER.creator
  is '创建者：默认是admin';
comment on column SXDXSJ.TB_RPT_USER.createtime
  is '系统时间：默认是sysdate';
comment on column SXDXSJ.TB_RPT_USER.updatetime
  is '更新时间';
grant select, insert, update, delete on SXDXSJ.TB_RPT_USER to SXDXSJAPP;
grant select, insert, update, delete on SXDXSJ.TB_RPT_USER to SXDXSJMOD;

prompt
prompt Creating table TB_SALE_BATCH
prompt ============================
prompt
create table SXDXSJ.TB_SALE_BATCH
(
  batch_id        NUMBER(19) not null,
  ob_com_id       NUMBER(10),
  upload_way      VARCHAR2(16),
  assign_way      VARCHAR2(32),
  batch_name      VARCHAR2(128) not null,
  batch_code      VARCHAR2(128) not null,
  com_type        VARCHAR2(512),
  call_date       DATE,
  remove_date     DATE,
  call_year_month VARCHAR2(19),
  org_center      NUMBER(19),
  org_pro         NUMBER(19),
  org_team        NUMBER(19),
  gerenerate_info NUMBER(19),
  create_user     VARCHAR2(24) not null,
  create_time     DATE not null,
  update_user     VARCHAR2(24),
  update_time     DATE,
  file_name       VARCHAR2(255),
  log_content     VARCHAR2(512),
  belongcity      NUMBER(19),
  com_seriars     VARCHAR2(512),
  call_times      NUMBER(1),
  success         NUMBER(10),
  failure         NUMBER(10),
  population_tsmp DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SXDXSJ.TB_SALE_BATCH.batch_id
  is '批次ID';
comment on column SXDXSJ.TB_SALE_BATCH.ob_com_id
  is '活动ID';
comment on column SXDXSJ.TB_SALE_BATCH.upload_way
  is '上载方式  1.手动上载  2.自动上载';
comment on column SXDXSJ.TB_SALE_BATCH.assign_way
  is '下发方式  1. 上载到组织   2.直接下发到座席';
comment on column SXDXSJ.TB_SALE_BATCH.batch_name
  is '批次名称';
comment on column SXDXSJ.TB_SALE_BATCH.batch_code
  is '批次编码';
comment on column SXDXSJ.TB_SALE_BATCH.com_type
  is '名单分类  字典表';
comment on column SXDXSJ.TB_SALE_BATCH.call_date
  is '开始拨打日期';
comment on column SXDXSJ.TB_SALE_BATCH.remove_date
  is '回收日期';
comment on column SXDXSJ.TB_SALE_BATCH.call_year_month
  is '拨打年月';
comment on column SXDXSJ.TB_SALE_BATCH.org_center
  is '中心';
comment on column SXDXSJ.TB_SALE_BATCH.org_pro
  is '项目';
comment on column SXDXSJ.TB_SALE_BATCH.org_team
  is '团队';
comment on column SXDXSJ.TB_SALE_BATCH.gerenerate_info
  is '上载名单数';
comment on column SXDXSJ.TB_SALE_BATCH.create_user
  is '上载人';
comment on column SXDXSJ.TB_SALE_BATCH.create_time
  is '上载时间';
comment on column SXDXSJ.TB_SALE_BATCH.update_user
  is '修改人';
comment on column SXDXSJ.TB_SALE_BATCH.update_time
  is '修改时间';
comment on column SXDXSJ.TB_SALE_BATCH.file_name
  is '文件名';
comment on column SXDXSJ.TB_SALE_BATCH.log_content
  is '日志内容';
comment on column SXDXSJ.TB_SALE_BATCH.belongcity
  is '所属城市';
comment on column SXDXSJ.TB_SALE_BATCH.com_seriars
  is '名单类型   字典表';
comment on column SXDXSJ.TB_SALE_BATCH.call_times
  is '拨打次数：1-首拨、2-二拨、3-三拨';
comment on column SXDXSJ.TB_SALE_BATCH.success
  is '导入名单成功数';
comment on column SXDXSJ.TB_SALE_BATCH.failure
  is '导入名单失败数';
comment on column SXDXSJ.TB_SALE_BATCH.population_tsmp
  is '发布时间戳';
create index SXDXSJ.IDX_TB_SALE_BATCH_01 on SXDXSJ.TB_SALE_BATCH (CALL_YEAR_MONTH)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_TB_SALE_BATCH_02 on SXDXSJ.TB_SALE_BATCH (OB_COM_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.TB_SALE_BATCH
  add constraint PK_BATCH_ID primary key (BATCH_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TB_SALE_BATCH to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TB_SALE_BATCH to SXDXETL;
grant select, insert, update, delete on SXDXSJ.TB_SALE_BATCH to SXDXSJAPP;
grant select on SXDXSJ.TB_SALE_BATCH to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TB_SALE_BATCH to SXDXSJMOD;

prompt
prompt Creating table TB_SALE_HISTORY
prompt ==============================
prompt
create table SXDXSJ.TB_SALE_HISTORY
(
  history_id          NUMBER(18) not null,
  cus_list_id         NUMBER(20),
  customer_id         VARCHAR2(32),
  obcom_id            NUMBER(10),
  activity_name       VARCHAR2(256),
  user_id             VARCHAR2(24),
  user_name           VARCHAR2(32),
  contact_phone       VARCHAR2(20),
  first_result        NUMBER(1),
  second_result       NUMBER(3),
  is_contact          CHAR(1),
  is_through          CHAR(1),
  callover_time       DATE,
  appoint_time        DATE,
  memo                VARCHAR2(256),
  configuration       VARCHAR2(1024),
  task_id             NUMBER(18),
  task_status         VARCHAR2(32),
  task_type           VARCHAR2(32),
  policy_id           VARCHAR2(30),
  policy_status       VARCHAR2(32),
  create_history_date DATE,
  ext                 VARCHAR2(2000),
  call_duration       VARCHAR2(10),
  callstart_time      DATE,
  population_tsmp     DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TB_SALE_HISTORY
  is '销售历史表';
comment on column SXDXSJ.TB_SALE_HISTORY.history_id
  is '销售历史ID';
comment on column SXDXSJ.TB_SALE_HISTORY.cus_list_id
  is '名单ID';
comment on column SXDXSJ.TB_SALE_HISTORY.customer_id
  is '客户唯一标识';
comment on column SXDXSJ.TB_SALE_HISTORY.obcom_id
  is '活动ID';
comment on column SXDXSJ.TB_SALE_HISTORY.activity_name
  is '活动名称';
comment on column SXDXSJ.TB_SALE_HISTORY.user_id
  is '执行者（当前操作员）';
comment on column SXDXSJ.TB_SALE_HISTORY.user_name
  is '执行者（操作员名称）';
comment on column SXDXSJ.TB_SALE_HISTORY.contact_phone
  is '联系电话';
comment on column SXDXSJ.TB_SALE_HISTORY.first_result
  is '一级电销结果';
comment on column SXDXSJ.TB_SALE_HISTORY.second_result
  is '二级电销结果';
comment on column SXDXSJ.TB_SALE_HISTORY.is_contact
  is '接触情况（0：未接触，1：已接触）';
comment on column SXDXSJ.TB_SALE_HISTORY.is_through
  is '拨通情况（0：未拨通，1：已拨通）';
comment on column SXDXSJ.TB_SALE_HISTORY.callover_time
  is '通话结束时间';
comment on column SXDXSJ.TB_SALE_HISTORY.appoint_time
  is '预约回妨时间';
comment on column SXDXSJ.TB_SALE_HISTORY.memo
  is '备注';
comment on column SXDXSJ.TB_SALE_HISTORY.configuration
  is '其它属性字段集（以回车区分，KEY/VALUE键值对保存）';
comment on column SXDXSJ.TB_SALE_HISTORY.task_id
  is '任务编号';
comment on column SXDXSJ.TB_SALE_HISTORY.task_status
  is '任务状态';
comment on column SXDXSJ.TB_SALE_HISTORY.task_type
  is '任务类型';
comment on column SXDXSJ.TB_SALE_HISTORY.policy_id
  is '投保单编号';
comment on column SXDXSJ.TB_SALE_HISTORY.policy_status
  is '投保单状态';
comment on column SXDXSJ.TB_SALE_HISTORY.create_history_date
  is '历史生成时间';
comment on column SXDXSJ.TB_SALE_HISTORY.ext
  is '扩展字段';
comment on column SXDXSJ.TB_SALE_HISTORY.call_duration
  is '通话时长';
comment on column SXDXSJ.TB_SALE_HISTORY.callstart_time
  is '通话开始时间';
create index SXDXSJ.IDX_TB_SALE_HISTORY_01 on SXDXSJ.TB_SALE_HISTORY (CREATE_HISTORY_DATE)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_TB_SALE_HISTORY_02 on SXDXSJ.TB_SALE_HISTORY (CUS_LIST_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_TB_SALE_HISTORY_03 on SXDXSJ.TB_SALE_HISTORY (POLICY_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_TB_SALE_HISTORY_04 on SXDXSJ.TB_SALE_HISTORY (TASK_STATUS)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_TB_SALE_HISTORY_05 on SXDXSJ.TB_SALE_HISTORY (TASK_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.TB_SALE_HISTORY
  add constraint PK_TB_SALE_HISTORY primary key (HISTORY_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TB_SALE_HISTORY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TB_SALE_HISTORY to SXDXETL;
grant select, insert, update, delete on SXDXSJ.TB_SALE_HISTORY to SXDXSJAPP;
grant select on SXDXSJ.TB_SALE_HISTORY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TB_SALE_HISTORY to SXDXSJMOD;

prompt
prompt Creating table TB_TASK
prompt ======================
prompt
create table SXDXSJ.TB_TASK
(
  task_id         NUMBER(18) not null,
  task_level      NUMBER(5) default 60,
  create_time     DATE default SYSDATE not null,
  change_time     DATE,
  is_important    CHAR(1),
  appoint_time    DATE,
  active_status   CHAR(1) default 0 not null,
  task_memo       VARCHAR2(256),
  callresult_type NUMBER(3) default 1,
  first_result    NUMBER(1),
  second_result   NUMBER(3),
  user_id         VARCHAR2(24),
  org_id          NUMBER(10) not null,
  status_id       NUMBER(5) not null,
  type_id         NUMBER(5) default 4 not null,
  policy_id       VARCHAR2(30),
  batch_id        NUMBER(19) not null,
  cus_list_id     NUMBER(20) not null,
  ext1            VARCHAR2(2000),
  ext2            VARCHAR2(256),
  ext3            VARCHAR2(256),
  ext4            VARCHAR2(256),
  ob_com_id       NUMBER(10) not null,
  population_tsmp DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TB_TASK
  is '任务表';
comment on column SXDXSJ.TB_TASK.task_id
  is '任务ID';
comment on column SXDXSJ.TB_TASK.task_level
  is '优化级';
comment on column SXDXSJ.TB_TASK.create_time
  is '任务创建时间';
comment on column SXDXSJ.TB_TASK.change_time
  is '最后改变时间';
comment on column SXDXSJ.TB_TASK.is_important
  is '是否重点提醒（删除）';
comment on column SXDXSJ.TB_TASK.appoint_time
  is '预约时间';
comment on column SXDXSJ.TB_TASK.active_status
  is '激活状态';
comment on column SXDXSJ.TB_TASK.task_memo
  is '任务说明';
comment on column SXDXSJ.TB_TASK.callresult_type
  is '拨打小节模板(跟踪销售=1 问题件=2 订单审核=3 内呼咨询=4)';
comment on column SXDXSJ.TB_TASK.first_result
  is '拨打小节一级结果';
comment on column SXDXSJ.TB_TASK.second_result
  is '拨打小节二级结果';
comment on column SXDXSJ.TB_TASK.user_id
  is '所属座席';
comment on column SXDXSJ.TB_TASK.org_id
  is '所属机构';
comment on column SXDXSJ.TB_TASK.status_id
  is '状态编号';
comment on column SXDXSJ.TB_TASK.type_id
  is '类型编号';
comment on column SXDXSJ.TB_TASK.policy_id
  is '投保单ID';
comment on column SXDXSJ.TB_TASK.batch_id
  is '批次ID';
comment on column SXDXSJ.TB_TASK.cus_list_id
  is '名单ID';
comment on column SXDXSJ.TB_TASK.ob_com_id
  is '活动ID';
comment on column SXDXSJ.TB_TASK.population_tsmp
  is '发布时间戳';
create index SXDXSJ.IDX_TB_TASK_01 on SXDXSJ.TB_TASK (BATCH_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_TB_TASK_02 on SXDXSJ.TB_TASK (CHANGE_TIME)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_TB_TASK_03 on SXDXSJ.TB_TASK (STATUS_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_TB_TASK_04 on SXDXSJ.TB_TASK (TYPE_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_TB_TASK_05 on SXDXSJ.TB_TASK (CUS_LIST_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.TB_TASK
  add constraint PK_TB_TASK_TASK_ID primary key (TASK_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TB_TASK to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TB_TASK to SXDXETL;
grant select, insert, update, delete on SXDXSJ.TB_TASK to SXDXSJAPP;
grant select on SXDXSJ.TB_TASK to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TB_TASK to SXDXSJMOD;

prompt
prompt Creating table TB_TASK_HISTORY
prompt ==============================
prompt
create table SXDXSJ.TB_TASK_HISTORY
(
  history_id          NUMBER(18) not null,
  task_id             NUMBER(18),
  task_level          NUMBER(5),
  create_time         DATE,
  change_time         DATE,
  is_important        CHAR(1),
  appoint_time        DATE,
  active_status       CHAR(1),
  task_memo           VARCHAR2(256),
  callresult_type     NUMBER(3),
  first_result        NUMBER(1),
  second_result       NUMBER(3),
  user_id             VARCHAR2(24),
  org_id              NUMBER(10),
  status_id           NUMBER(5),
  type_id             NUMBER(5),
  policy_id           VARCHAR2(30),
  ob_com_id           NUMBER(10),
  batch_id            NUMBER(19),
  cus_list_id         NUMBER(20),
  create_history_date DATE,
  ext1                VARCHAR2(2000),
  ext2                VARCHAR2(256),
  ext3                VARCHAR2(256),
  ext4                VARCHAR2(256),
  population_tsmp     DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TB_TASK_HISTORY
  is '任务历史表';
comment on column SXDXSJ.TB_TASK_HISTORY.history_id
  is '销售历史编号';
comment on column SXDXSJ.TB_TASK_HISTORY.task_id
  is '任务ID';
comment on column SXDXSJ.TB_TASK_HISTORY.task_level
  is '优先级';
comment on column SXDXSJ.TB_TASK_HISTORY.create_time
  is '任务创建时间';
comment on column SXDXSJ.TB_TASK_HISTORY.change_time
  is '任务最后变化时间';
comment on column SXDXSJ.TB_TASK_HISTORY.is_important
  is '是否重点提醒';
comment on column SXDXSJ.TB_TASK_HISTORY.appoint_time
  is '预约时间';
comment on column SXDXSJ.TB_TASK_HISTORY.active_status
  is '激活状态';
comment on column SXDXSJ.TB_TASK_HISTORY.task_memo
  is '任务说明';
comment on column SXDXSJ.TB_TASK_HISTORY.callresult_type
  is '最后拨打小节';
comment on column SXDXSJ.TB_TASK_HISTORY.first_result
  is '拨打一级结果';
comment on column SXDXSJ.TB_TASK_HISTORY.second_result
  is '拨打二级结果';
comment on column SXDXSJ.TB_TASK_HISTORY.user_id
  is '所属座席ID';
comment on column SXDXSJ.TB_TASK_HISTORY.org_id
  is '所属机构';
comment on column SXDXSJ.TB_TASK_HISTORY.status_id
  is '任务状态';
comment on column SXDXSJ.TB_TASK_HISTORY.type_id
  is '任务类型';
comment on column SXDXSJ.TB_TASK_HISTORY.policy_id
  is '保单号';
comment on column SXDXSJ.TB_TASK_HISTORY.ob_com_id
  is '活动编号';
comment on column SXDXSJ.TB_TASK_HISTORY.batch_id
  is '批次ID';
comment on column SXDXSJ.TB_TASK_HISTORY.cus_list_id
  is '名单ID';
comment on column SXDXSJ.TB_TASK_HISTORY.create_history_date
  is '历史任务生成时间';
comment on column SXDXSJ.TB_TASK_HISTORY.ext1
  is '扩展字段2';
comment on column SXDXSJ.TB_TASK_HISTORY.ext2
  is '扩展字段2';
comment on column SXDXSJ.TB_TASK_HISTORY.ext3
  is '扩展字段3';
comment on column SXDXSJ.TB_TASK_HISTORY.ext4
  is '扩展字段4';
comment on column SXDXSJ.TB_TASK_HISTORY.population_tsmp
  is '发布时间戳';
create index SXDXSJ.IDX_TB_TASK_HISTORY_01 on SXDXSJ.TB_TASK_HISTORY (CREATE_HISTORY_DATE)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_TB_TASK_HISTORY_02 on SXDXSJ.TB_TASK_HISTORY (TASK_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_TB_TASK_HISTORY_03 on SXDXSJ.TB_TASK_HISTORY (BATCH_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_TB_TASK_HISTORY_04 on SXDXSJ.TB_TASK_HISTORY (OB_COM_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_TB_TASK_HISTORY_05 on SXDXSJ.TB_TASK_HISTORY (CHANGE_TIME)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_TB_TASK_HISTORY_06 on SXDXSJ.TB_TASK_HISTORY (CUS_LIST_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_TB_TASK_HISTORY_07 on SXDXSJ.TB_TASK_HISTORY (STATUS_ID, TYPE_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.TB_TASK_HISTORY
  add constraint PK_TB_TASK_HISTORY_ID primary key (HISTORY_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TB_TASK_HISTORY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TB_TASK_HISTORY to SXDXETL;
grant select, insert, update, delete on SXDXSJ.TB_TASK_HISTORY to SXDXSJAPP;
grant select on SXDXSJ.TB_TASK_HISTORY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TB_TASK_HISTORY to SXDXSJMOD;

prompt
prompt Creating table TB_WORKPLACE
prompt ===========================
prompt
create table SXDXSJ.TB_WORKPLACE
(
  workplace_id    NUMBER(10) not null,
  org_id          NUMBER(10) not null,
  workplace_name  VARCHAR2(40) not null,
  softphone_url   VARCHAR2(40) not null,
  cti_address     VARCHAR2(50) not null,
  cti_port        VARCHAR2(10) not null,
  workplace_type  CHAR(1) not null,
  contact_name    VARCHAR2(40),
  contact_phone   VARCHAR2(40),
  contact_address VARCHAR2(100),
  contact_comment VARCHAR2(256),
  ivr_group_num   VARCHAR2(10),
  is_del          CHAR(1) not null,
  voice_address   VARCHAR2(100),
  create_user     VARCHAR2(24),
  create_time     DATE,
  update_user     VARCHAR2(24),
  update_time     DATE,
  population_tsmp DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TB_WORKPLACE
  is '职场管理';
comment on column SXDXSJ.TB_WORKPLACE.workplace_id
  is '职场管理表中的职场编号';
comment on column SXDXSJ.TB_WORKPLACE.org_id
  is '机构流水号';
comment on column SXDXSJ.TB_WORKPLACE.workplace_name
  is '职场管理表中的职场名称';
comment on column SXDXSJ.TB_WORKPLACE.softphone_url
  is '职场管理表中的软电话URL';
comment on column SXDXSJ.TB_WORKPLACE.cti_address
  is '职场管理表中的CTI地址';
comment on column SXDXSJ.TB_WORKPLACE.cti_port
  is '职场管理表中的CTI端口';
comment on column SXDXSJ.TB_WORKPLACE.workplace_type
  is '职场管理表中的职场类型';
comment on column SXDXSJ.TB_WORKPLACE.contact_name
  is '职场管理表中的联系人';
comment on column SXDXSJ.TB_WORKPLACE.contact_phone
  is '职场管理表中的联系人电话';
comment on column SXDXSJ.TB_WORKPLACE.contact_address
  is '职场管理表中的联系地址';
comment on column SXDXSJ.TB_WORKPLACE.contact_comment
  is '职场管理表中的职场备注';
comment on column SXDXSJ.TB_WORKPLACE.ivr_group_num
  is '职场管理表中的IVR组号';
comment on column SXDXSJ.TB_WORKPLACE.is_del
  is '删除标志';
comment on column SXDXSJ.TB_WORKPLACE.voice_address
  is '职场管理表中的录音调听地址';
comment on column SXDXSJ.TB_WORKPLACE.population_tsmp
  is '发布时间戳';
grant select on SXDXSJ.TB_WORKPLACE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TB_WORKPLACE to SXDXETL;
grant select, insert, update, delete on SXDXSJ.TB_WORKPLACE to SXDXSJAPP;
grant select on SXDXSJ.TB_WORKPLACE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TB_WORKPLACE to SXDXSJMOD;

prompt
prompt Creating table TEMP_CMP_RPT_DAY
prompt ===============================
prompt
create table SXDXSJ.TEMP_CMP_RPT_DAY
(
  cal_day_id             DATE not null,
  schl_call_mon          VARCHAR2(20),
  actv_id                VARCHAR2(1024),
  bat_code               VARCHAR2(200),
  com_typ                VARCHAR2(20),
  bat_prjt               VARCHAR2(20),
  comp_id                VARCHAR2(20),
  city_id                VARCHAR2(20),
  org_typ                VARCHAR2(20),
  cal_times              VARCHAR2(20),
  prjt_mgr_id            VARCHAR2(20),
  tem_lead_id            VARCHAR2(20),
  user_id                VARCHAR2(20),
  list_tno               NUMBER(14),
  fst_cal_list_qty       NUMBER(14),
  cal_comp_list_qty      NUMBER(14),
  connt_list_qty         NUMBER(14),
  cont_list_qty          NUMBER(14),
  cal_comp_cont_list_qty NUMBER(14),
  surp_trk_list_qty      NUMBER(14),
  oline_smit_qty         NUMBER(14),
  oline_smit_prm         NUMBER(20,3),
  oline_tran_qty         NUMBER(14),
  oline_tran_prm         NUMBER(20,3),
  fst_chargbk_succ_qty   NUMBER(14),
  fst_chargbk_succ_prm   NUMBER(20,3),
  annul_fst_prm_prm      NUMBER(20,3),
  actl_fst_prm_prm       NUMBER(20,3),
  wtn_qty                NUMBER(14),
  agg_cal_times          NUMBER(14),
  agg_cont_times         NUMBER(14),
  population_tsmp        DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.cal_day_id
  is '统计日期
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.schl_call_mon
  is '计划拨打年月
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.actv_id
  is '活动';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.bat_code
  is '批次代码
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.com_typ
  is '名单类型
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.bat_prjt
  is '批次项目
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.comp_id
  is '分公司ID
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.city_id
  is '城市ID
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.org_typ
  is '机构类型';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.cal_times
  is '拨打次数';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.prjt_mgr_id
  is '项目经理ID
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.tem_lead_id
  is '团队长ID
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.user_id
  is '座席ID
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.list_tno
  is '名单总量
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.fst_cal_list_qty
  is '首拨名单量
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.cal_comp_list_qty
  is '拨打完成名单量
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.connt_list_qty
  is '接通名单量
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.cont_list_qty
  is '接触名单量';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.cal_comp_cont_list_qty
  is '拨打完成接触名单量
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.surp_trk_list_qty
  is '剩余跟踪名单量
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.oline_smit_qty
  is '线上提交件数
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.oline_smit_prm
  is '线上提交保费';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.oline_tran_qty
  is '线上成交件数
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.oline_tran_prm
  is '线上成交保费
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.fst_chargbk_succ_qty
  is '首期扣款成功件数
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.fst_chargbk_succ_prm
  is '首期扣款成功保费
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.annul_fst_prm_prm
  is '年化新保保费

';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.actl_fst_prm_prm
  is '实收新保保费
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.wtn_qty
  is '保单配送成功件数
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.agg_cal_times
  is '累计拨打次数
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.agg_cont_times
  is '累计接通次数
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.population_tsmp
  is '发布时间戳';
grant select on SXDXSJ.TEMP_CMP_RPT_DAY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_CMP_RPT_DAY to SXDXSJAPP;
grant select on SXDXSJ.TEMP_CMP_RPT_DAY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_CMP_RPT_DAY to SXDXSJMOD;

prompt
prompt Creating table TEMP_CUSTOMER
prompt ============================
prompt
create table SXDXSJ.TEMP_CUSTOMER
(
  branch_abbreviation    VARCHAR2(20),
  source_type_code       NUMBER(3),
  customer_id            CHAR(18) not null,
  copy_id                CHAR(40),
  customer_name          VARCHAR2(120),
  birthday               DATE,
  age                    NUMBER(3),
  marital_status         VARCHAR2(10),
  death_critical_illness VARCHAR2(6),
  fax                    VARCHAR2(30),
  family_zip_code        VARCHAR2(10),
  company_zip_code       VARCHAR2(10),
  family_address         VARCHAR2(508),
  company_address        VARCHAR2(508),
  company                VARCHAR2(508),
  job_name               VARCHAR2(40),
  education_level        VARCHAR2(40),
  income                 NUMBER(12,2),
  email                  VARCHAR2(40),
  zone_code              VARCHAR2(20),
  govern_id              VARCHAR2(30),
  city                   VARCHAR2(120),
  province               VARCHAR2(120),
  bank_name              VARCHAR2(120),
  bank_account           CHAR(40),
  policy_no              VARCHAR2(40),
  note                   VARCHAR2(2000),
  tel_code               VARCHAR2(20),
  any_date               DATE,
  other_info_1           VARCHAR2(100),
  other_info_2           VARCHAR2(100),
  other_info_3           VARCHAR2(100),
  other_info_5           VARCHAR2(100),
  other_info_4           VARCHAR2(100),
  contact_address        VARCHAR2(508),
  gender_code            NUMBER(3),
  family_phone           VARCHAR2(30),
  office_phone           VARCHAR2(30),
  mobile_phone           VARCHAR2(30),
  charge_phone           VARCHAR2(30),
  other_phone            VARCHAR2(30),
  is_id_null             NUMBER(1),
  is_accept_donation     NUMBER(1),
  partition_col          NUMBER(6) not null
)
partition by list (PARTITION_COL)
(
  partition PART01 values (1)
    tablespace SXDXSJ_DATA_P31
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART02 values (2)
    tablespace SXDXSJ_DATA_P32
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART03 values (3)
    tablespace SXDXSJ_DATA_P33
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART04 values (4)
    tablespace SXDXSJ_DATA_P34
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART05 values (5)
    tablespace SXDXSJ_DATA_P35
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART06 values (6)
    tablespace SXDXSJ_DATA_P36
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART07 values (7)
    tablespace SXDXSJ_DATA_P37
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART08 values (8)
    tablespace SXDXSJ_DATA_P38
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART09 values (9)
    tablespace SXDXSJ_DATA_P39
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART00 values (default)
    tablespace SXDXSJ_DATA_P40
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    )
);
comment on table SXDXSJ.TEMP_CUSTOMER
  is '导入原始数据时，如果不是孤儿单，也不是银保，则先将数据导入本表，然后再进行后续的分析处理。';
grant select on SXDXSJ.TEMP_CUSTOMER to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_CUSTOMER to SXDXSJAPP;
grant select on SXDXSJ.TEMP_CUSTOMER to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_CUSTOMER to SXDXSJMOD;

prompt
prompt Creating table TEMP_CUSTOMER2
prompt =============================
prompt
create table SXDXSJ.TEMP_CUSTOMER2
(
  branch_abbreviation    VARCHAR2(20),
  source_type_code       NUMBER(3),
  customer_id            CHAR(18) not null,
  copy_id                CHAR(40),
  customer_name          VARCHAR2(120),
  birthday               DATE,
  age                    NUMBER(3),
  marital_status         VARCHAR2(10),
  death_critical_illness VARCHAR2(6),
  fax                    VARCHAR2(30),
  family_zip_code        VARCHAR2(10),
  company_zip_code       VARCHAR2(10),
  family_address         VARCHAR2(508),
  company_address        VARCHAR2(508),
  company                VARCHAR2(508),
  job_name               VARCHAR2(40),
  education_level        VARCHAR2(40),
  income                 NUMBER(12,2),
  email                  VARCHAR2(40),
  zone_code              VARCHAR2(20),
  govern_id              VARCHAR2(30),
  city                   VARCHAR2(120),
  province               VARCHAR2(120),
  bank_name              VARCHAR2(120),
  bank_account           CHAR(40),
  policy_no              VARCHAR2(40),
  note                   VARCHAR2(2000),
  tel_code               VARCHAR2(20),
  any_date               DATE,
  other_info_1           VARCHAR2(100),
  other_info_2           VARCHAR2(100),
  other_info_3           VARCHAR2(100),
  other_info_5           VARCHAR2(100),
  other_info_4           VARCHAR2(100),
  contact_address        VARCHAR2(508),
  gender_code            NUMBER(3),
  family_phone           VARCHAR2(30),
  office_phone           VARCHAR2(30),
  mobile_phone           VARCHAR2(30),
  charge_phone           VARCHAR2(30),
  other_phone            VARCHAR2(30),
  is_id_null             NUMBER(1),
  is_accept_donation     NUMBER(1),
  partition_col          NUMBER(6) not null
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_CUSTOMER2 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_CUSTOMER2 to SXDXSJAPP;
grant select on SXDXSJ.TEMP_CUSTOMER2 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_CUSTOMER2 to SXDXSJMOD;

prompt
prompt Creating table TEMP_CUSTOMER3
prompt =============================
prompt
create table SXDXSJ.TEMP_CUSTOMER3
(
  other_info_5     VARCHAR2(100),
  customer_name    VARCHAR2(120),
  gender_code      NUMBER(3),
  other_info_1     VARCHAR2(100),
  customer_id      VARCHAR2(4000),
  copy_id          CHAR(40),
  birthday         DATE,
  family_phone     VARCHAR2(30),
  office_phone     VARCHAR2(30),
  mobile_phone     VARCHAR2(30),
  other_phone      VARCHAR2(30),
  charge_phone     VARCHAR2(30),
  fax              VARCHAR2(30),
  family_zip_code  VARCHAR2(10),
  family_address   VARCHAR2(508),
  job_name         VARCHAR2(40),
  company          VARCHAR2(508),
  email            VARCHAR2(40),
  note             VARCHAR2(2000),
  govern_id        VARCHAR2(30),
  partition_col    NUMBER,
  source_type_code NUMBER
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_CUSTOMER3 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_CUSTOMER3 to SXDXSJAPP;
grant select on SXDXSJ.TEMP_CUSTOMER3 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_CUSTOMER3 to SXDXSJMOD;

prompt
prompt Creating table TEMP_CUSTOMER4
prompt =============================
prompt
create table SXDXSJ.TEMP_CUSTOMER4
(
  other_info_5     VARCHAR2(100),
  customer_name    VARCHAR2(120),
  gender_code      NUMBER(3),
  other_info_1     VARCHAR2(100),
  customer_id      VARCHAR2(4000),
  copy_id          CHAR(40),
  birthday         DATE,
  family_phone     VARCHAR2(30),
  office_phone     VARCHAR2(30),
  mobile_phone     VARCHAR2(30),
  other_phone      VARCHAR2(30),
  charge_phone     VARCHAR2(30),
  fax              VARCHAR2(30),
  family_zip_code  VARCHAR2(10),
  family_address   VARCHAR2(508),
  job_name         VARCHAR2(40),
  company          VARCHAR2(508),
  email            VARCHAR2(40),
  note             VARCHAR2(2000),
  govern_id        VARCHAR2(30),
  partition_col    NUMBER,
  source_type_code NUMBER
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_CUSTOMER4 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_CUSTOMER4 to SXDXSJAPP;
grant select on SXDXSJ.TEMP_CUSTOMER4 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_CUSTOMER4 to SXDXSJMOD;

prompt
prompt Creating table TEMP_DEAL_POLICY
prompt ===============================
prompt
create table SXDXSJ.TEMP_DEAL_POLICY
(
  branch_govern_id        VARCHAR2(30),
  policy_no               VARCHAR2(30),
  policy_holder_id        CHAR(18),
  application_no          VARCHAR2(30),
  application_create_time DATE,
  product_code            VARCHAR2(20),
  partition_col           NUMBER(6),
  activity_id             NUMBER(20)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TEMP_DEAL_POLICY
  is '从电销系统返回的每月新增线上成交保单信息将首先被导入本表，然后进行后续的分析处理。每次导入新一批数据前，本表将会被清空。';
grant select on SXDXSJ.TEMP_DEAL_POLICY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_DEAL_POLICY to SXDXSJAPP;
grant select on SXDXSJ.TEMP_DEAL_POLICY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_DEAL_POLICY to SXDXSJMOD;

prompt
prompt Creating table TEMP_DEAL_POLICY2
prompt ================================
prompt
create table SXDXSJ.TEMP_DEAL_POLICY2
(
  branch_govern_id        VARCHAR2(30),
  policy_no               VARCHAR2(30),
  policy_holder_id        CHAR(18),
  application_no          VARCHAR2(30),
  application_create_time DATE,
  product_code            VARCHAR2(20),
  partition_col           NUMBER(6)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_DEAL_POLICY2 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_DEAL_POLICY2 to SXDXSJAPP;
grant select on SXDXSJ.TEMP_DEAL_POLICY2 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_DEAL_POLICY2 to SXDXSJMOD;

prompt
prompt Creating table TEMP_DIAL_ACTIVITY
prompt =================================
prompt
create table SXDXSJ.TEMP_DIAL_ACTIVITY
(
  child_branch_code   VARCHAR2(30),
  activity_id         VARCHAR2(20),
  activity_name       VARCHAR2(200),
  product_code        VARCHAR2(30),
  product_name        VARCHAR2(200),
  policy_holder_id    CHAR(18),
  activity_start_time DATE,
  activity_end_time   DATE,
  partition_col       NUMBER(6)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TEMP_DIAL_ACTIVITY
  is '从电销系统返回的每日新增电销活动信息将首先被导入本表，然后进行后续的分析处理。每次导入新一批数据前，本表将会被清空。';
grant select on SXDXSJ.TEMP_DIAL_ACTIVITY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_DIAL_ACTIVITY to SXDXSJAPP;
grant select on SXDXSJ.TEMP_DIAL_ACTIVITY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_DIAL_ACTIVITY to SXDXSJMOD;

prompt
prompt Creating table TEMP_DIAL_ACTIVITY2
prompt ==================================
prompt
create table SXDXSJ.TEMP_DIAL_ACTIVITY2
(
  child_branch_code   VARCHAR2(30),
  activity_id         VARCHAR2(20),
  activity_name       VARCHAR2(200),
  product_code        VARCHAR2(30),
  product_name        VARCHAR2(200),
  policy_holder_id    CHAR(18),
  activity_start_time DATE,
  activity_end_time   DATE,
  partition_col       NUMBER(6)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_DIAL_ACTIVITY2 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_DIAL_ACTIVITY2 to SXDXSJAPP;
grant select on SXDXSJ.TEMP_DIAL_ACTIVITY2 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_DIAL_ACTIVITY2 to SXDXSJMOD;

prompt
prompt Creating table TEMP_DIAL_RESULT
prompt ===============================
prompt
create table SXDXSJ.TEMP_DIAL_RESULT
(
  activity_id      VARCHAR2(20),
  customer_id      CHAR(18),
  mobile_phone     VARCHAR2(20),
  family_phone     VARCHAR2(20),
  office_phone     VARCHAR2(20),
  other_phone      VARCHAR2(20),
  status           NUMBER,
  passed_phone     VARCHAR2(20),
  dial_time_length NUMBER,
  dial_time        DATE,
  partition_col    NUMBER(6)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TEMP_DIAL_RESULT
  is '从电销系统返回给本系统的拨打结果信息数据将首先被导入本表，然后将进行后续的分析处理。每次导入新一批数据前，本表将被清空。';
grant select on SXDXSJ.TEMP_DIAL_RESULT to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_DIAL_RESULT to SXDXSJAPP;
grant select on SXDXSJ.TEMP_DIAL_RESULT to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_DIAL_RESULT to SXDXSJMOD;

prompt
prompt Creating table TEMP_DIAL_RESULT2
prompt ================================
prompt
create table SXDXSJ.TEMP_DIAL_RESULT2
(
  activity_id      VARCHAR2(20),
  customer_id      CHAR(18),
  mobile_phone     VARCHAR2(20),
  family_phone     VARCHAR2(20),
  office_phone     VARCHAR2(20),
  other_phone      VARCHAR2(20),
  status           NUMBER,
  passed_phone     VARCHAR2(20),
  dial_time_length NUMBER,
  dial_time        DATE,
  partition_col    NUMBER(6)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_DIAL_RESULT2 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_DIAL_RESULT2 to SXDXSJAPP;
grant select on SXDXSJ.TEMP_DIAL_RESULT2 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_DIAL_RESULT2 to SXDXSJMOD;

prompt
prompt Creating table TEMP_POLICY
prompt ==========================
prompt
create table SXDXSJ.TEMP_POLICY
(
  policy_no                 CHAR(30),
  class_code                CHAR(10),
  class_name                VARCHAR2(508),
  policy_status             VARCHAR2(6),
  claim_status              VARCHAR2(6),
  payment_status            VARCHAR2(6),
  pieces                    NUMBER(20,2),
  begin_date                DATE,
  end_date                  DATE,
  charge_copy               NUMBER(20,2),
  charge_way                VARCHAR2(6),
  charge_status             VARCHAR2(6),
  charge_end_date           DATE,
  charge_years              NUMBER(10),
  charge_end_ages           NUMBER(3),
  charge_total_times        NUMBER(3),
  charge_total_amount       NUMBER(16,2),
  relation                  VARCHAR2(20),
  recognizee_age            NUMBER(3),
  policy_holder_id          CHAR(18),
  policy_holder_copy_id     CHAR(40),
  recognizee_holder_id      CHAR(18),
  recognizee_holder_copy_id CHAR(40),
  employee_no               VARCHAR2(20),
  account_type              NUMBER(3),
  account_no                CHAR(40),
  bank_code                 CHAR(20),
  bank_name                 VARCHAR2(120),
  market_channel            NUMBER(3),
  govern_id                 VARCHAR2(30),
  govern_name               VARCHAR2(120),
  tel_code                  CHAR(10),
  branch_abbreviation       VARCHAR2(10),
  branch_name               VARCHAR2(120),
  charge_phone              VARCHAR2(30),
  zone_code                 VARCHAR2(30),
  mobile_phone              VARCHAR2(30),
  other_phone               VARCHAR2(30),
  fax                       VARCHAR2(30),
  email                     VARCHAR2(40),
  edulevel                  VARCHAR2(40),
  income                    NUMBER(12,2),
  update_time               DATE,
  recieve_time              DATE,
  partition_col             NUMBER(6) not null,
  policy_partition_col      NUMBER(6),
  policy_rowid              CHAR(18)
)
partition by list (PARTITION_COL)
(
  partition PART01 values (1)
    tablespace SXDXSJ_DATA_P41
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART02 values (2)
    tablespace SXDXSJ_DATA_P42
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART03 values (3)
    tablespace SXDXSJ_DATA_P43
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART04 values (4)
    tablespace SXDXSJ_DATA_P44
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART05 values (5)
    tablespace SXDXSJ_DATA_P45
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART06 values (6)
    tablespace SXDXSJ_DATA_P46
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART07 values (7)
    tablespace SXDXSJ_DATA_P47
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART08 values (8)
    tablespace SXDXSJ_DATA_P48
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART09 values (9)
    tablespace SXDXSJ_DATA_P49
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART00 values (default)
    tablespace SXDXSJ_DATA_P50
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    )
);
comment on table SXDXSJ.TEMP_POLICY
  is '导入孤儿单和银保数据时，保单数据将存放在此表，供后续的分析处理。';
create index SXDXSJ.INDEX_BANK_INFO on SXDXSJ.TEMP_POLICY (ACCOUNT_NO, BANK_CODE, BANK_NAME)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.INDEX_PHONE_INFO on SXDXSJ.TEMP_POLICY (GOVERN_ID, BRANCH_ABBREVIATION, CHARGE_PHONE, MOBILE_PHONE, OTHER_PHONE)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.INDEX_POLICYNO_CLASSCODE on SXDXSJ.TEMP_POLICY (POLICY_NO, CLASS_CODE)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.INDEX_POLICY_HOLDER_ID on SXDXSJ.TEMP_POLICY (POLICY_HOLDER_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.INDEX_TP_PART on SXDXSJ.TEMP_POLICY (PARTITION_COL)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_POLICY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_POLICY to SXDXSJAPP;
grant select on SXDXSJ.TEMP_POLICY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_POLICY to SXDXSJMOD;

prompt
prompt Creating table TEMP_POLICY_HOLDER
prompt =================================
prompt
create table SXDXSJ.TEMP_POLICY_HOLDER
(
  policy_holder_id       CHAR(18),
  policy_holder_copy_id  CHAR(40),
  policy_holder_name     VARCHAR2(120),
  birthday               DATE,
  gender_code            NUMBER(3),
  marital_status         VARCHAR2(10),
  death_critical_illness VARCHAR2(6),
  family_zip_code        VARCHAR2(10),
  job_name               VARCHAR2(40),
  company_zip_code       VARCHAR2(10),
  family_phone           VARCHAR2(30),
  office_phone           VARCHAR2(30),
  contact_address        VARCHAR2(508),
  company                VARCHAR2(508),
  mobile_phone           VARCHAR2(30),
  other_phone            VARCHAR2(30),
  fax                    VARCHAR2(30),
  email                  VARCHAR2(40),
  education_level        VARCHAR2(40),
  income                 NUMBER(12,2),
  branch_abbreviation    VARCHAR2(10),
  policy_no              CHAR(30),
  application_no         CHAR(30),
  update_time            DATE,
  revist_time            DATE,
  revist_result          NUMBER(3),
  age                    NUMBER(3),
  birth_month            NUMBER(3),
  birth_day              NUMBER(3),
  zone_code              VARCHAR2(20),
  govern_id              VARCHAR2(30),
  govern_name            VARCHAR2(120),
  tel_code               VARCHAR2(10),
  is_orphan              NUMBER(1),
  is_id_null             NUMBER(1),
  partition_col          NUMBER(6) not null,
  customer_rowid         CHAR(18)
)
partition by list (PARTITION_COL)
(
  partition PART01 values (1)
    tablespace SXDXSJ_DATA_P51
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART02 values (2)
    tablespace SXDXSJ_DATA_P52
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART03 values (3)
    tablespace SXDXSJ_DATA_P53
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART04 values (4)
    tablespace SXDXSJ_DATA_P54
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART05 values (5)
    tablespace SXDXSJ_DATA_P55
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART06 values (6)
    tablespace SXDXSJ_DATA_P56
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART07 values (7)
    tablespace SXDXSJ_DATA_P57
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART08 values (8)
    tablespace SXDXSJ_DATA_P58
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART09 values (9)
    tablespace SXDXSJ_DATA_P59
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    ),
  partition PART00 values (default)
    tablespace SXDXSJ_DATA_P60
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    )
);
comment on table SXDXSJ.TEMP_POLICY_HOLDER
  is '导入孤儿单和银保数据时，投保人信息将首先导入本表，然后开始后续的分析处理。每次导入新一批数据前，本表将会被清空。
';
create index SXDXSJ.INDEX_ID on SXDXSJ.TEMP_POLICY_HOLDER (POLICY_HOLDER_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.INDEX_TELEPHONE on SXDXSJ.TEMP_POLICY_HOLDER (FAMILY_PHONE, OFFICE_PHONE, MOBILE_PHONE, OTHER_PHONE)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.INDEX_TH_PART on SXDXSJ.TEMP_POLICY_HOLDER (PARTITION_COL)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_POLICY_HOLDER to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_POLICY_HOLDER to SXDXSJAPP;
grant select on SXDXSJ.TEMP_POLICY_HOLDER to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_POLICY_HOLDER to SXDXSJMOD;

prompt
prompt Creating table TEMP_POLICY_PAYMENT
prompt ==================================
prompt
create table SXDXSJ.TEMP_POLICY_PAYMENT
(
  policy_no           VARCHAR2(40),
  class_code          VARCHAR2(20),
  class_name          VARCHAR2(508),
  policy_status       VARCHAR2(6),
  claim_status        VARCHAR2(6),
  payment_status      VARCHAR2(6),
  pieces              NUMBER(20,6),
  begin_date          DATE,
  end_date            DATE,
  charge_copy         NUMBER(20,6),
  charge_way          VARCHAR2(6),
  charge_status       VARCHAR2(6),
  charge_end_date     DATE,
  charge_years        NUMBER(10),
  charge_end_ages     NUMBER(3),
  charge_total_times  NUMBER(3),
  charge_total_amount NUMBER(16,2),
  branch_abbreviation VARCHAR2(10),
  policy_holder_id    CHAR(18),
  application_no      VARCHAR2(40),
  partition_col       NUMBER(6)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TEMP_POLICY_PAYMENT
  is '从ecif返回的保单付费信息将首先导入本表，然后进行一系列的分析处理。每次导入前，本表都会被清空。';
grant select on SXDXSJ.TEMP_POLICY_PAYMENT to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_POLICY_PAYMENT to SXDXSJAPP;
grant select on SXDXSJ.TEMP_POLICY_PAYMENT to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_POLICY_PAYMENT to SXDXSJMOD;

prompt
prompt Creating table TEMP_PREINS_CUS
prompt ==============================
prompt
create table SXDXSJ.TEMP_PREINS_CUS
(
  c_line        VARCHAR2(100),
  c_create_time TIMESTAMP(6)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_PREINS_CUS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_PREINS_CUS to SXDXSJAPP;
grant select on SXDXSJ.TEMP_PREINS_CUS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_PREINS_CUS to SXDXSJMOD;

prompt
prompt Creating table TEMP_SALES_HUMAN_RPT_DAY
prompt =======================================
prompt
create table SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY
(
  cal_day_id      DATE not null,
  actv_id         VARCHAR2(600) not null,
  bat_code        VARCHAR2(600) not null,
  com_typ         VARCHAR2(20) not null,
  bat_prjt        VARCHAR2(20) not null,
  comp_id         VARCHAR2(20) not null,
  city_id         VARCHAR2(20) not null,
  org_typ         VARCHAR2(20) not null,
  wp_id           VARCHAR2(20) not null,
  prjt_mgr_id     VARCHAR2(20) not null,
  tem_lead_id     VARCHAR2(20) not null,
  on_line_human   NUMBER(14,6),
  population_tsmp DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY
  is '销售人力报表临时表';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.cal_day_id
  is '统计日期';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.actv_id
  is '活动ID';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.bat_code
  is '批次代码';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.com_typ
  is '名单类型';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.bat_prjt
  is '批次项目';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.comp_id
  is '分公司';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.city_id
  is '城市';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.org_typ
  is '机构类型';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.wp_id
  is '职场';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.prjt_mgr_id
  is '项目经理id';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.tem_lead_id
  is '团队ID';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.on_line_human
  is '上线人力';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.population_tsmp
  is '发布时间戳';

prompt
prompt Creating table TEMP_SMS_SUCC_MOBILE
prompt ===================================
prompt
create table SXDXSJ.TEMP_SMS_SUCC_MOBILE
(
  govern_code VARCHAR2(20),
  mobile      VARCHAR2(30)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.TEMP_SMS_SUCC_MOBILE
  is '从短信平台返回的每日清洗成功手机号码信息将首先被导入本表，然后进行后续的分析处理。每次导入新一批数据前，本表将会被清空。';
grant select on SXDXSJ.TEMP_SMS_SUCC_MOBILE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_SMS_SUCC_MOBILE to SXDXSJAPP;
grant select on SXDXSJ.TEMP_SMS_SUCC_MOBILE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_SMS_SUCC_MOBILE to SXDXSJMOD;

prompt
prompt Creating table TEMP_TA_SALES_RPT_1
prompt ==================================
prompt
create table SXDXSJ.TEMP_TA_SALES_RPT_1
(
  pay_mode         VARCHAR2(20),
  actv_id          VARCHAR2(1024),
  bat_id           VARCHAR2(200),
  com_typ          VARCHAR2(20),
  bat_prjt         VARCHAR2(20),
  comp_id          VARCHAR2(20),
  org_typ          VARCHAR2(20),
  wp_id            VARCHAR2(20),
  prjt_mgr_id      VARCHAR2(20),
  tem_lead_id      VARCHAR2(20),
  user_id          VARCHAR2(20),
  fst_cal_list_qty NUMBER(14),
  city_id          VARCHAR2(20)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_TA_SALES_RPT_1 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_1 to SXDXSJAPP;
grant select on SXDXSJ.TEMP_TA_SALES_RPT_1 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_1 to SXDXSJMOD;

prompt
prompt Creating table TEMP_TA_SALES_RPT_10
prompt ===================================
prompt
create table SXDXSJ.TEMP_TA_SALES_RPT_10
(
  pay_mode             VARCHAR2(20),
  actv_id              VARCHAR2(1024),
  bat_id               VARCHAR2(200),
  com_typ              VARCHAR2(20),
  bat_prjt             VARCHAR2(20),
  comp_id              VARCHAR2(20),
  org_typ              VARCHAR2(20),
  wp_id                VARCHAR2(20),
  prjt_mgr_id          VARCHAR2(20),
  tem_lead_id          VARCHAR2(20),
  user_id              VARCHAR2(20),
  city_id              VARCHAR2(20),
  fst_chargbk_succ_qty NUMBER(14)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_TA_SALES_RPT_10 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_10 to SXDXSJAPP;
grant select on SXDXSJ.TEMP_TA_SALES_RPT_10 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_10 to SXDXSJMOD;

prompt
prompt Creating table TEMP_TA_SALES_RPT_11
prompt ===================================
prompt
create table SXDXSJ.TEMP_TA_SALES_RPT_11
(
  pay_mode          VARCHAR2(20),
  actv_id           VARCHAR2(1024),
  bat_id            VARCHAR2(200),
  com_typ           VARCHAR2(20),
  bat_prjt          VARCHAR2(20),
  comp_id           VARCHAR2(20),
  org_typ           VARCHAR2(20),
  wp_id             VARCHAR2(20),
  prjt_mgr_id       VARCHAR2(20),
  tem_lead_id       VARCHAR2(20),
  user_id           VARCHAR2(20),
  city_id           VARCHAR2(20),
  annul_fst_prm_prm NUMBER(20,3)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_TA_SALES_RPT_11 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_11 to SXDXSJAPP;
grant select on SXDXSJ.TEMP_TA_SALES_RPT_11 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_11 to SXDXSJMOD;

prompt
prompt Creating table TEMP_TA_SALES_RPT_12
prompt ===================================
prompt
create table SXDXSJ.TEMP_TA_SALES_RPT_12
(
  pay_mode         VARCHAR2(20),
  actv_id          VARCHAR2(1024),
  bat_id           VARCHAR2(200),
  com_typ          VARCHAR2(20),
  bat_prjt         VARCHAR2(20),
  comp_id          VARCHAR2(20),
  org_typ          VARCHAR2(20),
  wp_id            VARCHAR2(20),
  prjt_mgr_id      VARCHAR2(20),
  tem_lead_id      VARCHAR2(20),
  user_id          VARCHAR2(20),
  city_id          VARCHAR2(20),
  actl_fst_prm_prm NUMBER(20,3)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_TA_SALES_RPT_12 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_12 to SXDXSJAPP;
grant select on SXDXSJ.TEMP_TA_SALES_RPT_12 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_12 to SXDXSJMOD;

prompt
prompt Creating table TEMP_TA_SALES_RPT_13
prompt ===================================
prompt
create table SXDXSJ.TEMP_TA_SALES_RPT_13
(
  pay_mode    VARCHAR2(20),
  actv_id     VARCHAR2(1024),
  bat_id      VARCHAR2(200),
  com_typ     VARCHAR2(20),
  bat_prjt    VARCHAR2(20),
  comp_id     VARCHAR2(20),
  org_typ     VARCHAR2(20),
  wp_id       VARCHAR2(20),
  prjt_mgr_id VARCHAR2(20),
  tem_lead_id VARCHAR2(20),
  user_id     VARCHAR2(20),
  city_id     VARCHAR2(20),
  cncl_qty    NUMBER(14),
  cncl_prm    NUMBER(20,3)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_TA_SALES_RPT_13 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_13 to SXDXSJAPP;
grant select on SXDXSJ.TEMP_TA_SALES_RPT_13 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_13 to SXDXSJMOD;

prompt
prompt Creating table TEMP_TA_SALES_RPT_2
prompt ==================================
prompt
create table SXDXSJ.TEMP_TA_SALES_RPT_2
(
  pay_mode              VARCHAR2(20),
  actv_id               VARCHAR2(1024),
  bat_id                VARCHAR2(200),
  com_typ               VARCHAR2(20),
  bat_prjt              VARCHAR2(20),
  comp_id               VARCHAR2(20),
  org_typ               VARCHAR2(20),
  wp_id                 VARCHAR2(20),
  prjt_mgr_id           VARCHAR2(20),
  tem_lead_id           VARCHAR2(20),
  user_id               VARCHAR2(20),
  fst_cal_cont_list_qty NUMBER(14),
  city_id               VARCHAR2(20)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_TA_SALES_RPT_2 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_2 to SXDXSJAPP;
grant select on SXDXSJ.TEMP_TA_SALES_RPT_2 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_2 to SXDXSJMOD;

prompt
prompt Creating table TEMP_TA_SALES_RPT_3
prompt ==================================
prompt
create table SXDXSJ.TEMP_TA_SALES_RPT_3
(
  pay_mode     VARCHAR2(20),
  actv_id      VARCHAR2(1024),
  bat_id       VARCHAR2(200),
  com_typ      VARCHAR2(20),
  bat_prjt     VARCHAR2(20),
  comp_id      VARCHAR2(20),
  org_typ      VARCHAR2(20),
  wp_id        VARCHAR2(20),
  prjt_mgr_id  VARCHAR2(20),
  tem_lead_id  VARCHAR2(20),
  user_id      VARCHAR2(20),
  city_id      VARCHAR2(20),
  trk_list_qty NUMBER(14)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_TA_SALES_RPT_3 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_3 to SXDXSJAPP;
grant select on SXDXSJ.TEMP_TA_SALES_RPT_3 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_3 to SXDXSJMOD;

prompt
prompt Creating table TEMP_TA_SALES_RPT_4
prompt ==================================
prompt
create table SXDXSJ.TEMP_TA_SALES_RPT_4
(
  pay_mode      VARCHAR2(20),
  actv_id       VARCHAR2(1024),
  bat_id        VARCHAR2(200),
  com_typ       VARCHAR2(20),
  bat_prjt      VARCHAR2(20),
  comp_id       VARCHAR2(20),
  org_typ       VARCHAR2(20),
  wp_id         VARCHAR2(20),
  prjt_mgr_id   VARCHAR2(20),
  tem_lead_id   VARCHAR2(20),
  user_id       VARCHAR2(20),
  city_id       VARCHAR2(20),
  cont_list_qty NUMBER(14)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_TA_SALES_RPT_4 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_4 to SXDXSJAPP;
grant select on SXDXSJ.TEMP_TA_SALES_RPT_4 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_4 to SXDXSJMOD;

prompt
prompt Creating table TEMP_TA_SALES_RPT_5
prompt ==================================
prompt
create table SXDXSJ.TEMP_TA_SALES_RPT_5
(
  pay_mode     VARCHAR2(20),
  actv_id      VARCHAR2(1024),
  bat_id       VARCHAR2(200),
  com_typ      VARCHAR2(20),
  bat_prjt     VARCHAR2(20),
  comp_id      VARCHAR2(20),
  org_typ      VARCHAR2(20),
  wp_id        VARCHAR2(20),
  prjt_mgr_id  VARCHAR2(20),
  tem_lead_id  VARCHAR2(20),
  user_id      VARCHAR2(20),
  city_id      VARCHAR2(20),
  rej_list_qty NUMBER(14)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_TA_SALES_RPT_5 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_5 to SXDXSJAPP;
grant select on SXDXSJ.TEMP_TA_SALES_RPT_5 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_5 to SXDXSJMOD;

prompt
prompt Creating table TEMP_TA_SALES_RPT_6
prompt ==================================
prompt
create table SXDXSJ.TEMP_TA_SALES_RPT_6
(
  pay_mode       VARCHAR2(20),
  actv_id        VARCHAR2(1024),
  bat_id         VARCHAR2(200),
  com_typ        VARCHAR2(20),
  bat_prjt       VARCHAR2(20),
  comp_id        VARCHAR2(20),
  org_typ        VARCHAR2(20),
  wp_id          VARCHAR2(20),
  prjt_mgr_id    VARCHAR2(20),
  tem_lead_id    VARCHAR2(20),
  user_id        VARCHAR2(20),
  city_id        VARCHAR2(20),
  oline_smit_qty NUMBER(14),
  oline_smit_prm NUMBER(20,3)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_TA_SALES_RPT_6 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_6 to SXDXSJAPP;
grant select on SXDXSJ.TEMP_TA_SALES_RPT_6 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_6 to SXDXSJMOD;

prompt
prompt Creating table TEMP_TA_SALES_RPT_8
prompt ==================================
prompt
create table SXDXSJ.TEMP_TA_SALES_RPT_8
(
  pay_mode       VARCHAR2(20),
  actv_id        VARCHAR2(1024),
  bat_id         VARCHAR2(200),
  com_typ        VARCHAR2(20),
  bat_prjt       VARCHAR2(20),
  comp_id        VARCHAR2(20),
  org_typ        VARCHAR2(20),
  wp_id          VARCHAR2(20),
  prjt_mgr_id    VARCHAR2(20),
  tem_lead_id    VARCHAR2(20),
  user_id        VARCHAR2(20),
  oline_tran_qty NUMBER(14),
  city_id        VARCHAR2(20),
  oline_tran_prm NUMBER(20,3),
  land_succ_qty  NUMBER(14),
  land_succ_prm  NUMBER(20,3)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEMP_TA_SALES_RPT_8 to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_8 to SXDXSJAPP;
grant select on SXDXSJ.TEMP_TA_SALES_RPT_8 to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEMP_TA_SALES_RPT_8 to SXDXSJMOD;

prompt
prompt Creating table TEXT_IMPORT
prompt ==========================
prompt
create table SXDXSJ.TEXT_IMPORT
(
  customer_id CHAR(18),
  cus_type    NUMBER(3)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEXT_IMPORT to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEXT_IMPORT to SXDXSJAPP;
grant select on SXDXSJ.TEXT_IMPORT to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEXT_IMPORT to SXDXSJMOD;

prompt
prompt Creating table TEXT_IMP_ACTIVITY
prompt ================================
prompt
create table SXDXSJ.TEXT_IMP_ACTIVITY
(
  activity_id       VARCHAR2(20),
  activity_name     VARCHAR2(200),
  activity_desc     VARCHAR2(2000),
  child_branch_name VARCHAR2(200),
  name_list         VARCHAR2(200),
  product_name      VARCHAR2(200),
  begin_time        DATE,
  end_time          DATE,
  status            VARCHAR2(20),
  seller            VARCHAR2(200),
  project           VARCHAR2(200),
  zone              VARCHAR2(200)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index SXDXSJ.WXX_UIDX_ACT on SXDXSJ.TEXT_IMP_ACTIVITY (ACTIVITY_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TEXT_IMP_ACTIVITY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TEXT_IMP_ACTIVITY to SXDXSJAPP;
grant select on SXDXSJ.TEXT_IMP_ACTIVITY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TEXT_IMP_ACTIVITY to SXDXSJMOD;

prompt
prompt Creating table TOAD_PLAN_TABLE
prompt ==============================
prompt
create table SXDXSJ.TOAD_PLAN_TABLE
(
  statement_id      VARCHAR2(30),
  plan_id           NUMBER,
  timestamp         DATE,
  remarks           VARCHAR2(4000),
  operation         VARCHAR2(30),
  options           VARCHAR2(255),
  object_node       VARCHAR2(128),
  object_owner      VARCHAR2(30),
  object_name       VARCHAR2(30),
  object_alias      VARCHAR2(65),
  object_instance   INTEGER,
  object_type       VARCHAR2(30),
  optimizer         VARCHAR2(255),
  search_columns    NUMBER,
  id                INTEGER,
  parent_id         INTEGER,
  depth             INTEGER,
  position          INTEGER,
  cost              INTEGER,
  cardinality       INTEGER,
  bytes             INTEGER,
  other_tag         VARCHAR2(255),
  partition_start   VARCHAR2(255),
  partition_stop    VARCHAR2(255),
  partition_id      INTEGER,
  other             LONG,
  distribution      VARCHAR2(30),
  cpu_cost          INTEGER,
  io_cost           INTEGER,
  temp_space        INTEGER,
  access_predicates VARCHAR2(4000),
  filter_predicates VARCHAR2(4000),
  projection        VARCHAR2(4000),
  time              INTEGER,
  qblock_name       VARCHAR2(30)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TOAD_PLAN_TABLE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TOAD_PLAN_TABLE to PUBLIC;
grant select, insert, update, delete on SXDXSJ.TOAD_PLAN_TABLE to SXDXSJAPP;
grant select on SXDXSJ.TOAD_PLAN_TABLE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TOAD_PLAN_TABLE to SXDXSJMOD;

prompt
prompt Creating table TTT_DIAL_TIMES
prompt =============================
prompt
create table SXDXSJ.TTT_DIAL_TIMES
(
  customer_id CHAR(18) not null,
  nc          NUMBER
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.TTT_DIAL_TIMES
  add constraint PK_TTT_DIAL_TIMES primary key (CUSTOMER_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.TTT_DIAL_TIMES to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.TTT_DIAL_TIMES to SXDXSJAPP;
grant select on SXDXSJ.TTT_DIAL_TIMES to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.TTT_DIAL_TIMES to SXDXSJMOD;

prompt
prompt Creating table T_AGENTCOMPANY_TYPE
prompt ==================================
prompt
create table SXDXSJ.T_AGENTCOMPANY_TYPE
(
  t_agentcompany_type_id   NUMBER(10) not null,
  t_agentcompany_type_name VARCHAR2(100),
  t_agentcompany_type_desc VARCHAR2(500)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SXDXSJ.T_AGENTCOMPANY_TYPE.t_agentcompany_type_id
  is '中介机构类型ID';
comment on column SXDXSJ.T_AGENTCOMPANY_TYPE.t_agentcompany_type_name
  is '中介机构类型名称';
comment on column SXDXSJ.T_AGENTCOMPANY_TYPE.t_agentcompany_type_desc
  is '中介机构类型描述';
alter table SXDXSJ.T_AGENTCOMPANY_TYPE
  add constraint PK_T_AGENTCOMPANY_TYPE primary key (T_AGENTCOMPANY_TYPE_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.T_AGENTCOMPANY_TYPE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.T_AGENTCOMPANY_TYPE to SXDXSJAPP;
grant select on SXDXSJ.T_AGENTCOMPANY_TYPE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.T_AGENTCOMPANY_TYPE to SXDXSJMOD;

prompt
prompt Creating table T_DA_DEPT
prompt ========================
prompt
create table SXDXSJ.T_DA_DEPT
(
  c_dept_id   NUMBER not null,
  c_dept_name VARCHAR2(100),
  c_id_path   VARCHAR2(50),
  c_name_path VARCHAR2(500),
  c_parent_id NUMBER,
  c_rem       VARCHAR2(500)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SXDXSJ.T_DA_DEPT
  is '部门表';
comment on column SXDXSJ.T_DA_DEPT.c_dept_id
  is '部门Id';
comment on column SXDXSJ.T_DA_DEPT.c_dept_name
  is '部门名称';
comment on column SXDXSJ.T_DA_DEPT.c_id_path
  is '部门id路径 如（1/2/3）';
comment on column SXDXSJ.T_DA_DEPT.c_name_path
  is '部门名称路径 （如 总公司/分公司）';
comment on column SXDXSJ.T_DA_DEPT.c_parent_id
  is '父部门id';
comment on column SXDXSJ.T_DA_DEPT.c_rem
  is '部门描述';
alter table SXDXSJ.T_DA_DEPT
  add constraint PK_DEPTID primary key (C_DEPT_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select on SXDXSJ.T_DA_DEPT to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.T_DA_DEPT to SXDXSJAPP;
grant select on SXDXSJ.T_DA_DEPT to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.T_DA_DEPT to SXDXSJMOD;

prompt
prompt Creating table T_DA_DEPT_ROLE
prompt =============================
prompt
create table SXDXSJ.T_DA_DEPT_ROLE
(
  c_role_id VARCHAR2(20),
  c_dept_id VARCHAR2(20)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SXDXSJ.T_DA_DEPT_ROLE
  is '部门角色关系表';
comment on column SXDXSJ.T_DA_DEPT_ROLE.c_role_id
  is '角色id';
comment on column SXDXSJ.T_DA_DEPT_ROLE.c_dept_id
  is '部门id';
grant select on SXDXSJ.T_DA_DEPT_ROLE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.T_DA_DEPT_ROLE to SXDXSJAPP;
grant select on SXDXSJ.T_DA_DEPT_ROLE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.T_DA_DEPT_ROLE to SXDXSJMOD;

prompt
prompt Creating table T_DA_MENU
prompt ========================
prompt
create table SXDXSJ.T_DA_MENU
(
  c_menu_id   NUMBER not null,
  c_parent_id NUMBER not null,
  c_id_path   VARCHAR2(200) not null,
  c_name      VARCHAR2(50) not null,
  c_name_path VARCHAR2(500) not null,
  c_icon      VARCHAR2(50),
  c_url       VARCHAR2(100),
  c_order_num NUMBER,
  c_rem       VARCHAR2(200)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SXDXSJ.T_DA_MENU
  is '菜单表';
comment on column SXDXSJ.T_DA_MENU.c_menu_id
  is '菜单id';
comment on column SXDXSJ.T_DA_MENU.c_parent_id
  is '父菜单id';
comment on column SXDXSJ.T_DA_MENU.c_id_path
  is 'id的路径';
comment on column SXDXSJ.T_DA_MENU.c_name
  is '菜单名称';
comment on column SXDXSJ.T_DA_MENU.c_name_path
  is '菜单名称路径';
comment on column SXDXSJ.T_DA_MENU.c_icon
  is '菜单图标';
comment on column SXDXSJ.T_DA_MENU.c_url
  is '菜单链接';
comment on column SXDXSJ.T_DA_MENU.c_order_num
  is '菜单排列序号';
comment on column SXDXSJ.T_DA_MENU.c_rem
  is '菜单描述';
alter table SXDXSJ.T_DA_MENU
  add constraint PK_MENUID primary key (C_MENU_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select on SXDXSJ.T_DA_MENU to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.T_DA_MENU to SXDXSJAPP;
grant select on SXDXSJ.T_DA_MENU to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.T_DA_MENU to SXDXSJMOD;

prompt
prompt Creating table T_DA_ROLE
prompt ========================
prompt
create table SXDXSJ.T_DA_ROLE
(
  c_role_id   NUMBER not null,
  c_role_name VARCHAR2(50),
  c_auth_name VARCHAR2(20),
  c_rem       VARCHAR2(200)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SXDXSJ.T_DA_ROLE
  is '角色表';
comment on column SXDXSJ.T_DA_ROLE.c_role_id
  is '角色id';
comment on column SXDXSJ.T_DA_ROLE.c_role_name
  is '角色名称';
comment on column SXDXSJ.T_DA_ROLE.c_auth_name
  is '角色权限名称 如（ROLE_ADMIN）';
comment on column SXDXSJ.T_DA_ROLE.c_rem
  is '角色描述';
alter table SXDXSJ.T_DA_ROLE
  add constraint PK_ROLEID primary key (C_ROLE_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select on SXDXSJ.T_DA_ROLE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.T_DA_ROLE to SXDXSJAPP;
grant select on SXDXSJ.T_DA_ROLE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.T_DA_ROLE to SXDXSJMOD;

prompt
prompt Creating table T_DA_ROLE_MENU
prompt =============================
prompt
create table SXDXSJ.T_DA_ROLE_MENU
(
  c_id      NUMBER not null,
  c_role_id NUMBER not null,
  c_menu_id NUMBER not null
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SXDXSJ.T_DA_ROLE_MENU
  is '角色和菜单关系表';
comment on column SXDXSJ.T_DA_ROLE_MENU.c_role_id
  is '角色id';
comment on column SXDXSJ.T_DA_ROLE_MENU.c_menu_id
  is '菜单id';
alter table SXDXSJ.T_DA_ROLE_MENU
  add constraint PK_ROLEMENUID primary key (C_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
alter table SXDXSJ.T_DA_ROLE_MENU
  add constraint FK1_T_DA_ROLE_MENU foreign key (C_ROLE_ID)
  references SXDXSJ.T_DA_ROLE (C_ROLE_ID) on delete cascade;
alter table SXDXSJ.T_DA_ROLE_MENU
  add constraint FK2_T_DA_ROLE_MENU foreign key (C_MENU_ID)
  references SXDXSJ.T_DA_MENU (C_MENU_ID) on delete cascade;
grant select on SXDXSJ.T_DA_ROLE_MENU to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.T_DA_ROLE_MENU to SXDXSJAPP;
grant select on SXDXSJ.T_DA_ROLE_MENU to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.T_DA_ROLE_MENU to SXDXSJMOD;

prompt
prompt Creating table USER_MANAGEMENT
prompt ==============================
prompt
create table SXDXSJ.USER_MANAGEMENT
(
  user_account    VARCHAR2(100) not null,
  user_name       VARCHAR2(120),
  password        VARCHAR2(50),
  cogtoken        VARCHAR2(50),
  email           VARCHAR2(200),
  role            VARCHAR2(100),
  last_login_time DATE,
  hasonline       CHAR(1),
  active          CHAR(1)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.USER_MANAGEMENT
  is '用户登录账号';
alter table SXDXSJ.USER_MANAGEMENT
  add constraint PK_USER_MANAGEMENT primary key (USER_ACCOUNT)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.USER_MANAGEMENT to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.USER_MANAGEMENT to SXDXSJAPP;
grant select on SXDXSJ.USER_MANAGEMENT to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.USER_MANAGEMENT to SXDXSJMOD;

prompt
prompt Creating table T_DA_ROLE_USER
prompt =============================
prompt
create table SXDXSJ.T_DA_ROLE_USER
(
  c_id           NUMBER not null,
  c_role_id      NUMBER not null,
  c_user_account VARCHAR2(100) not null
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SXDXSJ.T_DA_ROLE_USER
  is '角色和用户关系表';
comment on column SXDXSJ.T_DA_ROLE_USER.c_role_id
  is '角色id';
comment on column SXDXSJ.T_DA_ROLE_USER.c_user_account
  is '用户名';
alter table SXDXSJ.T_DA_ROLE_USER
  add constraint PK_ROLEUSERID primary key (C_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255;
alter table SXDXSJ.T_DA_ROLE_USER
  add constraint FK1_T_DA_ROLE_USER foreign key (C_ROLE_ID)
  references SXDXSJ.T_DA_ROLE (C_ROLE_ID) on delete cascade;
alter table SXDXSJ.T_DA_ROLE_USER
  add constraint FK2_T_DA_ROLE_USER foreign key (C_USER_ACCOUNT)
  references SXDXSJ.USER_MANAGEMENT (USER_ACCOUNT) on delete cascade;
grant select on SXDXSJ.T_DA_ROLE_USER to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.T_DA_ROLE_USER to SXDXSJAPP;
grant select on SXDXSJ.T_DA_ROLE_USER to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.T_DA_ROLE_USER to SXDXSJMOD;

prompt
prompt Creating table T_DIAL_LENGTH
prompt ============================
prompt
create table SXDXSJ.T_DIAL_LENGTH
(
  activity    NUMBER,
  customer_id VARCHAR2(40),
  dial_length NUMBER
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.T_DIAL_LENGTH to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.T_DIAL_LENGTH to SXDXSJAPP;
grant select on SXDXSJ.T_DIAL_LENGTH to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.T_DIAL_LENGTH to SXDXSJMOD;

prompt
prompt Creating table T_LEGAL_MOBILE
prompt =============================
prompt
create table SXDXSJ.T_LEGAL_MOBILE
(
  c_mobile VARCHAR2(20) not null
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.T_LEGAL_MOBILE
  add constraint PK_T_LEGAL_MOBILE primary key (C_MOBILE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.T_LEGAL_MOBILE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.T_LEGAL_MOBILE to SXDXSJAPP;
grant select on SXDXSJ.T_LEGAL_MOBILE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.T_LEGAL_MOBILE to SXDXSJMOD;

prompt
prompt Creating table T_LOCATION_INFO
prompt ==============================
prompt
create table SXDXSJ.T_LOCATION_INFO
(
  c_province          VARCHAR2(120) not null,
  c_city              VARCHAR2(120) not null,
  c_zone              VARCHAR2(120),
  c_mobile            VARCHAR2(20),
  c_active            NUMBER(1),
  c_creator           VARCHAR2(50),
  c_create_time       DATE,
  c_updater           VARCHAR2(50),
  c_update_time       DATE,
  c_province_standard VARCHAR2(120),
  c_city_standard     VARCHAR2(120)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.T_LOCATION_INFO
  is '归属地标准化参照：
行政省市信息表';
comment on column SXDXSJ.T_LOCATION_INFO.c_province
  is '省';
comment on column SXDXSJ.T_LOCATION_INFO.c_city
  is '市';
comment on column SXDXSJ.T_LOCATION_INFO.c_zone
  is '区县';
comment on column SXDXSJ.T_LOCATION_INFO.c_mobile
  is '手机号段';
comment on column SXDXSJ.T_LOCATION_INFO.c_active
  is '是否可用';
comment on column SXDXSJ.T_LOCATION_INFO.c_creator
  is '创建人';
comment on column SXDXSJ.T_LOCATION_INFO.c_create_time
  is '创建日期';
comment on column SXDXSJ.T_LOCATION_INFO.c_updater
  is '修改人';
comment on column SXDXSJ.T_LOCATION_INFO.c_update_time
  is '修改日期';
comment on column SXDXSJ.T_LOCATION_INFO.c_province_standard
  is '标准化（省）';
comment on column SXDXSJ.T_LOCATION_INFO.c_city_standard
  is '标准化（市）';
grant select on SXDXSJ.T_LOCATION_INFO to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.T_LOCATION_INFO to SXDXSJAPP;
grant select on SXDXSJ.T_LOCATION_INFO to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.T_LOCATION_INFO to SXDXSJMOD;

prompt
prompt Creating table T_MOBILE_LOCATION
prompt ================================
prompt
create table SXDXSJ.T_MOBILE_LOCATION
(
  c_province          VARCHAR2(120) not null,
  c_city              VARCHAR2(120) not null,
  c_zone              VARCHAR2(120),
  c_mobile            VARCHAR2(20),
  c_active            NUMBER(1),
  c_creator           VARCHAR2(50),
  c_create_time       DATE,
  c_updater           VARCHAR2(50),
  c_update_time       DATE,
  c_province_standard VARCHAR2(120),
  c_city_standard     VARCHAR2(120)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.T_MOBILE_LOCATION
  is '手机号段对应行政省市表';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_province
  is '省';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_city
  is '市';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_zone
  is '区县';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_mobile
  is '手机号段';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_active
  is '是否可用';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_creator
  is '创建人';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_create_time
  is '创建日期';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_updater
  is '修改人';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_update_time
  is '修改日期';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_province_standard
  is '标准化（省）';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_city_standard
  is '标准化（市）';
create index SXDXSJ.IDX_T_MOBILE_LOCATION_01 on SXDXSJ.T_MOBILE_LOCATION (C_MOBILE)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.T_MOBILE_LOCATION to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.T_MOBILE_LOCATION to SXDXSJAPP;
grant select on SXDXSJ.T_MOBILE_LOCATION to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.T_MOBILE_LOCATION to SXDXSJMOD;

prompt
prompt Creating table T_PREINS
prompt =======================
prompt
create table SXDXSJ.T_PREINS
(
  c_id                    VARCHAR2(20) not null,
  c_preins_id             VARCHAR2(20),
  c_data_type             VARCHAR2(3),
  c_status                VARCHAR2(3),
  c_sale_orgcode          VARCHAR2(20),
  c_sale_org              VARCHAR2(100),
  c_preins_orgcode        VARCHAR2(20),
  c_preins_org            VARCHAR2(100),
  c_import_time           DATE,
  c_sale_situationcode    VARCHAR2(20),
  c_sale_time             DATE,
  c_dial_time             DATE,
  c_assigndial_time       DATE,
  c_callresult_code       VARCHAR2(20),
  c_dial_orgcode          VARCHAR2(20),
  c_dial_org              VARCHAR2(100),
  c_preins_company_code   VARCHAR2(100),
  c_preins_company        VARCHAR2(100),
  c_middle_company_code   VARCHAR2(100),
  c_middle_company        VARCHAR2(100),
  c_effort_time           DATE,
  c_cus_name              VARCHAR2(100),
  c_cus_provincecode      VARCHAR2(20),
  c_cus_province          VARCHAR2(100),
  c_cus_citycode          VARCHAR2(20),
  c_cus_city              VARCHAR2(100),
  c_cus_zone              VARCHAR2(100),
  c_cus_gender            VARCHAR2(2),
  c_cus_birtheday         DATE,
  c_cus_age_code          VARCHAR2(3),
  c_cus_mobile_no         VARCHAR2(100),
  c_cus_card_id           VARCHAR2(50),
  c_sale_source           VARCHAR2(1000),
  c_cus_other_phone       VARCHAR2(100),
  c_preins_code           VARCHAR2(20),
  c_cus_career            VARCHAR2(100),
  c_cus_s_insurance       VARCHAR2(3),
  c_cus_b_insurance       VARCHAR2(3),
  c_cus_i_insurance       VARCHAR2(100),
  c_cus_usual_bank        VARCHAR2(100),
  c_cus_married           VARCHAR2(3),
  c_usual_vehicle         VARCHAR2(100),
  c_cus_else_question     VARCHAR2(200),
  c_creator               VARCHAR2(50),
  c_create_time           DATE,
  c_sms_send_time         DATE,
  c_insurence_start_date  DATE,
  c_policy_id             VARCHAR2(20),
  c_batch_code            VARCHAR2(20),
  c_update_time           DATE,
  obligate_info_1         VARCHAR2(200),
  obligate_info_2         VARCHAR2(200),
  obligate_info_3         VARCHAR2(200),
  obligate_info_4         VARCHAR2(200),
  name_status             VARCHAR2(2),
  birth_staus             VARCHAR2(2),
  bar_flag                VARCHAR2(2),
  import_time             VARCHAR2(8),
  dial_time               VARCHAR2(8),
  c_family_phone          VARCHAR2(20),
  c_office_phone          VARCHAR2(20),
  c_passed_phone          VARCHAR2(20),
  c_active_id             VARCHAR2(20),
  c_dial_timelength       VARCHAR2(10),
  c_sale_dialtime         VARCHAR2(20),
  c_phone_invalid_flag    VARCHAR2(2),
  c_name_invalid_flag     VARCHAR2(2),
  c_sameorg_repeat_flag   VARCHAR2(2),
  c_othertype_repeat_flag VARCHAR2(2),
  c_preins_repeat_flag    VARCHAR2(2),
  c_standard_suc_flag     VARCHAR2(2),
  c_card_id_valid_flag    VARCHAR2(2)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.T_PREINS
  is '赠险信息（电销取得）(待处理的数据)';
comment on column SXDXSJ.T_PREINS.c_id
  is '递增主键';
comment on column SXDXSJ.T_PREINS.c_data_type
  is '数据类型

';
comment on column SXDXSJ.T_PREINS.c_status
  is '赠险状态
“暂存成功”；
“暂存成功激活失败”；
“激活成功发送短信失败”；
“发送短信成功”
';
comment on column SXDXSJ.T_PREINS.c_sale_orgcode
  is '销售机构代码';
comment on column SXDXSJ.T_PREINS.c_sale_org
  is '自建赠险名单销售机构为“电销中心”；
“分公司”
';
comment on column SXDXSJ.T_PREINS.c_preins_orgcode
  is '赠险机构代码';
comment on column SXDXSJ.T_PREINS.c_preins_org
  is '赠险机构
自建赠险名单赠险机构为电销中心，如：上海电销中心、武汉电销中心、西安、深圳、广东……（录入）';
comment on column SXDXSJ.T_PREINS.c_import_time
  is '导入时间';
comment on column SXDXSJ.T_PREINS.c_sale_situationcode
  is '销售情况
';
comment on column SXDXSJ.T_PREINS.c_sale_time
  is '销售时间';
comment on column SXDXSJ.T_PREINS.c_dial_time
  is '拨打时间';
comment on column SXDXSJ.T_PREINS.c_assigndial_time
  is '分配拨打时间';
comment on column SXDXSJ.T_PREINS.c_callresult_code
  is '营销拨打结果状态码';
comment on column SXDXSJ.T_PREINS.c_dial_orgcode
  is '拨打机构代码';
comment on column SXDXSJ.T_PREINS.c_dial_org
  is '拨打机构
';
comment on column SXDXSJ.T_PREINS.c_preins_company_code
  is '赠险业务归属分公司代码';
comment on column SXDXSJ.T_PREINS.c_preins_company
  is '赠险业务归属分公司
';
comment on column SXDXSJ.T_PREINS.c_middle_company_code
  is '中支公司代码';
comment on column SXDXSJ.T_PREINS.c_middle_company
  is '中支公司';
comment on column SXDXSJ.T_PREINS.c_effort_time
  is '生效日期
';
comment on column SXDXSJ.T_PREINS.c_cus_name
  is '客户姓名';
comment on column SXDXSJ.T_PREINS.c_cus_provincecode
  is '省代码';
comment on column SXDXSJ.T_PREINS.c_cus_province
  is '客户所在省份
';
comment on column SXDXSJ.T_PREINS.c_cus_citycode
  is '市代码';
comment on column SXDXSJ.T_PREINS.c_cus_city
  is '客户所在城市
';
comment on column SXDXSJ.T_PREINS.c_cus_zone
  is '客户所在县/区
';
comment on column SXDXSJ.T_PREINS.c_cus_gender
  is '性别:
01:男
02:女';
comment on column SXDXSJ.T_PREINS.c_cus_birtheday
  is '生日';
comment on column SXDXSJ.T_PREINS.c_cus_age_code
  is '客户年龄段';
comment on column SXDXSJ.T_PREINS.c_cus_mobile_no
  is '客户手机号码';
comment on column SXDXSJ.T_PREINS.c_cus_card_id
  is '客户身份证号码';
comment on column SXDXSJ.T_PREINS.c_sale_source
  is '销售来源（可选）
';
comment on column SXDXSJ.T_PREINS.c_cus_other_phone
  is '其他号码';
comment on column SXDXSJ.T_PREINS.c_preins_code
  is '赠险代码
';
comment on column SXDXSJ.T_PREINS.c_cus_career
  is '职业';
comment on column SXDXSJ.T_PREINS.c_cus_s_insurance
  is '是否有社保：
01：有
02：无';
comment on column SXDXSJ.T_PREINS.c_cus_b_insurance
  is '是否有商业险
01：有
02：无';
comment on column SXDXSJ.T_PREINS.c_cus_i_insurance
  is '感兴趣的险种';
comment on column SXDXSJ.T_PREINS.c_cus_usual_bank
  is '常用银行';
comment on column SXDXSJ.T_PREINS.c_cus_married
  is '婚姻状况
';
comment on column SXDXSJ.T_PREINS.c_usual_vehicle
  is '常用交通工具';
comment on column SXDXSJ.T_PREINS.c_cus_else_question
  is '其他问题';
comment on column SXDXSJ.T_PREINS.c_creator
  is '创建人
';
comment on column SXDXSJ.T_PREINS.c_create_time
  is '创建时间';
comment on column SXDXSJ.T_PREINS.c_sms_send_time
  is '发送短信时间';
comment on column SXDXSJ.T_PREINS.c_insurence_start_date
  is '保障起期
';
comment on column SXDXSJ.T_PREINS.c_policy_id
  is '保单号
';
comment on column SXDXSJ.T_PREINS.c_batch_code
  is '批次号';
comment on column SXDXSJ.T_PREINS.c_update_time
  is '更新时间';
comment on column SXDXSJ.T_PREINS.name_status
  is '姓名是否正确状态';
comment on column SXDXSJ.T_PREINS.birth_staus
  is '生日是否正确状态';
comment on column SXDXSJ.T_PREINS.bar_flag
  is '禁拨标志';
comment on column SXDXSJ.T_PREINS.import_time
  is '导入时间(多维分析)';
comment on column SXDXSJ.T_PREINS.dial_time
  is '拨打时间(多维分析)';
comment on column SXDXSJ.T_PREINS.c_family_phone
  is '家庭电话';
comment on column SXDXSJ.T_PREINS.c_office_phone
  is '办公电话';
comment on column SXDXSJ.T_PREINS.c_passed_phone
  is '接通电话';
comment on column SXDXSJ.T_PREINS.c_active_id
  is '电销活动ID';
comment on column SXDXSJ.T_PREINS.c_dial_timelength
  is '通话时长';
comment on column SXDXSJ.T_PREINS.c_sale_dialtime
  is '赠险营销数据拨打时间';
comment on column SXDXSJ.T_PREINS.c_phone_invalid_flag
  is '电话无效数据标志
00：电话有效数据，01：电话无效数据';
comment on column SXDXSJ.T_PREINS.c_name_invalid_flag
  is '姓名无效数据标志
00：姓名有效数据、01：姓名无效数据';
comment on column SXDXSJ.T_PREINS.c_sameorg_repeat_flag
  is '同机构重复数据标志
00：同机构数据非重复、01：同机构重复数据、02：同机构重复_与历史数据重复';
comment on column SXDXSJ.T_PREINS.c_othertype_repeat_flag
  is '与其他类型重复数据标志
00：与自有客户非重复,01：与自有客户重复';
comment on column SXDXSJ.T_PREINS.c_preins_repeat_flag
  is '赠险重复数据标志
00：与其他机构非重复数据、01：与其他机构重复数据';
comment on column SXDXSJ.T_PREINS.c_standard_suc_flag
  is '归属地标准化数据标志
00：归属地标准化成功、01：归属地标准化失败_手工处理、02：归属地标准化失败';
comment on column SXDXSJ.T_PREINS.c_card_id_valid_flag
  is '身份证有效数据标志
00：身份证号码有效数据,01：身份证号码无效数据';
create index SXDXSJ.IDX_T_PREINS_01 on SXDXSJ.T_PREINS (C_CUS_MOBILE_NO)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_T_PREINS_02 on SXDXSJ.T_PREINS (C_CUS_NAME, C_CUS_BIRTHEDAY)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_T_PREINS_03 on SXDXSJ.T_PREINS (C_STATUS)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_T_PREINS_04 on SXDXSJ.T_PREINS (C_STANDARD_SUC_FLAG)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_T_PREINS_05 on SXDXSJ.T_PREINS (C_PREINS_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_T_PREINS_06 on SXDXSJ.T_PREINS (C_SALE_SITUATIONCODE, C_PHONE_INVALID_FLAG, C_SAMEORG_REPEAT_FLAG, C_OTHERTYPE_REPEAT_FLAG, C_PREINS_REPEAT_FLAG, BAR_FLAG)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.T_PREINS
  add constraint PK_T_PREINS primary key (C_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.T_PREINS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.T_PREINS to SXDXSJAPP;
grant select on SXDXSJ.T_PREINS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.T_PREINS to SXDXSJMOD;

prompt
prompt Creating table T_PREINS_OLD
prompt ===========================
prompt
create table SXDXSJ.T_PREINS_OLD
(
  c_id                    VARCHAR2(20) not null,
  c_preins_id             VARCHAR2(20),
  c_data_type             VARCHAR2(3),
  c_status                VARCHAR2(3),
  c_sale_orgcode          VARCHAR2(20),
  c_sale_org              VARCHAR2(100),
  c_preins_orgcode        VARCHAR2(20),
  c_preins_org            VARCHAR2(100),
  c_import_time           DATE,
  c_sale_situationcode    VARCHAR2(20),
  c_sale_time             DATE,
  c_dial_time             DATE,
  c_assigndial_time       DATE,
  c_callresult_code       VARCHAR2(20),
  c_dial_orgcode          VARCHAR2(20),
  c_dial_org              VARCHAR2(100),
  c_preins_company_code   VARCHAR2(20),
  c_preins_company        VARCHAR2(100),
  c_middle_company_code   VARCHAR2(100),
  c_middle_company        VARCHAR2(100),
  c_effort_time           DATE,
  c_cus_name              VARCHAR2(100),
  c_cus_provincecode      VARCHAR2(20),
  c_cus_province          VARCHAR2(100),
  c_cus_citycode          VARCHAR2(20),
  c_cus_city              VARCHAR2(100),
  c_cus_zone              VARCHAR2(100),
  c_cus_gender            VARCHAR2(2),
  c_cus_birtheday         DATE,
  c_cus_age_code          VARCHAR2(3),
  c_cus_mobile_no         VARCHAR2(100),
  c_cus_card_id           VARCHAR2(50),
  c_sale_source           VARCHAR2(1000),
  c_cus_other_phone       VARCHAR2(100),
  c_preins_code           VARCHAR2(20),
  c_cus_career            VARCHAR2(100),
  c_cus_s_insurance       VARCHAR2(3),
  c_cus_b_insurance       VARCHAR2(3),
  c_cus_i_insurance       VARCHAR2(100),
  c_cus_usual_bank        VARCHAR2(100),
  c_cus_married           VARCHAR2(3),
  c_usual_vehicle         VARCHAR2(100),
  c_cus_else_question     VARCHAR2(200),
  c_creator               VARCHAR2(50),
  c_create_time           DATE,
  c_sms_send_time         DATE,
  c_insurence_start_date  DATE,
  c_policy_id             VARCHAR2(20),
  c_batch_code            VARCHAR2(20),
  c_update_time           DATE,
  obligate_info_1         VARCHAR2(200),
  obligate_info_2         VARCHAR2(200),
  obligate_info_3         VARCHAR2(200),
  obligate_info_4         VARCHAR2(200),
  name_status             VARCHAR2(2),
  birth_staus             VARCHAR2(2),
  bar_flag                VARCHAR2(2),
  import_time             VARCHAR2(8),
  dial_time               VARCHAR2(8),
  c_family_phone          VARCHAR2(20),
  c_office_phone          VARCHAR2(20),
  c_passed_phone          VARCHAR2(20),
  c_active_id             VARCHAR2(20),
  c_dial_timelength       VARCHAR2(10),
  c_sale_dialtime         VARCHAR2(20),
  c_phone_invalid_flag    VARCHAR2(2),
  c_name_invalid_flag     VARCHAR2(2),
  c_sameorg_repeat_flag   VARCHAR2(2),
  c_othertype_repeat_flag VARCHAR2(2),
  c_preins_repeat_flag    VARCHAR2(2),
  c_standard_suc_flag     VARCHAR2(2),
  c_card_id_valid_flag    VARCHAR2(2)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.T_PREINS_OLD
  is '赠险信息（电销取得）(待处理的数据)';
comment on column SXDXSJ.T_PREINS_OLD.c_id
  is '递增主键';
comment on column SXDXSJ.T_PREINS_OLD.c_data_type
  is '数据类型

';
comment on column SXDXSJ.T_PREINS_OLD.c_status
  is '赠险状态
“暂存成功”；
“暂存成功激活失败”；
“激活成功发送短信失败”；
“发送短信成功”
';
comment on column SXDXSJ.T_PREINS_OLD.c_sale_orgcode
  is '销售机构代码';
comment on column SXDXSJ.T_PREINS_OLD.c_sale_org
  is '自建赠险名单销售机构为“电销中心”；
“分公司”
';
comment on column SXDXSJ.T_PREINS_OLD.c_preins_orgcode
  is '赠险机构代码';
comment on column SXDXSJ.T_PREINS_OLD.c_preins_org
  is '赠险机构
自建赠险名单赠险机构为电销中心，如：上海电销中心、武汉电销中心、西安、深圳、广东……（录入）';
comment on column SXDXSJ.T_PREINS_OLD.c_import_time
  is '导入时间';
comment on column SXDXSJ.T_PREINS_OLD.c_sale_situationcode
  is '销售情况
';
comment on column SXDXSJ.T_PREINS_OLD.c_sale_time
  is '销售时间';
comment on column SXDXSJ.T_PREINS_OLD.c_dial_time
  is '拨打时间';
comment on column SXDXSJ.T_PREINS_OLD.c_assigndial_time
  is '分配拨打时间';
comment on column SXDXSJ.T_PREINS_OLD.c_callresult_code
  is '营销拨打结果状态码';
comment on column SXDXSJ.T_PREINS_OLD.c_dial_orgcode
  is '拨打机构代码';
comment on column SXDXSJ.T_PREINS_OLD.c_dial_org
  is '拨打机构
';
comment on column SXDXSJ.T_PREINS_OLD.c_preins_company_code
  is '赠险业务归属分公司代码';
comment on column SXDXSJ.T_PREINS_OLD.c_preins_company
  is '赠险业务归属分公司
';
comment on column SXDXSJ.T_PREINS_OLD.c_middle_company_code
  is '中支公司代码';
comment on column SXDXSJ.T_PREINS_OLD.c_middle_company
  is '中支公司';
comment on column SXDXSJ.T_PREINS_OLD.c_effort_time
  is '生效日期
';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_name
  is '客户姓名';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_provincecode
  is '省代码';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_province
  is '客户所在省份
';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_citycode
  is '市代码';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_city
  is '客户所在城市
';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_zone
  is '客户所在县/区
';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_gender
  is '性别:
01:男
02:女';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_birtheday
  is '生日';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_age_code
  is '客户年龄段';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_mobile_no
  is '客户手机号码';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_card_id
  is '客户身份证号码';
comment on column SXDXSJ.T_PREINS_OLD.c_sale_source
  is '销售来源（可选）
';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_other_phone
  is '其他号码';
comment on column SXDXSJ.T_PREINS_OLD.c_preins_code
  is '赠险代码
';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_career
  is '职业';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_s_insurance
  is '是否有社保：
01：有
02：无';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_b_insurance
  is '是否有商业险
01：有
02：无';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_i_insurance
  is '感兴趣的险种';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_usual_bank
  is '常用银行';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_married
  is '婚姻状况
';
comment on column SXDXSJ.T_PREINS_OLD.c_usual_vehicle
  is '常用交通工具';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_else_question
  is '其他问题';
comment on column SXDXSJ.T_PREINS_OLD.c_creator
  is '创建人
';
comment on column SXDXSJ.T_PREINS_OLD.c_create_time
  is '创建时间';
comment on column SXDXSJ.T_PREINS_OLD.c_sms_send_time
  is '发送短信时间';
comment on column SXDXSJ.T_PREINS_OLD.c_insurence_start_date
  is '保障起期
';
comment on column SXDXSJ.T_PREINS_OLD.c_policy_id
  is '保单号
';
comment on column SXDXSJ.T_PREINS_OLD.c_batch_code
  is '批次号';
comment on column SXDXSJ.T_PREINS_OLD.c_update_time
  is '更新时间';
comment on column SXDXSJ.T_PREINS_OLD.name_status
  is '姓名是否正确状态';
comment on column SXDXSJ.T_PREINS_OLD.birth_staus
  is '生日是否正确状态';
comment on column SXDXSJ.T_PREINS_OLD.bar_flag
  is '禁拨标志';
comment on column SXDXSJ.T_PREINS_OLD.import_time
  is '导入时间(多维分析)';
comment on column SXDXSJ.T_PREINS_OLD.dial_time
  is '拨打时间(多维分析)';
comment on column SXDXSJ.T_PREINS_OLD.c_family_phone
  is '家庭电话';
comment on column SXDXSJ.T_PREINS_OLD.c_office_phone
  is '办公电话';
comment on column SXDXSJ.T_PREINS_OLD.c_passed_phone
  is '接通电话';
comment on column SXDXSJ.T_PREINS_OLD.c_active_id
  is '电销活动ID';
comment on column SXDXSJ.T_PREINS_OLD.c_dial_timelength
  is '通话时长';
comment on column SXDXSJ.T_PREINS_OLD.c_sale_dialtime
  is '赠险营销数据拨打时间';
comment on column SXDXSJ.T_PREINS_OLD.c_phone_invalid_flag
  is '电话无效数据标志
00：电话有效数据，01：电话无效数据';
comment on column SXDXSJ.T_PREINS_OLD.c_name_invalid_flag
  is '姓名无效数据标志
00：姓名有效数据、01：姓名无效数据';
comment on column SXDXSJ.T_PREINS_OLD.c_sameorg_repeat_flag
  is '同机构重复数据标志
00：同机构数据非重复、01：同机构重复数据、02：同机构重复_与历史数据重复';
comment on column SXDXSJ.T_PREINS_OLD.c_othertype_repeat_flag
  is '与其他类型重复数据标志
00：与自有客户非重复,01：与自有客户重复';
comment on column SXDXSJ.T_PREINS_OLD.c_preins_repeat_flag
  is '赠险重复数据标志
00：与其他机构非重复数据、01：与其他机构重复数据';
comment on column SXDXSJ.T_PREINS_OLD.c_standard_suc_flag
  is '归属地标准化数据标志
00：归属地标准化成功、01：归属地标准化失败_手工处理、02：归属地标准化失败';
comment on column SXDXSJ.T_PREINS_OLD.c_card_id_valid_flag
  is '身份证有效数据标志
00：身份证号码有效数据,01：身份证号码无效数据';
grant select on SXDXSJ.T_PREINS_OLD to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.T_PREINS_OLD to SXDXSJAPP;
grant select on SXDXSJ.T_PREINS_OLD to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.T_PREINS_OLD to SXDXSJMOD;

prompt
prompt Creating table T_PREINS_TMP
prompt ===========================
prompt
create table SXDXSJ.T_PREINS_TMP
(
  c_id                    VARCHAR2(20) not null,
  c_preins_id             VARCHAR2(20),
  c_data_type             VARCHAR2(3),
  c_status                VARCHAR2(3),
  c_sale_orgcode          VARCHAR2(20),
  c_sale_org              VARCHAR2(100),
  c_preins_orgcode        VARCHAR2(20),
  c_preins_org            VARCHAR2(100),
  c_import_time           DATE,
  c_sale_situationcode    VARCHAR2(20),
  c_sale_time             DATE,
  c_dial_time             DATE,
  c_assigndial_time       DATE,
  c_callresult_code       VARCHAR2(20),
  c_dial_orgcode          VARCHAR2(20),
  c_dial_org              VARCHAR2(100),
  c_preins_company_code   VARCHAR2(20),
  c_preins_company        VARCHAR2(100),
  c_middle_company_code   VARCHAR2(100),
  c_middle_company        VARCHAR2(100),
  c_effort_time           DATE,
  c_cus_name              VARCHAR2(100),
  c_cus_provincecode      VARCHAR2(20),
  c_cus_province          VARCHAR2(100),
  c_cus_citycode          VARCHAR2(20),
  c_cus_city              VARCHAR2(100),
  c_cus_zone              VARCHAR2(100),
  c_cus_gender            VARCHAR2(2),
  c_cus_birtheday         DATE,
  c_cus_age_code          VARCHAR2(3),
  c_cus_mobile_no         VARCHAR2(100),
  c_cus_card_id           VARCHAR2(50),
  c_sale_source           VARCHAR2(1000),
  c_cus_other_phone       VARCHAR2(100),
  c_preins_code           VARCHAR2(20),
  c_cus_career            VARCHAR2(100),
  c_cus_s_insurance       VARCHAR2(3),
  c_cus_b_insurance       VARCHAR2(3),
  c_cus_i_insurance       VARCHAR2(100),
  c_cus_usual_bank        VARCHAR2(100),
  c_cus_married           VARCHAR2(3),
  c_usual_vehicle         VARCHAR2(100),
  c_cus_else_question     VARCHAR2(200),
  c_creator               VARCHAR2(50),
  c_create_time           DATE,
  c_sms_send_time         DATE,
  c_insurence_start_date  DATE,
  c_policy_id             VARCHAR2(20),
  c_batch_code            VARCHAR2(20),
  c_update_time           DATE,
  obligate_info_1         VARCHAR2(200),
  obligate_info_2         VARCHAR2(200),
  obligate_info_3         VARCHAR2(200),
  obligate_info_4         VARCHAR2(200),
  name_status             VARCHAR2(2),
  birth_staus             VARCHAR2(2),
  bar_flag                VARCHAR2(2),
  import_time             VARCHAR2(8),
  dial_time               VARCHAR2(8),
  c_family_phone          VARCHAR2(20),
  c_office_phone          VARCHAR2(20),
  c_passed_phone          VARCHAR2(20),
  c_active_id             VARCHAR2(20),
  c_dial_timelength       VARCHAR2(10),
  c_sale_dialtime         VARCHAR2(20),
  c_phone_invalid_flag    VARCHAR2(2),
  c_name_invalid_flag     VARCHAR2(2),
  c_sameorg_repeat_flag   VARCHAR2(2),
  c_othertype_repeat_flag VARCHAR2(2),
  c_preins_repeat_flag    VARCHAR2(2),
  c_standard_suc_flag     VARCHAR2(2),
  c_card_id_valid_flag    VARCHAR2(2)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.T_PREINS_TMP
  is '赠险信息（电销取得）(待处理的数据)';
comment on column SXDXSJ.T_PREINS_TMP.c_id
  is '递增主键';
comment on column SXDXSJ.T_PREINS_TMP.c_data_type
  is '数据类型

';
comment on column SXDXSJ.T_PREINS_TMP.c_status
  is '赠险状态
“暂存成功”；
“暂存成功激活失败”；
“激活成功发送短信失败”；
“发送短信成功”
';
comment on column SXDXSJ.T_PREINS_TMP.c_sale_orgcode
  is '销售机构代码';
comment on column SXDXSJ.T_PREINS_TMP.c_sale_org
  is '自建赠险名单销售机构为“电销中心”；
“分公司”
';
comment on column SXDXSJ.T_PREINS_TMP.c_preins_orgcode
  is '赠险机构代码';
comment on column SXDXSJ.T_PREINS_TMP.c_preins_org
  is '赠险机构
自建赠险名单赠险机构为电销中心，如：上海电销中心、武汉电销中心、西安、深圳、广东……（录入）';
comment on column SXDXSJ.T_PREINS_TMP.c_import_time
  is '导入时间';
comment on column SXDXSJ.T_PREINS_TMP.c_sale_situationcode
  is '销售情况
';
comment on column SXDXSJ.T_PREINS_TMP.c_sale_time
  is '销售时间';
comment on column SXDXSJ.T_PREINS_TMP.c_dial_time
  is '拨打时间';
comment on column SXDXSJ.T_PREINS_TMP.c_assigndial_time
  is '分配拨打时间';
comment on column SXDXSJ.T_PREINS_TMP.c_callresult_code
  is '营销拨打结果状态码';
comment on column SXDXSJ.T_PREINS_TMP.c_dial_orgcode
  is '拨打机构代码';
comment on column SXDXSJ.T_PREINS_TMP.c_dial_org
  is '拨打机构
';
comment on column SXDXSJ.T_PREINS_TMP.c_preins_company_code
  is '赠险业务归属分公司代码';
comment on column SXDXSJ.T_PREINS_TMP.c_preins_company
  is '赠险业务归属分公司
';
comment on column SXDXSJ.T_PREINS_TMP.c_middle_company_code
  is '中支公司代码';
comment on column SXDXSJ.T_PREINS_TMP.c_middle_company
  is '中支公司';
comment on column SXDXSJ.T_PREINS_TMP.c_effort_time
  is '生效日期
';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_name
  is '客户姓名';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_provincecode
  is '省代码';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_province
  is '客户所在省份
';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_citycode
  is '市代码';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_city
  is '客户所在城市
';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_zone
  is '客户所在县/区
';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_gender
  is '性别:
01:男
02:女';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_birtheday
  is '生日';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_age_code
  is '客户年龄段';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_mobile_no
  is '客户手机号码';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_card_id
  is '客户身份证号码';
comment on column SXDXSJ.T_PREINS_TMP.c_sale_source
  is '销售来源（可选）
';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_other_phone
  is '其他号码';
comment on column SXDXSJ.T_PREINS_TMP.c_preins_code
  is '赠险代码
';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_career
  is '职业';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_s_insurance
  is '是否有社保：
01：有
02：无';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_b_insurance
  is '是否有商业险
01：有
02：无';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_i_insurance
  is '感兴趣的险种';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_usual_bank
  is '常用银行';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_married
  is '婚姻状况
';
comment on column SXDXSJ.T_PREINS_TMP.c_usual_vehicle
  is '常用交通工具';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_else_question
  is '其他问题';
comment on column SXDXSJ.T_PREINS_TMP.c_creator
  is '创建人
';
comment on column SXDXSJ.T_PREINS_TMP.c_create_time
  is '创建时间';
comment on column SXDXSJ.T_PREINS_TMP.c_sms_send_time
  is '发送短信时间';
comment on column SXDXSJ.T_PREINS_TMP.c_insurence_start_date
  is '保障起期
';
comment on column SXDXSJ.T_PREINS_TMP.c_policy_id
  is '保单号
';
comment on column SXDXSJ.T_PREINS_TMP.c_batch_code
  is '批次号';
comment on column SXDXSJ.T_PREINS_TMP.c_update_time
  is '更新时间';
comment on column SXDXSJ.T_PREINS_TMP.name_status
  is '姓名是否正确状态';
comment on column SXDXSJ.T_PREINS_TMP.birth_staus
  is '生日是否正确状态';
comment on column SXDXSJ.T_PREINS_TMP.bar_flag
  is '禁拨标志';
comment on column SXDXSJ.T_PREINS_TMP.import_time
  is '导入时间(多维分析)';
comment on column SXDXSJ.T_PREINS_TMP.dial_time
  is '拨打时间(多维分析)';
comment on column SXDXSJ.T_PREINS_TMP.c_family_phone
  is '家庭电话';
comment on column SXDXSJ.T_PREINS_TMP.c_office_phone
  is '办公电话';
comment on column SXDXSJ.T_PREINS_TMP.c_passed_phone
  is '接通电话';
comment on column SXDXSJ.T_PREINS_TMP.c_active_id
  is '电销活动ID';
comment on column SXDXSJ.T_PREINS_TMP.c_dial_timelength
  is '通话时长';
comment on column SXDXSJ.T_PREINS_TMP.c_sale_dialtime
  is '赠险营销数据拨打时间';
comment on column SXDXSJ.T_PREINS_TMP.c_phone_invalid_flag
  is '电话无效数据标志
00：电话有效数据，01：电话无效数据';
comment on column SXDXSJ.T_PREINS_TMP.c_name_invalid_flag
  is '姓名无效数据标志
00：姓名有效数据、01：姓名无效数据';
comment on column SXDXSJ.T_PREINS_TMP.c_sameorg_repeat_flag
  is '同机构重复数据标志
00：同机构数据非重复、01：同机构重复数据、02：同机构重复_与历史数据重复';
comment on column SXDXSJ.T_PREINS_TMP.c_othertype_repeat_flag
  is '与其他类型重复数据标志
00：与自有客户非重复,01：与自有客户重复';
comment on column SXDXSJ.T_PREINS_TMP.c_preins_repeat_flag
  is '赠险重复数据标志
00：与其他机构非重复数据、01：与其他机构重复数据';
comment on column SXDXSJ.T_PREINS_TMP.c_standard_suc_flag
  is '归属地标准化数据标志
00：归属地标准化成功、01：归属地标准化失败_手工处理、02：归属地标准化失败';
comment on column SXDXSJ.T_PREINS_TMP.c_card_id_valid_flag
  is '身份证有效数据标志
00：身份证号码有效数据,01：身份证号码无效数据';
create index SXDXSJ.IDX_T_PREINS_TMP_01 on SXDXSJ.T_PREINS_TMP (C_CUS_MOBILE_NO)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_T_PREINS_TMP_02 on SXDXSJ.T_PREINS_TMP (C_CUS_NAME, C_CUS_BIRTHEDAY)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_T_PREINS_TMP_03 on SXDXSJ.T_PREINS_TMP (C_PREINS_COMPANY_CODE)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_T_PREINS_TMP_04 on SXDXSJ.T_PREINS_TMP (C_MIDDLE_COMPANY_CODE)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SXDXSJ.IDX_T_PREINS_TMP_05 on SXDXSJ.T_PREINS_TMP (C_PREINS_ID)
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.T_PREINS_TMP
  add constraint PK_T_PREINS_TMP primary key (C_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.T_PREINS_TMP to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.T_PREINS_TMP to SXDXSJAPP;
grant select on SXDXSJ.T_PREINS_TMP to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.T_PREINS_TMP to SXDXSJMOD;

prompt
prompt Creating table T_REPEAT_DATA_TYPE
prompt =================================
prompt
create table SXDXSJ.T_REPEAT_DATA_TYPE
(
  c_data_type   NUMBER(3) not null,
  c_date_remark VARCHAR2(200)
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.T_REPEAT_DATA_TYPE
  is '不需过滤的数据';
comment on column SXDXSJ.T_REPEAT_DATA_TYPE.c_date_remark
  is '数据类型说明';
alter table SXDXSJ.T_REPEAT_DATA_TYPE
  add constraint PK_T_REPEAT_DATA_TYPE primary key (C_DATA_TYPE)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.T_REPEAT_DATA_TYPE to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.T_REPEAT_DATA_TYPE to SXDXSJAPP;
grant select on SXDXSJ.T_REPEAT_DATA_TYPE to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.T_REPEAT_DATA_TYPE to SXDXSJMOD;

prompt
prompt Creating table T_STATISTIC_CFG
prompt ==============================
prompt
create table SXDXSJ.T_STATISTIC_CFG
(
  flag_id     VARCHAR2(4),
  flag_sql    VARCHAR2(1024),
  flag_desc   VARCHAR2(100),
  flag_active VARCHAR2(2),
  flag_remark VARCHAR2(200),
  flag_create DATE default sysdate
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SXDXSJ.T_STATISTIC_CFG
  is '统计指标配置信息表';
comment on column SXDXSJ.T_STATISTIC_CFG.flag_id
  is '标识ID';
comment on column SXDXSJ.T_STATISTIC_CFG.flag_sql
  is '配置SQL脚本';
comment on column SXDXSJ.T_STATISTIC_CFG.flag_desc
  is '指标描述';
comment on column SXDXSJ.T_STATISTIC_CFG.flag_active
  is '是否有效';
comment on column SXDXSJ.T_STATISTIC_CFG.flag_remark
  is '备注';
comment on column SXDXSJ.T_STATISTIC_CFG.flag_create
  is '创建时间';
grant select on SXDXSJ.T_STATISTIC_CFG to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.T_STATISTIC_CFG to SXDXSJAPP;
grant select on SXDXSJ.T_STATISTIC_CFG to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.T_STATISTIC_CFG to SXDXSJMOD;

prompt
prompt Creating table USABLE_SHCPIC_PREINS_CUS_HIS
prompt ===========================================
prompt
create table SXDXSJ.USABLE_SHCPIC_PREINS_CUS_HIS
(
  usable_id           NUMBER(10) not null,
  usable_zone_number  VARCHAR2(10),
  usable_tele_number  VARCHAR2(20),
  c_agentcompany_code VARCHAR2(100),
  c_company_code      VARCHAR2(100),
  c_agentcompany_id   VARCHAR2(500),
  usable_status       NUMBER(5),
  usable_date         DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SXDXSJ.USABLE_SHCPIC_PREINS_CUS_HIS
  add constraint PK_USABLE_SHCPIC_PREINS_CUS_HI primary key (USABLE_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.USABLE_SHCPIC_PREINS_CUS_HIS to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.USABLE_SHCPIC_PREINS_CUS_HIS to SXDXSJAPP;
grant select on SXDXSJ.USABLE_SHCPIC_PREINS_CUS_HIS to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.USABLE_SHCPIC_PREINS_CUS_HIS to SXDXSJMOD;

prompt
prompt Creating table USABLE_SHCPIC_PREINS_CUS_INF
prompt ===========================================
prompt
create table SXDXSJ.USABLE_SHCPIC_PREINS_CUS_INF
(
  usable_id           NUMBER(10) not null,
  usable_zone_number  VARCHAR2(10),
  usable_tele_number  VARCHAR2(20),
  c_agentcompany_code VARCHAR2(100),
  c_company_code      VARCHAR2(100),
  c_agentcompany_id   VARCHAR2(500),
  usable_status       NUMBER(5),
  usable_date         DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SXDXSJ.USABLE_SHCPIC_PREINS_CUS_INF to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.USABLE_SHCPIC_PREINS_CUS_INF to SXDXSJAPP;
grant select on SXDXSJ.USABLE_SHCPIC_PREINS_CUS_INF to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.USABLE_SHCPIC_PREINS_CUS_INF to SXDXSJMOD;

prompt
prompt Creating table USER_HISTORY
prompt ===========================
prompt
create table SXDXSJ.USER_HISTORY
(
  user_account VARCHAR2(100) not null,
  login_time   DATE,
  logoff_time  DATE
)
tablespace SXDXSJ_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SXDXSJ.USER_HISTORY
  is '记录所有有用户登录历史信息';
grant select on SXDXSJ.USER_HISTORY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.USER_HISTORY to SXDXSJAPP;
grant select on SXDXSJ.USER_HISTORY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.USER_HISTORY to SXDXSJMOD;


spool off
