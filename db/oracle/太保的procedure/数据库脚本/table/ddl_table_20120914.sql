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
  is '�ͻ��������˺���Ϣ';
comment on column SXDXSJ.BANK_ACCOUNTS.customer_id
  is '�ͻ����֤����';
comment on column SXDXSJ.BANK_ACCOUNTS.account_no
  is '�˻���';
comment on column SXDXSJ.BANK_ACCOUNTS.bank_code
  is '�����д���';
comment on column SXDXSJ.BANK_ACCOUNTS.bank_name
  is '������������';
comment on column SXDXSJ.BANK_ACCOUNTS.partition_col
  is '�ͻ�������';
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
  is '����������';
comment on column SXDXSJ.BARRING_NAME.barringname_id
  is '��������ID';
comment on column SXDXSJ.BARRING_NAME.customer_name
  is '�ͻ�����';
comment on column SXDXSJ.BARRING_NAME.customer_id
  is '���֤����';
comment on column SXDXSJ.BARRING_NAME.birthday
  is '��������';
comment on column SXDXSJ.BARRING_NAME.phone
  is '�绰����';
comment on column SXDXSJ.BARRING_NAME.barring_time
  is '����ʱ��';
comment on column SXDXSJ.BARRING_NAME.barring_type
  is '��������:01������,02������,03Ͷ��ͻ�';
comment on column SXDXSJ.BARRING_NAME.flag
  is '��Ч״̬:01��Ч';
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
  is '�绰��ϴ�����ι����
tel_dial_status:
-3����ͣ
-2��ȡ����
-1���쳣��
0��null���Ⲧ�У���ʼ״̬����
1����д���
mobile_dial_status:
-3����ͣ
-2��ȡ����
-1���쳣��
0��null���Ⲧ�У���ʼ״̬����
1����д���
clean_status:
-3����ͣ
-2��ȡ����
-1���쳣��
0��null���Ⲧ�У���ʼ״̬����
1����д���';
comment on column SXDXSJ.BATCH_MANAGEMENT.batch_code
  is '����';
comment on column SXDXSJ.BATCH_MANAGEMENT.clean_status
  is '״̬';
comment on column SXDXSJ.BATCH_MANAGEMENT.mobile_dial_status
  is '�ֻ���ϴ״̬';
comment on column SXDXSJ.BATCH_MANAGEMENT.tel_dial_status
  is '�̻���ϴ״̬';
comment on column SXDXSJ.BATCH_MANAGEMENT.mobile_begin_dial
  is '�ֻ���ʼ��ϴʱ��';
comment on column SXDXSJ.BATCH_MANAGEMENT.sms_send_end_time
  is 'Ԥ�ƶ��ŷ��ͽ���ʱ��';
comment on column SXDXSJ.BATCH_MANAGEMENT.mobile_end_dial
  is '�ֻ�������ϴʱ��';
comment on column SXDXSJ.BATCH_MANAGEMENT.tel_begin_dial
  is '�̻���ʼ��ϴʱ��';
comment on column SXDXSJ.BATCH_MANAGEMENT.tel_end_dial
  is '�̻�������ϴʱ��';
comment on column SXDXSJ.BATCH_MANAGEMENT.commit_time
  is '�ύ��ϴʱ��';
comment on column SXDXSJ.BATCH_MANAGEMENT.writeback_time
  is '��д��ϴʱ��';
comment on column SXDXSJ.BATCH_MANAGEMENT.init_mobile_count
  is '�ֻ���ʼ����';
comment on column SXDXSJ.BATCH_MANAGEMENT.init_tel_count
  is '�̻���ʼ����';
comment on column SXDXSJ.BATCH_MANAGEMENT.success_mobile_count
  is '�ֻ��ɹ�����';
comment on column SXDXSJ.BATCH_MANAGEMENT.success_tel_count
  is '�̻��ɹ�����';
comment on column SXDXSJ.BATCH_MANAGEMENT.init_count
  is '��ʼ����';
comment on column SXDXSJ.BATCH_MANAGEMENT.success_count
  is '�ɹ�����';
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
  is '��ϴ�еĵ绰���룬�����ֻ��͹̶��绰
status
1:�ɹ�
0:ʧ��';
comment on column SXDXSJ.CLEANING_PHONE.batch_code
  is '���α��';
comment on column SXDXSJ.CLEANING_PHONE.customer_id
  is '���֤����';
comment on column SXDXSJ.CLEANING_PHONE.phone
  is '�绰����';
comment on column SXDXSJ.CLEANING_PHONE.is_mobile
  is '�绰���ͺ���';
comment on column SXDXSJ.CLEANING_PHONE.status
  is '��ϴ���';
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
  is '��������ϴ�������е绰���뼰����ϴ���
dial_result
0 :ʧ��
1���ɹ�';
comment on column SXDXSJ.CLEAN_PHONE_HISTORY.phone
  is '�绰����';
comment on column SXDXSJ.CLEAN_PHONE_HISTORY.dial_time
  is '��ϴʱ��';
comment on column SXDXSJ.CLEAN_PHONE_HISTORY.dial_result
  is '��ϴ���';
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
  is '�н�����û���ϸ��Ϣ��';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.agentcompany_id
  is '�н����ID';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.agentcompany_name
  is '�н��������';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.salecall_status
  is 'Ӫ��������״̬';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.name_status
  is '�����Ƿ���ȷ״̬';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.birth_staus
  is '�����Ƿ���ȷ״̬';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.cus_phone
  is '�ͻ��绰����';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.ins_id
  is '����ID';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.ins_name
  is '��������';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.ins_fee
  is '����';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.statis_date
  is 'ͳ��ʱ��';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.call_date
  is '����ʱ��';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.oper_name
  is '����Ա����';
comment on column SXDXSJ.CPIC_AGENTCOMPANY_CUS_INFO.cus_name
  is '�ͻ�����';
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
  is '����Ͷ������ϸ��';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.grp_id
  is '��ĿȺid';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.grp_name
  is '��ĿȺ����';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.prj_id
  is '��Ŀid';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.prj_name
  is '��Ŀ����';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.region_code
  is '����id';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.region_name
  is '��������';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.appno
  is 'Ͷ������';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.ins_status
  is 'Ͷ����״̬';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.policy_holder
  is 'Ͷ��������';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.policy_phone
  is '��ϵ��ʽ';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.ins_id
  is '���ִ���';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.ins_name
  is '��������';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.policyfee
  is '����';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.bank_name
  is '��������';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.bank_account
  is '�����˺�';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.create_date
  is 'Ͷ������';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.modify_date
  is '����޸�����';
comment on column SXDXSJ.CPIC_PRESENTINS_DETAIL_INFO.import_date
  is '�ɹ���������';
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
  is '����Ͷ����״̬�����ʷ��';
comment on column SXDXSJ.CPIC_PRESENTINS_STACHANGE_HIS.appno
  is 'Ͷ������';
comment on column SXDXSJ.CPIC_PRESENTINS_STACHANGE_HIS.ins_status
  is 'Ͷ����״̬';
comment on column SXDXSJ.CPIC_PRESENTINS_STACHANGE_HIS.change_date
  is '���ʱ��';
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
  is '������ʷ��Ϣ��';
comment on column SXDXSJ.CPIC_PRESENTINS_WORKLIST_HIS.oper_id
  is '����Ա����';
comment on column SXDXSJ.CPIC_PRESENTINS_WORKLIST_HIS.nc_status
  is '����״̬��';
comment on column SXDXSJ.CPIC_PRESENTINS_WORKLIST_HIS.appno
  is 'Ͷ������';
comment on column SXDXSJ.CPIC_PRESENTINS_WORKLIST_HIS.create_date
  is '����ʱ��';
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
  is '�ͻ���Ϣ���������е�ά����Ϣ';
comment on column SXDXSJ.CUSTOMER.customer_id
  is '���֤����';
comment on column SXDXSJ.CUSTOMER.copy_id
  is '���֤���븱��';
comment on column SXDXSJ.CUSTOMER.customer_name
  is '����';
comment on column SXDXSJ.CUSTOMER.birthday
  is '����������';
comment on column SXDXSJ.CUSTOMER.age
  is '����';
comment on column SXDXSJ.CUSTOMER.gender_code
  is '�Ա����';
comment on column SXDXSJ.CUSTOMER.marital_status
  is '����״��';
comment on column SXDXSJ.CUSTOMER.death_critical_illness
  is '�������ش󼲲���¼';
comment on column SXDXSJ.CUSTOMER.fax
  is '����';
comment on column SXDXSJ.CUSTOMER.family_zip_code
  is '��ͥ��������';
comment on column SXDXSJ.CUSTOMER.company_zip_code
  is '��λ��������';
comment on column SXDXSJ.CUSTOMER.family_address
  is '��ͥ��ַ';
comment on column SXDXSJ.CUSTOMER.company_address
  is '��λ��ַ';
comment on column SXDXSJ.CUSTOMER.company
  is '��ҵ����';
comment on column SXDXSJ.CUSTOMER.contact_address
  is 'ͨѶ��ַ';
comment on column SXDXSJ.CUSTOMER.job_name
  is 'ְҵ����';
comment on column SXDXSJ.CUSTOMER.education_level
  is '�����̶�/ѧ��';
comment on column SXDXSJ.CUSTOMER.income
  is '����';
comment on column SXDXSJ.CUSTOMER.email
  is '�����ʼ�';
comment on column SXDXSJ.CUSTOMER.month_amount
  is '�½ɱ���';
comment on column SXDXSJ.CUSTOMER.zone_code
  is '�������';
comment on column SXDXSJ.CUSTOMER.update_time
  is '����������';
comment on column SXDXSJ.CUSTOMER.govern_id
  is '������';
comment on column SXDXSJ.CUSTOMER.latest_sale_date
  is '���һ������ʱ��';
comment on column SXDXSJ.CUSTOMER.revist_time
  is '�ط�ʱ��';
comment on column SXDXSJ.CUSTOMER.revist_result
  is '�طý��';
comment on column SXDXSJ.CUSTOMER.source_type_code
  is '��Ϣ��Դ';
comment on column SXDXSJ.CUSTOMER.age_zone_code
  is '�������';
comment on column SXDXSJ.CUSTOMER.birthdate_month_day_code
  is '�����·�';
comment on column SXDXSJ.CUSTOMER.from_last_sale_time_code
  is '���һ�����۾�����ʱ��';
comment on column SXDXSJ.CUSTOMER.dial_times_code
  is '��������';
comment on column SXDXSJ.CUSTOMER.clear_status_code
  is '��ϴ״̬��';
comment on column SXDXSJ.CUSTOMER.operation_status_code
  is '��ȫ״̬��';
comment on column SXDXSJ.CUSTOMER.sale_status_code
  is '����״̬��';
comment on column SXDXSJ.CUSTOMER.orphan_status_code
  is '�¶���״̬��';
comment on column SXDXSJ.CUSTOMER.bank_status_code
  is '����״̬��';
comment on column SXDXSJ.CUSTOMER.policy_status_code
  is '����״̬��';
comment on column SXDXSJ.CUSTOMER.branch_delivery_code
  is '�Ƿ�ɷֹ�˾���';
comment on column SXDXSJ.CUSTOMER.company_delivery_code
  is '�Ƿ���ܹ�˾���';
comment on column SXDXSJ.CUSTOMER.pay_by_pos_code
  is '�Ƿ��pos������';
comment on column SXDXSJ.CUSTOMER.pay_by_bank_code
  is '�Ƿ�����д���';
comment on column SXDXSJ.CUSTOMER.has_rectele_code
  is '�Ƿ����շѵ绰';
comment on column SXDXSJ.CUSTOMER.has_ftele_code
  is '�Ƿ��м�ͥ�绰';
comment on column SXDXSJ.CUSTOMER.has_ctele_code
  is '�Ƿ��а칫�绰';
comment on column SXDXSJ.CUSTOMER.has_mobile_code
  is '�Ƿ����ֻ�';
comment on column SXDXSJ.CUSTOMER.month_amount_code
  is '�½ɱ�������';
comment on column SXDXSJ.CUSTOMER.zone_type_code
  is '��������';
comment on column SXDXSJ.CUSTOMER.dial_time_length_code
  is 'ͨ��ʱ������';
comment on column SXDXSJ.CUSTOMER.level_code
  is '�ͻ��ȼ�';
comment on column SXDXSJ.CUSTOMER.city
  is '��';
comment on column SXDXSJ.CUSTOMER.province
  is 'ʡ';
comment on column SXDXSJ.CUSTOMER.from_last_revist_time_code
  is '�طþ�������ʱ��';
comment on column SXDXSJ.CUSTOMER.branch_code
  is '�ֹ�˾��֧����';
comment on column SXDXSJ.CUSTOMER.note
  is '��ע';
comment on column SXDXSJ.CUSTOMER.any_date
  is '����';
comment on column SXDXSJ.CUSTOMER.other_info_1
  is '����1';
comment on column SXDXSJ.CUSTOMER.other_info_2
  is '����2';
comment on column SXDXSJ.CUSTOMER.other_info_3
  is '����3';
comment on column SXDXSJ.CUSTOMER.other_info_5
  is '����5';
comment on column SXDXSJ.CUSTOMER.other_info_4
  is '����4';
comment on column SXDXSJ.CUSTOMER.batch_id
  is '���κ�';
comment on column SXDXSJ.CUSTOMER.task_id
  is '������';
comment on column SXDXSJ.CUSTOMER.tel_code
  is '�绰����';
comment on column SXDXSJ.CUSTOMER.purchase_product_list
  is '�ѹ����Ʒ�б�';
comment on column SXDXSJ.CUSTOMER.d_donation_code
  is '�Ƿ��������';
comment on column SXDXSJ.CUSTOMER.partition_col
  is '�ͻ�������';
comment on column SXDXSJ.CUSTOMER.ismeet
  is '�ڽ�/���ɱ�־;';
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
  is '���пͻ��ĵ绰���룬�����ֻ��͹̶��绰';
comment on column SXDXSJ.CUSTOMER_PHONE.customer_id
  is '�ͻ����֤����';
comment on column SXDXSJ.CUSTOMER_PHONE.phone
  is '�绰����';
comment on column SXDXSJ.CUSTOMER_PHONE.phone_type
  is '�绰����';
comment on column SXDXSJ.CUSTOMER_PHONE.tel_code
  is '�绰����';
comment on column SXDXSJ.CUSTOMER_PHONE.dial_status_code
  is '��ϴ״̬��';
comment on column SXDXSJ.CUSTOMER_PHONE.batch_no
  is '���α��';
comment on column SXDXSJ.CUSTOMER_PHONE.begin_dial
  is '��ʼ��ϴʱ��';
comment on column SXDXSJ.CUSTOMER_PHONE.end_dial
  is '������ϴʱ��';
comment on column SXDXSJ.CUSTOMER_PHONE.partition_col
  is '�ͻ�������';
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
  is '�н��������Ϣ';
comment on column SXDXSJ.C_AGENTCOMPANY.c_agentcompany_id
  is '�н����ID';
comment on column SXDXSJ.C_AGENTCOMPANY.t_agentcompany_type_id
  is '�н��������ID';
comment on column SXDXSJ.C_AGENTCOMPANY.c_agentcompany_name
  is '�н��������';
comment on column SXDXSJ.C_AGENTCOMPANY.c_agentcompany_code
  is '�н��������';
comment on column SXDXSJ.C_AGENTCOMPANY.c_company_id
  is '�����ֹ�˾';
comment on column SXDXSJ.C_AGENTCOMPANY.c_agentcompany_contact
  is '��ϵ��';
comment on column SXDXSJ.C_AGENTCOMPANY.c_agentcompany_contact_sub
  is '��ϵ�绰';
comment on column SXDXSJ.C_AGENTCOMPANY.c_agentcompany_addr
  is '��ַ';
comment on column SXDXSJ.C_AGENTCOMPANY.c_agentcompany_status
  is '�н����״̬��1Ϊ���ã�2Ϊ����';
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
  is '�н�����¶�ϵ��id';
comment on column SXDXSJ.C_AGENTCOMPANY_FACTOR.c_agentcompany_id
  is '�н�������룺ͬd_agentcompany.deptcode����';
comment on column SXDXSJ.C_AGENTCOMPANY_FACTOR.c_agentcompany_factor_sale
  is '��������';
comment on column SXDXSJ.C_AGENTCOMPANY_FACTOR.c_agentcompany_factor_grow
  is '�¶��껯�걣����������';
comment on column SXDXSJ.C_AGENTCOMPANY_FACTOR.c_agentcompany_factor_com
  is 'Ͷ����ϵ��';
comment on column SXDXSJ.C_AGENTCOMPANY_FACTOR.c_agentcompany_factor_new
  is '��һ���ȸ����ۻ����껯�±�ռ��';
comment on column SXDXSJ.C_AGENTCOMPANY_FACTOR.c_agentcompany_factor_date
  is '¼��ʱ��';
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
  is '���SHCPIC_OUTDATAһ��Э������ͬ��ɹ̶��绰����ϴ��C_CPIC_DIAL���ڴ����ϴ�ĵ绰���绰��ص���Ϣ����ϴ�����������ص�ʱ�����Ϣ��';
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
  is '�����ֵ��"DICTIONRY_CODE, TENEMENTID, PARENT_ID��DISORDER, PARENT_ID treeparentid����ΨһԼ��һ������!';
comment on column SXDXSJ.C_DICTIONARY.dictionry_id
  is '����,��ֵ�� PARENT_ID+''|''+TENEMENTID+''|''+DICTIONRY_CODE';
comment on column SXDXSJ.C_DICTIONARY.dictionary_code
  is '�ֵ����,DICTIONRY_CODE, TENEMENTID, PARENT_ID����Ψһ';
comment on column SXDXSJ.C_DICTIONARY.tree_parent_id
  is 'TREE_PARENT_ID';
comment on column SXDXSJ.C_DICTIONARY.disorder
  is '�����ֵ�,DISORDER, PARENT_ID treeparentid����Ψһ';
comment on column SXDXSJ.C_DICTIONARY.dictdesc
  is '�ֵ�����';
comment on column SXDXSJ.C_DICTIONARY.parent_id
  is 'PARENT_ID';
comment on column SXDXSJ.C_DICTIONARY.tenementid
  is '�⻧ID, ���tenementIdΪ����Ϊ����������ֵ��';
comment on column SXDXSJ.C_DICTIONARY.isdel
  is '1ɾ����Ĭ��0';
comment on column SXDXSJ.C_DICTIONARY.istenementshare
  is '�Ƿ�Ϊ�����⻧�乲��,Ĭ��0. 1��';
comment on column SXDXSJ.C_DICTIONARY.isegeneratepage
  is '�Ƿ�����������������ɴ���, Ĭ��0. 1����';
comment on column SXDXSJ.C_DICTIONARY.isdefaultvalue
  is '�Ƿ�ΪĬ��ֵ,1��, Ĭ��0';
comment on column SXDXSJ.C_DICTIONARY.userid
  is '�����û�';
comment on column SXDXSJ.C_DICTIONARY.createdate
  is '������';
comment on column SXDXSJ.C_DICTIONARY.population_tsmp
  is '����ʱ���';
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
  is '��ɫ��

����˵����
1��ɾ����ɫ֮ǰ�Ƚ��������ϵͳ�û�ɾ����������ɾ����ɫ��¼��
2��ɾ��ʱ��ͬʱ����ɫ�µĲ˵�Ȩ��Ҳһ��ɾ����
';
comment on column SXDXSJ.C_ROLE.roleid
  is 'ROLEID';
comment on column SXDXSJ.C_ROLE.tenementid
  is '����';
comment on column SXDXSJ.C_ROLE.name
  is '��ɫ��';
comment on column SXDXSJ.C_ROLE.updatedate
  is '����ʱ��';
comment on column SXDXSJ.C_ROLE.updateuserid
  is '�����û�';
comment on column SXDXSJ.C_ROLE.isdel
  is 'Ĭ��0
ɾ��Ϊ1';
comment on column SXDXSJ.C_ROLE.remark
  is 'REMARK';
comment on column SXDXSJ.C_ROLE.role_type
  is '��ɫ����';
comment on column SXDXSJ.C_ROLE.create_user
  is '������';
comment on column SXDXSJ.C_ROLE.create_time
  is '����ʱ��';
comment on column SXDXSJ.C_ROLE.population_tsmp
  is '����ʱ���';
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
  is '�û���
1.  ��������Ա���Բ鿴���е��û�����.
4. ϵͳ��ֻ����һ����������Ա.
';
comment on column SXDXSJ.C_USER.userid
  is '����,��ʽΪ(ΪtenmentId+"_"+loginId)';
comment on column SXDXSJ.C_USER.loginid
  is '��¼�ʺš�';
comment on column SXDXSJ.C_USER.employeename
  is '�û���������Ա��Ϣ�еĹ�Ա����';
comment on column SXDXSJ.C_USER.password
  is '����';
comment on column SXDXSJ.C_USER.isdel
  is '1��ɾ����0��ɾ����
Ĭ��0';
comment on column SXDXSJ.C_USER.defaultlanguage
  is '��ǰʹ�õĵ�¼���ԣ�Ŀǰֻ��zh_CN.
�ֵ䣺parent=SYSTEM_LANGUAGE  ϵͳ�ֵ�';
comment on column SXDXSJ.C_USER.issuperadmin
  is '�Ƿ�Ϊ��������Ա(�ɿ������еĲ˵��������⻧���������Ƶ�)
��Ϊ0
��Ϊ1. ';
comment on column SXDXSJ.C_USER.updatedate
  is '����ʱ��
';
comment on column SXDXSJ.C_USER.updateuserid
  is '�����ʺ�';
comment on column SXDXSJ.C_USER.employeeid
  is 'C_EMPLOYEE���';
comment on column SXDXSJ.C_USER.defaulttenementid
  is 'Ĭ���⻧���(��ǰѡ�е��⻧)';
comment on column SXDXSJ.C_USER.defaultgroupid
  is 'Ĭ���û���';
comment on column SXDXSJ.C_USER.org_id
  is '����ID';
comment on column SXDXSJ.C_USER.workplace_id
  is 'ְ��������е�ְ�����';
comment on column SXDXSJ.C_USER.sale_channel
  is '��������';
comment on column SXDXSJ.C_USER.max_lists
  is '���������';
comment on column SXDXSJ.C_USER.agentid
  is 'AGENTID';
comment on column SXDXSJ.C_USER.skill_id
  is '������ID';
comment on column SXDXSJ.C_USER.create_user
  is '������';
comment on column SXDXSJ.C_USER.create_time
  is '����ʱ��';
comment on column SXDXSJ.C_USER.population_tsmp
  is '����ʱ���';
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
  is '�û����ɫ��ϵ��';
comment on column SXDXSJ.C_USER_ROLE.roleid
  is 'ROLEID';
comment on column SXDXSJ.C_USER_ROLE.userid
  is 'USERID';
comment on column SXDXSJ.C_USER_ROLE.tenementid
  is '�⻧ID';
comment on column SXDXSJ.C_USER_ROLE.population_tsmp
  is '����ʱ���';
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
  is '�������Ϣ';
comment on column SXDXSJ.DX_ACTIVITY.activity_id
  is '�ID';
comment on column SXDXSJ.DX_ACTIVITY.activity_name
  is '���';
comment on column SXDXSJ.DX_ACTIVITY.activity_start_time
  is '���ʼʱ��';
comment on column SXDXSJ.DX_ACTIVITY.activity_end_time
  is '�����ʱ��';
comment on column SXDXSJ.DX_ACTIVITY.product_code
  is '��Ʒ����';
comment on column SXDXSJ.DX_ACTIVITY.product_name
  is '��Ʒ��';
comment on column SXDXSJ.DX_ACTIVITY.status
  is '�״̬';
comment on column SXDXSJ.DX_ACTIVITY.activity_description
  is '�����';
comment on column SXDXSJ.DX_ACTIVITY.note
  is '��ע';
comment on column SXDXSJ.DX_ACTIVITY.batch_id
  is '���α��';
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
  is '�ͻ��������Ĺ�ϵ��';
comment on column SXDXSJ.DX_ACTIVITY_CUSTOMER.activity_id
  is '�ID';
comment on column SXDXSJ.DX_ACTIVITY_CUSTOMER.customer_id
  is '�ͻ����֤��';
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
  is '������������Ϣ';
comment on column SXDXSJ.DX_DIAL_RESULT.activity_id
  is '�ID';
comment on column SXDXSJ.DX_DIAL_RESULT.customer_id
  is '֤������';
comment on column SXDXSJ.DX_DIAL_RESULT.mobile_phone
  is '�ֻ�����';
comment on column SXDXSJ.DX_DIAL_RESULT.family_phone
  is '��ͥ�绰';
comment on column SXDXSJ.DX_DIAL_RESULT.office_phone
  is '�칫�绰';
comment on column SXDXSJ.DX_DIAL_RESULT.charge_phone
  is '�շѵ绰';
comment on column SXDXSJ.DX_DIAL_RESULT.other_phone
  is '�����绰';
comment on column SXDXSJ.DX_DIAL_RESULT.status
  is '״̬';
comment on column SXDXSJ.DX_DIAL_RESULT.passed_phone
  is '��ͨ�绰';
comment on column SXDXSJ.DX_DIAL_RESULT.dial_time_length
  is 'ͨ��ʱ��';
comment on column SXDXSJ.DX_DIAL_RESULT.dial_time
  is '����ʱ��';
comment on column SXDXSJ.DX_DIAL_RESULT.partition_col
  is '������';
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
  is '���е�����Ʒ��Ϣ';
comment on column SXDXSJ.DX_PRODUCT.product_code
  is '��Ʒ����';
comment on column SXDXSJ.DX_PRODUCT.product_alpha
  is '��Ʒ��Ӧ��ĸ';
comment on column SXDXSJ.DX_PRODUCT.product_name
  is '��Ʒ��';
comment on column SXDXSJ.DX_PRODUCT.product_description
  is '��Ʒ����';
comment on column SXDXSJ.DX_PRODUCT.contain_class_list
  is '���������б�';
comment on column SXDXSJ.DX_PRODUCT.create_time
  is '����ʱ��';
comment on column SXDXSJ.DX_PRODUCT.create_user
  is '������';
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
  is '���ݵ��뵼����ģ����Ϣ
��������ʽ���ֶ�������󣬵���ʱ�򽫻ᱻ�ضϡ�
���û������жϡ�
�ļ�����
0��txt
1:excel2003
2 excel2007
��������
0���ֹ�˾��ȫ
1����������ȫ
2����������';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.template_id
  is 'ģ����';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.template_name
  is 'ģ������';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.template_str
  is 'ģ���ַ���';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.template_header
  is '��������';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.file_type
  is '�ļ�����';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.delimiter
  is '�ֶηָ���';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.export_type
  is '��������';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.branch_abbreviation
  is '�ֹ�˾���';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.customer_id
  is '�ͻ����֤��';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.id_type
  is '֤������';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.customer_name
  is '�ͻ�����';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.birthday
  is '����������';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.gender_code
  is '�Ա�';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.marital_status
  is '����״��';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.death_critical_illness
  is '�������ش󼲲���¼';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.family_phone
  is '��ͥ�绰����';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.office_phone
  is '�칫�绰����';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.mobile
  is '�ƶ��绰����';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.charge_phone
  is '�շѵ绰';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.other_phone
  is '�����绰����';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.fax
  is '����';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.family_zip_code
  is '��ͥ�ʱ�';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.company_zip_code
  is '��λ�ʱ�';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.family_address
  is '��ͥ��ַ';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.company_address
  is '�칫��ַ';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.contact_address
  is 'ͨѶ��ַ';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.job_name
  is 'ְҵ';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.company
  is '������ҵ����';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.email
  is '�����ʼ�';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.bank_name
  is '������������';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.bank_account
  is '���������ʻ�';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.policy_no
  is '������';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.class_name
  is '��������';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.province
  is '����ʡ';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.city
  is '������';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.phone_code
  is '�绰����';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.zone_code
  is '�������';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.age
  is '����';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.note
  is '��ע';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.any_date
  is '��������';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.other1
  is '����1';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.other2
  is '����2';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.other3
  is '����3';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.other4
  is '����4';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.other5
  is '����5';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.active
  is '�Ƿ����';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.creator
  is '������';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.create_date
  is '��������';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.modifier
  is '�޸���';
comment on column SXDXSJ.DYNAMIC_FIELDS_TEMPLATE.modify_date
  is '�޸�����';
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
  is 'ģ��id';
comment on column SXDXSJ.DYNAMIC_PREINS_TEMPLATE.template_name
  is 'ģ������';
comment on column SXDXSJ.DYNAMIC_PREINS_TEMPLATE.template_str
  is 'ģ�������������ֶ���';
comment on column SXDXSJ.DYNAMIC_PREINS_TEMPLATE.template_header
  is 'ģ�����������������ֶ���';
comment on column SXDXSJ.DYNAMIC_PREINS_TEMPLATE.active
  is '�Ƿ���ʾ';
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
  is 'ά��ö�ٱ�
�ͻ��Ƿ��������';
comment on column SXDXSJ.D_ACCEPT_DONATION.d_donation_code
  is '���';
comment on column SXDXSJ.D_ACCEPT_DONATION.d_donation_name
  is '����';
comment on column SXDXSJ.D_ACCEPT_DONATION.d_donation_desc
  is '����';
comment on column SXDXSJ.D_ACCEPT_DONATION.active
  is '�Ƿ����';
comment on column SXDXSJ.D_ACCEPT_DONATION.creator
  is '������';
comment on column SXDXSJ.D_ACCEPT_DONATION.create_time
  is '��������';
comment on column SXDXSJ.D_ACCEPT_DONATION.modifier
  is '�޸���';
comment on column SXDXSJ.D_ACCEPT_DONATION.modify_date
  is '�޸�����';
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
  is 'ά��ö�ٱ�
�оٿͻ�������ֶ���Ϣ
ageȡֵ��
0-17��	18-25��	26-35��	36-45��	46-55��	>55��';
comment on column SXDXSJ.D_AGE_INFO.age_zone_code
  is '�������';
comment on column SXDXSJ.D_AGE_INFO.age_zone_name
  is '�����';
comment on column SXDXSJ.D_AGE_INFO.min_age
  is '��С����';
comment on column SXDXSJ.D_AGE_INFO.max_age
  is '�������';
comment on column SXDXSJ.D_AGE_INFO.active
  is '�Ƿ����';
comment on column SXDXSJ.D_AGE_INFO.creator
  is '������';
comment on column SXDXSJ.D_AGE_INFO.create_date
  is '��������';
comment on column SXDXSJ.D_AGE_INFO.modifier
  is '�޸���';
comment on column SXDXSJ.D_AGE_INFO.modify_date
  is '�޸�����';
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
  is '����Ͷ����״̬��ά��';
comment on column SXDXSJ.D_APPNO_STATUS.appno_status_code
  is 'Ͷ����״̬��';
comment on column SXDXSJ.D_APPNO_STATUS.appno_status_name
  is 'Ͷ����״̬����';
comment on column SXDXSJ.D_APPNO_STATUS.active
  is '�Ƿ����';
comment on column SXDXSJ.D_APPNO_STATUS.creator
  is '������';
comment on column SXDXSJ.D_APPNO_STATUS.create_date
  is '��������';
comment on column SXDXSJ.D_APPNO_STATUS.modifier
  is '�޸���';
comment on column SXDXSJ.D_APPNO_STATUS.modify_date
  is '�޸�����';
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
  is 'ά��ö�ٱ�
����״̬��������ƣ�';
comment on column SXDXSJ.D_BANK_STATUS_INFO.bank_status_code
  is '״̬����';
comment on column SXDXSJ.D_BANK_STATUS_INFO.bank_status_name
  is '״̬����';
comment on column SXDXSJ.D_BANK_STATUS_INFO.active
  is '�Ƿ����';
comment on column SXDXSJ.D_BANK_STATUS_INFO.creator
  is '������';
comment on column SXDXSJ.D_BANK_STATUS_INFO.createtime
  is '��������';
comment on column SXDXSJ.D_BANK_STATUS_INFO.modifier
  is '�޸���';
comment on column SXDXSJ.D_BANK_STATUS_INFO.modify_date
  is '�޸�����';
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
  is 'ά��ö�ٱ�
�ͻ���������Ӧ���·ݺ������仮����Ϣ';
comment on column SXDXSJ.D_BIRTHDATE_MONTH.min_day
  is '��С��';
comment on column SXDXSJ.D_BIRTHDATE_MONTH.max_day
  is '�����';
comment on column SXDXSJ.D_BIRTHDATE_MONTH.active
  is '�Ƿ����';
comment on column SXDXSJ.D_BIRTHDATE_MONTH.creator
  is '������';
comment on column SXDXSJ.D_BIRTHDATE_MONTH.create_time
  is '��������';
comment on column SXDXSJ.D_BIRTHDATE_MONTH.modifier
  is '�޸���';
comment on column SXDXSJ.D_BIRTHDATE_MONTH.modify_date
  is '�޸�����';
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
  is 'ά��ö�ٱ�
�ֹ�˾�Ŀ���Ƿ�����ʹ�';
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
  is 'ά��ö�ٱ�
����̫�����շֹ�˾������֧����Ϣ��';
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
  is '����ά�ȱ�';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_day_id
  is '�ձ�ʶ';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_day_code
  is '�ո�ʽ';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_day_nm
  is '��ȫ��';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_week_id
  is '�ܱ�ʶ';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_week_nm
  is '��ȵڼ���';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_week_code
  is '��ȫ��';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_week_day
  is '�������ڼ�';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_week_mon
  is '���µڼ���';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_ten_day
  is 'Ѯ��ʶ��1��Ϊ��Ѯ��2Ϊ��Ѯ��3Ϊ��Ѯ';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_ten_day_desc
  is 'Ѯ��������Ѯ����Ѯ����Ѯ';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_mon_id
  is '�·ݱ�ʶ';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_mon_nm
  is '�·�����';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_mon_num
  is '�·����';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_quarter_id
  is '���ȴ���';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_quarter_nm
  is '��������';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_quarter_num
  is '�������';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_yr_id
  is '��ݴ���';
comment on column SXDXSJ.D_CALENDAR_DIM.cal_yr_nm
  is '�������';
comment on column SXDXSJ.D_CALENDAR_DIM.year_segm
  is '��ݶΣ��ϰ��ꡢ�°���';
comment on column SXDXSJ.D_CALENDAR_DIM.year_interval
  is '������';
comment on column SXDXSJ.D_CALENDAR_DIM.quarter_interval
  is '��������';
comment on column SXDXSJ.D_CALENDAR_DIM.month_interval
  is '������';
comment on column SXDXSJ.D_CALENDAR_DIM.week_interval
  is '������';
comment on column SXDXSJ.D_CALENDAR_DIM.week_interval_id
  is '�������ʶ';
comment on column SXDXSJ.D_CALENDAR_DIM.load_date
  is '��������';
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
  is 'Ӫ�����ղ�����״̬ά��';
comment on column SXDXSJ.D_CALLRESULT_STATUS.callresult_code
  is '������״̬��';
comment on column SXDXSJ.D_CALLRESULT_STATUS.callresult_name
  is '������״̬����';
comment on column SXDXSJ.D_CALLRESULT_STATUS.active
  is '�Ƿ����';
comment on column SXDXSJ.D_CALLRESULT_STATUS.create_date
  is '��������';
comment on column SXDXSJ.D_CALLRESULT_STATUS.creator
  is '������';
comment on column SXDXSJ.D_CALLRESULT_STATUS.modify_date
  is '�޸�����';
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
  is 'ά��ö�ٱ�����ϵͳ�������������Ϣ��1���ײ���2��������3��������4���첦';
comment on column SXDXSJ.D_CALL_TIMES.call_times_no
  is '�����������';
comment on column SXDXSJ.D_CALL_TIMES.call_times_nm
  is '�����������';
comment on column SXDXSJ.D_CALL_TIMES.active
  is '�Ƿ���ã�1Ϊ���ã�0ΪʧЧ';
comment on column SXDXSJ.D_CALL_TIMES.creator
  is '������';
comment on column SXDXSJ.D_CALL_TIMES.createtime
  is '��������';
comment on column SXDXSJ.D_CALL_TIMES.modifier
  is '�޸���';
comment on column SXDXSJ.D_CALL_TIMES.modify_date
  is '�޸�����';
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
  is 'ά��ö�ٱ�
�ܹ�˾�Ŀ���Ƿ�����ʹ�';
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
  is 'ά��ö�ٱ�����ϵͳ�������ʹ�����Ϣ��1���¶�����2������';
comment on column SXDXSJ.D_COMTYPE_INFO.com_type_code
  is '�������ʹ���';
comment on column SXDXSJ.D_COMTYPE_INFO.com_type_name
  is '������������';
comment on column SXDXSJ.D_COMTYPE_INFO.active
  is '�Ƿ���ã�1Ϊ���ã�0ΪʧЧ';
comment on column SXDXSJ.D_COMTYPE_INFO.creator
  is '������';
comment on column SXDXSJ.D_COMTYPE_INFO.createtime
  is '��������';
comment on column SXDXSJ.D_COMTYPE_INFO.modifier
  is '�޸���';
comment on column SXDXSJ.D_COMTYPE_INFO.modify_date
  is '�޸�����';
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
  is 'ά��ö�ٱ�
�оٸ��ֿͻ��ȼ�';
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
  is 'ά��ö�ٱ�
�оٿͻ��ĸ�����ϴ״̬
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
  is 'ά��ö�ٱ�
�ͻ�����ĵ�������';
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
  is 'ά��ö�ٱ�
�оٵ���ͨ��ʱ��������Ϣ';
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
  is 'ά��ö�ٱ�
�о����һ�λط�ʱ��������ڵ�ʱ�䣬��3���¡�6����';
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
  is 'ά��ö�ٱ�
�о������Ա����ͣ����У�Ů��δ֪';
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
  is 'ά��ö�ٱ�
�ͻ��Ƿ��а칫�绰';
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
  is 'ά��ö�ٱ�
�ͻ��Ƿ��м�ͥ�绰';
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
  is 'ά��ö�ٱ�
�ͻ��Ƿ����ƶ��绰���ֻ���';
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
  is 'ά��ö�ٱ�
�ͻ��Ƿ����շѵ绰';
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
  is '�ڽ�/������Ϣά��';
comment on column SXDXSJ.D_ISMEET_CHARGEWAY.ismeet_code
  is '�Ƿ������ڽ��������ݱ�־';
comment on column SXDXSJ.D_ISMEET_CHARGEWAY.ismeet_desc
  is '�Ƿ������ڽ��������ݱ�־����';
comment on column SXDXSJ.D_ISMEET_CHARGEWAY.create_time
  is '����ʱ��';
comment on column SXDXSJ.D_ISMEET_CHARGEWAY.remark
  is '��ע';
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
  is 'ά��ö�ٱ�
ĳһ�ͻ����е������ϳɽ��������½ɱ����ܺ͵�������Ϣ����0~200Ԫ';
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
  is 'ά��ö�ٱ�
��ȫ״̬��������ƣ�
0  δ��ȫ
1  ��ȫ��
2  ��ȫ�ɹ�
3  ��ȫʧ��';
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
  is 'ά��ö�ٱ�
�оٿͻ���ǰ״̬����¶������ǹ¶����������ͻ�';
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
  is 'ά��ö�ٱ�����ϵͳ�ɷѷ�ʽ������Ϣ��һ�ν���	1����� 13���½�	10������ 	01������ 11';
comment on column SXDXSJ.D_PAYMODE_INFO.pay_mode_code
  is '�ɷѷ�ʽ����';
comment on column SXDXSJ.D_PAYMODE_INFO.pay_mode_name
  is '�ɷѷ�ʽ����';
comment on column SXDXSJ.D_PAYMODE_INFO.active
  is '�Ƿ���ã�1Ϊ���ã�0ΪʧЧ';
comment on column SXDXSJ.D_PAYMODE_INFO.creator
  is '������';
comment on column SXDXSJ.D_PAYMODE_INFO.createtime
  is '��������';
comment on column SXDXSJ.D_PAYMODE_INFO.modifier
  is '�޸���';
comment on column SXDXSJ.D_PAYMODE_INFO.modify_date
  is '�޸�����';
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
  is 'ά��ö�ٱ�
�Ƿ��ͨ�����д��۵ķ�ʽ�ɽ�����';
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
  is 'ά��ö�ٱ�
�Ƿ����ͨ��pos�����ѹ��򱣵�';
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
  is 'ά��ö�ٱ�
����״̬��������ƣ�
0 ��Ч
1 �ޱ���
2 ��Ч
3 ����
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
  is '���ս������ö�ٱ�';
comment on column SXDXSJ.D_PREINS_BARRING.c_preins_bar_flag
  is '���ս������ݱ�־';
comment on column SXDXSJ.D_PREINS_BARRING.c_preins_bar_desc
  is '���ս������ݱ�־����';
comment on column SXDXSJ.D_PREINS_BARRING.create_time
  is '����ʱ��';
comment on column SXDXSJ.D_PREINS_BARRING.remark
  is '��ע';
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
  is '���֤��Ч��ö����Ϣ��';
comment on column SXDXSJ.D_PREINS_CARDID_REPEAT.c_card_id_valid_flag
  is '���֤��Ч���ݱ�־';
comment on column SXDXSJ.D_PREINS_CARDID_REPEAT.c_card_id_valid_desc
  is '���֤��Ч���ݱ�־����';
comment on column SXDXSJ.D_PREINS_CARDID_REPEAT.create_time
  is '����ʱ��';
comment on column SXDXSJ.D_PREINS_CARDID_REPEAT.remark
  is '��ע';
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
  is '���ջ���ά��';
comment on column SXDXSJ.D_PREINS_COMPANY.preins_company_code
  is '�ֹ�˾����';
comment on column SXDXSJ.D_PREINS_COMPANY.preins_company_name
  is '�ֹ�˾';
comment on column SXDXSJ.D_PREINS_COMPANY.preins_middle_code
  is '��֧��˾����';
comment on column SXDXSJ.D_PREINS_COMPANY.preins_middle_name
  is '��֧��˾';
comment on column SXDXSJ.D_PREINS_COMPANY.create_time
  is '����ʱ��';
comment on column SXDXSJ.D_PREINS_COMPANY.active
  is '�Ƿ���Ч';
comment on column SXDXSJ.D_PREINS_COMPANY.remark
  is '��ע';
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
  is '���տͻ�����ö�ٱ�';
comment on column SXDXSJ.D_PREINS_CUS_NAMEVALID.c_name_invalid_flag
  is '���տͻ��������ݱ�־';
comment on column SXDXSJ.D_PREINS_CUS_NAMEVALID.c_name_invalid_desc
  is '���տͻ�������������';
comment on column SXDXSJ.D_PREINS_CUS_NAMEVALID.create_time
  is '����ʱ��';
comment on column SXDXSJ.D_PREINS_CUS_NAMEVALID.remark
  is '��ע';
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
  is '���տͻ�����/����ö�ٱ�';
comment on column SXDXSJ.D_PREINS_NAMEBIRTH.name_status_code
  is '�����Ƿ���Ч״̬��';
comment on column SXDXSJ.D_PREINS_NAMEBIRTH.name_status_desc
  is '�����Ƿ���Ч����';
comment on column SXDXSJ.D_PREINS_NAMEBIRTH.birth_status_code
  is '�����Ƿ���Ч״̬��';
comment on column SXDXSJ.D_PREINS_NAMEBIRTH.birth_status_desc
  is '�����Ƿ���Ч����';
comment on column SXDXSJ.D_PREINS_NAMEBIRTH.create_tme
  is '����ʱ��';
comment on column SXDXSJ.D_PREINS_NAMEBIRTH.remark
  is '��ע';
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
  is '���������ظ�ö����Ϣ��';
comment on column SXDXSJ.D_PREINS_OTHERORG_REPEAT.c_preins_repeat_flag
  is '�����ظ����ݱ�־';
comment on column SXDXSJ.D_PREINS_OTHERORG_REPEAT.c_preins_repeat_desc
  is '�����ظ����ݱ�־����';
comment on column SXDXSJ.D_PREINS_OTHERORG_REPEAT.create_time
  is '����ʱ��';
comment on column SXDXSJ.D_PREINS_OTHERORG_REPEAT.remark
  is '��ע';
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
  is '���������ظ�ö����Ϣ��';
comment on column SXDXSJ.D_PREINS_OTHERTYPE_REPEAT.c_othertype_repeat_flag
  is '�����������ظ����ݱ�־';
comment on column SXDXSJ.D_PREINS_OTHERTYPE_REPEAT.c_othertype_repeat_desc
  is '�����������ظ����ݱ�־����';
comment on column SXDXSJ.D_PREINS_OTHERTYPE_REPEAT.create_time
  is '����ʱ��';
comment on column SXDXSJ.D_PREINS_OTHERTYPE_REPEAT.remark
  is '��ע';
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
  is '���յ绰�Ƿ���Чö�ٱ�';
comment on column SXDXSJ.D_PREINS_PHONE_VALID.c_phone_invalid_flag
  is '�绰��Ч���ݱ�־';
comment on column SXDXSJ.D_PREINS_PHONE_VALID.c_phone_invalid_desc
  is '�绰��Ч���ݱ�־����';
comment on column SXDXSJ.D_PREINS_PHONE_VALID.create_time
  is '����ʱ��';
comment on column SXDXSJ.D_PREINS_PHONE_VALID.remark
  is '��ע';
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
  is '���ۻ���';
comment on column SXDXSJ.D_PREINS_SALE_ORG.c_sale_orgcode
  is '���ۻ�������';
comment on column SXDXSJ.D_PREINS_SALE_ORG.c_sale_org
  is '���ۻ�������';
comment on column SXDXSJ.D_PREINS_SALE_ORG.c_sale_creator
  is '������';
comment on column SXDXSJ.D_PREINS_SALE_ORG.c_create_time
  is '����ʱ��';
comment on column SXDXSJ.D_PREINS_SALE_ORG.c_active
  is '��Ч״̬';
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
  is '�������';
comment on column SXDXSJ.D_PREINS_SALE_SITUATION.c_sale_situationcode
  is '�������״̬��';
comment on column SXDXSJ.D_PREINS_SALE_SITUATION.c_sale_situationdesc
  is '�������״̬����';
comment on column SXDXSJ.D_PREINS_SALE_SITUATION.c_creator
  is '������';
comment on column SXDXSJ.D_PREINS_SALE_SITUATION.c_crate_time
  is '����ʱ��';
comment on column SXDXSJ.D_PREINS_SALE_SITUATION.c_active
  is '��Ч״̬';
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
  is 'ͬ�����ظ�ö����Ϣ��';
comment on column SXDXSJ.D_PREINS_SAMEORG_REPEAT.c_sameorg_repeat_flag
  is 'ͬ�����ظ����ݱ�־';
comment on column SXDXSJ.D_PREINS_SAMEORG_REPEAT.c_sameorg_repeat_desc
  is 'ͬ�����ظ����ݱ�־����';
comment on column SXDXSJ.D_PREINS_SAMEORG_REPEAT.create_time
  is '����ʱ��';
comment on column SXDXSJ.D_PREINS_SAMEORG_REPEAT.remark
  is '��ע';
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
  is '����״̬';
comment on column SXDXSJ.D_PREINS_STATUS.c_preins_code
  is '����״̬��';
comment on column SXDXSJ.D_PREINS_STATUS.c_preins_name
  is '����״̬����';
comment on column SXDXSJ.D_PREINS_STATUS.c_creator
  is '������';
comment on column SXDXSJ.D_PREINS_STATUS.c_crate_time
  is '����ʱ��';
comment on column SXDXSJ.D_PREINS_STATUS.c_active
  is '��Ч״̬';
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
  is '��������ö�ٱ�';
comment on column SXDXSJ.D_PREINS_TIME_DIM.day_date
  is '����';
comment on column SXDXSJ.D_PREINS_TIME_DIM.day_code
  is '���ڼ�';
comment on column SXDXSJ.D_PREINS_TIME_DIM.month_code
  is '�¼�';
comment on column SXDXSJ.D_PREINS_TIME_DIM.year_code
  is '���';
comment on column SXDXSJ.D_PREINS_TIME_DIM.day_desc
  is '��������';
comment on column SXDXSJ.D_PREINS_TIME_DIM.month_desc
  is '������';
comment on column SXDXSJ.D_PREINS_TIME_DIM.year_desc
  is '������';
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
  is 'ά��ö�ٱ�
�о����һ�����۾������ڵ�ʱ���ֶ���Ϣ';
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
  is 'ά��ö�ٱ�
����״̬��������ƣ�
0  δ����
1  ������
2  δ��ͨ
3  ����ʧ��
4  ���ϳɽ�
5  ���ѳɹ�';
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
  is 'ά��ö�ٱ�
ԭʼ���ݵ���Դ���͡���¶��������������յ�';
comment on column SXDXSJ.D_SOURCE_FROM_INFO.source_type_code
  is '��Ϣ��Դ������';
comment on column SXDXSJ.D_SOURCE_FROM_INFO.source_type_name
  is '��Ϣ��Դ����';
comment on column SXDXSJ.D_SOURCE_FROM_INFO.source_type_desc
  is '��Ϣ��Դ˵��';
comment on column SXDXSJ.D_SOURCE_FROM_INFO.active
  is '�Ƿ����';
comment on column SXDXSJ.D_SOURCE_FROM_INFO.creator
  is '������';
comment on column SXDXSJ.D_SOURCE_FROM_INFO.createtime
  is '��������';
comment on column SXDXSJ.D_SOURCE_FROM_INFO.modifier
  is '�޸���';
comment on column SXDXSJ.D_SOURCE_FROM_INFO.modify_date
  is '�޸�����';
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
  is 'ά��ö�ٱ�����������ͱ�1="�պ�",2= "���", 3= "���˽���",4="�һ�",5="�������",6=������",7="�ٳ�",8="��Ʒ����",9="������֪",10="¼������",11="����"';
comment on column SXDXSJ.D_TELMARKET_TYPE.sec_telemkt_no
  is '���������������';
comment on column SXDXSJ.D_TELMARKET_TYPE.sec_telemkt_nm
  is '���������������';
comment on column SXDXSJ.D_TELMARKET_TYPE.fir_telemkt_no
  is 'һ�������������';
comment on column SXDXSJ.D_TELMARKET_TYPE.fir_telemkt_nm
  is 'һ�������������';
comment on column SXDXSJ.D_TELMARKET_TYPE.active
  is '�Ƿ���ã�1Ϊ���ã�0ΪʧЧ';
comment on column SXDXSJ.D_TELMARKET_TYPE.creator
  is '������';
comment on column SXDXSJ.D_TELMARKET_TYPE.createtime
  is '��������';
comment on column SXDXSJ.D_TELMARKET_TYPE.modifier
  is '�޸���';
comment on column SXDXSJ.D_TELMARKET_TYPE.modify_date
  is '�޸�����';
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
  is '�����ر�׼��ö�ٱ�';
comment on column SXDXSJ.D_ZONE_STANDARD_SUC.c_standard_suc_flag
  is '�����ر�׼����־';
comment on column SXDXSJ.D_ZONE_STANDARD_SUC.c_standard_suc_desc
  is '�����ر�׼����־����';
comment on column SXDXSJ.D_ZONE_STANDARD_SUC.create_time
  is '����ʱ��';
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
  is 'ά��ö�ٱ�
�оٸ����������ͣ��磺���С��سǡ�����';
comment on column SXDXSJ.D_ZONE_TYPE.active
  is '�Ƿ����';
comment on column SXDXSJ.D_ZONE_TYPE.creator
  is '������';
comment on column SXDXSJ.D_ZONE_TYPE.create_time
  is '��������';
comment on column SXDXSJ.D_ZONE_TYPE.modifier
  is '�޸���';
comment on column SXDXSJ.D_ZONE_TYPE.modify_date
  is '�޸�����';
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
  is '�ֶ�ƥ��ģ�壨�����뵼����ʹ�ã�
�ֶ�������󣬵���ʱ�򽫻ᱻ�ضϡ�
���û������жϡ�';
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
  is '��������ʱ��������嵥�����֤����ͬ��绰��ͬ�Ŀͻ���������������Ҳ���ܵ�����ȫ����ϴ';
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
  is '��������������±�����Ϣ������������ϵͳ���ϳɽ��ı�����Ϣ
';
comment on column SXDXSJ.F_LATEST_POLICY.policy_no
  is '��������';
comment on column SXDXSJ.F_LATEST_POLICY.class_code
  is '���ִ���';
comment on column SXDXSJ.F_LATEST_POLICY.class_name
  is '��������';
comment on column SXDXSJ.F_LATEST_POLICY.policy_status
  is '����״��';
comment on column SXDXSJ.F_LATEST_POLICY.claim_status
  is '����״̬';
comment on column SXDXSJ.F_LATEST_POLICY.payment_status
  is '����״̬';
comment on column SXDXSJ.F_LATEST_POLICY.pieces
  is '����';
comment on column SXDXSJ.F_LATEST_POLICY.begin_date
  is '������ʼ����';
comment on column SXDXSJ.F_LATEST_POLICY.end_date
  is '������ֹ����';
comment on column SXDXSJ.F_LATEST_POLICY.charge_copy
  is 'ÿ�ݽɷѱ�׼';
comment on column SXDXSJ.F_LATEST_POLICY.charge_way
  is '�ɷѷ�ʽ';
comment on column SXDXSJ.F_LATEST_POLICY.charge_status
  is '�ɷ�״̬';
comment on column SXDXSJ.F_LATEST_POLICY.charge_end_date
  is '�ɷ���ֹ����';
comment on column SXDXSJ.F_LATEST_POLICY.charge_years
  is '�ɷ�����';
comment on column SXDXSJ.F_LATEST_POLICY.charge_end_ages
  is '�ɷ���ֹ����';
comment on column SXDXSJ.F_LATEST_POLICY.charge_total_times
  is '�ۼƽɷѴ���';
comment on column SXDXSJ.F_LATEST_POLICY.charge_total_amount
  is '�ۼ��ѽɱ���';
comment on column SXDXSJ.F_LATEST_POLICY.relation
  is 'Ͷ���˺ͱ����˵Ĺ�ϵ';
comment on column SXDXSJ.F_LATEST_POLICY.recognizee_age
  is 'Ͷ��ʱ������������';
comment on column SXDXSJ.F_LATEST_POLICY.policy_holder_id
  is 'Ͷ�������֤����';
comment on column SXDXSJ.F_LATEST_POLICY.policy_holder_copy_id
  is 'Ͷ�������֤���븱��';
comment on column SXDXSJ.F_LATEST_POLICY.recognizee_holder_id
  is '���������֤����';
comment on column SXDXSJ.F_LATEST_POLICY.recognizee_holder_copy_id
  is '���������֤���븱��';
comment on column SXDXSJ.F_LATEST_POLICY.employee_no
  is 'ҵ��Ա����';
comment on column SXDXSJ.F_LATEST_POLICY.account_type
  is '�ʻ�����';
comment on column SXDXSJ.F_LATEST_POLICY.account_no
  is '�˻���';
comment on column SXDXSJ.F_LATEST_POLICY.bank_code
  is '�������д���';
comment on column SXDXSJ.F_LATEST_POLICY.bank_name
  is '������������';
comment on column SXDXSJ.F_LATEST_POLICY.market_channel
  is '����';
comment on column SXDXSJ.F_LATEST_POLICY.govern_id
  is '������������';
comment on column SXDXSJ.F_LATEST_POLICY.govern_name
  is '������������';
comment on column SXDXSJ.F_LATEST_POLICY.tel_code
  is '�绰����';
comment on column SXDXSJ.F_LATEST_POLICY.branch_abbreviation
  is '�ֹ�˾���';
comment on column SXDXSJ.F_LATEST_POLICY.branch_name
  is '�ֹ�˾ȫ��';
comment on column SXDXSJ.F_LATEST_POLICY.reczip
  is '�������';
comment on column SXDXSJ.F_LATEST_POLICY.charge_phone
  is '�շѵ绰';
comment on column SXDXSJ.F_LATEST_POLICY.mobile_phone
  is 'Ͷ�����ƶ��绰����';
comment on column SXDXSJ.F_LATEST_POLICY.other_phone
  is 'Ͷ���������绰����';
comment on column SXDXSJ.F_LATEST_POLICY.fax
  is 'Ͷ���˴���';
comment on column SXDXSJ.F_LATEST_POLICY.email
  is 'Ͷ���˵����ʼ�';
comment on column SXDXSJ.F_LATEST_POLICY.education_level
  is 'Ͷ���˽����̶�/ѧ��';
comment on column SXDXSJ.F_LATEST_POLICY.income
  is 'Ͷ��������';
comment on column SXDXSJ.F_LATEST_POLICY.update_time
  is '����������';
comment on column SXDXSJ.F_LATEST_POLICY.recieve_time
  is '���������ȡʱ��';
comment on column SXDXSJ.F_LATEST_POLICY.bank_status
  is '����״̬';
comment on column SXDXSJ.F_LATEST_POLICY.orphan_status
  is '�¶���״̬';
comment on column SXDXSJ.F_LATEST_POLICY.charge_info
  is '������Ϣ';
comment on column SXDXSJ.F_LATEST_POLICY.partition_col
  is '�ͻ�������';
comment on column SXDXSJ.F_LATEST_POLICY.policy_partition_col
  is '����������';
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
  is '����������Ӧ�ķֹ�˾����֧���������͡��绰���ŵ���Ϣ��';
comment on column SXDXSJ.HELP_GOVERN_PHONE_CODE.branch_name
  is '�ֹ�˾����';
comment on column SXDXSJ.HELP_GOVERN_PHONE_CODE.branch_code
  is '��֧����';
comment on column SXDXSJ.HELP_GOVERN_PHONE_CODE.child_branch_code
  is '�ֹ�˾����';
comment on column SXDXSJ.HELP_GOVERN_PHONE_CODE.branch_abbreviation
  is '�ֹ�˾���';
comment on column SXDXSJ.HELP_GOVERN_PHONE_CODE.govern_name
  is '������';
comment on column SXDXSJ.HELP_GOVERN_PHONE_CODE.govern_id
  is '������';
comment on column SXDXSJ.HELP_GOVERN_PHONE_CODE.phone_code
  is '�绰����';
comment on column SXDXSJ.HELP_GOVERN_PHONE_CODE.branch_type
  is '�ֹ�˾����';
comment on column SXDXSJ.HELP_GOVERN_PHONE_CODE.zone_type_code
  is '�ֹ�˾���ͱ���';
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
  is '��¼����sql���洢���̵�ִ�����';
comment on column SXDXSJ.LOG_INFORMATION.command_name
  is '��������';
comment on column SXDXSJ.LOG_INFORMATION.command_type
  is '��������';
comment on column SXDXSJ.LOG_INFORMATION.start_time
  is '��ʼ����ʱ��';
comment on column SXDXSJ.LOG_INFORMATION.end_time
  is '��������ʱ��';
comment on column SXDXSJ.LOG_INFORMATION.add_number
  is '������¼��';
comment on column SXDXSJ.LOG_INFORMATION.update_number
  is '�޸ļ�¼��';
comment on column SXDXSJ.LOG_INFORMATION.delete_number
  is 'ɾ����¼��';
comment on column SXDXSJ.LOG_INFORMATION.condition_id
  is '�������';
comment on column SXDXSJ.LOG_INFORMATION.creator
  is '������';
comment on column SXDXSJ.LOG_INFORMATION.create_date
  is '��������';
comment on column SXDXSJ.LOG_INFORMATION.modifier
  is '�޸���';
comment on column SXDXSJ.LOG_INFORMATION.modify_date
  is '�޸�����';
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
  is '�洢������־��';
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
  is '����ƽ̨�ֹ�˾��Ϣ';
comment on column SXDXSJ.MSM_PLATFORM_ADMINISTRATION.id
  is '���';
comment on column SXDXSJ.MSM_PLATFORM_ADMINISTRATION.sms_governid
  is '����ƽ̨�ֹ�˾������';
comment on column SXDXSJ.MSM_PLATFORM_ADMINISTRATION.sms_name
  is '����ƽ̨�ֹ�˾����';
comment on column SXDXSJ.MSM_PLATFORM_ADMINISTRATION.active
  is '�Ƿ����';
comment on column SXDXSJ.MSM_PLATFORM_ADMINISTRATION.creator
  is '������';
comment on column SXDXSJ.MSM_PLATFORM_ADMINISTRATION.create_date
  is '��������';
comment on column SXDXSJ.MSM_PLATFORM_ADMINISTRATION.modifier
  is '�޸���';
comment on column SXDXSJ.MSM_PLATFORM_ADMINISTRATION.modify_date
  is '�޸�����';
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
  is '�̶��绰��ϴ��������Ϣ���磺��ʼ�������ɹ��������Ƿ���ɻ��д
��״̬��clean_status���Ĵ��뼰���������£�
-3����ͣ
-2��ȡ����
-1���쳣��
0���Ⲧ�У���ʼ״̬����
1��nuance�Ⲧ������
2������Ѷ���˹�ʶ����ϣ�һ��ʱ�����48Сʱ������ʼ��д��
3�������ϣ����Ի�д
4����д���';
comment on column SXDXSJ.NUANCE_BATCH.batch_code
  is '���α��';
comment on column SXDXSJ.NUANCE_BATCH.batch_description
  is '����˵��';
comment on column SXDXSJ.NUANCE_BATCH.total_count
  is '����';
comment on column SXDXSJ.NUANCE_BATCH.clean_status
  is '��ϴ״̬';
comment on column SXDXSJ.NUANCE_BATCH.begin_id
  is '��ʼID';
comment on column SXDXSJ.NUANCE_BATCH.end_id
  is '����ID';
comment on column SXDXSJ.NUANCE_BATCH.begin_dial
  is '��ʼ��ϴʱ��';
comment on column SXDXSJ.NUANCE_BATCH.end_dial
  is '������ϴʱ��';
comment on column SXDXSJ.NUANCE_BATCH.error_count
  is '�쳣��';
comment on column SXDXSJ.NUANCE_BATCH.loss_count
  is '©����';
comment on column SXDXSJ.NUANCE_BATCH.succ_count
  is '�ɹ���';
comment on column SXDXSJ.NUANCE_BATCH.error_percent
  is '�쳣��';
comment on column SXDXSJ.NUANCE_BATCH.loss_percent
  is '©����';
comment on column SXDXSJ.NUANCE_BATCH.succ_percent
  is '�ɹ���';
comment on column SXDXSJ.NUANCE_BATCH.note
  is '��ע';
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
  is '�������ϳɽ�������Ϣ';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.policy_no
  is '������';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.class_code
  is '���ִ���';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.class_name
  is '��������';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.product_code
  is '��Ʒ����';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.application_create_time
  is 'Ͷ�����Ŵ���ʱ��';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.application_no
  is 'Ͷ������';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.policy_holder_id
  is 'Ͷ�������֤';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.branch_abbreviation
  is '�ֹ�˾���';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.branch_govern_id
  is '�ֹ�˾������';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.payment_status
  is '����״̬';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.begin_date
  is '������ʼ����';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.pieces
  is '����';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.end_date
  is '������ֹ����';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.charge_years
  is '�ɷ�����';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.charge_end_ages
  is '�ɷ���ֹ����';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.charge_end_date
  is '�ɷ���ֹ����';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.policy_status
  is '����״��';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.charge_total_times
  is '�ۼƽɷѴ���';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.charge_copy
  is 'ÿ�ݽɷѱ�׼';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.claim_status
  is '����״̬';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.charge_total_amount
  is '�ۼ��ѽɱ���';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.charge_status
  is '�ɷ�״̬';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.charge_way
  is '�ɷѷ�ʽ';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.month_amount
  is '�½ɱ��Ѷ�';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.batch_id_deal
  is '���ϳɽ�����';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.batch_id_fee
  is '������Ϣ��д����';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.partition_col
  is '�ͻ�������';
comment on column SXDXSJ.ONLINE_DEAL_POLICY.policy_partition_col
  is '����������';
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
  is '��¼�û���������������Ӧ�Ŀͻ���������';
comment on column SXDXSJ.OPERATION_CONDITION.id
  is '���';
comment on column SXDXSJ.OPERATION_CONDITION.task_id
  is '������';
comment on column SXDXSJ.OPERATION_CONDITION.log_id
  is '��־���';
comment on column SXDXSJ.OPERATION_CONDITION.source_type_code
  is '��Ϣ��Դ';
comment on column SXDXSJ.OPERATION_CONDITION.branch_code
  is '�ֹ�˾����';
comment on column SXDXSJ.OPERATION_CONDITION.age_zone_code
  is '�������';
comment on column SXDXSJ.OPERATION_CONDITION.birthdate_month_day_code
  is '�����·�';
comment on column SXDXSJ.OPERATION_CONDITION.from_last_sale_time_code
  is '���һ�����۾�����ʱ��';
comment on column SXDXSJ.OPERATION_CONDITION.dial_times_code
  is '��������';
comment on column SXDXSJ.OPERATION_CONDITION.clear_status_code
  is '��ϴ״̬��';
comment on column SXDXSJ.OPERATION_CONDITION.operation_status_code
  is '��ȫ״̬��';
comment on column SXDXSJ.OPERATION_CONDITION.sale_status_code
  is '����״̬��';
comment on column SXDXSJ.OPERATION_CONDITION.orphan_status_code
  is '�¶���״̬��';
comment on column SXDXSJ.OPERATION_CONDITION.bank_status_code
  is '����״̬��';
comment on column SXDXSJ.OPERATION_CONDITION.policy_status_code
  is '����״̬��';
comment on column SXDXSJ.OPERATION_CONDITION.branch_delivery_code
  is '�Ƿ�ɷֹ�˾���';
comment on column SXDXSJ.OPERATION_CONDITION.company_delivery_code
  is '�Ƿ���ܹ�˾���';
comment on column SXDXSJ.OPERATION_CONDITION.pay_by_pos_code
  is '�Ƿ��pos������';
comment on column SXDXSJ.OPERATION_CONDITION.pay_by_bank_code
  is '�Ƿ�����д���';
comment on column SXDXSJ.OPERATION_CONDITION.has_rectele_code
  is '�Ƿ����շѵ绰';
comment on column SXDXSJ.OPERATION_CONDITION.has_ftele_code
  is '�Ƿ��м�ͥ�绰';
comment on column SXDXSJ.OPERATION_CONDITION.has_ctele_code
  is '�Ƿ��а칫�绰';
comment on column SXDXSJ.OPERATION_CONDITION.has_mobile_code
  is '�Ƿ����ֻ�';
comment on column SXDXSJ.OPERATION_CONDITION.month_amount_code
  is '�½ɱ�������';
comment on column SXDXSJ.OPERATION_CONDITION.zone_type_code
  is '��������';
comment on column SXDXSJ.OPERATION_CONDITION.dial_time_length_code
  is 'ͨ��ʱ������';
comment on column SXDXSJ.OPERATION_CONDITION.level_code
  is '�ͻ��ȼ�';
comment on column SXDXSJ.OPERATION_CONDITION.from_last_revist_time_code
  is '�طþ�������ʱ��';
comment on column SXDXSJ.OPERATION_CONDITION.gender_code
  is '�Ա�';
comment on column SXDXSJ.OPERATION_CONDITION.revist_result
  is '�طý��';
comment on column SXDXSJ.OPERATION_CONDITION.remark
  is '��ע';
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
  is '��������̫������2,3,4,5�������Ĺ�ϵ��Ϣ';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.organization_id
  is '��������';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.branch
  is '�ֹ�˾';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.org_third_level
  is '��֧';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.org_fourth_level
  is '�ļ�����';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.org_five_level
  is '�弶����';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.zone_type
  is '��������';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.active
  is '�Ƿ����';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.creator
  is '������';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.createtime
  is '��������';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.modifier
  is '�޸���';
comment on column SXDXSJ.ORGANIZATION_INFORMATION.modify_date
  is '�޸�����';
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
  is '����ID';
comment on column SXDXSJ.ORGID_REF.org_id_lv
  is '�����㼶';
comment on column SXDXSJ.ORGID_REF.p_org_id_lv0
  is '�ܹ�˾';
comment on column SXDXSJ.ORGID_REF.p_org_id_lv1
  is '��������';
comment on column SXDXSJ.ORGID_REF.p_org_id_lv2
  is '����������';
comment on column SXDXSJ.ORGID_REF.p_org_id_lv3
  is '��Ŀ';
comment on column SXDXSJ.ORGID_REF.p_org_id_lv4
  is '�Ŷ�';
comment on column SXDXSJ.ORGID_REF.p_org_id_lv5
  is '��չ�ֶ�';
comment on column SXDXSJ.ORGID_REF.prjt_mgr_id
  is '��Ŀ����';
comment on column SXDXSJ.ORGID_REF.tem_lead_id
  is '�Ŷӳ�';
comment on column SXDXSJ.ORGID_REF.population_tsmp
  is '����ʱ���';

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
  is '���ģ����ֶ�ƥ������ϸ��Ϣ';
comment on column SXDXSJ.PATERN_FIELDS.id
  is '���';
comment on column SXDXSJ.PATERN_FIELDS.template_id
  is 'ģ����';
comment on column SXDXSJ.PATERN_FIELDS.file_column_cn_name
  is '�ļ��ֶ�������';
comment on column SXDXSJ.PATERN_FIELDS.db_column_cn_name
  is '���ݿ��ֶ�������';
comment on column SXDXSJ.PATERN_FIELDS.file_column_en_name
  is '�ļ��ֶ�Ӣ����';
comment on column SXDXSJ.PATERN_FIELDS.db_column_en_name
  is '���ݿ��ֶ�Ӣ����';
comment on column SXDXSJ.PATERN_FIELDS.is_show_data
  is '�Ƿ���ʾ����';
comment on column SXDXSJ.PATERN_FIELDS.active
  is '�Ƿ����';
comment on column SXDXSJ.PATERN_FIELDS.column_order
  is '�ֶ�˳��';
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
  is 'ȫ���绰������λ�ĺù���';
comment on column SXDXSJ.PHONE_RULE.code
  is '����';
comment on column SXDXSJ.PHONE_RULE.branch_abbreviation
  is '�ֹ�˾���';
comment on column SXDXSJ.PHONE_RULE.old_code
  is 'ԭ����';
comment on column SXDXSJ.PHONE_RULE.now_code
  is '������';
comment on column SXDXSJ.PHONE_RULE.old_length
  is 'ԭ�绰λ��';
comment on column SXDXSJ.PHONE_RULE.now_length
  is '�ֵ绰λ��';
comment on column SXDXSJ.PHONE_RULE.first_number_list
  is '��λ���б�';
comment on column SXDXSJ.PHONE_RULE.add_number
  is '���Ӻ���';
comment on column SXDXSJ.PHONE_RULE.change_code
  is '�����Ƿ���';
comment on column SXDXSJ.PHONE_RULE.change_phone
  is '�����Ƿ���';
comment on column SXDXSJ.PHONE_RULE.province
  is 'ʡ';
comment on column SXDXSJ.PHONE_RULE.city
  is '��';
comment on column SXDXSJ.PHONE_RULE.govername
  is '����';
comment on column SXDXSJ.PHONE_RULE.active
  is '�Ƿ����';
comment on column SXDXSJ.PHONE_RULE.creator
  is '������';
comment on column SXDXSJ.PHONE_RULE.create_date
  is '��������';
comment on column SXDXSJ.PHONE_RULE.modifier
  is '�޸���';
comment on column SXDXSJ.PHONE_RULE.modify_date
  is '�޸�����';
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
  is '�绰������Ϣ
�绰״̬��
1 �շѵ绰
2 ��ͥ�绰
3 �칫�绰
4 �ֻ�
';
comment on column SXDXSJ.PHONE_TYPE_INFO.phone_type_code
  is '�绰���ʹ���';
comment on column SXDXSJ.PHONE_TYPE_INFO.dial_statusname
  is '�绰��������';
comment on column SXDXSJ.PHONE_TYPE_INFO.active
  is '�Ƿ����';
comment on column SXDXSJ.PHONE_TYPE_INFO.creator
  is '������';
comment on column SXDXSJ.PHONE_TYPE_INFO.createtime
  is '��������';
comment on column SXDXSJ.PHONE_TYPE_INFO.modifier
  is '�޸���';
comment on column SXDXSJ.PHONE_TYPE_INFO.modify_date
  is '�޸�����';
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
  is 'ȫ������ʡ����Ϣ��';
comment on column SXDXSJ.PLACE_INFO.province
  is 'ʡ';
comment on column SXDXSJ.PLACE_INFO.city
  is '����';
comment on column SXDXSJ.PLACE_INFO.phone_code
  is '�绰����';
comment on column SXDXSJ.PLACE_INFO.active
  is '�Ƿ����';
comment on column SXDXSJ.PLACE_INFO.creator
  is '������';
comment on column SXDXSJ.PLACE_INFO.createtime
  is '��������';
comment on column SXDXSJ.PLACE_INFO.modifier
  is '�޸���';
comment on column SXDXSJ.PLACE_INFO.modify_date
  is '�޸�����';
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
  is '��Ž��������Ĺ¶���������ԭʼ������Ϣ������������ϵͳ���ϳɽ��ı�����Ϣ
';
comment on column SXDXSJ.POLICY.policy_no
  is '��������';
comment on column SXDXSJ.POLICY.class_code
  is '���ִ���';
comment on column SXDXSJ.POLICY.class_name
  is '��������';
comment on column SXDXSJ.POLICY.policy_status
  is '����״��';
comment on column SXDXSJ.POLICY.claim_status
  is '����״̬';
comment on column SXDXSJ.POLICY.payment_status
  is '����״̬';
comment on column SXDXSJ.POLICY.pieces
  is '����';
comment on column SXDXSJ.POLICY.begin_date
  is '������ʼ����';
comment on column SXDXSJ.POLICY.end_date
  is '������ֹ����';
comment on column SXDXSJ.POLICY.charge_copy
  is 'ÿ�ݽɷѱ�׼';
comment on column SXDXSJ.POLICY.charge_way
  is '�ɷѷ�ʽ';
comment on column SXDXSJ.POLICY.charge_status
  is '�ɷ�״̬';
comment on column SXDXSJ.POLICY.charge_end_date
  is '�ɷ���ֹ����';
comment on column SXDXSJ.POLICY.charge_years
  is '�ɷ�����';
comment on column SXDXSJ.POLICY.charge_end_ages
  is '�ɷ���ֹ����';
comment on column SXDXSJ.POLICY.charge_total_times
  is '�ۼƽɷѴ���';
comment on column SXDXSJ.POLICY.charge_total_amount
  is '�ۼ��ѽɱ���';
comment on column SXDXSJ.POLICY.relation
  is 'Ͷ���˺ͱ����˵Ĺ�ϵ';
comment on column SXDXSJ.POLICY.recognizee_age
  is 'Ͷ��ʱ������������';
comment on column SXDXSJ.POLICY.policy_holder_id
  is 'Ͷ�������֤����';
comment on column SXDXSJ.POLICY.policy_holder_copy_id
  is 'Ͷ�������֤���븱��';
comment on column SXDXSJ.POLICY.recognizee_holder_id
  is '���������֤����';
comment on column SXDXSJ.POLICY.recognizee_holder_copy_id
  is '���������֤���븱��';
comment on column SXDXSJ.POLICY.employee_no
  is 'ҵ��Ա����';
comment on column SXDXSJ.POLICY.account_type
  is '�ʻ�����';
comment on column SXDXSJ.POLICY.account_no
  is '�˻���';
comment on column SXDXSJ.POLICY.bank_code
  is '�������д���';
comment on column SXDXSJ.POLICY.bank_name
  is '������������';
comment on column SXDXSJ.POLICY.market_channel
  is '����';
comment on column SXDXSJ.POLICY.govern_id
  is '������������';
comment on column SXDXSJ.POLICY.govern_name
  is '������������';
comment on column SXDXSJ.POLICY.tel_code
  is '�绰����';
comment on column SXDXSJ.POLICY.branch_abbreviation
  is '�ֹ�˾���';
comment on column SXDXSJ.POLICY.branch_name
  is '�ֹ�˾ȫ��';
comment on column SXDXSJ.POLICY.reczip
  is '�������';
comment on column SXDXSJ.POLICY.charge_phone
  is '�շѵ绰';
comment on column SXDXSJ.POLICY.mobile_phone
  is 'Ͷ�����ƶ��绰����';
comment on column SXDXSJ.POLICY.other_phone
  is 'Ͷ���������绰����';
comment on column SXDXSJ.POLICY.fax
  is 'Ͷ���˴���';
comment on column SXDXSJ.POLICY.email
  is 'Ͷ���˵����ʼ�';
comment on column SXDXSJ.POLICY.education_level
  is 'Ͷ���˽����̶�/ѧ��';
comment on column SXDXSJ.POLICY.income
  is 'Ͷ��������';
comment on column SXDXSJ.POLICY.update_time
  is '����������';
comment on column SXDXSJ.POLICY.recieve_time
  is '���������ȡʱ��';
comment on column SXDXSJ.POLICY.bank_status
  is '����״̬';
comment on column SXDXSJ.POLICY.orphan_status
  is '�¶���״̬';
comment on column SXDXSJ.POLICY.charge_info
  is '������Ϣ';
comment on column SXDXSJ.POLICY.partition_col
  is '�ͻ�������';
comment on column SXDXSJ.POLICY.policy_partition_col
  is '����������';
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
  is '����ʵ�ձ�';
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
  is 'Ԥ��������У��²���绰�ĸ���';
comment on column SXDXSJ.P_CUSTOMER_PHONE.customer_id
  is '�ͻ����֤����';
comment on column SXDXSJ.P_CUSTOMER_PHONE.phone
  is '�绰����';
comment on column SXDXSJ.P_CUSTOMER_PHONE.phone_type
  is '�绰����';
comment on column SXDXSJ.P_CUSTOMER_PHONE.tel_code
  is '�绰����';
comment on column SXDXSJ.P_CUSTOMER_PHONE.partition_col
  is '�ͻ�������';
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
  is 'Ԥ��������У���Ÿ������������ĵ绰����';
comment on column SXDXSJ.P_CUSTOMER_PHONE_PARTS.customer_id
  is '�ͻ����֤����';
comment on column SXDXSJ.P_CUSTOMER_PHONE_PARTS.phone
  is '�绰����';
comment on column SXDXSJ.P_CUSTOMER_PHONE_PARTS.phone_type
  is '�绰����';
comment on column SXDXSJ.P_CUSTOMER_PHONE_PARTS.tel_code
  is '�绰����';
comment on column SXDXSJ.P_CUSTOMER_PHONE_PARTS.partition_col
  is '�ͻ�������';
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
  is 'Ԥ�����У���Ŵ����¿ͻ���������Ϣ';
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
  is 'Ԥ����ʱ�������ͻ���Ͷ���ˣ��ĸ��ºͲ���';
comment on column SXDXSJ.P_CUSTOMER_UPDATE_PARTS.partition_col
  is 'Ͷ���˷�����';
comment on column SXDXSJ.P_CUSTOMER_UPDATE_PARTS.row_id
  is '��ʱ�ͻ��к�';
comment on column SXDXSJ.P_CUSTOMER_UPDATE_PARTS.customer_row_id
  is '���пͻ��к�';
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
  is 'Ԥ����ʱ��������������
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
  is 'Ԥ��������У����ڸ�����������͸���';
comment on column SXDXSJ.P_POLICY_UPDATE_PARTS.partition_col
  is 'Ͷ���˷�����';
comment on column SXDXSJ.P_POLICY_UPDATE_PARTS.row_id
  is '��ʱ�����к�';
comment on column SXDXSJ.P_POLICY_UPDATE_PARTS.policy_row_id
  is '���б����к�';
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
  is '���2CALL��������ͳ�����ݡ��û���ѯ2CALLͳ�Ʊ���ʱ����ֱ�Ӵӱ����в�ѯ�������εı������ݡ�ˢ�±���ʱ�������±����е��������ݡ�';
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
  is '����������Դ�¸��ֹ�˾�ı�ȫ����';
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
  is '��ű����������ݵ�ͳ�����ݡ��û���ѯ�������ݱ���ʱ����ֱ�Ӵӱ����в�ѯ�������εı������ݡ�ˢ�±���ʱ�������±����е��������ݡ�';
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
  is '��ű��������嵥��ͳ�����ݡ��û���ѯ�����嵥����ʱ����ֱ�Ӵӱ����в�ѯ�������εı������ݡ�ˢ�±���ʱ�������±����е��������ݡ�';
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
  is '������ֹ�˾ÿ�µı�ȫ����';
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
  is 'ͳ�ƿ��й¶������������п�������';
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
  is '��ű����ֿ��嵥��ͳ�����ݡ��û���ѯ�ֿ��嵥����ʱ����ֱ�Ӵӱ����в�ѯ�������εı������ݡ�ˢ�±���ʱ�������±����е��������ݡ�';
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
  is '������������';
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
  is 'ͳ�Ʒ������������ҵ��״��';
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
  is '���C_CPIC_DIALһ��Э������ͬ��ɹ̶��绰����ϴ��SHCPIC_OUTDATA���ڴ�ŵȴ�nuance�Ⲧ�Ĺ̶��绰���룬��OUT_ID�����SHCPIC_OUTDATA��ID��һһ��Ӧ��';
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
  is '����ƽ̨�Ķ��ſ�';
comment on column SXDXSJ.SMS_MESSAGE_LIBRARY.id
  is '���';
comment on column SXDXSJ.SMS_MESSAGE_LIBRARY.message_name
  is '����ƽ̨�ֹ�˾����';
comment on column SXDXSJ.SMS_MESSAGE_LIBRARY.message_content
  is '����ƽ̨�ֹ�˾������';
comment on column SXDXSJ.SMS_MESSAGE_LIBRARY.active
  is '�Ƿ����';
comment on column SXDXSJ.SMS_MESSAGE_LIBRARY.creator
  is '������';
comment on column SXDXSJ.SMS_MESSAGE_LIBRARY.create_date
  is '��������';
comment on column SXDXSJ.SMS_MESSAGE_LIBRARY.modifier
  is '�޸���';
comment on column SXDXSJ.SMS_MESSAGE_LIBRARY.modify_date
  is '�޸�����';
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
  is '�ֹ�˾ȫ�Ƽ����Ӧ��3λ��д��ĸ��ơ��磺�Ϻ��ֹ�˾��3λ�ֹ�˾��ƣ�SHH�����ַֹ�˾��ʱû��3λ�ֹ�˾���';
comment on column SXDXSJ.STATIC_BRANCH_ABBREVIATION.zone_code_prefix
  is '��Ӧ�������ǰ��λ';
comment on column SXDXSJ.STATIC_BRANCH_ABBREVIATION.branch_name
  is '�ֹ�˾ȫ��';
comment on column SXDXSJ.STATIC_BRANCH_ABBREVIATION.branch_abbreviation
  is '3λ�ֹ�˾���';
comment on column SXDXSJ.STATIC_BRANCH_ABBREVIATION.is_single_phone_code
  is '�Ƿ��ǵ��绰���ŷֹ�˾';
comment on column SXDXSJ.STATIC_BRANCH_ABBREVIATION.phone_code
  is '�绰����';
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
  is '�о����е���ƽ̨��ϵ״̬�뼰��˵��';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.con_sta_id
  is '״̬��';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.parent_id
  is '����״̬��';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.des
  is '����';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.vis_typ
  is '��ϵ����';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.level1
  is '��һ��״̬��';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.level2
  is '��2��״̬��';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.level3
  is '��3��״̬��';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.level4
  is '��4��״̬��';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.level5
  is '��5��״̬��';
comment on column SXDXSJ.STATIC_CONTACT_STATUS.level6
  is '��6��״̬��';
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
  is '�������������ÿ����������Ӧ�Ŀ���Ƿ���ʹ�Ƿ��pos���ѵ���Ϣ';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.zone_code
  is '�������';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.is_head_company_delivery
  is '�Ƿ���ܹ�˾���';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.is_branchi_delivery
  is '�Ƿ�ɷֹ�˾���';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.is_pos_pay
  is '�Ƿ��POS����';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.is_bank_proxy
  is '�Ƿ�����д���';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.update_time
  is '����ʱ��';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.active
  is '�Ƿ����';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.creator
  is '������';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.create_date
  is '��������';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.modifier
  is '�޸���';
comment on column SXDXSJ.STATIC_DELIVERY_INFOR.modify_date
  is '�޸�����';
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
  is '�������ǰ��λ����Ӧ�ķֹ�˾����֧��Ϣ';
comment on column SXDXSJ.STATIC_GOVERN_RECZIP.reczip_prefix7
  is '�������ǰ��λ';
comment on column SXDXSJ.STATIC_GOVERN_RECZIP.child_branch_id
  is '������֧��������';
comment on column SXDXSJ.STATIC_GOVERN_RECZIP.child_branch_name
  is '������֧';
comment on column SXDXSJ.STATIC_GOVERN_RECZIP.branch_id
  is '�����ֹ�˾��������';
comment on column SXDXSJ.STATIC_GOVERN_RECZIP.branch_name
  is '�����ֹ�˾';
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
  is '̫�����յ����л�����Ϣ';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_name
  is '��������';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level
  is '�����ּ�';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level2_name
  is '������������';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level2_type
  is '����������ν';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level2_code
  is '������������';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level3_name
  is '������������';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level3_type
  is '����������ν';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level3_code
  is '������������';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level4_name
  is '�ļ���������';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level4_type
  is '�ļ�������ν';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level4_code
  is '�ļ���������';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level5_name
  is '�弶��������';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level5_type
  is '�弶������ν';
comment on column SXDXSJ.STATIC_GOVERN_TREE.economy_zone
  is '��������';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_level5_code
  is '�弶��������';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_attribute
  is '��������';
comment on column SXDXSJ.STATIC_GOVERN_TREE.city
  is '��������';
comment on column SXDXSJ.STATIC_GOVERN_TREE.town
  is '��������';
comment on column SXDXSJ.STATIC_GOVERN_TREE.zone_type
  is '�������';
comment on column SXDXSJ.STATIC_GOVERN_TREE.govern_id
  is '��������';
comment on column SXDXSJ.STATIC_GOVERN_TREE.change_record
  is '��������¼';
comment on column SXDXSJ.STATIC_GOVERN_TREE.active
  is '�Ƿ����';
comment on column SXDXSJ.STATIC_GOVERN_TREE.creator
  is '������';
comment on column SXDXSJ.STATIC_GOVERN_TREE.create_date
  is '��������';
comment on column SXDXSJ.STATIC_GOVERN_TREE.modifier
  is '�޸���';
comment on column SXDXSJ.STATIC_GOVERN_TREE.modify_date
  is '�޸�����';
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
  is '����ƽ̨���ջ�����';
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
  is 'һЩ���񱻷ֳɶಽ����Щϸ�ֵĲ��輰��״̬��Ϣ����¼�ڴ˱��С�';
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
  is '��¼����������Ϣ
status:
0 �ȴ���1�����У� 2������ɣ�3����
task_type(���ȼ��ɸߵ���):
1 ��������
2 ��ϴ�绰
3 ������ȫ
4 ��ȫ��д
5 ԭʼ����';
comment on column SXDXSJ.TASKS.id
  is '���';
comment on column SXDXSJ.TASKS.task_condition
  is '��������';
comment on column SXDXSJ.TASKS.task_type
  is '��������';
comment on column SXDXSJ.TASKS.task_name
  is '��������';
comment on column SXDXSJ.TASKS.description
  is '����';
comment on column SXDXSJ.TASKS.create_time
  is '�ύʱ��';
comment on column SXDXSJ.TASKS.initial_number
  is '��ʼ����';
comment on column SXDXSJ.TASKS.success_number
  is '�ɹ�����';
comment on column SXDXSJ.TASKS.begin_time
  is '��ʼʱ��';
comment on column SXDXSJ.TASKS.end_time
  is '����ʱ��';
comment on column SXDXSJ.TASKS.file_type
  is '�ļ�����';
comment on column SXDXSJ.TASKS.file_path
  is '�ļ�·��';
comment on column SXDXSJ.TASKS.template_id
  is 'ģ����';
comment on column SXDXSJ.TASKS.source_type_code
  is '������Դ����';
comment on column SXDXSJ.TASKS.branch_code
  is '�ֹ�˾����';
comment on column SXDXSJ.TASKS.is_fix_number
  is '�Ƿ��޸��绰';
comment on column SXDXSJ.TASKS.operation_type
  is '��ȫ����';
comment on column SXDXSJ.TASKS.status
  is '״̬';
comment on column SXDXSJ.TASKS.active
  is '�Ƿ����';
comment on column SXDXSJ.TASKS.creator
  is '������';
comment on column SXDXSJ.TASKS.branch_abbreviation
  is '�ֹ�˾���';
comment on column SXDXSJ.TASKS.download_times
  is '���ش���';
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
  is '�������񱻲�ֳɶ������д�����ֺ��������Ϣ����ڴ˱��С�
detail_id:
1������������Ϣ
100-109:�򱣵������м���������
200-209����������
299�����±���
300-309����绰�м������޸���绰
399����绰���в���ȥ�غ�绰
400-409����Ͷ���˸����м���������
499������Ͷ������Ϣ������Ƿǹ¶���
500-509������Ͷ����';
comment on column SXDXSJ.TASK_DETAIL.detail_id
  is '���';
comment on column SXDXSJ.TASK_DETAIL.task_id
  is '������';
comment on column SXDXSJ.TASK_DETAIL.detail_name
  is '����';
comment on column SXDXSJ.TASK_DETAIL.success_number
  is '�ɹ�����';
comment on column SXDXSJ.TASK_DETAIL.begin_time
  is '��ʼʱ��';
comment on column SXDXSJ.TASK_DETAIL.end_time
  is '����ʱ��';
comment on column SXDXSJ.TASK_DETAIL.completed
  is '�Ƿ����';
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
  is 'ͳ������
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.schl_call_mon
  is '�ƻ���������
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.actv_id
  is '�ID';
comment on column SXDXSJ.TA_CMP_RPT_DAY.bat_code
  is '���δ���
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.com_typ
  is '��������
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.bat_prjt
  is '������Ŀ
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.comp_id
  is '�ֹ�˾ID
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.city_id
  is '����ID
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.ctr_code
  is '������';
comment on column SXDXSJ.TA_CMP_RPT_DAY.sales_prjt
  is '������Ŀ';
comment on column SXDXSJ.TA_CMP_RPT_DAY.tem_code
  is '�Ŷ�ID';
comment on column SXDXSJ.TA_CMP_RPT_DAY.cal_times
  is '�������';
comment on column SXDXSJ.TA_CMP_RPT_DAY.prjt_mgr_id
  is '��Ŀ����ID
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.tem_lead_id
  is '�Ŷӳ�ID
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.user_id
  is '��ϯID
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.list_tno
  is '��������
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.fst_cal_list_qty
  is '�ײ�������
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.cal_comp_list_qty
  is '�������������
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.connt_list_qty
  is '��ͨ������
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.cont_list_qty
  is '�Ӵ�������';
comment on column SXDXSJ.TA_CMP_RPT_DAY.cal_comp_cont_list_qty
  is '������ɽӴ�������
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.surp_trk_list_qty
  is 'ʣ�����������
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.oline_smit_qty
  is '�����ύ����
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.oline_smit_prm
  is '�����ύ����';
comment on column SXDXSJ.TA_CMP_RPT_DAY.oline_tran_qty
  is '���ϳɽ�����
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.oline_tran_prm
  is '���ϳɽ�����
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.fst_chargbk_succ_qty
  is '���ڿۿ�ɹ�����
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.fst_chargbk_succ_prm
  is '���ڿۿ�ɹ�����
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.annul_fst_prm_prm
  is '�껯�±�����

';
comment on column SXDXSJ.TA_CMP_RPT_DAY.actl_fst_prm_prm
  is 'ʵ���±�����
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.wtn_qty
  is '�������ͳɹ�����
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.agg_cal_times
  is '�ۼƲ������
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.agg_cont_times
  is '�ۼƽӴ�����
';
comment on column SXDXSJ.TA_CMP_RPT_DAY.population_tsmp
  is '����ʱ���';
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
  is 'ͳ������
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.schl_call_mon
  is '�ƻ���������
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.sec_telemkt_rslt
  is '�����������
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.com_typ
  is '��������
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.bat_prjt
  is '������Ŀ
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.ctr_code
  is '����
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.sales_prjt
  is '������Ŀ
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.wp_id
  is 'ְ��ID

';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.prjt_mgr_id
  is '��Ŀ����ID
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.tem_lead_id
  is '�Ŷӳ�ID
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.user_id
  is '��ϯID
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.t_1day_resvt_trk_list_qty
  is 'T+1��ԤԼ����������
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.t_2day_resvt_trk_list_qty
  is 'T+2��ԤԼ����������
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.t_third_day_resvt_trk_list_qty
  is 'T+3��ԤԼ����������
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.t_4day_resvt_trk_list_qty
  is 'T+4��ԤԼ����������
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.t_5day_resvt_trk_list_qty
  is 'T+5��ԤԼ����������
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.t_6day_resvt_trk_list_qty
  is 'T+6��ԤԼ����������
';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.t_seventh_day_resvt_trk_list_q
  is 'T+7������ԤԼ����������';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.population_tsmp
  is '����ʱ���';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.cal_times
  is '�������';
comment on column SXDXSJ.TA_LIST_INV_RPT_DAY.bat_code
  is '���δ��루������ģ�';
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
  is '������������';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.cal_day_id
  is 'ͳ������';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.actv_id
  is '�ID';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.bat_code
  is '���δ���';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.com_typ
  is '��������';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.bat_prjt
  is '������Ŀ';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.comp_id
  is '�ֹ�˾';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.city_id
  is '����';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.ctr_code
  is '����';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.sales_prjt
  is '������Ŀ';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.tem_code
  is '�Ŷ�';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.wp_id
  is 'ְ��';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.prjt_mgr_id
  is '��Ŀ����id';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.tem_lead_id
  is '�Ŷ�ID';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.on_line_human
  is '��������';
comment on column SXDXSJ.TA_SALES_HUMAN_RPT_DAY.population_tsmp
  is '����ʱ���';
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
  is '�����ձ���';
comment on column SXDXSJ.TA_SALES_RPT_DAY.cal_day_id
  is 'ͳ������';
comment on column SXDXSJ.TA_SALES_RPT_DAY.pay_mode
  is '�ɷѷ�ʽ';
comment on column SXDXSJ.TA_SALES_RPT_DAY.actv_id
  is '�ID';
comment on column SXDXSJ.TA_SALES_RPT_DAY.bat_code
  is '���δ���';
comment on column SXDXSJ.TA_SALES_RPT_DAY.com_typ
  is '��������';
comment on column SXDXSJ.TA_SALES_RPT_DAY.bat_prjt
  is '������Ŀ';
comment on column SXDXSJ.TA_SALES_RPT_DAY.comp_id
  is '�ֹ�˾����
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.city_id
  is '����ID
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.ctr_code
  is '����';
comment on column SXDXSJ.TA_SALES_RPT_DAY.sales_prjt
  is '������Ŀ
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.tem_code
  is '�ŶӴ���
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.wp_id
  is 'ְ��ID
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.prjt_mgr_id
  is '��Ŀ����ID
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.tem_lead_id
  is '�Ŷӳ�ID
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.user_id
  is '��ϯID
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.fst_cal_list_qty
  is '�ײ�������
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.fst_cal_cont_list_qty
  is '�ײ��Ӵ�������';
comment on column SXDXSJ.TA_SALES_RPT_DAY.trk_list_qty
  is '����������
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.cont_list_qty
  is '�Ӵ�������';
comment on column SXDXSJ.TA_SALES_RPT_DAY.rej_list_qty
  is '�ܾ�������
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.oline_smit_qty
  is '�����ύ����
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.oline_smit_prm
  is '�����ύ����
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.oline_tran_qty
  is '���ϳɽ�����
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.oline_tran_prm
  is '���ϳɽ�����
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.fst_chargbk_succ_qty
  is '���ڿۿ�ɹ���';
comment on column SXDXSJ.TA_SALES_RPT_DAY.annul_fst_prm_prm
  is '
�껯�±�����
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.actl_fst_prm_prm
  is 'ʵ���±�����
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.cncl_qty
  is '��ԥ���˱�����';
comment on column SXDXSJ.TA_SALES_RPT_DAY.cncl_prm
  is '��ԥ���˱�����
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.population_tsmp
  is '����ʱ���
';
comment on column SXDXSJ.TA_SALES_RPT_DAY.land_succ_qty
  is '��سɹ���';
comment on column SXDXSJ.TA_SALES_RPT_DAY.land_succ_prm
  is '��سɹ�����';
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
  is '�������ۼƱ���';
comment on column SXDXSJ.TA_SALES_RPT_MON.cal_mon_id
  is 'ͳ������';
comment on column SXDXSJ.TA_SALES_RPT_MON.pay_mode
  is '�ɷѷ�ʽ';
comment on column SXDXSJ.TA_SALES_RPT_MON.actv_id
  is '�ID';
comment on column SXDXSJ.TA_SALES_RPT_MON.bat_code
  is '���δ���';
comment on column SXDXSJ.TA_SALES_RPT_MON.com_typ
  is '��������';
comment on column SXDXSJ.TA_SALES_RPT_MON.bat_prjt
  is '������Ŀ';
comment on column SXDXSJ.TA_SALES_RPT_MON.comp_id
  is '�ֹ�˾����
';
comment on column SXDXSJ.TA_SALES_RPT_MON.city_id
  is '����ID
';
comment on column SXDXSJ.TA_SALES_RPT_MON.ctr_code
  is '����';
comment on column SXDXSJ.TA_SALES_RPT_MON.sales_prjt
  is '������Ŀ
';
comment on column SXDXSJ.TA_SALES_RPT_MON.tem_code
  is '�ŶӴ���
';
comment on column SXDXSJ.TA_SALES_RPT_MON.wp_id
  is 'ְ��ID
';
comment on column SXDXSJ.TA_SALES_RPT_MON.prjt_mgr_id
  is '��Ŀ����ID
';
comment on column SXDXSJ.TA_SALES_RPT_MON.tem_lead_id
  is '�Ŷӳ�ID
';
comment on column SXDXSJ.TA_SALES_RPT_MON.user_id
  is '��ϯID
';
comment on column SXDXSJ.TA_SALES_RPT_MON.fst_cal_list_qty
  is '�ײ�������
';
comment on column SXDXSJ.TA_SALES_RPT_MON.fst_cal_cont_list_qty
  is '�ײ��Ӵ�������';
comment on column SXDXSJ.TA_SALES_RPT_MON.trk_list_qty
  is '����������
';
comment on column SXDXSJ.TA_SALES_RPT_MON.cont_list_qty
  is '�ܾ�������
';
comment on column SXDXSJ.TA_SALES_RPT_MON.rej_list_qty
  is '�ܾ�������
';
comment on column SXDXSJ.TA_SALES_RPT_MON.oline_smit_qty
  is '�����ύ����
';
comment on column SXDXSJ.TA_SALES_RPT_MON.oline_smit_prm
  is '�����ύ����
';
comment on column SXDXSJ.TA_SALES_RPT_MON.oline_tran_qty
  is '���ϳɽ�����
';
comment on column SXDXSJ.TA_SALES_RPT_MON.oline_tran_prm
  is '���ϳɽ�����
';
comment on column SXDXSJ.TA_SALES_RPT_MON.fst_chargbk_succ_qty
  is '���ڿۿ�ɹ���';
comment on column SXDXSJ.TA_SALES_RPT_MON.annul_fst_prm_prm
  is '
�껯�±�����
';
comment on column SXDXSJ.TA_SALES_RPT_MON.actl_fst_prm_prm
  is 'ʵ���±�����
';
comment on column SXDXSJ.TA_SALES_RPT_MON.cncl_qty
  is '��ԥ���˱�����';
comment on column SXDXSJ.TA_SALES_RPT_MON.cncl_prm
  is '��ԥ���˱�����
';
comment on column SXDXSJ.TA_SALES_RPT_MON.population_tsmp
  is '����ʱ���
';
comment on column SXDXSJ.TA_SALES_RPT_MON.land_succ_qty
  is '��سɹ���';
comment on column SXDXSJ.TA_SALES_RPT_MON.land_succ_prm
  is '��سɹ�����';
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
  is '�������ۼƱ���';
comment on column SXDXSJ.TA_SALES_RPT_WEK.cal_week_id
  is 'ͳ������';
comment on column SXDXSJ.TA_SALES_RPT_WEK.pay_mode
  is '�ɷѷ�ʽ';
comment on column SXDXSJ.TA_SALES_RPT_WEK.actv_id
  is '�ID';
comment on column SXDXSJ.TA_SALES_RPT_WEK.bat_code
  is '���δ���';
comment on column SXDXSJ.TA_SALES_RPT_WEK.com_typ
  is '��������';
comment on column SXDXSJ.TA_SALES_RPT_WEK.bat_prjt
  is '������Ŀ';
comment on column SXDXSJ.TA_SALES_RPT_WEK.comp_id
  is '�ֹ�˾����
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.city_id
  is '����ID
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.ctr_code
  is '����';
comment on column SXDXSJ.TA_SALES_RPT_WEK.sales_prjt
  is '������Ŀ
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.tem_code
  is '�ŶӴ���
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.wp_id
  is 'ְ��ID
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.prjt_mgr_id
  is '��Ŀ����ID
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.tem_lead_id
  is '�Ŷӳ�ID
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.user_id
  is '��ϯID
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.fst_cal_list_qty
  is '�ײ�������
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.fst_cal_cont_list_qty
  is '�ײ��Ӵ�������';
comment on column SXDXSJ.TA_SALES_RPT_WEK.trk_list_qty
  is '����������
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.cont_list_qty
  is '�Ӵ�������
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.rej_list_qty
  is '�ܾ�������
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.oline_smit_qty
  is '�����ύ����
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.oline_smit_prm
  is '�����ύ����
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.oline_tran_qty
  is '���ϳɽ�����
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.oline_tran_prm
  is '���ϳɽ�����
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.fst_chargbk_succ_qty
  is '���ڿۿ�ɹ���';
comment on column SXDXSJ.TA_SALES_RPT_WEK.annul_fst_prm_prm
  is '
�껯�±�����
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.actl_fst_prm_prm
  is 'ʵ���±�����
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.cncl_qty
  is '��ԥ���˱�����';
comment on column SXDXSJ.TA_SALES_RPT_WEK.cncl_prm
  is '��ԥ���˱�����
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.population_tsmp
  is '����ʱ���
';
comment on column SXDXSJ.TA_SALES_RPT_WEK.land_succ_qty
  is '��سɹ���';
comment on column SXDXSJ.TA_SALES_RPT_WEK.land_succ_prm
  is '��سɹ�����';
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
  is 'Ͷ����������Ϣ��';
comment on column SXDXSJ.TB_APPLICATION.application_id
  is 'Ͷ����ID';
comment on column SXDXSJ.TB_APPLICATION.appno
  is 'Ͷ������';
comment on column SXDXSJ.TB_APPLICATION.policyno
  is '������';
comment on column SXDXSJ.TB_APPLICATION.idorg
  is '��֧��˾����';
comment on column SXDXSJ.TB_APPLICATION.iddmsystem
  is '�ⲿϵͳͶ����ID';
comment on column SXDXSJ.TB_APPLICATION.iddmtype
  is '������Դ����';
comment on column SXDXSJ.TB_APPLICATION.firstcreate
  is '����ʱ��';
comment on column SXDXSJ.TB_APPLICATION.lastupdate
  is '�޸�ʱ��';
comment on column SXDXSJ.TB_APPLICATION.isubmit
  is '�Ƿ��ύ';
comment on column SXDXSJ.TB_APPLICATION.iaccept
  is '�Ƿ���سɹ� Ĭ�� 0 ��1 ����سɹ�';
comment on column SXDXSJ.TB_APPLICATION.tsrid
  is '¼����ϯ����';
comment on column SXDXSJ.TB_APPLICATION.product_name
  is '��Ʒ����';
comment on column SXDXSJ.TB_APPLICATION.campaign_name
  is '�����';
comment on column SXDXSJ.TB_APPLICATION.ialter
  is '�Ƿ����޸� 1��';
comment on column SXDXSJ.TB_APPLICATION.irepeal
  is '�Ƿ���  1��';
comment on column SXDXSJ.TB_APPLICATION.iupdate
  is '�Ƿ����  1��';
comment on column SXDXSJ.TB_APPLICATION.app_status
  is 'Ͷ����״̬';
comment on column SXDXSJ.TB_APPLICATION.prj_id
  is '��ĿID';
comment on column SXDXSJ.TB_APPLICATION.ai_rel
  is 'Ͷ���˺ͱ����˹�ϵ';
comment on column SXDXSJ.TB_APPLICATION.acus_licno
  is 'Ͷ����֤����';
comment on column SXDXSJ.TB_APPLICATION.acus_mob
  is 'Ͷ���ֻ�';
comment on column SXDXSJ.TB_APPLICATION.acus_gender
  is 'Ͷ�����Ա�';
comment on column SXDXSJ.TB_APPLICATION.acus_name
  is 'Ͷ��������';
comment on column SXDXSJ.TB_APPLICATION.icus_licno
  is '������֤����';
comment on column SXDXSJ.TB_APPLICATION.icus_mob
  is '������Ͷ���ֻ�';
comment on column SXDXSJ.TB_APPLICATION.icus_gender
  is '�������Ա�';
comment on column SXDXSJ.TB_APPLICATION.icus_name
  is '����������';
comment on column SXDXSJ.TB_APPLICATION.agent_id
  is 'ҵ��Ա����';
comment on column SXDXSJ.TB_APPLICATION.total_fee
  is '�ܱ���';
comment on column SXDXSJ.TB_APPLICATION.org_id
  is 'ʵ������Ȩ�޹���';
comment on column SXDXSJ.TB_APPLICATION.site_status
  is '�Ƿ��˻��ֳ���00-��������01-�Ѿ��˻��ֳ���';
comment on column SXDXSJ.TB_APPLICATION.pro_status
  is '00-����У����ͨ������˲�ͨ��ΪNULL';
comment on column SXDXSJ.TB_APPLICATION.is_del
  is '�Ƿ�ɾ����0Ϊ��1Ϊ�ǣ�';
comment on column SXDXSJ.TB_APPLICATION.ob_com_id
  is '�����';
comment on column SXDXSJ.TB_APPLICATION.verify_status
  is '���״̬';
comment on column SXDXSJ.TB_APPLICATION.verify_note
  is '��˱�ע';
comment on column SXDXSJ.TB_APPLICATION.update_user
  is '�޸���';
comment on column SXDXSJ.TB_APPLICATION.verify_date
  is '������ڣ����ͨ��ʱΪ�ɽ����ڣ�';
comment on column SXDXSJ.TB_APPLICATION.product_id
  is '��ƷID';
comment on column SXDXSJ.TB_APPLICATION.export_flag
  is '�Ƿ��Ѿ�������UNICALL��N����Y���ǣ�';
comment on column SXDXSJ.TB_APPLICATION.export_time
  is '����ʱ��';
comment on column SXDXSJ.TB_APPLICATION.fee_desc
  is '������ϸ';
comment on column SXDXSJ.TB_APPLICATION.population_tsmp
  is '����ʱ���';
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
  is 'Ͷ������Ʒ��Ϣ��';
comment on column SXDXSJ.TB_APP_PRD_INFO.application_id
  is 'Ͷ����ID';
comment on column SXDXSJ.TB_APP_PRD_INFO.ins_code
  is '���ִ���';
comment on column SXDXSJ.TB_APP_PRD_INFO.main_flag
  is '�����ձ�־';
comment on column SXDXSJ.TB_APP_PRD_INFO.amount
  is '����';
comment on column SXDXSJ.TB_APP_PRD_INFO.pay_lev
  is '�ɷѱ�׼';
comment on column SXDXSJ.TB_APP_PRD_INFO.job_fee
  is 'ְҵ�ӷ�';
comment on column SXDXSJ.TB_APP_PRD_INFO.pay_typ
  is '�ɷѷ�ʽ';
comment on column SXDXSJ.TB_APP_PRD_INFO.pay_period
  is '�ɷ�����';
comment on column SXDXSJ.TB_APP_PRD_INFO.ins_period
  is '�����ڼ�';
comment on column SXDXSJ.TB_APP_PRD_INFO.ins_perd_typ
  is '�����ڼ�����';
comment on column SXDXSJ.TB_APP_PRD_INFO.recv_typ
  is '��ȡ��ʽ';
comment on column SXDXSJ.TB_APP_PRD_INFO.recv_age
  is '��ȡ����';
comment on column SXDXSJ.TB_APP_PRD_INFO.fixed_plc_no
  is '��������(Ĭ��00)';
comment on column SXDXSJ.TB_APP_PRD_INFO.pieces
  is '����';
comment on column SXDXSJ.TB_APP_PRD_INFO.population_tsmp
  is '����ʱ���';
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
  is '����ά����';
comment on column SXDXSJ.TB_AREA.area_id
  is '������λ��ţ�����';
comment on column SXDXSJ.TB_AREA.area_num
  is '������λ���룬ͬ���ҷ�����룬Ҳ���¼�������λ�ĸ���������';
comment on column SXDXSJ.TB_AREA.area_name
  is '������λ����';
comment on column SXDXSJ.TB_AREA.area_fath
  is '������λ������';
comment on column SXDXSJ.TB_AREA.simple_name
  is '������λ���';
comment on column SXDXSJ.TB_AREA.area_level
  is '������λ���� 1:ʡ�� 2:�ؼ��� 3:����';
comment on column SXDXSJ.TB_AREA.area_order
  is '��ʾ˳��ʡ��������λ���룬���10������������λĬ��100';
comment on column SXDXSJ.TB_AREA.del_flg
  is '�Ƿ�ɾ���ı�ʾ 0 δɾ�� 1 ��ɾ��';
comment on column SXDXSJ.TB_AREA.create_user
  is '������ ��ʼ������Ϊ0_Admin';
comment on column SXDXSJ.TB_AREA.create_time
  is '����ʱ��';
comment on column SXDXSJ.TB_AREA.update_user
  is '�޸��� ��ʼ�޸���Ϊ��';
comment on column SXDXSJ.TB_AREA.update_time
  is '�޸�ʱ��';
comment on column SXDXSJ.TB_AREA.city_cnt
  is '�����ĵؼ�������';
comment on column SXDXSJ.TB_AREA.area_cnt
  is '��������������';
comment on column SXDXSJ.TB_AREA.population_tsmp
  is '����ʱ���';
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
  is '���붨���';
comment on column SXDXSJ.TB_CODE.code_name
  is '��������';
comment on column SXDXSJ.TB_CODE.code_value
  is '����ֵ';
comment on column SXDXSJ.TB_CODE.code_remark
  is '��ע';
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
  is 'ҵ�����ID';
comment on column SXDXSJ.TB_COMPANY.parent_company_id
  is '��ҵ�����ID';
comment on column SXDXSJ.TB_COMPANY.company_name
  is '��������';
comment on column SXDXSJ.TB_COMPANY.company_code
  is '��������';
comment on column SXDXSJ.TB_COMPANY.is_branch_company
  is '�Ƿ��Ƿֹ�˾';
comment on column SXDXSJ.TB_COMPANY.is_delete
  is 'ɾ����ʶ';
comment on column SXDXSJ.TB_COMPANY.company_finance_code
  is '�����������';
comment on column SXDXSJ.TB_COMPANY.region_code
  is '�������';
comment on column SXDXSJ.TB_COMPANY.operate_user_code
  is 'ҵ��Ա����';
comment on column SXDXSJ.TB_COMPANY.operate_user_name
  is 'ҵ��Ա����';
comment on column SXDXSJ.TB_COMPANY.is_ff
  is '���ͱ���ʱ�����ж��Ƿ��գ�1 �ǣ�0 ��';
comment on column SXDXSJ.TB_COMPANY.company_type
  is '�������ͣ�01:�ֹ�˾;02:��֧��˾;03:�ڲ�ְ��;04:���ְ��;';
comment on column SXDXSJ.TB_COMPANY.population_tsmp
  is '����ʱ���';
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
  is '����ID';
comment on column SXDXSJ.TB_CUSTOMER_LIST.cus_unique_ide
  is '�ͻ�Ψһ��ʶ';
comment on column SXDXSJ.TB_CUSTOMER_LIST.cus_name
  is '�ͻ�����';
comment on column SXDXSJ.TB_CUSTOMER_LIST.cus_sex
  is '�ͻ��Ա�';
comment on column SXDXSJ.TB_CUSTOMER_LIST.task_id
  is '������';
comment on column SXDXSJ.TB_CUSTOMER_LIST.org_center
  is '��������';
comment on column SXDXSJ.TB_CUSTOMER_LIST.org_proj
  is '��Ŀ';
comment on column SXDXSJ.TB_CUSTOMER_LIST.org_team
  is '�Ŷ�';
comment on column SXDXSJ.TB_CUSTOMER_LIST.user_id
  is '��ϯID';
comment on column SXDXSJ.TB_CUSTOMER_LIST.call_status
  is '1��ʾ�Ѳ���0��ʾδ����';
comment on column SXDXSJ.TB_CUSTOMER_LIST.status
  is '����״̬  1��ʾ�ѷ��䣬0��ʾδ����';
comment on column SXDXSJ.TB_CUSTOMER_LIST.cus_birthday
  is '��������';
comment on column SXDXSJ.TB_CUSTOMER_LIST.cus_age
  is '����';
comment on column SXDXSJ.TB_CUSTOMER_LIST.ide_type
  is '֤������';
comment on column SXDXSJ.TB_CUSTOMER_LIST.ide_number
  is '֤������';
comment on column SXDXSJ.TB_CUSTOMER_LIST.cus_metier
  is '�ͻ�ְҵ';
comment on column SXDXSJ.TB_CUSTOMER_LIST.mobile
  is '�ƶ��绰';
comment on column SXDXSJ.TB_CUSTOMER_LIST.mobile1
  is '�ƶ��绰1';
comment on column SXDXSJ.TB_CUSTOMER_LIST.mobile2
  is '�ƶ��绰2';
comment on column SXDXSJ.TB_CUSTOMER_LIST.contect_tel
  is '��ϵ�绰';
comment on column SXDXSJ.TB_CUSTOMER_LIST.home_tel
  is '��ͥ�绰';
comment on column SXDXSJ.TB_CUSTOMER_LIST.off_tel
  is '��λ�绰';
comment on column SXDXSJ.TB_CUSTOMER_LIST.contect_tel_type
  is '��ϵ�绰���ͣ����õ绰��־��';
comment on column SXDXSJ.TB_CUSTOMER_LIST.detailed_address
  is '��ַ_��ַ';
comment on column SXDXSJ.TB_CUSTOMER_LIST.postcode
  is '��ַ_�ʱ�';
comment on column SXDXSJ.TB_CUSTOMER_LIST.add_type
  is '��ַ����';
comment on column SXDXSJ.TB_CUSTOMER_LIST.emergency_con_person
  is '���������ˣ�������';
comment on column SXDXSJ.TB_CUSTOMER_LIST.emergency_con_tel
  is '���������ˣ��绰��';
comment on column SXDXSJ.TB_CUSTOMER_LIST.emer_con_relation
  is '������������ͻ���ϵ';
comment on column SXDXSJ.TB_CUSTOMER_LIST.contact_detailed_add
  is '�����ַ_��ַ';
comment on column SXDXSJ.TB_CUSTOMER_LIST.contact_postcode
  is '�����ַ�ʱ�';
comment on column SXDXSJ.TB_CUSTOMER_LIST.cus_company
  is '������λ';
comment on column SXDXSJ.TB_CUSTOMER_LIST.metier_level
  is 'ְҵ�ȼ�';
comment on column SXDXSJ.TB_CUSTOMER_LIST.marital_status
  is '����״��';
comment on column SXDXSJ.TB_CUSTOMER_LIST.bank_name
  is '���У������У�';
comment on column SXDXSJ.TB_CUSTOMER_LIST.bank_account_holder
  is '���п����ˣ������˻�������';
comment on column SXDXSJ.TB_CUSTOMER_LIST.bank_account
  is '�����˻����ʺţ�';
comment on column SXDXSJ.TB_CUSTOMER_LIST.is_vip
  is '�Ƿ�����VIP';
comment on column SXDXSJ.TB_CUSTOMER_LIST.batch_id
  is '����ID';
comment on column SXDXSJ.TB_CUSTOMER_LIST.org_id
  is '������ˮ��';
comment on column SXDXSJ.TB_CUSTOMER_LIST.creat_user
  is '������(Ĭ��ϵͳ)';
comment on column SXDXSJ.TB_CUSTOMER_LIST.creat_time
  is '����ʱ��';
comment on column SXDXSJ.TB_CUSTOMER_LIST.modify_person
  is '�޸���(���һ���޸�)';
comment on column SXDXSJ.TB_CUSTOMER_LIST.modify_time
  is '�޸�ʱ��(���һ���޸�)';
comment on column SXDXSJ.TB_CUSTOMER_LIST.is_blacklist
  is '�Ƿ������� Ĭ��0  �������Ϊ1';
comment on column SXDXSJ.TB_CUSTOMER_LIST.fax
  is '����';
comment on column SXDXSJ.TB_CUSTOMER_LIST.res
  is '��ע';
comment on column SXDXSJ.TB_CUSTOMER_LIST.marital_id
  is 'ְҵ';
comment on column SXDXSJ.TB_CUSTOMER_LIST.assign_date
  is '��������ʱ��';
comment on column SXDXSJ.TB_CUSTOMER_LIST.population_tsmp
  is '����ʱ���';
comment on column SXDXSJ.TB_CUSTOMER_LIST.introduction_id
  is 'ת����ID';
comment on column SXDXSJ.TB_CUSTOMER_LIST.is_introduction
  is '�Ƿ���ת�������� 0=���� 1=��';
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
  is 'Ͷ�����ύ��־��';
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
  is '�����';
comment on column SXDXSJ.TB_OB_COM.ob_com_id
  is '�����';
comment on column SXDXSJ.TB_OB_COM.ob_com_sta
  is '3-����;4-ɾ��.�ӱ�ʶ�ֵ���ȡ';
comment on column SXDXSJ.TB_OB_COM.center
  is '����֯�ܹ��ж���';
comment on column SXDXSJ.TB_OB_COM.namlst_type
  is '���ֵ���ȡ';
comment on column SXDXSJ.TB_OB_COM.recv_type
  is '1-���շ�,2-����,�ӱ�ʶ�ֵ���л�ȡ';
comment on column SXDXSJ.TB_OB_COM.pay_type
  is 'ת�ˣ��ֽ�֧Ʊ��POS';
comment on column SXDXSJ.TB_OB_COM.repay_type
  is 'ת�ˣ��ֽ�֧Ʊ��POS';
comment on column SXDXSJ.TB_OB_COM.create_dat
  is '����ʱ��';
comment on column SXDXSJ.TB_OB_COM.creator
  is '������';
comment on column SXDXSJ.TB_OB_COM.modify_dat
  is '�޸�ʱ��';
comment on column SXDXSJ.TB_OB_COM.modifier
  is '�޸���';
comment on column SXDXSJ.TB_OB_COM.prj_id
  is '��ĿID';
comment on column SXDXSJ.TB_OB_COM.ob_com_code
  is '�����';
comment on column SXDXSJ.TB_OB_COM.population_tsmp
  is '����ʱ���';
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
  is '��֯����';
comment on column SXDXSJ.TB_ORGANIZATION.org_id
  is '������ˮ��';
comment on column SXDXSJ.TB_ORGANIZATION.org_name
  is '��������';
comment on column SXDXSJ.TB_ORGANIZATION.company_id
  is 'ҵ�����ID';
comment on column SXDXSJ.TB_ORGANIZATION.parent_org_id
  is '�ϼ�����ID';
comment on column SXDXSJ.TB_ORGANIZATION.org_level
  is '��������  0:�ܹ�˾ 1:���������� 2:���������� 3:��Ŀ 4:�Ŷ�';
comment on column SXDXSJ.TB_ORGANIZATION.org_desc
  is '������ע';
comment on column SXDXSJ.TB_ORGANIZATION.org_type
  is '��������';
comment on column SXDXSJ.TB_ORGANIZATION.org_code
  is '��������';
comment on column SXDXSJ.TB_ORGANIZATION.is_del
  is 'ɾ����־';
comment on column SXDXSJ.TB_ORGANIZATION.create_user
  is '������';
comment on column SXDXSJ.TB_ORGANIZATION.create_time
  is '����ʱ��';
comment on column SXDXSJ.TB_ORGANIZATION.update_user
  is '�޸���';
comment on column SXDXSJ.TB_ORGANIZATION.update_time
  is '�޸�ʱ��';
comment on column SXDXSJ.TB_ORGANIZATION.population_tsmp
  is '����ʱ���';
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
  is '�������û���Ϣ��ϵ�������ʼ�����ר�ã�';
comment on column SXDXSJ.TB_ORG_USERINFO.row_no
  is '�б��';
comment on column SXDXSJ.TB_ORG_USERINFO.org_id
  is '��������';
comment on column SXDXSJ.TB_ORG_USERINFO.org_name
  is '��������';
comment on column SXDXSJ.TB_ORG_USERINFO.user_code
  is '�û�����';
comment on column SXDXSJ.TB_ORG_USERINFO.user_name
  is '�û�����';
comment on column SXDXSJ.TB_ORG_USERINFO.user_email
  is '�û�Email��ַ';
comment on column SXDXSJ.TB_ORG_USERINFO.notes
  is '��ע';
comment on column SXDXSJ.TB_ORG_USERINFO.active
  is '��Ч״̬��1 Ĭ����Ч��0ʧЧ';
comment on column SXDXSJ.TB_ORG_USERINFO.creator
  is '�����ߣ�Ĭ����admin';
comment on column SXDXSJ.TB_ORG_USERINFO.createtime
  is 'ϵͳʱ�䣺Ĭ����sysdate';
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
  is '��ĿID';
comment on column SXDXSJ.TB_PROJECT_INFO.grp_id
  is '��ĿȺID';
comment on column SXDXSJ.TB_PROJECT_INFO.prj_name
  is '��Ŀ����';
comment on column SXDXSJ.TB_PROJECT_INFO.prj_status
  is '�Ƿ���Ч,1-��Ч;2-��Ч';
comment on column SXDXSJ.TB_PROJECT_INFO.sale_cha
  is '��������';
comment on column SXDXSJ.TB_PROJECT_INFO.ins_src
  is 'Ͷ������Դ';
comment on column SXDXSJ.TB_PROJECT_INFO.oc_id
  is '��������˾';
comment on column SXDXSJ.TB_PROJECT_INFO.file_fmt
  is '�����ļ���ʽ';
comment on column SXDXSJ.TB_PROJECT_INFO.memo
  is '��Ŀ˵��';
comment on column SXDXSJ.TB_PROJECT_INFO.sign_typ
  is '������ʽ';
comment on column SXDXSJ.TB_PROJECT_INFO.bank_flag
  is '�Ƿ�����ͨ';
comment on column SXDXSJ.TB_PROJECT_INFO.prj_typ
  is '��Ŀ���';
comment on column SXDXSJ.TB_PROJECT_INFO.cus_typ
  is '�ͻ����';
comment on column SXDXSJ.TB_PROJECT_INFO.org_id
  is 'ҵ�����,��Ŀ��������';
comment on column SXDXSJ.TB_PROJECT_INFO.create_dat
  is '����ʱ��';
comment on column SXDXSJ.TB_PROJECT_INFO.creator
  is '������';
comment on column SXDXSJ.TB_PROJECT_INFO.modify_dat
  is '�޸�ʱ��';
comment on column SXDXSJ.TB_PROJECT_INFO.modifier
  is '�޸���';
comment on column SXDXSJ.TB_PROJECT_INFO.population_tsmp
  is '����ʱ���';
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
  is '�������û���ϵ�������ʼ�����ר�ã�';
comment on column SXDXSJ.TB_RPT_USER.user_email
  is '�û�Email��ַ';
comment on column SXDXSJ.TB_RPT_USER.user_name
  is '�û�����';
comment on column SXDXSJ.TB_RPT_USER.rpt_id
  is '�������';
comment on column SXDXSJ.TB_RPT_USER.rpt_name
  is '��������';
comment on column SXDXSJ.TB_RPT_USER.active
  is '��Ч״̬��1 Ĭ����Ч��0ʧЧ';
comment on column SXDXSJ.TB_RPT_USER.creator
  is '�����ߣ�Ĭ����admin';
comment on column SXDXSJ.TB_RPT_USER.createtime
  is 'ϵͳʱ�䣺Ĭ����sysdate';
comment on column SXDXSJ.TB_RPT_USER.updatetime
  is '����ʱ��';
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
  is '����ID';
comment on column SXDXSJ.TB_SALE_BATCH.ob_com_id
  is '�ID';
comment on column SXDXSJ.TB_SALE_BATCH.upload_way
  is '���ط�ʽ  1.�ֶ�����  2.�Զ�����';
comment on column SXDXSJ.TB_SALE_BATCH.assign_way
  is '�·���ʽ  1. ���ص���֯   2.ֱ���·�����ϯ';
comment on column SXDXSJ.TB_SALE_BATCH.batch_name
  is '��������';
comment on column SXDXSJ.TB_SALE_BATCH.batch_code
  is '���α���';
comment on column SXDXSJ.TB_SALE_BATCH.com_type
  is '��������  �ֵ��';
comment on column SXDXSJ.TB_SALE_BATCH.call_date
  is '��ʼ��������';
comment on column SXDXSJ.TB_SALE_BATCH.remove_date
  is '��������';
comment on column SXDXSJ.TB_SALE_BATCH.call_year_month
  is '��������';
comment on column SXDXSJ.TB_SALE_BATCH.org_center
  is '����';
comment on column SXDXSJ.TB_SALE_BATCH.org_pro
  is '��Ŀ';
comment on column SXDXSJ.TB_SALE_BATCH.org_team
  is '�Ŷ�';
comment on column SXDXSJ.TB_SALE_BATCH.gerenerate_info
  is '����������';
comment on column SXDXSJ.TB_SALE_BATCH.create_user
  is '������';
comment on column SXDXSJ.TB_SALE_BATCH.create_time
  is '����ʱ��';
comment on column SXDXSJ.TB_SALE_BATCH.update_user
  is '�޸���';
comment on column SXDXSJ.TB_SALE_BATCH.update_time
  is '�޸�ʱ��';
comment on column SXDXSJ.TB_SALE_BATCH.file_name
  is '�ļ���';
comment on column SXDXSJ.TB_SALE_BATCH.log_content
  is '��־����';
comment on column SXDXSJ.TB_SALE_BATCH.belongcity
  is '��������';
comment on column SXDXSJ.TB_SALE_BATCH.com_seriars
  is '��������   �ֵ��';
comment on column SXDXSJ.TB_SALE_BATCH.call_times
  is '���������1-�ײ���2-������3-����';
comment on column SXDXSJ.TB_SALE_BATCH.success
  is '���������ɹ���';
comment on column SXDXSJ.TB_SALE_BATCH.failure
  is '��������ʧ����';
comment on column SXDXSJ.TB_SALE_BATCH.population_tsmp
  is '����ʱ���';
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
  is '������ʷ��';
comment on column SXDXSJ.TB_SALE_HISTORY.history_id
  is '������ʷID';
comment on column SXDXSJ.TB_SALE_HISTORY.cus_list_id
  is '����ID';
comment on column SXDXSJ.TB_SALE_HISTORY.customer_id
  is '�ͻ�Ψһ��ʶ';
comment on column SXDXSJ.TB_SALE_HISTORY.obcom_id
  is '�ID';
comment on column SXDXSJ.TB_SALE_HISTORY.activity_name
  is '�����';
comment on column SXDXSJ.TB_SALE_HISTORY.user_id
  is 'ִ���ߣ���ǰ����Ա��';
comment on column SXDXSJ.TB_SALE_HISTORY.user_name
  is 'ִ���ߣ�����Ա���ƣ�';
comment on column SXDXSJ.TB_SALE_HISTORY.contact_phone
  is '��ϵ�绰';
comment on column SXDXSJ.TB_SALE_HISTORY.first_result
  is 'һ���������';
comment on column SXDXSJ.TB_SALE_HISTORY.second_result
  is '�����������';
comment on column SXDXSJ.TB_SALE_HISTORY.is_contact
  is '�Ӵ������0��δ�Ӵ���1���ѽӴ���';
comment on column SXDXSJ.TB_SALE_HISTORY.is_through
  is '��ͨ�����0��δ��ͨ��1���Ѳ�ͨ��';
comment on column SXDXSJ.TB_SALE_HISTORY.callover_time
  is 'ͨ������ʱ��';
comment on column SXDXSJ.TB_SALE_HISTORY.appoint_time
  is 'ԤԼ�ط�ʱ��';
comment on column SXDXSJ.TB_SALE_HISTORY.memo
  is '��ע';
comment on column SXDXSJ.TB_SALE_HISTORY.configuration
  is '���������ֶμ����Իس����֣�KEY/VALUE��ֵ�Ա��棩';
comment on column SXDXSJ.TB_SALE_HISTORY.task_id
  is '������';
comment on column SXDXSJ.TB_SALE_HISTORY.task_status
  is '����״̬';
comment on column SXDXSJ.TB_SALE_HISTORY.task_type
  is '��������';
comment on column SXDXSJ.TB_SALE_HISTORY.policy_id
  is 'Ͷ�������';
comment on column SXDXSJ.TB_SALE_HISTORY.policy_status
  is 'Ͷ����״̬';
comment on column SXDXSJ.TB_SALE_HISTORY.create_history_date
  is '��ʷ����ʱ��';
comment on column SXDXSJ.TB_SALE_HISTORY.ext
  is '��չ�ֶ�';
comment on column SXDXSJ.TB_SALE_HISTORY.call_duration
  is 'ͨ��ʱ��';
comment on column SXDXSJ.TB_SALE_HISTORY.callstart_time
  is 'ͨ����ʼʱ��';
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
  is '�����';
comment on column SXDXSJ.TB_TASK.task_id
  is '����ID';
comment on column SXDXSJ.TB_TASK.task_level
  is '�Ż���';
comment on column SXDXSJ.TB_TASK.create_time
  is '���񴴽�ʱ��';
comment on column SXDXSJ.TB_TASK.change_time
  is '���ı�ʱ��';
comment on column SXDXSJ.TB_TASK.is_important
  is '�Ƿ��ص����ѣ�ɾ����';
comment on column SXDXSJ.TB_TASK.appoint_time
  is 'ԤԼʱ��';
comment on column SXDXSJ.TB_TASK.active_status
  is '����״̬';
comment on column SXDXSJ.TB_TASK.task_memo
  is '����˵��';
comment on column SXDXSJ.TB_TASK.callresult_type
  is '����С��ģ��(��������=1 �����=2 �������=3 �ں���ѯ=4)';
comment on column SXDXSJ.TB_TASK.first_result
  is '����С��һ�����';
comment on column SXDXSJ.TB_TASK.second_result
  is '����С�ڶ������';
comment on column SXDXSJ.TB_TASK.user_id
  is '������ϯ';
comment on column SXDXSJ.TB_TASK.org_id
  is '��������';
comment on column SXDXSJ.TB_TASK.status_id
  is '״̬���';
comment on column SXDXSJ.TB_TASK.type_id
  is '���ͱ��';
comment on column SXDXSJ.TB_TASK.policy_id
  is 'Ͷ����ID';
comment on column SXDXSJ.TB_TASK.batch_id
  is '����ID';
comment on column SXDXSJ.TB_TASK.cus_list_id
  is '����ID';
comment on column SXDXSJ.TB_TASK.ob_com_id
  is '�ID';
comment on column SXDXSJ.TB_TASK.population_tsmp
  is '����ʱ���';
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
  is '������ʷ��';
comment on column SXDXSJ.TB_TASK_HISTORY.history_id
  is '������ʷ���';
comment on column SXDXSJ.TB_TASK_HISTORY.task_id
  is '����ID';
comment on column SXDXSJ.TB_TASK_HISTORY.task_level
  is '���ȼ�';
comment on column SXDXSJ.TB_TASK_HISTORY.create_time
  is '���񴴽�ʱ��';
comment on column SXDXSJ.TB_TASK_HISTORY.change_time
  is '�������仯ʱ��';
comment on column SXDXSJ.TB_TASK_HISTORY.is_important
  is '�Ƿ��ص�����';
comment on column SXDXSJ.TB_TASK_HISTORY.appoint_time
  is 'ԤԼʱ��';
comment on column SXDXSJ.TB_TASK_HISTORY.active_status
  is '����״̬';
comment on column SXDXSJ.TB_TASK_HISTORY.task_memo
  is '����˵��';
comment on column SXDXSJ.TB_TASK_HISTORY.callresult_type
  is '��󲦴�С��';
comment on column SXDXSJ.TB_TASK_HISTORY.first_result
  is '����һ�����';
comment on column SXDXSJ.TB_TASK_HISTORY.second_result
  is '����������';
comment on column SXDXSJ.TB_TASK_HISTORY.user_id
  is '������ϯID';
comment on column SXDXSJ.TB_TASK_HISTORY.org_id
  is '��������';
comment on column SXDXSJ.TB_TASK_HISTORY.status_id
  is '����״̬';
comment on column SXDXSJ.TB_TASK_HISTORY.type_id
  is '��������';
comment on column SXDXSJ.TB_TASK_HISTORY.policy_id
  is '������';
comment on column SXDXSJ.TB_TASK_HISTORY.ob_com_id
  is '����';
comment on column SXDXSJ.TB_TASK_HISTORY.batch_id
  is '����ID';
comment on column SXDXSJ.TB_TASK_HISTORY.cus_list_id
  is '����ID';
comment on column SXDXSJ.TB_TASK_HISTORY.create_history_date
  is '��ʷ��������ʱ��';
comment on column SXDXSJ.TB_TASK_HISTORY.ext1
  is '��չ�ֶ�2';
comment on column SXDXSJ.TB_TASK_HISTORY.ext2
  is '��չ�ֶ�2';
comment on column SXDXSJ.TB_TASK_HISTORY.ext3
  is '��չ�ֶ�3';
comment on column SXDXSJ.TB_TASK_HISTORY.ext4
  is '��չ�ֶ�4';
comment on column SXDXSJ.TB_TASK_HISTORY.population_tsmp
  is '����ʱ���';
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
  is 'ְ������';
comment on column SXDXSJ.TB_WORKPLACE.workplace_id
  is 'ְ��������е�ְ�����';
comment on column SXDXSJ.TB_WORKPLACE.org_id
  is '������ˮ��';
comment on column SXDXSJ.TB_WORKPLACE.workplace_name
  is 'ְ��������е�ְ������';
comment on column SXDXSJ.TB_WORKPLACE.softphone_url
  is 'ְ��������е���绰URL';
comment on column SXDXSJ.TB_WORKPLACE.cti_address
  is 'ְ��������е�CTI��ַ';
comment on column SXDXSJ.TB_WORKPLACE.cti_port
  is 'ְ��������е�CTI�˿�';
comment on column SXDXSJ.TB_WORKPLACE.workplace_type
  is 'ְ��������е�ְ������';
comment on column SXDXSJ.TB_WORKPLACE.contact_name
  is 'ְ��������е���ϵ��';
comment on column SXDXSJ.TB_WORKPLACE.contact_phone
  is 'ְ��������е���ϵ�˵绰';
comment on column SXDXSJ.TB_WORKPLACE.contact_address
  is 'ְ��������е���ϵ��ַ';
comment on column SXDXSJ.TB_WORKPLACE.contact_comment
  is 'ְ��������е�ְ����ע';
comment on column SXDXSJ.TB_WORKPLACE.ivr_group_num
  is 'ְ��������е�IVR���';
comment on column SXDXSJ.TB_WORKPLACE.is_del
  is 'ɾ����־';
comment on column SXDXSJ.TB_WORKPLACE.voice_address
  is 'ְ��������е�¼��������ַ';
comment on column SXDXSJ.TB_WORKPLACE.population_tsmp
  is '����ʱ���';
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
  is 'ͳ������
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.schl_call_mon
  is '�ƻ���������
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.actv_id
  is '�';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.bat_code
  is '���δ���
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.com_typ
  is '��������
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.bat_prjt
  is '������Ŀ
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.comp_id
  is '�ֹ�˾ID
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.city_id
  is '����ID
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.org_typ
  is '��������';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.cal_times
  is '�������';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.prjt_mgr_id
  is '��Ŀ����ID
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.tem_lead_id
  is '�Ŷӳ�ID
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.user_id
  is '��ϯID
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.list_tno
  is '��������
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.fst_cal_list_qty
  is '�ײ�������
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.cal_comp_list_qty
  is '�������������
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.connt_list_qty
  is '��ͨ������
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.cont_list_qty
  is '�Ӵ�������';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.cal_comp_cont_list_qty
  is '������ɽӴ�������
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.surp_trk_list_qty
  is 'ʣ�����������
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.oline_smit_qty
  is '�����ύ����
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.oline_smit_prm
  is '�����ύ����';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.oline_tran_qty
  is '���ϳɽ�����
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.oline_tran_prm
  is '���ϳɽ�����
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.fst_chargbk_succ_qty
  is '���ڿۿ�ɹ�����
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.fst_chargbk_succ_prm
  is '���ڿۿ�ɹ�����
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.annul_fst_prm_prm
  is '�껯�±�����

';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.actl_fst_prm_prm
  is 'ʵ���±�����
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.wtn_qty
  is '�������ͳɹ�����
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.agg_cal_times
  is '�ۼƲ������
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.agg_cont_times
  is '�ۼƽ�ͨ����
';
comment on column SXDXSJ.TEMP_CMP_RPT_DAY.population_tsmp
  is '����ʱ���';
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
  is '����ԭʼ����ʱ��������ǹ¶�����Ҳ�������������Ƚ����ݵ��뱾��Ȼ���ٽ��к����ķ�������';
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
  is '�ӵ���ϵͳ���ص�ÿ���������ϳɽ�������Ϣ�����ȱ����뱾��Ȼ����к����ķ�������ÿ�ε�����һ������ǰ�������ᱻ��ա�';
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
  is '�ӵ���ϵͳ���ص�ÿ�������������Ϣ�����ȱ����뱾��Ȼ����к����ķ�������ÿ�ε�����һ������ǰ�������ᱻ��ա�';
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
  is '�ӵ���ϵͳ���ظ���ϵͳ�Ĳ�������Ϣ���ݽ����ȱ����뱾��Ȼ�󽫽��к����ķ�������ÿ�ε�����һ������ǰ����������ա�';
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
  is '����¶�������������ʱ���������ݽ�����ڴ˱��������ķ�������';
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
  is '����¶�������������ʱ��Ͷ������Ϣ�����ȵ��뱾��Ȼ��ʼ�����ķ�������ÿ�ε�����һ������ǰ�������ᱻ��ա�
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
  is '��ecif���صı���������Ϣ�����ȵ��뱾��Ȼ�����һϵ�еķ�������ÿ�ε���ǰ�������ᱻ��ա�';
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
  is '��������������ʱ��';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.cal_day_id
  is 'ͳ������';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.actv_id
  is '�ID';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.bat_code
  is '���δ���';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.com_typ
  is '��������';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.bat_prjt
  is '������Ŀ';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.comp_id
  is '�ֹ�˾';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.city_id
  is '����';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.org_typ
  is '��������';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.wp_id
  is 'ְ��';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.prjt_mgr_id
  is '��Ŀ����id';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.tem_lead_id
  is '�Ŷ�ID';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.on_line_human
  is '��������';
comment on column SXDXSJ.TEMP_SALES_HUMAN_RPT_DAY.population_tsmp
  is '����ʱ���';

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
  is '�Ӷ���ƽ̨���ص�ÿ����ϴ�ɹ��ֻ�������Ϣ�����ȱ����뱾��Ȼ����к����ķ�������ÿ�ε�����һ������ǰ�������ᱻ��ա�';
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
  is '�н��������ID';
comment on column SXDXSJ.T_AGENTCOMPANY_TYPE.t_agentcompany_type_name
  is '�н������������';
comment on column SXDXSJ.T_AGENTCOMPANY_TYPE.t_agentcompany_type_desc
  is '�н������������';
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
  is '���ű�';
comment on column SXDXSJ.T_DA_DEPT.c_dept_id
  is '����Id';
comment on column SXDXSJ.T_DA_DEPT.c_dept_name
  is '��������';
comment on column SXDXSJ.T_DA_DEPT.c_id_path
  is '����id·�� �磨1/2/3��';
comment on column SXDXSJ.T_DA_DEPT.c_name_path
  is '��������·�� ���� �ܹ�˾/�ֹ�˾��';
comment on column SXDXSJ.T_DA_DEPT.c_parent_id
  is '������id';
comment on column SXDXSJ.T_DA_DEPT.c_rem
  is '��������';
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
  is '���Ž�ɫ��ϵ��';
comment on column SXDXSJ.T_DA_DEPT_ROLE.c_role_id
  is '��ɫid';
comment on column SXDXSJ.T_DA_DEPT_ROLE.c_dept_id
  is '����id';
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
  is '�˵���';
comment on column SXDXSJ.T_DA_MENU.c_menu_id
  is '�˵�id';
comment on column SXDXSJ.T_DA_MENU.c_parent_id
  is '���˵�id';
comment on column SXDXSJ.T_DA_MENU.c_id_path
  is 'id��·��';
comment on column SXDXSJ.T_DA_MENU.c_name
  is '�˵�����';
comment on column SXDXSJ.T_DA_MENU.c_name_path
  is '�˵�����·��';
comment on column SXDXSJ.T_DA_MENU.c_icon
  is '�˵�ͼ��';
comment on column SXDXSJ.T_DA_MENU.c_url
  is '�˵�����';
comment on column SXDXSJ.T_DA_MENU.c_order_num
  is '�˵��������';
comment on column SXDXSJ.T_DA_MENU.c_rem
  is '�˵�����';
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
  is '��ɫ��';
comment on column SXDXSJ.T_DA_ROLE.c_role_id
  is '��ɫid';
comment on column SXDXSJ.T_DA_ROLE.c_role_name
  is '��ɫ����';
comment on column SXDXSJ.T_DA_ROLE.c_auth_name
  is '��ɫȨ������ �磨ROLE_ADMIN��';
comment on column SXDXSJ.T_DA_ROLE.c_rem
  is '��ɫ����';
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
  is '��ɫ�Ͳ˵���ϵ��';
comment on column SXDXSJ.T_DA_ROLE_MENU.c_role_id
  is '��ɫid';
comment on column SXDXSJ.T_DA_ROLE_MENU.c_menu_id
  is '�˵�id';
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
  is '�û���¼�˺�';
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
  is '��ɫ���û���ϵ��';
comment on column SXDXSJ.T_DA_ROLE_USER.c_role_id
  is '��ɫid';
comment on column SXDXSJ.T_DA_ROLE_USER.c_user_account
  is '�û���';
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
  is '�����ر�׼�����գ�
����ʡ����Ϣ��';
comment on column SXDXSJ.T_LOCATION_INFO.c_province
  is 'ʡ';
comment on column SXDXSJ.T_LOCATION_INFO.c_city
  is '��';
comment on column SXDXSJ.T_LOCATION_INFO.c_zone
  is '����';
comment on column SXDXSJ.T_LOCATION_INFO.c_mobile
  is '�ֻ��Ŷ�';
comment on column SXDXSJ.T_LOCATION_INFO.c_active
  is '�Ƿ����';
comment on column SXDXSJ.T_LOCATION_INFO.c_creator
  is '������';
comment on column SXDXSJ.T_LOCATION_INFO.c_create_time
  is '��������';
comment on column SXDXSJ.T_LOCATION_INFO.c_updater
  is '�޸���';
comment on column SXDXSJ.T_LOCATION_INFO.c_update_time
  is '�޸�����';
comment on column SXDXSJ.T_LOCATION_INFO.c_province_standard
  is '��׼����ʡ��';
comment on column SXDXSJ.T_LOCATION_INFO.c_city_standard
  is '��׼�����У�';
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
  is '�ֻ��Ŷζ�Ӧ����ʡ�б�';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_province
  is 'ʡ';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_city
  is '��';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_zone
  is '����';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_mobile
  is '�ֻ��Ŷ�';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_active
  is '�Ƿ����';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_creator
  is '������';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_create_time
  is '��������';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_updater
  is '�޸���';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_update_time
  is '�޸�����';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_province_standard
  is '��׼����ʡ��';
comment on column SXDXSJ.T_MOBILE_LOCATION.c_city_standard
  is '��׼�����У�';
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
  is '������Ϣ������ȡ�ã�(�����������)';
comment on column SXDXSJ.T_PREINS.c_id
  is '��������';
comment on column SXDXSJ.T_PREINS.c_data_type
  is '��������

';
comment on column SXDXSJ.T_PREINS.c_status
  is '����״̬
���ݴ�ɹ�����
���ݴ�ɹ�����ʧ�ܡ���
������ɹ����Ͷ���ʧ�ܡ���
�����Ͷ��ųɹ���
';
comment on column SXDXSJ.T_PREINS.c_sale_orgcode
  is '���ۻ�������';
comment on column SXDXSJ.T_PREINS.c_sale_org
  is '�Խ������������ۻ���Ϊ���������ġ���
���ֹ�˾��
';
comment on column SXDXSJ.T_PREINS.c_preins_orgcode
  is '���ջ�������';
comment on column SXDXSJ.T_PREINS.c_preins_org
  is '���ջ���
�Խ������������ջ���Ϊ�������ģ��磺�Ϻ��������ġ��人�������ġ����������ڡ��㶫������¼�룩';
comment on column SXDXSJ.T_PREINS.c_import_time
  is '����ʱ��';
comment on column SXDXSJ.T_PREINS.c_sale_situationcode
  is '�������
';
comment on column SXDXSJ.T_PREINS.c_sale_time
  is '����ʱ��';
comment on column SXDXSJ.T_PREINS.c_dial_time
  is '����ʱ��';
comment on column SXDXSJ.T_PREINS.c_assigndial_time
  is '���䲦��ʱ��';
comment on column SXDXSJ.T_PREINS.c_callresult_code
  is 'Ӫ��������״̬��';
comment on column SXDXSJ.T_PREINS.c_dial_orgcode
  is '�����������';
comment on column SXDXSJ.T_PREINS.c_dial_org
  is '�������
';
comment on column SXDXSJ.T_PREINS.c_preins_company_code
  is '����ҵ������ֹ�˾����';
comment on column SXDXSJ.T_PREINS.c_preins_company
  is '����ҵ������ֹ�˾
';
comment on column SXDXSJ.T_PREINS.c_middle_company_code
  is '��֧��˾����';
comment on column SXDXSJ.T_PREINS.c_middle_company
  is '��֧��˾';
comment on column SXDXSJ.T_PREINS.c_effort_time
  is '��Ч����
';
comment on column SXDXSJ.T_PREINS.c_cus_name
  is '�ͻ�����';
comment on column SXDXSJ.T_PREINS.c_cus_provincecode
  is 'ʡ����';
comment on column SXDXSJ.T_PREINS.c_cus_province
  is '�ͻ�����ʡ��
';
comment on column SXDXSJ.T_PREINS.c_cus_citycode
  is '�д���';
comment on column SXDXSJ.T_PREINS.c_cus_city
  is '�ͻ����ڳ���
';
comment on column SXDXSJ.T_PREINS.c_cus_zone
  is '�ͻ�������/��
';
comment on column SXDXSJ.T_PREINS.c_cus_gender
  is '�Ա�:
01:��
02:Ů';
comment on column SXDXSJ.T_PREINS.c_cus_birtheday
  is '����';
comment on column SXDXSJ.T_PREINS.c_cus_age_code
  is '�ͻ������';
comment on column SXDXSJ.T_PREINS.c_cus_mobile_no
  is '�ͻ��ֻ�����';
comment on column SXDXSJ.T_PREINS.c_cus_card_id
  is '�ͻ����֤����';
comment on column SXDXSJ.T_PREINS.c_sale_source
  is '������Դ����ѡ��
';
comment on column SXDXSJ.T_PREINS.c_cus_other_phone
  is '��������';
comment on column SXDXSJ.T_PREINS.c_preins_code
  is '���մ���
';
comment on column SXDXSJ.T_PREINS.c_cus_career
  is 'ְҵ';
comment on column SXDXSJ.T_PREINS.c_cus_s_insurance
  is '�Ƿ����籣��
01����
02����';
comment on column SXDXSJ.T_PREINS.c_cus_b_insurance
  is '�Ƿ�����ҵ��
01����
02����';
comment on column SXDXSJ.T_PREINS.c_cus_i_insurance
  is '����Ȥ������';
comment on column SXDXSJ.T_PREINS.c_cus_usual_bank
  is '��������';
comment on column SXDXSJ.T_PREINS.c_cus_married
  is '����״��
';
comment on column SXDXSJ.T_PREINS.c_usual_vehicle
  is '���ý�ͨ����';
comment on column SXDXSJ.T_PREINS.c_cus_else_question
  is '��������';
comment on column SXDXSJ.T_PREINS.c_creator
  is '������
';
comment on column SXDXSJ.T_PREINS.c_create_time
  is '����ʱ��';
comment on column SXDXSJ.T_PREINS.c_sms_send_time
  is '���Ͷ���ʱ��';
comment on column SXDXSJ.T_PREINS.c_insurence_start_date
  is '��������
';
comment on column SXDXSJ.T_PREINS.c_policy_id
  is '������
';
comment on column SXDXSJ.T_PREINS.c_batch_code
  is '���κ�';
comment on column SXDXSJ.T_PREINS.c_update_time
  is '����ʱ��';
comment on column SXDXSJ.T_PREINS.name_status
  is '�����Ƿ���ȷ״̬';
comment on column SXDXSJ.T_PREINS.birth_staus
  is '�����Ƿ���ȷ״̬';
comment on column SXDXSJ.T_PREINS.bar_flag
  is '������־';
comment on column SXDXSJ.T_PREINS.import_time
  is '����ʱ��(��ά����)';
comment on column SXDXSJ.T_PREINS.dial_time
  is '����ʱ��(��ά����)';
comment on column SXDXSJ.T_PREINS.c_family_phone
  is '��ͥ�绰';
comment on column SXDXSJ.T_PREINS.c_office_phone
  is '�칫�绰';
comment on column SXDXSJ.T_PREINS.c_passed_phone
  is '��ͨ�绰';
comment on column SXDXSJ.T_PREINS.c_active_id
  is '�����ID';
comment on column SXDXSJ.T_PREINS.c_dial_timelength
  is 'ͨ��ʱ��';
comment on column SXDXSJ.T_PREINS.c_sale_dialtime
  is '����Ӫ�����ݲ���ʱ��';
comment on column SXDXSJ.T_PREINS.c_phone_invalid_flag
  is '�绰��Ч���ݱ�־
00���绰��Ч���ݣ�01���绰��Ч����';
comment on column SXDXSJ.T_PREINS.c_name_invalid_flag
  is '������Ч���ݱ�־
00��������Ч���ݡ�01��������Ч����';
comment on column SXDXSJ.T_PREINS.c_sameorg_repeat_flag
  is 'ͬ�����ظ����ݱ�־
00��ͬ�������ݷ��ظ���01��ͬ�����ظ����ݡ�02��ͬ�����ظ�_����ʷ�����ظ�';
comment on column SXDXSJ.T_PREINS.c_othertype_repeat_flag
  is '�����������ظ����ݱ�־
00�������пͻ����ظ�,01�������пͻ��ظ�';
comment on column SXDXSJ.T_PREINS.c_preins_repeat_flag
  is '�����ظ����ݱ�־
00���������������ظ����ݡ�01�������������ظ�����';
comment on column SXDXSJ.T_PREINS.c_standard_suc_flag
  is '�����ر�׼�����ݱ�־
00�������ر�׼���ɹ���01�������ر�׼��ʧ��_�ֹ�����02�������ر�׼��ʧ��';
comment on column SXDXSJ.T_PREINS.c_card_id_valid_flag
  is '���֤��Ч���ݱ�־
00�����֤������Ч����,01�����֤������Ч����';
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
  is '������Ϣ������ȡ�ã�(�����������)';
comment on column SXDXSJ.T_PREINS_OLD.c_id
  is '��������';
comment on column SXDXSJ.T_PREINS_OLD.c_data_type
  is '��������

';
comment on column SXDXSJ.T_PREINS_OLD.c_status
  is '����״̬
���ݴ�ɹ�����
���ݴ�ɹ�����ʧ�ܡ���
������ɹ����Ͷ���ʧ�ܡ���
�����Ͷ��ųɹ���
';
comment on column SXDXSJ.T_PREINS_OLD.c_sale_orgcode
  is '���ۻ�������';
comment on column SXDXSJ.T_PREINS_OLD.c_sale_org
  is '�Խ������������ۻ���Ϊ���������ġ���
���ֹ�˾��
';
comment on column SXDXSJ.T_PREINS_OLD.c_preins_orgcode
  is '���ջ�������';
comment on column SXDXSJ.T_PREINS_OLD.c_preins_org
  is '���ջ���
�Խ������������ջ���Ϊ�������ģ��磺�Ϻ��������ġ��人�������ġ����������ڡ��㶫������¼�룩';
comment on column SXDXSJ.T_PREINS_OLD.c_import_time
  is '����ʱ��';
comment on column SXDXSJ.T_PREINS_OLD.c_sale_situationcode
  is '�������
';
comment on column SXDXSJ.T_PREINS_OLD.c_sale_time
  is '����ʱ��';
comment on column SXDXSJ.T_PREINS_OLD.c_dial_time
  is '����ʱ��';
comment on column SXDXSJ.T_PREINS_OLD.c_assigndial_time
  is '���䲦��ʱ��';
comment on column SXDXSJ.T_PREINS_OLD.c_callresult_code
  is 'Ӫ��������״̬��';
comment on column SXDXSJ.T_PREINS_OLD.c_dial_orgcode
  is '�����������';
comment on column SXDXSJ.T_PREINS_OLD.c_dial_org
  is '�������
';
comment on column SXDXSJ.T_PREINS_OLD.c_preins_company_code
  is '����ҵ������ֹ�˾����';
comment on column SXDXSJ.T_PREINS_OLD.c_preins_company
  is '����ҵ������ֹ�˾
';
comment on column SXDXSJ.T_PREINS_OLD.c_middle_company_code
  is '��֧��˾����';
comment on column SXDXSJ.T_PREINS_OLD.c_middle_company
  is '��֧��˾';
comment on column SXDXSJ.T_PREINS_OLD.c_effort_time
  is '��Ч����
';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_name
  is '�ͻ�����';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_provincecode
  is 'ʡ����';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_province
  is '�ͻ�����ʡ��
';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_citycode
  is '�д���';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_city
  is '�ͻ����ڳ���
';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_zone
  is '�ͻ�������/��
';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_gender
  is '�Ա�:
01:��
02:Ů';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_birtheday
  is '����';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_age_code
  is '�ͻ������';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_mobile_no
  is '�ͻ��ֻ�����';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_card_id
  is '�ͻ����֤����';
comment on column SXDXSJ.T_PREINS_OLD.c_sale_source
  is '������Դ����ѡ��
';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_other_phone
  is '��������';
comment on column SXDXSJ.T_PREINS_OLD.c_preins_code
  is '���մ���
';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_career
  is 'ְҵ';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_s_insurance
  is '�Ƿ����籣��
01����
02����';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_b_insurance
  is '�Ƿ�����ҵ��
01����
02����';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_i_insurance
  is '����Ȥ������';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_usual_bank
  is '��������';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_married
  is '����״��
';
comment on column SXDXSJ.T_PREINS_OLD.c_usual_vehicle
  is '���ý�ͨ����';
comment on column SXDXSJ.T_PREINS_OLD.c_cus_else_question
  is '��������';
comment on column SXDXSJ.T_PREINS_OLD.c_creator
  is '������
';
comment on column SXDXSJ.T_PREINS_OLD.c_create_time
  is '����ʱ��';
comment on column SXDXSJ.T_PREINS_OLD.c_sms_send_time
  is '���Ͷ���ʱ��';
comment on column SXDXSJ.T_PREINS_OLD.c_insurence_start_date
  is '��������
';
comment on column SXDXSJ.T_PREINS_OLD.c_policy_id
  is '������
';
comment on column SXDXSJ.T_PREINS_OLD.c_batch_code
  is '���κ�';
comment on column SXDXSJ.T_PREINS_OLD.c_update_time
  is '����ʱ��';
comment on column SXDXSJ.T_PREINS_OLD.name_status
  is '�����Ƿ���ȷ״̬';
comment on column SXDXSJ.T_PREINS_OLD.birth_staus
  is '�����Ƿ���ȷ״̬';
comment on column SXDXSJ.T_PREINS_OLD.bar_flag
  is '������־';
comment on column SXDXSJ.T_PREINS_OLD.import_time
  is '����ʱ��(��ά����)';
comment on column SXDXSJ.T_PREINS_OLD.dial_time
  is '����ʱ��(��ά����)';
comment on column SXDXSJ.T_PREINS_OLD.c_family_phone
  is '��ͥ�绰';
comment on column SXDXSJ.T_PREINS_OLD.c_office_phone
  is '�칫�绰';
comment on column SXDXSJ.T_PREINS_OLD.c_passed_phone
  is '��ͨ�绰';
comment on column SXDXSJ.T_PREINS_OLD.c_active_id
  is '�����ID';
comment on column SXDXSJ.T_PREINS_OLD.c_dial_timelength
  is 'ͨ��ʱ��';
comment on column SXDXSJ.T_PREINS_OLD.c_sale_dialtime
  is '����Ӫ�����ݲ���ʱ��';
comment on column SXDXSJ.T_PREINS_OLD.c_phone_invalid_flag
  is '�绰��Ч���ݱ�־
00���绰��Ч���ݣ�01���绰��Ч����';
comment on column SXDXSJ.T_PREINS_OLD.c_name_invalid_flag
  is '������Ч���ݱ�־
00��������Ч���ݡ�01��������Ч����';
comment on column SXDXSJ.T_PREINS_OLD.c_sameorg_repeat_flag
  is 'ͬ�����ظ����ݱ�־
00��ͬ�������ݷ��ظ���01��ͬ�����ظ����ݡ�02��ͬ�����ظ�_����ʷ�����ظ�';
comment on column SXDXSJ.T_PREINS_OLD.c_othertype_repeat_flag
  is '�����������ظ����ݱ�־
00�������пͻ����ظ�,01�������пͻ��ظ�';
comment on column SXDXSJ.T_PREINS_OLD.c_preins_repeat_flag
  is '�����ظ����ݱ�־
00���������������ظ����ݡ�01�������������ظ�����';
comment on column SXDXSJ.T_PREINS_OLD.c_standard_suc_flag
  is '�����ر�׼�����ݱ�־
00�������ر�׼���ɹ���01�������ر�׼��ʧ��_�ֹ�����02�������ر�׼��ʧ��';
comment on column SXDXSJ.T_PREINS_OLD.c_card_id_valid_flag
  is '���֤��Ч���ݱ�־
00�����֤������Ч����,01�����֤������Ч����';
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
  is '������Ϣ������ȡ�ã�(�����������)';
comment on column SXDXSJ.T_PREINS_TMP.c_id
  is '��������';
comment on column SXDXSJ.T_PREINS_TMP.c_data_type
  is '��������

';
comment on column SXDXSJ.T_PREINS_TMP.c_status
  is '����״̬
���ݴ�ɹ�����
���ݴ�ɹ�����ʧ�ܡ���
������ɹ����Ͷ���ʧ�ܡ���
�����Ͷ��ųɹ���
';
comment on column SXDXSJ.T_PREINS_TMP.c_sale_orgcode
  is '���ۻ�������';
comment on column SXDXSJ.T_PREINS_TMP.c_sale_org
  is '�Խ������������ۻ���Ϊ���������ġ���
���ֹ�˾��
';
comment on column SXDXSJ.T_PREINS_TMP.c_preins_orgcode
  is '���ջ�������';
comment on column SXDXSJ.T_PREINS_TMP.c_preins_org
  is '���ջ���
�Խ������������ջ���Ϊ�������ģ��磺�Ϻ��������ġ��人�������ġ����������ڡ��㶫������¼�룩';
comment on column SXDXSJ.T_PREINS_TMP.c_import_time
  is '����ʱ��';
comment on column SXDXSJ.T_PREINS_TMP.c_sale_situationcode
  is '�������
';
comment on column SXDXSJ.T_PREINS_TMP.c_sale_time
  is '����ʱ��';
comment on column SXDXSJ.T_PREINS_TMP.c_dial_time
  is '����ʱ��';
comment on column SXDXSJ.T_PREINS_TMP.c_assigndial_time
  is '���䲦��ʱ��';
comment on column SXDXSJ.T_PREINS_TMP.c_callresult_code
  is 'Ӫ��������״̬��';
comment on column SXDXSJ.T_PREINS_TMP.c_dial_orgcode
  is '�����������';
comment on column SXDXSJ.T_PREINS_TMP.c_dial_org
  is '�������
';
comment on column SXDXSJ.T_PREINS_TMP.c_preins_company_code
  is '����ҵ������ֹ�˾����';
comment on column SXDXSJ.T_PREINS_TMP.c_preins_company
  is '����ҵ������ֹ�˾
';
comment on column SXDXSJ.T_PREINS_TMP.c_middle_company_code
  is '��֧��˾����';
comment on column SXDXSJ.T_PREINS_TMP.c_middle_company
  is '��֧��˾';
comment on column SXDXSJ.T_PREINS_TMP.c_effort_time
  is '��Ч����
';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_name
  is '�ͻ�����';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_provincecode
  is 'ʡ����';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_province
  is '�ͻ�����ʡ��
';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_citycode
  is '�д���';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_city
  is '�ͻ����ڳ���
';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_zone
  is '�ͻ�������/��
';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_gender
  is '�Ա�:
01:��
02:Ů';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_birtheday
  is '����';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_age_code
  is '�ͻ������';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_mobile_no
  is '�ͻ��ֻ�����';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_card_id
  is '�ͻ����֤����';
comment on column SXDXSJ.T_PREINS_TMP.c_sale_source
  is '������Դ����ѡ��
';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_other_phone
  is '��������';
comment on column SXDXSJ.T_PREINS_TMP.c_preins_code
  is '���մ���
';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_career
  is 'ְҵ';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_s_insurance
  is '�Ƿ����籣��
01����
02����';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_b_insurance
  is '�Ƿ�����ҵ��
01����
02����';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_i_insurance
  is '����Ȥ������';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_usual_bank
  is '��������';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_married
  is '����״��
';
comment on column SXDXSJ.T_PREINS_TMP.c_usual_vehicle
  is '���ý�ͨ����';
comment on column SXDXSJ.T_PREINS_TMP.c_cus_else_question
  is '��������';
comment on column SXDXSJ.T_PREINS_TMP.c_creator
  is '������
';
comment on column SXDXSJ.T_PREINS_TMP.c_create_time
  is '����ʱ��';
comment on column SXDXSJ.T_PREINS_TMP.c_sms_send_time
  is '���Ͷ���ʱ��';
comment on column SXDXSJ.T_PREINS_TMP.c_insurence_start_date
  is '��������
';
comment on column SXDXSJ.T_PREINS_TMP.c_policy_id
  is '������
';
comment on column SXDXSJ.T_PREINS_TMP.c_batch_code
  is '���κ�';
comment on column SXDXSJ.T_PREINS_TMP.c_update_time
  is '����ʱ��';
comment on column SXDXSJ.T_PREINS_TMP.name_status
  is '�����Ƿ���ȷ״̬';
comment on column SXDXSJ.T_PREINS_TMP.birth_staus
  is '�����Ƿ���ȷ״̬';
comment on column SXDXSJ.T_PREINS_TMP.bar_flag
  is '������־';
comment on column SXDXSJ.T_PREINS_TMP.import_time
  is '����ʱ��(��ά����)';
comment on column SXDXSJ.T_PREINS_TMP.dial_time
  is '����ʱ��(��ά����)';
comment on column SXDXSJ.T_PREINS_TMP.c_family_phone
  is '��ͥ�绰';
comment on column SXDXSJ.T_PREINS_TMP.c_office_phone
  is '�칫�绰';
comment on column SXDXSJ.T_PREINS_TMP.c_passed_phone
  is '��ͨ�绰';
comment on column SXDXSJ.T_PREINS_TMP.c_active_id
  is '�����ID';
comment on column SXDXSJ.T_PREINS_TMP.c_dial_timelength
  is 'ͨ��ʱ��';
comment on column SXDXSJ.T_PREINS_TMP.c_sale_dialtime
  is '����Ӫ�����ݲ���ʱ��';
comment on column SXDXSJ.T_PREINS_TMP.c_phone_invalid_flag
  is '�绰��Ч���ݱ�־
00���绰��Ч���ݣ�01���绰��Ч����';
comment on column SXDXSJ.T_PREINS_TMP.c_name_invalid_flag
  is '������Ч���ݱ�־
00��������Ч���ݡ�01��������Ч����';
comment on column SXDXSJ.T_PREINS_TMP.c_sameorg_repeat_flag
  is 'ͬ�����ظ����ݱ�־
00��ͬ�������ݷ��ظ���01��ͬ�����ظ����ݡ�02��ͬ�����ظ�_����ʷ�����ظ�';
comment on column SXDXSJ.T_PREINS_TMP.c_othertype_repeat_flag
  is '�����������ظ����ݱ�־
00�������пͻ����ظ�,01�������пͻ��ظ�';
comment on column SXDXSJ.T_PREINS_TMP.c_preins_repeat_flag
  is '�����ظ����ݱ�־
00���������������ظ����ݡ�01�������������ظ�����';
comment on column SXDXSJ.T_PREINS_TMP.c_standard_suc_flag
  is '�����ر�׼�����ݱ�־
00�������ر�׼���ɹ���01�������ر�׼��ʧ��_�ֹ�����02�������ر�׼��ʧ��';
comment on column SXDXSJ.T_PREINS_TMP.c_card_id_valid_flag
  is '���֤��Ч���ݱ�־
00�����֤������Ч����,01�����֤������Ч����';
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
  is '������˵�����';
comment on column SXDXSJ.T_REPEAT_DATA_TYPE.c_date_remark
  is '��������˵��';
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
  is 'ͳ��ָ��������Ϣ��';
comment on column SXDXSJ.T_STATISTIC_CFG.flag_id
  is '��ʶID';
comment on column SXDXSJ.T_STATISTIC_CFG.flag_sql
  is '����SQL�ű�';
comment on column SXDXSJ.T_STATISTIC_CFG.flag_desc
  is 'ָ������';
comment on column SXDXSJ.T_STATISTIC_CFG.flag_active
  is '�Ƿ���Ч';
comment on column SXDXSJ.T_STATISTIC_CFG.flag_remark
  is '��ע';
comment on column SXDXSJ.T_STATISTIC_CFG.flag_create
  is '����ʱ��';
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
  is '��¼�������û���¼��ʷ��Ϣ';
grant select on SXDXSJ.USER_HISTORY to DXSJDBEXTR;
grant select, insert, update, delete on SXDXSJ.USER_HISTORY to SXDXSJAPP;
grant select on SXDXSJ.USER_HISTORY to SXDXSJDEV;
grant select, insert, update, delete on SXDXSJ.USER_HISTORY to SXDXSJMOD;


spool off
