--------------------------------------------------
-- Export file for user CPIC_SXDX               --
-- Created by c_zhuwenfei on 2013-3-8, 17:02:00 --
--------------------------------------------------

spool ulink.log

prompt
prompt Creating table ACCOUNT_20111101_20120315_FULL
prompt =============================================
prompt
create table CPIC_SXDX.ACCOUNT_20111101_20120315_FULL
(
  sno        NUMBER(20),
  typeid     NUMBER(7) not null,
  account_id NUMBER(20),
  acco_no    VARCHAR2(120) not null,
  usetype    CHAR(1) not null,
  regdate    DATE,
  open_date  DATE,
  status     CHAR(1),
  s_date     DATE,
  s_reason   CHAR(2),
  currency   CHAR(3) not null,
  bankcode   VARCHAR2(20) not null,
  bankname   VARCHAR2(80),
  policyno   VARCHAR2(20) not null,
  ownerid    VARCHAR2(20) not null,
  oper_no    VARCHAR2(20),
  begtime    NUMBER(11) not null,
  endtime    NUMBER(11) not null,
  branch     CHAR(14) not null,
  etl_time   DATE not null,
  src_sys    VARCHAR2(20) not null
)
nologging;

prompt
prompt Creating table ACCOUNT_POLICYNO_QUE
prompt ===================================
prompt
create table CPIC_SXDX.ACCOUNT_POLICYNO_QUE
(
  policyno VARCHAR2(40)
)
nologging;

prompt
prompt Creating table ADDRESS_111226
prompt =============================
prompt
create table CPIC_SXDX.ADDRESS_111226
(
  sno              NUMBER(20),
  typeid           NUMBER(7) not null,
  country          VARCHAR2(20),
  city             VARCHAR2(30),
  region           VARCHAR2(60),
  subregion        VARCHAR2(80),
  street           VARCHAR2(20),
  subaddr          VARCHAR2(500),
  zip              VARCHAR2(20),
  addr             VARCHAR2(500) not null,
  usage            CHAR(1) not null,
  person_id        NUMBER(20),
  pid              VARCHAR2(40) not null,
  idtype           CHAR(2) not null,
  purpose          CHAR(1) not null,
  seq              VARCHAR2(10) not null,
  source_person_id VARCHAR2(20) not null,
  id15             VARCHAR2(40),
  begtime          NUMBER(11) not null,
  endtime          NUMBER(11) not null,
  branch           CHAR(14) not null,
  etl_time         DATE not null,
  src_sys          VARCHAR2(20) not null
)
;

prompt
prompt Creating table ADDRESS_ID_QUE
prompt =============================
prompt
create table CPIC_SXDX.ADDRESS_ID_QUE
(
  apid VARCHAR2(80)
)
;

prompt
prompt Creating table ADDRESS_SOURCE_ID
prompt ================================
prompt
create table CPIC_SXDX.ADDRESS_SOURCE_ID
(
  source_id VARCHAR2(20)
)
;

prompt
prompt Creating table ADDRESS_SOURCE_ID_201203
prompt =======================================
prompt
create table CPIC_SXDX.ADDRESS_SOURCE_ID_201203
(
  source_id VARCHAR2(20)
)
;

prompt
prompt Creating table ADDRESS_SPID_QUE
prompt ===============================
prompt
create table CPIC_SXDX.ADDRESS_SPID_QUE
(
  owner_source_id VARCHAR2(40)
)
;

prompt
prompt Creating table ADDRESS_TO_20111226_FULL
prompt =======================================
prompt
create table CPIC_SXDX.ADDRESS_TO_20111226_FULL
(
  sno              NUMBER(20),
  typeid           NUMBER(7) not null,
  country          VARCHAR2(20),
  city             VARCHAR2(30),
  region           VARCHAR2(60),
  subregion        VARCHAR2(80),
  street           VARCHAR2(20),
  subaddr          VARCHAR2(500),
  zip              VARCHAR2(20),
  addr             VARCHAR2(500) not null,
  usage            CHAR(1) not null,
  person_id        NUMBER(20),
  pid              VARCHAR2(40) not null,
  idtype           CHAR(2) not null,
  purpose          CHAR(1) not null,
  seq              VARCHAR2(10) not null,
  source_person_id VARCHAR2(20) not null,
  id15             VARCHAR2(40),
  begtime          NUMBER(11) not null,
  endtime          NUMBER(11) not null,
  branch           CHAR(14) not null,
  etl_time         DATE not null,
  src_sys          VARCHAR2(20) not null
)
nologging;

prompt
prompt Creating table APP_NB
prompt =====================
prompt
create table CPIC_SXDX.APP_NB
(
  sno                   NUMBER(20),
  typeid                NUMBER(7),
  status                CHAR(2),
  procdate              DATE,
  abstr                 VARCHAR2(500),
  appdate               DATE,
  appno                 VARCHAR2(40),
  con_id                NUMBER(20),
  policyno              VARCHAR2(20),
  classcode             CHAR(8),
  opdate                DATE,
  operid                NUMBER(20),
  operno                VARCHAR2(20),
  oper_role             VARCHAR2(20),
  pieces                NUMBER(20,6),
  yearnum               NUMBER(10),
  saleattr              CHAR(2),
  agt_rp_id             NUMBER(20),
  agt_rp_type           NUMBER(7),
  agt_no                VARCHAR2(20),
  owner_rp_id           NUMBER(20),
  owner_rp_type         NUMBER(7),
  owner_id              VARCHAR2(40),
  insured_rp_id         NUMBER(20),
  insured_rp_type       NUMBER(7),
  insured_id            VARCHAR2(40),
  owner_insured_rlship  CHAR(3),
  rider_ind             CHAR(1),
  prem_start_date       DATE,
  prem_end_date         DATE,
  rec_postal_code       VARCHAR2(20),
  rec_addr              VARCHAR2(500),
  rec_tel               VARCHAR2(30),
  prem_frq              CHAR(2),
  prem_mthd             CHAR(1),
  std_piece_prem        NUMBER(20,6),
  std_add_piece_prem    NUMBER(10,2),
  nonstd_add_piece_prem NUMBER(10,2),
  agt_phone             VARCHAR2(30),
  sale_type             CHAR(2),
  sale_prod_code        VARCHAR2(8),
  app_age               NUMBER(3),
  app_confirm_no        VARCHAR2(20),
  app_terminal_id       VARCHAR2(20),
  cross_sale_ind        VARCHAR2(1),
  sub_sale_type         VARCHAR2(2),
  cstmzd_rcmd_no        VARCHAR2(30),
  app_ip_date           DATE,
  begtime               NUMBER(11),
  endtime               NUMBER(11),
  branch                CHAR(14),
  etl_time              DATE,
  src_sys               VARCHAR2(20)
)
;

prompt
prompt Creating table CUST_LIST_RSLT
prompt =============================
prompt
create table CPIC_SXDX.CUST_LIST_RSLT
(
  cus_id                         NUMBER(19) not null,
  customer_name                  VARCHAR2(120),
  batch_code                     VARCHAR2(128),
  batch_name                     VARCHAR2(128),
  center_id                      NUMBER(19),
  task_code                      VARCHAR2(20),
  status                         NUMBER(19) default 0,
  issue                          VARCHAR2(6),
  code_type                      VARCHAR2(15),
  customer_id                    CHAR(18) not null,
  gender_code                    NUMBER(3),
  birthday                       DATE,
  age                            NUMBER(3),
  job_name                       VARCHAR2(120),
  phone1                         VARCHAR2(30),
  phone2                         VARCHAR2(30),
  phone3                         VARCHAR2(30),
  family_phone                   VARCHAR2(30),
  import_time                    DATE,
  create_by                      VARCHAR2(25),
  update_by                      VARCHAR2(25),
  office_phone                   VARCHAR2(30),
  phone_flage                    VARCHAR2(30),
  address                        VARCHAR2(1200),
  postcode                       NUMBER(7),
  car_type                       VARCHAR2(120),
  car_price                      NUMBER(12,2),
  use_property                   VARCHAR2(120),
  housing_purchase_time          DATE,
  housing_purchase_price         NUMBER(14,2),
  construction_area              NUMBER(12,2),
  housing_use                    VARCHAR2(120),
  property_types                 VARCHAR2(120),
  interest_types                 VARCHAR2(120),
  home_ownership_status          VARCHAR2(120),
  other_company_financial_assets VARCHAR2(120),
  province                       VARCHAR2(120),
  city                           VARCHAR2(120),
  county                         VARCHAR2(120),
  delivery_province              VARCHAR2(120),
  delivery_city                  VARCHAR2(120),
  delivery_county                VARCHAR2(120),
  delivery_address               VARCHAR2(1200),
  delivery_postcode              NUMBER(6),
  is_sms                         VARCHAR2(6),
  has_child                      VARCHAR2(30),
  has_house                      VARCHAR2(30),
  travel_mode                    VARCHAR2(120),
  isvip                          VARCHAR2(30),
  account_no                     CHAR(40),
  account_name                   VARCHAR2(120),
  bank_name                      VARCHAR2(120),
  marital_status                 VARCHAR2(30),
  education_level                VARCHAR2(40),
  income                         NUMBER(12,2),
  career_level                   VARCHAR2(30),
  company_address                VARCHAR2(508),
  emergency_contact_phone        VARCHAR2(30),
  emergency_contact_name         VARCHAR2(120),
  email                          VARCHAR2(40),
  add_type                       VARCHAR2(120),
  remark1                        VARCHAR2(120),
  remark2                        VARCHAR2(120),
  remark3                        VARCHAR2(120),
  remark4                        VARCHAR2(120),
  products                       VARCHAR2(120),
  reclined                       VARCHAR2(120),
  contract_phone                 VARCHAR2(30),
  relationship                   VARCHAR2(10),
  org_id                         NUMBER(10),
  fax                            VARCHAR2(30),
  introducer                     VARCHAR2(120),
  introduce_time                 DATE,
  introducer_relationship        VARCHAR2(10),
  has_car                        VARCHAR2(30),
  customer_flg                   VARCHAR2(120),
  obcom_id                       VARCHAR2(25),
  row_num                        VARCHAR2(6)
)
;
comment on table CPIC_SXDX.CUST_LIST_RSLT
  is '�ͻ���ʱ��';
comment on column CPIC_SXDX.CUST_LIST_RSLT.cus_id
  is '�ͻ�ID';
comment on column CPIC_SXDX.CUST_LIST_RSLT.customer_name
  is '�ͻ�����';
comment on column CPIC_SXDX.CUST_LIST_RSLT.batch_code
  is '���α��';
comment on column CPIC_SXDX.CUST_LIST_RSLT.batch_name
  is '��������';
comment on column CPIC_SXDX.CUST_LIST_RSLT.center_id
  is '��������ID';
comment on column CPIC_SXDX.CUST_LIST_RSLT.task_code
  is '����ID';
comment on column CPIC_SXDX.CUST_LIST_RSLT.status
  is '�������ɱ�־  1��ʾ�����ɣ�0��ʾδ����';
comment on column CPIC_SXDX.CUST_LIST_RSLT.issue
  is '�·���ʶ';
comment on column CPIC_SXDX.CUST_LIST_RSLT.code_type
  is '֤������';
comment on column CPIC_SXDX.CUST_LIST_RSLT.customer_id
  is '֤������';
comment on column CPIC_SXDX.CUST_LIST_RSLT.gender_code
  is '�Ա�(�Ա�:

01:��

02:Ů)';
comment on column CPIC_SXDX.CUST_LIST_RSLT.birthday
  is '��������';
comment on column CPIC_SXDX.CUST_LIST_RSLT.age
  is '����';
comment on column CPIC_SXDX.CUST_LIST_RSLT.job_name
  is 'ְҵ';
comment on column CPIC_SXDX.CUST_LIST_RSLT.phone1
  is '�ƶ��绰1';
comment on column CPIC_SXDX.CUST_LIST_RSLT.phone2
  is '�ƶ��绰2';
comment on column CPIC_SXDX.CUST_LIST_RSLT.phone3
  is '�ƶ��绰3';
comment on column CPIC_SXDX.CUST_LIST_RSLT.family_phone
  is '��ͥ�绰';
comment on column CPIC_SXDX.CUST_LIST_RSLT.import_time
  is '����ʱ��';
comment on column CPIC_SXDX.CUST_LIST_RSLT.create_by
  is '������';
comment on column CPIC_SXDX.CUST_LIST_RSLT.update_by
  is '�޸���';
comment on column CPIC_SXDX.CUST_LIST_RSLT.office_phone
  is '��λ�绰';
comment on column CPIC_SXDX.CUST_LIST_RSLT.phone_flage
  is '���õ绰��־';
comment on column CPIC_SXDX.CUST_LIST_RSLT.address
  is '�̶���ַ(��ϵ��ַ)';
comment on column CPIC_SXDX.CUST_LIST_RSLT.postcode
  is '�ʱ�(��ϵ��ַ)';
comment on column CPIC_SXDX.CUST_LIST_RSLT.car_type
  is '��������';
comment on column CPIC_SXDX.CUST_LIST_RSLT.car_price
  is '����';
comment on column CPIC_SXDX.CUST_LIST_RSLT.use_property
  is 'ʹ������';
comment on column CPIC_SXDX.CUST_LIST_RSLT.housing_purchase_time
  is '���ݹ���ʱ��';
comment on column CPIC_SXDX.CUST_LIST_RSLT.housing_purchase_price
  is '���ݹ��ü�';
comment on column CPIC_SXDX.CUST_LIST_RSLT.construction_area
  is '���ݽ������';
comment on column CPIC_SXDX.CUST_LIST_RSLT.housing_use
  is '������;';
comment on column CPIC_SXDX.CUST_LIST_RSLT.property_types
  is '��������';
comment on column CPIC_SXDX.CUST_LIST_RSLT.interest_types
  is '��Ȥ����';
comment on column CPIC_SXDX.CUST_LIST_RSLT.home_ownership_status
  is 'סլ����Ȩ״��';
comment on column CPIC_SXDX.CUST_LIST_RSLT.other_company_financial_assets
  is '������˾�����ʲ�';
comment on column CPIC_SXDX.CUST_LIST_RSLT.province
  is 'ʡ(��ϵ��ַ)';
comment on column CPIC_SXDX.CUST_LIST_RSLT.city
  is '��(��ϵ��ַ)';
comment on column CPIC_SXDX.CUST_LIST_RSLT.county
  is '����(��ϵ��ַ)';
comment on column CPIC_SXDX.CUST_LIST_RSLT.delivery_province
  is '����ʡ';
comment on column CPIC_SXDX.CUST_LIST_RSLT.delivery_city
  is '������';
comment on column CPIC_SXDX.CUST_LIST_RSLT.delivery_county
  is '��������';
comment on column CPIC_SXDX.CUST_LIST_RSLT.delivery_address
  is '���͵�ַ��ַ';
comment on column CPIC_SXDX.CUST_LIST_RSLT.delivery_postcode
  is '���͵�ַ�ʱ�';
comment on column CPIC_SXDX.CUST_LIST_RSLT.is_sms
  is '�Ƿ���Ž�ֹ';
comment on column CPIC_SXDX.CUST_LIST_RSLT.has_child
  is '�Ƿ��к���';
comment on column CPIC_SXDX.CUST_LIST_RSLT.has_house
  is '�Ƿ��з�';
comment on column CPIC_SXDX.CUST_LIST_RSLT.travel_mode
  is '���з�ʽ';
comment on column CPIC_SXDX.CUST_LIST_RSLT.isvip
  is '�Ƿ�����VIP';
comment on column CPIC_SXDX.CUST_LIST_RSLT.account_no
  is '�˺�';
comment on column CPIC_SXDX.CUST_LIST_RSLT.account_name
  is '�˻�����';
comment on column CPIC_SXDX.CUST_LIST_RSLT.bank_name
  is '����';
comment on column CPIC_SXDX.CUST_LIST_RSLT.marital_status
  is '����״��';
comment on column CPIC_SXDX.CUST_LIST_RSLT.education_level
  is '����ˮƽ';
comment on column CPIC_SXDX.CUST_LIST_RSLT.income
  is '������';
comment on column CPIC_SXDX.CUST_LIST_RSLT.career_level
  is 'ְҵ�ȼ�';
comment on column CPIC_SXDX.CUST_LIST_RSLT.company_address
  is '������λ';
comment on column CPIC_SXDX.CUST_LIST_RSLT.emergency_contact_phone
  is '���������˵绰';
comment on column CPIC_SXDX.CUST_LIST_RSLT.emergency_contact_name
  is '��������������';
comment on column CPIC_SXDX.CUST_LIST_RSLT.email
  is '�����ʼ�';
comment on column CPIC_SXDX.CUST_LIST_RSLT.add_type
  is '��ַ����';
comment on column CPIC_SXDX.CUST_LIST_RSLT.remark1
  is '��ע1';
comment on column CPIC_SXDX.CUST_LIST_RSLT.remark2
  is '��ע2';
comment on column CPIC_SXDX.CUST_LIST_RSLT.remark3
  is '��ע3';
comment on column CPIC_SXDX.CUST_LIST_RSLT.remark4
  is '��ע4';
comment on column CPIC_SXDX.CUST_LIST_RSLT.products
  is '�ѹ���Ʒ';
comment on column CPIC_SXDX.CUST_LIST_RSLT.reclined
  is '��ϯ';
comment on column CPIC_SXDX.CUST_LIST_RSLT.contract_phone
  is '��ϵ�绰';
comment on column CPIC_SXDX.CUST_LIST_RSLT.relationship
  is '������������ͻ���ϵ';
comment on column CPIC_SXDX.CUST_LIST_RSLT.org_id
  is '������ˮ��';
comment on column CPIC_SXDX.CUST_LIST_RSLT.fax
  is '����';
comment on column CPIC_SXDX.CUST_LIST_RSLT.introducer
  is '������';
comment on column CPIC_SXDX.CUST_LIST_RSLT.introduce_time
  is 'ת����ʱ��';
comment on column CPIC_SXDX.CUST_LIST_RSLT.introducer_relationship
  is '������˹�ϵ';
comment on column CPIC_SXDX.CUST_LIST_RSLT.has_car
  is '�Ƿ��г�';
comment on column CPIC_SXDX.CUST_LIST_RSLT.customer_flg
  is '�ͻ�Ψһ��ʶ';
comment on column CPIC_SXDX.CUST_LIST_RSLT.row_num
  is '������excel���������';
alter table CPIC_SXDX.CUST_LIST_RSLT
  add constraint PK_TEMP_CUS_BAS_EXTERNAL primary key (CUS_ID);

prompt
prompt Creating table C_ART_ALL_SOURCES
prompt ================================
prompt
create table CPIC_SXDX.C_ART_ALL_SOURCES
(
  object_id       INTEGER not null,
  object_group_id INTEGER,
  object_type     VARCHAR2(6),
  line_number     INTEGER not null,
  query_id        INTEGER,
  text_info       VARCHAR2(4000),
  tenementid      NUMBER(4)
)
;
comment on table CPIC_SXDX.C_ART_ALL_SOURCES
  is 'SQLԴ';
comment on column CPIC_SXDX.C_ART_ALL_SOURCES.object_id
  is 'ID';
comment on column CPIC_SXDX.C_ART_ALL_SOURCES.object_group_id
  is '����';
comment on column CPIC_SXDX.C_ART_ALL_SOURCES.line_number
  is '���';
comment on column CPIC_SXDX.C_ART_ALL_SOURCES.query_id
  is '��ѯID';
comment on column CPIC_SXDX.C_ART_ALL_SOURCES.text_info
  is '������Ϣ';
comment on column CPIC_SXDX.C_ART_ALL_SOURCES.tenementid
  is '�⻧ID';
alter table CPIC_SXDX.C_ART_ALL_SOURCES
  add constraint PK_C_ART_ALL_SOURCES primary key (OBJECT_ID, LINE_NUMBER);

prompt
prompt Creating table C_ART_DATABASES
prompt ==============================
prompt
create table CPIC_SXDX.C_ART_DATABASES
(
  database_id   NUMBER(10) not null,
  name          VARCHAR2(64),
  driver        VARCHAR2(128),
  url           VARCHAR2(128),
  username      VARCHAR2(32),
  password      VARCHAR2(32),
  pool_timeout  INTEGER,
  test_sql      VARCHAR2(255),
  update_date   DATE,
  "tenementid"  NUMBER(4),
  "iscurrent"   NUMBER(1),
  database_type VARCHAR2(16),
  "isdefault"   NUMBER(1),
  "isdel"       NUMBER(1)
)
;
comment on table CPIC_SXDX.C_ART_DATABASES
  is '����Դ

NAME��Ψһ��
URL+uesrId��Ψһ��';
comment on column CPIC_SXDX.C_ART_DATABASES."tenementid"
  is '�⻧ID';
comment on column CPIC_SXDX.C_ART_DATABASES.database_type
  is 'ORACLE/MYSQL/HBSQL...';
comment on column CPIC_SXDX.C_ART_DATABASES."isdefault"
  is '�Ƿ�Ĭ�ϡ�0��Ĭ��0
1�ǡ�';
comment on column CPIC_SXDX.C_ART_DATABASES."isdel"
  is 'Ĭ��0
��1';
alter table CPIC_SXDX.C_ART_DATABASES
  add constraint PK_C_ART_DATABASES primary key (DATABASE_ID);

prompt
prompt Creating table C_ART_DRILLDOWN_QUERIES
prompt ======================================
prompt
create table CPIC_SXDX.C_ART_DRILLDOWN_QUERIES
(
  query_id                 INTEGER not null,
  drilldown_query_id       INTEGER not null,
  drilldown_query_position INTEGER not null,
  drilldown_title          VARCHAR2(30),
  drilldown_text           VARCHAR2(30),
  output_format            VARCHAR2(15),
  open_in_new_window       VARCHAR2(1),
  "tenementid"             NUMBER(4)
)
;
comment on table CPIC_SXDX.C_ART_DRILLDOWN_QUERIES
  is 'ģ����ϸ��ѯ';
comment on column CPIC_SXDX.C_ART_DRILLDOWN_QUERIES.drilldown_query_position
  is '����';
comment on column CPIC_SXDX.C_ART_DRILLDOWN_QUERIES."tenementid"
  is '�⻧ID';
alter table CPIC_SXDX.C_ART_DRILLDOWN_QUERIES
  add constraint PK_C_ART_DRILLDOWN_QUERIES primary key (QUERY_ID, DRILLDOWN_QUERY_POSITION);

prompt
prompt Creating table C_ART_JOBS
prompt =========================
prompt
create table CPIC_SXDX.C_ART_JOBS
(
  "tenementid"       NUMBER(4),
  job_id             NUMBER(10) not null,
  job_name           VARCHAR2(255),
  query_id           INTEGER,
  username           VARCHAR2(255),
  output             VARCHAR2(255),
  job_type           INTEGER,
  minute             VARCHAR2(255),
  hour               VARCHAR2(255),
  day                VARCHAR2(255),
  weekday            VARCHAR2(255),
  month              VARCHAR2(255),
  mail_tos           VARCHAR2(255),
  mail_from          VARCHAR2(255),
  subject            VARCHAR2(255),
  message            VARCHAR2(4000),
  cached_table_name  VARCHAR2(30),
  start_date         DATE,
  end_date           DATE,
  next_run_date      TIMESTAMP(6),
  last_file_name     VARCHAR2(4000),
  last_start_date    TIMESTAMP(6),
  last_end_date      TIMESTAMP(6),
  active_status      VARCHAR2(1),
  enable_audit       VARCHAR2(1),
  allow_sharing      VARCHAR2(1),
  allow_splitting    VARCHAR2(1),
  migrated_to_quartz VARCHAR2(1)
)
;
comment on table CPIC_SXDX.C_ART_JOBS
  is '��ʱ����';
comment on column CPIC_SXDX.C_ART_JOBS."tenementid"
  is '�⻧ID';
comment on column CPIC_SXDX.C_ART_JOBS.mail_tos
  is '������EMAIL';
comment on column CPIC_SXDX.C_ART_JOBS.subject
  is '����';
comment on column CPIC_SXDX.C_ART_JOBS.message
  is '����';
comment on column CPIC_SXDX.C_ART_JOBS.next_run_date
  is '�´�����ʱ��';
comment on column CPIC_SXDX.C_ART_JOBS.active_status
  is '״̬';
alter table CPIC_SXDX.C_ART_JOBS
  add constraint PK_C_ART_JOBS primary key (JOB_ID);

prompt
prompt Creating table C_ART_JOBS_AUDIT
prompt ===============================
prompt
create table CPIC_SXDX.C_ART_JOBS_AUDIT
(
  job_id        INTEGER,
  username      VARCHAR2(15),
  job_audit_key VARCHAR2(100),
  action        VARCHAR2(1),
  start_date    TIMESTAMP(6),
  end_date      TIMESTAMP(6),
  "tenementid"  NUMBER(4)
)
;
comment on column CPIC_SXDX.C_ART_JOBS_AUDIT."tenementid"
  is '�⻧ID';

prompt
prompt Creating table C_ART_JOBS_PARAMETERS
prompt ====================================
prompt
create table CPIC_SXDX.C_ART_JOBS_PARAMETERS
(
  job_id       INTEGER,
  param_type   VARCHAR2(1),
  param_name   VARCHAR2(60),
  param_value  VARCHAR2(100),
  "tenementid" NUMBER(4)
)
;
comment on table CPIC_SXDX.C_ART_JOBS_PARAMETERS
  is '��ʱ�������';
comment on column CPIC_SXDX.C_ART_JOBS_PARAMETERS."tenementid"
  is '�⻧ID';

prompt
prompt Creating table C_ART_JOB_OUT_MODEL
prompt ==================================
prompt
create table CPIC_SXDX.C_ART_JOB_OUT_MODEL
(
  out_model NUMBER(10) not null,
  name      VARCHAR2(32)
)
;
comment on table CPIC_SXDX.C_ART_JOB_OUT_MODEL
  is '�����ʽ';
alter table CPIC_SXDX.C_ART_JOB_OUT_MODEL
  add constraint PK_C_ART_JOB_OUT_MODEL primary key (OUT_MODEL);

prompt
prompt Creating table C_ART_JOB_SCHEDULES
prompt ==================================
prompt
create table CPIC_SXDX.C_ART_JOB_SCHEDULES
(
  schedule_name VARCHAR2(100) not null,
  minute        VARCHAR2(100),
  hour          VARCHAR2(100),
  day           VARCHAR2(100),
  month         VARCHAR2(100),
  weekday       VARCHAR2(100),
  "tenementid"  NUMBER(4)
)
;
comment on table CPIC_SXDX.C_ART_JOB_SCHEDULES
  is '��ʱ����ʱ������';
comment on column CPIC_SXDX.C_ART_JOB_SCHEDULES."tenementid"
  is '�⻧ID';
alter table CPIC_SXDX.C_ART_JOB_SCHEDULES
  add constraint PK_C_ART_JOB_SCHEDULES primary key (SCHEDULE_NAME);

prompt
prompt Creating table C_ART_LOGS
prompt =========================
prompt
create table CPIC_SXDX.C_ART_LOGS
(
  update_time  TIMESTAMP(6),
  "userid"     VARCHAR2(32),
  log_type     VARCHAR2(15),
  ip           VARCHAR2(15),
  object_id    INTEGER,
  total_time   INTEGER,
  fetch_time   INTEGER,
  message      VARCHAR2(4000),
  "tenementid" NUMBER(4)
)
;
comment on table CPIC_SXDX.C_ART_LOGS
  is '��־';
comment on column CPIC_SXDX.C_ART_LOGS."tenementid"
  is '�⻧ID';

prompt
prompt Creating table C_ART_QUERIES
prompt ============================
prompt
create table CPIC_SXDX.C_ART_QUERIES
(
  query_group_id    INTEGER,
  query_id          INTEGER not null,
  c_a_database_id   NUMBER(10),
  name              VARCHAR2(100),
  short_description VARCHAR2(254),
  description       VARCHAR2(2000),
  uses_rules        VARCHAR2(1),
  database_id       INTEGER,
  query_type        INTEGER,
  contact_person    VARCHAR2(100),
  active_status     VARCHAR2(1),
  x_axis_label      VARCHAR2(200),
  y_axis_label      VARCHAR2(200),
  graph_options     VARCHAR2(200),
  template          VARCHAR2(100),
  xmla_url          VARCHAR2(300),
  xmla_datasource   VARCHAR2(50),
  xmla_catalog      VARCHAR2(50),
  update_date       DATE,
  tenementid        NUMBER(4),
  refushtype        VARCHAR2(10),
  isrealtime        VARCHAR2(10),
  grouptype         VARCHAR2(10)
)
;
comment on table CPIC_SXDX.C_ART_QUERIES
  is '����';
comment on column CPIC_SXDX.C_ART_QUERIES.query_group_id
  is 'ģ���飬C_ART_QUERY_GROUPS���';
comment on column CPIC_SXDX.C_ART_QUERIES.uses_rules
  is '��ʹ��';
comment on column CPIC_SXDX.C_ART_QUERIES.database_id
  is '����Դ';
comment on column CPIC_SXDX.C_ART_QUERIES.query_type
  is 'ģ������';
comment on column CPIC_SXDX.C_ART_QUERIES.contact_person
  is '��ϵ��';
comment on column CPIC_SXDX.C_ART_QUERIES.active_status
  is '״̬';
comment on column CPIC_SXDX.C_ART_QUERIES.x_axis_label
  is 'X������';
comment on column CPIC_SXDX.C_ART_QUERIES.y_axis_label
  is 'Y������';
comment on column CPIC_SXDX.C_ART_QUERIES.graph_options
  is 'ͼ������';
comment on column CPIC_SXDX.C_ART_QUERIES.update_date
  is '��������';
comment on column CPIC_SXDX.C_ART_QUERIES.tenementid
  is '�⻧ID';
comment on column CPIC_SXDX.C_ART_QUERIES.refushtype
  is 'ˢ�·�ʽ,0:֪ͨˢ��;1:ҳ��ˢ��';
comment on column CPIC_SXDX.C_ART_QUERIES.isrealtime
  is '�Ƿ�ʵʱ����,0:��,1:��';
comment on column CPIC_SXDX.C_ART_QUERIES.grouptype
  is 'Ĭ��0�������飨���棩 1���ֵ� 2��ʾ��';
alter table CPIC_SXDX.C_ART_QUERIES
  add constraint PK_C_ART_QUERIES primary key (QUERY_ID);

prompt
prompt Creating table C_ART_QUERIES_FUN
prompt ================================
prompt
create table CPIC_SXDX.C_ART_QUERIES_FUN
(
  "fun_id"     CHAR(10),
  "queryid"    CHAR(10),
  "userid"     CHAR(10),
  "tenementid" CHAR(10)
)
;
comment on table CPIC_SXDX.C_ART_QUERIES_FUN
  is '������Ȩ';

prompt
prompt Creating table C_ART_QUERY_FIELDS
prompt =================================
prompt
create table CPIC_SXDX.C_ART_QUERY_FIELDS
(
  tenementid             NUMBER(4),
  query_id               INTEGER not null,
  field_position         INTEGER not null,
  name                   VARCHAR2(64),
  short_description      VARCHAR2(40),
  description            VARCHAR2(200),
  field_class            VARCHAR2(15),
  default_value          VARCHAR2(80),
  param_type             VARCHAR2(1),
  use_lov                VARCHAR2(1),
  apply_rules_to_lov     VARCHAR2(1),
  lov_query_id           INTEGER,
  chained_param_position INTEGER,
  chained_value_position INTEGER,
  drilldown_column       INTEGER,
  update_date            DATE
)
;
comment on table CPIC_SXDX.C_ART_QUERY_FIELDS
  is '���������';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.tenementid
  is '�⻧ID';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.field_position
  is '����';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.field_class
  is '��������';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.default_value
  is 'Ĭ��ֵ';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.param_type
  is '��ѡ/��ѡ';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.use_lov
  is '�Ƿ�ʹ���ֵ�ģ��';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.apply_rules_to_lov
  is '����ʹ���ֵ�ģ��';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.lov_query_id
  is '�ֵ�ģ��ID';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.chained_param_position
  is '��������λ��';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.chained_value_position
  is '����ֵλ��';
alter table CPIC_SXDX.C_ART_QUERY_FIELDS
  add constraint PK_C_ART_QUERY_FIELDS primary key (QUERY_ID, FIELD_POSITION);

prompt
prompt Creating table C_ART_QUERY_GROUPS
prompt =================================
prompt
create table CPIC_SXDX.C_ART_QUERY_GROUPS
(
  query_group_id INTEGER not null,
  name           VARCHAR2(100),
  description    VARCHAR2(100),
  createdate     DATE,
  userid         VARCHAR2(32),
  tenementid     NUMBER(4),
  grouptype      NUMBER(1) default 0 not null
)
;
comment on table CPIC_SXDX.C_ART_QUERY_GROUPS
  is '������';
comment on column CPIC_SXDX.C_ART_QUERY_GROUPS.query_group_id
  is 'ID����';
comment on column CPIC_SXDX.C_ART_QUERY_GROUPS.name
  is '����';
comment on column CPIC_SXDX.C_ART_QUERY_GROUPS.description
  is '����';
comment on column CPIC_SXDX.C_ART_QUERY_GROUPS.createdate
  is '����ʱ��';
comment on column CPIC_SXDX.C_ART_QUERY_GROUPS.userid
  is 'ϵͳ�û�';
comment on column CPIC_SXDX.C_ART_QUERY_GROUPS.tenementid
  is '�⻧ID';
comment on column CPIC_SXDX.C_ART_QUERY_GROUPS.grouptype
  is 'Ĭ��0�������飨���棩
1���ֵ�
2��ʾ��';
alter table CPIC_SXDX.C_ART_QUERY_GROUPS
  add constraint PK_C_ART_QUERY_GROUPS primary key (QUERY_GROUP_ID);

prompt
prompt Creating table C_ART_QUERY_JOB_MODEL
prompt ====================================
prompt
create table CPIC_SXDX.C_ART_QUERY_JOB_MODEL
(
  id         NUMBER(10) not null,
  query_type NUMBER(10),
  out_model  NUMBER(10),
  view_mode  NUMBER(10)
)
;
comment on table CPIC_SXDX.C_ART_QUERY_JOB_MODEL
  is 'ģ��+Job+�����ʽ��ϵ��';

prompt
prompt Creating table C_ART_QUERY_TYPE
prompt ===============================
prompt
create table CPIC_SXDX.C_ART_QUERY_TYPE
(
  query_type  NUMBER(10) not null,
  name        VARCHAR2(30),
  description VARCHAR2(100),
  code_desc   VARCHAR2(64),
  imgfile     VARCHAR2(64)
)
;
comment on table CPIC_SXDX.C_ART_QUERY_TYPE
  is '������';
comment on column CPIC_SXDX.C_ART_QUERY_TYPE.imgfile
  is 'template1.gif';
alter table CPIC_SXDX.C_ART_QUERY_TYPE
  add constraint PK_C_ART_QUERY_TYPE primary key (QUERY_TYPE);

prompt
prompt Creating table C_ART_SHARED_JOBS
prompt ================================
prompt
create table CPIC_SXDX.C_ART_SHARED_JOBS
(
  job_id          INTEGER not null,
  username        VARCHAR2(15) not null,
  user_group_id   INTEGER,
  last_file_name  VARCHAR2(4000),
  last_start_date TIMESTAMP(6),
  last_end_date   TIMESTAMP(6),
  "tenementid"    NUMBER(4)
)
;
comment on column CPIC_SXDX.C_ART_SHARED_JOBS."tenementid"
  is '�⻧ID';
alter table CPIC_SXDX.C_ART_SHARED_JOBS
  add constraint PK_C_ART_SHARED_JOBS primary key (JOB_ID, USERNAME);

prompt
prompt Creating table C_ART_VIEW_MODEL
prompt ===============================
prompt
create table CPIC_SXDX.C_ART_VIEW_MODEL
(
  view_mode   NUMBER(10) not null,
  name        VARCHAR2(32),
  description VARCHAR2(100),
  code_desc   VARCHAR2(64),
  imgfile     VARCHAR2(64)
)
;
comment on table CPIC_SXDX.C_ART_VIEW_MODEL
  is '�����ʽ';
comment on column CPIC_SXDX.C_ART_VIEW_MODEL.view_mode
  is 'ģ����';
comment on column CPIC_SXDX.C_ART_VIEW_MODEL.name
  is 'ģ������';
comment on column CPIC_SXDX.C_ART_VIEW_MODEL.description
  is '����';
comment on column CPIC_SXDX.C_ART_VIEW_MODEL.code_desc
  is '����';
comment on column CPIC_SXDX.C_ART_VIEW_MODEL.imgfile
  is 'template1.gif';
alter table CPIC_SXDX.C_ART_VIEW_MODEL
  add constraint PK_C_ART_VIEW_MODEL primary key (VIEW_MODE);

prompt
prompt Creating table C_BULLETIN
prompt =========================
prompt
create table CPIC_SXDX.C_BULLETIN
(
  bulletinid     NUMBER(10) not null,
  title          VARCHAR2(64),
  content        VARCHAR2(1024),
  createuserid   VARCHAR2(32),
  createdatetime DATE,
  efficientdate  DATE,
  invalidate     DATE,
  ispublished    NUMBER(1) not null
)
;
comment on table CPIC_SXDX.C_BULLETIN
  is '����֪ͨ';
comment on column CPIC_SXDX.C_BULLETIN.bulletinid
  is '����֪ͨ������';
comment on column CPIC_SXDX.C_BULLETIN.title
  is '���⣡';
comment on column CPIC_SXDX.C_BULLETIN.content
  is '���ݣ����ֳ���:500��';
comment on column CPIC_SXDX.C_BULLETIN.createuserid
  is '������';
comment on column CPIC_SXDX.C_BULLETIN.createdatetime
  is '����ʱ�䣬��ȷ��ʱ�䣡';
comment on column CPIC_SXDX.C_BULLETIN.efficientdate
  is '������Чʱ��,�����ֶ�(��ȷ����)';
comment on column CPIC_SXDX.C_BULLETIN.invalidate
  is '����ʧ��ʱ��,�����ֶ�(��ȷ����)';
comment on column CPIC_SXDX.C_BULLETIN.ispublished
  is '�Ƿ��ѷ���,Ĭ��0,1��';
alter table CPIC_SXDX.C_BULLETIN
  add constraint PK_C_BULLETIN primary key (BULLETINID);

prompt
prompt Creating table C_BULLETIN_ATTACHMENT
prompt ====================================
prompt
create table CPIC_SXDX.C_BULLETIN_ATTACHMENT
(
  file_id        NUMBER(10) not null,
  bulletinid     NUMBER(10),
  contenttype    VARCHAR2(32),
  pathfilename   VARCHAR2(64),
  isimgage       NUMBER(1) default 0 not null,
  naturefilename VARCHAR2(32)
)
;
comment on table CPIC_SXDX.C_BULLETIN_ATTACHMENT
  is '����֪ͨ������';
comment on column CPIC_SXDX.C_BULLETIN_ATTACHMENT.file_id
  is 'FILE_ID';
comment on column CPIC_SXDX.C_BULLETIN_ATTACHMENT.bulletinid
  is '����֪ͨ������';
comment on column CPIC_SXDX.C_BULLETIN_ATTACHMENT.contenttype
  is '�ļ�����parent_code=faqfiletype

txt���ı�����
html�����ı�����
doc��word2007�����ݸ�ʽ
docx��word2010�����ݸ�ʽ
pdf��pdf�ĵ�
swf��flash��swf�ĵ�
';
comment on column CPIC_SXDX.C_BULLETIN_ATTACHMENT.pathfilename
  is 'FAQ���ġ��������ļ����������ļ�����FTP�������ϡ�
·����ɣ�
1. ��FAQToken��getFaqFtpServerInfo�õ�·��+pathfilename�ֶδ���ļ�����·��
2.�ֶ��б����·����ʽΪ��
CATEGORYID/����ʱ��(��ʽ:YYYYMMDD)/�û�ID (USERID)_YYYYMMYYHHMISS.��׺';
comment on column CPIC_SXDX.C_BULLETIN_ATTACHMENT.isimgage
  is '�Ƿ�ΪͼƬ��Ĭ��0����Ϊ1.
';
comment on column CPIC_SXDX.C_BULLETIN_ATTACHMENT.naturefilename
  is '�ϴ��ļ���ʵ���ļ���������׺��';
create index CPIC_SXDX.RELATIONSHIP_2_FK on CPIC_SXDX.C_BULLETIN_ATTACHMENT (BULLETINID);
alter table CPIC_SXDX.C_BULLETIN_ATTACHMENT
  add constraint PK_C_BULLETIN_ATTACHMENT primary key (FILE_ID);
alter table CPIC_SXDX.C_BULLETIN_ATTACHMENT
  add constraint FK_BULLETIN_ATTACHMENT foreign key (BULLETINID)
  references CPIC_SXDX.C_BULLETIN (BULLETINID);

prompt
prompt Creating table C_BULLETIN_DELIVER
prompt =================================
prompt
create table CPIC_SXDX.C_BULLETIN_DELIVER
(
  deliverid     NUMBER(10) not null,
  bulletinid    NUMBER(10),
  receiveuserid VARCHAR2(32),
  isreaded      NUMBER(1) not null,
  groupid       VARCHAR2(20),
  senduserid    VARCHAR2(32),
  senddate      DATE,
  ismarquee     NUMBER(1)
)
;
comment on table CPIC_SXDX.C_BULLETIN_DELIVER
  is '����֪ͨ�ַ���;
ֱ�ӷ���ϵͳ�û���';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER.deliverid
  is '�ַ�����';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER.bulletinid
  is 'c_bullite�����:����֪ͨ����';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER.receiveuserid
  is '�����û�';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER.isreaded
  is '�Ƿ��Ѷ���';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER.groupid
  is '�ַ����û���ID';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER.senduserid
  is '������';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER.senddate
  is '����ʱ��';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER.ismarquee
  is '�Ƿ񷢲������,Ĭ��0';
create index CPIC_SXDX.RELATIONSHIP_3_FK on CPIC_SXDX.C_BULLETIN_DELIVER (BULLETINID);
alter table CPIC_SXDX.C_BULLETIN_DELIVER
  add constraint PK_C_BULLETIN_DELIVER primary key (DELIVERID);
alter table CPIC_SXDX.C_BULLETIN_DELIVER
  add constraint FK_BULLETIN_DELIVERY foreign key (BULLETINID)
  references CPIC_SXDX.C_BULLETIN (BULLETINID);

prompt
prompt Creating table C_BULLETIN_DELIVER_DETAIL
prompt ========================================
prompt
create table CPIC_SXDX.C_BULLETIN_DELIVER_DETAIL
(
  detailid   NUMBER(10) not null,
  deliverid  NUMBER(10),
  bulletinid NUMBER(10),
  groupid    VARCHAR2(20),
  userid     VARCHAR2(32)
)
;
comment on table CPIC_SXDX.C_BULLETIN_DELIVER_DETAIL
  is '����˾���������ȡ��־��ϸ���м�¼˵�����û��Ѷ�ȡ��ǰ�ù��棬�޼�¼��˵��δ��ȡ�ù��棩';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER_DETAIL.detailid
  is '��˾�ַ���ϸ����';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER_DETAIL.deliverid
  is '�ַ�����(c_bulletin_deliver)';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER_DETAIL.bulletinid
  is '������(c_bulletin)';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER_DETAIL.groupid
  is '������';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER_DETAIL.userid
  is '�Ѷ��û�';
alter table CPIC_SXDX.C_BULLETIN_DELIVER_DETAIL
  add constraint PK_C_BULLETIN_DELIVER_DETAIL primary key (DETAILID);
alter table CPIC_SXDX.C_BULLETIN_DELIVER_DETAIL
  add constraint FK_BULLETIN_DELIVER_DETAIL foreign key (DELIVERID)
  references CPIC_SXDX.C_BULLETIN_DELIVER (DELIVERID);
alter table CPIC_SXDX.C_BULLETIN_DELIVER_DETAIL
  add constraint FK_BULLETIN_DETAIL foreign key (BULLETINID)
  references CPIC_SXDX.C_BULLETIN (BULLETINID);

prompt
prompt Creating table C_CALLHISTORY_MEDIALSTATUS
prompt =========================================
prompt
create table CPIC_SXDX.C_CALLHISTORY_MEDIALSTATUS
(
  medialstatusid NUMBER(2) not null,
  name           VARCHAR2(16)
)
;
comment on table CPIC_SXDX.C_CALLHISTORY_MEDIALSTATUS
  is '��ý��״̬����ӦContactTypeFactoryToken.java��MEDIAL_STATUS��ͷ�ĳ���';
alter table CPIC_SXDX.C_CALLHISTORY_MEDIALSTATUS
  add constraint PK_C_CALLHISTORY_MEDIALSTATUS primary key (MEDIALSTATUSID);

prompt
prompt Creating table C_CONTACT_DIRECT
prompt ===============================
prompt
create table CPIC_SXDX.C_CONTACT_DIRECT
(
  directid NUMBER(1) not null,
  name     VARCHAR2(16)
)
;
comment on table CPIC_SXDX.C_CONTACT_DIRECT
  is '�������򣬳�����ContactTypeFactoryToken.java����CONTACT_DIRECT��ͷ�ĳ���';
alter table CPIC_SXDX.C_CONTACT_DIRECT
  add constraint PK_C_CONTACT_DIRECT primary key (DIRECTID);

prompt
prompt Creating table C_CONTACT_FACTORY
prompt ================================
prompt
create table CPIC_SXDX.C_CONTACT_FACTORY
(
  factorycode VARCHAR2(32) not null,
  isdel       NUMBER(1) default 0 not null,
  remark      VARCHAR2(32)
)
;
comment on table CPIC_SXDX.C_CONTACT_FACTORY
  is '�����볧�̵��ֵ��';
comment on column CPIC_SXDX.C_CONTACT_FACTORY.factorycode
  is '���̴���';
comment on column CPIC_SXDX.C_CONTACT_FACTORY.isdel
  is '1ɾ��,Ĭ��0';
comment on column CPIC_SXDX.C_CONTACT_FACTORY.remark
  is '˵��';
alter table CPIC_SXDX.C_CONTACT_FACTORY
  add constraint PK_CONTACT_FACTORY primary key (FACTORYCODE);

prompt
prompt Creating table C_CONTACT_TYPE
prompt =============================
prompt
create table CPIC_SXDX.C_CONTACT_TYPE
(
  typecode VARCHAR2(10) not null,
  name     VARCHAR2(32) not null
)
;
comment on table CPIC_SXDX.C_CONTACT_TYPE
  is '���緽ʽ��������ʽ��

phone������(�绰)
email��Email(�����ʼ�)
microblog.΢��
instant.��ʱͨѶ
faq.����';
comment on column CPIC_SXDX.C_CONTACT_TYPE.typecode
  is '���ʹ���';
comment on column CPIC_SXDX.C_CONTACT_TYPE.name
  is '����';
alter table CPIC_SXDX.C_CONTACT_TYPE
  add constraint PK_C_CONTACTMODE primary key (TYPECODE);

prompt
prompt Creating table C_CALLHISTORY
prompt ============================
prompt
create table CPIC_SXDX.C_CALLHISTORY
(
  callhistoryid     NUMBER(10) not null,
  calid             VARCHAR2(64),
  direct            NUMBER(1) not null,
  begintime         DATE not null,
  endtime           DATE,
  thisno            VARCHAR2(32),
  userid            VARCHAR2(24),
  agentid           VARCHAR2(16),
  descno            VARCHAR2(32),
  tenementid        NUMBER(4) not null,
  contacttypecode   VARCHAR2(10) not null,
  cusid             NUMBER(10),
  ispredict         NUMBER(1) not null,
  ivrtrace          VARCHAR2(128),
  fromcallhistoryid NUMBER(10) default 0,
  medialstatus      NUMBER(1) default 0 not null,
  factorycode       VARCHAR2(32) not null
)
;
comment on table CPIC_SXDX.C_CALLHISTORY
  is '������ʷ����';
comment on column CPIC_SXDX.C_CALLHISTORY.callhistoryid
  is '������ʷ���';
comment on column CPIC_SXDX.C_CALLHISTORY.calid
  is '����� typecode=voice,��calidΪcti��·���ݴ������ֵ(����¼������ʱ�ã�
����Ƕ�ý�壬��Ϊ��ý���ļ���Ӧ��·�����ļ�����

ԴID��¼��ΪcallId��
�ʼ���Email �ȣ��ٶ��ơ�';
comment on column CPIC_SXDX.C_CALLHISTORY.direct
  is '����
1����
2����

��Ӧ������ContactTypeFactoryToken.java�е�CONTACT_DIRECT_INCOME
��Ӧ������ContactTypeFactoryToken.java�е�CONTACT_DIRECT_OUTBOUND
';
comment on column CPIC_SXDX.C_CALLHISTORY.begintime
  is '��ʼʱ��';
comment on column CPIC_SXDX.C_CALLHISTORY.endtime
  is '����ʱ��';
comment on column CPIC_SXDX.C_CALLHISTORY.thisno
  is '�ҷ�����(��ϯ�ֻ�)';
comment on column CPIC_SXDX.C_CALLHISTORY.userid
  is '��ǰ�û����';
comment on column CPIC_SXDX.C_CALLHISTORY.agentid
  is '��ϯ�˺���
typecode=voiceʱ��Ϊ����
typecode=emailʱ��Ϊ�ʼ���ַ
teypecode=msgʱ��Ϊ���ŵ�ַ
...';
comment on column CPIC_SXDX.C_CALLHISTORY.descno
  is '�ͻ�����';
comment on column CPIC_SXDX.C_CALLHISTORY.tenementid
  is '�⻧';
comment on column CPIC_SXDX.C_CALLHISTORY.contacttypecode
  is '�������͡�������ʽ��C_contact_type��  �ɳ����ࣺContactTypeFactoryToken.java�С�CONTACT_TYPE_"ͷ�ĳ�����ʾ';
comment on column CPIC_SXDX.C_CALLHISTORY.cusid
  is '�ͻ����

�ͻ������ c_cus_bas�������';
comment on column CPIC_SXDX.C_CALLHISTORY.ispredict
  is '�Ƿ�ΪԤ�����������ϵ��ʷ��';
comment on column CPIC_SXDX.C_CALLHISTORY.ivrtrace
  is 'IVR��ť��¼
�м��á�|���߷ָ���';
comment on column CPIC_SXDX.C_CALLHISTORY.fromcallhistoryid
  is '��Դ��ʷ';
comment on column CPIC_SXDX.C_CALLHISTORY.medialstatus
  is '��ý��״̬';
comment on column CPIC_SXDX.C_CALLHISTORY.factorycode
  is '���̺�';
alter table CPIC_SXDX.C_CALLHISTORY
  add constraint PK_CALLHISTORYID primary key (CALLHISTORYID);
alter table CPIC_SXDX.C_CALLHISTORY
  add constraint FK_CALLHISTORY_DIRECT foreign key (DIRECT)
  references CPIC_SXDX.C_CONTACT_DIRECT (DIRECTID);
alter table CPIC_SXDX.C_CALLHISTORY
  add constraint FK_CALLHISTORY_FACTORY foreign key (FACTORYCODE)
  references CPIC_SXDX.C_CONTACT_FACTORY (FACTORYCODE);
alter table CPIC_SXDX.C_CALLHISTORY
  add constraint FK_CALLHISTORY_MEDIALSTATUS foreign key (MEDIALSTATUS)
  references CPIC_SXDX.C_CALLHISTORY_MEDIALSTATUS (MEDIALSTATUSID);
alter table CPIC_SXDX.C_CALLHISTORY
  add constraint FK_CALLHISTORY_TYPECODE foreign key (CONTACTTYPECODE)
  references CPIC_SXDX.C_CONTACT_TYPE (TYPECODE);

prompt
prompt Creating table C_CASE_BAS
prompt =========================
prompt
create table CPIC_SXDX.C_CASE_BAS
(
  caseid         NUMBER(10) not null,
  fromgroupid    VARCHAR2(20) not null,
  fromuserid     VARCHAR2(24) not null,
  togroupid      VARCHAR2(20) not null,
  touserid       VARCHAR2(24),
  casestatus     VARCHAR2(24) not null,
  tenementid     NUMBER(4) not null,
  busitype       VARCHAR2(32) not null,
  cus_id         NUMBER(10),
  task_id        NUMBER(10),
  fromcaseid     NUMBER(10),
  summary        VARCHAR2(128),
  caseno         VARCHAR2(20),
  createdate     DATE not null,
  lastupdatedate DATE not null,
  productid      NUMBER(10),
  productsuiteid NUMBER(10),
  isflow         NUMBER(1) default 0 not null,
  flowid         NUMBER(10),
  source         NUMBER(1) default 0 not null,
  createuserid   VARCHAR2(24)
)
;
comment on table CPIC_SXDX.C_CASE_BAS
  is '����������

ֻ�������ӵļ�¼����������������˲��п�����ͬ��
caseLogid���Ϊ�գ������������¼��

�����絯�������Ӫ�������ϵ�¼��ʱ��
�жϵ�ǰgetcurrentCallHistoryId()�Ƿ�Ϊ�ա������Ϊ�գ��򴴽���ϵ��c_callhistory_case��ϵ��';
comment on column CPIC_SXDX.C_CASE_BAS.caseid
  is '�������';
comment on column CPIC_SXDX.C_CASE_BAS.fromgroupid
  is 'Դ��';
comment on column CPIC_SXDX.C_CASE_BAS.fromuserid
  is 'Դϵͳ�û�';
comment on column CPIC_SXDX.C_CASE_BAS.togroupid
  is '�����������';
comment on column CPIC_SXDX.C_CASE_BAS.touserid
  is '�����û�';
comment on column CPIC_SXDX.C_CASE_BAS.casestatus
  is '����״̬


����״̬

�����ֵ䣺
parentId=caseStatus


���������ֵ�-->
����Ӧ���� flowstatustoken.java����caes_status��ͷ�ĳ�����
00��������
01��������
02��������
90�����
91��ȡ��';
comment on column CPIC_SXDX.C_CASE_BAS.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_CASE_BAS.busitype
  is 'ҵ�����ͣ���״��

�����ֵ䣺

parentId=busiType';
comment on column CPIC_SXDX.C_CASE_BAS.cus_id
  is '�ͻ����';
comment on column CPIC_SXDX.C_CASE_BAS.task_id
  is '������';
comment on column CPIC_SXDX.C_CASE_BAS.fromcaseid
  is '��Դ����';
comment on column CPIC_SXDX.C_CASE_BAS.summary
  is '����С��';
comment on column CPIC_SXDX.C_CASE_BAS.caseno
  is '������';
comment on column CPIC_SXDX.C_CASE_BAS.createdate
  is '����ʱ��';
comment on column CPIC_SXDX.C_CASE_BAS.lastupdatedate
  is '���һ�δ���ʱ��

��caseLog�Ĵ���ʱ����ͬ';
comment on column CPIC_SXDX.C_CASE_BAS.productid
  is '��Ʒ���';
comment on column CPIC_SXDX.C_CASE_BAS.productsuiteid
  is '�ײͱ��';
comment on column CPIC_SXDX.C_CASE_BAS.isflow
  is '�Ƿ�ͨ��������������
0��Ĭ�ϣ���1��';
comment on column CPIC_SXDX.C_CASE_BAS.flowid
  is '���̱��';
comment on column CPIC_SXDX.C_CASE_BAS.source
  is '������Դ
1.���絯��
2.��ǰ����
0.��ͨ

��Ӧtasktoken.CASE_SOURCE_��ͷ����';
comment on column CPIC_SXDX.C_CASE_BAS.createuserid
  is '������';
alter table CPIC_SXDX.C_CASE_BAS
  add constraint PK_C_CASE_BAS primary key (CASEID);

prompt
prompt Creating table C_CALLHISTORY_CASE
prompt =================================
prompt
create table CPIC_SXDX.C_CALLHISTORY_CASE
(
  id            NUMBER(10) not null,
  callhistoryid NUMBER(10) not null,
  caseid        NUMBER(10) not null
)
;
comment on table CPIC_SXDX.C_CALLHISTORY_CASE
  is '��ʷ�빤����ϵ��';
comment on column CPIC_SXDX.C_CALLHISTORY_CASE.id
  is '�������';
comment on column CPIC_SXDX.C_CALLHISTORY_CASE.callhistoryid
  is '������ʷ���';
comment on column CPIC_SXDX.C_CALLHISTORY_CASE.caseid
  is '�������� c_case_bas�����';
alter table CPIC_SXDX.C_CALLHISTORY_CASE
  add constraint PK_C_CALLHISTORY_CASE primary key (ID);
alter table CPIC_SXDX.C_CALLHISTORY_CASE
  add constraint UNIQUE_CALLHISTORY_CASE unique (CALLHISTORYID, CASEID);
alter table CPIC_SXDX.C_CALLHISTORY_CASE
  add constraint FK_CALLHISTORY_CASE foreign key (CALLHISTORYID)
  references CPIC_SXDX.C_CALLHISTORY (CALLHISTORYID);
alter table CPIC_SXDX.C_CALLHISTORY_CASE
  add constraint FK_CALLHISTORY_CASE_CASE foreign key (CASEID)
  references CPIC_SXDX.C_CASE_BAS (CASEID);

prompt
prompt Creating table C_CALLHISTORY_MEDIAL
prompt ===================================
prompt
create table CPIC_SXDX.C_CALLHISTORY_MEDIAL
(
  medialid      NUMBER(10) not null,
  callhistoryid NUMBER(10) not null,
  pathfilename  VARCHAR2(128),
  ismain        NUMBER(1) not null,
  content       VARCHAR2(512)
)
;
comment on table CPIC_SXDX.C_CALLHISTORY_MEDIAL
  is '��ý�����ݱ�(pathFileName��content������һ����Ϊ�գ�)';
comment on column CPIC_SXDX.C_CALLHISTORY_MEDIAL.medialid
  is '��ý�����ݱ���';
comment on column CPIC_SXDX.C_CALLHISTORY_MEDIAL.callhistoryid
  is '������ʷ���';
comment on column CPIC_SXDX.C_CALLHISTORY_MEDIAL.pathfilename
  is 'FTP�ϵ��ļ��븽����';
comment on column CPIC_SXDX.C_CALLHISTORY_MEDIAL.ismain
  is '�Ƿ�Ϊ���ġ�
1�ǡ�Ĭ��0';
comment on column CPIC_SXDX.C_CALLHISTORY_MEDIAL.content
  is '���ġ����ż�¼�ڸ��ֶ����Ҫ�Ǵ���ȴ���ftp�������ϡ�';
alter table CPIC_SXDX.C_CALLHISTORY_MEDIAL
  add constraint PK_CALLHISTORY_MEDIAL primary key (MEDIALID);
alter table CPIC_SXDX.C_CALLHISTORY_MEDIAL
  add constraint FKCALLHISTORY_MEDIAL_HISTORY foreign key (CALLHISTORYID)
  references CPIC_SXDX.C_CALLHISTORY (CALLHISTORYID);

prompt
prompt Creating table C_ORDER_BAS
prompt ==========================
prompt
create table CPIC_SXDX.C_ORDER_BAS
(
  orderid        NUMBER(10) not null,
  fromgroupid    VARCHAR2(20) not null,
  fromuserid     VARCHAR2(24) not null,
  togroupid      VARCHAR2(20) not null,
  touserid       VARCHAR2(24),
  orderstatus    VARCHAR2(24) not null,
  tenementid     NUMBER(4) not null,
  busitype       VARCHAR2(32) not null,
  cus_id         NUMBER(10),
  task_id        NUMBER(10),
  summary        VARCHAR2(128),
  caseno         VARCHAR2(20),
  createdate     DATE not null,
  lastupdatedate DATE not null,
  productid      NUMBER(10),
  productsuiteid NUMBER(10),
  isflow         NUMBER(1) default 0 not null,
  flowid         NUMBER(10),
  source         NUMBER(1) default 0 not null,
  createuserid   VARCHAR2(24)
)
;
comment on table CPIC_SXDX.C_ORDER_BAS
  is '����������


ֻ�������ӵļ�¼����������������˲��п�����ͬ��
caseLogid���Ϊ�գ������������¼��



�����絯�������Ӫ�������ϵ�¼��ʱ��
�жϵ�ǰgetcurrentCallHistoryId()�Ƿ�Ϊ�ա������Ϊ�գ��򴴽���ϵ��c_callhistory_order��ϵ��';
comment on column CPIC_SXDX.C_ORDER_BAS.orderid
  is '�������';
comment on column CPIC_SXDX.C_ORDER_BAS.fromgroupid
  is 'Դ��';
comment on column CPIC_SXDX.C_ORDER_BAS.fromuserid
  is 'Դϵͳ�û�';
comment on column CPIC_SXDX.C_ORDER_BAS.togroupid
  is '�����������';
comment on column CPIC_SXDX.C_ORDER_BAS.touserid
  is '�����û�';
comment on column CPIC_SXDX.C_ORDER_BAS.orderstatus
  is '����״̬

�����ֵ䣺
parentId=orderStatus


���������ֵ�-->
����Ӧ���� flowstatustoken.java����order_status��ͷ�ĳ�����

00��������
01��������
02��������
03�����
04��ȡ��


';
comment on column CPIC_SXDX.C_ORDER_BAS.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_ORDER_BAS.busitype
  is 'ҵ�����ͣ���״��

�����ֵ䣺

parentId=busiType';
comment on column CPIC_SXDX.C_ORDER_BAS.cus_id
  is '�ͻ����';
comment on column CPIC_SXDX.C_ORDER_BAS.task_id
  is '������';
comment on column CPIC_SXDX.C_ORDER_BAS.summary
  is '����С��';
comment on column CPIC_SXDX.C_ORDER_BAS.caseno
  is '������';
comment on column CPIC_SXDX.C_ORDER_BAS.createdate
  is '����ʱ��';
comment on column CPIC_SXDX.C_ORDER_BAS.lastupdatedate
  is '���һ�δ���ʱ��';
comment on column CPIC_SXDX.C_ORDER_BAS.productid
  is '��Ʒ���';
comment on column CPIC_SXDX.C_ORDER_BAS.productsuiteid
  is '�ײͱ��';
comment on column CPIC_SXDX.C_ORDER_BAS.isflow
  is '�Ƿ�ͨ��������������
0��Ĭ�ϣ���1��';
comment on column CPIC_SXDX.C_ORDER_BAS.flowid
  is '���̱��';
comment on column CPIC_SXDX.C_ORDER_BAS.source
  is '������Դ


1.���絯��
2.��ǰ����
0.��ͨ

��Ӧtasktoken.ORDRE_SOURCE_��ͷ����';
comment on column CPIC_SXDX.C_ORDER_BAS.createuserid
  is '������';
alter table CPIC_SXDX.C_ORDER_BAS
  add constraint PK_C_ORDER_BAS primary key (ORDERID);

prompt
prompt Creating table C_CALLHISTORY_ORDER
prompt ==================================
prompt
create table CPIC_SXDX.C_CALLHISTORY_ORDER
(
  id            NUMBER(10) not null,
  callhistoryid NUMBER(10) not null,
  orderid       NUMBER(10) not null
)
;
comment on table CPIC_SXDX.C_CALLHISTORY_ORDER
  is '��ʷ�붩����ϵ��';
comment on column CPIC_SXDX.C_CALLHISTORY_ORDER.id
  is '�������';
comment on column CPIC_SXDX.C_CALLHISTORY_ORDER.callhistoryid
  is '������ʷ���';
comment on column CPIC_SXDX.C_CALLHISTORY_ORDER.orderid
  is '�������� c_ORDER_bas�����';
alter table CPIC_SXDX.C_CALLHISTORY_ORDER
  add constraint PK_C_CALLHISTORY_ORDER primary key (ID);
alter table CPIC_SXDX.C_CALLHISTORY_ORDER
  add constraint UNIQUE_CALLHISTORY_ORDER unique (CALLHISTORYID, ORDERID);
alter table CPIC_SXDX.C_CALLHISTORY_ORDER
  add constraint FK_CALLHISTORY_ORDER foreign key (CALLHISTORYID)
  references CPIC_SXDX.C_CALLHISTORY (CALLHISTORYID);
alter table CPIC_SXDX.C_CALLHISTORY_ORDER
  add constraint FK_C_CALLHISTORY_ORDER_ORDER foreign key (ORDERID)
  references CPIC_SXDX.C_ORDER_BAS (ORDERID);

prompt
prompt Creating table C_TASK_STATUS
prompt ============================
prompt
create table CPIC_SXDX.C_TASK_STATUS
(
  taskstatusid NUMBER(4) not null,
  isdel        NUMBER(1) default 0 not null,
  name         VARCHAR2(32) not null,
  remark       VARCHAR2(64),
  disorder     NUMBER(4) default 0 not null
)
;
comment on table CPIC_SXDX.C_TASK_STATUS
  is '����״̬����


��ӦTaskToken.java�С�TASK_STATUS����ͷ�ĳ���

	public static final Long TASK_STATUS_WAITINGASIGN=new Long(100);  //������
	public static final Long TASK_STATUS_WAITINGACCEPT=new Long(101); //������
	public static final Long TASK_STATUS_ACCEPTDEALING=new Long(102); //������
	public static final Long TASK_STATUS_DEALING=new Long(103);       //����
	public static final Long TASK_STATUS_RECALL=new Long(104);        //�غ�
	public static final Long TASK_STATUS_SUCCESS=new Long(105);       //�ɹ�
	public static final Long TASK_STATUS_FAIL=new Long(106);          //ʧ��
	public static final Long TASK_STATUS_CANCEL=new Long(107);        //ȡ��
	public static final Long TASK_STATUS_OTHER=new Long(108);         //����
	public static final Long TASK_STATUS_BACK=new Long(109);          //�˻أ��˻ص�������
	public static final Long TASK_STATUS_FINISH=new Long(110);        //���


����С���ﲻ��ѡ���״̬�У������䡢�����ա�ȡ��';
comment on column CPIC_SXDX.C_TASK_STATUS.taskstatusid
  is '״̬���,�ֹ����룬��ֵ��

�����ţ�
101��������
102��������        ��ע���·����ָ����ϯ������
103������
104���غ�
105�����������߹�������
106���ɹ�
107��ʧ��';
comment on column CPIC_SXDX.C_TASK_STATUS.isdel
  is '�Ƿ�ɾ����1�ǡ�0��Ĭ�ϣ�';
comment on column CPIC_SXDX.C_TASK_STATUS.name
  is '����״̬';
comment on column CPIC_SXDX.C_TASK_STATUS.remark
  is '��ע';
comment on column CPIC_SXDX.C_TASK_STATUS.disorder
  is '�����ֶ�';
alter table CPIC_SXDX.C_TASK_STATUS
  add constraint PK_C_TASK_STATUS primary key (TASKSTATUSID);

prompt
prompt Creating table C_TASK_STATUS_CHILD
prompt ==================================
prompt
create table CPIC_SXDX.C_TASK_STATUS_CHILD
(
  taskstatuschildid NUMBER(4) not null,
  taskstatusid      NUMBER(4) not null,
  tasktypeid        VARCHAR2(32) not null,
  name              VARCHAR2(32) not null,
  isdel             NUMBER(1) default 0 not null,
  tenementid        NUMBER(4) not null,
  disorder          NUMBER(4) default 0 not null,
  remark            VARCHAR2(64)
)
;
comment on table CPIC_SXDX.C_TASK_STATUS_CHILD
  is '����״̬������״̬

��ſ��Զ���';
comment on column CPIC_SXDX.C_TASK_STATUS_CHILD.taskstatuschildid
  is '��״̬��š�';
comment on column CPIC_SXDX.C_TASK_STATUS_CHILD.taskstatusid
  is '״̬���';
comment on column CPIC_SXDX.C_TASK_STATUS_CHILD.tasktypeid
  is '�������

��Ӧ������
TaskToken.java���ԡ�TASK_TYPE_����ͷ�ĳ���10�����Ӫ��
TaskToken.java���ԡ�TASK_TYPE_����ͷ�ĳ���';
comment on column CPIC_SXDX.C_TASK_STATUS_CHILD.name
  is '����


���ơ��������״̬���⻧������Ψһ��';
comment on column CPIC_SXDX.C_TASK_STATUS_CHILD.isdel
  is '�Ƿ�ɾ����1�ǡ�0��(Ĭ��)';
comment on column CPIC_SXDX.C_TASK_STATUS_CHILD.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_TASK_STATUS_CHILD.disorder
  is '����';
comment on column CPIC_SXDX.C_TASK_STATUS_CHILD.remark
  is '��ע';
alter table CPIC_SXDX.C_TASK_STATUS_CHILD
  add constraint PK_C_TASK_STATUS_CHILD primary key (TASKSTATUSCHILDID);
alter table CPIC_SXDX.C_TASK_STATUS_CHILD
  add constraint FK_C_TASK_S_RELATIONS_C_TASK_S foreign key (TASKSTATUSID)
  references CPIC_SXDX.C_TASK_STATUS (TASKSTATUSID);

prompt
prompt Creating table C_OB_TOPIC
prompt =========================
prompt
create table CPIC_SXDX.C_OB_TOPIC
(
  topicid      NUMBER(10) not null,
  name         VARCHAR2(32) not null,
  tenementid   NUMBER(4) not null,
  createuserid VARCHAR2(32),
  createdate   DATE,
  isdel        NUMBER(4) not null
)
;
comment on table CPIC_SXDX.C_OB_TOPIC
  is 'Ӫ������

�����c_ob_compaign_top�������й�����¼������ɾ�����������������ɾ����';
comment on column CPIC_SXDX.C_OB_TOPIC.topicid
  is '������';
comment on column CPIC_SXDX.C_OB_TOPIC.name
  is '��������';
comment on column CPIC_SXDX.C_OB_TOPIC.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_OB_TOPIC.createuserid
  is '�����û�';
comment on column CPIC_SXDX.C_OB_TOPIC.createdate
  is '����ʱ��';
comment on column CPIC_SXDX.C_OB_TOPIC.isdel
  is '1��.0��Ĭ�ϣ�';
alter table CPIC_SXDX.C_OB_TOPIC
  add constraint PK_OB_TOPIC primary key (TOPICID);

prompt
prompt Creating table C_OB_COMPAIGN
prompt ============================
prompt
create table CPIC_SXDX.C_OB_COMPAIGN
(
  compaignid   NUMBER(10) not null,
  name         VARCHAR2(32) not null,
  busitype     VARCHAR2(32) not null,
  groupid      VARCHAR2(32) not null,
  executetype  NUMBER(1) not null,
  contacttype  VARCHAR2(10) not null,
  begindate    DATE not null,
  enddate      DATE not null,
  topicid      NUMBER(10),
  tenementid   NUMBER(4) not null,
  maxdialcount NUMBER(1) not null,
  isdel        NUMBER(1) default 0 not null,
  createdate   DATE not null,
  createuserid VARCHAR2(32) not null,
  updatedate   DATE not null,
  updateuserid VARCHAR2(32) not null
)
;
comment on table CPIC_SXDX.C_OB_COMPAIGN
  is 'Ӫ�����';
comment on column CPIC_SXDX.C_OB_COMPAIGN.compaignid
  is '����';
comment on column CPIC_SXDX.C_OB_COMPAIGN.name
  is '�����';
comment on column CPIC_SXDX.C_OB_COMPAIGN.busitype
  is 'ҵ�����ͣ���״��

�����ֵ䣺

parentId=busiType';
comment on column CPIC_SXDX.C_OB_COMPAIGN.groupid
  is '��������� v_group';
comment on column CPIC_SXDX.C_OB_COMPAIGN.executetype
  is 'ִ�з�ʽ
1.Ԥ��ʽ���
2.Ԥ�������

��Ӧ��CompaignToken.java������EXECUTE_TYPE_PREVIEW��EXECUTE_TYPE_PREDICT';
comment on column CPIC_SXDX.C_OB_COMPAIGN.contacttype
  is 'ִ��������������ʽ��C_contact_type��  �ɳ����ࣺContactTypeFactoryToken.java�С�CONTACT_TYPE_"ͷ�ĳ�����ʾ';
comment on column CPIC_SXDX.C_OB_COMPAIGN.begindate
  is '��Ч��ʼʱ�䣬��ȷ���ա�

ԭ�ͣ�[]��[]  []�� []��  (�ꡢ�¡���������)
��������գ���Ϊÿ���µ�1��.�ꡢ�±��䣬��Ĭ��Ϊ��ǰ�ꡣ';
comment on column CPIC_SXDX.C_OB_COMPAIGN.enddate
  is '��Ч����ʱ�䣬��ȷ���ա�

ԭ�ͣ�[]��[]  []�� []��  (�ꡢ�¡���������)
��������գ���Ϊÿ���µ����һ�졣
�ꡢ�±��䣬��Ĭ��Ϊ��ǰ�ꡣ';
comment on column CPIC_SXDX.C_OB_COMPAIGN.topicid
  is '�ʾ������';
comment on column CPIC_SXDX.C_OB_COMPAIGN.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_OB_COMPAIGN.maxdialcount
  is '��󲦴������
Ĭ��1��Ԥ��ʽ�����Ч��';
comment on column CPIC_SXDX.C_OB_COMPAIGN.isdel
  is '�Ƿ�ɾ����1�ǡ�0��Ĭ�ϣ�';
comment on column CPIC_SXDX.C_OB_COMPAIGN.createdate
  is '����ʱ��';
comment on column CPIC_SXDX.C_OB_COMPAIGN.createuserid
  is '�����û�';
comment on column CPIC_SXDX.C_OB_COMPAIGN.updatedate
  is '����ʱ��';
comment on column CPIC_SXDX.C_OB_COMPAIGN.updateuserid
  is '�����û�';
alter table CPIC_SXDX.C_OB_COMPAIGN
  add constraint PK_C_OB_COMPAIGN primary key (COMPAIGNID);
alter table CPIC_SXDX.C_OB_COMPAIGN
  add constraint FK_C_OB_COM_RELATIONS_C_OB_TOP foreign key (TOPICID)
  references CPIC_SXDX.C_OB_TOPIC (TOPICID);

prompt
prompt Creating table C_TASK
prompt =====================
prompt
create table CPIC_SXDX.C_TASK
(
  taskid            NUMBER(10) not null,
  compaignid        NUMBER(10),
  cus_id            NUMBER(10),
  datalistid        NUMBER(10),
  fromuserid        VARCHAR2(32),
  fromdate          DATE,
  tenementid        NUMBER(4),
  togroupid         VARCHAR2(20),
  touserid          VARCHAR2(32),
  isbook            NUMBER(1) default 0 not null,
  bookdatetime      DATE,
  contacttype       VARCHAR2(10),
  fromtaskid        NUMBER(10),
  dealcount         NUMBER(4) default 0 not null,
  tasktypeid        VARCHAR2(32) not null,
  busisource        VARCHAR2(32) not null,
  busitype          VARCHAR2(32) not null,
  taskstatusid      NUMBER(4) not null,
  taskstatuschildid NUMBER(4),
  createdate        DATE not null,
  createuserid      VARCHAR2(32) not null,
  begindatetime     DATE not null,
  enddatetime       DATE not null,
  iscaseorder       NUMBER(1) default 0 not null,
  lastcallhistoryid NUMBER(10),
  summary           VARCHAR2(256)
)
;
comment on table CPIC_SXDX.C_TASK
  is '��������ڻ���ϵͳ�У����������С�ᡣ


����
tenementid
compaignId
isbook
taskTypeId
busiType
taskStatusId
taskStatuschildId
userId


�������
���Ӫ����ִ�����Ӫ����ר����������֮�以ת��ֻ���ڵ�ǰ����¡�
��������������������Ϊ��������������Խ�����ת�����������������¡������񲻿��������ҵ�������



�����絯���뵱ǰ�������ύС�����������ʱ��
���жϲ���getcurrentCallHistoryId()�Ƿ�Ϊ�ա������Ϊ�գ��򴴽���ϵ��c_callhistory_task��ϵ��';
comment on column CPIC_SXDX.C_TASK.taskid
  is '������';
comment on column CPIC_SXDX.C_TASK.compaignid
  is '���ţ������c_ob_compaign�е�������CAMPAIGNID';
comment on column CPIC_SXDX.C_TASK.cus_id
  is '���';
comment on column CPIC_SXDX.C_TASK.datalistid
  is '�����б���';
comment on column CPIC_SXDX.C_TASK.fromuserid
  is '�����û�';
comment on column CPIC_SXDX.C_TASK.fromdate
  is '����ʱ��';
comment on column CPIC_SXDX.C_TASK.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_TASK.togroupid
  is '���Ϊָ���û������û���Ϊ�û���Ӧ��Ĭ���û��顣

��Ӧv_group��ͼ�е������';
comment on column CPIC_SXDX.C_TASK.touserid
  is '�����û�Id�������ֵΪ�գ�������ȫ�顣';
comment on column CPIC_SXDX.C_TASK.isbook
  is '�Ƿ���ԤԼ';
comment on column CPIC_SXDX.C_TASK.bookdatetime
  is 'ԤԼʱ�䡣��ȷ��ʱ���롣';
comment on column CPIC_SXDX.C_TASK.contacttype
  is '������ʽ��C_contact_type��  �ɳ����ࣺContactTypeFactoryToken.java�С�CONTACT_TYPE_"ͷ�ĳ�����ʾ';
comment on column CPIC_SXDX.C_TASK.fromtaskid
  is '����Դ��ţ�����������c_ob_compaign�е�������CAMPAIGNID';
comment on column CPIC_SXDX.C_TASK.dealcount
  is '�������';
comment on column CPIC_SXDX.C_TASK.tasktypeid
  is '�������

��Ӧ������
TaskToken.java���ԡ�TASK_TYPE_����ͷ�ĳ���10�����Ӫ��
TaskToken.java���ԡ�TASK_TYPE_����ͷ�ĳ���11������������

������չ';
comment on column CPIC_SXDX.C_TASK.busisource
  is '������Դ

�����ֵ䣺

parentId=busiSource  ������Դ
';
comment on column CPIC_SXDX.C_TASK.busitype
  is 'ҵ�����ͣ���״��

�����ֵ䣺

parentId=busiType';
comment on column CPIC_SXDX.C_TASK.taskstatusid
  is '״̬���


����С���ﲻ��ѡ���״̬�У������䡢�����ա�ȡ��';
comment on column CPIC_SXDX.C_TASK.taskstatuschildid
  is '��״̬���';
comment on column CPIC_SXDX.C_TASK.createdate
  is '���񴴽�ʱ��';
comment on column CPIC_SXDX.C_TASK.createuserid
  is '���񴴽��û�';
comment on column CPIC_SXDX.C_TASK.begindatetime
  is '��ʼʱ��';
comment on column CPIC_SXDX.C_TASK.enddatetime
  is '��ֹʱ��';
comment on column CPIC_SXDX.C_TASK.iscaseorder
  is '�Ƿ���������򶩵�
1�ǡ�0��Ĭ�ϣ�';
comment on column CPIC_SXDX.C_TASK.lastcallhistoryid
  is '���·�����ʷ���';
comment on column CPIC_SXDX.C_TASK.summary
  is '��������';
alter table CPIC_SXDX.C_TASK
  add constraint PK_C_TASK primary key (TASKID);
alter table CPIC_SXDX.C_TASK
  add constraint FK_C_TASK_RELATIONS_C_OB_COM foreign key (COMPAIGNID)
  references CPIC_SXDX.C_OB_COMPAIGN (COMPAIGNID);
alter table CPIC_SXDX.C_TASK
  add constraint FK_TASKSTATUS_TASK foreign key (TASKSTATUSID)
  references CPIC_SXDX.C_TASK_STATUS (TASKSTATUSID);
alter table CPIC_SXDX.C_TASK
  add constraint FK_TASK_TASKSTATUSCHILDID foreign key (TASKSTATUSCHILDID)
  references CPIC_SXDX.C_TASK_STATUS_CHILD (TASKSTATUSCHILDID);

prompt
prompt Creating table C_CALLHISTORY_TASK
prompt =================================
prompt
create table CPIC_SXDX.C_CALLHISTORY_TASK
(
  id            NUMBER(10) not null,
  callhistoryid NUMBER(10) not null,
  taskid        NUMBER(10) not null
)
;
comment on table CPIC_SXDX.C_CALLHISTORY_TASK
  is '��ʷ�������ϵ��';
comment on column CPIC_SXDX.C_CALLHISTORY_TASK.id
  is '�������';
comment on column CPIC_SXDX.C_CALLHISTORY_TASK.callhistoryid
  is '������ʷ���';
comment on column CPIC_SXDX.C_CALLHISTORY_TASK.taskid
  is '������� c_TASK_bas�����';
alter table CPIC_SXDX.C_CALLHISTORY_TASK
  add constraint PK_C_CALLHISTORY_TASK primary key (ID);
alter table CPIC_SXDX.C_CALLHISTORY_TASK
  add constraint UNIQUE_CALLHISTORY_TASK unique (TASKID, CALLHISTORYID);
alter table CPIC_SXDX.C_CALLHISTORY_TASK
  add constraint FK_CALLHISTORY_TASK foreign key (CALLHISTORYID)
  references CPIC_SXDX.C_CALLHISTORY (CALLHISTORYID);
alter table CPIC_SXDX.C_CALLHISTORY_TASK
  add constraint FK_CALLHISTORY_TASK_TASK foreign key (TASKID)
  references CPIC_SXDX.C_TASK (TASKID);

prompt
prompt Creating table C_CASE_LOG
prompt =========================
prompt
create table CPIC_SXDX.C_CASE_LOG
(
  caselogid       NUMBER(10) not null,
  caseid          NUMBER(10),
  fromgroupid     VARCHAR2(20),
  fromuserid      VARCHAR2(24),
  togroupid       VARCHAR2(20),
  touserid        VARCHAR2(24),
  casestatus      VARCHAR2(24) not null,
  tenementid      NUMBER(4),
  summary         VARCHAR2(128),
  changelog       VARCHAR2(256),
  exttablecontent VARCHAR2(1024),
  createdate      DATE,
  productid       NUMBER(10),
  cus_id          NUMBER(10),
  task_id         NUMBER(10),
  callhistoryid   NUMBER(10)
)
;
comment on table CPIC_SXDX.C_CASE_LOG
  is 'c_case_log';
comment on column CPIC_SXDX.C_CASE_LOG.caselogid
  is '������־���';
comment on column CPIC_SXDX.C_CASE_LOG.caseid
  is 'caseId';
comment on column CPIC_SXDX.C_CASE_LOG.fromgroupid
  is 'Դ��';
comment on column CPIC_SXDX.C_CASE_LOG.fromuserid
  is 'fromUserId';
comment on column CPIC_SXDX.C_CASE_LOG.togroupid
  is 'toGroupId';
comment on column CPIC_SXDX.C_CASE_LOG.touserid
  is 'toUserID';
comment on column CPIC_SXDX.C_CASE_LOG.casestatus
  is '����״̬


����״̬

�����ֵ䣺
parentId=caseStatus


���������ֵ�-->
����Ӧ���� flowstatustoken.java����caes_status��ͷ�ĳ�����
00��������
01��������
02��������
90�����
91��ȡ��';
comment on column CPIC_SXDX.C_CASE_LOG.tenementid
  is 'tenementid';
comment on column CPIC_SXDX.C_CASE_LOG.summary
  is '�������';
comment on column CPIC_SXDX.C_CASE_LOG.changelog
  is '�޸���־';
comment on column CPIC_SXDX.C_CASE_LOG.exttablecontent
  is '��չ��Ϣ���ݡ���ʽ��

fieldId���ֶ���������ֵ|
fieldId���ֶ���������ֵ|
fieldId���ֶ���������ֵ|
fieldId���ֶ���������ֵ|
fieldId���ֶ���������ֵ|';
comment on column CPIC_SXDX.C_CASE_LOG.createdate
  is '����ʱ��';
comment on column CPIC_SXDX.C_CASE_LOG.productid
  is '��Ʒ���';
comment on column CPIC_SXDX.C_CASE_LOG.cus_id
  is '�ͻ����';
comment on column CPIC_SXDX.C_CASE_LOG.task_id
  is '������';
comment on column CPIC_SXDX.C_CASE_LOG.callhistoryid
  is '������ʷ���';
alter table CPIC_SXDX.C_CASE_LOG
  add constraint PK_C_CASE_LOG primary key (CASELOGID);
alter table CPIC_SXDX.C_CASE_LOG
  add constraint FK_C_CASE_L_C_CASE_ foreign key (CASEID)
  references CPIC_SXDX.C_CASE_BAS (CASEID);

prompt
prompt Creating table C_CATEGORY_MAINOBJECT
prompt ====================================
prompt
create table CPIC_SXDX.C_CATEGORY_MAINOBJECT
(
  mainobjectid NUMBER(2) not null,
  name         VARCHAR2(64) not null,
  templateurl  VARCHAR2(64) not null
)
;
comment on table CPIC_SXDX.C_CATEGORY_MAINOBJECT
  is '�˵����ݶ�Ӧ�Ĳ��֡�
   1,''�������ϱߣ����ڴ��±�''
   2,''��������ߣ����ڴ��ұ�''
   3,''�������ұ�, ���ݴ����''';
comment on column CPIC_SXDX.C_CATEGORY_MAINOBJECT.mainobjectid
  is 'MAINOBJECTID';
comment on column CPIC_SXDX.C_CATEGORY_MAINOBJECT.name
  is '����';
comment on column CPIC_SXDX.C_CATEGORY_MAINOBJECT.templateurl
  is 'ģ���ļ�';
alter table CPIC_SXDX.C_CATEGORY_MAINOBJECT
  add constraint PK_C_CATEGORY_MAINOBJECT primary key (MAINOBJECTID);

prompt
prompt Creating table C_CATEGORY_PAGELAYOUT
prompt ====================================
prompt
create table CPIC_SXDX.C_CATEGORY_PAGELAYOUT
(
  pagelayoutid NUMBER(2) not null,
  name         VARCHAR2(32) not null,
  templateurl  VARCHAR2(64) not null
)
;
comment on table CPIC_SXDX.C_CATEGORY_PAGELAYOUT
  is 'ҳ��ģ��
1.  ������ϸҳ��һ�㣺��ҳΪ�б���ҳ��Ϊ��ϸҳ��
3.  ���Ӷ���ҳ����������Զ��TAB���Ӷ���Ҳ���Զ��)';
comment on column CPIC_SXDX.C_CATEGORY_PAGELAYOUT.pagelayoutid
  is 'ID';
comment on column CPIC_SXDX.C_CATEGORY_PAGELAYOUT.name
  is '����';
comment on column CPIC_SXDX.C_CATEGORY_PAGELAYOUT.templateurl
  is '���ģ��URL';
alter table CPIC_SXDX.C_CATEGORY_PAGELAYOUT
  add constraint PK_C_CATEGORY_PAGELAYOUT primary key (PAGELAYOUTID);

prompt
prompt Creating table C_CATEGORY_TYPE
prompt ==============================
prompt
create table CPIC_SXDX.C_CATEGORY_TYPE
(
  categorytypeid NUMBER(2) not null,
  name           VARCHAR2(64) not null,
  property       NUMBER(2) not null
)
;
comment on table CPIC_SXDX.C_CATEGORY_TYPE
  is 'Ŀ¼���ͱ�

1. �˵�
2. ����
3. ҳ��
4. ��ť
5. �����ֶ�
6. �Ӷ���
7. �ұ߲˵�
8. ��绰����ý��
9.�û���(��֯����)
11.֪ʶ��
10. �����˵�

20.�Ŀ¼��Ӧ�Ĳ˵��б�


   31.������ҳ����(��ѯ���)
   32.��ѯҳ�棨�߼���ѯ��
   33.��ҳ��


';
comment on column CPIC_SXDX.C_CATEGORY_TYPE.categorytypeid
  is 'ID';
comment on column CPIC_SXDX.C_CATEGORY_TYPE.name
  is '����';
comment on column CPIC_SXDX.C_CATEGORY_TYPE.property
  is '����  1�˵�,2 ����,9����, ��ӦcategoryTokenCATEGORYPROPERTY��ͷ�ĳ�����';
alter table CPIC_SXDX.C_CATEGORY_TYPE
  add constraint PK_C_CATEGORYTYPE primary key (CATEGORYTYPEID);

prompt
prompt Creating table C_CATEGORY
prompt =========================
prompt
create table CPIC_SXDX.C_CATEGORY
(
  categoryid         VARCHAR2(32) not null,
  parentid           VARCHAR2(32) not null,
  name               VARCHAR2(64) not null,
  categorytypeid     NUMBER(2),
  mainobjectid       NUMBER(2) default 1,
  pagelayoutid       NUMBER(2),
  remark             VARCHAR2(64),
  tag_img            VARCHAR2(64),
  isdel              NUMBER(1) default 0 not null,
  pageurl            VARCHAR2(128),
  isauthority        NUMBER(1) default 0 not null,
  disorder           VARCHAR2(32) not null,
  isactivity         NUMBER(1) default 0 not null,
  issystem           NUMBER(1) default 0 not null,
  isdefaultload      NUMBER(1) default 0 not null,
  updatedate         DATE,
  updateuser         VARCHAR2(32),
  isvalidate         NUMBER(1) default 1 not null,
  isgeneratepage     NUMBER(1),
  customstatus       NUMBER(1) default 0,
  onlyadminoperation NUMBER(1) default '0'
)
;
comment on table CPIC_SXDX.C_CATEGORY
  is '�˵�Ŀ¼��

parentid=categoryid=0����߲˵����ڵ㡣


categoryID=''99''��Ϊ�Ŀ¼���Ҽ��˵�����Ŀ��
categoryID=''98"��Ϊ������';
comment on column CPIC_SXDX.C_CATEGORY.categoryid
  is 'Ŀ¼�˵�id,ֻ������ֵ, ������д�κ��ַ�( �ַ�������׳��쳣)';
comment on column CPIC_SXDX.C_CATEGORY.parentid
  is '���ڵ�,��hibernateӳ��ʱΪString����';
comment on column CPIC_SXDX.C_CATEGORY.name
  is '����';
comment on column CPIC_SXDX.C_CATEGORY.categorytypeid
  is '�˵��ڵ�����

c_category_type��';
comment on column CPIC_SXDX.C_CATEGORY.mainobjectid
  is '�˵����ݵĲ��������
c_mainobject_layout';
comment on column CPIC_SXDX.C_CATEGORY.pagelayoutid
  is '�б�ҳ��Ĳ��������
C_Pagelayout';
comment on column CPIC_SXDX.C_CATEGORY.remark
  is '����';
comment on column CPIC_SXDX.C_CATEGORY.tag_img
  is '�˵�ͼ�꣨һ���˵����ã�;
';
comment on column CPIC_SXDX.C_CATEGORY.isdel
  is '�Ƿ�ɾ����
1Ϊɾ����Ĭ��Ϊ0��';
comment on column CPIC_SXDX.C_CATEGORY.pageurl
  is 'ҳ���URL����';
comment on column CPIC_SXDX.C_CATEGORY.isauthority
  is '�Ƿ���Ҫ��Ȩ��
�˵�һ��Ҫ��Ȩ��ҳ��ɸ��������������Ȩ�����
0ΪĬ�ϣ�1����һ��Ҫ��Ȩ��';
comment on column CPIC_SXDX.C_CATEGORY.disorder
  is '����';
comment on column CPIC_SXDX.C_CATEGORY.isactivity
  is '�Ƿ�֧�ֵ����лĿ¼
��Ĭ��0
1��';
comment on column CPIC_SXDX.C_CATEGORY.issystem
  is '�Ƿ�Ϊϵͳ�˵���
Ĭ��0,
��Ϊ"1"��
����������������⻧��������˵�����ϵͳ�˵�ֻ���г�������Ա����';
comment on column CPIC_SXDX.C_CATEGORY.isdefaultload
  is '�Ƿ��Զ����أ�

1�Զ����أ�
Ĭ��Ϊ0��

�����Ӷ�����Ч��
���Ϊ�Զ����أ���ishiglight=1��ҳ�潫�Զ����ء�
';
comment on column CPIC_SXDX.C_CATEGORY.updatedate
  is '����ʱ��';
comment on column CPIC_SXDX.C_CATEGORY.updateuser
  is '�����û�';
comment on column CPIC_SXDX.C_CATEGORY.isvalidate
  is '�Ƿ���Ч. 1��.  0�� (Ĭ��1), ֻ��Ϊ0�Ĳ˵��ſ����ڲ˵�������������ɾ��';
comment on column CPIC_SXDX.C_CATEGORY.customstatus
  is '�Զ���˵���״̬(:0,��ʼ��,1����)';
alter table CPIC_SXDX.C_CATEGORY
  add constraint PK_C_CATEGORY primary key (CATEGORYID);
alter table CPIC_SXDX.C_CATEGORY
  add constraint FK_C_CATEGO_CATEGORYT_C_CATEGO foreign key (CATEGORYTYPEID)
  references CPIC_SXDX.C_CATEGORY_TYPE (CATEGORYTYPEID);
alter table CPIC_SXDX.C_CATEGORY
  add constraint FK_C_CATEGO_CATMAINOB_C_MAINOB foreign key (MAINOBJECTID)
  references CPIC_SXDX.C_CATEGORY_MAINOBJECT (MAINOBJECTID);
alter table CPIC_SXDX.C_CATEGORY
  add constraint FK_C_CATEGO_CATPAGELA_C_PAGELA foreign key (PAGELAYOUTID)
  references CPIC_SXDX.C_CATEGORY_PAGELAYOUT (PAGELAYOUTID);

prompt
prompt Creating table C_CATEGORY_ID
prompt ============================
prompt
create table CPIC_SXDX.C_CATEGORY_ID
(
  categoryid VARCHAR2(32) not null
)
;
comment on table CPIC_SXDX.C_CATEGORY_ID
  is '��������categoryId��λ�����򣺲�������c_category���п���ͨ���ñ�ȡ����';
alter table CPIC_SXDX.C_CATEGORY_ID
  add constraint PK_C_CATEGORY_ID primary key (CATEGORYID);

prompt
prompt Creating table C_CATEGORY_TENEMENT
prompt ==================================
prompt
create table CPIC_SXDX.C_CATEGORY_TENEMENT
(
  categoryid VARCHAR2(32) not null,
  tenementid NUMBER(4) not null
)
;
comment on table CPIC_SXDX.C_CATEGORY_TENEMENT
  is '����tenement=0�Ĳ˵���ֻ���¼�˵������ҳ��ɡ��������ݡ���ť�ȹ�ϵ���ؽ���';
comment on column CPIC_SXDX.C_CATEGORY_TENEMENT.categoryid
  is 'C_CATEGORY���
һ��00Ϊһ���˵���0000Ϊ�����˵���000000Ϊ�����˵����Դ����ƣ�
�������ڻĿ¼����faq�ȣ�һ���˵�����λ������ 000��';
comment on column CPIC_SXDX.C_CATEGORY_TENEMENT.tenementid
  is 'C_TENEMENT�����';
alter table CPIC_SXDX.C_CATEGORY_TENEMENT
  add constraint PK_C_CATEGORY_TENEMENT primary key (CATEGORYID, TENEMENTID);

prompt
prompt Creating table C_USER
prompt =====================
prompt
create table CPIC_SXDX.C_USER
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
  max_lists         NUMBER(4) default 0,
  agentid           VARCHAR2(20),
  skill_id          NUMBER(10),
  create_user       VARCHAR2(24),
  create_time       DATE,
  isfreeze          NUMBER(1) default 0
)
;
comment on table CPIC_SXDX.C_USER
  is '�û���
1.  ��������Ա���Բ鿴���е��û�����.
4. ϵͳ��ֻ����һ����������Ա.
';
comment on column CPIC_SXDX.C_USER.userid
  is '����,��ʽΪ(ΪtenmentId+"_"+loginId)';
comment on column CPIC_SXDX.C_USER.loginid
  is '��¼�ʺš�';
comment on column CPIC_SXDX.C_USER.employeename
  is '�û���������Ա��Ϣ�еĹ�Ա����';
comment on column CPIC_SXDX.C_USER.password
  is '����';
comment on column CPIC_SXDX.C_USER.isdel
  is '1��ɾ����0��ɾ����
Ĭ��0';
comment on column CPIC_SXDX.C_USER.defaultlanguage
  is '��ǰʹ�õĵ�¼���ԣ�Ŀǰֻ��zh_CN.
�ֵ䣺parent=SYSTEM_LANGUAGE  ϵͳ�ֵ�';
comment on column CPIC_SXDX.C_USER.issuperadmin
  is '�Ƿ�Ϊ��������Ա(�ɿ������еĲ˵��������⻧���������Ƶ�)
��Ϊ0
��Ϊ1. ';
comment on column CPIC_SXDX.C_USER.updatedate
  is '����ʱ��
';
comment on column CPIC_SXDX.C_USER.updateuserid
  is '�����ʺ�';
comment on column CPIC_SXDX.C_USER.employeeid
  is 'C_EMPLOYEE���';
comment on column CPIC_SXDX.C_USER.defaulttenementid
  is 'Ĭ���⻧���(��ǰѡ�е��⻧)';
comment on column CPIC_SXDX.C_USER.defaultgroupid
  is 'Ĭ���û���';
comment on column CPIC_SXDX.C_USER.org_id
  is '����ID';
comment on column CPIC_SXDX.C_USER.workplace_id
  is 'ְ��������е�ְ�����';
comment on column CPIC_SXDX.C_USER.sale_channel
  is '��������';
comment on column CPIC_SXDX.C_USER.max_lists
  is '���������';
comment on column CPIC_SXDX.C_USER.agentid
  is 'AGENTID';
comment on column CPIC_SXDX.C_USER.skill_id
  is '������ID';
comment on column CPIC_SXDX.C_USER.create_user
  is '������';
comment on column CPIC_SXDX.C_USER.create_time
  is '����ʱ��';
comment on column CPIC_SXDX.C_USER.isfreeze
  is '0��������1���ᡣ
Ĭ��0';
alter table CPIC_SXDX.C_USER
  add constraint PK_C_USER primary key (USERID);
alter table CPIC_SXDX.C_USER
  add constraint CKC_DEFAULTLANGUAGE_C_USER
  check (DEFAULTLANGUAGE is null or (DEFAULTLANGUAGE in ('zh_CN')));

prompt
prompt Creating table C_TENEMENT
prompt =========================
prompt
create table CPIC_SXDX.C_TENEMENT
(
  tenementid    NUMBER(4) not null,
  name          VARCHAR2(64) not null,
  isdel         NUMBER(1) default 0 not null,
  remark        VARCHAR2(128),
  isdefault     NUMBER(1) not null,
  groupid       VARCHAR2(32),
  adminuserid   VARCHAR2(32),
  updatedate    DATE,
  updateuserid  VARCHAR2(32),
  faqcategoryid VARCHAR2(32),
  code          VARCHAR2(16),
  customformid  VARCHAR2(32)
)
;
comment on table CPIC_SXDX.C_TENEMENT
  is '���⻧ά����


�涨�⻧Ϊ0��ΪĬ���⻧��
ϵͳֻ���ٴ���һ���⻧��';
comment on column CPIC_SXDX.C_TENEMENT.tenementid
  is '�⻧ID';
comment on column CPIC_SXDX.C_TENEMENT.name
  is '����';
comment on column CPIC_SXDX.C_TENEMENT.isdel
  is '�Ƿ�ɾ����1ɾ����0��ɾ����Ĭ��0��
���ɾ�������⻧�����е��û����ܵ�¼ϵͳ��

';
comment on column CPIC_SXDX.C_TENEMENT.remark
  is '��ע';
comment on column CPIC_SXDX.C_TENEMENT.isdefault
  is '�Ƿ�ΪĬ���⻧��
ֻ����һ��Ĭ���⻧��

1�ǡ�
0��Ĭ��0��';
comment on column CPIC_SXDX.C_TENEMENT.groupid
  is '�⻧��Ӧ��Ĭ���û���(��֯����)��';
comment on column CPIC_SXDX.C_TENEMENT.adminuserid
  is '1. �⻧����Ա';
comment on column CPIC_SXDX.C_TENEMENT.updatedate
  is '����ʱ��,��ȷ����';
comment on column CPIC_SXDX.C_TENEMENT.updateuserid
  is '�����û�';
comment on column CPIC_SXDX.C_TENEMENT.faqcategoryid
  is '֪ʶ��ID';
comment on column CPIC_SXDX.C_TENEMENT.code
  is '�⻧���';
comment on column CPIC_SXDX.C_TENEMENT.customformid
  is '���Ʊ���Ӧ��categoryId';
alter table CPIC_SXDX.C_TENEMENT
  add constraint PK_C_TENEMENT primary key (TENEMENTID);
alter table CPIC_SXDX.C_TENEMENT
  add constraint FK_C_TENEMENT_ADMINUSER foreign key (ADMINUSERID)
  references CPIC_SXDX.C_USER (USERID);
alter table CPIC_SXDX.C_TENEMENT
  add constraint FK_C_TENEMENT_FAQGROUPD foreign key (FAQCATEGORYID)
  references CPIC_SXDX.C_CATEGORY (CATEGORYID);
alter table CPIC_SXDX.C_TENEMENT
  add constraint FK_C_TENEMENT_GROUPID foreign key (GROUPID)
  references CPIC_SXDX.C_CATEGORY (CATEGORYID);

prompt
prompt Creating table C_CONTACT_ATTRIBUTE_TENEMENT
prompt ===========================================
prompt
create table CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT
(
  attributeid   NUMBER(5) not null,
  attributename VARCHAR2(32) not null,
  tenementid    NUMBER(4) not null,
  typecode      VARCHAR2(10) not null,
  isdel         NUMBER(1) default 0 not null,
  factorycode   VARCHAR2(32) not null,
  disorder      NUMBER(5) default 0 not null
)
;
comment on table CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT
  is '��������ϵ���ͣ������ͥ�绰...�칫�ʼ��ȣ�';
comment on column CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT.attributeid
  is '�������ʹ���';
comment on column CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT.attributename
  is '������������';
comment on column CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT.tenementid
  is '�⻧ID,  �⻧Ϊ��˵��Ϊ���õ�. ���ָ���⻧����typecode��Ӧ����ϵ��ʽ, ���ȡĬ�ϵ�';
comment on column CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT.typecode
  is '��������';
comment on column CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT.isdel
  is '1ɾ��. Ĭ��0';
comment on column CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT.factorycode
  is 'C_CONTACT_FACTORY���,�������';
comment on column CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT.disorder
  is '�����ֶ�';
alter table CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT
  add constraint PK_ATTRIBUTE_TENEMENT primary key (ATTRIBUTEID);
alter table CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT
  add constraint FK_ATTRIBUTE_CONTACTTYPE foreign key (TYPECODE)
  references CPIC_SXDX.C_CONTACT_TYPE (TYPECODE);
alter table CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT
  add constraint FK_ATTRIBUTE_FACTORYCODE foreign key (FACTORYCODE)
  references CPIC_SXDX.C_CONTACT_FACTORY (FACTORYCODE);
alter table CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT
  add constraint FK_ATTRIBUTE_TENEMENT foreign key (TENEMENTID)
  references CPIC_SXDX.C_TENEMENT (TENEMENTID);

prompt
prompt Creating table C_CONTACT_FACTORY_TENEMENT
prompt =========================================
prompt
create table CPIC_SXDX.C_CONTACT_FACTORY_TENEMENT
(
  tenementid  NUMBER(4),
  typecode    VARCHAR2(10),
  factorycode VARCHAR2(32),
  id          NUMBER(10) not null
)
;
comment on table CPIC_SXDX.C_CONTACT_FACTORY_TENEMENT
  is '�⻧��ý�������볧�̵Ĺ�ϵ��';
comment on column CPIC_SXDX.C_CONTACT_FACTORY_TENEMENT.tenementid
  is 'һ���⻧�£�һ�����͵�������Ӧһ������';
comment on column CPIC_SXDX.C_CONTACT_FACTORY_TENEMENT.typecode
  is ' c_contact_type���е�typecode�ֶ�';
comment on column CPIC_SXDX.C_CONTACT_FACTORY_TENEMENT.factorycode
  is 'C_CONTACT_FACTORY��factoryname�ֶ�';
comment on column CPIC_SXDX.C_CONTACT_FACTORY_TENEMENT.id
  is '���';
alter table CPIC_SXDX.C_CONTACT_FACTORY_TENEMENT
  add constraint PK_C_CONTACTTENEMENTFACTORY primary key (ID);
alter table CPIC_SXDX.C_CONTACT_FACTORY_TENEMENT
  add constraint UNIQUE_C_CONTACTFACTORY unique (TENEMENTID, TYPECODE, FACTORYCODE);
alter table CPIC_SXDX.C_CONTACT_FACTORY_TENEMENT
  add constraint FK_CONTACTENEMENT foreign key (TENEMENTID)
  references CPIC_SXDX.C_TENEMENT (TENEMENTID);
alter table CPIC_SXDX.C_CONTACT_FACTORY_TENEMENT
  add constraint FK_CONTACT_FACTORYCODE foreign key (FACTORYCODE)
  references CPIC_SXDX.C_CONTACT_FACTORY (FACTORYCODE);
alter table CPIC_SXDX.C_CONTACT_FACTORY_TENEMENT
  add constraint FK_CONTACT_TYPECODE foreign key (TYPECODE)
  references CPIC_SXDX.C_CONTACT_TYPE (TYPECODE);

prompt
prompt Creating table C_CONTACT_GROUP
prompt ==============================
prompt
create table CPIC_SXDX.C_CONTACT_GROUP
(
  groupid    NUMBER(10) not null,
  groupno    VARCHAR2(32) not null,
  tenementid NUMBER(4),
  name       VARCHAR2(32),
  isdel      NUMBER(1) default 0 not null,
  typecode   VARCHAR2(10)
)
;
comment on table CPIC_SXDX.C_CONTACT_GROUP
  is '����������';
comment on column CPIC_SXDX.C_CONTACT_GROUP.groupno
  is 'GROUPNO, ��Ӧ����Ϊ������';
comment on column CPIC_SXDX.C_CONTACT_GROUP.tenementid
  is '����';
comment on column CPIC_SXDX.C_CONTACT_GROUP.name
  is '����';
comment on column CPIC_SXDX.C_CONTACT_GROUP.isdel
  is 'Ĭ��0
1ɾ��';
comment on column CPIC_SXDX.C_CONTACT_GROUP.typecode
  is '�����ĸ���ϵ��������,���Ϊ����,��Ϊ������';
alter table CPIC_SXDX.C_CONTACT_GROUP
  add constraint PK_C_CONTACT_GROUP primary key (GROUPID);
alter table CPIC_SXDX.C_CONTACT_GROUP
  add constraint UNIQUE_C_CONTACT_GROUP unique (GROUPNO, TENEMENTID, TYPECODE);
alter table CPIC_SXDX.C_CONTACT_GROUP
  add constraint FK_GROUP_CONTACT_TYPE foreign key (TYPECODE)
  references CPIC_SXDX.C_CONTACT_TYPE (TYPECODE);

prompt
prompt Creating table C_CONTACT_GROUP_USER
prompt ===================================
prompt
create table CPIC_SXDX.C_CONTACT_GROUP_USER
(
  userid      VARCHAR2(32) not null,
  groupid     NUMBER(10) not null,
  tenementid  NUMBER(4) not null,
  groupuserid NUMBER(10) not null
)
;
comment on table CPIC_SXDX.C_CONTACT_GROUP_USER
  is '�û��ͼ������ϵ��';
comment on column CPIC_SXDX.C_CONTACT_GROUP_USER.userid
  is 'ϵͳ�ʻ����¼�ʻ���ͬ��Ψһ����
ֻ������ĸ������+�»���';
comment on column CPIC_SXDX.C_CONTACT_GROUP_USER.groupid
  is '��������';
comment on column CPIC_SXDX.C_CONTACT_GROUP_USER.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_CONTACT_GROUP_USER.groupuserid
  is '����';
alter table CPIC_SXDX.C_CONTACT_GROUP_USER
  add constraint PK_C_CONTACT_GROUP_USER primary key (GROUPUSERID);
alter table CPIC_SXDX.C_CONTACT_GROUP_USER
  add constraint UNIQUE_C_CONTACT_GROUP_USER unique (USERID, GROUPID);
alter table CPIC_SXDX.C_CONTACT_GROUP_USER
  add constraint FK_CONTACT_GROUP_GROUP foreign key (GROUPID)
  references CPIC_SXDX.C_CONTACT_GROUP (GROUPID);

prompt
prompt Creating table C_CONTACT_HISTORY
prompt ================================
prompt
create table CPIC_SXDX.C_CONTACT_HISTORY
(
  historyid       NUMBER(10) not null,
  typecode        VARCHAR2(10),
  calid           VARCHAR2(128),
  direct          NUMBER(1) not null,
  begintime       TIMESTAMP(6),
  endtime         TIMESTAMP(6),
  interval        NUMBER(10),
  taskid          NUMBER(10),
  cus_id          NUMBER(10),
  contact_id      NUMBER(10),
  person_id       NUMBER(10),
  customername    VARCHAR2(64),
  agent_dn        VARCHAR2(6),
  agent_contactno VARCHAR2(20),
  desc_contactno  NUMBER(5),
  userid          VARCHAR2(24)
)
;
comment on table CPIC_SXDX.C_CONTACT_HISTORY
  is '�Ӵ���ʷ';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.typecode
  is '�������ʹ���,contact_type_code������䳣��λ��ContactTypeFactoryToken.java�С�';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.calid
  is '����� typecode=voice,��calidΪcti��·���ݴ������ֵ(����¼������ʱ�ã�
����Ƕ�ý�壬��Ϊ��ý���ļ���Ӧ��·�����ļ�����

ԴID��¼��ΪcallId��
�ʼ���Email �ȣ��ٶ��ơ�';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.direct
  is '����
1����
2����

��Ӧ������TaskToken.java�е�CONTACT_DIRECT_INCOME
��Ӧ������TaskToken.java�е�CONTACT_DIRECT_OUTBOUND
';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.begintime
  is '��ʼʱ��';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.endtime
  is '����ʱ��';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.interval
  is 'ʱ��

��ʼʱ���ȥ����ʱ��ģ���λΪ�룩';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.taskid
  is '�������';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.cus_id
  is '�����C_CUS_BAS��cus_id';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.contact_id
  is '����';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.person_id
  is '��ϵ�˱�ţ�c_cus_contact����person_id�������ֶΡ�';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.customername
  is 'c_cus_bas���е�NAME';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.agent_dn
  is '�ֻ������뷽ʽΪ����ʱ��Ч��';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.agent_contactno
  is '��ϯ�˺���
typecode=voiceʱ��Ϊ����
typecode=emailʱ��Ϊ�ʼ���ַ
teypecode=msgʱ��Ϊ���ŵ�ַ
...';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.desc_contactno
  is '�Է�����ţ����Ϊ��������������Ϊ������_�������_�ֻ���  ���м���"_"���߻�������';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.userid
  is 'ϵͳ�û�ID';
create index CPIC_SXDX.RELATIONSHIP_34_FK on CPIC_SXDX.C_CONTACT_HISTORY (TASKID);
alter table CPIC_SXDX.C_CONTACT_HISTORY
  add constraint PK_C_CONTACT_HISTORY primary key (HISTORYID);

prompt
prompt Creating table C_CSR_AGENT_BUSYREASON
prompt =====================================
prompt
create table CPIC_SXDX.C_CSR_AGENT_BUSYREASON
(
  id         NUMBER(2) not null,
  tenementid NUMBER(4),
  name       VARCHAR2(32) not null,
  remark     VARCHAR2(64),
  reasoncode VARCHAR2(16) not null,
  isdel      NUMBER(1) default 0 not null
)
;
comment on table CPIC_SXDX.C_CSR_AGENT_BUSYREASON
  is '��ϯʾæԭ���ֵ��

1.С��
2.��ѵ
3.����
4.�Ͳ�';
comment on column CPIC_SXDX.C_CSR_AGENT_BUSYREASON.id
  is 'ID';
comment on column CPIC_SXDX.C_CSR_AGENT_BUSYREASON.tenementid
  is '����';
comment on column CPIC_SXDX.C_CSR_AGENT_BUSYREASON.name
  is '����';
comment on column CPIC_SXDX.C_CSR_AGENT_BUSYREASON.remark
  is '����';
comment on column CPIC_SXDX.C_CSR_AGENT_BUSYREASON.reasoncode
  is 'ԭ�����(ͬ����ϵͳCTI�ȵ�ԭ�����һ��';
comment on column CPIC_SXDX.C_CSR_AGENT_BUSYREASON.isdel
  is '0Ĭ�� 1ɾ��';
alter table CPIC_SXDX.C_CSR_AGENT_BUSYREASON
  add constraint PK_C_AGENT_BUSY_STATUS primary key (ID);

prompt
prompt Creating table C_CSR_DN_CLIENTIP
prompt ================================
prompt
create table CPIC_SXDX.C_CSR_DN_CLIENTIP
(
  id           NUMBER(10) not null,
  tenementid   NUMBER(4),
  dn           VARCHAR2(16),
  ip           VARCHAR2(32),
  updateuserid VARCHAR2(32),
  updatetime   DATE
)
;
comment on table CPIC_SXDX.C_CSR_DN_CLIENTIP
  is '�ֻ��ſͻ���IP�󶨹�ϵ�ֵ��';
comment on column CPIC_SXDX.C_CSR_DN_CLIENTIP.id
  is 'ID';
comment on column CPIC_SXDX.C_CSR_DN_CLIENTIP.tenementid
  is '����';
comment on column CPIC_SXDX.C_CSR_DN_CLIENTIP.dn
  is '�ֻ���';
comment on column CPIC_SXDX.C_CSR_DN_CLIENTIP.ip
  is '�ͻ���IP';
comment on column CPIC_SXDX.C_CSR_DN_CLIENTIP.updateuserid
  is 'UPDATEUSERID';
comment on column CPIC_SXDX.C_CSR_DN_CLIENTIP.updatetime
  is 'UPDATETIME';
alter table CPIC_SXDX.C_CSR_DN_CLIENTIP
  add constraint PK_C_DN_CLIENTIP primary key (ID);

prompt
prompt Creating table C_CUSRULE_INVALIDCONTACT
prompt =======================================
prompt
create table CPIC_SXDX.C_CUSRULE_INVALIDCONTACT
(
  excludeid   NUMBER(10) not null,
  attributeid NUMBER(5) not null,
  contactno   VARCHAR2(32) not null,
  ismobile    NUMBER(1) default 0,
  tenementid  NUMBER(4) not null
)
;
comment on table CPIC_SXDX.C_CUSRULE_INVALIDCONTACT
  is '�����ų�����Ч��ϵ���ݱ�';
comment on column CPIC_SXDX.C_CUSRULE_INVALIDCONTACT.excludeid
  is '���������ų����';
comment on column CPIC_SXDX.C_CUSRULE_INVALIDCONTACT.attributeid
  is '�������ʹ���.�⻧id.typecode.����code';
comment on column CPIC_SXDX.C_CUSRULE_INVALIDCONTACT.contactno
  is '�������룬��������Ϊ�绰ʱ���������Ź���Ϊ������_����_�ֻ���(�м����»��߷�)';
comment on column CPIC_SXDX.C_CUSRULE_INVALIDCONTACT.ismobile
  is '�Ƿ�Ϊ�ֻ���
Ĭ��0��1�ǡ�';
comment on column CPIC_SXDX.C_CUSRULE_INVALIDCONTACT.tenementid
  is '�⻧���';
alter table CPIC_SXDX.C_CUSRULE_INVALIDCONTACT
  add constraint PK_C_CUSRULE_INVALIDCONTACT primary key (EXCLUDEID);

prompt
prompt Creating table C_CUSRULE_UNIQUE
prompt ===============================
prompt
create table CPIC_SXDX.C_CUSRULE_UNIQUE
(
  uniqueid          NUMBER(10) not null,
  name              VARCHAR2(32) not null,
  table_id          NUMBER(10) not null,
  column_id         NUMBER(10) not null,
  table_entity_name VARCHAR2(32),
  field_entity_name VARCHAR2(32),
  tenementid        NUMBER(4) not null
)
;
comment on table CPIC_SXDX.C_CUSRULE_UNIQUE
  is '�ͻ�Ψһ���ų���';
comment on column CPIC_SXDX.C_CUSRULE_UNIQUE.name
  is 'Ψһ��˵��';
comment on column CPIC_SXDX.C_CUSRULE_UNIQUE.table_id
  is 'c_def_table���';
comment on column CPIC_SXDX.C_CUSRULE_UNIQUE.column_id
  is 'c_def_table_field���';
comment on column CPIC_SXDX.C_CUSRULE_UNIQUE.table_entity_name
  is '��Ӧc_def_table���е�entity_name�ֶε�ֵ��';
comment on column CPIC_SXDX.C_CUSRULE_UNIQUE.field_entity_name
  is '��Ӧc_def_table_field���е�entity_name�ֶε�ֵ';
comment on column CPIC_SXDX.C_CUSRULE_UNIQUE.tenementid
  is '�⻧ID';
alter table CPIC_SXDX.C_CUSRULE_UNIQUE
  add constraint PK_RULE_UNIQUE primary key (UNIQUEID);

prompt
prompt Creating table C_CUS_BAS
prompt ========================
prompt
create table CPIC_SXDX.C_CUS_BAS
(
  cus_id         NUMBER(10) not null,
  name           VARCHAR2(48),
  kind           NUMBER(1) not null,
  branchcode     VARCHAR2(16),
  extbranchcode  VARCHAR2(16),
  tenement_id    NUMBER(4),
  cus_level      VARCHAR2(32) default '-1' not null,
  code           VARCHAR2(36),
  gender         NUMBER(1) default 0 not null,
  birthday       DATE,
  certno         VARCHAR2(18),
  company        VARCHAR2(64),
  title_id       VARCHAR2(32),
  address        VARCHAR2(64),
  post_code      VARCHAR2(6),
  industry_id    VARCHAR2(32),
  isdel          NUMBER(1) default 0 not null,
  black_type_id  VARCHAR2(32) default '-1' not null,
  create_user_id VARCHAR2(32) not null,
  create_time    DATE not null,
  cert_type_id   VARCHAR2(32)
)
;
comment on table CPIC_SXDX.C_CUS_BAS
  is '�ͻ�������Ϣ��';
comment on column CPIC_SXDX.C_CUS_BAS.cus_id
  is '���';
comment on column CPIC_SXDX.C_CUS_BAS.name
  is '�ͻ�����';
comment on column CPIC_SXDX.C_CUS_BAS.kind
  is '�ͻ�����
1����ҵ�ͻ�
0�����˿ͻ�';
comment on column CPIC_SXDX.C_CUS_BAS.branchcode
  is '�ֹ�˾����Ӧ��c_group_property������Ϊ�ֹ�˾���û����Ӧ��BUSINESSCODE
';
comment on column CPIC_SXDX.C_CUS_BAS.extbranchcode
  is '֧��˾����Ӧ��c_group_property������Ϊ֧��˾���û����Ӧ��BUSINESSCODE
';
comment on column CPIC_SXDX.C_CUS_BAS.tenement_id
  is '�⻧�����c_tenement���⻧ID';
comment on column CPIC_SXDX.C_CUS_BAS.cus_level
  is '�ͻ������������ֵ�ά����
PARENT_ID=CUSTOMER_LEVEL
-1Ϊδ�ּ���

0.��׼�ͻ�
1.��Ҫ�ͻ�
2.VIP�ͻ�
3.��ͻ�';
comment on column CPIC_SXDX.C_CUS_BAS.code
  is '��ҵ�ڲ��Ŀͻ���ţ�';
comment on column CPIC_SXDX.C_CUS_BAS.gender
  is '�Ա�0��������(Ĭ��)��1Ů��2��
';
comment on column CPIC_SXDX.C_CUS_BAS.birthday
  is '����';
comment on column CPIC_SXDX.C_CUS_BAS.certno
  is '���֤��';
comment on column CPIC_SXDX.C_CUS_BAS.company
  is '��λ';
comment on column CPIC_SXDX.C_CUS_BAS.title_id
  is 'ְ��
PARENT_ID=CUSTOMER_TITLE';
comment on column CPIC_SXDX.C_CUS_BAS.address
  is 'ͨѶ��ַ';
comment on column CPIC_SXDX.C_CUS_BAS.post_code
  is '�ʱ�';
comment on column CPIC_SXDX.C_CUS_BAS.industry_id
  is '��ҵ�������ֵ�
PARENT_ID=CUSTOMER_INDUSTRY';
comment on column CPIC_SXDX.C_CUS_BAS.isdel
  is 'Ĭ��0��
1�ǡ�';
comment on column CPIC_SXDX.C_CUS_BAS.black_type_id
  is 'Ĭ��-1��
���������ͣ�
�����ֵ䣺
PARENT_ID=CUSTOMER_BLACKTYPE';
comment on column CPIC_SXDX.C_CUS_BAS.create_user_id
  is '�����ͻ�';
comment on column CPIC_SXDX.C_CUS_BAS.create_time
  is '����ʱ��';
comment on column CPIC_SXDX.C_CUS_BAS.cert_type_id
  is '֤������';
alter table CPIC_SXDX.C_CUS_BAS
  add constraint PK_C_CUS_BAS primary key (CUS_ID);

prompt
prompt Creating table C_CUS_BAS_TMP
prompt ============================
prompt
create table CPIC_SXDX.C_CUS_BAS_TMP
(
  cusid          NUMBER(10) not null,
  name           VARCHAR2(48),
  cus_kind       NUMBER(1) not null,
  branchcode     VARCHAR2(16),
  extbranchcode  VARCHAR2(16),
  tenementid     NUMBER(4),
  cus_level      VARCHAR2(32) default -1 not null,
  cuscode        VARCHAR2(36),
  gender         NUMBER(1) default 0 not null,
  birthday       DATE,
  cert_type_id   VARCHAR2(32),
  certno         VARCHAR2(18),
  company        VARCHAR2(64),
  title          VARCHAR2(32),
  address        VARCHAR2(64),
  postcode       NUMBER(6),
  industry       VARCHAR2(32),
  isdel          NUMBER(1) default 0 not null,
  blacktypeid    VARCHAR2(32) default -1 not null,
  createuserid   VARCHAR2(24) not null,
  createdatetime DATE not null
)
;
comment on table CPIC_SXDX.C_CUS_BAS_TMP
  is '�ͻ�������Ϣ��ʱ��';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.cusid
  is '���';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.name
  is '�ͻ�����';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.cus_kind
  is '�ͻ�����
1����ҵ�ͻ�
2�����˿ͻ�';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.branchcode
  is '�ֹ�˾����Ӧ��c_group_property������Ϊ�ֹ�˾���û����Ӧ��BUSINESSCODE
';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.extbranchcode
  is '֧��˾����Ӧ��c_group_property������Ϊ֧��˾���û����Ӧ��BUSINESSCODE
';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.tenementid
  is '�⻧�����c_tenement���⻧ID';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.cus_level
  is '�ͻ������������ֵ�ά����
PARENT_ID=CUSTOMER_LEVEL
-1Ϊδ�ּ���

0.��׼�ͻ�
1.��Ҫ�ͻ�
2.VIP�ͻ�
3.��ͻ�';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.cuscode
  is '��ҵ�ڲ��Ŀͻ���ţ�';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.gender
  is '�Ա�0��������(Ĭ��)��1Ů��2��
';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.birthday
  is '����';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.cert_type_id
  is '֤������';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.certno
  is '֤����';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.company
  is '��λ';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.title
  is 'ְ��
PARENT_ID=CUSTOMER_TITLE';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.address
  is 'ͨѶ��ַ';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.postcode
  is '�ʱ�';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.industry
  is '��ҵ�������ֵ�
PARENT_ID=CUSTOMER_INDUSTRY';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.isdel
  is 'Ĭ��0��
1�ǡ�';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.blacktypeid
  is 'Ĭ��-1��
���������ͣ�
�����ֵ䣺
PARENT_ID=CUSTOMER_BLACKTYPE';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.createuserid
  is '�����ͻ�';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.createdatetime
  is '����ʱ��';

prompt
prompt Creating table C_CUS_BLACKLIST
prompt ==============================
prompt
create table CPIC_SXDX.C_CUS_BLACKLIST
(
  blacklistid NUMBER(10) not null,
  cus_id      NUMBER(10) not null,
  tenementid  NUMBER(4) not null,
  used        VARCHAR2(32) not null,
  blacktype   VARCHAR2(32) not null
)
;
comment on table CPIC_SXDX.C_CUS_BLACKLIST
  is '�ͻ���������';
comment on column CPIC_SXDX.C_CUS_BLACKLIST.blacklistid
  is '����������';
comment on column CPIC_SXDX.C_CUS_BLACKLIST.cus_id
  is '�ͻ����';
comment on column CPIC_SXDX.C_CUS_BLACKLIST.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_CUS_BLACKLIST.used
  is '��������;�������ֵ�';
comment on column CPIC_SXDX.C_CUS_BLACKLIST.blacktype
  is '���������ͣ������ֵ�';
alter table CPIC_SXDX.C_CUS_BLACKLIST
  add constraint PK_CUS_BLACKLIST primary key (BLACKLISTID);
alter table CPIC_SXDX.C_CUS_BLACKLIST
  add constraint UNIQUE_CUS_BLACKLIST unique (CUS_ID, USED);

prompt
prompt Creating table C_CUS_CONTACT
prompt ============================
prompt
create table CPIC_SXDX.C_CUS_CONTACT
(
  contact_id    NUMBER(10) not null,
  cus_id        NUMBER(10),
  person_id     NUMBER(10),
  factorycode   VARCHAR2(32),
  often_use     NUMBER(1) default 0 not null,
  contactno     VARCHAR2(32),
  tenementid    NUMBER(4),
  is_moblile    NUMBER(1) default 0 not null,
  black_type_id VARCHAR2(32) default '-1' not null,
  flag          NUMBER(1) not null,
  typecode      VARCHAR2(10) not null,
  attr_id       NUMBER(5) not null
)
;
comment on table CPIC_SXDX.C_CUS_CONTACT
  is '�ͻ���������ϵ��Ϣ��';
comment on column CPIC_SXDX.C_CUS_CONTACT.contact_id
  is '����';
comment on column CPIC_SXDX.C_CUS_CONTACT.cus_id
  is '�ͻ����';
comment on column CPIC_SXDX.C_CUS_CONTACT.person_id
  is '�����˱��, ��Ӧc_cus_contact_person������';
comment on column CPIC_SXDX.C_CUS_CONTACT.factorycode
  is '���̴��룬�Լ�ʱ��Ϣ��΢�����á�c_contact_factory�����';
comment on column CPIC_SXDX.C_CUS_CONTACT.often_use
  is '�Ƿ�Ϊ��0��1�ǡ�Ĭ��0';
comment on column CPIC_SXDX.C_CUS_CONTACT.contactno
  is '�������� �绰���������Ϊ "����_����_�ֻ���"';
comment on column CPIC_SXDX.C_CUS_CONTACT.tenementid
  is '�⻧id';
comment on column CPIC_SXDX.C_CUS_CONTACT.is_moblile
  is '�Ƿ�Ϊ�ֻ���Ĭ��Ϊ0';
comment on column CPIC_SXDX.C_CUS_CONTACT.black_type_id
  is 'Ĭ��-1��
���������ͣ�
�����ֵ䣺
PARENT_ID=CUSTOMER_BLACKTYPE';
comment on column CPIC_SXDX.C_CUS_CONTACT.flag
  is '�����ʶ(0:Ĭ������������   1�����ڿͻ�)';
comment on column CPIC_SXDX.C_CUS_CONTACT.typecode
  is '��������';
comment on column CPIC_SXDX.C_CUS_CONTACT.attr_id
  is '������������ID';
create index CPIC_SXDX.RELATIONSHIP_120_FK on CPIC_SXDX.C_CUS_CONTACT (CUS_ID);
create index CPIC_SXDX.RELATIONSHIP_124_FK on CPIC_SXDX.C_CUS_CONTACT (PERSON_ID);
alter table CPIC_SXDX.C_CUS_CONTACT
  add constraint PK_C_CUS_CONTACT primary key (CONTACT_ID);
alter table CPIC_SXDX.C_CUS_CONTACT
  add constraint FK_FK_CONTACT_CONTACTARRRIBUTE foreign key (ATTR_ID)
  references CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT (ATTRIBUTEID);

prompt
prompt Creating table C_CUS_CONTACT_PERSON
prompt ===================================
prompt
create table CPIC_SXDX.C_CUS_CONTACT_PERSON
(
  person_id   NUMBER(10) not null,
  cus_id      NUMBER(10) not null,
  name        VARCHAR2(32) not null,
  gender      NUMBER(1),
  title_id    VARCHAR2(32),
  tenement_id NUMBER(4),
  birthday    DATE,
  flag        NUMBER(1) not null
)
;
comment on table CPIC_SXDX.C_CUS_CONTACT_PERSON
  is '��ϵ����Ϣ����ҵ�ͻ���';
comment on column CPIC_SXDX.C_CUS_CONTACT_PERSON.person_id
  is '�����˱��';
comment on column CPIC_SXDX.C_CUS_CONTACT_PERSON.cus_id
  is '�ͻ����';
comment on column CPIC_SXDX.C_CUS_CONTACT_PERSON.name
  is '����';
comment on column CPIC_SXDX.C_CUS_CONTACT_PERSON.gender
  is '�Ա��ֵ䣺

parent_code=gender

�Ա�0����    1��Ů

ϵͳ�ֵ�';
comment on column CPIC_SXDX.C_CUS_CONTACT_PERSON.title_id
  is 'ְ���ֵ�';
comment on column CPIC_SXDX.C_CUS_CONTACT_PERSON.tenement_id
  is '�⻧id';
comment on column CPIC_SXDX.C_CUS_CONTACT_PERSON.birthday
  is '����';
comment on column CPIC_SXDX.C_CUS_CONTACT_PERSON.flag
  is '0:Ĭ��  1�����ڿͻ�Ĭ��������';
create index CPIC_SXDX.RELATIONSHIP_121_FK on CPIC_SXDX.C_CUS_CONTACT_PERSON (CUS_ID);
alter table CPIC_SXDX.C_CUS_CONTACT_PERSON
  add constraint PK_C_CUS_CONTACT_PERSON primary key (PERSON_ID);

prompt
prompt Creating table C_CUS_CONTACT_RULE
prompt =================================
prompt
create table CPIC_SXDX.C_CUS_CONTACT_RULE
(
  id                     NUMBER(10) not null,
  contact_attribute_id   NUMBER(5) not null,
  contact_attribute_name VARCHAR2(32),
  tenementid             NUMBER(4) not null,
  isdel                  NUMBER(1),
  rule_name              VARCHAR2(32),
  table_name             VARCHAR2(32)
)
;
comment on table CPIC_SXDX.C_CUS_CONTACT_RULE
  is ' ';
comment on column CPIC_SXDX.C_CUS_CONTACT_RULE.id
  is '����ID';
comment on column CPIC_SXDX.C_CUS_CONTACT_RULE.contact_attribute_id
  is '���緽ʽ����ID';
comment on column CPIC_SXDX.C_CUS_CONTACT_RULE.contact_attribute_name
  is '���緽ʽ��������';
comment on column CPIC_SXDX.C_CUS_CONTACT_RULE.tenementid
  is '�⻧��';
comment on column CPIC_SXDX.C_CUS_CONTACT_RULE.isdel
  is '�Ƿ�ɾ��';
comment on column CPIC_SXDX.C_CUS_CONTACT_RULE.rule_name
  is '��������';
comment on column CPIC_SXDX.C_CUS_CONTACT_RULE.table_name
  is '������';
alter table CPIC_SXDX.C_CUS_CONTACT_RULE
  add constraint PK_CONTACT_RULE primary key (ID);

prompt
prompt Creating table C_CUS_EXT
prompt ========================
prompt
create table CPIC_SXDX.C_CUS_EXT
(
  cus_ext_id NUMBER(10) not null,
  cus_id     NUMBER(10) not null,
  code       VARCHAR2(32),
  name       VARCHAR2(32)
)
;
alter table CPIC_SXDX.C_CUS_EXT
  add constraint C_CUS_EXT_PK primary key (CUS_EXT_ID);

prompt
prompt Creating table C_CUS_EXT_TMP
prompt ============================
prompt
create table CPIC_SXDX.C_CUS_EXT_TMP
(
  cusid NUMBER(10) not null
)
;
comment on table CPIC_SXDX.C_CUS_EXT_TMP
  is '�ͻ���չ��Ϣ��ʱ��';
alter table CPIC_SXDX.C_CUS_EXT_TMP
  add constraint PK_C_CUS_EXT_TMP primary key (CUSID);

prompt
prompt Creating table C_CUS_LOG
prompt ========================
prompt
create table CPIC_SXDX.C_CUS_LOG
(
  cus_log_id     NUMBER not null,
  cus_id         NUMBER not null,
  tenement_id    NUMBER not null,
  update_content VARCHAR2(1024) not null,
  update_user_id VARCHAR2(32) not null,
  update_time    DATE not null
)
;
comment on column CPIC_SXDX.C_CUS_LOG.cus_log_id
  is '����';
comment on column CPIC_SXDX.C_CUS_LOG.cus_id
  is '�ͻ���Ϣ�����';
comment on column CPIC_SXDX.C_CUS_LOG.tenement_id
  is '�⻧���';
comment on column CPIC_SXDX.C_CUS_LOG.update_content
  is '�޸�����';
comment on column CPIC_SXDX.C_CUS_LOG.update_user_id
  is '�޸���';
comment on column CPIC_SXDX.C_CUS_LOG.update_time
  is '�޸�ʱ��';
alter table CPIC_SXDX.C_CUS_LOG
  add constraint PK_C_CUS_LOG primary key (CUS_LOG_ID);

prompt
prompt Creating table C_DATA_JOB_TYPE
prompt ==============================
prompt
create table CPIC_SXDX.C_DATA_JOB_TYPE
(
  jobtypeid NUMBER(5) not null,
  name      VARCHAR2(32),
  isdel     NUMBER(1) default 0
)
;
comment on table CPIC_SXDX.C_DATA_JOB_TYPE
  is '��������

1  ���ݵ���
2  ������ϴ
3  ���ݵ���';
comment on column CPIC_SXDX.C_DATA_JOB_TYPE.isdel
  is 'Ĭ��0
1ɾ����';
alter table CPIC_SXDX.C_DATA_JOB_TYPE
  add constraint PK_C_DATA_JOB_TYPE primary key (JOBTYPEID);

prompt
prompt Creating table C_DATA_MANAGE_TYPE
prompt =================================
prompt
create table CPIC_SXDX.C_DATA_MANAGE_TYPE
(
  datatypeid   NUMBER(1) not null,
  datatypename VARCHAR2(32)
)
;
comment on table CPIC_SXDX.C_DATA_MANAGE_TYPE
  is '���ݹ������

1.�ͻ����ݹ���';
comment on column CPIC_SXDX.C_DATA_MANAGE_TYPE.datatypeid
  is '�����';
comment on column CPIC_SXDX.C_DATA_MANAGE_TYPE.datatypename
  is '�������';
alter table CPIC_SXDX.C_DATA_MANAGE_TYPE
  add constraint PK_C_DATA_MANAGE_TYPE primary key (DATATYPEID);

prompt
prompt Creating table C_DATA_LIST
prompt ==========================
prompt
create table CPIC_SXDX.C_DATA_LIST
(
  datalistid   NUMBER(10) not null,
  datalistname VARCHAR2(32) not null,
  isdel        NUMBER(1) default 0 not null,
  createdate   DATE,
  userid       VARCHAR2(32),
  remark       VARCHAR2(128),
  datatypeid   NUMBER(1),
  tenementid   NUMBER(4),
  datasourceid NUMBER(10)
)
;
comment on table CPIC_SXDX.C_DATA_LIST
  is '���ݵ��������';
comment on column CPIC_SXDX.C_DATA_LIST.datalistid
  is '�б���';
comment on column CPIC_SXDX.C_DATA_LIST.datalistname
  is '�б�����';
comment on column CPIC_SXDX.C_DATA_LIST.isdel
  is 'Ĭ��0��1ɾ������';
comment on column CPIC_SXDX.C_DATA_LIST.createdate
  is '����ʱ��';
comment on column CPIC_SXDX.C_DATA_LIST.userid
  is '�����û�';
comment on column CPIC_SXDX.C_DATA_LIST.remark
  is '��ע';
comment on column CPIC_SXDX.C_DATA_LIST.datatypeid
  is '���ݹ��������
';
comment on column CPIC_SXDX.C_DATA_LIST.datasourceid
  is '����Դ';
create index CPIC_SXDX.RELATIONSHIP_44_FK on CPIC_SXDX.C_DATA_LIST (DATATYPEID);
alter table CPIC_SXDX.C_DATA_LIST
  add constraint PK_C_DATA_LIST primary key (DATALISTID);
alter table CPIC_SXDX.C_DATA_LIST
  add constraint FK_C_DATA_L_RELATIONS_C_DATA_M foreign key (DATATYPEID)
  references CPIC_SXDX.C_DATA_MANAGE_TYPE (DATATYPEID);

prompt
prompt Creating table C_DATA_JOB
prompt =========================
prompt
create table CPIC_SXDX.C_DATA_JOB
(
  jobtypeid   NUMBER(5),
  datajobid   NUMBER(10) not null,
  jobname     VARCHAR2(32),
  executedate DATE,
  isvalidate  NUMBER(1) default 0 not null,
  jobstatus   NUMBER(1) default 0 not null,
  userid      VARCHAR2(32),
  createdate  DATE,
  threadcount NUMBER(3),
  tenementid  NUMBER(4),
  datalistid  NUMBER(10)
)
;
comment on table CPIC_SXDX.C_DATA_JOB
  is '���ݹ�����ȱ�';
comment on column CPIC_SXDX.C_DATA_JOB.jobtypeid
  is '��������';
comment on column CPIC_SXDX.C_DATA_JOB.datajobid
  is '���ȱ��';
comment on column CPIC_SXDX.C_DATA_JOB.jobname
  is '��������';
comment on column CPIC_SXDX.C_DATA_JOB.executedate
  is 'ִ��ʱ��';
comment on column CPIC_SXDX.C_DATA_JOB.isvalidate
  is '1��Ч��Ĭ��0';
comment on column CPIC_SXDX.C_DATA_JOB.jobstatus
  is 'Ĭ��0��δִ�С�
1��ִ����
2����ִ��';
comment on column CPIC_SXDX.C_DATA_JOB.userid
  is '������
';
comment on column CPIC_SXDX.C_DATA_JOB.createdate
  is '����ʱ��';
comment on column CPIC_SXDX.C_DATA_JOB.threadcount
  is 'ͬʱִ�е��߳������ݶ�����Ϊ20��

��excel���ı��ļ���һ���ļ�һ���̡߳� �������ݿ⣬���������㡣';
comment on column CPIC_SXDX.C_DATA_JOB.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_DATA_JOB.datalistid
  is '���ݹ�����ID';
create index CPIC_SXDX.RELATIONSHIP_40_FK on CPIC_SXDX.C_DATA_JOB (JOBTYPEID);
create index CPIC_SXDX.RELATIONSHIP_43_FK on CPIC_SXDX.C_DATA_JOB (DATALISTID);
alter table CPIC_SXDX.C_DATA_JOB
  add constraint PK_C_DATE_JOB primary key (DATAJOBID);
alter table CPIC_SXDX.C_DATA_JOB
  add constraint FK_C_DATA_J_RELATIONS_C_DATA_J foreign key (JOBTYPEID)
  references CPIC_SXDX.C_DATA_JOB_TYPE (JOBTYPEID);
alter table CPIC_SXDX.C_DATA_JOB
  add constraint FK_C_DATA_J_RELATIONS_C_DATA_L foreign key (DATALISTID)
  references CPIC_SXDX.C_DATA_LIST (DATALISTID);

prompt
prompt Creating table C_DATA_LIST_CUS
prompt ==============================
prompt
create table CPIC_SXDX.C_DATA_LIST_CUS
(
  cus_id     NUMBER(10) not null,
  datalistid NUMBER(10) not null
)
;
comment on table CPIC_SXDX.C_DATA_LIST_CUS
  is '���ݵ����б���ͻ���ϵ��';
comment on column CPIC_SXDX.C_DATA_LIST_CUS.cus_id
  is '���';
comment on column CPIC_SXDX.C_DATA_LIST_CUS.datalistid
  is '�б���';
create index CPIC_SXDX.RELATIONSHIP_41_FK on CPIC_SXDX.C_DATA_LIST_CUS (DATALISTID);
alter table CPIC_SXDX.C_DATA_LIST_CUS
  add constraint PK_C_DATA_LIST_CUS primary key (CUS_ID, DATALISTID);
alter table CPIC_SXDX.C_DATA_LIST_CUS
  add constraint FK_C_DATA_L_RELATIONS_C_DATA_L foreign key (DATALISTID)
  references CPIC_SXDX.C_DATA_LIST (DATALISTID);

prompt
prompt Creating table C_DATA_LOG
prompt =========================
prompt
create table CPIC_SXDX.C_DATA_LOG
(
  datalogid    NUMBER(10) not null,
  totalcount   NUMBER(6),
  successcount NUMBER(6),
  failcount    NUMBER(6),
  userid       VARCHAR2(32),
  begindate    DATE,
  datalistid   NUMBER(10),
  longtime     NUMBER(4),
  enddate      DATE,
  tenementid   NUMBER(4),
  datajobid    NUMBER(10)
)
;
comment on table CPIC_SXDX.C_DATA_LOG
  is '���ݹ�����־';
comment on column CPIC_SXDX.C_DATA_LOG.datalogid
  is '��־���
';
comment on column CPIC_SXDX.C_DATA_LOG.totalcount
  is '�ܼ�¼��';
comment on column CPIC_SXDX.C_DATA_LOG.successcount
  is '�ɹ���';
comment on column CPIC_SXDX.C_DATA_LOG.failcount
  is 'ʧ����';
comment on column CPIC_SXDX.C_DATA_LOG.userid
  is '�û�';
comment on column CPIC_SXDX.C_DATA_LOG.begindate
  is '��ʼʱ��';
comment on column CPIC_SXDX.C_DATA_LOG.datalistid
  is '��������c_data_list�����';
comment on column CPIC_SXDX.C_DATA_LOG.longtime
  is 'ʱ��';
comment on column CPIC_SXDX.C_DATA_LOG.enddate
  is '����ʱ��';
comment on column CPIC_SXDX.C_DATA_LOG.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_DATA_LOG.datajobid
  is '���ڱ��,C_DATA_JOB�����';
alter table CPIC_SXDX.C_DATA_LOG
  add constraint PK_C_DATA_LOG primary key (DATALOGID);

prompt
prompt Creating table C_DATA_MANAGE_TABLE
prompt ==================================
prompt
create table CPIC_SXDX.C_DATA_MANAGE_TABLE
(
  datatypeid        NUMBER(1) not null,
  table_id          NUMBER(10),
  id                NUMBER(10) not null,
  table_code        VARCHAR2(32),
  table_entity_name VARCHAR2(32) not null,
  tenementid        NUMBER(4),
  isshare           NUMBER(1) not null,
  isparent          NUMBER(1) not null
)
;
comment on table CPIC_SXDX.C_DATA_MANAGE_TABLE
  is '���ݹ�������Ӧ�ı�ʵ����Ϣ';
comment on column CPIC_SXDX.C_DATA_MANAGE_TABLE.datatypeid
  is 'ҵ�������';
comment on column CPIC_SXDX.C_DATA_MANAGE_TABLE.table_id
  is '��Ӧc_def_table���е�table_id�ֶε�ֵ';
comment on column CPIC_SXDX.C_DATA_MANAGE_TABLE.table_code
  is '��Ӧc_def_table���е�table_code�ֶε�ֵ';
comment on column CPIC_SXDX.C_DATA_MANAGE_TABLE.table_entity_name
  is '��Ӧc_def_table���е�entity_name�ֶε�ֵ';
comment on column CPIC_SXDX.C_DATA_MANAGE_TABLE.tenementid
  is '�⻧';
comment on column CPIC_SXDX.C_DATA_MANAGE_TABLE.isshare
  is '���� 1������ 0��������';
comment on column CPIC_SXDX.C_DATA_MANAGE_TABLE.isparent
  is '�Ƿ񸸱� 1����  0����';
alter table CPIC_SXDX.C_DATA_MANAGE_TABLE
  add constraint PK_DATA_MANAGE_TABLE primary key (ID);
alter table CPIC_SXDX.C_DATA_MANAGE_TABLE
  add constraint FK_DATA_MANAGE_TYPE foreign key (DATATYPEID)
  references CPIC_SXDX.C_DATA_MANAGE_TYPE (DATATYPEID);

prompt
prompt Creating table C_SYS_DATASOURCE
prompt ===============================
prompt
create table CPIC_SXDX.C_SYS_DATASOURCE
(
  datasourceid      NUMBER(10) not null,
  sourcetypeid      VARCHAR2(15) not null,
  tenementid        NUMBER(4) not null,
  sourcename        VARCHAR2(32) not null,
  sourceip          VARCHAR2(24),
  sourceport        VARCHAR2(6),
  sourceuserid      VARCHAR2(16),
  sourcepassword    VARCHAR2(16),
  isdefault         NUMBER(1),
  module_code       VARCHAR2(32) not null,
  source_url        VARCHAR2(150) not null,
  database_name     VARCHAR2(50),
  driverclass       VARCHAR2(50),
  curr_sys_flag     NUMBER(1),
  isdel             NUMBER(1),
  isjndi            NUMBER(1),
  pool_timeout      NUMBER(4),
  testsql           VARCHAR2(400),
  datamanagetype_id NUMBER(1)
)
;
comment on table CPIC_SXDX.C_SYS_DATASOURCE
  is '�ͻ�����Դ

1.excel win2003 �汾����';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.datasourceid
  is '����Դ���';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.sourcetypeid
  is '��������,c_dictionary����parent_id="datasource"';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.sourcename
  is '����Դ����';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.sourceip
  is 'IP��ַ';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.sourceport
  is '�˿�';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.sourceuserid
  is '�û���';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.sourcepassword
  is '����';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.isdefault
  is '�Ƿ�ΪĬ�ϵ�����Դ 1��Ĭ�� 0��Ĭ��';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.module_code
  is 'ҵ�����';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.source_url
  is '����Դ��ַ';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.database_name
  is '���ݿ�����';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.driverclass
  is '������';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.curr_sys_flag
  is '�Ƿ������ڵ�ǰϵͳ 1���� 0���� Ĭ��';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.isdel
  is '�Ƿ�ɾ�� 1��ɾ�� 0��δɾ��(Ĭ��)';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.isjndi
  is '�Ƿ�ͨ��JNDI���� 1���� 0����(Ĭ��)';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.pool_timeout
  is '���ӳ�ʱʱ��';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.testsql
  is '����SQL���';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.datamanagetype_id
  is '����ҵ���������';
create index CPIC_SXDX.RELATIONSHIP_26_FK on CPIC_SXDX.C_SYS_DATASOURCE (SOURCETYPEID);
alter table CPIC_SXDX.C_SYS_DATASOURCE
  add constraint PK_C_DATA_SOURCE primary key (DATASOURCEID);

prompt
prompt Creating table C_DATA_MAP
prompt =========================
prompt
create table CPIC_SXDX.C_DATA_MAP
(
  sourcemapid             NUMBER(10) not null,
  datasourceid            NUMBER(10),
  desctable               VARCHAR2(128),
  desccolumn              VARCHAR2(32),
  sourcetable             VARCHAR2(50),
  sourcecolumn            VARCHAR2(32),
  isdict                  NUMBER(1) default 0 not null,
  column_id               NUMBER(10),
  entity_index            NUMBER(1),
  source_view_column_name VARCHAR2(50)
)
;
comment on table CPIC_SXDX.C_DATA_MAP
  is '�ͻ�����ӳ��';
comment on column CPIC_SXDX.C_DATA_MAP.sourcemapid
  is 'ӳ����';
comment on column CPIC_SXDX.C_DATA_MAP.datasourceid
  is '����Դ���';
comment on column CPIC_SXDX.C_DATA_MAP.desctable
  is 'Ŀ�����';
comment on column CPIC_SXDX.C_DATA_MAP.desccolumn
  is 'Դ����';
comment on column CPIC_SXDX.C_DATA_MAP.sourcetable
  is 'Ŀ���ֶ�';
comment on column CPIC_SXDX.C_DATA_MAP.sourcecolumn
  is 'Դ�ֶ�';
comment on column CPIC_SXDX.C_DATA_MAP.isdict
  is 'Ĭ��0��1�ǡ�';
comment on column CPIC_SXDX.C_DATA_MAP.column_id
  is 'c_def_table_column���';
comment on column CPIC_SXDX.C_DATA_MAP.entity_index
  is 'ʵ������';
comment on column CPIC_SXDX.C_DATA_MAP.source_view_column_name
  is 'Դ�ֶ�ҳ����ʾ����';
create index CPIC_SXDX.RELATIONSHIP_27_FK on CPIC_SXDX.C_DATA_MAP (DATASOURCEID);
alter table CPIC_SXDX.C_DATA_MAP
  add constraint PK_C_DATA_MAP primary key (SOURCEMAPID);
alter table CPIC_SXDX.C_DATA_MAP
  add constraint FK_C_DATA_M_RELATIONS_C_DATA_S foreign key (DATASOURCEID)
  references CPIC_SXDX.C_SYS_DATASOURCE (DATASOURCEID);

prompt
prompt Creating table C_DATA_MAP_DICT
prompt ==============================
prompt
create table CPIC_SXDX.C_DATA_MAP_DICT
(
  mapdictid   NUMBER(10) not null,
  sourcemapid NUMBER(10),
  descvalue   VARCHAR2(32),
  sourcevalue VARCHAR2(32),
  remark      VARCHAR2(64)
)
;
comment on table CPIC_SXDX.C_DATA_MAP_DICT
  is '�ͻ������ֵ�ӳ��';
comment on column CPIC_SXDX.C_DATA_MAP_DICT.sourcemapid
  is 'ӳ����';
comment on column CPIC_SXDX.C_DATA_MAP_DICT.descvalue
  is 'Ŀ��ֵ';
comment on column CPIC_SXDX.C_DATA_MAP_DICT.sourcevalue
  is 'Դֵ';
comment on column CPIC_SXDX.C_DATA_MAP_DICT.remark
  is '�ֶ�����';
create index CPIC_SXDX.RELATIONSHIP_28_FK on CPIC_SXDX.C_DATA_MAP_DICT (SOURCEMAPID);
alter table CPIC_SXDX.C_DATA_MAP_DICT
  add constraint PK_C_DATA_MAP_DICT primary key (MAPDICTID);
alter table CPIC_SXDX.C_DATA_MAP_DICT
  add constraint FK_C_DATA_M_RELATIONS_C_DATA_M foreign key (SOURCEMAPID)
  references CPIC_SXDX.C_DATA_MAP (SOURCEMAPID);

prompt
prompt Creating table C_DATA_REGEX
prompt ===========================
prompt
create table CPIC_SXDX.C_DATA_REGEX
(
  ruleid     NUMBER(10) not null,
  rulename   VARCHAR2(32),
  regex      VARCHAR2(64),
  tenementid NUMBER(4),
  isshare    NUMBER(1) default 0 not null
)
;
comment on table CPIC_SXDX.C_DATA_REGEX
  is '�������ݹ�����ʽ

0-100��
ΪԤ�����

100�Ժ�Ϊ������ʽ
100�����ڣ���ʽ��yyyy-mm-dd
101������ʱ�䣺yyyy-mm-dd hh:mi:ss
102�������ʼ�
103���̻�
104���ֻ�����
...';
comment on column CPIC_SXDX.C_DATA_REGEX.rulename
  is '��������';
comment on column CPIC_SXDX.C_DATA_REGEX.regex
  is '������������ʽ����id=1';
comment on column CPIC_SXDX.C_DATA_REGEX.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_DATA_REGEX.isshare
  is '�Ƿ�Ϊ������
1�ǡ�Ĭ��0';
alter table CPIC_SXDX.C_DATA_REGEX
  add constraint PK_C_DATA_REGEX primary key (RULEID);

prompt
prompt Creating table C_DATA_TEMPLATE
prompt ==============================
prompt
create table CPIC_SXDX.C_DATA_TEMPLATE
(
  templateid   NUMBER(10) not null,
  datatypeid   NUMBER(1) not null,
  templatename VARCHAR2(32) not null,
  createdate   DATE,
  userid       VARCHAR2(32),
  isdel        NUMBER(1) default 0 not null,
  tenementid   NUMBER(4) not null
)
;
comment on table CPIC_SXDX.C_DATA_TEMPLATE
  is '���ݹ���ģ�塣';
comment on column CPIC_SXDX.C_DATA_TEMPLATE.templateid
  is '����ģ����';
comment on column CPIC_SXDX.C_DATA_TEMPLATE.datatypeid
  is '�����';
comment on column CPIC_SXDX.C_DATA_TEMPLATE.templatename
  is 'ģ������';
comment on column CPIC_SXDX.C_DATA_TEMPLATE.createdate
  is '����ʱ��';
comment on column CPIC_SXDX.C_DATA_TEMPLATE.userid
  is '�����û�';
comment on column CPIC_SXDX.C_DATA_TEMPLATE.isdel
  is 'Ĭ��0��1ɾ����';
comment on column CPIC_SXDX.C_DATA_TEMPLATE.tenementid
  is '�⻧';
create index CPIC_SXDX.RELATIONSHIP_45_FK on CPIC_SXDX.C_DATA_TEMPLATE (DATATYPEID);
alter table CPIC_SXDX.C_DATA_TEMPLATE
  add constraint PK_C_DATA_TEMPLATE primary key (TEMPLATEID);
alter table CPIC_SXDX.C_DATA_TEMPLATE
  add constraint FK_C_DATA_T_RELATIONS_C_DATA_M foreign key (DATATYPEID)
  references CPIC_SXDX.C_DATA_MANAGE_TYPE (DATATYPEID);

prompt
prompt Creating table C_DATA_RULE
prompt ==========================
prompt
create table CPIC_SXDX.C_DATA_RULE
(
  cusruleid         NUMBER(10) not null,
  regexid           NUMBER(10),
  isnull            NUMBER(1),
  minvalue          VARCHAR2(5) default '0' not null,
  maxvalue          VARCHAR2(16),
  maxlength         VARCHAR2(8),
  minlength         VARCHAR2(8),
  defaultvalue      VARCHAR2(10) default '0' not null,
  column_id         NUMBER(10),
  table_id          NUMBER(10),
  templateid        NUMBER(10),
  table_entity_name VARCHAR2(32),
  field_entity_name VARCHAR2(32),
  tenementid        NUMBER(4) not null,
  datatype_id       VARCHAR2(32) not null
)
;
comment on table CPIC_SXDX.C_DATA_RULE
  is '�ͻ����ݹ���';
comment on column CPIC_SXDX.C_DATA_RULE.cusruleid
  is '�ͻ����ݹ�����';
comment on column CPIC_SXDX.C_DATA_RULE.regexid
  is '������������ʽ����id=1';
comment on column CPIC_SXDX.C_DATA_RULE.isnull
  is '�Ƿ�Ϊ�գ�';
comment on column CPIC_SXDX.C_DATA_RULE.minvalue
  is '��Сֵ��Ĭ��Ϊ0';
comment on column CPIC_SXDX.C_DATA_RULE.maxvalue
  is '���ֵ';
comment on column CPIC_SXDX.C_DATA_RULE.maxlength
  is '��������';
comment on column CPIC_SXDX.C_DATA_RULE.minlength
  is '��С����,Ĭ��Ϊ0';
comment on column CPIC_SXDX.C_DATA_RULE.defaultvalue
  is 'Ĭ��ֵ';
comment on column CPIC_SXDX.C_DATA_RULE.column_id
  is 'c_def_table_column���';
comment on column CPIC_SXDX.C_DATA_RULE.table_id
  is 'c_def_table���';
comment on column CPIC_SXDX.C_DATA_RULE.templateid
  is '����ģ����';
comment on column CPIC_SXDX.C_DATA_RULE.table_entity_name
  is '��Ӧc_def_table���е�entity_name�ֶε�ֵ��';
comment on column CPIC_SXDX.C_DATA_RULE.field_entity_name
  is '��Ӧc_def_table_field���е�entity_name�ֶε�ֵ';
comment on column CPIC_SXDX.C_DATA_RULE.tenementid
  is '��Ӧ�⻧';
comment on column CPIC_SXDX.C_DATA_RULE.datatype_id
  is '��������';
create index CPIC_SXDX.RELATIONSHIP_39_FK on CPIC_SXDX.C_DATA_RULE (TEMPLATEID);
alter table CPIC_SXDX.C_DATA_RULE
  add constraint PK_C_DATA_RULE primary key (CUSRULEID);
alter table CPIC_SXDX.C_DATA_RULE
  add constraint FK_C_DATA_R_RELATIONS_C_DATA_T foreign key (TEMPLATEID)
  references CPIC_SXDX.C_DATA_TEMPLATE (TEMPLATEID);
alter table CPIC_SXDX.C_DATA_RULE
  add constraint FK_RELATIONS_C_DATA_REGEX foreign key (REGEXID)
  references CPIC_SXDX.C_DATA_REGEX (RULEID);

prompt
prompt Creating table C_DATA_RULE_INTERFACEIMPL
prompt ========================================
prompt
create table CPIC_SXDX.C_DATA_RULE_INTERFACEIMPL
(
  id                NUMBER not null,
  datatypeid        NUMBER(1) not null,
  ruleinterfaceimpl VARCHAR2(256) not null,
  tenementid        NUMBER(4) not null,
  remark            VARCHAR2(64)
)
;
comment on table CPIC_SXDX.C_DATA_RULE_INTERFACEIMPL
  is '���ݹ���ҵ��ӿ�ʵ����';
comment on column CPIC_SXDX.C_DATA_RULE_INTERFACEIMPL.id
  is '����';
comment on column CPIC_SXDX.C_DATA_RULE_INTERFACEIMPL.datatypeid
  is '�����';
comment on column CPIC_SXDX.C_DATA_RULE_INTERFACEIMPL.ruleinterfaceimpl
  is 'ʵ���ࣨ�������ڵ�ȫ����ʵ��DataRuleInterface.java';
comment on column CPIC_SXDX.C_DATA_RULE_INTERFACEIMPL.tenementid
  is '�⻧';
comment on column CPIC_SXDX.C_DATA_RULE_INTERFACEIMPL.remark
  is '��ע';
alter table CPIC_SXDX.C_DATA_RULE_INTERFACEIMPL
  add constraint PK_DATA_RULE_INTERFACEIMPL primary key (ID);
alter table CPIC_SXDX.C_DATA_RULE_INTERFACEIMPL
  add constraint FK_R_DATA_MANAGE_TYPE foreign key (DATATYPEID)
  references CPIC_SXDX.C_DATA_MANAGE_TYPE (DATATYPEID);

prompt
prompt Creating table C_DATA_SOURCE_TYPE
prompt =================================
prompt
create table CPIC_SXDX.C_DATA_SOURCE_TYPE
(
  sourcetypeid NUMBER(5) not null,
  sourcename   VARCHAR2(32),
  isdel        NUMBER(1) default 0 not null
)
;
comment on table CPIC_SXDX.C_DATA_SOURCE_TYPE
  is '�ⲿ����Դ����

1. win2003�����°汾�� excel�ļ�
2. win2007�����ϰ汾��excel�ļ�
3. �ı��ļ�
4. oracle���ݿ�
5. mysql


Ŀǰ֧��excel���ı��ļ���';
comment on column CPIC_SXDX.C_DATA_SOURCE_TYPE.isdel
  is '�Ƿ�ɾ����1�ǡ� Ĭ��0��';
alter table CPIC_SXDX.C_DATA_SOURCE_TYPE
  add constraint PK_C_DATA_SOURCE_TYPE primary key (SOURCETYPEID);

prompt
prompt Creating table C_DEF_TABLE
prompt ==========================
prompt
create table CPIC_SXDX.C_DEF_TABLE
(
  table_id      NUMBER(10) not null,
  table_name    VARCHAR2(50) not null,
  table_remarks VARCHAR2(100),
  table_code    VARCHAR2(30) not null,
  rapid_flag    VARCHAR2(2),
  table_type    VARCHAR2(2) default '99' not null,
  status        VARCHAR2(1) default '1' not null,
  entity_name   VARCHAR2(30),
  tenement_id   NUMBER(4),
  init_flag     VARCHAR2(1) not null,
  data_type_id  NUMBER(1),
  isparent      NUMBER(1) default 0
)
;
comment on table CPIC_SXDX.C_DEF_TABLE
  is '����������';
comment on column CPIC_SXDX.C_DEF_TABLE.table_name
  is '��DB��ע';
comment on column CPIC_SXDX.C_DEF_TABLE.table_remarks
  is '��ע';
comment on column CPIC_SXDX.C_DEF_TABLE.table_code
  is '����';
comment on column CPIC_SXDX.C_DEF_TABLE.rapid_flag
  is 'RAPID���ɴ����ʶ(01,������;02,��������;)';
comment on column CPIC_SXDX.C_DEF_TABLE.table_type
  is '01��������02��������03���ͻ���չ������99,��ͨ��

�����ࣺCustomFormTokens.java��
    public static final String CUSTOMFORM_TYPE_GONGDAN = "01"; //������չ��
    public static final String CUSTOMFORM_TYPE_DINGDAN = "02";//������չ��
    public static final String CUSTOMFORM_TYPE_KEHU = "03";//�ͻ���չ��
    public static final String CUSTOMFORM_TYPE_PUTONG = "99";//��ͨ��

��Ӧ�����ֵ䣺parentid=custab_typ';
comment on column CPIC_SXDX.C_DEF_TABLE.status
  is '1,����;9,ɾ��';
comment on column CPIC_SXDX.C_DEF_TABLE.tenement_id
  is '�⻧�����c_tenement���⻧ID';
comment on column CPIC_SXDX.C_DEF_TABLE.init_flag
  is '��ʼ����ʶ(0:��;1:��) ';
comment on column CPIC_SXDX.C_DEF_TABLE.data_type_id
  is '1���ͻ����ݹ��� C_DATA_MANAGE_TYPE�����';
comment on column CPIC_SXDX.C_DEF_TABLE.isparent
  is '�Ƿ����� 1���� 0����';
alter table CPIC_SXDX.C_DEF_TABLE
  add constraint PK_C_DEF_TABLE primary key (TABLE_ID);

prompt
prompt Creating table C_DEF_TABLE_COLUMN
prompt =================================
prompt
create table CPIC_SXDX.C_DEF_TABLE_COLUMN
(
  column_id     NUMBER(10) not null,
  table_id      NUMBER(10) not null,
  sql_type      VARCHAR2(2) not null,
  length        VARCHAR2(4),
  precision     VARCHAR2(2),
  code          VARCHAR2(30) not null,
  name          VARCHAR2(50) not null,
  is_pk         VARCHAR2(1) default 'N' not null,
  is_fk         VARCHAR2(1) default 'N' not null,
  is_nullable   VARCHAR2(1) default 'Y' not null,
  default_value VARCHAR2(100),
  remarks       VARCHAR2(100),
  entity_name   VARCHAR2(30)
)
;
comment on table CPIC_SXDX.C_DEF_TABLE_COLUMN
  is '���Ʊ��ֶα�';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.sql_type
  is 'DB���ԣ��ֶ���������';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.length
  is 'DB���ԣ��ֶγ���';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.precision
  is 'DB���ԣ��ֶξ���';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.code
  is 'DB���ԣ��ֶ���';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.name
  is 'DB���ԣ��ֶ�ע��';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.is_pk
  is 'DB���ԣ��Ƿ�����(Y,��;N,����)';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.is_fk
  is 'DB���ԣ��Ƿ����(Y,��;N,����)';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.is_nullable
  is 'DB���ԣ��Ƿ�ɿ�(Y,��;N,����)';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.default_value
  is 'DB���ԣ�Ĭ��ֵ';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.remarks
  is '��ע';
alter table CPIC_SXDX.C_DEF_TABLE_COLUMN
  add constraint PK_C_DEF_TABLE_COLUMN primary key (COLUMN_ID);
alter table CPIC_SXDX.C_DEF_TABLE_COLUMN
  add constraint FK_COL_R_TAB foreign key (TABLE_ID)
  references CPIC_SXDX.C_DEF_TABLE (TABLE_ID);

prompt
prompt Creating table C_DEF_COLUMN_PAGEPROPS
prompt =====================================
prompt
create table CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS
(
  column_id    NUMBER(10) not null,
  is_query     VARCHAR2(1) default 'Y',
  is_querys    VARCHAR2(1) default 'Y',
  is_list      VARCHAR2(1) default 'Y',
  is_hidden    VARCHAR2(1) default 'N',
  is_readonly  VARCHAR2(1) default 'N',
  page_type    VARCHAR2(2),
  is_dict      VARCHAR2(1) default 'N',
  dic_id       VARCHAR2(20),
  enmu_string  VARCHAR2(500),
  query_index  NUMBER(3),
  querys_index NUMBER(3),
  list_index   NUMBER(3),
  edit_index   NUMBER(3)
)
;
comment on table CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS
  is '�Զ�����ֶε�ҳ�����Ա�';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.is_query
  is 'ҳ�����ԣ��Ƿ�򵥲�ѯ�ֶ�(Y,��;N,����)';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.is_querys
  is 'ҳ�����ԣ��Ƿ�߼���ѯ�ֶ�(Y,��;N,����)';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.is_list
  is 'ҳ�����ԣ��Ƿ��б��ֶ�(Y,��;N,����)';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.is_hidden
  is 'ҳ�����ԣ��Ƿ���������(Y,��;N,����)';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.is_readonly
  is 'ҳ�����ԣ��Ƿ�ֻ������(Y,��;N,����)';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.page_type
  is 'ҳ�����ԣ�������ʽ(��Ӧ�����ֵ䣬�ı��������򡣡���)';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.is_dict
  is 'ҳ�����ԣ��Ƿ�ʹ�������ֵ�';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.dic_id
  is 'ҳ�����ԣ���Ӧ�����ֵ�ȡֵ�ֵ���';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.enmu_string
  is 'ҳ�����ԣ�ö��ֵ,�Էֺŷָ�,ʾ��ֵ:M(1,��);F(0,Ů) ������:M(��);F(Ů)';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.query_index
  is 'ҳ�����ԣ��򵥲�ѯ��ʾ˳��';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.querys_index
  is 'ҳ�����ԣ��߼���ѯ��ʾ˳��';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.list_index
  is 'ҳ�����ԣ��б�ҳ����ʾ˳��';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.edit_index
  is 'ҳ�����ԣ��༭ҳ����ʾ˳��';
alter table CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS
  add constraint PK_C_DEF_COLUMN_PAGEPROPS primary key (COLUMN_ID);
alter table CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS
  add constraint FK_COL_PAGE_R_COL foreign key (COLUMN_ID)
  references CPIC_SXDX.C_DEF_TABLE_COLUMN (COLUMN_ID);

prompt
prompt Creating table C_DEF_PAGEPROPSTYPE
prompt ==================================
prompt
create table CPIC_SXDX.C_DEF_PAGEPROPSTYPE
(
  pagepropstypeid VARCHAR2(24) not null,
  name            VARCHAR2(32) not null,
  isdel           NUMBER(1) default 0 not null,
  remark          VARCHAR2(64),
  disorder        NUMBER(4) default 0
)
;
comment on table CPIC_SXDX.C_DEF_PAGEPROPSTYPE
  is '��������-->ҳ�������ֵ���ñ��ֹ�ά������Ӧ�����ࣺCustomFormTokens.java��PAGEPROPSTYPE��ͷ�ĳ�����';
comment on column CPIC_SXDX.C_DEF_PAGEPROPSTYPE.pagepropstypeid
  is 'ҳ�����ͱ��';
comment on column CPIC_SXDX.C_DEF_PAGEPROPSTYPE.name
  is 'ҳ������';
comment on column CPIC_SXDX.C_DEF_PAGEPROPSTYPE.isdel
  is '�Ƿ�ɾ����0����Ĭ�ϣ���1�ǡ�';
comment on column CPIC_SXDX.C_DEF_PAGEPROPSTYPE.remark
  is '����';
comment on column CPIC_SXDX.C_DEF_PAGEPROPSTYPE.disorder
  is '����';
alter table CPIC_SXDX.C_DEF_PAGEPROPSTYPE
  add constraint PK_C_DEF_PAGEPROPSTYPE primary key (PAGEPROPSTYPEID);

prompt
prompt Creating table C_DEF_TABLE_CASE_BUSITYPE
prompt ========================================
prompt
create table CPIC_SXDX.C_DEF_TABLE_CASE_BUSITYPE
(
  busitype VARCHAR2(32) not null,
  table_id NUMBER(10) not null
)
;
comment on table CPIC_SXDX.C_DEF_TABLE_CASE_BUSITYPE
  is '�Զ��幤������ҵ�����ͱ�֮��Ĺ�ϵ';
comment on column CPIC_SXDX.C_DEF_TABLE_CASE_BUSITYPE.busitype
  is 'ҵ�����ͣ���״��

�����ֵ䣺

parentId=busiType';
comment on column CPIC_SXDX.C_DEF_TABLE_CASE_BUSITYPE.table_id
  is 'TABLE_ID';
alter table CPIC_SXDX.C_DEF_TABLE_CASE_BUSITYPE
  add constraint PK_C_DEF_TABLE_CASE_BUSITYPE primary key (BUSITYPE);

prompt
prompt Creating table C_DEF_TABLE_PAGEPROPS
prompt ====================================
prompt
create table CPIC_SXDX.C_DEF_TABLE_PAGEPROPS
(
  table_id         NUMBER(10) not null,
  create_date      DATE,
  url_create       VARCHAR2(100),
  url_retrieve     VARCHAR2(100),
  url_update       VARCHAR2(100),
  url_delete       VARCHAR2(100),
  url_list         VARCHAR2(100),
  url_simple_query VARCHAR2(100)
)
;
comment on table CPIC_SXDX.C_DEF_TABLE_PAGEPROPS
  is '�Զ����ҳ�����Ա�';
comment on column CPIC_SXDX.C_DEF_TABLE_PAGEPROPS.create_date
  is '��������ʱ��';
comment on column CPIC_SXDX.C_DEF_TABLE_PAGEPROPS.url_create
  is '����url';
comment on column CPIC_SXDX.C_DEF_TABLE_PAGEPROPS.url_retrieve
  is '��ѯurl';
comment on column CPIC_SXDX.C_DEF_TABLE_PAGEPROPS.url_update
  is '��ϸurl';
comment on column CPIC_SXDX.C_DEF_TABLE_PAGEPROPS.url_delete
  is 'ɾ��url';
comment on column CPIC_SXDX.C_DEF_TABLE_PAGEPROPS.url_list
  is '�б�url';
comment on column CPIC_SXDX.C_DEF_TABLE_PAGEPROPS.url_simple_query
  is '���ٲ�ѯurl';
alter table CPIC_SXDX.C_DEF_TABLE_PAGEPROPS
  add constraint PK_C_DEF_TABLE_PAGEPROPS primary key (TABLE_ID);
alter table CPIC_SXDX.C_DEF_TABLE_PAGEPROPS
  add constraint FK_TAB_PAGE_R_TAB foreign key (TABLE_ID)
  references CPIC_SXDX.C_DEF_TABLE (TABLE_ID);

prompt
prompt Creating table C_DEF_TABLE_REFERENCE
prompt ====================================
prompt
create table CPIC_SXDX.C_DEF_TABLE_REFERENCE
(
  ref_column_id NUMBER(10) not null,
  column_id     NUMBER(10) not null,
  join_type     VARCHAR2(1) default '1' not null
)
;
comment on table CPIC_SXDX.C_DEF_TABLE_REFERENCE
  is '���Ʊ���ϵ��';
comment on column CPIC_SXDX.C_DEF_TABLE_REFERENCE.ref_column_id
  is '�ֱ��ֶ�ID';
comment on column CPIC_SXDX.C_DEF_TABLE_REFERENCE.column_id
  is '�����ֶ�ID';
comment on column CPIC_SXDX.C_DEF_TABLE_REFERENCE.join_type
  is '��ϵ(1,1..0,n;2,1..1;)';
alter table CPIC_SXDX.C_DEF_TABLE_REFERENCE
  add constraint PK_C_DEF_TABLE_REFERENCE primary key (REF_COLUMN_ID, COLUMN_ID);
alter table CPIC_SXDX.C_DEF_TABLE_REFERENCE
  add constraint FK_REF_COL_R_COL foreign key (COLUMN_ID)
  references CPIC_SXDX.C_DEF_TABLE_COLUMN (COLUMN_ID);
alter table CPIC_SXDX.C_DEF_TABLE_REFERENCE
  add constraint FK_REF_REF_R_COL foreign key (REF_COLUMN_ID)
  references CPIC_SXDX.C_DEF_TABLE_COLUMN (COLUMN_ID);

prompt
prompt Creating table C_DICTIONARY_PARENT
prompt ==================================
prompt
create table CPIC_SXDX.C_DICTIONARY_PARENT
(
  parent_id          VARCHAR2(10) not null,
  name               VARCHAR2(64),
  remark             VARCHAR2(128),
  istree             NUMBER(1) default 0 not null,
  belongtable        VARCHAR2(128),
  belongfield        VARCHAR2(128),
  issystem           NUMBER(1),
  isautogeneratecode NUMBER(1) default 0 not null,
  isdel              NUMBER(1),
  userid             VARCHAR2(32),
  createdate         DATE,
  dictvaluetype      NUMBER(1),
  issavememory       NUMBER(1) default 1
)
;
comment on table CPIC_SXDX.C_DICTIONARY_PARENT
  is '�����ֵ�

�������ֵ���ɾ������������ı��ֶ�������ʹ�ã���������ɾ����


is_user_belong_multitenement: һ���û����ڶ���⻧��
1:��
0:��(Ĭ��)

is_allow_marquee:�Ƿ����������
1:��(Ĭ��)
0:��

IS_FAQ_COMPANY_PUBLIC_AUDIT. ��˾֪ʶ�ⷢ��ʱ�Ƿ���Ҫ���
    1����
    0����Ĭ�ϣ�
IS_FAQ_SHARE2COMPANY_AUDIT. ����֪ʶ��ת�빫˾֪ʶ���Ƿ���Ҫ������
  1.��
  0.��Ĭ�ϣ�

SYSTEM_LANGUAGE_SUPPORT.  ���ʻ�
   0���ģ�Ĭ�ϣ�  ����Ӧ��code=zn_CN ��


EMPLOYEE_TITLE. ��Աְλ
EMPLOYEE_ORIGANIZATION: ��Ա��֯������
SYSTEM_VDN: �������ֵ��


CUSTOMER_LEVEL: �ͻ����



Gender   ϵͳ�ֵ�  �Ա�
0����
1��Ů





';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.parent_id
  is '���
';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.name
  is '����';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.remark
  is '����';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.istree
  is '�Ƿ�Ϊ���ڵ㡣
1�ǡ�
Ĭ��0';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.belongtable
  is '�����������֮���ö��ŷֿ�';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.belongfield
  is '�����ֶ�';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.issystem
  is '�Ƿ񲻿�
0����
1�ǡ�Ĭ��0

ϵͳ�ֵ䡣�����⻧�û�ֻ�ܲ鿴�������κβ�����';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.isautogeneratecode
  is '�ֵ����Ƿ��Զ����ɣ�
0��Ĭ��0
1�ǡ�';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.isdel
  is 'NUMBER(1)';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.userid
  is '�����û�';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.createdate
  is '������';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.dictvaluetype
  is '�ֵ�ֵ����: 1��ֵ  2�ַ�';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.issavememory
  is '�Ƿ�����ڴ�. 1��0����Ĭ��1';
alter table CPIC_SXDX.C_DICTIONARY_PARENT
  add constraint PK_C_DICTIONARY_PARENT primary key (PARENT_ID);

prompt
prompt Creating table C_DICTIONARY
prompt ===========================
prompt
create table CPIC_SXDX.C_DICTIONARY
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
  createdate      DATE
)
;
comment on table CPIC_SXDX.C_DICTIONARY
  is '�����ֵ��"DICTIONRY_CODE, TENEMENTID, PARENT_ID��DISORDER, PARENT_ID treeparentid����ΨһԼ��һ������!';
comment on column CPIC_SXDX.C_DICTIONARY.dictionry_id
  is '����,��ֵ�� PARENT_ID+''|''+TENEMENTID+''|''+DICTIONRY_CODE';
comment on column CPIC_SXDX.C_DICTIONARY.dictionary_code
  is '�ֵ����,DICTIONRY_CODE, TENEMENTID, PARENT_ID����Ψһ';
comment on column CPIC_SXDX.C_DICTIONARY.tree_parent_id
  is 'TREE_PARENT_ID';
comment on column CPIC_SXDX.C_DICTIONARY.disorder
  is '�����ֵ�,DISORDER, PARENT_ID treeparentid����Ψһ';
comment on column CPIC_SXDX.C_DICTIONARY.dictdesc
  is '�ֵ�����';
comment on column CPIC_SXDX.C_DICTIONARY.parent_id
  is 'PARENT_ID';
comment on column CPIC_SXDX.C_DICTIONARY.tenementid
  is '�⻧ID, ���tenementIdΪ����Ϊ����������ֵ��';
comment on column CPIC_SXDX.C_DICTIONARY.isdel
  is '1ɾ����Ĭ��0';
comment on column CPIC_SXDX.C_DICTIONARY.istenementshare
  is '�Ƿ�Ϊ�����⻧�乲��,Ĭ��0. 1��';
comment on column CPIC_SXDX.C_DICTIONARY.isegeneratepage
  is '�Ƿ�����������������ɴ���, Ĭ��0. 1����';
comment on column CPIC_SXDX.C_DICTIONARY.isdefaultvalue
  is '�Ƿ�ΪĬ��ֵ,1��, Ĭ��0';
comment on column CPIC_SXDX.C_DICTIONARY.userid
  is '�����û�';
comment on column CPIC_SXDX.C_DICTIONARY.createdate
  is '������';
create index CPIC_SXDX.INDEX_DICTIONARY_PARENT_ID on CPIC_SXDX.C_DICTIONARY (PARENT_ID);
alter table CPIC_SXDX.C_DICTIONARY
  add constraint PK_C_DICTIONARY primary key (DICTIONRY_ID, PARENT_ID, TENEMENTID);
alter table CPIC_SXDX.C_DICTIONARY
  add constraint UNIQUIE_DICTIONARY unique (DICTIONRY_ID, TENEMENTID, PARENT_ID);
alter table CPIC_SXDX.C_DICTIONARY
  add constraint FK_C_DICTIO_RELATIONS_C_DICTIO foreign key (PARENT_ID)
  references CPIC_SXDX.C_DICTIONARY_PARENT (PARENT_ID);

prompt
prompt Creating table C_DICTONARY_FLUSH_LOG
prompt ====================================
prompt
create table CPIC_SXDX.C_DICTONARY_FLUSH_LOG
(
  id              NUMBER(10) not null,
  dictparentid    VARCHAR2(64) not null,
  requestdatetime DATE,
  flushdatetime   DATE,
  status          NUMBER(1) default 0,
  failreason      VARCHAR2(128),
  macaddress      VARCHAR2(32)
)
;
comment on table CPIC_SXDX.C_DICTONARY_FLUSH_LOG
  is '�ֵ��ڴ����֪ͨ�����ֵ����ݷ����仯ʱ�����ñ�д�����ݡ�֪ͨ��̨�������ֵ�������ڴ棡ÿ�ζ�ȡ״̬��Ϊ1�������ֵ���¡�';
comment on column CPIC_SXDX.C_DICTONARY_FLUSH_LOG.id
  is '���';
comment on column CPIC_SXDX.C_DICTONARY_FLUSH_LOG.dictparentid
  is '�ֵ�id';
comment on column CPIC_SXDX.C_DICTONARY_FLUSH_LOG.requestdatetime
  is '����ʱ��';
comment on column CPIC_SXDX.C_DICTONARY_FLUSH_LOG.flushdatetime
  is '����ʱ��';
comment on column CPIC_SXDX.C_DICTONARY_FLUSH_LOG.status
  is '����״̬��
0��Ĭ��ֵ
1���������
2������ʧ��';
comment on column CPIC_SXDX.C_DICTONARY_FLUSH_LOG.failreason
  is 'ʧ��ԭ��';
comment on column CPIC_SXDX.C_DICTONARY_FLUSH_LOG.macaddress
  is '������mac��ַ(c_log_serverinfo)�����';
alter table CPIC_SXDX.C_DICTONARY_FLUSH_LOG
  add constraint C_DICTONARY_FLUSH_LOG primary key (ID);

prompt
prompt Creating table C_EMPLOYEE_INFO
prompt ==============================
prompt
create table CPIC_SXDX.C_EMPLOYEE_INFO
(
  employeeid   NUMBER(10) not null,
  employeename VARCHAR2(32),
  remark       VARCHAR2(128),
  photourl     VARCHAR2(64)
)
;
comment on table CPIC_SXDX.C_EMPLOYEE_INFO
  is '��˾ְ�������

һ��ְλ����ӵ�ж��Ա���ʺš�

�����Թ�Ա��Ϊ����';
comment on column CPIC_SXDX.C_EMPLOYEE_INFO.employeeid
  is 'ְԱID';
comment on column CPIC_SXDX.C_EMPLOYEE_INFO.employeename
  is '��Ա����';
comment on column CPIC_SXDX.C_EMPLOYEE_INFO.remark
  is 'REMARK';
comment on column CPIC_SXDX.C_EMPLOYEE_INFO.photourl
  is 'ͷ��, ftp·��: c_server_tenement�г���ftp��serverpath/tenement_�⻧���/employee/  �ļ�����ʽ: photo_userid....';
alter table CPIC_SXDX.C_EMPLOYEE_INFO
  add constraint PK_C_EMPLOYEE_INFO primary key (EMPLOYEEID);

prompt
prompt Creating table C_EXAM_RESULT_OBJECT_EXTRA
prompt =========================================
prompt
create table CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA
(
  extralogid      NUMBER(10) not null,
  resultid        NUMBER(10),
  resultuserid    NUMBER(10),
  resultpackageid NUMBER(10),
  objectid        NUMBER(10),
  objectidkeyid   NUMBER(10),
  extradate       DATE,
  extrauserid     VARCHAR2(32),
  status          NUMBER(1),
  userid          VARCHAR2(32) not null,
  examtimedate    DATE,
  total           NUMBER(10),
  isappid         NUMBER(1)
)
;
comment on table CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA
  is '���˶��������ȡId��¼��';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.extralogid
  is '���������ȡ��־������';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.resultid
  is '���˽������id';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.resultuserid
  is '�û����˽������Id';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.resultpackageid
  is '�����˰����ܱ���';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.objectid
  is '���˶�����';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.objectidkeyid
  is '���˶����Ӧ��KEYID';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.extradate
  is '��ȡʱ��';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.extrauserid
  is '��ȡ�����û�';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.status
  is '�Ƿ��ѿ��ˡ�0��Ĭ�ϣ���1�ǡ�';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.userid
  is '����Ŀ���û�';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.examtimedate
  is '����ʱ��';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.total
  is '���˶����ܷ�';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.isappid
  is '���߱�־ Ĭ��0��1������';
alter table CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA
  add constraint PK_C_EXAM_RESULT_OBJECT_EXTRA primary key (EXTRALOGID);

prompt
prompt Creating table C_EXAMRESULTOBJECT_TOTAL
prompt =======================================
prompt
create table CPIC_SXDX.C_EXAMRESULTOBJECT_TOTAL
(
  extralogid        NUMBER(10),
  objectrandomcount NUMBER(3),
  factextracount    NUMBER(3),
  finishcount       NUMBER(3)
)
;
comment on table CPIC_SXDX.C_EXAMRESULTOBJECT_TOTAL
  is '��ȡ������ܱ�';
comment on column CPIC_SXDX.C_EXAMRESULTOBJECT_TOTAL.extralogid
  is '���������ȡ��־������';
comment on column CPIC_SXDX.C_EXAMRESULTOBJECT_TOTAL.objectrandomcount
  is '�ƻ���ȡ����c_exam_package�����ֶΣ�';
comment on column CPIC_SXDX.C_EXAMRESULTOBJECT_TOTAL.factextracount
  is 'ʵ�ʳ�ȡ��';
comment on column CPIC_SXDX.C_EXAMRESULTOBJECT_TOTAL.finishcount
  is '�ѿ�����';
create index CPIC_SXDX.RELATIONSHIP_20_FK on CPIC_SXDX.C_EXAMRESULTOBJECT_TOTAL (EXTRALOGID);
alter table CPIC_SXDX.C_EXAMRESULTOBJECT_TOTAL
  add constraint FK_C_EXAMRE_RELATIONS_C_EXAM_R foreign key (EXTRALOGID)
  references CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA (EXTRALOGID);

prompt
prompt Creating table C_EXAM_AUDIT
prompt ===========================
prompt
create table CPIC_SXDX.C_EXAM_AUDIT
(
  auditid         NUMBER(10) not null,
  userid          VARCHAR2(32),
  reason          VARCHAR2(254),
  resultpackageid NUMBER(10),
  statusid        NUMBER(2),
  statususerid    VARCHAR2(32),
  statusdate      DATE,
  auditdate       DATE,
  dealremark      VARCHAR2(128),
  objectkeyid     NUMBER(10) not null,
  resultid        NUMBER(10),
  tenementid      NUMBER(10) not null
)
;
comment on table CPIC_SXDX.C_EXAM_AUDIT
  is '���˽�����˱�';
comment on column CPIC_SXDX.C_EXAM_AUDIT.auditid
  is '���';
comment on column CPIC_SXDX.C_EXAM_AUDIT.userid
  is '������';
comment on column CPIC_SXDX.C_EXAM_AUDIT.reason
  is '����ԭ��';
comment on column CPIC_SXDX.C_EXAM_AUDIT.resultpackageid
  is '�û����˽��������

Ĭ��0 �����븴��
1��������
2���˻�
3�����´��';
comment on column CPIC_SXDX.C_EXAM_AUDIT.statusid
  is '״̬

1�����븴��
2��������
3���������
4���ܾ�';
comment on column CPIC_SXDX.C_EXAM_AUDIT.statususerid
  is '״̬�޸���';
comment on column CPIC_SXDX.C_EXAM_AUDIT.statusdate
  is '״̬�޸�ʱ��';
comment on column CPIC_SXDX.C_EXAM_AUDIT.auditdate
  is '����ʱ�䣬��ȷ����';
comment on column CPIC_SXDX.C_EXAM_AUDIT.dealremark
  is '�������';
comment on column CPIC_SXDX.C_EXAM_AUDIT.objectkeyid
  is '���˶���id';
comment on column CPIC_SXDX.C_EXAM_AUDIT.resultid
  is '�ʼ챨��id';
comment on column CPIC_SXDX.C_EXAM_AUDIT.tenementid
  is '�⻧id';
alter table CPIC_SXDX.C_EXAM_AUDIT
  add constraint PK_C_EXAM_AUDIT primary key (AUDITID);

prompt
prompt Creating table C_EXAM_AUDIT_STATUS
prompt ==================================
prompt
create table CPIC_SXDX.C_EXAM_AUDIT_STATUS
(
  statusid NUMBER(10) not null,
  name     VARCHAR2(32)
)
;
comment on table CPIC_SXDX.C_EXAM_AUDIT_STATUS
  is '����״̬
1.���븴��
2.������
3.�������
4.�ܾ�';

prompt
prompt Creating table C_EXAM_GRADE_MODE
prompt ================================
prompt
create table CPIC_SXDX.C_EXAM_GRADE_MODE
(
  grademodeid NUMBER(4) not null,
  name        VARCHAR2(16) not null,
  isdel       NUMBER(1) default 0
)
;
comment on table CPIC_SXDX.C_EXAM_GRADE_MODE
  is '���ַ�ʽ

�����ࣺExamToken.java

2.�ֹ����
3.sql�ű�
4.�ӿڣ�ʵ���ࡣָ��GradeModeInterface�ӿڵ�ʵ����
';
comment on column CPIC_SXDX.C_EXAM_GRADE_MODE.grademodeid
  is '��ַ�ʽ��š���ֵ��ӦExamToken.java�ࡰEXAM_GRADEMODE_"����ͷ�ĳ�����';
comment on column CPIC_SXDX.C_EXAM_GRADE_MODE.name
  is '���ƣ�';
comment on column CPIC_SXDX.C_EXAM_GRADE_MODE.isdel
  is 'Ĭ��0��1��ɾ����';
alter table CPIC_SXDX.C_EXAM_GRADE_MODE
  add constraint PK_C_EXAM_GRADE_MODE primary key (GRADEMODEID);

prompt
prompt Creating table C_EXAM_TEMPLATE
prompt ==============================
prompt
create table CPIC_SXDX.C_EXAM_TEMPLATE
(
  templateid      NUMBER(10) not null,
  maxpoint        NUMBER(4) not null,
  minpoint        NUMBER(4) default 0 not null,
  name            VARCHAR2(32) not null,
  isdel           NUMBER(1) default 0 not null,
  tenementid      NUMBER(4) not null,
  updateuserid    VARCHAR2(32),
  updatedate      DATE,
  cyclemode       NUMBER(1) not null,
  cyclemode_begin NUMBER(2),
  cyclemode_end   NUMBER(2),
  cycle_type      NUMBER(1),
  exam_desc       VARCHAR2(128)
)
;
comment on table CPIC_SXDX.C_EXAM_TEMPLATE
  is '����ģ��

';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.templateid
  is 'ģ����';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.maxpoint
  is '�ܷ֣�Ĭ��Ϊ100��';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.minpoint
  is '��ͷ֣�Ĭ��Ϊ0�֡�';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.name
  is 'ģ������';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.isdel
  is '1ɾ����Ĭ��0';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.updateuserid
  is '�޸��û���';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.updatedate
  is '�������޸�ʱ�䣨���һ�Σ�';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.cyclemode
  is 'ִ�����ڣ�1���£�2����

��Ӧ������EXAM_TOKEN.JAVA����"EXAM_EXECUTE_MODE_"��ͷ�ĳ�����';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.cyclemode_begin
  is '��ʼʱ��

';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.cyclemode_end
  is '��ʼʱ��';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.cycle_type
  is '���Ϊ0��˵��Ϊ��Ȼ�»���
���Ϊ�����ʱ�䣬��Ϊ�����/�µļ���(�ܼ�)���¸��£��ܣ��ļ��ţ��ܼ���

��У�飬�Ƿ�Ϊ���»����ܡ�';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.exam_desc
  is '��ע';
alter table CPIC_SXDX.C_EXAM_TEMPLATE
  add constraint PK_C_EXAM_TEMPLATE primary key (TEMPLATEID);

prompt
prompt Creating table C_EXAM_OBJECT
prompt ============================
prompt
create table CPIC_SXDX.C_EXAM_OBJECT
(
  objectid         NUMBER(10) not null,
  name             VARCHAR2(32) not null,
  detailurl        VARCHAR2(256) not null,
  isdel            NUMBER(1) not null,
  tenementid       NUMBER(4) not null,
  isshare          NUMBER(1) default 0 not null,
  status           NUMBER(1) default 0 not null,
  entityclassid    VARCHAR2(32) not null,
  remark           VARCHAR2(128),
  entitytenementid VARCHAR2(32) not null,
  entitykeyid      VARCHAR2(32) not null,
  entitystartdate  VARCHAR2(32) not null,
  entityenddate    VARCHAR2(32) not null,
  entityuserid     VARCHAR2(32) not null
)
;
comment on table CPIC_SXDX.C_EXAM_OBJECT
  is '���˶�������

�ѿ�ʼ��ȡ���ݣ������޸���ɾ����


entityclassId Ψһ';
comment on column CPIC_SXDX.C_EXAM_OBJECT.objectid
  is '���˶���';
comment on column CPIC_SXDX.C_EXAM_OBJECT.name
  is '��������';
comment on column CPIC_SXDX.C_EXAM_OBJECT.detailurl
  is '��ֶ��񣨶�����ϸ��ҳ��URL��keyId=${Id}';
comment on column CPIC_SXDX.C_EXAM_OBJECT.isdel
  is '�Ƿ�ɾ����1�ǡ�Ĭ��0';
comment on column CPIC_SXDX.C_EXAM_OBJECT.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_EXAM_OBJECT.isshare
  is '�Ƿ���
1�ǡ�0��';
comment on column CPIC_SXDX.C_EXAM_OBJECT.status
  is '�Ƿ���á�
���Գɹ�status=1�� ����Ϊ0';
comment on column CPIC_SXDX.C_EXAM_OBJECT.entityclassid
  is '��ӦHibernateʵ���������ڳ���Id';
comment on column CPIC_SXDX.C_EXAM_OBJECT.remark
  is '��ע';
comment on column CPIC_SXDX.C_EXAM_OBJECT.entitytenementid
  is 'ʵ���ֶ���_�⻧���';
comment on column CPIC_SXDX.C_EXAM_OBJECT.entitykeyid
  is 'ʵ���ֶ���_��ؼ���';
comment on column CPIC_SXDX.C_EXAM_OBJECT.entitystartdate
  is 'ʵ���ֶ���_��ʼʱ���ֶ�';
comment on column CPIC_SXDX.C_EXAM_OBJECT.entityenddate
  is 'ʵ���ֶ���_����ʱ���ֶ���';
comment on column CPIC_SXDX.C_EXAM_OBJECT.entityuserid
  is 'ʵ���ֶ���_�������û�(Ŀ��)';
alter table CPIC_SXDX.C_EXAM_OBJECT
  add constraint PK_C_EXAM_OBJECT primary key (OBJECTID);

prompt
prompt Creating table C_EXAM_PACKAGE
prompt =============================
prompt
create table CPIC_SXDX.C_EXAM_PACKAGE
(
  packageid         NUMBER(10) not null,
  templateid        NUMBER(10) not null,
  name              VARCHAR2(32) not null,
  grademodeid       NUMBER(4) not null,
  objectid          NUMBER(10),
  weight            NUMBER(4,2) not null,
  isdel             NUMBER(1) default 0 not null,
  disorder          NUMBER(2),
  objectrandomcount NUMBER(3),
  remark            VARCHAR2(64)
)
;
comment on table CPIC_SXDX.C_EXAM_PACKAGE
  is '���˰�

��ַ�ʽ������н�����ڣ������޸ġ�


';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.packageid
  is '���˰����';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.templateid
  is 'ģ����';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.name
  is '����';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.grademodeid
  is '��ַ�ʽ��š���ֵ��ӦExamToken.java�ࡰEXAM_GRADEMODE_"����ͷ�ĳ�����';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.objectid
  is '��������';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.weight
  is 'Ȩ�ء���ʾʱ�԰ٷֱ���ʾ��%��';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.isdel
  is 'Ĭ��0��1ɾ����';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.disorder
  is '����';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.objectrandomcount
  is '���˶����ȡ�������';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.remark
  is '��ע';
create index CPIC_SXDX.RELATIONSHIP_10_FK on CPIC_SXDX.C_EXAM_PACKAGE (GRADEMODEID);
create index CPIC_SXDX.RELATIONSHIP_11_FK on CPIC_SXDX.C_EXAM_PACKAGE (OBJECTID);
create index CPIC_SXDX.RELATIONSHIP_8_FK on CPIC_SXDX.C_EXAM_PACKAGE (TEMPLATEID);
alter table CPIC_SXDX.C_EXAM_PACKAGE
  add constraint PK_C_EXAM_PACKAGE primary key (PACKAGEID);
alter table CPIC_SXDX.C_EXAM_PACKAGE
  add constraint FK_C_EXAM_P_RELATIONS_C_EXAM_G foreign key (GRADEMODEID)
  references CPIC_SXDX.C_EXAM_GRADE_MODE (GRADEMODEID);
alter table CPIC_SXDX.C_EXAM_PACKAGE
  add constraint FK_C_EXAM_P_RELATIONS_C_EXAM_O foreign key (OBJECTID)
  references CPIC_SXDX.C_EXAM_OBJECT (OBJECTID);
alter table CPIC_SXDX.C_EXAM_PACKAGE
  add constraint FK_C_EXAM_P_RELATIONS_C_EXAM_T foreign key (TEMPLATEID)
  references CPIC_SXDX.C_EXAM_TEMPLATE (TEMPLATEID);

prompt
prompt Creating table C_EXAM_ITEM
prompt ==========================
prompt
create table CPIC_SXDX.C_EXAM_ITEM
(
  itemid       NUMBER(10) not null,
  itemname     VARCHAR2(32) not null,
  packageid    NUMBER(10),
  script       VARCHAR2(512),
  maxpoint     NUMBER(4),
  minpoint     NUMBER(4),
  isdel        NUMBER(1) default 0 not null,
  tenementid   NUMBER(4),
  updateuserid VARCHAR2(32),
  updatedate   DATE,
  disorder     NUMBER(4),
  tempalateid  NUMBER(10) not null,
  itmedesc     VARCHAR2(128)
)
;
comment on table CPIC_SXDX.C_EXAM_ITEM
  is '�ʼ�ģ��ָ�ꡣ';
comment on column CPIC_SXDX.C_EXAM_ITEM.itemid
  is 'ָ��id';
comment on column CPIC_SXDX.C_EXAM_ITEM.itemname
  is 'ָ������';
comment on column CPIC_SXDX.C_EXAM_ITEM.packageid
  is '���˰����';
comment on column CPIC_SXDX.C_EXAM_ITEM.script
  is '���ֽű���

��grademode=2ʱ��Ϊsql�ű���
   ���ò����У�${currentUserId}, ${itemId},${packageId},${templateId},${tenementId},${startDate},${endDate}��
   ����λ�ڣ�ExamToken.java��"SCRIPT_INLINE_PARAMETER"��ͷ�ĳ�����
   ��ִ�нű�ʱ�Զ�����ת��ʵ�ʵ���ֵ������ userIdsʵ��ֵΪExamToken.SCRIPT_INLINE_PARAMETER_USERIDS_VALUE������������


�ű����صĸ�ʽΪ��ͨ��userIds�����õ����ڼƷֵ��û���һ���ű��������û��ķ���һ�ζ�������
insert into C_EXAM_USER_POINT(poing,userId,itemid)
select point,userId,{itemId} from ....


���ڽӿڣ���Ӧ����GradeModeInterface�ӿڵ�ʵ���ࡣ';
comment on column CPIC_SXDX.C_EXAM_ITEM.maxpoint
  is '��߷�';
comment on column CPIC_SXDX.C_EXAM_ITEM.minpoint
  is '��ͷ֣����ɸ�����߷֡�';
comment on column CPIC_SXDX.C_EXAM_ITEM.isdel
  is '1�ǡ�Ĭ��0';
comment on column CPIC_SXDX.C_EXAM_ITEM.tenementid
  is '�⻧Id';
comment on column CPIC_SXDX.C_EXAM_ITEM.updateuserid
  is '�޸��û���';
comment on column CPIC_SXDX.C_EXAM_ITEM.updatedate
  is '�������޸�ʱ�䣨���һ�Σ�';
comment on column CPIC_SXDX.C_EXAM_ITEM.disorder
  is '����';
comment on column CPIC_SXDX.C_EXAM_ITEM.tempalateid
  is '�ʼ�ģ��ID';
comment on column CPIC_SXDX.C_EXAM_ITEM.itmedesc
  is '����';
create index CPIC_SXDX.RELATIONSHIP_9_FK on CPIC_SXDX.C_EXAM_ITEM (PACKAGEID);
alter table CPIC_SXDX.C_EXAM_ITEM
  add constraint PK_C_EXAM_ITEM primary key (ITEMID);
alter table CPIC_SXDX.C_EXAM_ITEM
  add constraint FK_C_EXAM_I_RELATIONS_C_EXAM_P foreign key (PACKAGEID)
  references CPIC_SXDX.C_EXAM_PACKAGE (PACKAGEID);

prompt
prompt Creating table C_EXAM_RESULT
prompt ============================
prompt
create table CPIC_SXDX.C_EXAM_RESULT
(
  resultid     NUMBER(10) not null,
  templateid   NUMBER(10) not null,
  tenementid   NUMBER(4) not null,
  startdate    DATE not null,
  enddate      DATE,
  groupid      VARCHAR2(20) not null,
  totaldate    DATE,
  createdate   DATE,
  createuserid VARCHAR2(32),
  isdel        NUMBER(1) default 0 not null,
  cyclebegin   DATE not null,
  cycleend     DATE not null,
  resulttotal  NUMBER(10)
)
;
comment on table CPIC_SXDX.C_EXAM_RESULT
  is '���˽������

������ӱ��¼�棨��Ӧ��C_EXAM_RESULT_DETAIL������м�¼���򲻿���ɾ���������������ɾ������';
comment on column CPIC_SXDX.C_EXAM_RESULT.resultid
  is '�ʼ������';
comment on column CPIC_SXDX.C_EXAM_RESULT.templateid
  is '����ģ����';
comment on column CPIC_SXDX.C_EXAM_RESULT.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_EXAM_RESULT.startdate
  is '�Զ��忼��ʱ��';
comment on column CPIC_SXDX.C_EXAM_RESULT.enddate
  is '����ʱ��  ע���˴ο��˷�������½���ʱ��';
comment on column CPIC_SXDX.C_EXAM_RESULT.groupid
  is '����';
comment on column CPIC_SXDX.C_EXAM_RESULT.totaldate
  is '���һ�λ���ʱ��';
comment on column CPIC_SXDX.C_EXAM_RESULT.createdate
  is '��������ʱ��';
comment on column CPIC_SXDX.C_EXAM_RESULT.createuserid
  is '���������û�';
comment on column CPIC_SXDX.C_EXAM_RESULT.isdel
  is '�Ƿ����ϡ�1�ǡ�0��Ĭ�ϣ�';
comment on column CPIC_SXDX.C_EXAM_RESULT.cyclebegin
  is '���ڿ�ʼʱ��';
comment on column CPIC_SXDX.C_EXAM_RESULT.cycleend
  is '���ڽ���ʱ��';
comment on column CPIC_SXDX.C_EXAM_RESULT.resulttotal
  is '�ܷ�';
create index CPIC_SXDX.RELATIONSHIP_13_FK on CPIC_SXDX.C_EXAM_RESULT (TEMPLATEID);
alter table CPIC_SXDX.C_EXAM_RESULT
  add constraint PK_C_EXAM_RESULT primary key (RESULTID);
alter table CPIC_SXDX.C_EXAM_RESULT
  add constraint FK_C_EXAM_R_RELATIONS_C_EXAM_T foreign key (TEMPLATEID)
  references CPIC_SXDX.C_EXAM_TEMPLATE (TEMPLATEID);

prompt
prompt Creating table C_EXAM_RESULT_STATUS
prompt ===================================
prompt
create table CPIC_SXDX.C_EXAM_RESULT_STATUS
(
  statusid NUMBER(2) not null,
  name     VARCHAR2(16)
)
;
comment on table CPIC_SXDX.C_EXAM_RESULT_STATUS
  is 'ͳ��״̬��

0��Ĭ��
1��������
2�����
3��ʧ��
';
comment on column CPIC_SXDX.C_EXAM_RESULT_STATUS.statusid
  is 'statusId';
comment on column CPIC_SXDX.C_EXAM_RESULT_STATUS.name
  is 'name';
alter table CPIC_SXDX.C_EXAM_RESULT_STATUS
  add constraint PK_C_EXAM_RESULT_STATUS primary key (STATUSID);

prompt
prompt Creating table C_EXAM_RESULT_USER
prompt =================================
prompt
create table CPIC_SXDX.C_EXAM_RESULT_USER
(
  resultuserid NUMBER(10) not null,
  resultid     NUMBER(10) not null,
  statusid     NUMBER(2),
  templateid   NUMBER(10) not null,
  tenementid   NUMBER(4) not null,
  startdate    DATE not null,
  enddate      DATE,
  userid       VARCHAR2(32),
  ispublish    NUMBER(1) not null,
  point        NUMBER(10),
  isaut        NUMBER(1)
)
;
comment on table CPIC_SXDX.C_EXAM_RESULT_USER
  is '�û����˽������';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.resultuserid
  is 'resultUserId';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.resultid
  is '�ʼ���';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.statusid
  is 'statusId 0��Ĭ��
1��������
2�����
3��ʧ��';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.templateid
  is '����ģ����';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.startdate
  is '��ʼʱ��';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.enddate
  is '����ʱ��';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.userid
  is '����Ŀ���û������ʼ��ˣ�';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.ispublish
  is '������
1�ǡ�Ĭ��0��';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.point
  is '�ܷ�';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.isaut
  is '�Զ����˱�ʾ Ĭ��0  1�Ѿ��Զ�����';
create index CPIC_SXDX.RELATIONSHIP_12_FK on CPIC_SXDX.C_EXAM_RESULT_USER (RESULTID);
create index CPIC_SXDX.RELATIONSHIP_19_FK on CPIC_SXDX.C_EXAM_RESULT_USER (STATUSID);
alter table CPIC_SXDX.C_EXAM_RESULT_USER
  add constraint PK_C_EXAM_RESULT_USER primary key (RESULTUSERID);
alter table CPIC_SXDX.C_EXAM_RESULT_USER
  add constraint FK_EXAMRESULTUSER foreign key (RESULTID)
  references CPIC_SXDX.C_EXAM_RESULT (RESULTID);
alter table CPIC_SXDX.C_EXAM_RESULT_USER
  add constraint FK_EXAMSTATUSUSER foreign key (STATUSID)
  references CPIC_SXDX.C_EXAM_RESULT_STATUS (STATUSID);

prompt
prompt Creating table C_EXAM_RESULT_PACKAGE
prompt ====================================
prompt
create table CPIC_SXDX.C_EXAM_RESULT_PACKAGE
(
  resultpackageid   NUMBER(10) not null,
  resultuserid      NUMBER(10),
  statusid          NUMBER(2),
  tenementid        NUMBER(4) not null,
  templateid        NUMBER(10) not null,
  packageid         NUMBER(10) not null,
  point             NUMBER(4),
  userid            VARCHAR2(32),
  resultid          NUMBER(10) not null,
  totaldate         DATE,
  objectid          NUMBER(10),
  weight            NUMBER(4,2) not null,
  objectrandomcount NUMBER(3) default 0 not null,
  factextracount    NUMBER(3) default 0 not null,
  finishcount       NUMBER(3) default 0 not null
)
;
comment on table CPIC_SXDX.C_EXAM_RESULT_PACKAGE
  is '�����˰����ܱ�';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.resultpackageid
  is '���˽�����˱�ͳ�Ʊ�';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.resultuserid
  is '����Ŀ���û�';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.statusid
  is 'statusId';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.templateid
  is 'ģ����';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.packageid
  is '���˰����';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.point
  is '�ܷ�';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.userid
  is '�������û�������Ŀ�꣩';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.resultid
  is '�ʼ���';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.totaldate
  is '���һ�λ���ʱ��';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.objectid
  is '���˶���';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.weight
  is 'Ȩ�ء���ʾʱ�԰ٷֱ���ʾ��%��
���˶����ȡ���������c_exam_package�����ֶΣ�';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.objectrandomcount
  is '�ƻ���ȡ����c_exam_package�����ֶΣ�';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.factextracount
  is 'ʵ�ʳ�ȡ��';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.finishcount
  is '�ѿ�����';
create index CPIC_SXDX.RELATIONSHIP_15_FK on CPIC_SXDX.C_EXAM_RESULT_PACKAGE (STATUSID);
create index CPIC_SXDX.RELATIONSHIP_18_FK on CPIC_SXDX.C_EXAM_RESULT_PACKAGE (RESULTUSERID);
alter table CPIC_SXDX.C_EXAM_RESULT_PACKAGE
  add constraint PK_C_EXAM_RESULT_PACKAGE primary key (RESULTPACKAGEID);
alter table CPIC_SXDX.C_EXAM_RESULT_PACKAGE
  add constraint FK_EXAMSTATUSPACKAGE foreign key (STATUSID)
  references CPIC_SXDX.C_EXAM_RESULT_STATUS (STATUSID);
alter table CPIC_SXDX.C_EXAM_RESULT_PACKAGE
  add constraint FK_EXAMUSERPACKAGE foreign key (RESULTUSERID)
  references CPIC_SXDX.C_EXAM_RESULT_USER (RESULTUSERID);

prompt
prompt Creating table C_EXAM_RESULT_ITEM
prompt =================================
prompt
create table CPIC_SXDX.C_EXAM_RESULT_ITEM
(
  resultitemid    NUMBER(10) not null,
  userid          VARCHAR2(32),
  tenementid      NUMBER(4) not null,
  templateid      NUMBER(10) not null,
  packageid       NUMBER(10) not null,
  itemid          NUMBER(10),
  point           NUMBER(10),
  examresultid    NUMBER(10) not null,
  resultpackageid NUMBER(10),
  statusid        NUMBER(2),
  isvalid         NUMBER(1) default 1 not null,
  totaldate       DATE,
  scripttotal     NUMBER(10),
  sumpoint        NUMBER(10),
  finishcount     NUMBER(10) default 0
)
;
comment on table CPIC_SXDX.C_EXAM_RESULT_ITEM
  is '�ʼ���ָ��ͳ�Ʊ�

QUALITCHECKID��OBJECTtypeid���߱���Ψһ���������ܱ�֤��ƽ��';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.resultitemid
  is 'ָ�������';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.userid
  is '����Ŀ�꣨�������û���';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.templateid
  is 'ģ����';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.packageid
  is '���˰����';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.itemid
  is 'ָ��ID';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.point
  is '���������ʼ���ϸ��ƽ���ֵõ���';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.examresultid
  is '�ʼ���';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.resultpackageid
  is '���˽�����˱�ͳ�Ʊ�';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.statusid
  is 'statusId';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.isvalid
  is '����Ƿ���Ч��Ĭ��1����Ч��0��Ч��';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.totaldate
  is '���һ�λ���ʱ��';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.scripttotal
  is '�ű�����ʱ�����ص�ʵ��ͳ����ֵ��';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.sumpoint
  is '��ϸ�ܷ�';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.finishcount
  is '�ѿ�����';
create index CPIC_SXDX.RELATIONSHIP_16_FK on CPIC_SXDX.C_EXAM_RESULT_ITEM (RESULTPACKAGEID);
create index CPIC_SXDX.RELATIONSHIP_17_FK on CPIC_SXDX.C_EXAM_RESULT_ITEM (STATUSID);
create index CPIC_SXDX.RELATIONSHIP_90_FK on CPIC_SXDX.C_EXAM_RESULT_ITEM (ITEMID);
alter table CPIC_SXDX.C_EXAM_RESULT_ITEM
  add constraint PK_C_EXAM_RESULT_ITEM primary key (RESULTITEMID);
alter table CPIC_SXDX.C_EXAM_RESULT_ITEM
  add constraint FK_C_EXAM_R_RELATIONS_C_EXAM_I foreign key (ITEMID)
  references CPIC_SXDX.C_EXAM_ITEM (ITEMID);
alter table CPIC_SXDX.C_EXAM_RESULT_ITEM
  add constraint FK_EXAMPACKAGEITEM foreign key (RESULTPACKAGEID)
  references CPIC_SXDX.C_EXAM_RESULT_PACKAGE (RESULTPACKAGEID);
alter table CPIC_SXDX.C_EXAM_RESULT_ITEM
  add constraint FK_EXAMSTATUSITEM foreign key (STATUSID)
  references CPIC_SXDX.C_EXAM_RESULT_STATUS (STATUSID);

prompt
prompt Creating table C_EXAM_RESULT_DETAIL
prompt ===================================
prompt
create table CPIC_SXDX.C_EXAM_RESULT_DETAIL
(
  detailid        NUMBER(10) not null,
  resultid        NUMBER(10) not null,
  resultuserid    NUMBER(10) not null,
  resultpackageid NUMBER(10) not null,
  resultitemid    NUMBER(10) not null,
  userid          VARCHAR2(32),
  templateid      NUMBER(10),
  packageid       NUMBER(10),
  itemid          NUMBER(10),
  objectid        VARCHAR2(20),
  objectidkeyid   NUMBER(10),
  point           NUMBER(3),
  tenmentid       NUMBER(4) not null,
  isvalid         NUMBER(1) default 1 not null,
  examdate        DATE,
  examuserid      VARCHAR2(32)
)
;
comment on table CPIC_SXDX.C_EXAM_RESULT_DETAIL
  is '�ʼ�����ϸ��

';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.detailid
  is 'ָ�������';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.resultid
  is '�ʼ���';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.resultuserid
  is '�û�����������';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.resultpackageid
  is '���˽�����˱�ͳ�Ʊ�';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.resultitemid
  is 'ָ�������';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.userid
  is '�������û�������Ŀ�꣩';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.templateid
  is '����ģ����';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.packageid
  is '�Ծ������';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.itemid
  is 'ָ��ID';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.objectid
  is '��Ӧ���ʼ����ͣ������ֵ䣺

parent_code=EXAMOBJECTID
record:¼��
pki:PKI�ʼ�
case:����
faq:֪ʶ��';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.objectidkeyid
  is '���˶����Ӧ��KEYID';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.point
  is '����';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.tenmentid
  is '�⻧���';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.isvalid
  is '����Ƿ���Ч��Ĭ��1����Ч��0��Ч��';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.examdate
  is '����ʱ�䣬��ȷ����';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.examuserid
  is '������';
create index CPIC_SXDX.RELATIONSHIP_14_FK on CPIC_SXDX.C_EXAM_RESULT_DETAIL (RESULTITEMID);
alter table CPIC_SXDX.C_EXAM_RESULT_DETAIL
  add constraint PK_C_EXAM_RESULT_DETAIL primary key (DETAILID);
alter table CPIC_SXDX.C_EXAM_RESULT_DETAIL
  add constraint FK_EXAMITEMDETAIL foreign key (RESULTITEMID)
  references CPIC_SXDX.C_EXAM_RESULT_ITEM (RESULTITEMID);

prompt
prompt Creating table C_FAQ_ALL_SEARCH
prompt ===============================
prompt
create table CPIC_SXDX.C_FAQ_ALL_SEARCH
(
  contentid  NUMBER(10) not null,
  indextag   NUMBER(1) not null,
  macaddress VARCHAR2(32),
  createdate DATE,
  id         NUMBER(10) not null,
  tenementid NUMBER(4)
)
;
comment on table CPIC_SXDX.C_FAQ_ALL_SEARCH
  is 'ȫ�ļ�����¼��';
comment on column CPIC_SXDX.C_FAQ_ALL_SEARCH.contentid
  is '֪ʶ����,����';
comment on column CPIC_SXDX.C_FAQ_ALL_SEARCH.indextag
  is '�������//1��������2���޸�;3ɾ������Ϊ��';
comment on column CPIC_SXDX.C_FAQ_ALL_SEARCH.macaddress
  is '���������õ�Mac��ַ��Ϣ(c_log_server_info��)';
comment on column CPIC_SXDX.C_FAQ_ALL_SEARCH.createdate
  is '��¼����ʱ��';
comment on column CPIC_SXDX.C_FAQ_ALL_SEARCH.id
  is '����';
comment on column CPIC_SXDX.C_FAQ_ALL_SEARCH.tenementid
  is '�⻧id';
alter table CPIC_SXDX.C_FAQ_ALL_SEARCH
  add constraint PK_FAQ_ALL_SEARCH primary key (ID);

prompt
prompt Creating table C_SYS_FLOWNODE
prompt =============================
prompt
create table CPIC_SXDX.C_SYS_FLOWNODE
(
  flownodeid   NUMBER(10) not null,
  name         VARCHAR2(32) not null,
  stepno       NUMBER(4),
  isdel        NUMBER(1),
  remark       VARCHAR2(128),
  flowmoduleid VARCHAR2(10),
  tenementid   NUMBER(4) not null,
  isdefault    NUMBER(1)
)
;
comment on table CPIC_SXDX.C_SYS_FLOWNODE
  is '������ת�ڵ����ã��ڵ��������ظ���';
comment on column CPIC_SXDX.C_SYS_FLOWNODE.name
  is '�ڵ�����';
comment on column CPIC_SXDX.C_SYS_FLOWNODE.stepno
  is '�������(����)';
comment on column CPIC_SXDX.C_SYS_FLOWNODE.isdel
  is 'ɾ����1ɾ����0��Ĭ�ϣ�0��';
comment on column CPIC_SXDX.C_SYS_FLOWNODE.remark
  is '��ע';
comment on column CPIC_SXDX.C_SYS_FLOWNODE.flowmoduleid
  is '��Ӧ����:FlowStatusToken.FLOW_MODULE_*


//�����ڶ�Ӧ������ģ��
public static final String FLOW_MODULE_FAQ="FAQ";//����
public static final String FLOW_MODULE_CASE="CASE";//����
public static final String FLOW_MODULE_ORDER="ORDER";//֪ʶ��

';
comment on column CPIC_SXDX.C_SYS_FLOWNODE.tenementid
  is '�⻧ID';
comment on column CPIC_SXDX.C_SYS_FLOWNODE.isdefault
  is 'Ĭ�ϸ�λ';
alter table CPIC_SXDX.C_SYS_FLOWNODE
  add constraint PK_C_SYS_FLOWNODE primary key (FLOWNODEID);
alter table CPIC_SXDX.C_SYS_FLOWNODE
  add constraint PK_C_SYS_FLOWNODE_NAME unique (NAME, FLOWMODULEID);

prompt
prompt Creating table C_FAQ_CONTENT
prompt ============================
prompt
create table CPIC_SXDX.C_FAQ_CONTENT
(
  contentid      NUMBER(10) not null,
  title          VARCHAR2(150) not null,
  keyword        VARCHAR2(128),
  summary        VARCHAR2(640),
  isdel          NUMBER(1) default 0 not null,
  isprivated     NUMBER(1) default 0 not null,
  isshared       NUMBER(1) default 0 not null,
  companygroupid VARCHAR2(32),
  tenementid     NUMBER(4),
  userid         VARCHAR2(32),
  createdate     DATE,
  isfocuse       NUMBER(1) default 0 not null,
  focusdate      DATE,
  focususerid    VARCHAR2(32),
  deletedate     DATE,
  deleteuserid   VARCHAR2(32),
  updatedate     DATE default sysdate,
  flowstatus     VARCHAR2(2),
  fromnodeid     NUMBER(10),
  fromuserid     VARCHAR2(20),
  tonodeid       NUMBER(10),
  touserid       VARCHAR2(20),
  auditremark    VARCHAR2(640),
  flowid         NUMBER(10),
  username       VARCHAR2(255 CHAR)
)
;
comment on table CPIC_SXDX.C_FAQ_CONTENT
  is '֪ʶ���

1.ɾ�����޸�ʱ��Ҫͬʱ����C_INFO_FAVORITE���C_FAQ_VISIT_RECORD';
comment on column CPIC_SXDX.C_FAQ_CONTENT.contentid
  is 'CONTENTID';
comment on column CPIC_SXDX.C_FAQ_CONTENT.title
  is '���⣺30������';
comment on column CPIC_SXDX.C_FAQ_CONTENT.keyword
  is '�ؼ���, �ö��Ÿ���';
comment on column CPIC_SXDX.C_FAQ_CONTENT.summary
  is 'ժҪ';
comment on column CPIC_SXDX.C_FAQ_CONTENT.isdel
  is ' 0���� 1ɾ��   Ĭ��0
Ϊ1ʱ���������䡣����������䶼������ɾ����';
comment on column CPIC_SXDX.C_FAQ_CONTENT.isprivated
  is '�Ƿ�Ϊ˽��֪ʶ�㡣Ĭ��0��1�ǡ�';
comment on column CPIC_SXDX.C_FAQ_CONTENT.isshared
  is '˽��֪���㣬�Ƿ�Ҫ����
Ĭ��0��1�ǡ�';
comment on column CPIC_SXDX.C_FAQ_CONTENT.companygroupid
  is '��˾֪ʶ����Ŀ¼����Ӧv_faq_group��ͼ��groupId';
comment on column CPIC_SXDX.C_FAQ_CONTENT.tenementid
  is '�⻧id,c_tenement�����
user.getdefaulttenemnetidֵ����';
comment on column CPIC_SXDX.C_FAQ_CONTENT.userid
  is 'ϵͳ�û����';
comment on column CPIC_SXDX.C_FAQ_CONTENT.createdate
  is '����ʱ�䡣Ϊϵͳʱ�䣡�ղ�ʱ�䣨��ȷ��ʱ���룩';
comment on column CPIC_SXDX.C_FAQ_CONTENT.isfocuse
  is '�Ƿ�Ϊ����
Ĭ��0��1�ǡ����Թ�˾֪ʶ����Ч��';
comment on column CPIC_SXDX.C_FAQ_CONTENT.focusdate
  is '���ý����ʱ��';
comment on column CPIC_SXDX.C_FAQ_CONTENT.focususerid
  is '����������';
comment on column CPIC_SXDX.C_FAQ_CONTENT.deletedate
  is 'ɾ��ʱ��';
comment on column CPIC_SXDX.C_FAQ_CONTENT.deleteuserid
  is 'ɾ����';
comment on column CPIC_SXDX.C_FAQ_CONTENT.updatedate
  is '����ʱ�䣬����ϵͳʱ��';
comment on column CPIC_SXDX.C_FAQ_CONTENT.flowstatus
  is '״̬��
    /**
     * ֪ʶ������״̬
     */
    public static final String FAQ_FLOW_STATUS_INIT="00";//����������ʼ����
    public static final String FAQ_FLOW_STATUS_WAITAUDIT="01";//������
    public static final String FAQ_FLOW_STATUS_AUDITING="05";//������
    public static final String FAQ_FLOW_STATUS_OK="10";//����ͨ��
    public static final String FAQ_FLOW_STATUS_FAIL="15";//������ͨ��
';
comment on column CPIC_SXDX.C_FAQ_CONTENT.flowid
  is '�������������̱��';
alter table CPIC_SXDX.C_FAQ_CONTENT
  add constraint PK_C_FAQ_CONTENT primary key (CONTENTID);
alter table CPIC_SXDX.C_FAQ_CONTENT
  add constraint FKDE1F321443965BE3 foreign key (TONODEID)
  references CPIC_SXDX.C_SYS_FLOWNODE (FLOWNODEID);
alter table CPIC_SXDX.C_FAQ_CONTENT
  add constraint FKDE1F32146D7ADDEB foreign key (FOCUSUSERID)
  references CPIC_SXDX.C_USER (USERID);
alter table CPIC_SXDX.C_FAQ_CONTENT
  add constraint FKDE1F3214871CBB3D foreign key (FROMUSERID)
  references CPIC_SXDX.C_USER (USERID);
alter table CPIC_SXDX.C_FAQ_CONTENT
  add constraint FKDE1F32149AB68B13 foreign key (USERID)
  references CPIC_SXDX.C_USER (USERID);
alter table CPIC_SXDX.C_FAQ_CONTENT
  add constraint FKDE1F32149C92914E foreign key (TOUSERID)
  references CPIC_SXDX.C_USER (USERID);

prompt
prompt Creating table C_FAQ_ATTACHMENT
prompt ===============================
prompt
create table CPIC_SXDX.C_FAQ_ATTACHMENT
(
  file_id        NUMBER(10) not null,
  contentid      NUMBER(10),
  contenttype    VARCHAR2(80),
  pathfilename   VARCHAR2(220),
  naturefilename VARCHAR2(120),
  isimgage       NUMBER(1) default 0 not null,
  isonline       NUMBER(1) default 0 not null,
  ismain         NUMBER(1) default 0 not null,
  filedesc       VARCHAR2(64)
)
;
comment on table CPIC_SXDX.C_FAQ_ATTACHMENT
  is 'FAQ������';
comment on column CPIC_SXDX.C_FAQ_ATTACHMENT.file_id
  is 'FILE_ID';
comment on column CPIC_SXDX.C_FAQ_ATTACHMENT.contentid
  is 'CONTENTID';
comment on column CPIC_SXDX.C_FAQ_ATTACHMENT.contenttype
  is '�ļ�����parent_code=faqfiletype

txt���ı�����
html�����ı�����
doc��word2007�����ݸ�ʽ
docx��word2010�����ݸ�ʽ
pdf��pdf�ĵ�
swf��flash��swf�ĵ�
';
comment on column CPIC_SXDX.C_FAQ_ATTACHMENT.pathfilename
  is 'FAQ���ġ���ʽΪ��ftp.getPath+"/"+userid_yyyyMMdd_�����+���.��׺  ���';
comment on column CPIC_SXDX.C_FAQ_ATTACHMENT.naturefilename
  is '�ϴ��ļ���ʵ���ļ���������׺��';
comment on column CPIC_SXDX.C_FAQ_ATTACHMENT.isimgage
  is '�Ƿ�ΪͼƬ��Ĭ��0����Ϊ1.
';
comment on column CPIC_SXDX.C_FAQ_ATTACHMENT.isonline
  is '�Ƿ������߱༭���༭.Ĭ��0������Ϊ1';
comment on column CPIC_SXDX.C_FAQ_ATTACHMENT.ismain
  is '�Ƿ�Ϊ���ġ�
1�ǡ�Ĭ��0';
comment on column CPIC_SXDX.C_FAQ_ATTACHMENT.filedesc
  is '�ļ�����';
create index CPIC_SXDX.RELATIONSHIP_102_FK on CPIC_SXDX.C_FAQ_ATTACHMENT (CONTENTID);
alter table CPIC_SXDX.C_FAQ_ATTACHMENT
  add constraint PK_C_FAQ_ATTACHMENT primary key (FILE_ID);
alter table CPIC_SXDX.C_FAQ_ATTACHMENT
  add constraint FK_C_FAQ_AT_RELATIONS_C_FAQ_CO foreign key (CONTENTID)
  references CPIC_SXDX.C_FAQ_CONTENT (CONTENTID);

prompt
prompt Creating table C_FAQ_AUDIT_LOG
prompt ==============================
prompt
create table CPIC_SXDX.C_FAQ_AUDIT_LOG
(
  logid       NUMBER(10) not null,
  contentid   NUMBER(10) not null,
  fromnodeid  NUMBER(10),
  fromuserid  VARCHAR2(20),
  tonodeid    NUMBER(10),
  touserid    VARCHAR2(20),
  auditremark VARCHAR2(640),
  flowstatus  VARCHAR2(20)
)
;
comment on table CPIC_SXDX.C_FAQ_AUDIT_LOG
  is '֪ʶ����־��';
comment on column CPIC_SXDX.C_FAQ_AUDIT_LOG.logid
  is '����';
comment on column CPIC_SXDX.C_FAQ_AUDIT_LOG.contentid
  is '��� ����C_FAQ_CONTENT������';
comment on column CPIC_SXDX.C_FAQ_AUDIT_LOG.fromnodeid
  is '��Դ������λ';
comment on column CPIC_SXDX.C_FAQ_AUDIT_LOG.fromuserid
  is 'Դϵͳ�û�';
comment on column CPIC_SXDX.C_FAQ_AUDIT_LOG.tonodeid
  is '�����������';
comment on column CPIC_SXDX.C_FAQ_AUDIT_LOG.touserid
  is '�����û�';
comment on column CPIC_SXDX.C_FAQ_AUDIT_LOG.auditremark
  is '�������';
comment on column CPIC_SXDX.C_FAQ_AUDIT_LOG.flowstatus
  is '״̬';
create index CPIC_SXDX.C_FAQ_AUDIT_LOG_INDEX1 on CPIC_SXDX.C_FAQ_AUDIT_LOG (CONTENTID);
alter table CPIC_SXDX.C_FAQ_AUDIT_LOG
  add constraint C_FAQ_AUDIT_LOG_PK primary key (LOGID);
alter table CPIC_SXDX.C_FAQ_AUDIT_LOG
  add constraint C_FAQ_AUDIT_LOG_C_FAQ_CON_FK1 foreign key (CONTENTID)
  references CPIC_SXDX.C_FAQ_CONTENT (CONTENTID);
alter table CPIC_SXDX.C_FAQ_AUDIT_LOG
  add constraint FKF6F0939B2E2085D2 foreign key (FROMNODEID)
  references CPIC_SXDX.C_SYS_FLOWNODE (FLOWNODEID);
alter table CPIC_SXDX.C_FAQ_AUDIT_LOG
  add constraint FKF6F0939B43965BE3 foreign key (TONODEID)
  references CPIC_SXDX.C_SYS_FLOWNODE (FLOWNODEID);
alter table CPIC_SXDX.C_FAQ_AUDIT_LOG
  add constraint FKF6F0939B871CBB3D foreign key (FROMUSERID)
  references CPIC_SXDX.C_USER (USERID);
alter table CPIC_SXDX.C_FAQ_AUDIT_LOG
  add constraint FKF6F0939B9C92914E foreign key (TOUSERID)
  references CPIC_SXDX.C_USER (USERID);

prompt
prompt Creating table C_FAQ_COMMENT
prompt ============================
prompt
create table CPIC_SXDX.C_FAQ_COMMENT
(
  commentid    NUMBER(10) not null,
  contentid    NUMBER(10),
  userid       VARCHAR2(32),
  commentdate  DATE,
  commentlevel VARCHAR2(32),
  content      VARCHAR2(256),
  tenementid   NUMBER(4),
  flowstatus   NUMBER(1),
  flowid       NUMBER(10)
)
;
comment on table CPIC_SXDX.C_FAQ_COMMENT
  is '֪ʶ�����ۣ�';
comment on column CPIC_SXDX.C_FAQ_COMMENT.commentid
  is 'commentid';
comment on column CPIC_SXDX.C_FAQ_COMMENT.contentid
  is '֪ʶ����';
comment on column CPIC_SXDX.C_FAQ_COMMENT.userid
  is '������';
comment on column CPIC_SXDX.C_FAQ_COMMENT.commentdate
  is '����ʱ��';
comment on column CPIC_SXDX.C_FAQ_COMMENT.commentlevel
  is '�������
�����ֵ�
PARENT_ID:DICT_CUSTOMER_FAQ_COMMENTLEVEL
1.���
2.��
3.һ��
4.��
5.���
';
comment on column CPIC_SXDX.C_FAQ_COMMENT.content
  is '��������
��С���ơ�';
comment on column CPIC_SXDX.C_FAQ_COMMENT.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_FAQ_COMMENT.flowstatus
  is '0����������
5��������
10������ͨ��
15������δͨ��

FlowStatusToken.java��
��"FAQ_FLOW"��ͷ�ĳ�����
    public static final String FAQ_FLOW_STATUS_INIT="0";//����������ʼ����
    public static final String FAQ_FLOW_STATUS_AUDITING="5";//������
    public static final String FAQ_FLOW_STATUS_OK="10";//����ͨ��
    public static final String FAQ_FLOW_STATUS_FAIL="15";//������ͨ��';
comment on column CPIC_SXDX.C_FAQ_COMMENT.flowid
  is '��Ӧ���������̱��';
alter table CPIC_SXDX.C_FAQ_COMMENT
  add constraint PK_C_FAQ_COMMENT primary key (COMMENTID);
alter table CPIC_SXDX.C_FAQ_COMMENT
  add constraint FKDE0DEBFA9AB68B13 foreign key (USERID)
  references CPIC_SXDX.C_USER (USERID);

prompt
prompt Creating table C_FAQ_CONTENT_TMP
prompt ================================
prompt
create table CPIC_SXDX.C_FAQ_CONTENT_TMP
(
  contentid           NUMBER(10) not null,
  title               VARCHAR2(64),
  keyword             VARCHAR2(128),
  summary             VARCHAR2(640),
  isprivated          NUMBER(1) default 0 not null,
  isshared            NUMBER(1) default 0 not null,
  companygroupid      VARCHAR2(20),
  tenementid          NUMBER(4),
  userid              VARCHAR2(32),
  createdate          DATE,
  validateresult      VARCHAR2(256),
  companycategorypath VARCHAR2(32),
  pathfilename        VARCHAR2(100),
  naturefilename      VARCHAR2(32)
)
;
comment on table CPIC_SXDX.C_FAQ_CONTENT_TMP
  is '֪ʶ����ʱ��1.ɾ�����޸�ʱ��Ҫͬʱ����C_INFO_FAVORITE���C_FAQ_VISIT_RECORD';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.contentid
  is 'CONTENTID';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.title
  is '���⣺30������';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.keyword
  is '�ؼ���, �ö��Ÿ���';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.summary
  is 'ժҪ';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.isprivated
  is '�Ƿ�Ϊ˽��֪ʶ�㡣Ĭ��0��1�ǡ�';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.isshared
  is '˽��֪���㣬�Ƿ�Ҫ����
Ĭ��0��1�ǡ�';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.companygroupid
  is '��˾֪ʶ����Ŀ¼����Ӧv_faq_group��ͼ��groupId';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.tenementid
  is '�⻧id,c_tenement�����
user.getdefaulttenemnetidֵ����';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.userid
  is 'ϵͳ�û����';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.createdate
  is '����ʱ�䡣Ϊϵͳʱ�䣡�ղ�ʱ�䣨��ȷ��ʱ���룩';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.validateresult
  is '���ֶ�Ϊ�գ���˵��������ȷ�����ֶα���У�������Ϣ����';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.companycategorypath
  is '��˾֪ʶ��Ŀ¼';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.pathfilename
  is '��Ӧftp�ϱ����·�����ļ���';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.naturefilename
  is '�ϴ��ļ���ʵ���ļ���������׺��';
alter table CPIC_SXDX.C_FAQ_CONTENT_TMP
  add constraint PK_C_FAQ_CONTENT_TMP primary key (CONTENTID);

prompt
prompt Creating table C_FAQ_FAVORITE
prompt =============================
prompt
create table CPIC_SXDX.C_FAQ_FAVORITE
(
  favoriteid     NUMBER(10) not null,
  contentid      NUMBER(10),
  favoriteuserid VARCHAR2(32),
  favoritedate   DATE
)
;
comment on table CPIC_SXDX.C_FAQ_FAVORITE
  is '֪ʶ���ղؼ�

�ñ�����һЩ�����ֶΣ�����c_inf���ڼ���ʱ���á�';
comment on column CPIC_SXDX.C_FAQ_FAVORITE.favoriteid
  is '�ղؼб��';
comment on column CPIC_SXDX.C_FAQ_FAVORITE.contentid
  is 'CONTENTID';
comment on column CPIC_SXDX.C_FAQ_FAVORITE.favoriteuserid
  is '��ǰ�ղص��û�';
comment on column CPIC_SXDX.C_FAQ_FAVORITE.favoritedate
  is '�ղ�ʱ�䣨��ȷ��ʱ���룩';
create index CPIC_SXDX.RELATIONSHIP_4_FK on CPIC_SXDX.C_FAQ_FAVORITE (CONTENTID);
alter table CPIC_SXDX.C_FAQ_FAVORITE
  add constraint PK_C_FAQ_FAVORITE primary key (FAVORITEID);
alter table CPIC_SXDX.C_FAQ_FAVORITE
  add constraint FK_C_FAQ_FA_RELATIONS_C_FAQ_CO foreign key (CONTENTID)
  references CPIC_SXDX.C_FAQ_CONTENT (CONTENTID);

prompt
prompt Creating table C_FAQ_MENU
prompt =========================
prompt
create table CPIC_SXDX.C_FAQ_MENU
(
  faqmenuid   NUMBER(32) not null,
  parentid    NUMBER(32),
  menulever   NUMBER(4),
  menuchame   VARCHAR2(100),
  menuename   VARCHAR2(100),
  tenementid  NUMBER(32),
  updateuser  VARCHAR2(32),
  updatedate  DATE,
  validstatus VARCHAR2(1),
  left_val    NUMBER(19),
  right_val   NUMBER(19),
  remark      VARCHAR2(255)
)
;
comment on column CPIC_SXDX.C_FAQ_MENU.faqmenuid
  is 'Ŀ¼ID';
comment on column CPIC_SXDX.C_FAQ_MENU.parentid
  is '����Ŀ¼ID';
comment on column CPIC_SXDX.C_FAQ_MENU.menulever
  is 'Ŀ¼����';
comment on column CPIC_SXDX.C_FAQ_MENU.menuchame
  is 'Ŀ¼����';
comment on column CPIC_SXDX.C_FAQ_MENU.menuename
  is 'Ŀ¼Ӣ������';
comment on column CPIC_SXDX.C_FAQ_MENU.tenementid
  is '�⻧';
comment on column CPIC_SXDX.C_FAQ_MENU.updateuser
  is '�����û�';
comment on column CPIC_SXDX.C_FAQ_MENU.updatedate
  is '����ʱ��';
comment on column CPIC_SXDX.C_FAQ_MENU.validstatus
  is '��Ч��־ 0:��Ч��1Ϊ��Ч ';
comment on column CPIC_SXDX.C_FAQ_MENU.left_val
  is '��֧';
comment on column CPIC_SXDX.C_FAQ_MENU.right_val
  is '��֧';
comment on column CPIC_SXDX.C_FAQ_MENU.remark
  is '��ע';
alter table CPIC_SXDX.C_FAQ_MENU
  add constraint PK_C_FAQ_MENU primary key (FAQMENUID);

prompt
prompt Creating table C_FAQ_VISIT_RECORD
prompt =================================
prompt
create table CPIC_SXDX.C_FAQ_VISIT_RECORD
(
  totalid       NUMBER(10) not null,
  contentid     NUMBER(10) not null,
  visitdatetime DATE,
  userid        VARCHAR2(32)
)
;
comment on table CPIC_SXDX.C_FAQ_VISIT_RECORD
  is '֪ʶ��������ͳ��';
comment on column CPIC_SXDX.C_FAQ_VISIT_RECORD.totalid
  is '����ͳ�Ʊ��';
comment on column CPIC_SXDX.C_FAQ_VISIT_RECORD.contentid
  is 'c_faq_content������';
comment on column CPIC_SXDX.C_FAQ_VISIT_RECORD.visitdatetime
  is '����ʱ��';
comment on column CPIC_SXDX.C_FAQ_VISIT_RECORD.userid
  is '������';
create index CPIC_SXDX.INDEX_FAQ_VISIT_CREATEDATE on CPIC_SXDX.C_FAQ_VISIT_RECORD (VISITDATETIME);
alter table CPIC_SXDX.C_FAQ_VISIT_RECORD
  add constraint PK_C_FAQ_VISIT_RECORD primary key (TOTALID);
alter table CPIC_SXDX.C_FAQ_VISIT_RECORD
  add constraint FK_FAQ_VISIT_RECORD foreign key (CONTENTID)
  references CPIC_SXDX.C_FAQ_CONTENT (CONTENTID);

prompt
prompt Creating table C_FIRSTPAGE_CONTENT
prompt ==================================
prompt
create table CPIC_SXDX.C_FIRSTPAGE_CONTENT
(
  userid     VARCHAR2(32) not null,
  categoryid VARCHAR2(20) not null,
  tenementid NUMBER(4),
  disorder   NUMBER(2) default 0 not null,
  isdisplay  NUMBER(1) default 1 not null,
  id         NUMBER(10) not null,
  layoutid   VARCHAR2(20)
)
;
comment on table CPIC_SXDX.C_FIRSTPAGE_CONTENT
  is '��ҳ����ʾ�����ݵ������';
comment on column CPIC_SXDX.C_FIRSTPAGE_CONTENT.userid
  is 'ϵͳ�ʻ����¼�ʻ���ͬ��Ψһ����
ֻ������ĸ������+�»���';
comment on column CPIC_SXDX.C_FIRSTPAGE_CONTENT.categoryid
  is '�˵�ID';
comment on column CPIC_SXDX.C_FIRSTPAGE_CONTENT.tenementid
  is '�⻧id';
comment on column CPIC_SXDX.C_FIRSTPAGE_CONTENT.disorder
  is '����';
comment on column CPIC_SXDX.C_FIRSTPAGE_CONTENT.isdisplay
  is '�Ƿ���ʾ��Ĭ��1
0���񣨲���ʾ��';
comment on column CPIC_SXDX.C_FIRSTPAGE_CONTENT.id
  is '����';
comment on column CPIC_SXDX.C_FIRSTPAGE_CONTENT.layoutid
  is 'ҳ�沼������ID';
alter table CPIC_SXDX.C_FIRSTPAGE_CONTENT
  add constraint PK_C_FIRSTPAGE_CONTENT primary key (ID);
alter table CPIC_SXDX.C_FIRSTPAGE_CONTENT
  add constraint UNIQUE_C_FIRSTP_RELATIONS unique (USERID, CATEGORYID, TENEMENTID);

prompt
prompt Creating table C_FIRSTPAGE_SHORTCUT
prompt ===================================
prompt
create table CPIC_SXDX.C_FIRSTPAGE_SHORTCUT
(
  shortcutid NUMBER(10) not null,
  categoryid VARCHAR2(20),
  userid     VARCHAR2(32),
  tenementid NUMBER(4),
  disorder   NUMBER(10) default 0
)
;
comment on table CPIC_SXDX.C_FIRSTPAGE_SHORTCUT
  is '�˵���ݹ����';
comment on column CPIC_SXDX.C_FIRSTPAGE_SHORTCUT.shortcutid
  is 'ID';
comment on column CPIC_SXDX.C_FIRSTPAGE_SHORTCUT.categoryid
  is '����
һ��00Ϊһ���˵���0000Ϊ�����˵���000000Ϊ�����˵����Դ����ƣ�
�������ڻĿ¼����faq�ȣ�һ���˵�����λ������ 000��';
comment on column CPIC_SXDX.C_FIRSTPAGE_SHORTCUT.userid
  is 'ϵͳ�ʻ����¼�ʻ���ͬ��Ψһ����
ֻ������ĸ������+�»���';
comment on column CPIC_SXDX.C_FIRSTPAGE_SHORTCUT.tenementid
  is '����';
comment on column CPIC_SXDX.C_FIRSTPAGE_SHORTCUT.disorder
  is '����';
alter table CPIC_SXDX.C_FIRSTPAGE_SHORTCUT
  add constraint PK_C_SHORTCUT primary key (SHORTCUTID);

prompt
prompt Creating table C_GROUP_AREAMOBILE
prompt =================================
prompt
create table CPIC_SXDX.C_GROUP_AREAMOBILE
(
  areamobileid NUMBER(10) not null,
  categoryid   VARCHAR2(20) not null,
  groupcode    NUMBER(16),
  areacode     NUMBER(5),
  mobilefix    NUMBER(7),
  tenementid   NUMBER(4)
)
;
comment on table CPIC_SXDX.C_GROUP_AREAMOBILE
  is '��֯������Ӧ�����ű�';
comment on column CPIC_SXDX.C_GROUP_AREAMOBILE.categoryid
  is 'c_group_properties��������������';
comment on column CPIC_SXDX.C_GROUP_AREAMOBILE.groupcode
  is '����ҵ�����';
comment on column CPIC_SXDX.C_GROUP_AREAMOBILE.areacode
  is '�����������ֵ��ά��';
comment on column CPIC_SXDX.C_GROUP_AREAMOBILE.mobilefix
  is '�ֻ�ǰ׺�����ֵ��ά��.';
comment on column CPIC_SXDX.C_GROUP_AREAMOBILE.tenementid
  is 'ͬc_category_tenement��Ӧ��tenementidֵ��ͬ';
alter table CPIC_SXDX.C_GROUP_AREAMOBILE
  add constraint PK_C_GROUP_AREAMOBILE primary key (AREAMOBILEID);
alter table CPIC_SXDX.C_GROUP_AREAMOBILE
  add constraint FK_GROP_AREAMOBILE_MOBILEFIX unique (CATEGORYID, MOBILEFIX);
alter table CPIC_SXDX.C_GROUP_AREAMOBILE
  add constraint UNIQUE_AREAMOBILE_AREACODE unique (CATEGORYID, AREACODE);

prompt
prompt Creating table C_GROUP_TYPE
prompt ===========================
prompt
create table CPIC_SXDX.C_GROUP_TYPE
(
  grouptypeid NUMBER(2) not null,
  name        VARCHAR2(16) not null,
  isdel       NUMBER(1) default 0 not null
)
;
comment on table CPIC_SXDX.C_GROUP_TYPE
  is '��֯�����������ͱ�,

  GroupTypeToken.java
  public static final Integer GROUPTYPE_GROUP=new Integer(1);//�ܲ���֯����
  public static final Integer GROUPTYPE_GROUPADDRESS=new Integer(5);//ְ��
  public static final Integer GROUPTYPE_HEADQUARTER=new Integer(10);//�ܲ�
  public static final Integer GROUPTYPE_BRANCH=new Integer(15);//�ֹ�˾
  public static final Integer GROUPTYPE_SUBBRANCH=new Integer(20);//����/��֧��˾
  public static final Integer GROUPTYPE_FUNCDEPT=new Integer(25);//ְ�ܲ���/����
  ';
comment on column CPIC_SXDX.C_GROUP_TYPE.grouptypeid
  is '����id';
comment on column CPIC_SXDX.C_GROUP_TYPE.name
  is '����';
comment on column CPIC_SXDX.C_GROUP_TYPE.isdel
  is 'Ĭ��0��ɾ��1';
alter table CPIC_SXDX.C_GROUP_TYPE
  add constraint PK_GROUP_TYPE primary key (GROUPTYPEID);

prompt
prompt Creating table C_GROUP_PROPERTIES
prompt =================================
prompt
create table CPIC_SXDX.C_GROUP_PROPERTIES
(
  categoryid  VARCHAR2(20) not null,
  allname     VARCHAR2(128),
  grouptypeid NUMBER(2) not null,
  groupcode   VARCHAR2(16),
  tenementid  NUMBER(4)
)
;
comment on table CPIC_SXDX.C_GROUP_PROPERTIES
  is '��֯�������Ա�';
comment on column CPIC_SXDX.C_GROUP_PROPERTIES.categoryid
  is '������ͬʱc_Category�������';
comment on column CPIC_SXDX.C_GROUP_PROPERTIES.allname
  is 'ȫ��';
comment on column CPIC_SXDX.C_GROUP_PROPERTIES.grouptypeid
  is '��֯��������(C_GROUP_TYPE),����GroupTypeToken.java�� GROUPTYPE_��ͷ�ĳ���';
comment on column CPIC_SXDX.C_GROUP_PROPERTIES.groupcode
  is '����ҵ�����';
comment on column CPIC_SXDX.C_GROUP_PROPERTIES.tenementid
  is '�⻧id(�����ֶ�),ͬc_category_tenement��Ӧ��tenementidֵ��ͬ';
alter table CPIC_SXDX.C_GROUP_PROPERTIES
  add constraint PK_C_GROUP_PROPERTIES primary key (CATEGORYID);
alter table CPIC_SXDX.C_GROUP_PROPERTIES
  add constraint FK_GROUP_PROPERTIES_GROUPTYPE foreign key (GROUPTYPEID)
  references CPIC_SXDX.C_GROUP_TYPE (GROUPTYPEID);

prompt
prompt Creating table C_ID_BRO
prompt =======================
prompt
create table CPIC_SXDX.C_ID_BRO
(
  name      VARCHAR2(64) not null,
  cachesize NUMBER(10) not null,
  nextvalue NUMBER(20) not null
)
;
alter table CPIC_SXDX.C_ID_BRO
  add constraint PK_ID_BROKER primary key (NAME);

prompt
prompt Creating table C_LOG
prompt ====================
prompt
create table CPIC_SXDX.C_LOG
(
  logid      NUMBER(10) not null,
  function   VARCHAR2(64),
  userid     VARCHAR2(32),
  remark     VARCHAR2(256),
  tenementid NUMBER(4),
  datetime   DATE,
  username   VARCHAR2(32),
  clientip   VARCHAR2(32),
  categoryid VARCHAR2(20),
  businessid VARCHAR2(32)
)
;
comment on table CPIC_SXDX.C_LOG
  is 'ϵͳ��־';
comment on column CPIC_SXDX.C_LOG.logid
  is 'ID';
comment on column CPIC_SXDX.C_LOG.function
  is '����ť��ҳ�水ť��Ӧ������';
comment on column CPIC_SXDX.C_LOG.userid
  is 'c_user�����';
comment on column CPIC_SXDX.C_LOG.remark
  is '��������';
comment on column CPIC_SXDX.C_LOG.tenementid
  is '�⻧id

�⻧IDΪ�յģ���Ϊ��������Ա����־��';
comment on column CPIC_SXDX.C_LOG.datetime
  is '����ʱ��';
comment on column CPIC_SXDX.C_LOG.username
  is '�û���
�����ֶΡ�';
comment on column CPIC_SXDX.C_LOG.clientip
  is '�ͻ���IP��ַ';
comment on column CPIC_SXDX.C_LOG.categoryid
  is '����Id';
comment on column CPIC_SXDX.C_LOG.businessid
  is 'ҵ��Id';
create index CPIC_SXDX.INDEX_LOG_CATEGORYID on CPIC_SXDX.C_LOG (CATEGORYID);
alter table CPIC_SXDX.C_LOG
  add constraint PK_C_LOG primary key (LOGID);

prompt
prompt Creating table C_LOG_CATEGORY
prompt =============================
prompt
create table CPIC_SXDX.C_LOG_CATEGORY
(
  id         NUMBER(10),
  categoryid VARCHAR2(32),
  tenementid NUMBER(4)
)
;
comment on table CPIC_SXDX.C_LOG_CATEGORY
  is 'ϵͳ��־��Ӧ�Ĳ����˵�����Id';
comment on column CPIC_SXDX.C_LOG_CATEGORY.id
  is '����Id';
comment on column CPIC_SXDX.C_LOG_CATEGORY.categoryid
  is '�˵�Id';
comment on column CPIC_SXDX.C_LOG_CATEGORY.tenementid
  is '�⻧���';

prompt
prompt Creating table C_LOG_SERVERINFO
prompt ===============================
prompt
create table CPIC_SXDX.C_LOG_SERVERINFO
(
  macaddress VARCHAR2(32),
  ipaddress  VARCHAR2(16),
  id         NUMBER(10) not null
)
;
comment on table CPIC_SXDX.C_LOG_SERVERINFO
  is '��¼Ӧ�÷�������Ӧ����Ч��mac��ַ��IP��ַ';
comment on column CPIC_SXDX.C_LOG_SERVERINFO.macaddress
  is 'MAC��ַ(Ĭ��)';
comment on column CPIC_SXDX.C_LOG_SERVERINFO.ipaddress
  is 'IP��ַ(Ĭ��)';
comment on column CPIC_SXDX.C_LOG_SERVERINFO.id
  is '����';
alter table CPIC_SXDX.C_LOG_SERVERINFO
  add constraint C_LOG_SERVER primary key (ID);

prompt
prompt Creating table C_LOG_USER_ONLINE
prompt ================================
prompt
create table CPIC_SXDX.C_LOG_USER_ONLINE
(
  userid         VARCHAR2(32) not null,
  logindatetime  DATE not null,
  clientip       VARCHAR2(32),
  tenementid     NUMBER(4),
  onlineid       NUMBER(10) not null,
  logoutdatetime DATE
)
;
comment on table CPIC_SXDX.C_LOG_USER_ONLINE
  is '�û����������

userID��clientIPΨһ';
comment on column CPIC_SXDX.C_LOG_USER_ONLINE.userid
  is '�û�';
comment on column CPIC_SXDX.C_LOG_USER_ONLINE.logindatetime
  is '��¼ʱ��';
comment on column CPIC_SXDX.C_LOG_USER_ONLINE.clientip
  is '�ͻ���IP';
comment on column CPIC_SXDX.C_LOG_USER_ONLINE.tenementid
  is '��ǰ��¼���⻧';
comment on column CPIC_SXDX.C_LOG_USER_ONLINE.onlineid
  is '����';
comment on column CPIC_SXDX.C_LOG_USER_ONLINE.logoutdatetime
  is '�ǳ�ʱ��';
alter table CPIC_SXDX.C_LOG_USER_ONLINE
  add constraint PK_C_LOG_USER_ONLINE primary key (ONLINEID);

prompt
prompt Creating table C_OB_COMPAIGN_DATALIST
prompt =====================================
prompt
create table CPIC_SXDX.C_OB_COMPAIGN_DATALIST
(
  compaignid   NUMBER(10) not null,
  datalistid   NUMBER(10) not null,
  createdate   DATE,
  createuserid VARCHAR2(32)
)
;
comment on table CPIC_SXDX.C_OB_COMPAIGN_DATALIST
  is '��������б��ϵ��
';
comment on column CPIC_SXDX.C_OB_COMPAIGN_DATALIST.compaignid
  is '����';
comment on column CPIC_SXDX.C_OB_COMPAIGN_DATALIST.datalistid
  is '�б���';
comment on column CPIC_SXDX.C_OB_COMPAIGN_DATALIST.createdate
  is '��ʱ��';
comment on column CPIC_SXDX.C_OB_COMPAIGN_DATALIST.createuserid
  is '���û�';
alter table CPIC_SXDX.C_OB_COMPAIGN_DATALIST
  add constraint PK_C_OB_COMPAIGN_DATALIST primary key (COMPAIGNID, DATALISTID);
alter table CPIC_SXDX.C_OB_COMPAIGN_DATALIST
  add constraint OB_COM_DATALIST foreign key (COMPAIGNID)
  references CPIC_SXDX.C_OB_COMPAIGN (COMPAIGNID);

prompt
prompt Creating table C_OB_COMPAIGN_FAQ
prompt ================================
prompt
create table CPIC_SXDX.C_OB_COMPAIGN_FAQ
(
  contentid  NUMBER(10) not null,
  compaignid NUMBER(10) not null,
  id         NUMBER(10) not null
)
;
comment on table CPIC_SXDX.C_OB_COMPAIGN_FAQ
  is '֪ʶ�����󶨹�ϵ��';
comment on column CPIC_SXDX.C_OB_COMPAIGN_FAQ.contentid
  is '֪ʶ����c_faq_content';
comment on column CPIC_SXDX.C_OB_COMPAIGN_FAQ.compaignid
  is '����';
comment on column CPIC_SXDX.C_OB_COMPAIGN_FAQ.id
  is '����';
create unique index CPIC_SXDX.UNIQUE_OB_COMPAIGN_FAQ on CPIC_SXDX.C_OB_COMPAIGN_FAQ (CONTENTID, COMPAIGNID);
alter table CPIC_SXDX.C_OB_COMPAIGN_FAQ
  add constraint PK_C_OB_COMPAIGN_FAQ primary key (ID);
alter table CPIC_SXDX.C_OB_COMPAIGN_FAQ
  add constraint FK_C_OB_COM_FAQ foreign key (COMPAIGNID)
  references CPIC_SXDX.C_OB_COMPAIGN (COMPAIGNID);

prompt
prompt Creating table C_OB_COMPAIGN_PRODUCT
prompt ====================================
prompt
create table CPIC_SXDX.C_OB_COMPAIGN_PRODUCT
(
  id         NUMBER(10) not null,
  compaignid NUMBER(10),
  productid  NUMBER(10),
  suiteid    NUMBER(10)
)
;
comment on table CPIC_SXDX.C_OB_COMPAIGN_PRODUCT
  is '����Ʒ��ϵ��';
comment on column CPIC_SXDX.C_OB_COMPAIGN_PRODUCT.id
  is 'ID';
comment on column CPIC_SXDX.C_OB_COMPAIGN_PRODUCT.compaignid
  is '����';
comment on column CPIC_SXDX.C_OB_COMPAIGN_PRODUCT.productid
  is '��Ʒ������Ϣ���';
comment on column CPIC_SXDX.C_OB_COMPAIGN_PRODUCT.suiteid
  is '�ײͱ��';
create unique index CPIC_SXDX.UNIQUE_OB_COMPAIGN_PRODUCT on CPIC_SXDX.C_OB_COMPAIGN_PRODUCT (COMPAIGNID, PRODUCTID);
create unique index CPIC_SXDX.UNIQUE_OB_COMPAIGN_TSUITE on CPIC_SXDX.C_OB_COMPAIGN_PRODUCT (COMPAIGNID, SUITEID);
alter table CPIC_SXDX.C_OB_COMPAIGN_PRODUCT
  add constraint PK_C_OB_COMPAIGN_PRODUCT primary key (ID);
alter table CPIC_SXDX.C_OB_COMPAIGN_PRODUCT
  add constraint FK_C_OB_COM_PRODUCT foreign key (COMPAIGNID)
  references CPIC_SXDX.C_OB_COMPAIGN (COMPAIGNID);

prompt
prompt Creating table C_OB_WORDSKILL
prompt =============================
prompt
create table CPIC_SXDX.C_OB_WORDSKILL
(
  skillid      NUMBER(10) not null,
  name         VARCHAR2(32) not null,
  content      VARCHAR2(256) not null,
  tenementid   NUMBER(10) not null,
  createdate   DATE not null,
  createuserid VARCHAR2(24) not null,
  isdel        NUMBER(1) default 0 not null
)
;
comment on table CPIC_SXDX.C_OB_WORDSKILL
  is '��������';
comment on column CPIC_SXDX.C_OB_WORDSKILL.skillid
  is '�������';
comment on column CPIC_SXDX.C_OB_WORDSKILL.name
  is '��������';
comment on column CPIC_SXDX.C_OB_WORDSKILL.content
  is '��������';
comment on column CPIC_SXDX.C_OB_WORDSKILL.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_OB_WORDSKILL.createdate
  is '����ʱ��';
comment on column CPIC_SXDX.C_OB_WORDSKILL.createuserid
  is '������';
comment on column CPIC_SXDX.C_OB_WORDSKILL.isdel
  is 'ɾ��
';
alter table CPIC_SXDX.C_OB_WORDSKILL
  add constraint C_OB_WORDSKILL_PK primary key (SKILLID);

prompt
prompt Creating table C_OB_COMPAIGN_SKILL
prompt ==================================
prompt
create table CPIC_SXDX.C_OB_COMPAIGN_SKILL
(
  id         NUMBER(10) not null,
  skillid    NUMBER(10) not null,
  compaignid NUMBER(10) not null
)
;
comment on table CPIC_SXDX.C_OB_COMPAIGN_SKILL
  is 'Ӫ���뻰����ϵ��';
comment on column CPIC_SXDX.C_OB_COMPAIGN_SKILL.id
  is '����';
comment on column CPIC_SXDX.C_OB_COMPAIGN_SKILL.skillid
  is '�������';
comment on column CPIC_SXDX.C_OB_COMPAIGN_SKILL.compaignid
  is '����';
create unique index CPIC_SXDX.UNIQUE_OB_COMPAIGN_SKILL on CPIC_SXDX.C_OB_COMPAIGN_SKILL (SKILLID, COMPAIGNID);
alter table CPIC_SXDX.C_OB_COMPAIGN_SKILL
  add constraint PK_C_OB_COMPAIGN_SKILL primary key (ID);
alter table CPIC_SXDX.C_OB_COMPAIGN_SKILL
  add constraint FK_C_OB_COM_RELATIONS_C_OB_WOR foreign key (SKILLID)
  references CPIC_SXDX.C_OB_WORDSKILL (SKILLID);
alter table CPIC_SXDX.C_OB_COMPAIGN_SKILL
  add constraint FK_OB_COM_WORKSKILL foreign key (COMPAIGNID)
  references CPIC_SXDX.C_OB_COMPAIGN (COMPAIGNID);

prompt
prompt Creating table C_OB_CONFIG
prompt ==========================
prompt
create table CPIC_SXDX.C_OB_CONFIG
(
  tenementid        NUMBER(4) not null,
  predicdtfactory   VARCHAR2(32),
  repeatmodel       NUMBER(4) default 1 not null,
  onlyphoningcasing NUMBER(1) default 0 not null
)
;
comment on table CPIC_SXDX.C_OB_CONFIG
  is 'ָ���⻧��Ӫ������

�������ã�

1.�統ǰ�⻧�£��޶�Ӧ����Ч����ع�����Ĭ�ϰ��ͻ��������Ч��г��ء�';
comment on column CPIC_SXDX.C_OB_CONFIG.tenementid
  is 'tenementId';
comment on column CPIC_SXDX.C_OB_CONFIG.predicdtfactory
  is 'Ԥ�����������


��Ӧ����ContactToken.java����CONTACT_FACTORY��ͷ�ĳ���';
comment on column CPIC_SXDX.C_OB_CONFIG.repeatmodel
  is '��Ч����ط�ʽ

CompaignToken.java
    public final static String COMPAIGN_REPEATTYPE_CUSID="1";       //���ݿͻ��������Ч��ڳ���
    public final static String COMPAIGN_REPEATTYPE_NULL="2";         //����Ч��ڲ�����
    public final static String COMPAIGN_REPEATTYPE_CUSRUNIQUE="3";  //���ݿͻ�Ψһ��Ҫ������Ч��ڳ���

//���ݿͻ�Ψһ��Ҫ������Ч��ڳ���

Ĭ��1';
comment on column CPIC_SXDX.C_OB_CONFIG.onlyphoningcasing
  is '��������ͨ��״̬��¼����

1�ǡ�0��null�񡣣�Ĭ��Ϊ0��,��Ӧ����:compaignToken.java��ONLYPHONECASING_��ͷ�ĳ���';
alter table CPIC_SXDX.C_OB_CONFIG
  add constraint PK_C_OB_CONFIG primary key (TENEMENTID);
alter table CPIC_SXDX.C_OB_CONFIG
  add constraint FK_OB_CONFIG_FACTORYCODE foreign key (PREDICDTFACTORY)
  references CPIC_SXDX.C_CONTACT_FACTORY (FACTORYCODE);

prompt
prompt Creating table C_OB_EXECUTETYPE
prompt ===============================
prompt
create table CPIC_SXDX.C_OB_EXECUTETYPE
(
  executetypeid NUMBER(1) not null,
  name          VARCHAR2(16)
)
;
comment on table CPIC_SXDX.C_OB_EXECUTETYPE
  is 'Ӫ��ִ�з�ʽ����ӦCompaignToken.java����EXECUTE_TYPE��ͷ�ĳ���';
alter table CPIC_SXDX.C_OB_EXECUTETYPE
  add constraint PK_OB_EXECUTETYPE primary key (EXECUTETYPEID);

prompt
prompt Creating table C_OB_LIST_ASSIGN_LOG
prompt ===================================
prompt
create table CPIC_SXDX.C_OB_LIST_ASSIGN_LOG
(
  logid           NUMBER(10) not null,
  compaignid      NUMBER(10) not null,
  datalistid      NUMBER(10) not null,
  userid          VARCHAR2(32) not null,
  planassigncount NUMBER(5) not null,
  factassigncount NUMBER(5) not null,
  acceptcount     NUMBER(5),
  dealcount       NUMBER(5)
)
;
comment on table CPIC_SXDX.C_OB_LIST_ASSIGN_LOG
  is '��������������־';
comment on column CPIC_SXDX.C_OB_LIST_ASSIGN_LOG.logid
  is 'LogId';
comment on column CPIC_SXDX.C_OB_LIST_ASSIGN_LOG.compaignid
  is '����';
comment on column CPIC_SXDX.C_OB_LIST_ASSIGN_LOG.datalistid
  is '�б���';
comment on column CPIC_SXDX.C_OB_LIST_ASSIGN_LOG.userid
  is '��ϯ���';
comment on column CPIC_SXDX.C_OB_LIST_ASSIGN_LOG.planassigncount
  is '�ֹ������������';
comment on column CPIC_SXDX.C_OB_LIST_ASSIGN_LOG.factassigncount
  is 'ʵ�ʷ��������';
comment on column CPIC_SXDX.C_OB_LIST_ASSIGN_LOG.acceptcount
  is '�ܽ��յ�������';
comment on column CPIC_SXDX.C_OB_LIST_ASSIGN_LOG.dealcount
  is 'ʵ�ʲ��������������ύ��Ĵ�����';
alter table CPIC_SXDX.C_OB_LIST_ASSIGN_LOG
  add constraint PK_C_OB_LIST_ASSIGN_LOG primary key (LOGID);

prompt
prompt Creating table C_OB_LIST_POOL
prompt =============================
prompt
create table CPIC_SXDX.C_OB_LIST_POOL
(
  id         NUMBER(10) not null,
  compaignid NUMBER(10) not null,
  cus_id     NUMBER(10) not null,
  datalistid NUMBER(10) not null,
  busisource VARCHAR2(32) not null,
  isimport   NUMBER(1) not null
)
;
comment on table CPIC_SXDX.C_OB_LIST_POOL
  is '������';
comment on column CPIC_SXDX.C_OB_LIST_POOL.id
  is 'id';
comment on column CPIC_SXDX.C_OB_LIST_POOL.compaignid
  is '����';
comment on column CPIC_SXDX.C_OB_LIST_POOL.cus_id
  is '�������';
comment on column CPIC_SXDX.C_OB_LIST_POOL.datalistid
  is '�б���';
comment on column CPIC_SXDX.C_OB_LIST_POOL.busisource
  is 'ҵ����Դ

�����ֵ䣺

parentId=busiSource  ҵ����Դ
';
comment on column CPIC_SXDX.C_OB_LIST_POOL.isimport
  is '�Ƿ��ѵ���Ԥ��ʽ����豸
0��Ĭ�ϣ���1��';
alter table CPIC_SXDX.C_OB_LIST_POOL
  add constraint PK_C_OB_LIST_POOL primary key (ID);

prompt
prompt Creating table C_OB_LIST_TOTAL
prompt ==============================
prompt
create table CPIC_SXDX.C_OB_LIST_TOTAL
(
  logid           NUMBER(10) not null,
  campaignid      NUMBER(10) not null,
  datalistid      NUMBER(10) not null,
  userid          VARCHAR2(32) not null,
  planassigncount NUMBER(5) not null,
  factassigncount NUMBER(5) not null,
  acceptcount     NUMBER(5)
)
;
comment on table CPIC_SXDX.C_OB_LIST_TOTAL
  is '��������ͳ�Ʊ�';
comment on column CPIC_SXDX.C_OB_LIST_TOTAL.logid
  is 'LogId';
comment on column CPIC_SXDX.C_OB_LIST_TOTAL.campaignid
  is '����';
comment on column CPIC_SXDX.C_OB_LIST_TOTAL.datalistid
  is '�б���';
comment on column CPIC_SXDX.C_OB_LIST_TOTAL.userid
  is '��ϯ���';
comment on column CPIC_SXDX.C_OB_LIST_TOTAL.planassigncount
  is '�ֹ������������';
comment on column CPIC_SXDX.C_OB_LIST_TOTAL.factassigncount
  is 'ʵ�ʷ��������';
comment on column CPIC_SXDX.C_OB_LIST_TOTAL.acceptcount
  is '�ܽ��յ�������';
alter table CPIC_SXDX.C_OB_LIST_TOTAL
  add constraint PK_C_OB_LIST_TOTAL primary key (LOGID);

prompt
prompt Creating table C_OB_TOPIC_TYPE
prompt ==============================
prompt
create table CPIC_SXDX.C_OB_TOPIC_TYPE
(
  topictypeid NUMBER(5) not null,
  name        VARCHAR2(32) not null
)
;
comment on table CPIC_SXDX.C_OB_TOPIC_TYPE
  is '�ʾ����

1. ��ѡ��: ��Ϊ topicdetailId
2. ��ѡ��: ��Ϊ��� topicdetailId
3. �ж���:��Ϊ0��1��0��1���档
4. �ʴ���:��Ϊ�ͻ��ش�';
comment on column CPIC_SXDX.C_OB_TOPIC_TYPE.topictypeid
  is 'topictypeid';
comment on column CPIC_SXDX.C_OB_TOPIC_TYPE.name
  is 'name';
alter table CPIC_SXDX.C_OB_TOPIC_TYPE
  add constraint PK_OB_TOPIC_TYPE primary key (TOPICTYPEID);

prompt
prompt Creating table C_OB_TOPIC_GROUP
prompt ===============================
prompt
create table CPIC_SXDX.C_OB_TOPIC_GROUP
(
  topicgroupid NUMBER(10) not null,
  name         VARCHAR2(128) not null,
  topictypeid  NUMBER(5) not null,
  topicid      NUMBER(10) not null,
  disorder     NUMBER(2) not null,
  displaytag   NUMBER(1) not null,
  tenementid   NUMBER(10) not null
)
;
comment on table CPIC_SXDX.C_OB_TOPIC_GROUP
  is '�ʾ���';
comment on column CPIC_SXDX.C_OB_TOPIC_GROUP.topicgroupid
  is '��������';
comment on column CPIC_SXDX.C_OB_TOPIC_GROUP.name
  is '�ʾ����';
comment on column CPIC_SXDX.C_OB_TOPIC_GROUP.topictypeid
  is '�ʾ�����';
comment on column CPIC_SXDX.C_OB_TOPIC_GROUP.topicid
  is '������';
comment on column CPIC_SXDX.C_OB_TOPIC_GROUP.disorder
  is '����';
comment on column CPIC_SXDX.C_OB_TOPIC_GROUP.displaytag
  is '��ʾ����

0 ������ȫ��ʾ
1 ����ʾ
2 ����c_topic_CONDITION������������ʾ';
comment on column CPIC_SXDX.C_OB_TOPIC_GROUP.tenementid
  is '�⻧ID';
alter table CPIC_SXDX.C_OB_TOPIC_GROUP
  add constraint C_OB_TOPIC_GROUP_PK primary key (TOPICGROUPID);
alter table CPIC_SXDX.C_OB_TOPIC_GROUP
  add constraint FK_TOPICTYPE_TOPICGROUP foreign key (TOPICTYPEID)
  references CPIC_SXDX.C_OB_TOPIC_TYPE (TOPICTYPEID);
alter table CPIC_SXDX.C_OB_TOPIC_GROUP
  add constraint FK_TOPIC_TOPICGROUP foreign key (TOPICID)
  references CPIC_SXDX.C_OB_TOPIC (TOPICID);

prompt
prompt Creating table C_OB_TOPIC_DETAIL
prompt ================================
prompt
create table CPIC_SXDX.C_OB_TOPIC_DETAIL
(
  detailid     NUMBER(10) not null,
  topicid      NUMBER(10),
  topicgroupid NUMBER(10),
  code         VARCHAR2(16),
  name         VARCHAR2(64),
  disorder     NUMBER(2) not null,
  displaytag   NUMBER(1) not null,
  tenementid   NUMBER(10)
)
;
comment on table CPIC_SXDX.C_OB_TOPIC_DETAIL
  is 'Ӫ������';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL.detailid
  is '������ϸ���';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL.topicid
  is '������';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL.topicgroupid
  is '����';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL.code
  is '���룬ͬһ��topicgroupId�£�codeΨһ��ֻ�ܲ���ĸ�����֣�

�ж����detailΪ�̶���
code=1
name=��

code=0
name=��';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL.name
  is '��Ŀ����';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL.disorder
  is '����';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL.displaytag
  is '��ʾ����

0 ������ȫ��ʾ
1 ����ʾ
2 ����c_topic_CONDITION������������ʾ';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL.tenementid
  is '�⻧ID';
alter table CPIC_SXDX.C_OB_TOPIC_DETAIL
  add constraint PK_OB_TOPIC_DETAIL primary key (DETAILID);
alter table CPIC_SXDX.C_OB_TOPIC_DETAIL
  add constraint FK_TOPIC_TOPICDETAIL foreign key (TOPICGROUPID)
  references CPIC_SXDX.C_OB_TOPIC_GROUP (TOPICGROUPID);

prompt
prompt Creating table C_OB_TOPIC_CONDITION
prompt ===================================
prompt
create table CPIC_SXDX.C_OB_TOPIC_CONDITION
(
  conditionid     NUMBER(10) not null,
  topicgroupid    NUMBER(10) default 0 not null,
  detailid        NUMBER(10),
  displaygroupid  NUMBER(10),
  displaydetailid NUMBER(10)
)
;
comment on table CPIC_SXDX.C_OB_TOPIC_CONDITION
  is '��������


topicgroupId����Ϊ�գ���Ϊָ�������ʾ����
      ����displaygroupId��displaydetailId����Ϊ�գ���ָ��displaydetailIdѡ��ʱtopicgroupId��ʾ
         ��displaygroupId��Ϊ�պ�displaydetailIdΪ�գ���displaygroupId��ʾʱtopicgroupId��ʾ��
detailid����Ϊ�գ���Ϊָ���������ʾ���ã���displaydetailId��Ϊ�ա�displaygroupIdһ��Ϊ�ա�
         detailid����ʾ����ֻ����ͬһ�����ڵ�detailid���á�

';
comment on column CPIC_SXDX.C_OB_TOPIC_CONDITION.conditionid
  is '������';
comment on column CPIC_SXDX.C_OB_TOPIC_CONDITION.topicgroupid
  is '��������';
comment on column CPIC_SXDX.C_OB_TOPIC_CONDITION.detailid
  is '������ϸ���';
comment on column CPIC_SXDX.C_OB_TOPIC_CONDITION.displaygroupid
  is 'ʹtopicgroupId��ʾ�����������ͬһ����¼��displaydetailId����Ϊ�գ���topicgroupId��Ӧ��displaydetailidΪ��ʾ������';
comment on column CPIC_SXDX.C_OB_TOPIC_CONDITION.displaydetailid
  is 'displaydetailId';
alter table CPIC_SXDX.C_OB_TOPIC_CONDITION
  add constraint PK_C_OB_TOPIC_CONDITION primary key (CONDITIONID);
alter table CPIC_SXDX.C_OB_TOPIC_CONDITION
  add constraint FK_TOPDTAIL_TOPICCONDITION foreign key (DETAILID)
  references CPIC_SXDX.C_OB_TOPIC_DETAIL (DETAILID);
alter table CPIC_SXDX.C_OB_TOPIC_CONDITION
  add constraint FK_TOPGROUP_TOPICCONDICTION foreign key (TOPICGROUPID)
  references CPIC_SXDX.C_OB_TOPIC_GROUP (TOPICGROUPID);

prompt
prompt Creating table C_OB_TOPIC_RESULT
prompt ================================
prompt
create table CPIC_SXDX.C_OB_TOPIC_RESULT
(
  resultid      NUMBER(10) not null,
  callhistoryid NUMBER(10),
  compaignid    NUMBER(10) not null,
  topicid       NUMBER(10),
  taskid        NUMBER(10),
  cus_id        NUMBER(10)
)
;
comment on table CPIC_SXDX.C_OB_TOPIC_RESULT
  is 'Ӫ��������';
comment on column CPIC_SXDX.C_OB_TOPIC_RESULT.resultid
  is '���������';
comment on column CPIC_SXDX.C_OB_TOPIC_RESULT.callhistoryid
  is '������ʷ���';
comment on column CPIC_SXDX.C_OB_TOPIC_RESULT.compaignid
  is '����';
comment on column CPIC_SXDX.C_OB_TOPIC_RESULT.topicid
  is '������';
comment on column CPIC_SXDX.C_OB_TOPIC_RESULT.taskid
  is '������';
comment on column CPIC_SXDX.C_OB_TOPIC_RESULT.cus_id
  is '���';
alter table CPIC_SXDX.C_OB_TOPIC_RESULT
  add constraint PK_C_OB_TOPIC_RESULT primary key (RESULTID);
alter table CPIC_SXDX.C_OB_TOPIC_RESULT
  add constraint FK_C_OB_TOP_RELATIONS_C_OB_COM foreign key (COMPAIGNID)
  references CPIC_SXDX.C_OB_COMPAIGN (COMPAIGNID);
alter table CPIC_SXDX.C_OB_TOPIC_RESULT
  add constraint FK_TOPIC_TOPICRESULT foreign key (TOPICID)
  references CPIC_SXDX.C_OB_TOPIC (TOPICID);

prompt
prompt Creating table C_OB_TOPIC_DETAIL_RESULT
prompt =======================================
prompt
create table CPIC_SXDX.C_OB_TOPIC_DETAIL_RESULT
(
  topicdetailresultid NUMBER(10) not null,
  topicgroupid        NUMBER(10) default 0,
  campaignid          NUMBER(10) not null,
  topicid             NUMBER(10) not null,
  result              NUMBER(10),
  answerremark        VARCHAR2(256),
  callhistoryid       NUMBER(10)
)
;
comment on table CPIC_SXDX.C_OB_TOPIC_DETAIL_RESULT
  is 'Ӫ��������';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL_RESULT.topicdetailresultid
  is '��������ϸ���';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL_RESULT.topicgroupid
  is '��������';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL_RESULT.campaignid
  is '����';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL_RESULT.topicid
  is '�����ţ�C_OB_TOPIC��������';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL_RESULT.result
  is 'ѡ�е���';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL_RESULT.answerremark
  is '������';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL_RESULT.callhistoryid
  is '������ʷ���,c_call_historyId�����';
alter table CPIC_SXDX.C_OB_TOPIC_DETAIL_RESULT
  add constraint PK_C_OB_TOPIC_DETAIL_RESULT primary key (TOPICDETAILRESULTID);
alter table CPIC_SXDX.C_OB_TOPIC_DETAIL_RESULT
  add constraint FK_TOPICGROUP_RESULTDETAIL foreign key (TOPICGROUPID)
  references CPIC_SXDX.C_OB_TOPIC_GROUP (TOPICGROUPID);
alter table CPIC_SXDX.C_OB_TOPIC_DETAIL_RESULT
  add constraint FK_TOPICRESULT_RESULTDETAIL foreign key (TOPICDETAILRESULTID)
  references CPIC_SXDX.C_OB_TOPIC_RESULT (RESULTID);

prompt
prompt Creating table C_ORDER_INFO
prompt ===========================
prompt
create table CPIC_SXDX.C_ORDER_INFO
(
  orderid    NUMBER(10) not null,
  casestatus NUMBER(1) default 0 not null
)
;
comment on table CPIC_SXDX.C_ORDER_INFO
  is '����������Ϣ��';
comment on column CPIC_SXDX.C_ORDER_INFO.orderid
  is '����ID';
comment on column CPIC_SXDX.C_ORDER_INFO.casestatus
  is '����״̬���ֵ�
parent_code=casestatus

=0  ��ʼ��
=1 �������
=2 ��ʼ������
';
alter table CPIC_SXDX.C_ORDER_INFO
  add constraint PK_C_ORDER_INFO primary key (ORDERID);

prompt
prompt Creating table C_ORDER_LOG
prompt ==========================
prompt
create table CPIC_SXDX.C_ORDER_LOG
(
  caselogid       NUMBER(10) not null,
  orderid         NUMBER(10),
  name            VARCHAR2(32),
  fromgroupid     VARCHAR2(20),
  fromuserid      VARCHAR2(24),
  togroupid       VARCHAR2(20),
  touserid        VARCHAR2(24),
  tenementid      NUMBER(4),
  summary         VARCHAR2(128),
  orderstatus     VARCHAR2(24) not null,
  exttablecontent VARCHAR2(1024),
  createdate      DATE,
  productid       NUMBER(10),
  productsuiteid  NUMBER(10),
  cus_id          NUMBER(10),
  task_id         NUMBER(10),
  callhistoryid   NUMBER(10)
)
;
comment on table CPIC_SXDX.C_ORDER_LOG
  is 'c_order_log';
comment on column CPIC_SXDX.C_ORDER_LOG.caselogid
  is '������־���';
comment on column CPIC_SXDX.C_ORDER_LOG.orderid
  is 'orderId';
comment on column CPIC_SXDX.C_ORDER_LOG.name
  is '��������';
comment on column CPIC_SXDX.C_ORDER_LOG.fromgroupid
  is 'Դ��';
comment on column CPIC_SXDX.C_ORDER_LOG.fromuserid
  is 'fromUserId';
comment on column CPIC_SXDX.C_ORDER_LOG.togroupid
  is 'toGroupId';
comment on column CPIC_SXDX.C_ORDER_LOG.touserid
  is 'toUserID';
comment on column CPIC_SXDX.C_ORDER_LOG.tenementid
  is 'tenementid';
comment on column CPIC_SXDX.C_ORDER_LOG.summary
  is '�������';
comment on column CPIC_SXDX.C_ORDER_LOG.orderstatus
  is '����״̬

�����ֵ䣺
parentId=orderStatus


���������ֵ�-->

����Ӧ���� flowstatustoken.java����order_status��ͷ�ĳ�����
00��������
01��������
02��������
90�����
91��ȡ��';
comment on column CPIC_SXDX.C_ORDER_LOG.exttablecontent
  is '��չ��Ϣ���ݡ���ʽ��

fieldId���ֶ���������ֵ|
fieldId���ֶ���������ֵ|
fieldId���ֶ���������ֵ|
fieldId���ֶ���������ֵ|
fieldId���ֶ���������ֵ|';
comment on column CPIC_SXDX.C_ORDER_LOG.createdate
  is '����ʱ��';
comment on column CPIC_SXDX.C_ORDER_LOG.productid
  is '��Ʒ���';
comment on column CPIC_SXDX.C_ORDER_LOG.productsuiteid
  is '�ײͱ��';
comment on column CPIC_SXDX.C_ORDER_LOG.cus_id
  is '�ͻ����';
comment on column CPIC_SXDX.C_ORDER_LOG.task_id
  is '������';
comment on column CPIC_SXDX.C_ORDER_LOG.callhistoryid
  is '������ʷ���';
alter table CPIC_SXDX.C_ORDER_LOG
  add constraint PK_C_ORDER_LOG primary key (CASELOGID);
alter table CPIC_SXDX.C_ORDER_LOG
  add constraint FK_C_ORDER_LOG_ORDER foreign key (ORDERID)
  references CPIC_SXDX.C_ORDER_BAS (ORDERID);

prompt
prompt Creating table C_PARAMETER_TYPE
prompt ===============================
prompt
create table CPIC_SXDX.C_PARAMETER_TYPE
(
  typeid         VARCHAR2(24) not null,
  typename       VARCHAR2(64) not null,
  isbooleanvalue NUMBER(1) default 1 not null,
  isdel          NUMBER(1) default 0 not null,
  defaultvalue   VARCHAR2(16),
  remark         VARCHAR2(128)
)
;
comment on table CPIC_SXDX.C_PARAMETER_TYPE
  is 'ϵͳ��������,isfaqaudit��FAQ�Ƿ�������ismarqueen��������Ƿ�������isplayagentid���Ƿ񱨹��ţ�istransfersurvey���Ƿ�ת����ȵ���';
comment on column CPIC_SXDX.C_PARAMETER_TYPE.typeid
  is '���';
comment on column CPIC_SXDX.C_PARAMETER_TYPE.typename
  is '����';
comment on column CPIC_SXDX.C_PARAMETER_TYPE.isbooleanvalue
  is 'ֵ�Ƿ�Ϊ��������
Ĭ��(1)��   0��

����ǲ������ͣ�������ֵ�ֱ�: 1������, 0�����

';
comment on column CPIC_SXDX.C_PARAMETER_TYPE.isdel
  is 'ֵ�Ƿ�Ϊ��������
Ĭ��(1)��   0��

����ǲ������ͣ�������ֵ�ֱ�: 1������, 0�����

';
comment on column CPIC_SXDX.C_PARAMETER_TYPE.defaultvalue
  is 'Ĭ��ֵ';
alter table CPIC_SXDX.C_PARAMETER_TYPE
  add constraint PK_C_PARAMETER_TYPE primary key (TYPEID);

prompt
prompt Creating table C_PARAMETER_TENEMENT
prompt ===================================
prompt
create table CPIC_SXDX.C_PARAMETER_TENEMENT
(
  id         NUMBER(4) not null,
  tenementid NUMBER(4),
  typeid     VARCHAR2(24),
  typename   VARCHAR2(64),
  paramvalue VARCHAR2(16)
)
;
comment on table CPIC_SXDX.C_PARAMETER_TENEMENT
  is '���⻧��Ӧ�Ĳ�����';
comment on column CPIC_SXDX.C_PARAMETER_TENEMENT.id
  is '���(����)';
comment on column CPIC_SXDX.C_PARAMETER_TENEMENT.tenementid
  is '�⻧ID';
comment on column CPIC_SXDX.C_PARAMETER_TENEMENT.typeid
  is '���ͱ��';
comment on column CPIC_SXDX.C_PARAMETER_TENEMENT.typename
  is '(����)��������';
comment on column CPIC_SXDX.C_PARAMETER_TENEMENT.paramvalue
  is 'ֵ���������Ϊbooleanֵ�Ļ�����ֻ��Ϊtrue��false';
alter table CPIC_SXDX.C_PARAMETER_TENEMENT
  add constraint PK_C_PARAMETER_TENEMENT primary key (ID);
alter table CPIC_SXDX.C_PARAMETER_TENEMENT
  add constraint UNIQUE_C_PARAMETER_TENEMENT unique (TYPEID, TENEMENTID);
alter table CPIC_SXDX.C_PARAMETER_TENEMENT
  add constraint FK_PARAMETERTYPE foreign key (TYPEID)
  references CPIC_SXDX.C_PARAMETER_TYPE (TYPEID);
alter table CPIC_SXDX.C_PARAMETER_TENEMENT
  add constraint FK_TENEMENT foreign key (TENEMENTID)
  references CPIC_SXDX.C_TENEMENT (TENEMENTID)
  disable;

prompt
prompt Creating table C_PRODUCT_DICT_ELEMENT
prompt =====================================
prompt
create table CPIC_SXDX.C_PRODUCT_DICT_ELEMENT
(
  dictelementid NUMBER(10) not null,
  elementname   VARCHAR2(32) not null,
  tenementid    NUMBER(4) not null,
  isdel         NUMBER(1) default 0 not null,
  datatype      VARCHAR2(32) not null,
  disorder      NUMBER(5) default 0 not null
)
;
comment on table CPIC_SXDX.C_PRODUCT_DICT_ELEMENT
  is '��ƷԪ���ֵ��';
comment on column CPIC_SXDX.C_PRODUCT_DICT_ELEMENT.dictelementid
  is 'Ԫ�ر��';
comment on column CPIC_SXDX.C_PRODUCT_DICT_ELEMENT.elementname
  is '��ƷԪ��ֵ';
comment on column CPIC_SXDX.C_PRODUCT_DICT_ELEMENT.tenementid
  is '�⻧ID';
comment on column CPIC_SXDX.C_PRODUCT_DICT_ELEMENT.isdel
  is '�Ƿ�ɾ����Ĭ��0��1�ǡ�';
comment on column CPIC_SXDX.C_PRODUCT_DICT_ELEMENT.datatype
  is '�����ֵ�parent_id=dbdata_typ ��dictionarycode��ֵ
�������ƷԪ�ؽ�����ֵУ��ʱ��CustomFormTokens.getSqlType(dictionarycode)����Typesö�ٽ���У��';
comment on column CPIC_SXDX.C_PRODUCT_DICT_ELEMENT.disorder
  is '����';
alter table CPIC_SXDX.C_PRODUCT_DICT_ELEMENT
  add constraint PK_C_PRODUCT_DICT_ELEMENT primary key (DICTELEMENTID);

prompt
prompt Creating table C_PRODUCT_INFO
prompt =============================
prompt
create table CPIC_SXDX.C_PRODUCT_INFO
(
  productid         NUMBER(10) not null,
  productname       VARCHAR2(64) not null,
  productcode       VARCHAR2(32),
  productcategoryid VARCHAR2(32) not null,
  belong            NUMBER(1) default 0 not null,
  factory           VARCHAR2(32),
  productdate       DATE,
  expiredate        DATE,
  price             NUMBER(10,3),
  saleprice         NUMBER(10,3),
  rate              NUMBER(5,3),
  remark            VARCHAR2(512),
  isdel             NUMBER(1) not null,
  tenementid        NUMBER(4),
  productunit       VARCHAR2(32),
  vali_date         DATE
)
;
comment on table CPIC_SXDX.C_PRODUCT_INFO
  is '��Ʒ������Ϣ';
comment on column CPIC_SXDX.C_PRODUCT_INFO.productid
  is '��Ʒ������Ϣ���';
comment on column CPIC_SXDX.C_PRODUCT_INFO.productname
  is 'Ʒ��';
comment on column CPIC_SXDX.C_PRODUCT_INFO.productcode
  is '��Ʒ���';
comment on column CPIC_SXDX.C_PRODUCT_INFO.productcategoryid
  is '��ƷĿ¼�������ֵ䣨��״��
PARENT_ID=PRO_DICT  ��ƷĿ¼';
comment on column CPIC_SXDX.C_PRODUCT_INFO.belong
  is '0����˾���в�Ʒ
1����������Ʒ';
comment on column CPIC_SXDX.C_PRODUCT_INFO.factory
  is '���ң��б������ֵ䣺PARENT_ID=PROFACTORY  ��Ʒ�����б�';
comment on column CPIC_SXDX.C_PRODUCT_INFO.productdate
  is '����ʱ��';
comment on column CPIC_SXDX.C_PRODUCT_INFO.expiredate
  is '����ʱ��';
comment on column CPIC_SXDX.C_PRODUCT_INFO.price
  is '��Ʒ���ۣ�RMB��Ԫ��';
comment on column CPIC_SXDX.C_PRODUCT_INFO.saleprice
  is '�ۺ�ۣ�RMB��Ԫ��';
comment on column CPIC_SXDX.C_PRODUCT_INFO.rate
  is '���ʣ�100%��';
comment on column CPIC_SXDX.C_PRODUCT_INFO.remark
  is '��Ʒ��ע';
comment on column CPIC_SXDX.C_PRODUCT_INFO.isdel
  is '�Ƿ�ɾ����
0Ĭ�ϡ�
1Ϊɾ����';
comment on column CPIC_SXDX.C_PRODUCT_INFO.tenementid
  is '�⻧Id';
comment on column CPIC_SXDX.C_PRODUCT_INFO.productunit
  is '��Ʒ�Ƽ���λ�������ֵ䣺parent_id=pro_unit';
comment on column CPIC_SXDX.C_PRODUCT_INFO.vali_date
  is '��Чʱ��';
alter table CPIC_SXDX.C_PRODUCT_INFO
  add constraint PK_C_PRODUCT_INFO primary key (PRODUCTID);

prompt
prompt Creating table C_PRODUCT_ELEMENT
prompt ================================
prompt
create table CPIC_SXDX.C_PRODUCT_ELEMENT
(
  elementid     NUMBER(10) not null,
  productid     NUMBER(10),
  dictelementid NUMBER(10),
  elementvalue  VARCHAR2(32)
)
;
comment on table CPIC_SXDX.C_PRODUCT_ELEMENT
  is '��ƷԪ�ر�';
comment on column CPIC_SXDX.C_PRODUCT_ELEMENT.elementid
  is '��ƷԪ�ر��';
comment on column CPIC_SXDX.C_PRODUCT_ELEMENT.productid
  is '��Ʒ������Ϣ���';
comment on column CPIC_SXDX.C_PRODUCT_ELEMENT.dictelementid
  is '��ƷԪ�ش���
';
comment on column CPIC_SXDX.C_PRODUCT_ELEMENT.elementvalue
  is '��ƷԪ��ֵ';
alter table CPIC_SXDX.C_PRODUCT_ELEMENT
  add constraint PK_C_PRODUCT_ELEMENT primary key (ELEMENTID);
alter table CPIC_SXDX.C_PRODUCT_ELEMENT
  add constraint FK_C_PRODUC_FK_ELEMEN_C_PRODUC foreign key (DICTELEMENTID)
  references CPIC_SXDX.C_PRODUCT_DICT_ELEMENT (DICTELEMENTID);
alter table CPIC_SXDX.C_PRODUCT_ELEMENT
  add constraint FK_C_PRODUC_FK_PRODUC_C_PRODUC foreign key (PRODUCTID)
  references CPIC_SXDX.C_PRODUCT_INFO (PRODUCTID);

prompt
prompt Creating table C_PRODUCT_ELEMENT_TMP
prompt ====================================
prompt
create table CPIC_SXDX.C_PRODUCT_ELEMENT_TMP
(
  elementid     NUMBER(10) not null,
  productid     NUMBER(10),
  dictelementid NUMBER(10),
  elementvalue  VARCHAR2(32)
)
;
comment on table CPIC_SXDX.C_PRODUCT_ELEMENT_TMP
  is '��ƷԪ�ر�';
comment on column CPIC_SXDX.C_PRODUCT_ELEMENT_TMP.elementid
  is '��ƷԪ�ر��';
comment on column CPIC_SXDX.C_PRODUCT_ELEMENT_TMP.productid
  is '��Ʒ������Ϣ���';
comment on column CPIC_SXDX.C_PRODUCT_ELEMENT_TMP.dictelementid
  is '��ƷԪ�ش���
';
comment on column CPIC_SXDX.C_PRODUCT_ELEMENT_TMP.elementvalue
  is '��ƷԪ��ֵ';

prompt
prompt Creating table C_PRODUCT_INFO_TMP
prompt =================================
prompt
create table CPIC_SXDX.C_PRODUCT_INFO_TMP
(
  productid           NUMBER(10) not null,
  productname         VARCHAR2(64),
  productcode         VARCHAR2(32),
  productcategoryid   VARCHAR2(32),
  productcategoryname VARCHAR2(32),
  belong              NUMBER(1) default 0,
  factory             VARCHAR2(32),
  factoryname         VARCHAR2(32),
  productdate         DATE,
  expiredate          DATE,
  price               NUMBER(10,3),
  saleprice           NUMBER(10,3),
  rate                NUMBER(5,3),
  tenementid          NUMBER(4),
  productunit         VARCHAR2(32),
  productunitname     VARCHAR2(32),
  validateresult      VARCHAR2(256),
  vali_date           DATE
)
;
comment on table CPIC_SXDX.C_PRODUCT_INFO_TMP
  is '��Ʒ������Ϣ';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.productid
  is '��Ʒ������Ϣ���';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.productname
  is 'Ʒ��';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.productcode
  is '��Ʒ���';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.productcategoryid
  is '��ƷĿ¼�������ֵ䣨��״��
PARENT_ID=PRO_DICT  ��ƷĿ¼';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.productcategoryname
  is 'Ŀ¼����';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.belong
  is '0����˾���в�Ʒ
1����������Ʒ';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.factory
  is '���ң��б������ֵ䣺PARENT_ID=PROFACTORY  ��Ʒ�����б�';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.factoryname
  is '��������';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.productdate
  is '����ʱ��';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.expiredate
  is '����ʱ��';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.price
  is '��Ʒ���ۣ�RMB��Ԫ��';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.saleprice
  is '�ۺ�ۣ�RMB��Ԫ��';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.rate
  is '���ʣ�100%��';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.tenementid
  is '�⻧Id';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.productunit
  is '��Ʒ�Ƽ���λ�������ֵ䣺parent_id=pro_unit';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.productunitname
  is '��λ����';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.validateresult
  is '���ֶ�Ϊ�գ���˵��������ȷ�����ֶα���У�������Ϣ����';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.vali_date
  is '��Чʱ��';

prompt
prompt Creating table C_PRODUCT_SUITE
prompt ==============================
prompt
create table CPIC_SXDX.C_PRODUCT_SUITE
(
  suiteid        NUMBER(10) not null,
  suitename      VARCHAR2(32) not null,
  suiteprice     NUMBER(10,3),
  salesuiteprice NUMBER(10,3),
  suitrate       NUMBER(5,3),
  tenementid     NUMBER(4),
  remark         VARCHAR2(256),
  isdel          NUMBER(1) default 0 not null
)
;
comment on table CPIC_SXDX.C_PRODUCT_SUITE
  is '��Ʒ�׼�';
comment on column CPIC_SXDX.C_PRODUCT_SUITE.suiteid
  is '�ײͱ��';
comment on column CPIC_SXDX.C_PRODUCT_SUITE.suitename
  is '�ײ�����';
comment on column CPIC_SXDX.C_PRODUCT_SUITE.suiteprice
  is '�ײͼ۸�(RMBԪ��';
comment on column CPIC_SXDX.C_PRODUCT_SUITE.salesuiteprice
  is '�ۿ��ײͼ۸�(RMBԪ)';
comment on column CPIC_SXDX.C_PRODUCT_SUITE.suitrate
  is '����(100%)';
comment on column CPIC_SXDX.C_PRODUCT_SUITE.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_PRODUCT_SUITE.remark
  is '�ײ�����';
comment on column CPIC_SXDX.C_PRODUCT_SUITE.isdel
  is 'Ĭ��0��1�ǡ�';
alter table CPIC_SXDX.C_PRODUCT_SUITE
  add constraint PK_C_PRODUCT_SUITE primary key (SUITEID);

prompt
prompt Creating table C_PRODUCT_SUITE_PRODUCT
prompt ======================================
prompt
create table CPIC_SXDX.C_PRODUCT_SUITE_PRODUCT
(
  id        NUMBER(10) not null,
  productid NUMBER(10) not null,
  suiteid   NUMBER(10) not null,
  used      VARCHAR2(32),
  ispresent NUMBER(1) default 0 not null,
  count     NUMBER(10)
)
;
comment on table CPIC_SXDX.C_PRODUCT_SUITE_PRODUCT
  is '��Ʒ�׼����Ʒ��ϵ��
productid  �� suiteid����Ψһ';
comment on column CPIC_SXDX.C_PRODUCT_SUITE_PRODUCT.id
  is '�׼���ϵ��������';
comment on column CPIC_SXDX.C_PRODUCT_SUITE_PRODUCT.productid
  is '��Ʒ������Ϣ���';
comment on column CPIC_SXDX.C_PRODUCT_SUITE_PRODUCT.suiteid
  is '�׼�Id';
comment on column CPIC_SXDX.C_PRODUCT_SUITE_PRODUCT.used
  is '��;
PARENT_ID=PRO_USED   ��;';
comment on column CPIC_SXDX.C_PRODUCT_SUITE_PRODUCT.ispresent
  is '�Ƿ���Ʒ��0��1.�ǣ�Ĭ��0��';
comment on column CPIC_SXDX.C_PRODUCT_SUITE_PRODUCT.count
  is '����';
alter table CPIC_SXDX.C_PRODUCT_SUITE_PRODUCT
  add constraint PK_C_PRODUCT_SUITE_PRODUCT primary key (ID);
alter table CPIC_SXDX.C_PRODUCT_SUITE_PRODUCT
  add constraint FK_PRODUCT_SUITE_INFO foreign key (PRODUCTID)
  references CPIC_SXDX.C_PRODUCT_INFO (PRODUCTID);
alter table CPIC_SXDX.C_PRODUCT_SUITE_PRODUCT
  add constraint FK_PRODUCT_SUITE_SUITE foreign key (SUITEID)
  references CPIC_SXDX.C_PRODUCT_SUITE (SUITEID);

prompt
prompt Creating table C_ROLE
prompt =====================
prompt
create table CPIC_SXDX.C_ROLE
(
  roleid       NUMBER(10) not null,
  tenementid   NUMBER(4),
  name         VARCHAR2(32),
  updatedate   DATE,
  updateuserid VARCHAR2(24),
  isdel        NUMBER(1) default 0 not null,
  remark       VARCHAR2(128),
  role_type    CHAR(2),
  create_user  VARCHAR2(24),
  create_time  DATE
)
;
comment on table CPIC_SXDX.C_ROLE
  is '��ɫ��

����˵����
1��ɾ����ɫ֮ǰ�Ƚ��������ϵͳ�û�ɾ����������ɾ����ɫ��¼��
2��ɾ��ʱ��ͬʱ����ɫ�µĲ˵�Ȩ��Ҳһ��ɾ����
';
comment on column CPIC_SXDX.C_ROLE.roleid
  is 'ROLEID';
comment on column CPIC_SXDX.C_ROLE.tenementid
  is '����';
comment on column CPIC_SXDX.C_ROLE.name
  is '��ɫ��';
comment on column CPIC_SXDX.C_ROLE.updatedate
  is '����ʱ��';
comment on column CPIC_SXDX.C_ROLE.updateuserid
  is '�����û�';
comment on column CPIC_SXDX.C_ROLE.isdel
  is 'Ĭ��0
ɾ��Ϊ1';
comment on column CPIC_SXDX.C_ROLE.remark
  is 'REMARK';
comment on column CPIC_SXDX.C_ROLE.role_type
  is '��ɫ����';
comment on column CPIC_SXDX.C_ROLE.create_user
  is '������';
comment on column CPIC_SXDX.C_ROLE.create_time
  is '����ʱ��';
alter table CPIC_SXDX.C_ROLE
  add constraint PK_C_ROLE primary key (ROLEID);
alter table CPIC_SXDX.C_ROLE
  add constraint FK_C_ROLE_TENEMENT foreign key (TENEMENTID)
  references CPIC_SXDX.C_TENEMENT (TENEMENTID)
  disable;

prompt
prompt Creating table C_ROLE_FUNCTION
prompt ==============================
prompt
create table CPIC_SXDX.C_ROLE_FUNCTION
(
  roleid            NUMBER(10) not null,
  active_categoryid VARCHAR2(32),
  readwrite         NUMBER(1),
  categoryid        VARCHAR2(32),
  functionid        NUMBER(10) not null
)
;
comment on table CPIC_SXDX.C_ROLE_FUNCTION
  is '��ɫ��˵���Ȩ�ޣ�';
comment on column CPIC_SXDX.C_ROLE_FUNCTION.roleid
  is 'ROLEID  ���';
comment on column CPIC_SXDX.C_ROLE_FUNCTION.active_categoryid
  is '�˵���Ӧ�ĻĿ¼';
comment on column CPIC_SXDX.C_ROLE_FUNCTION.readwrite
  is '������༭

0:�����Ȩ
1:�ɶ�д

Ĭ��0';
comment on column CPIC_SXDX.C_ROLE_FUNCTION.categoryid
  is '�˵�ID';
comment on column CPIC_SXDX.C_ROLE_FUNCTION.functionid
  is '��ɫ��������';
alter table CPIC_SXDX.C_ROLE_FUNCTION
  add constraint PK_C_ROLE_FUNCTION primary key (FUNCTIONID);
alter table CPIC_SXDX.C_ROLE_FUNCTION
  add constraint FK_ROLEFUNCTION_C_ROLE foreign key (ROLEID)
  references CPIC_SXDX.C_ROLE (ROLEID);

prompt
prompt Creating table C_SERVER_TYPE
prompt ============================
prompt
create table CPIC_SXDX.C_SERVER_TYPE
(
  servertypeid NUMBER(2) not null,
  name         VARCHAR2(64),
  remark       VARCHAR2(64)
)
;
comment on table CPIC_SXDX.C_SERVER_TYPE
  is '���������

1. ֪ʶ��FTP
2. ����FTP����Ա����Ƭ�ȣ�
3. �������Ͷ�Ӧ�ķ�������Ϣ
4. CTI��������
5. CTI���ݷ�����
6  ¼��������ַ
7. ¼������URL
8  .�ʼ�
9. ����
10. webchat
11 .΢��';
comment on column CPIC_SXDX.C_SERVER_TYPE.servertypeid
  is 'SERVERID';
comment on column CPIC_SXDX.C_SERVER_TYPE.name
  is 'NAME';
comment on column CPIC_SXDX.C_SERVER_TYPE.remark
  is 'REMARK';
alter table CPIC_SXDX.C_SERVER_TYPE
  add constraint PK_C_SERVER_TYPE primary key (SERVERTYPEID);

prompt
prompt Creating table C_SERVER_TENEMENT
prompt ================================
prompt
create table CPIC_SXDX.C_SERVER_TENEMENT
(
  serverid      NUMBER(10) not null,
  name          VARCHAR2(64),
  servertypeid  NUMBER(2),
  tenementid    NUMBER(4),
  serveraddress VARCHAR2(16),
  port          VARCHAR2(8),
  rusername     VARCHAR2(16),
  rpassword     VARCHAR2(16),
  rwusername    VARCHAR2(16),
  rwpassword    VARCHAR2(16),
  ext1          VARCHAR2(32),
  serverpath    VARCHAR2(32)
)
;
comment on table CPIC_SXDX.C_SERVER_TENEMENT
  is '�⻧�ķ�������Ϣ���ñ�';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.serverid
  is 'ID';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.name
  is '�����ֶΣ�����servertypeid�ֵ���е����ơ�';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.servertypeid
  is '����������ID';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.tenementid
  is '�⻧
1�������Ӧ���⻧����صķ�������Ϣ�����⻧��Ӧ�ļ�¼Ϊ������������ڣ��򹫹�������ȡ��';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.serveraddress
  is '������������IP��ַ
';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.port
  is '�˿�';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.rusername
  is '��������Ӧ��ֻ���ʻ�';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.rpassword
  is 'ֻ���ʻ�����';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.rwusername
  is '��д�ʻ�';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.rwpassword
  is '��д�ʻ�����';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.ext1
  is '��չ1';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.serverpath
  is '·��';
alter table CPIC_SXDX.C_SERVER_TENEMENT
  add constraint PK_C_SERVER_INFO primary key (SERVERID);
alter table CPIC_SXDX.C_SERVER_TENEMENT
  add constraint UNIQUE_C_SERVER_INFO unique (SERVERTYPEID, TENEMENTID);
alter table CPIC_SXDX.C_SERVER_TENEMENT
  add constraint PK_SERVERTYPEID foreign key (SERVERTYPEID)
  references CPIC_SXDX.C_SERVER_TYPE (SERVERTYPEID);

prompt
prompt Creating table C_SERVER_GROUP
prompt =============================
prompt
create table CPIC_SXDX.C_SERVER_GROUP
(
  groupid    NUMBER(10) not null,
  groupno    VARCHAR2(32) not null,
  tenementid NUMBER(4),
  name       VARCHAR2(32),
  isdel      NUMBER(1) default 0 not null,
  serverid   NUMBER(10),
  typecode   VARCHAR2(10)
)
;
comment on table CPIC_SXDX.C_SERVER_GROUP
  is '�������飨�����飩�ֵ�';
comment on column CPIC_SXDX.C_SERVER_GROUP.groupno
  is 'GROUPNO, ��Ӧ����Ϊ������';
comment on column CPIC_SXDX.C_SERVER_GROUP.tenementid
  is '����';
comment on column CPIC_SXDX.C_SERVER_GROUP.name
  is '����';
comment on column CPIC_SXDX.C_SERVER_GROUP.isdel
  is 'Ĭ��0
1ɾ��';
comment on column CPIC_SXDX.C_SERVER_GROUP.serverid
  is '���������
���Ϊ�գ�����Ϊ��ͨ�Ļ������飬����Ϊ��Ӧ�ķ�������Ӧ�ļ����顣
��������ȷ�����յ������';
comment on column CPIC_SXDX.C_SERVER_GROUP.typecode
  is '�����ĸ���ϵ��������,���Ϊ����,��Ϊ������';
alter table CPIC_SXDX.C_SERVER_GROUP
  add constraint PK_C_SERVER_GROUP primary key (GROUPID);
alter table CPIC_SXDX.C_SERVER_GROUP
  add constraint UNIQUE_C_SERVER_GROUP unique (GROUPNO, TENEMENTID, TYPECODE, SERVERID);
alter table CPIC_SXDX.C_SERVER_GROUP
  add constraint FK_SERVER_CONTACT_TYPE foreign key (TYPECODE)
  references CPIC_SXDX.C_CONTACT_TYPE (TYPECODE);
alter table CPIC_SXDX.C_SERVER_GROUP
  add constraint FK_SERVER_TENEMENT foreign key (SERVERID)
  references CPIC_SXDX.C_SERVER_TENEMENT (SERVERID);

prompt
prompt Creating table C_SERVER_GROUP_USER
prompt ==================================
prompt
create table CPIC_SXDX.C_SERVER_GROUP_USER
(
  userid     VARCHAR2(32) not null,
  groupid    VARCHAR2(32) not null,
  tenementid NUMBER(4)
)
;
comment on table CPIC_SXDX.C_SERVER_GROUP_USER
  is '�û��ͼ������ϵ��';
comment on column CPIC_SXDX.C_SERVER_GROUP_USER.userid
  is 'ϵͳ�ʻ����¼�ʻ���ͬ��Ψһ����
ֻ������ĸ������+�»���';
comment on column CPIC_SXDX.C_SERVER_GROUP_USER.groupid
  is '��������';
comment on column CPIC_SXDX.C_SERVER_GROUP_USER.tenementid
  is '����';
alter table CPIC_SXDX.C_SERVER_GROUP_USER
  add constraint PK_C_SERVER_GROUP_USER primary key (USERID, GROUPID);
alter table CPIC_SXDX.C_SERVER_GROUP_USER
  add constraint FK_PK_C_SERVER_GROUP_TENEMENT foreign key (TENEMENTID)
  references CPIC_SXDX.C_TENEMENT (TENEMENTID);

prompt
prompt Creating table C_SYS_FLOWNODE_USERGROUP
prompt =======================================
prompt
create table CPIC_SXDX.C_SYS_FLOWNODE_USERGROUP
(
  id         NUMBER(10) not null,
  flownodeid NUMBER(10) not null,
  categoryid VARCHAR2(32) not null,
  tenementid NUMBER(4) not null
)
;
comment on column CPIC_SXDX.C_SYS_FLOWNODE_USERGROUP.id
  is 'ID';
comment on column CPIC_SXDX.C_SYS_FLOWNODE_USERGROUP.flownodeid
  is '���ø�ID';
comment on column CPIC_SXDX.C_SYS_FLOWNODE_USERGROUP.categoryid
  is '�û���ID';
comment on column CPIC_SXDX.C_SYS_FLOWNODE_USERGROUP.tenementid
  is '�⻧ID';
alter table CPIC_SXDX.C_SYS_FLOWNODE_USERGROUP
  add constraint PK_C_SYS_FLOWNODE_USER primary key (ID);
alter table CPIC_SXDX.C_SYS_FLOWNODE_USERGROUP
  add constraint PK_C_SYS_FLOWNODE_IDUSER unique (FLOWNODEID, CATEGORYID);
alter table CPIC_SXDX.C_SYS_FLOWNODE_USERGROUP
  add constraint PK_C_SYS_FLOWNODE_ID foreign key (FLOWNODEID)
  references CPIC_SXDX.C_SYS_FLOWNODE (FLOWNODEID);

prompt
prompt Creating table C_TASK_CONFIG
prompt ============================
prompt
create table CPIC_SXDX.C_TASK_CONFIG
(
  tenementid   NUMBER(4) not null,
  resultrecord NUMBER(5) default 1000 not null
)
;
comment on table CPIC_SXDX.C_TASK_CONFIG
  is '��������

Ĭ��1000����¼��';
comment on column CPIC_SXDX.C_TASK_CONFIG.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_TASK_CONFIG.resultrecord
  is '�������񷵻صĽ�������������';
alter table CPIC_SXDX.C_TASK_CONFIG
  add constraint PK_C_TASK_CONFIG primary key (TENEMENTID);

prompt
prompt Creating table C_TASK_LOG
prompt =========================
prompt
create table CPIC_SXDX.C_TASK_LOG
(
  tasklogid         NUMBER(10) not null,
  taskid            NUMBER(10),
  compaignid        NUMBER(10),
  cus_id            NUMBER(10),
  customename       VARCHAR2(32),
  datalistid        NUMBER(10),
  fromuserid        VARCHAR2(32),
  fromdate          DATE,
  togroupid         VARCHAR2(20),
  touserid          VARCHAR2(32),
  isbook            NUMBER(1) default 0 not null,
  bookdatetime      DATE,
  contacttype       VARCHAR2(10),
  fromtaskid        NUMBER(10),
  tasktypeid        VARCHAR2(32) not null,
  busisource        VARCHAR2(32),
  busitype          VARCHAR2(32) not null,
  taskstatusid      NUMBER(4) not null,
  taskstatuschildid NUMBER(4),
  createdate        DATE,
  createuserid      VARCHAR2(32),
  callhistoryid     NUMBER(10)
)
;
comment on table CPIC_SXDX.C_TASK_LOG
  is '������С��';
comment on column CPIC_SXDX.C_TASK_LOG.tasklogid
  is 'taskLogId';
comment on column CPIC_SXDX.C_TASK_LOG.taskid
  is '������';
comment on column CPIC_SXDX.C_TASK_LOG.compaignid
  is '���ţ������c_ob_compaign�е�������CAMPAIGNID';
comment on column CPIC_SXDX.C_TASK_LOG.cus_id
  is '���';
comment on column CPIC_SXDX.C_TASK_LOG.customename
  is '�ͻ����ƣ������ֶΣ�';
comment on column CPIC_SXDX.C_TASK_LOG.datalistid
  is '�����б���';
comment on column CPIC_SXDX.C_TASK_LOG.fromuserid
  is '�����û�';
comment on column CPIC_SXDX.C_TASK_LOG.fromdate
  is '����ʱ��';
comment on column CPIC_SXDX.C_TASK_LOG.togroupid
  is '���Ϊָ���û������û���Ϊ�û���Ӧ��Ĭ���û��顣

��Ӧv_group��ͼ�е������';
comment on column CPIC_SXDX.C_TASK_LOG.touserid
  is '�����û�Id�������ֵΪ�գ�������ȫ�顣';
comment on column CPIC_SXDX.C_TASK_LOG.isbook
  is '�Ƿ���ԤԼ';
comment on column CPIC_SXDX.C_TASK_LOG.bookdatetime
  is 'ԤԼʱ�䡣��ȷ��ʱ���롣';
comment on column CPIC_SXDX.C_TASK_LOG.contacttype
  is '������ʽ��C_contact_type��  �ɳ����ࣺContactTypeFactoryToken.java�С�CONTACT_TYPE_"ͷ�ĳ�����ʾ';
comment on column CPIC_SXDX.C_TASK_LOG.fromtaskid
  is '����Դ��ţ�����������c_ob_compaign�е�������CAMPAIGNID';
comment on column CPIC_SXDX.C_TASK_LOG.tasktypeid
  is '�������

��Ӧ������
TaskToken.java���ԡ�TASK_TYPE_����ͷ�ĳ���10�����Ӫ��
TaskToken.java���ԡ�TASK_TYPE_����ͷ�ĳ���11������������

������չ';
comment on column CPIC_SXDX.C_TASK_LOG.busisource
  is '������Դ

�����ֵ䣺

parentId=busiSource  ҵ����Դ
';
comment on column CPIC_SXDX.C_TASK_LOG.busitype
  is 'ҵ�����ͣ���״��

�����ֵ䣺

parentId=busiType';
comment on column CPIC_SXDX.C_TASK_LOG.taskstatusid
  is '״̬���
';
comment on column CPIC_SXDX.C_TASK_LOG.taskstatuschildid
  is '��״̬���';
comment on column CPIC_SXDX.C_TASK_LOG.createdate
  is '���񴴽�ʱ��';
comment on column CPIC_SXDX.C_TASK_LOG.createuserid
  is '���񴴽��û�';
comment on column CPIC_SXDX.C_TASK_LOG.callhistoryid
  is '��ǰLOG�ķ�����ʷ���';
alter table CPIC_SXDX.C_TASK_LOG
  add constraint PK_C_TASK_LOG primary key (TASKLOGID);
alter table CPIC_SXDX.C_TASK_LOG
  add constraint FK_C_TASK_L_RELATIONS_C_TASK foreign key (TASKID)
  references CPIC_SXDX.C_TASK (TASKID);

prompt
prompt Creating table C_TASK_PRIORITY
prompt ==============================
prompt
create table CPIC_SXDX.C_TASK_PRIORITY
(
  taskentityfield           VARCHAR2(32) not null,
  remark                    VARCHAR2(32) not null,
  foreign_entity            VARCHAR2(32) not null,
  foreign_entity_field      VARCHAR2(32) not null,
  foreign_entity_orderfield VARCHAR2(32) not null
)
;
comment on table CPIC_SXDX.C_TASK_PRIORITY
  is '������вμ����ȼ�������ֶ��ֵ��';
comment on column CPIC_SXDX.C_TASK_PRIORITY.taskentityfield
  is '������Ӧ��ʵ���ֶ���';
comment on column CPIC_SXDX.C_TASK_PRIORITY.remark
  is '��������';
comment on column CPIC_SXDX.C_TASK_PRIORITY.foreign_entity
  is '�������';
comment on column CPIC_SXDX.C_TASK_PRIORITY.foreign_entity_field
  is '���������';
comment on column CPIC_SXDX.C_TASK_PRIORITY.foreign_entity_orderfield
  is '�����ֶ���';
alter table CPIC_SXDX.C_TASK_PRIORITY
  add constraint PK_C_TASK_PRIORITYFIELD primary key (TASKENTITYFIELD);

prompt
prompt Creating table C_TASK_PRIORITY_BUSISOURCE
prompt =========================================
prompt
create table CPIC_SXDX.C_TASK_PRIORITY_BUSISOURCE
(
  id         NUMBER(10) not null,
  tenementid NUMBER(4) not null,
  busisource VARCHAR2(20) not null,
  disorder   VARCHAR2(20) not null
)
;
comment on table CPIC_SXDX.C_TASK_PRIORITY_BUSISOURCE
  is '������Դ���ȼ������';
comment on column CPIC_SXDX.C_TASK_PRIORITY_BUSISOURCE.id
  is '������Դ���ȼ��������';
comment on column CPIC_SXDX.C_TASK_PRIORITY_BUSISOURCE.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_TASK_PRIORITY_BUSISOURCE.busisource
  is '������Դ';
comment on column CPIC_SXDX.C_TASK_PRIORITY_BUSISOURCE.disorder
  is '����';
alter table CPIC_SXDX.C_TASK_PRIORITY_BUSISOURCE
  add constraint PK_TASK_PRIORITY_BUSISOURCE primary key (ID);
alter table CPIC_SXDX.C_TASK_PRIORITY_BUSISOURCE
  add constraint UNIQUE_PRIORITY_BUSISOURCE unique (TENEMENTID, BUSISOURCE);

prompt
prompt Creating table C_TASK_PRIORITY_CHILDSTATUS
prompt ==========================================
prompt
create table CPIC_SXDX.C_TASK_PRIORITY_CHILDSTATUS
(
  id                NUMBER(10) not null,
  tenementid        NUMBER(4) not null,
  taskstatuschildid NUMBER(10) not null,
  disorder          NUMBER(10) not null
)
;
comment on table CPIC_SXDX.C_TASK_PRIORITY_CHILDSTATUS
  is '������״̬���ȼ������';
comment on column CPIC_SXDX.C_TASK_PRIORITY_CHILDSTATUS.id
  is '״̬���ȼ�����';
comment on column CPIC_SXDX.C_TASK_PRIORITY_CHILDSTATUS.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_TASK_PRIORITY_CHILDSTATUS.taskstatuschildid
  is '��״̬';
comment on column CPIC_SXDX.C_TASK_PRIORITY_CHILDSTATUS.disorder
  is '�����ֶ�';
alter table CPIC_SXDX.C_TASK_PRIORITY_CHILDSTATUS
  add constraint PK_C_TASK_PRIORITY_CHILDSTATUS primary key (ID);
alter table CPIC_SXDX.C_TASK_PRIORITY_CHILDSTATUS
  add constraint UNIQUE_CHILDSTATUS_PRIORITY unique (TENEMENTID, TASKSTATUSCHILDID);
alter table CPIC_SXDX.C_TASK_PRIORITY_CHILDSTATUS
  add constraint FK_CHILDSTATUS_PRIORITY foreign key (TASKSTATUSCHILDID)
  references CPIC_SXDX.C_TASK_STATUS_CHILD (TASKSTATUSCHILDID);

prompt
prompt Creating table C_TASK_PRIORITY_CONFIG
prompt =====================================
prompt
create table CPIC_SXDX.C_TASK_PRIORITY_CONFIG
(
  priorityid      NUMBER(10) not null,
  tenementid      NUMBER(4) not null,
  tasktypeid      VARCHAR2(32) not null,
  taskentityfield VARCHAR2(32) not null,
  disorder        NUMBER(4) not null
)
;
comment on table CPIC_SXDX.C_TASK_PRIORITY_CONFIG
  is '����״̬���ȼ�����

һ���⻧��һ���û�Ψһֵ';
comment on column CPIC_SXDX.C_TASK_PRIORITY_CONFIG.priorityid
  is '���ȼ�����';
comment on column CPIC_SXDX.C_TASK_PRIORITY_CONFIG.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_TASK_PRIORITY_CONFIG.tasktypeid
  is '�������

��Ӧ������
TaskToken.java���ԡ�TASK_TYPE_����ͷ�ĳ���10�����Ӫ��
TaskToken.java���ԡ�TASK_TYPE_����ͷ�ĳ���11������������

������չ';
comment on column CPIC_SXDX.C_TASK_PRIORITY_CONFIG.taskentityfield
  is '�ȼ����ֶ��б�

�ԡ������ŷָ�

�óɿ�����sql��ֱ��ʹ�õ������С�';
comment on column CPIC_SXDX.C_TASK_PRIORITY_CONFIG.disorder
  is '���ȼ�����';
alter table CPIC_SXDX.C_TASK_PRIORITY_CONFIG
  add constraint PK_C_TASK_PRIORITY primary key (PRIORITYID);
alter table CPIC_SXDX.C_TASK_PRIORITY_CONFIG
  add constraint UNIQUE_PRIORITY_CONFIG unique (TENEMENTID, TASKTYPEID, TASKENTITYFIELD);
alter table CPIC_SXDX.C_TASK_PRIORITY_CONFIG
  add constraint FK_PRIORITY_CONFIG_PRORITY foreign key (TASKENTITYFIELD)
  references CPIC_SXDX.C_TASK_PRIORITY (TASKENTITYFIELD);

prompt
prompt Creating table C_TASK_PRIORITY_TASKSTATUS
prompt =========================================
prompt
create table CPIC_SXDX.C_TASK_PRIORITY_TASKSTATUS
(
  id         NUMBER(10) not null,
  tenementid NUMBER(4) not null,
  taskstatus NUMBER(10) not null,
  disorder   NUMBER(4) not null
)
;
comment on table CPIC_SXDX.C_TASK_PRIORITY_TASKSTATUS
  is '����״̬���ȼ������';
comment on column CPIC_SXDX.C_TASK_PRIORITY_TASKSTATUS.id
  is '״̬���ȼ�����';
comment on column CPIC_SXDX.C_TASK_PRIORITY_TASKSTATUS.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_TASK_PRIORITY_TASKSTATUS.taskstatus
  is '����״̬';
comment on column CPIC_SXDX.C_TASK_PRIORITY_TASKSTATUS.disorder
  is '�����ֶ�';
alter table CPIC_SXDX.C_TASK_PRIORITY_TASKSTATUS
  add constraint PK_TASK_PRIORITY_TASKSTATUS primary key (ID);
alter table CPIC_SXDX.C_TASK_PRIORITY_TASKSTATUS
  add constraint UNIQUE_PRIORITY_TASKSTATUS unique (TENEMENTID, TASKSTATUS);
alter table CPIC_SXDX.C_TASK_PRIORITY_TASKSTATUS
  add constraint FK_PRIORITY_TASKSTATUS foreign key (TASKSTATUS)
  references CPIC_SXDX.C_TASK_STATUS (TASKSTATUSID);

prompt
prompt Creating table C_TASK_PRODUCT
prompt =============================
prompt
create table CPIC_SXDX.C_TASK_PRODUCT
(
  id        NUMBER(10) not null,
  taskid    NUMBER(10),
  productid NUMBER(10),
  suiteid   NUMBER(10)
)
;
comment on table CPIC_SXDX.C_TASK_PRODUCT
  is '�������Ʒ�Ĺ�ϵ��';
comment on column CPIC_SXDX.C_TASK_PRODUCT.id
  is 'ID';
comment on column CPIC_SXDX.C_TASK_PRODUCT.taskid
  is '������';
comment on column CPIC_SXDX.C_TASK_PRODUCT.productid
  is '��Ʒ������Ϣ���';
comment on column CPIC_SXDX.C_TASK_PRODUCT.suiteid
  is '�ײͱ��';
create unique index CPIC_SXDX.UNIQUE_TASK_PRODUCT on CPIC_SXDX.C_TASK_PRODUCT (PRODUCTID, TASKID);
create unique index CPIC_SXDX.UNIQUE_TASK_SUITE on CPIC_SXDX.C_TASK_PRODUCT (TASKID, SUITEID);
alter table CPIC_SXDX.C_TASK_PRODUCT
  add constraint PK_C_TASK_PRODUCT primary key (ID);
alter table CPIC_SXDX.C_TASK_PRODUCT
  add constraint FK_C_TASK_P_RELATIONS_C_TASK foreign key (TASKID)
  references CPIC_SXDX.C_TASK (TASKID);

prompt
prompt Creating table C_TEMP
prompt =====================
prompt
create table CPIC_SXDX.C_TEMP
(
  l1 NUMBER(20) not null,
  u1 VARCHAR2(24),
  l2 NUMBER(20) not null,
  u2 VARCHAR2(24)
)
;

prompt
prompt Creating table C_TEST_A
prompt =======================
prompt
create table CPIC_SXDX.C_TEST_A
(
  id   NUMBER,
  name VARCHAR2(32)
)
;

prompt
prompt Creating table C_TEST_B
prompt =======================
prompt
create table CPIC_SXDX.C_TEST_B
(
  id   NUMBER,
  name VARCHAR2(32),
  age  NUMBER
)
;

prompt
prompt Creating table C_TEXT
prompt =====================
prompt
create table CPIC_SXDX.C_TEXT
(
  objectid   NUMBER(10) not null,
  userid     VARCHAR2(32),
  startdate  DATE,
  enddate    DATE,
  tenementid NUMBER(10)
)
;
comment on table CPIC_SXDX.C_TEXT
  is '���Ա�';
alter table CPIC_SXDX.C_TEXT
  add constraint PK_C_TEXT primary key (OBJECTID);

prompt
prompt Creating table C_USER_CONTACT_EXT
prompt =================================
prompt
create table CPIC_SXDX.C_USER_CONTACT_EXT
(
  id                 NUMBER(10) not null,
  typecode           VARCHAR2(32),
  userid             VARCHAR2(32),
  isdel              NUMBER(1) default 0 not null,
  tenementid         NUMBER(4) not null,
  factorycode        VARCHAR2(32),
  typevalue          VARCHAR2(64),
  contacttypedefault NUMBER(1) default 0
)
;
comment on table CPIC_SXDX.C_USER_CONTACT_EXT
  is '�û����緽ʽ��Ӧ����չ��';
comment on column CPIC_SXDX.C_USER_CONTACT_EXT.id
  is '���';
comment on column CPIC_SXDX.C_USER_CONTACT_EXT.typecode
  is '��������';
comment on column CPIC_SXDX.C_USER_CONTACT_EXT.userid
  is '�û����';
comment on column CPIC_SXDX.C_USER_CONTACT_EXT.isdel
  is 'Ĭ��0. 1ɾ��';
comment on column CPIC_SXDX.C_USER_CONTACT_EXT.tenementid
  is '�⻧���';
comment on column CPIC_SXDX.C_USER_CONTACT_EXT.factorycode
  is '���̱��룬C_CONTACT_FACTORY���Ӧ��ֵ';
comment on column CPIC_SXDX.C_USER_CONTACT_EXT.typevalue
  is '������';
comment on column CPIC_SXDX.C_USER_CONTACT_EXT.contacttypedefault
  is '1��,0��.. ���TYPECODE��FACTORYCODE��ֻ��һ��typevalue,�Զ�������Ϊ1';
alter table CPIC_SXDX.C_USER_CONTACT_EXT
  add constraint PK_USER_CONTACT_EXT primary key (ID);
alter table CPIC_SXDX.C_USER_CONTACT_EXT
  add constraint UNIQUE_C_USER_CONTACT_EXT unique (USERID, FACTORYCODE, TYPECODE);
alter table CPIC_SXDX.C_USER_CONTACT_EXT
  add constraint FK_USER_CONTACT_TYPE foreign key (TYPECODE)
  references CPIC_SXDX.C_CONTACT_TYPE (TYPECODE);
alter table CPIC_SXDX.C_USER_CONTACT_EXT
  add constraint FK_USER_FACTORYCODE foreign key (FACTORYCODE)
  references CPIC_SXDX.C_CONTACT_FACTORY (FACTORYCODE);

prompt
prompt Creating table C_USER_FUNCTION
prompt ==============================
prompt
create table CPIC_SXDX.C_USER_FUNCTION
(
  userfunctionid    NUMBER(10) not null,
  userid            VARCHAR2(32) not null,
  categoryid        VARCHAR2(32),
  readwrite         NUMBER(1),
  tenementid        NUMBER(4),
  active_categoryid VARCHAR2(20)
)
;
comment on table CPIC_SXDX.C_USER_FUNCTION
  is 'userid��roleid��category_id��active_categoryid �ĸ��ֶ�Ψ�ˡ�';
comment on column CPIC_SXDX.C_USER_FUNCTION.userfunctionid
  is 'USERFUNCTIONID';
comment on column CPIC_SXDX.C_USER_FUNCTION.userid
  is 'ϵͳ�û�';
comment on column CPIC_SXDX.C_USER_FUNCTION.categoryid
  is '�˵�Id';
comment on column CPIC_SXDX.C_USER_FUNCTION.readwrite
  is '������༭

0:�����Ȩ
1:�ɶ�д

Ĭ��0';
comment on column CPIC_SXDX.C_USER_FUNCTION.tenementid
  is '�⻧ID';
comment on column CPIC_SXDX.C_USER_FUNCTION.active_categoryid
  is '�˵���Ӧ�ĻĿ¼ID�����Ŀ¼IdΪ��ʱ��Ϊ�˵�����Ȩ�ޡ�';
alter table CPIC_SXDX.C_USER_FUNCTION
  add constraint PK_C_USER_FUNCTION primary key (USERFUNCTIONID);

prompt
prompt Creating table C_USER_GROUP
prompt ===========================
prompt
create table CPIC_SXDX.C_USER_GROUP
(
  userid       VARCHAR2(32) not null,
  groupid      VARCHAR2(32) not null,
  tenementid   NUMBER(4),
  isteamleader NUMBER(1) default 0 not null
)
;
comment on table CPIC_SXDX.C_USER_GROUP
  is '�û������û�֮�صĹ�ϵ
C_USER_CATEGORY

��������Աֻ������һ���û��顣';
comment on column CPIC_SXDX.C_USER_GROUP.userid
  is 'ϵͳ�û����';
comment on column CPIC_SXDX.C_USER_GROUP.groupid
  is '�û���ID';
comment on column CPIC_SXDX.C_USER_GROUP.tenementid
  is '�⻧ID';
comment on column CPIC_SXDX.C_USER_GROUP.isteamleader
  is '�Ƿ�Ϊ�Ŷ��쵼��1�ǡ�Ĭ��Ϊ0';
alter table CPIC_SXDX.C_USER_GROUP
  add constraint PK_C_USER_GROUP primary key (USERID, GROUPID);

prompt
prompt Creating table C_USER_ONLINE
prompt ============================
prompt
create table CPIC_SXDX.C_USER_ONLINE
(
  userid        VARCHAR2(32) not null,
  logindatetime DATE not null,
  clientip      VARCHAR2(32),
  tenementid    NUMBER(4),
  onlineid      NUMBER(10) not null
)
;
comment on table CPIC_SXDX.C_USER_ONLINE
  is 'ϵͳ�û����������!

userID��clientIPΨһ, �û�������ͬʱ�ڲ�ͬ���⻧�µ�¼.';
comment on column CPIC_SXDX.C_USER_ONLINE.userid
  is '�û�';
comment on column CPIC_SXDX.C_USER_ONLINE.logindatetime
  is '��¼ʱ��';
comment on column CPIC_SXDX.C_USER_ONLINE.clientip
  is '�ͻ���IP';
comment on column CPIC_SXDX.C_USER_ONLINE.tenementid
  is '��ǰ��¼���⻧';
comment on column CPIC_SXDX.C_USER_ONLINE.onlineid
  is '����';
alter table CPIC_SXDX.C_USER_ONLINE
  add constraint PK_C_USER_ONLINE primary key (ONLINEID);

prompt
prompt Creating table C_USER_ROLE
prompt ==========================
prompt
create table CPIC_SXDX.C_USER_ROLE
(
  roleid     NUMBER(10) not null,
  userid     VARCHAR2(32) not null,
  tenementid NUMBER(4)
)
;
comment on table CPIC_SXDX.C_USER_ROLE
  is '�û����ɫ��ϵ��';
comment on column CPIC_SXDX.C_USER_ROLE.roleid
  is 'ROLEID';
comment on column CPIC_SXDX.C_USER_ROLE.userid
  is 'USERID';
comment on column CPIC_SXDX.C_USER_ROLE.tenementid
  is '�⻧ID';
alter table CPIC_SXDX.C_USER_ROLE
  add constraint PK_C_USER_ROLE primary key (ROLEID, USERID);
alter table CPIC_SXDX.C_USER_ROLE
  add constraint FK_C_USER_R_RELATIONS_C_ROLE foreign key (ROLEID)
  references CPIC_SXDX.C_ROLE (ROLEID);

prompt
prompt Creating table DESTTBL
prompt ======================
prompt
create table CPIC_SXDX.DESTTBL
(
  id         NUMBER(18) not null,
  task_level VARCHAR2(24)
)
;

prompt
prompt Creating table EMP
prompt ==================
prompt
create table CPIC_SXDX.EMP
(
  id   VARCHAR2(10),
  name NVARCHAR2(10),
  sal  NUMBER(7,2),
  age  NUMBER(3)
)
;

prompt
prompt Creating table F_BATCH
prompt ======================
prompt
create table CPIC_SXDX.F_BATCH
(
  batch_id       VARCHAR2(20) not null,
  batch_no       VARCHAR2(20),
  batch_code     VARCHAR2(200),
  batch_name     VARCHAR2(1800),
  create_time    DATE,
  plan_dial_date VARCHAR2(10),
  com_type       VARCHAR2(15),
  prj_id         NUMBER(10),
  company_id     NUMBER(10),
  area_id        NUMBER(6),
  call_times     NUMBER(1),
  back_date      DATE,
  ob_com_id      VARCHAR2(40),
  org_id         NUMBER(10),
  begin_age      NUMBER(3),
  end_age        NUMBER(3),
  task_id        NUMBER(10),
  task_name      VARCHAR2(100),
  begphone       DATE,
  modify_time    DATE,
  status         NUMBER(5) default 0,
  error_content  VARCHAR2(200)
)
;
comment on table CPIC_SXDX.F_BATCH
  is '�������α�';
comment on column CPIC_SXDX.F_BATCH.batch_id
  is '���κ�';
comment on column CPIC_SXDX.F_BATCH.batch_code
  is '���α���';
comment on column CPIC_SXDX.F_BATCH.batch_name
  is '��������';
comment on column CPIC_SXDX.F_BATCH.create_time
  is '����ʱ��';
comment on column CPIC_SXDX.F_BATCH.plan_dial_date
  is '�ƻ���������';
comment on column CPIC_SXDX.F_BATCH.com_type
  is '��������';
comment on column CPIC_SXDX.F_BATCH.prj_id
  is '������Ŀ';
comment on column CPIC_SXDX.F_BATCH.company_id
  is '�ֹ�˾';
comment on column CPIC_SXDX.F_BATCH.area_id
  is '����';
comment on column CPIC_SXDX.F_BATCH.call_times
  is '�������';
comment on column CPIC_SXDX.F_BATCH.back_date
  is '������������';
comment on column CPIC_SXDX.F_BATCH.ob_com_id
  is '�ID';
comment on column CPIC_SXDX.F_BATCH.org_id
  is '����ID';
comment on column CPIC_SXDX.F_BATCH.begin_age
  is '��ʼ����';
comment on column CPIC_SXDX.F_BATCH.end_age
  is '��������';
comment on column CPIC_SXDX.F_BATCH.task_id
  is '������';
comment on column CPIC_SXDX.F_BATCH.task_name
  is '��������';
comment on column CPIC_SXDX.F_BATCH.begphone
  is '��ʼ��������';
comment on column CPIC_SXDX.F_BATCH.status
  is '���δ����־��0ΪĬ�ϣ�1Ϊ��������';
comment on column CPIC_SXDX.F_BATCH.error_content
  is '����������Ϣ';
alter table CPIC_SXDX.F_BATCH
  add constraint PK_SALE_BATCH_EXTERNAL primary key (BATCH_ID);

prompt
prompt Creating table GRAPHS_TABLE
prompt ===========================
prompt
create table CPIC_SXDX.GRAPHS_TABLE
(
  values1 NUMBER,
  values2 NUMBER,
  values3 NUMBER
)
;

prompt
prompt Creating table MONEYSCH_20111220_FULL
prompt =====================================
prompt
create table CPIC_SXDX.MONEYSCH_20111220_FULL
(
  sno               NUMBER(20),
  typeid            NUMBER(7) not null,
  con_id            NUMBER(20),
  policyno          VARCHAR2(20) not null,
  classcode         CHAR(8) not null,
  paysch            CHAR(2) not null,
  delsch            CHAR(1),
  setcode           CHAR(1) not null,
  delfrm            CHAR(1),
  begdate           DATE not null,
  nretdate          DATE,
  pbdate            DATE not null,
  pedate            DATE not null,
  nextdate          DATE,
  benefit_inc       CHAR(1) not null,
  reczip            VARCHAR2(20),
  recaddr           VARCHAR2(500),
  rectele           VARCHAR2(30),
  appointed_bp_date DATE,
  prem_term         VARCHAR2(20),
  bp_option         VARCHAR2(20),
  begtime           NUMBER(11) not null,
  endtime           NUMBER(11) not null,
  branch            CHAR(14) not null,
  etl_time          TIMESTAMP(6) not null,
  src_sys           VARCHAR2(20) not null,
  o_classcode       VARCHAR2(8)
)
nologging;

prompt
prompt Creating table MONEYSCH_DIANXIAO
prompt ================================
prompt
create table CPIC_SXDX.MONEYSCH_DIANXIAO
(
  sno               NUMBER(20),
  typeid            NUMBER(7) not null,
  con_id            NUMBER(20),
  policyno          VARCHAR2(20) not null,
  classcode         CHAR(8) not null,
  paysch            CHAR(2) not null,
  delsch            CHAR(1),
  setcode           CHAR(1) not null,
  delfrm            CHAR(1),
  begdate           DATE not null,
  nretdate          DATE,
  pbdate            DATE not null,
  pedate            DATE not null,
  nextdate          DATE,
  benefit_inc       CHAR(1) not null,
  reczip            VARCHAR2(20),
  recaddr           VARCHAR2(500),
  rectele           VARCHAR2(30),
  appointed_bp_date DATE,
  prem_term         VARCHAR2(20),
  bp_option         VARCHAR2(20),
  begtime           NUMBER(11) not null,
  endtime           NUMBER(11) not null,
  branch            CHAR(14) not null,
  etl_time          TIMESTAMP(6) not null,
  src_sys           VARCHAR2(20) not null,
  o_classcode       VARCHAR2(8)
)
;

prompt
prompt Creating table MONEYSCH_DIANXIAO_FULL
prompt =====================================
prompt
create table CPIC_SXDX.MONEYSCH_DIANXIAO_FULL
(
  sno               NUMBER(20),
  typeid            NUMBER(7) not null,
  con_id            NUMBER(20),
  policyno          VARCHAR2(20) not null,
  classcode         CHAR(8) not null,
  paysch            CHAR(2) not null,
  delsch            CHAR(1),
  setcode           CHAR(1) not null,
  delfrm            CHAR(1),
  begdate           DATE not null,
  nretdate          DATE,
  pbdate            DATE not null,
  pedate            DATE not null,
  nextdate          DATE,
  benefit_inc       CHAR(1) not null,
  reczip            VARCHAR2(20),
  recaddr           VARCHAR2(500),
  rectele           VARCHAR2(30),
  appointed_bp_date DATE,
  prem_term         VARCHAR2(20),
  bp_option         VARCHAR2(20),
  begtime           NUMBER(11) not null,
  endtime           NUMBER(11) not null,
  branch            CHAR(14) not null,
  etl_time          TIMESTAMP(6) not null,
  src_sys           VARCHAR2(20) not null,
  o_classcode       VARCHAR2(8)
)
;

prompt
prompt Creating table MONEYSCH_SHENGCHAN
prompt =================================
prompt
create table CPIC_SXDX.MONEYSCH_SHENGCHAN
(
  policyno    VARCHAR2(20),
  classcode   CHAR(8),
  paysch      CHAR(2),
  init_paysch CHAR(2)
)
nologging;

prompt
prompt Creating table PERSON_111226
prompt ============================
prompt
create table CPIC_SXDX.PERSON_111226
(
  sno              NUMBER(20) not null,
  typeid           NUMBER(7) not null,
  person_id        NUMBER(20),
  persontype       NUMBER(20) not null,
  bthdate          DATE,
  diedate          DATE,
  edulevel         CHAR(2),
  sex              CHAR(1),
  income           NUMBER(20,6),
  company          VARCHAR2(90),
  marriage         CHAR(3),
  smoker           CHAR(1),
  blood            NUMBER(20),
  ethnicity        CHAR(2),
  hdesp            CHAR(1),
  customerid       VARCHAR2(40),
  name             VARCHAR2(120),
  job              CHAR(7),
  drvcard          VARCHAR2(2),
  country          CHAR(2),
  residence        VARCHAR2(90),
  id               VARCHAR2(40) not null,
  id15             VARCHAR2(40),
  idtype           CHAR(2) not null,
  cust_id05        VARCHAR2(20),
  source_person_id VARCHAR2(20) not null,
  reg_date         DATE,
  begtime          NUMBER(11) not null,
  endtime          NUMBER(11) not null,
  branch           CHAR(14) not null,
  etl_time         DATE not null,
  src_sys          VARCHAR2(20) not null
)
;

prompt
prompt Creating table PERSON_SOURCE_ID
prompt ===============================
prompt
create table CPIC_SXDX.PERSON_SOURCE_ID
(
  source_id VARCHAR2(20)
)
;

prompt
prompt Creating table PERSON_SOURCE_ID_201203
prompt ======================================
prompt
create table CPIC_SXDX.PERSON_SOURCE_ID_201203
(
  source_id VARCHAR2(20)
)
;

prompt
prompt Creating table PERSON_SPID_QUE
prompt ==============================
prompt
create table CPIC_SXDX.PERSON_SPID_QUE
(
  owner_source_id VARCHAR2(40)
)
;

prompt
prompt Creating table PERSON_TO_20111226_FULL
prompt ======================================
prompt
create table CPIC_SXDX.PERSON_TO_20111226_FULL
(
  sno              NUMBER(20) not null,
  typeid           NUMBER(7) not null,
  person_id        NUMBER(20),
  persontype       NUMBER(20) not null,
  bthdate          DATE,
  diedate          DATE,
  edulevel         CHAR(2),
  sex              CHAR(1),
  income           NUMBER(20,6),
  company          VARCHAR2(90),
  marriage         CHAR(3),
  smoker           CHAR(1),
  blood            NUMBER(20),
  ethnicity        CHAR(2),
  hdesp            CHAR(1),
  customerid       VARCHAR2(40),
  name             VARCHAR2(120),
  job              CHAR(7),
  drvcard          VARCHAR2(2),
  country          CHAR(2),
  residence        VARCHAR2(90),
  id               VARCHAR2(40) not null,
  id15             VARCHAR2(40),
  idtype           CHAR(2) not null,
  cust_id05        VARCHAR2(20),
  source_person_id VARCHAR2(20) not null,
  reg_date         DATE,
  begtime          NUMBER(11) not null,
  endtime          NUMBER(11) not null,
  branch           CHAR(14) not null,
  etl_time         DATE not null,
  src_sys          VARCHAR2(20) not null
)
nologging;

prompt
prompt Creating table PHONE
prompt ====================
prompt
create table CPIC_SXDX.PHONE
(
  sno              NUMBER(20),
  typeid           NUMBER(7) not null,
  areacode         VARCHAR2(20),
  countrycode      VARCHAR2(20),
  tel              VARCHAR2(20),
  ext              VARCHAR2(20),
  type             CHAR(1) not null,
  telnumber        VARCHAR2(100) not null,
  usage            CHAR(1) not null,
  person_id        NUMBER(20),
  pid              VARCHAR2(40) not null,
  idtype           CHAR(2) not null,
  purpose          CHAR(1) not null,
  seq              VARCHAR2(10) not null,
  source_person_id VARCHAR2(20) not null,
  id15             VARCHAR2(40),
  begtime          NUMBER(11) not null,
  endtime          NUMBER(11) not null,
  branch           CHAR(14) not null,
  etl_time         DATE not null,
  src_sys          VARCHAR2(20) not null
)
;

prompt
prompt Creating table PHONE_111226
prompt ===========================
prompt
create table CPIC_SXDX.PHONE_111226
(
  sno              NUMBER(20),
  typeid           NUMBER(7) not null,
  areacode         VARCHAR2(20),
  countrycode      VARCHAR2(20),
  tel              VARCHAR2(20),
  ext              VARCHAR2(20),
  type             CHAR(1) not null,
  telnumber        VARCHAR2(100) not null,
  usage            CHAR(1) not null,
  person_id        NUMBER(20),
  pid              VARCHAR2(40) not null,
  idtype           CHAR(2) not null,
  purpose          CHAR(1) not null,
  seq              VARCHAR2(10) not null,
  source_person_id VARCHAR2(20) not null,
  id15             VARCHAR2(40),
  begtime          NUMBER(11) not null,
  endtime          NUMBER(11) not null,
  branch           CHAR(14) not null,
  etl_time         DATE not null,
  src_sys          VARCHAR2(20) not null
)
;

prompt
prompt Creating table PHONE_ID_QUE
prompt ===========================
prompt
create table CPIC_SXDX.PHONE_ID_QUE
(
  apid VARCHAR2(80)
)
;

prompt
prompt Creating table PHONE_SOURCE_ID
prompt ==============================
prompt
create table CPIC_SXDX.PHONE_SOURCE_ID
(
  source_id VARCHAR2(20)
)
;

prompt
prompt Creating table PHONE_SOURCE_ID_201203
prompt =====================================
prompt
create table CPIC_SXDX.PHONE_SOURCE_ID_201203
(
  source_id VARCHAR2(20)
)
;

prompt
prompt Creating table PHONE_SPID_QUE
prompt =============================
prompt
create table CPIC_SXDX.PHONE_SPID_QUE
(
  owner_source_id VARCHAR2(40)
)
;

prompt
prompt Creating table PHONE_TO_20111226_FULL
prompt =====================================
prompt
create table CPIC_SXDX.PHONE_TO_20111226_FULL
(
  sno              NUMBER(20),
  typeid           NUMBER(7) not null,
  areacode         VARCHAR2(20),
  countrycode      VARCHAR2(20),
  tel              VARCHAR2(20),
  ext              VARCHAR2(20),
  type             CHAR(1) not null,
  telnumber        VARCHAR2(100) not null,
  usage            CHAR(1) not null,
  person_id        NUMBER(20),
  pid              VARCHAR2(40) not null,
  idtype           CHAR(2) not null,
  purpose          CHAR(1) not null,
  seq              VARCHAR2(10) not null,
  source_person_id VARCHAR2(20) not null,
  id15             VARCHAR2(40),
  begtime          NUMBER(11) not null,
  endtime          NUMBER(11) not null,
  branch           CHAR(14) not null,
  etl_time         DATE not null,
  src_sys          VARCHAR2(20) not null
)
nologging;

prompt
prompt Creating table PLAN_TABLE
prompt =========================
prompt
create table CPIC_SXDX.PLAN_TABLE
(
  statement_id    VARCHAR2(30),
  timestamp       DATE,
  remarks         VARCHAR2(80),
  operation       VARCHAR2(30),
  options         VARCHAR2(30),
  object_node     VARCHAR2(128),
  object_owner    VARCHAR2(30),
  object_name     VARCHAR2(30),
  object_instance INTEGER,
  object_type     VARCHAR2(30),
  optimizer       VARCHAR2(255),
  search_columns  NUMBER,
  id              INTEGER,
  parent_id       INTEGER,
  position        INTEGER,
  cost            INTEGER,
  cardinality     INTEGER,
  bytes           INTEGER,
  other_tag       VARCHAR2(255),
  partition_start VARCHAR2(255),
  partition_stop  VARCHAR2(255),
  partition_id    INTEGER,
  other           LONG,
  distribution    VARCHAR2(30),
  cpu_cost        INTEGER,
  io_cost         INTEGER,
  temp_space      INTEGER
)
;

prompt
prompt Creating table POLICY_SEND
prompt ==========================
prompt
create table CPIC_SXDX.POLICY_SEND
(
  sno          NUMBER(20),
  typeid       NUMBER(7),
  policyno     VARCHAR2(20),
  empno        VARCHAR2(20),
  senddate     DATE,
  canceldate   DATE,
  process_date DATE,
  sendoperno   VARCHAR2(20),
  canceloperno VARCHAR2(20),
  begtime      NUMBER(11),
  endtime      NUMBER(11),
  branch       CHAR(14),
  etl_time     TIMESTAMP(6),
  src_sys      VARCHAR2(20)
)
;

prompt
prompt Creating table PRINT_ACTVTY
prompt ===========================
prompt
create table CPIC_SXDX.PRINT_ACTVTY
(
  print_actvty_id     NUMBER(20),
  sno                 NUMBER(20),
  print_job_name      VARCHAR2(100),
  print_type          CHAR(20),
  oper_type           CHAR(1),
  print_busi_no       VARCHAR2(60),
  status              CHAR(1),
  create_date         DATE,
  print_date          DATE,
  dispatch_date       DATE,
  receive_date        DATE,
  oper_no             VARCHAR2(20),
  print_pieces        NUMBER(10),
  print_desc          VARCHAR2(1024),
  commit_date         DATE,
  print_center        VARCHAR2(20),
  busi_branch         VARCHAR2(20),
  dispatch_branch_lv4 VARCHAR2(14),
  begtime             NUMBER(11),
  endtime             NUMBER(11),
  branch              CHAR(14),
  etl_time            TIMESTAMP(6),
  src_sys             VARCHAR2(20)
)
;

prompt
prompt Creating table RPT_DEAL_BIZ_DAY
prompt ===============================
prompt
create table CPIC_SXDX.RPT_DEAL_BIZ_DAY
(
  ob_com_id    NUMBER(10),
  agent_id     NUMBER(10),
  ob_com_name  VARCHAR2(50),
  user_name    VARCHAR2(50),
  batch_id     NUMBER(10),
  batch_name   VARCHAR2(50),
  cust_list    NUMBER(10),
  contact_list NUMBER(10),
  contact_rate VARCHAR2(20),
  deal_list    NUMBER(10),
  deal_rate    VARCHAR2(20),
  year_list    NUMBER(10),
  year_totail  NUMBER(10,2),
  month_list   NUMBER(10),
  month_totail NUMBER(10,2),
  current_date DATE,
  call_list    NUMBER(10)
)
;
comment on table CPIC_SXDX.RPT_DEAL_BIZ_DAY
  is 'ҵ��ɽ�ͳ�Ʊ�';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.ob_com_id
  is '����';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.agent_id
  is '��ϯ����';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.ob_com_name
  is '�����';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.user_name
  is '�û�����';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.batch_id
  is '���α��';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.batch_name
  is '��������';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.cust_list
  is '��������';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.contact_list
  is '�Ӵ���';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.contact_rate
  is '�Ӵ���';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.deal_list
  is '�ɽ���';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.deal_rate
  is '�ɽ���';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.year_list
  is '���';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.year_totail
  is '��ɶ�';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.month_list
  is '�½�';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.month_totail
  is '�½ɶ�';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.current_date
  is '�浵ʱ��';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.call_list
  is '��������';

prompt
prompt Creating table TB_APPLICATION
prompt =============================
prompt
create table CPIC_SXDX.TB_APPLICATION
(
  application_id VARCHAR2(18) not null,
  appno          VARCHAR2(18),
  policyno       VARCHAR2(18),
  idorg          VARCHAR2(18),
  iddmsystem     VARCHAR2(24),
  iddmtype       VARCHAR2(4),
  firstcreate    DATE,
  lastupdate     DATE,
  isubmit        VARCHAR2(1),
  iaccept        VARCHAR2(1),
  recordstatus   VARCHAR2(2),
  tsrid          VARCHAR2(16),
  last_log       NUMBER(10),
  product_name   VARCHAR2(50),
  campaign_name  VARCHAR2(1024),
  vaildaty       VARCHAR2(10),
  ialter         VARCHAR2(1),
  irepeal        VARCHAR2(1),
  iupdate        VARCHAR2(1),
  app_status     VARCHAR2(3),
  prj_id         NUMBER(10),
  ai_rel         VARCHAR2(3),
  acus_licno     VARCHAR2(50),
  acus_mob       VARCHAR2(50),
  acus_gender    VARCHAR2(2),
  acus_name      VARCHAR2(50),
  icus_licno     VARCHAR2(50),
  icus_mob       VARCHAR2(50),
  icus_gender    VARCHAR2(2),
  icus_name      VARCHAR2(50),
  agent_id       VARCHAR2(50),
  total_fee      NUMBER(20,4),
  org_id         NUMBER(10),
  site_status    VARCHAR2(2),
  pro_status     VARCHAR2(2),
  is_del         VARCHAR2(1) default '0' not null,
  ob_com_id      NUMBER(10),
  task_id        NUMBER(18),
  verify_status  CHAR(1),
  verify_note    VARCHAR2(1024),
  update_user    VARCHAR2(24),
  verify_date    DATE,
  product_id     NUMBER(20),
  export_flag    CHAR(1),
  export_time    DATE,
  fee_desc       VARCHAR2(1000),
  note           VARCHAR2(1024),
  preappno       VARCHAR2(18),
  agreequitinsu  VARCHAR2(1),
  is_elecbill    VARCHAR2(1) default '0',
  is_realtime    VARCHAR2(1) default '0',
  product_type   VARCHAR2(5)
)
;
comment on table CPIC_SXDX.TB_APPLICATION
  is 'Ͷ����������Ϣ��';
comment on column CPIC_SXDX.TB_APPLICATION.application_id
  is 'Ͷ����ID';
comment on column CPIC_SXDX.TB_APPLICATION.appno
  is 'Ͷ������';
comment on column CPIC_SXDX.TB_APPLICATION.policyno
  is '������';
comment on column CPIC_SXDX.TB_APPLICATION.idorg
  is '��֧��˾����';
comment on column CPIC_SXDX.TB_APPLICATION.iddmsystem
  is '�ⲿϵͳͶ����ID';
comment on column CPIC_SXDX.TB_APPLICATION.iddmtype
  is '������Դ����';
comment on column CPIC_SXDX.TB_APPLICATION.firstcreate
  is '����ʱ��';
comment on column CPIC_SXDX.TB_APPLICATION.lastupdate
  is '�޸�ʱ��';
comment on column CPIC_SXDX.TB_APPLICATION.isubmit
  is '�Ƿ��ύ';
comment on column CPIC_SXDX.TB_APPLICATION.iaccept
  is '�Ƿ���سɹ� Ĭ�� 0 ��1 ����سɹ�';
comment on column CPIC_SXDX.TB_APPLICATION.tsrid
  is '¼����ϯ����';
comment on column CPIC_SXDX.TB_APPLICATION.product_name
  is '��Ʒ����';
comment on column CPIC_SXDX.TB_APPLICATION.campaign_name
  is '�����';
comment on column CPIC_SXDX.TB_APPLICATION.ialter
  is '�Ƿ����޸� 1��';
comment on column CPIC_SXDX.TB_APPLICATION.irepeal
  is '�Ƿ���  1��';
comment on column CPIC_SXDX.TB_APPLICATION.iupdate
  is '�Ƿ����  1��';
comment on column CPIC_SXDX.TB_APPLICATION.app_status
  is 'Ͷ����״̬';
comment on column CPIC_SXDX.TB_APPLICATION.prj_id
  is '��ĿID';
comment on column CPIC_SXDX.TB_APPLICATION.ai_rel
  is 'Ͷ���˺ͱ����˹�ϵ';
comment on column CPIC_SXDX.TB_APPLICATION.acus_licno
  is 'Ͷ����֤����';
comment on column CPIC_SXDX.TB_APPLICATION.acus_mob
  is 'Ͷ���ֻ�';
comment on column CPIC_SXDX.TB_APPLICATION.acus_gender
  is 'Ͷ�����Ա�';
comment on column CPIC_SXDX.TB_APPLICATION.acus_name
  is 'Ͷ��������';
comment on column CPIC_SXDX.TB_APPLICATION.icus_licno
  is '������֤����';
comment on column CPIC_SXDX.TB_APPLICATION.icus_mob
  is '������Ͷ���ֻ�';
comment on column CPIC_SXDX.TB_APPLICATION.icus_gender
  is '�������Ա�';
comment on column CPIC_SXDX.TB_APPLICATION.icus_name
  is '����������';
comment on column CPIC_SXDX.TB_APPLICATION.agent_id
  is 'ҵ��Ա����';
comment on column CPIC_SXDX.TB_APPLICATION.total_fee
  is '�ܱ���';
comment on column CPIC_SXDX.TB_APPLICATION.org_id
  is 'ʵ������Ȩ�޹���';
comment on column CPIC_SXDX.TB_APPLICATION.site_status
  is '�Ƿ��˻��ֳ���00-��������01-�Ѿ��˻��ֳ���';
comment on column CPIC_SXDX.TB_APPLICATION.pro_status
  is '00-����У����ͨ������˲�ͨ��ΪNULL';
comment on column CPIC_SXDX.TB_APPLICATION.is_del
  is '�Ƿ�ɾ����0Ϊ��1Ϊ�ǣ�';
comment on column CPIC_SXDX.TB_APPLICATION.ob_com_id
  is '�����';
comment on column CPIC_SXDX.TB_APPLICATION.verify_status
  is '���״̬';
comment on column CPIC_SXDX.TB_APPLICATION.verify_note
  is '��˱�ע';
comment on column CPIC_SXDX.TB_APPLICATION.update_user
  is '�޸���';
comment on column CPIC_SXDX.TB_APPLICATION.verify_date
  is '������ڣ����ͨ��ʱΪ�ɽ����ڣ�';
comment on column CPIC_SXDX.TB_APPLICATION.product_id
  is '��ƷID';
comment on column CPIC_SXDX.TB_APPLICATION.export_flag
  is '�Ƿ��Ѿ�������UNICALL��N����Y���ǣ�';
comment on column CPIC_SXDX.TB_APPLICATION.export_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_APPLICATION.fee_desc
  is '������ϸ';
comment on column CPIC_SXDX.TB_APPLICATION.note
  is '�ʼ챸ע';
comment on column CPIC_SXDX.TB_APPLICATION.preappno
  is 'ԭͶ������';
comment on column CPIC_SXDX.TB_APPLICATION.agreequitinsu
  is '�Ƿ�Ҫ���˱���0Ϊ��1Ϊ�ǣ�';
comment on column CPIC_SXDX.TB_APPLICATION.is_elecbill
  is '�Ƿ��ǵ����˵���0Ϊ��1Ϊ�ǣ�';
comment on column CPIC_SXDX.TB_APPLICATION.is_realtime
  is '�Ƿ���ʵʱ�ύ��0Ϊ��1Ϊ�ǣ�';
comment on column CPIC_SXDX.TB_APPLICATION.product_type
  is '���';
create index CPIC_SXDX.IDX_TB_APPLICATION_TASKID on CPIC_SXDX.TB_APPLICATION (TASK_ID);
create index CPIC_SXDX.IDX_TB_APPLICATION_TSRID on CPIC_SXDX.TB_APPLICATION (TSRID);
alter table CPIC_SXDX.TB_APPLICATION
  add constraint PK_TB_APPLICATION primary key (APPLICATION_ID);
alter table CPIC_SXDX.TB_APPLICATION
  add constraint UNQ_TB_APPLICATION_APPNO unique (APPNO);

prompt
prompt Creating table TB_APPLICATION_2011
prompt ==================================
prompt
create table CPIC_SXDX.TB_APPLICATION_2011
(
  appno      VARCHAR2(18),
  app_status VARCHAR2(3)
)
;

prompt
prompt Creating table TB_APPLICATION_2012
prompt ==================================
prompt
create table CPIC_SXDX.TB_APPLICATION_2012
(
  appno      VARCHAR2(18),
  app_status VARCHAR2(3)
)
;

prompt
prompt Creating table TB_APPLICATION_CUSTOMER
prompt ======================================
prompt
create table CPIC_SXDX.TB_APPLICATION_CUSTOMER
(
  app_customer_id NUMBER(20) not null,
  customer_id     NUMBER(20),
  name            VARCHAR2(50),
  mari            VARCHAR2(3),
  lic_typ         VARCHAR2(2),
  lic_no          VARCHAR2(50),
  birthday        VARCHAR2(30),
  gender          VARCHAR2(2),
  nation          VARCHAR2(50),
  huk             VARCHAR2(300),
  moto_flag       VARCHAR2(2),
  job_code        VARCHAR2(10),
  job_code_sec    VARCHAR2(10),
  rev             VARCHAR2(100),
  height          NUMBER(6,2),
  weight          NUMBER(6,2),
  customer_typ    VARCHAR2(2) not null,
  con_addr_typ_id NUMBER(5),
  salary          NUMBER(20,4),
  company_name    VARCHAR2(100),
  lic_start_date  DATE,
  lic_end_date    DATE
)
;
comment on table CPIC_SXDX.TB_APPLICATION_CUSTOMER
  is 'Ͷ���ͻ�������Ϣ��';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.app_customer_id
  is 'Ͷ���ͻ�ID';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.customer_id
  is '�ͻ�ID';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.name
  is '����';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.mari
  is '����״��';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.lic_typ
  is '֤������';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.lic_no
  is '֤����';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.birthday
  is '��������';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.gender
  is '�Ա�';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.nation
  is '����';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.huk
  is '�������ڵ�';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.moto_flag
  is '�Ƿ���Ħ�г�Ϊ��ͨ����';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.job_code
  is 'ְҵ����';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.job_code_sec
  is '��ְְҵ����';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.height
  is '���';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.weight
  is '����';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.customer_typ
  is 'Ͷ���ͻ����� 01��Ͷ���ˣ�02��������';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.con_addr_typ_id
  is '��ϵ��ַ���';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.salary
  is 'нˮ';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.company_name
  is '��λ����';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.lic_start_date
  is '֤����ʼ����';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.lic_end_date
  is '֤����ֹ����';
alter table CPIC_SXDX.TB_APPLICATION_CUSTOMER
  add constraint PK_TB_APPLICATION_CUSTOMER primary key (APP_CUSTOMER_ID);

prompt
prompt Creating table TB_APPLICATION_TMP
prompt =================================
prompt
create table CPIC_SXDX.TB_APPLICATION_TMP
(
  application_id VARCHAR2(18) not null,
  appno          VARCHAR2(18),
  policyno       VARCHAR2(18),
  idorg          VARCHAR2(18),
  iddmsystem     VARCHAR2(24),
  iddmtype       VARCHAR2(4),
  firstcreate    DATE,
  lastupdate     DATE,
  isubmit        VARCHAR2(1),
  iaccept        VARCHAR2(1),
  recordstatus   VARCHAR2(2),
  tsrid          VARCHAR2(16),
  last_log       NUMBER(10),
  product_name   VARCHAR2(50),
  campaign_name  VARCHAR2(1024),
  vaildaty       VARCHAR2(10),
  ialter         VARCHAR2(1),
  irepeal        VARCHAR2(1),
  iupdate        VARCHAR2(1),
  app_status     VARCHAR2(3),
  prj_id         NUMBER(10),
  ai_rel         VARCHAR2(3),
  acus_licno     VARCHAR2(50),
  acus_mob       VARCHAR2(50),
  acus_gender    VARCHAR2(2),
  acus_name      VARCHAR2(50),
  icus_licno     VARCHAR2(50),
  icus_mob       VARCHAR2(50),
  icus_gender    VARCHAR2(2),
  icus_name      VARCHAR2(50),
  agent_id       VARCHAR2(50),
  total_fee      NUMBER(20,4),
  org_id         NUMBER(10),
  site_status    VARCHAR2(2),
  pro_status     VARCHAR2(2),
  is_del         VARCHAR2(1) default '0' not null,
  ob_com_id      NUMBER(10),
  task_id        NUMBER(18),
  verify_status  CHAR(1),
  verify_note    VARCHAR2(1024),
  update_user    VARCHAR2(24),
  verify_date    DATE,
  product_id     NUMBER(20),
  export_flag    CHAR(1),
  export_time    DATE,
  fee_desc       VARCHAR2(1000)
)
;
comment on table CPIC_SXDX.TB_APPLICATION_TMP
  is 'Ͷ����������Ϣ��';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.application_id
  is 'Ͷ����ID';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.appno
  is 'Ͷ������';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.policyno
  is '������';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.idorg
  is '��֧��˾����';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.iddmsystem
  is '�ⲿϵͳͶ����ID';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.iddmtype
  is '������Դ����';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.firstcreate
  is '����ʱ��';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.lastupdate
  is '�޸�ʱ��';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.isubmit
  is '�Ƿ��ύ';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.iaccept
  is '�Ƿ���سɹ� Ĭ�� 0 ��1 ����سɹ�';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.tsrid
  is '¼����ϯ����';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.product_name
  is '��Ʒ����';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.campaign_name
  is '�����';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.ialter
  is '�Ƿ����޸� 1��';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.irepeal
  is '�Ƿ���  1��';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.iupdate
  is '�Ƿ����  1��';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.app_status
  is 'Ͷ����״̬';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.prj_id
  is '��ĿID';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.ai_rel
  is 'Ͷ���˺ͱ����˹�ϵ';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.acus_licno
  is 'Ͷ����֤����';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.acus_mob
  is 'Ͷ���ֻ�';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.acus_gender
  is 'Ͷ�����Ա�';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.acus_name
  is 'Ͷ��������';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.icus_licno
  is '������֤����';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.icus_mob
  is '������Ͷ���ֻ�';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.icus_gender
  is '�������Ա�';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.icus_name
  is '����������';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.agent_id
  is 'ҵ��Ա����';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.total_fee
  is '�ܱ���';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.org_id
  is 'ʵ������Ȩ�޹���';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.site_status
  is '�Ƿ��˻��ֳ���00-��������01-�Ѿ��˻��ֳ���';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.pro_status
  is '00-����У����ͨ������˲�ͨ��ΪNULL';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.is_del
  is '�Ƿ�ɾ����0Ϊ��1Ϊ�ǣ�';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.ob_com_id
  is '�����';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.verify_status
  is '���״̬';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.verify_note
  is '��˱�ע';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.update_user
  is '�޸���';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.verify_date
  is '������ڣ����ͨ��ʱΪ�ɽ����ڣ�';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.product_id
  is '��ƷID';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.export_flag
  is '�Ƿ��Ѿ�������UNICALL��N����Y���ǣ�';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.export_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.fee_desc
  is '������ϸ';
alter table CPIC_SXDX.TB_APPLICATION_TMP
  add constraint PK_TB_APPLICATION_TMP primary key (APPLICATION_ID);
alter table CPIC_SXDX.TB_APPLICATION_TMP
  add constraint UNQ_TB_APPLICATION_TMP_APPNO unique (APPNO);

prompt
prompt Creating table TB_APPNO
prompt =======================
prompt
create table CPIC_SXDX.TB_APPNO
(
  id           VARCHAR2(18) not null,
  idorg        VARCHAR2(18),
  appdate      DATE,
  appcounter   NUMBER,
  lastupdate   DATE,
  recordstatus CHAR(1)
)
;
comment on table CPIC_SXDX.TB_APPNO
  is 'Ͷ��������ˮ�����ɱ�';
alter table CPIC_SXDX.TB_APPNO
  add primary key (ID);

prompt
prompt Creating table TB_APP_CHECKPOINT
prompt ================================
prompt
create table CPIC_SXDX.TB_APP_CHECKPOINT
(
  id                 VARCHAR2(18) not null,
  idapp              VARCHAR2(18),
  id_checkpoint_type VARCHAR2(4),
  checkpointtime     DATE,
  lastupdate         DATE,
  recordstatus       CHAR(1)
)
;
alter table CPIC_SXDX.TB_APP_CHECKPOINT
  add primary key (ID);

prompt
prompt Creating table TB_CUSTOMER_ADDS_TYP
prompt ===================================
prompt
create table CPIC_SXDX.TB_CUSTOMER_ADDS_TYP
(
  cus_adds_typ_id NUMBER(5) not null,
  con_typ_nam     VARCHAR2(50),
  addr_typ_desc   VARCHAR2(100)
)
;
comment on table CPIC_SXDX.TB_CUSTOMER_ADDS_TYP
  is '�ͻ���ַ���ͱ�';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS_TYP.cus_adds_typ_id
  is '��ַ����ID';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS_TYP.con_typ_nam
  is '��ַ������';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS_TYP.addr_typ_desc
  is '��ַ��������';
alter table CPIC_SXDX.TB_CUSTOMER_ADDS_TYP
  add constraint PK_TB_CUSTOMER_ADDS_TYP primary key (CUS_ADDS_TYP_ID);

prompt
prompt Creating table TB_APP_CUSTOMER_ADDS
prompt ===================================
prompt
create table CPIC_SXDX.TB_APP_CUSTOMER_ADDS
(
  adds_id         NUMBER(10) not null,
  app_customer_id NUMBER(20),
  cus_adds_typ_id NUMBER(5),
  adds_contry     VARCHAR2(50),
  adds_province   NUMBER(6),
  adds_city       NUMBER(6),
  adds_detail     VARCHAR2(200),
  adds_note       VARCHAR2(100),
  adds_postcode   VARCHAR2(10),
  adds_region     NUMBER(6)
)
;
comment on table CPIC_SXDX.TB_APP_CUSTOMER_ADDS
  is 'Ͷ���ͻ���ַ��Ϣ��';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.adds_id
  is '��ϵ��ַID';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.app_customer_id
  is 'Ͷ���ͻ�ID';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.cus_adds_typ_id
  is '��ϵ��ַ����ID';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.adds_contry
  is '����';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.adds_province
  is 'ʡ';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.adds_city
  is '��';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.adds_detail
  is '��ַ��ϸ��Ϣ';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.adds_note
  is '��ַ��ע';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.adds_postcode
  is '��������';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.adds_region
  is '����';
create index CPIC_SXDX.IDX_TB_APP_CUSTOMER_ADDS_CUSID on CPIC_SXDX.TB_APP_CUSTOMER_ADDS (APP_CUSTOMER_ID);
alter table CPIC_SXDX.TB_APP_CUSTOMER_ADDS
  add constraint PK_TB_APP_CUSTOMER_ADDS primary key (ADDS_ID);
alter table CPIC_SXDX.TB_APP_CUSTOMER_ADDS
  add constraint FK_TB_APP_CUSTOMER_ADDS_01 foreign key (APP_CUSTOMER_ID)
  references CPIC_SXDX.TB_APPLICATION_CUSTOMER (APP_CUSTOMER_ID);
alter table CPIC_SXDX.TB_APP_CUSTOMER_ADDS
  add constraint FK_TB_APP_CUSTOMER_ADDS_02 foreign key (CUS_ADDS_TYP_ID)
  references CPIC_SXDX.TB_CUSTOMER_ADDS_TYP (CUS_ADDS_TYP_ID);

prompt
prompt Creating table TB_CUSTOMER_CON_TYP
prompt ==================================
prompt
create table CPIC_SXDX.TB_CUSTOMER_CON_TYP
(
  cus_con_typ_id NUMBER(5) not null,
  con_typ_nam    VARCHAR2(50),
  con_typ_desc   VARCHAR2(100)
)
;
comment on table CPIC_SXDX.TB_CUSTOMER_CON_TYP
  is '��ϵ��ʽ����';
comment on column CPIC_SXDX.TB_CUSTOMER_CON_TYP.cus_con_typ_id
  is '��ϵ��ʽID';
comment on column CPIC_SXDX.TB_CUSTOMER_CON_TYP.con_typ_nam
  is '��ϵ��ʽ��';
comment on column CPIC_SXDX.TB_CUSTOMER_CON_TYP.con_typ_desc
  is '��ϵ��ʽ����';
alter table CPIC_SXDX.TB_CUSTOMER_CON_TYP
  add constraint PK_TB_CUSTOMER_CON_TYP primary key (CUS_CON_TYP_ID);

prompt
prompt Creating table TB_APP_CUSTOMER_CONTACT
prompt ======================================
prompt
create table CPIC_SXDX.TB_APP_CUSTOMER_CONTACT
(
  cus_con_id      NUMBER(10) not null,
  app_customer_id NUMBER(20),
  cus_con_typ_id  NUMBER(5),
  con_value       VARCHAR2(50),
  con_note        VARCHAR2(100)
)
;
comment on table CPIC_SXDX.TB_APP_CUSTOMER_CONTACT
  is 'Ͷ���ͻ���ϵ��ʽ��';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_CONTACT.cus_con_id
  is '��ϵ��ʽID';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_CONTACT.app_customer_id
  is 'Ͷ���ͻ�ID';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_CONTACT.cus_con_typ_id
  is '��ϵ��ʽ����ID';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_CONTACT.con_value
  is '��ϵ��ʽֵ';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_CONTACT.con_note
  is '��ϵ��ʽ��ע';
create index CPIC_SXDX.IDX_TBAPP_CUS_CONTACT_CUSID on CPIC_SXDX.TB_APP_CUSTOMER_CONTACT (APP_CUSTOMER_ID);
alter table CPIC_SXDX.TB_APP_CUSTOMER_CONTACT
  add constraint PK_TB_APP_CUSTOMER_CONTACT primary key (CUS_CON_ID);
alter table CPIC_SXDX.TB_APP_CUSTOMER_CONTACT
  add constraint FK_TB_APP_CUSTOMER_CONTACT_01 foreign key (APP_CUSTOMER_ID)
  references CPIC_SXDX.TB_APPLICATION_CUSTOMER (APP_CUSTOMER_ID);
alter table CPIC_SXDX.TB_APP_CUSTOMER_CONTACT
  add constraint FK_TB_APP_CUSTOMER_CONTACT_02 foreign key (CUS_CON_TYP_ID)
  references CPIC_SXDX.TB_CUSTOMER_CON_TYP (CUS_CON_TYP_ID);

prompt
prompt Creating table TB_APP_DTL
prompt =========================
prompt
create table CPIC_SXDX.TB_APP_DTL
(
  application_id VARCHAR2(18) not null,
  appno          VARCHAR2(18),
  policyno       VARCHAR2(18),
  app_typ        VARCHAR2(2),
  region_code    VARCHAR2(30),
  benefit_info   VARCHAR2(2048),
  add_fee        NUMBER(20,4),
  tmp_fee_no     VARCHAR2(40),
  main_plc_no    VARCHAR2(20),
  fst_pay_typ    VARCHAR2(2),
  oth_pay_typ    VARCHAR2(2),
  fee_agt_typ    VARCHAR2(2),
  fee_acc_bank   VARCHAR2(20),
  fee_acc_nam    VARCHAR2(50),
  fee_acc_no     VARCHAR2(50),
  late_choice    VARCHAR2(2),
  bonus_recv_typ VARCHAR2(2),
  death_func     VARCHAR2(2),
  argue_typ      VARCHAR2(2),
  trial_code     VARCHAR2(20),
  sale_cha       VARCHAR2(2),
  app_date       VARCHAR2(30),
  renewal_flag   VARCHAR2(2),
  back_info      VARCHAR2(512),
  special_clause VARCHAR2(1024),
  data_source    VARCHAR2(10),
  status         VARCHAR2(2) default '0' not null,
  app_operator   VARCHAR2(10),
  app_slip_typ   VARCHAR2(2) default 'D' not null,
  sale_src       VARCHAR2(2),
  pay_mod        VARCHAR2(2),
  bene_avg_flag  CHAR(1)
)
;
comment on table CPIC_SXDX.TB_APP_DTL
  is 'Ͷ������ϸ��Ϣ��';
comment on column CPIC_SXDX.TB_APP_DTL.application_id
  is 'Ͷ����ID';
comment on column CPIC_SXDX.TB_APP_DTL.appno
  is 'Ͷ������';
comment on column CPIC_SXDX.TB_APP_DTL.policyno
  is '������';
comment on column CPIC_SXDX.TB_APP_DTL.app_typ
  is 'Ͷ������(1000)';
comment on column CPIC_SXDX.TB_APP_DTL.region_code
  is '�������';
comment on column CPIC_SXDX.TB_APP_DTL.benefit_info
  is '��������Ϣ';
comment on column CPIC_SXDX.TB_APP_DTL.add_fee
  is '׷�ӱ��ѣ����ã�';
comment on column CPIC_SXDX.TB_APP_DTL.tmp_fee_no
  is '���վݺ�';
comment on column CPIC_SXDX.TB_APP_DTL.main_plc_no
  is '���ձ�����';
comment on column CPIC_SXDX.TB_APP_DTL.fst_pay_typ
  is '����֧����ʽ';
comment on column CPIC_SXDX.TB_APP_DTL.oth_pay_typ
  is '����֧����ʽ';
comment on column CPIC_SXDX.TB_APP_DTL.fee_agt_typ
  is '�ɷѴ�����ʽ';
comment on column CPIC_SXDX.TB_APP_DTL.fee_acc_bank
  is '�ɷѿ������д���';
comment on column CPIC_SXDX.TB_APP_DTL.fee_acc_nam
  is '�ɷѿ�������';
comment on column CPIC_SXDX.TB_APP_DTL.fee_acc_no
  is '�ɷ��˻�';
comment on column CPIC_SXDX.TB_APP_DTL.late_choice
  is '��������ѡ��';
comment on column CPIC_SXDX.TB_APP_DTL.bonus_recv_typ
  is '������ȡ��ʽ';
comment on column CPIC_SXDX.TB_APP_DTL.death_func
  is '��ʱ��ս���ѡ��';
comment on column CPIC_SXDX.TB_APP_DTL.argue_typ
  is '���鴦��ʽ';
comment on column CPIC_SXDX.TB_APP_DTL.trial_code
  is '������Ա����';
comment on column CPIC_SXDX.TB_APP_DTL.sale_cha
  is '��������';
comment on column CPIC_SXDX.TB_APP_DTL.app_date
  is 'Ͷ������';
comment on column CPIC_SXDX.TB_APP_DTL.renewal_flag
  is '�Ƿ��Զ�����';
comment on column CPIC_SXDX.TB_APP_DTL.back_info
  is '������Ϣ';
comment on column CPIC_SXDX.TB_APP_DTL.special_clause
  is '�ر�Լ��';
comment on column CPIC_SXDX.TB_APP_DTL.data_source
  is '������Դ';
comment on column CPIC_SXDX.TB_APP_DTL.status
  is 'P10����״̬';
comment on column CPIC_SXDX.TB_APP_DTL.app_operator
  is '����Ա';
comment on column CPIC_SXDX.TB_APP_DTL.app_slip_typ
  is 'Ͷ��������(2023)';
comment on column CPIC_SXDX.TB_APP_DTL.sale_src
  is '������Դ';
comment on column CPIC_SXDX.TB_APP_DTL.pay_mod
  is '�ո�ģʽ';
comment on column CPIC_SXDX.TB_APP_DTL.bene_avg_flag
  is '��������Ƿ�Ϊ����(��������ϢΪ����������ʱ����)N����Y����';
alter table CPIC_SXDX.TB_APP_DTL
  add constraint PK_TB_APP_DTL primary key (APPLICATION_ID);
alter table CPIC_SXDX.TB_APP_DTL
  add constraint FK_TB_APP_DTL_01 foreign key (APPLICATION_ID)
  references CPIC_SXDX.TB_APPLICATION (APPLICATION_ID);

prompt
prompt Creating table TB_APP_IACCEPT_CHANGE
prompt ====================================
prompt
create table CPIC_SXDX.TB_APP_IACCEPT_CHANGE
(
  appno       VARCHAR2(18),
  create_user VARCHAR2(24),
  create_time DATE,
  iaccept_id  NUMBER(10) not null
)
;
comment on column CPIC_SXDX.TB_APP_IACCEPT_CHANGE.appno
  is 'Ͷ������';
comment on column CPIC_SXDX.TB_APP_IACCEPT_CHANGE.create_user
  is '������';
comment on column CPIC_SXDX.TB_APP_IACCEPT_CHANGE.create_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_APP_IACCEPT_CHANGE.iaccept_id
  is '������ID';
alter table CPIC_SXDX.TB_APP_IACCEPT_CHANGE
  add constraint PK_IACCEPT_CHANGE primary key (IACCEPT_ID);

prompt
prompt Creating table TB_APP_PRD_INFO
prompt ==============================
prompt
create table CPIC_SXDX.TB_APP_PRD_INFO
(
  app_prd_id     NUMBER(20) not null,
  application_id VARCHAR2(18),
  ins_code       VARCHAR2(8),
  main_flag      VARCHAR2(1),
  amount         NUMBER(20,4),
  pay_lev        NUMBER(20,4),
  job_fee        NUMBER(20,4),
  pay_typ        VARCHAR2(2),
  pay_period     VARCHAR2(2),
  ins_period     VARCHAR2(10),
  ins_perd_typ   VARCHAR2(3),
  recv_typ       VARCHAR2(3),
  recv_age       NUMBER(3),
  fixed_plc_no   VARCHAR2(18),
  pieces         NUMBER(6,1)
)
;
comment on table CPIC_SXDX.TB_APP_PRD_INFO
  is 'Ͷ������Ʒ��Ϣ��';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.application_id
  is 'Ͷ����ID';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.ins_code
  is '���ִ���';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.main_flag
  is '�����ձ�־';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.amount
  is '����';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.pay_lev
  is '�ɷѱ�׼';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.job_fee
  is 'ְҵ�ӷ�';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.pay_typ
  is '�ɷѷ�ʽ';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.pay_period
  is '�ɷ�����';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.ins_period
  is '�����ڼ�';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.ins_perd_typ
  is '�����ڼ�����';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.recv_typ
  is '��ȡ��ʽ';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.recv_age
  is '��ȡ����';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.fixed_plc_no
  is '��������(Ĭ��00)';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.pieces
  is '����';
create index CPIC_SXDX.IDX_TB_APP_PRDINFO_APPID on CPIC_SXDX.TB_APP_PRD_INFO (APPLICATION_ID);
alter table CPIC_SXDX.TB_APP_PRD_INFO
  add constraint PK_TB_APP_PRD_INFO primary key (APP_PRD_ID);
alter table CPIC_SXDX.TB_APP_PRD_INFO
  add constraint FK_TB_APP_PRD_INFO_01 foreign key (APPLICATION_ID)
  references CPIC_SXDX.TB_APPLICATION (APPLICATION_ID);

prompt
prompt Creating table TB_APP_PROBLEM_REQ
prompt =================================
prompt
create table CPIC_SXDX.TB_APP_PROBLEM_REQ
(
  id          NUMBER(18) not null,
  appid       VARCHAR2(18) not null,
  result1     VARCHAR2(2),
  remark2     VARCHAR2(300),
  input_date  DATE,
  input_user  VARCHAR2(20),
  remark1     VARCHAR2(4000),
  update_date DATE,
  update_user VARCHAR2(20),
  result2     VARCHAR2(2) default '00',
  remark3     VARCHAR2(255)
)
;
comment on table CPIC_SXDX.TB_APP_PROBLEM_REQ
  is '�������������';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.id
  is '���봦����ˮ��';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.appid
  is 'Ͷ����ID';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.result1
  is '���봦����(00-�ͻ����糷��,01-����,02-���º˱�,03-�����ۿ�,04-���µ���)';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.remark2
  is '���봦��ע';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.input_date
  is '����ʱ��';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.input_user
  is '�����û�';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.remark1
  is '������ע';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.update_date
  is '����ʱ��';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.update_user
  is '�����û�';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.result2
  is '����������(00-�����,01-���ͨ��,02-��˲�ͨ��)';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.remark3
  is '��������ע';
alter table CPIC_SXDX.TB_APP_PROBLEM_REQ
  add constraint PK_TB_APP_PROBLEM_REQ_ID primary key (ID);
alter table CPIC_SXDX.TB_APP_PROBLEM_REQ
  add constraint FK_TB_APP_PROBLEM_REQ_01 foreign key (APPID)
  references CPIC_SXDX.TB_APPLICATION (APPLICATION_ID);

prompt
prompt Creating table TB_APP_STATUS_HIS
prompt ================================
prompt
create table CPIC_SXDX.TB_APP_STATUS_HIS
(
  id         NUMBER(15) not null,
  app_no     VARCHAR2(18) not null,
  app_status VARCHAR2(3) not null,
  oper_time  DATE,
  oper_id    VARCHAR2(10),
  note       VARCHAR2(300),
  status_src VARCHAR2(2)
)
;
comment on table CPIC_SXDX.TB_APP_STATUS_HIS
  is 'Ͷ����״̬��ʷ��';
comment on column CPIC_SXDX.TB_APP_STATUS_HIS.id
  is '���к�';
comment on column CPIC_SXDX.TB_APP_STATUS_HIS.app_no
  is 'Ͷ������';
comment on column CPIC_SXDX.TB_APP_STATUS_HIS.app_status
  is 'Ͷ����״̬ ';
comment on column CPIC_SXDX.TB_APP_STATUS_HIS.oper_time
  is '״̬�仯ʱ��';
comment on column CPIC_SXDX.TB_APP_STATUS_HIS.oper_id
  is '������ID';
comment on column CPIC_SXDX.TB_APP_STATUS_HIS.note
  is '��ע';
comment on column CPIC_SXDX.TB_APP_STATUS_HIS.status_src
  is '״̬��Դ 01:ULINK 02:UNICALL';
alter table CPIC_SXDX.TB_APP_STATUS_HIS
  add constraint PK_TB_APP_STATUS_HIS primary key (ID);

prompt
prompt Creating table TB_AREA
prompt ======================
prompt
create table CPIC_SXDX.TB_AREA
(
  area_id     NUMBER(6) not null,
  area_num    NUMBER(6) not null,
  area_name   VARCHAR2(100) not null,
  area_fath   NUMBER not null,
  simple_name VARCHAR2(20) not null,
  area_level  CHAR(1) not null,
  area_order  NUMBER,
  del_flg     CHAR(1) default '0' not null,
  create_user VARCHAR2(24),
  create_time DATE,
  update_user VARCHAR2(24),
  update_time DATE,
  city_cnt    NUMBER,
  area_cnt    NUMBER
)
;
comment on table CPIC_SXDX.TB_AREA
  is '����ά����';
comment on column CPIC_SXDX.TB_AREA.area_id
  is '������λ��ţ�����';
comment on column CPIC_SXDX.TB_AREA.area_num
  is '������λ���룬ͬ���ҷ�����룬Ҳ���¼�������λ�ĸ���������';
comment on column CPIC_SXDX.TB_AREA.area_name
  is '������λ����';
comment on column CPIC_SXDX.TB_AREA.area_fath
  is '������λ������';
comment on column CPIC_SXDX.TB_AREA.simple_name
  is '������λ���';
comment on column CPIC_SXDX.TB_AREA.area_level
  is '������λ���� 1:ʡ�� 2:�ؼ��� 3:����';
comment on column CPIC_SXDX.TB_AREA.area_order
  is '��ʾ˳��ʡ��������λ���룬���10������������λĬ��100';
comment on column CPIC_SXDX.TB_AREA.del_flg
  is '�Ƿ�ɾ���ı�ʾ 0 δɾ�� 1 ��ɾ��';
comment on column CPIC_SXDX.TB_AREA.create_user
  is '������ ��ʼ������Ϊ0_Admin';
comment on column CPIC_SXDX.TB_AREA.create_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_AREA.update_user
  is '�޸��� ��ʼ�޸���Ϊ��';
comment on column CPIC_SXDX.TB_AREA.update_time
  is '�޸�ʱ��';
comment on column CPIC_SXDX.TB_AREA.city_cnt
  is '�����ĵؼ�������';
comment on column CPIC_SXDX.TB_AREA.area_cnt
  is '��������������';
create unique index CPIC_SXDX.IDX_TB_AREA on CPIC_SXDX.TB_AREA (AREA_NUM, AREA_FATH);
alter table CPIC_SXDX.TB_AREA
  add constraint PK_TB_AREA primary key (AREA_ID);
alter table CPIC_SXDX.TB_AREA
  add constraint CKC_DEL_FLG_TB_AREA
  check (DEL_FLG between '0' and '1' and DEL_FLG in ('0','1'));

prompt
prompt Creating table TB_BANK_DEBIT
prompt ============================
prompt
create table CPIC_SXDX.TB_BANK_DEBIT
(
  bank_name  VARCHAR2(120) not null,
  bank_type  VARCHAR2(30) not null,
  bank_debit VARCHAR2(30),
  pay_type   VARCHAR2(30),
  bank_head  VARCHAR2(30)
)
;
comment on column CPIC_SXDX.TB_BANK_DEBIT.bank_name
  is '��������';
comment on column CPIC_SXDX.TB_BANK_DEBIT.bank_type
  is '������������';
comment on column CPIC_SXDX.TB_BANK_DEBIT.bank_debit
  is '���м���';
comment on column CPIC_SXDX.TB_BANK_DEBIT.pay_type
  is '֧������';
comment on column CPIC_SXDX.TB_BANK_DEBIT.bank_head
  is '������ʼ����';
alter table CPIC_SXDX.TB_BANK_DEBIT
  add constraint PK_BANK_DEBIT primary key (BANK_NAME, BANK_TYPE);

prompt
prompt Creating table TB_BANK_RULE
prompt ===========================
prompt
create table CPIC_SXDX.TB_BANK_RULE
(
  bank_rule_id     NUMBER(10) not null,
  transfer_rule    VARCHAR2(100),
  start_characters VARCHAR2(50),
  card_length      NUMBER(5),
  card_type        CHAR(4),
  bank_type        CHAR(4),
  remark           VARCHAR2(100),
  creat_person     VARCHAR2(24),
  creat_time       DATE,
  modify_person    VARCHAR2(24),
  modify_time      DATE,
  is_del           VARCHAR2(4)
)
;
comment on column CPIC_SXDX.TB_BANK_RULE.bank_rule_id
  is 'ת�ʹ���ID';
comment on column CPIC_SXDX.TB_BANK_RULE.transfer_rule
  is 'ת�˹���';
comment on column CPIC_SXDX.TB_BANK_RULE.start_characters
  is '��ʼ�ַ�';
comment on column CPIC_SXDX.TB_BANK_RULE.card_length
  is '������';
comment on column CPIC_SXDX.TB_BANK_RULE.card_type
  is '������';
comment on column CPIC_SXDX.TB_BANK_RULE.bank_type
  is '��������';
comment on column CPIC_SXDX.TB_BANK_RULE.remark
  is '��ע';
comment on column CPIC_SXDX.TB_BANK_RULE.creat_person
  is '������';
comment on column CPIC_SXDX.TB_BANK_RULE.creat_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_BANK_RULE.modify_person
  is '�޸���';
comment on column CPIC_SXDX.TB_BANK_RULE.modify_time
  is '�޸�ʱ��';
comment on column CPIC_SXDX.TB_BANK_RULE.is_del
  is '�Ƿ�ɾ���� 0Ĭ�ϡ�1Ϊɾ��';
alter table CPIC_SXDX.TB_BANK_RULE
  add constraint PK_BANK_RULE_ID primary key (BANK_RULE_ID);

prompt
prompt Creating table TB_BENEFICLARY
prompt =============================
prompt
create table CPIC_SXDX.TB_BENEFICLARY
(
  id                NUMBER(20) not null,
  application_id    NUMBER(20) not null,
  benefit_name      VARCHAR2(20),
  benefit_sex       VARCHAR2(1),
  benefit_relation  VARCHAR2(100),
  benefit_sort      VARCHAR2(40),
  benefit_code_num  VARCHAR2(32),
  benefit_percent   VARCHAR2(8),
  benefit_nation    VARCHAR2(8),
  benefit_address   VARCHAR2(800),
  benefit_mobile    VARCHAR2(32),
  benefit_metier    VARCHAR2(50),
  benefit_lic_start DATE,
  benefit_lic_end   DATE,
  benefit_lic_type  VARCHAR2(2)
)
;
comment on table CPIC_SXDX.TB_BENEFICLARY
  is '��������Ϣ��';
comment on column CPIC_SXDX.TB_BENEFICLARY.id
  is '��ˮ��';
comment on column CPIC_SXDX.TB_BENEFICLARY.application_id
  is 'Ͷ����ID';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_name
  is '����������';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_sex
  is '�������Ա�';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_relation
  is '�������뱻���˹�ϵ';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_sort
  is '����˳��';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_code_num
  is '������֤����';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_percent
  is '�������';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_nation
  is '�����˹���';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_address
  is '�����˾�ס��ַ';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_mobile
  is '��������ϵ��ʽ';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_metier
  is '������ְҵ';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_lic_start
  is '������֤����Ч��ʼ��';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_lic_end
  is '������֤����Ч��ֹ��';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_lic_type
  is '������֤������';
alter table CPIC_SXDX.TB_BENEFICLARY
  add constraint BENEFICLARY_ID primary key (ID);

prompt
prompt Creating table TB_BENE_TYPE
prompt ===========================
prompt
create table CPIC_SXDX.TB_BENE_TYPE
(
  bene_type_id NUMBER(20) not null,
  name         VARCHAR2(20)
)
;
comment on table CPIC_SXDX.TB_BENE_TYPE
  is '�ֺ췽ʽ��';
comment on column CPIC_SXDX.TB_BENE_TYPE.bene_type_id
  is '�ֺ췽ʽID';
comment on column CPIC_SXDX.TB_BENE_TYPE.name
  is '�ֺ췽ʽ����';
alter table CPIC_SXDX.TB_BENE_TYPE
  add constraint PK_BENE_TYPE_ID primary key (BENE_TYPE_ID);

prompt
prompt Creating table TB_BMDM_ORG
prompt ==========================
prompt
create table CPIC_SXDX.TB_BMDM_ORG
(
  bmdm       VARCHAR2(20),
  orgname    VARCHAR2(300),
  orgtype    VARCHAR2(10),
  orgid      VARCHAR2(30) not null,
  uporgid    VARCHAR2(30),
  orgname_bk VARCHAR2(300)
)
;
comment on column CPIC_SXDX.TB_BMDM_ORG.orgname
  is '��������';
comment on column CPIC_SXDX.TB_BMDM_ORG.orgtype
  is '��������';
comment on column CPIC_SXDX.TB_BMDM_ORG.orgid
  is '��������';
comment on column CPIC_SXDX.TB_BMDM_ORG.uporgid
  is '�ϼ���������';
comment on column CPIC_SXDX.TB_BMDM_ORG.orgname_bk
  is '����ʱ��ԭ��������';
alter table CPIC_SXDX.TB_BMDM_ORG
  add constraint PK_TB_BMDM_ORG primary key (ORGID);

prompt
prompt Creating table TB_BMDM_ORG_BK
prompt =============================
prompt
create table CPIC_SXDX.TB_BMDM_ORG_BK
(
  bmdm       VARCHAR2(20),
  orgname    VARCHAR2(300),
  orgtype    VARCHAR2(10),
  orgid      VARCHAR2(30),
  uporgid    VARCHAR2(30),
  orgname_bk VARCHAR2(300)
)
;

prompt
prompt Creating table TB_CALL_HISTORY
prompt ==============================
prompt
create table CPIC_SXDX.TB_CALL_HISTORY
(
  call_hisid      NUMBER(18) not null,
  called_phone    VARCHAR2(20),
  start_time      DATE,
  end_time        DATE,
  call_id         VARCHAR2(64),
  workspace_id    NUMBER(10),
  duration        NUMBER(6),
  call_resutl     NUMBER(1),
  agentid         VARCHAR2(20),
  call_no         VARCHAR2(20),
  callout_no      VARCHAR2(20),
  ccid            VARCHAR2(20),
  task_id         NUMBER(18),
  sale_history_id NUMBER(18),
  memo            VARCHAR2(800)
)
;
comment on table CPIC_SXDX.TB_CALL_HISTORY
  is '������ʷ��';
comment on column CPIC_SXDX.TB_CALL_HISTORY.call_hisid
  is '������ʷ���';
comment on column CPIC_SXDX.TB_CALL_HISTORY.called_phone
  is '����绰����';
comment on column CPIC_SXDX.TB_CALL_HISTORY.start_time
  is 'ͨ����ʼʱ��';
comment on column CPIC_SXDX.TB_CALL_HISTORY.end_time
  is 'ͨ������ʱ��';
comment on column CPIC_SXDX.TB_CALL_HISTORY.call_id
  is '��¼ͨ����ʶ';
comment on column CPIC_SXDX.TB_CALL_HISTORY.workspace_id
  is 'ְ��ID';
comment on column CPIC_SXDX.TB_CALL_HISTORY.duration
  is 'ͨ��ʱ������λ���룩';
comment on column CPIC_SXDX.TB_CALL_HISTORY.call_resutl
  is 'ͨ�������0��δ��ͨ��1����ͨ��';
comment on column CPIC_SXDX.TB_CALL_HISTORY.agentid
  is 'AGENTID';
comment on column CPIC_SXDX.TB_CALL_HISTORY.call_no
  is '���к���';
comment on column CPIC_SXDX.TB_CALL_HISTORY.callout_no
  is '���к���';
comment on column CPIC_SXDX.TB_CALL_HISTORY.ccid
  is '����ƽ̨ID';
comment on column CPIC_SXDX.TB_CALL_HISTORY.task_id
  is '����ID';
comment on column CPIC_SXDX.TB_CALL_HISTORY.sale_history_id
  is '������ʷid';
comment on column CPIC_SXDX.TB_CALL_HISTORY.memo
  is 'ԤԼ��ע';
create index CPIC_SXDX.IDX_CALL_HISTORY_01 on CPIC_SXDX.TB_CALL_HISTORY (SALE_HISTORY_ID);
create index CPIC_SXDX.IDX_CALL_HISTORY_02 on CPIC_SXDX.TB_CALL_HISTORY (TASK_ID);
alter table CPIC_SXDX.TB_CALL_HISTORY
  add constraint PK_CALL_HISTORY primary key (CALL_HISID);

prompt
prompt Creating table TB_CATEGORY
prompt ==========================
prompt
create table CPIC_SXDX.TB_CATEGORY
(
  categoryid    VARCHAR2(10) not null,
  categoryname  NVARCHAR2(20),
  pcategoryid   VARCHAR2(10),
  isleaf        CHAR(1),
  categorylevel CHAR(2)
)
;
alter table CPIC_SXDX.TB_CATEGORY
  add primary key (CATEGORYID);

prompt
prompt Creating table TB_PROVINCE
prompt ==========================
prompt
create table CPIC_SXDX.TB_PROVINCE
(
  province_id   NUMBER not null,
  province_name VARCHAR2(20) not null,
  display_order NUMBER not null,
  simple_name   VARCHAR2(20) not null,
  del_flg       CHAR(1) default '0' not null,
  create_user   VARCHAR2(24),
  create_time   DATE,
  update_user   VARCHAR2(24),
  update_time   DATE
)
;
comment on table CPIC_SXDX.TB_PROVINCE
  is '����ά��ʡ�ݱ�';
comment on column CPIC_SXDX.TB_PROVINCE.province_id
  is 'ʡ�ݴ���';
comment on column CPIC_SXDX.TB_PROVINCE.province_name
  is 'ʡ������';
comment on column CPIC_SXDX.TB_PROVINCE.display_order
  is 'ʡ�����Ƶ���ʾ˳��';
comment on column CPIC_SXDX.TB_PROVINCE.del_flg
  is '�Ƿ�ɾ���ı�ʾ 0 δɾ�� 1 ��ɾ��';
alter table CPIC_SXDX.TB_PROVINCE
  add constraint PK_PROVINCE primary key (PROVINCE_ID);
alter table CPIC_SXDX.TB_PROVINCE
  add constraint CKC_DEL_FLG_TB_PROVI
  check (DEL_FLG between '0' and '1' and DEL_FLG in ('0','1'));

prompt
prompt Creating table TB_CITY
prompt ======================
prompt
create table CPIC_SXDX.TB_CITY
(
  city_id     NUMBER not null,
  province_id NUMBER not null,
  city_name   VARCHAR2(20) not null,
  simple_name VARCHAR2(20) not null,
  del_flg     CHAR(1) default '0' not null,
  create_user VARCHAR2(24),
  create_time DATE,
  update_user VARCHAR2(24),
  update_time DATE
)
;
comment on table CPIC_SXDX.TB_CITY
  is '����ά���ĵؼ��б�';
comment on column CPIC_SXDX.TB_CITY.province_id
  is 'ʡ�ݴ���';
comment on column CPIC_SXDX.TB_CITY.city_name
  is '��������';
comment on column CPIC_SXDX.TB_CITY.del_flg
  is '�Ƿ�ɾ���ı�ʾ 0 δɾ�� 1 ��ɾ��';
alter table CPIC_SXDX.TB_CITY
  add constraint PK_CITY primary key (CITY_ID);
alter table CPIC_SXDX.TB_CITY
  add constraint FK_PROVINCE_PICID_CITY foreign key (PROVINCE_ID)
  references CPIC_SXDX.TB_PROVINCE (PROVINCE_ID);
alter table CPIC_SXDX.TB_CITY
  add constraint CKC_DEL_FLG_TB_CITY
  check (DEL_FLG between '0' and '1' and DEL_FLG in ('0','1'));

prompt
prompt Creating table TB_COMPANY
prompt =========================
prompt
create table CPIC_SXDX.TB_COMPANY
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
  orgid                VARCHAR2(50)
)
;
comment on column CPIC_SXDX.TB_COMPANY.company_id
  is 'ҵ�����ID';
comment on column CPIC_SXDX.TB_COMPANY.parent_company_id
  is '��ҵ�����ID';
comment on column CPIC_SXDX.TB_COMPANY.company_name
  is '��������';
comment on column CPIC_SXDX.TB_COMPANY.company_code
  is '��������';
comment on column CPIC_SXDX.TB_COMPANY.is_branch_company
  is '�Ƿ��Ƿֹ�˾';
comment on column CPIC_SXDX.TB_COMPANY.is_delete
  is 'ɾ����ʶ';
comment on column CPIC_SXDX.TB_COMPANY.company_finance_code
  is '�����������';
comment on column CPIC_SXDX.TB_COMPANY.region_code
  is '�������';
comment on column CPIC_SXDX.TB_COMPANY.operate_user_code
  is 'ҵ��Ա����';
comment on column CPIC_SXDX.TB_COMPANY.operate_user_name
  is 'ҵ��Ա����';
comment on column CPIC_SXDX.TB_COMPANY.is_ff
  is '���ͱ���ʱ�����ж��Ƿ��գ�1 �ǣ�0 ��';
comment on column CPIC_SXDX.TB_COMPANY.company_type
  is '�������ͣ�01:�ֹ�˾;02:��֧��˾;03:�ڲ�ְ��;04:���ְ��;';
comment on column CPIC_SXDX.TB_COMPANY.orgid
  is '��������';
alter table CPIC_SXDX.TB_COMPANY
  add constraint PK_COMPANY_ID primary key (COMPANY_ID);

prompt
prompt Creating table TB_COMPANY_BANK
prompt ==============================
prompt
create table CPIC_SXDX.TB_COMPANY_BANK
(
  company_bank_id NUMBER(10) not null,
  company_id      NUMBER(10),
  bank_name       VARCHAR2(200),
  bank_code       VARCHAR2(50),
  bank_type       CHAR(2),
  creat_person    VARCHAR2(24),
  creat_time      DATE,
  modify_person   VARCHAR2(24),
  modify_time     DATE,
  is_del          VARCHAR2(2)
)
;
comment on table CPIC_SXDX.TB_COMPANY_BANK
  is '�������б�';
comment on column CPIC_SXDX.TB_COMPANY_BANK.company_bank_id
  is '����ID';
comment on column CPIC_SXDX.TB_COMPANY_BANK.company_id
  is 'ҵ�����ID';
comment on column CPIC_SXDX.TB_COMPANY_BANK.bank_name
  is '��������';
comment on column CPIC_SXDX.TB_COMPANY_BANK.bank_code
  is '���б���';
comment on column CPIC_SXDX.TB_COMPANY_BANK.bank_type
  is '��������';
comment on column CPIC_SXDX.TB_COMPANY_BANK.creat_person
  is '������';
comment on column CPIC_SXDX.TB_COMPANY_BANK.creat_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_COMPANY_BANK.modify_person
  is '�޸���';
comment on column CPIC_SXDX.TB_COMPANY_BANK.modify_time
  is '�޸�ʱ��';
comment on column CPIC_SXDX.TB_COMPANY_BANK.is_del
  is '�Ƿ�ɾ���� 0Ĭ�ϡ�1Ϊɾ��';
alter table CPIC_SXDX.TB_COMPANY_BANK
  add constraint PK_COMPANY_BANK_ID primary key (COMPANY_BANK_ID);
alter table CPIC_SXDX.TB_COMPANY_BANK
  add constraint FK_COMPANY_BANK foreign key (COMPANY_ID)
  references CPIC_SXDX.TB_COMPANY (COMPANY_ID);

prompt
prompt Creating table TB_COMPANY_BANK_RULE
prompt ===================================
prompt
create table CPIC_SXDX.TB_COMPANY_BANK_RULE
(
  bank_rule_id    NUMBER(10) not null,
  company_bank_id NUMBER(10) not null
)
;
comment on column CPIC_SXDX.TB_COMPANY_BANK_RULE.bank_rule_id
  is 'ת�ʹ���ID';
comment on column CPIC_SXDX.TB_COMPANY_BANK_RULE.company_bank_id
  is '����ID';
alter table CPIC_SXDX.TB_COMPANY_BANK_RULE
  add constraint PK_COMPANY_BANK_RULE_ID primary key (BANK_RULE_ID, COMPANY_BANK_ID);
alter table CPIC_SXDX.TB_COMPANY_BANK_RULE
  add constraint FK_BANK_RULE_COMAPANY_BANK foreign key (BANK_RULE_ID)
  references CPIC_SXDX.TB_BANK_RULE (BANK_RULE_ID);
alter table CPIC_SXDX.TB_COMPANY_BANK_RULE
  add constraint FK_COMPANY_BANK_RULE foreign key (COMPANY_BANK_ID)
  references CPIC_SXDX.TB_COMPANY_BANK (COMPANY_BANK_ID);

prompt
prompt Creating table TB_COMPANY_BK
prompt ============================
prompt
create table CPIC_SXDX.TB_COMPANY_BK
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
  orgid                VARCHAR2(50)
)
;

prompt
prompt Creating table TB_SALE_BATCH
prompt ============================
prompt
create table CPIC_SXDX.TB_SALE_BATCH
(
  batch_id           NUMBER(19) not null,
  ob_com_id          NUMBER(10),
  upload_way         VARCHAR2(16),
  assign_way         VARCHAR2(32),
  batch_name         VARCHAR2(128) not null,
  batch_code         VARCHAR2(128) not null,
  com_type           VARCHAR2(512),
  call_date          DATE,
  remove_date        DATE,
  call_year_month    VARCHAR2(19),
  org_center         NUMBER(19),
  org_pro            NUMBER(19),
  org_team           NUMBER(19),
  gerenerate_info    NUMBER(19),
  create_user        VARCHAR2(24) not null,
  create_time        DATE not null,
  update_user        VARCHAR2(24),
  update_time        DATE,
  file_name          VARCHAR2(255),
  log_content        VARCHAR2(512),
  belongcity         NUMBER(19),
  com_seriars        VARCHAR2(512),
  call_times         NUMBER(1),
  success            NUMBER(10),
  failure            NUMBER(10),
  introduction_batch NUMBER,
  batch_type         NUMBER(1) default 0
)
;
comment on column CPIC_SXDX.TB_SALE_BATCH.batch_id
  is '����ID';
comment on column CPIC_SXDX.TB_SALE_BATCH.ob_com_id
  is '�ID';
comment on column CPIC_SXDX.TB_SALE_BATCH.upload_way
  is '���ط�ʽ  1.�ֶ�����  2.�Զ�����';
comment on column CPIC_SXDX.TB_SALE_BATCH.assign_way
  is '�·���ʽ  1. ���ص���֯   2.ֱ���·�����ϯ';
comment on column CPIC_SXDX.TB_SALE_BATCH.batch_name
  is '��������';
comment on column CPIC_SXDX.TB_SALE_BATCH.batch_code
  is '���α���';
comment on column CPIC_SXDX.TB_SALE_BATCH.com_type
  is '��������  �ֵ��';
comment on column CPIC_SXDX.TB_SALE_BATCH.call_date
  is '��ʼ��������';
comment on column CPIC_SXDX.TB_SALE_BATCH.remove_date
  is '��������';
comment on column CPIC_SXDX.TB_SALE_BATCH.call_year_month
  is '��������';
comment on column CPIC_SXDX.TB_SALE_BATCH.org_center
  is '����';
comment on column CPIC_SXDX.TB_SALE_BATCH.org_pro
  is '��Ŀ';
comment on column CPIC_SXDX.TB_SALE_BATCH.org_team
  is '�Ŷ�';
comment on column CPIC_SXDX.TB_SALE_BATCH.gerenerate_info
  is '����������';
comment on column CPIC_SXDX.TB_SALE_BATCH.create_user
  is '������';
comment on column CPIC_SXDX.TB_SALE_BATCH.create_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_SALE_BATCH.update_user
  is '�޸���';
comment on column CPIC_SXDX.TB_SALE_BATCH.update_time
  is '�޸�ʱ��';
comment on column CPIC_SXDX.TB_SALE_BATCH.file_name
  is '�ļ���';
comment on column CPIC_SXDX.TB_SALE_BATCH.log_content
  is '��־����';
comment on column CPIC_SXDX.TB_SALE_BATCH.belongcity
  is '��������';
comment on column CPIC_SXDX.TB_SALE_BATCH.com_seriars
  is '��������   �ֵ��';
comment on column CPIC_SXDX.TB_SALE_BATCH.call_times
  is '���������1-�ײ���2-������3-����';
comment on column CPIC_SXDX.TB_SALE_BATCH.success
  is '���������ɹ���';
comment on column CPIC_SXDX.TB_SALE_BATCH.failure
  is '��������ʧ����';
comment on column CPIC_SXDX.TB_SALE_BATCH.introduction_batch
  is 'ת��������';
comment on column CPIC_SXDX.TB_SALE_BATCH.batch_type
  is '�������ͣ�0-Ĭ�� 1-ת���� 2-������������';
alter table CPIC_SXDX.TB_SALE_BATCH
  add constraint PK_SALE_BATCH primary key (BATCH_ID);

prompt
prompt Creating table TB_TASK
prompt ======================
prompt
create table CPIC_SXDX.TB_TASK
(
  task_id          NUMBER(18) not null,
  task_level       NUMBER(5) default 60,
  create_time      DATE default SYSDATE not null,
  change_time      DATE,
  is_important     CHAR(1),
  appoint_time     DATE,
  active_status    CHAR(1) default 0 not null,
  task_memo        VARCHAR2(800),
  callresult_type  NUMBER(3) default 1,
  first_result     NUMBER(1),
  second_result    NUMBER(3),
  user_id          VARCHAR2(24),
  org_id           NUMBER(10) not null,
  status_id        NUMBER(5) not null,
  type_id          NUMBER(5) default 4 not null,
  policy_id        VARCHAR2(30),
  batch_id         NUMBER(19) not null,
  cus_list_id      NUMBER(20) not null,
  ext1             VARCHAR2(2000),
  ext2             VARCHAR2(256),
  ext3             VARCHAR2(256),
  ext4             VARCHAR2(256),
  ob_com_id        NUMBER(10) not null,
  policy_id_cancle VARCHAR2(30)
)
;
comment on table CPIC_SXDX.TB_TASK
  is '�����';
comment on column CPIC_SXDX.TB_TASK.task_id
  is '����ID';
comment on column CPIC_SXDX.TB_TASK.task_level
  is '�Ż���';
comment on column CPIC_SXDX.TB_TASK.create_time
  is '���񴴽�ʱ��';
comment on column CPIC_SXDX.TB_TASK.change_time
  is '���ı�ʱ��';
comment on column CPIC_SXDX.TB_TASK.is_important
  is '�Ƿ��ص����ѣ�ɾ����';
comment on column CPIC_SXDX.TB_TASK.appoint_time
  is 'ԤԼʱ��';
comment on column CPIC_SXDX.TB_TASK.active_status
  is '����״̬';
comment on column CPIC_SXDX.TB_TASK.task_memo
  is '����˵��';
comment on column CPIC_SXDX.TB_TASK.callresult_type
  is '����С��ģ��(��������=1 �����=2 �������=3 �ں���ѯ=4)';
comment on column CPIC_SXDX.TB_TASK.first_result
  is '����С��һ�����';
comment on column CPIC_SXDX.TB_TASK.second_result
  is '����С�ڶ������';
comment on column CPIC_SXDX.TB_TASK.user_id
  is '������ϯ';
comment on column CPIC_SXDX.TB_TASK.org_id
  is '��������';
comment on column CPIC_SXDX.TB_TASK.status_id
  is '״̬���';
comment on column CPIC_SXDX.TB_TASK.type_id
  is '���ͱ��';
comment on column CPIC_SXDX.TB_TASK.policy_id
  is 'Ͷ����ID';
comment on column CPIC_SXDX.TB_TASK.batch_id
  is '����ID';
comment on column CPIC_SXDX.TB_TASK.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_TASK.ob_com_id
  is '�ID';
comment on column CPIC_SXDX.TB_TASK.policy_id_cancle
  is '����Ͷ����Id';
create index CPIC_SXDX.IDX_TASK_BATCH_ID on CPIC_SXDX.TB_TASK (BATCH_ID);
create index CPIC_SXDX.IDX_TASK_CUS_LIST_ID on CPIC_SXDX.TB_TASK (CUS_LIST_ID);
create index CPIC_SXDX.IDX_TB_TASK_DQRW on CPIC_SXDX.TB_TASK (ACTIVE_STATUS, USER_ID);
create index CPIC_SXDX.IDX_TB_TASK_STATUSID on CPIC_SXDX.TB_TASK (STATUS_ID);
create index CPIC_SXDX.IDX_TB_TASK_USERID on CPIC_SXDX.TB_TASK (USER_ID);
alter table CPIC_SXDX.TB_TASK
  add constraint PK_TASK primary key (TASK_ID);
alter table CPIC_SXDX.TB_TASK
  add constraint FK_TASK_BATCH_BATCH_ID foreign key (BATCH_ID)
  references CPIC_SXDX.TB_SALE_BATCH (BATCH_ID);

prompt
prompt Creating table TB_CONSULT_CASE
prompt ==============================
prompt
create table CPIC_SXDX.TB_CONSULT_CASE
(
  order_id    NUMBER(18) not null,
  task_id     NUMBER(18),
  call_reason NUMBER(5),
  visit_time  DATE,
  visit_phone VARCHAR2(20),
  assign_task NUMBER(1),
  deal_status NUMBER(1) default 0,
  memo        VARCHAR2(128)
)
;
comment on table CPIC_SXDX.TB_CONSULT_CASE
  is '�ں���ѯ������';
comment on column CPIC_SXDX.TB_CONSULT_CASE.order_id
  is '���';
comment on column CPIC_SXDX.TB_CONSULT_CASE.task_id
  is '����ID';
comment on column CPIC_SXDX.TB_CONSULT_CASE.call_reason
  is '����ԭ��';
comment on column CPIC_SXDX.TB_CONSULT_CASE.visit_time
  is 'ԤԼ�ط�ʱ��';
comment on column CPIC_SXDX.TB_CONSULT_CASE.visit_phone
  is '�طõ绰';
comment on column CPIC_SXDX.TB_CONSULT_CASE.assign_task
  is '��������0��������ϯ��1�������Ŷӣ�';
comment on column CPIC_SXDX.TB_CONSULT_CASE.deal_status
  is '����״̬��0��δ����1���Ѵ���';
comment on column CPIC_SXDX.TB_CONSULT_CASE.memo
  is '��ע';
alter table CPIC_SXDX.TB_CONSULT_CASE
  add constraint PK_CONSULT_CASE primary key (ORDER_ID);
alter table CPIC_SXDX.TB_CONSULT_CASE
  add constraint FK_CONSULT_TASK_ID_TASK foreign key (TASK_ID)
  references CPIC_SXDX.TB_TASK (TASK_ID);

prompt
prompt Creating table TB_CUSTOMER
prompt ==========================
prompt
create table CPIC_SXDX.TB_CUSTOMER
(
  customer_id  NUMBER(20) not null,
  name         VARCHAR2(50),
  mari         VARCHAR2(2),
  lic_typ      VARCHAR2(2),
  lic_no       VARCHAR2(50),
  birthday     VARCHAR2(30),
  gender       VARCHAR2(2),
  nation       VARCHAR2(50),
  huk          VARCHAR2(50),
  moto_flag    VARCHAR2(2),
  job_code     VARCHAR2(10),
  job_code_sec VARCHAR2(10),
  rev          VARCHAR2(100)
)
;
comment on table CPIC_SXDX.TB_CUSTOMER
  is '�ͻ�������Ϣ��';
comment on column CPIC_SXDX.TB_CUSTOMER.name
  is '����';
comment on column CPIC_SXDX.TB_CUSTOMER.mari
  is '����״��';
comment on column CPIC_SXDX.TB_CUSTOMER.lic_typ
  is '֤������';
comment on column CPIC_SXDX.TB_CUSTOMER.lic_no
  is '֤����';
comment on column CPIC_SXDX.TB_CUSTOMER.birthday
  is '��������';
comment on column CPIC_SXDX.TB_CUSTOMER.gender
  is '�Ա�';
comment on column CPIC_SXDX.TB_CUSTOMER.nation
  is '����';
comment on column CPIC_SXDX.TB_CUSTOMER.huk
  is '�������ڵ�';
comment on column CPIC_SXDX.TB_CUSTOMER.moto_flag
  is '�Ƿ���Ħ�г�Ϊ��ͨ����';
comment on column CPIC_SXDX.TB_CUSTOMER.job_code
  is 'ְҵ����';
comment on column CPIC_SXDX.TB_CUSTOMER.job_code_sec
  is '��ְְҵ����';
alter table CPIC_SXDX.TB_CUSTOMER
  add constraint PK_TB_CUSTOMER primary key (CUSTOMER_ID);

prompt
prompt Creating table TB_CUSTOMER_ADDS
prompt ===============================
prompt
create table CPIC_SXDX.TB_CUSTOMER_ADDS
(
  adds_id         NUMBER(10) not null,
  customer_id     NUMBER(20),
  cus_adds_typ_id NUMBER(5),
  adds_contry     VARCHAR2(50),
  adds_province   VARCHAR2(50),
  adds_city       VARCHAR2(50),
  adds_detail     VARCHAR2(200),
  adds_note       VARCHAR2(100)
)
;
comment on table CPIC_SXDX.TB_CUSTOMER_ADDS
  is '�ͻ���ַ��Ϣ��';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS.adds_id
  is '��ϵ��ַID';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS.customer_id
  is '�ͻ�ID';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS.cus_adds_typ_id
  is '��ϵ��ַ����ID';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS.adds_contry
  is '����';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS.adds_province
  is 'ʡ';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS.adds_city
  is '��';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS.adds_detail
  is '��ַ��ϸ��Ϣ';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS.adds_note
  is '��ַ��ע';
alter table CPIC_SXDX.TB_CUSTOMER_ADDS
  add constraint PK_TB_CUSTOMER_ADDS primary key (ADDS_ID);
alter table CPIC_SXDX.TB_CUSTOMER_ADDS
  add constraint FK_TB_CUSTOMER_ADDS_01 foreign key (CUS_ADDS_TYP_ID)
  references CPIC_SXDX.TB_CUSTOMER_ADDS_TYP (CUS_ADDS_TYP_ID);
alter table CPIC_SXDX.TB_CUSTOMER_ADDS
  add constraint FK_TB_CUSTOMER_ADDS_02 foreign key (CUSTOMER_ID)
  references CPIC_SXDX.TB_CUSTOMER (CUSTOMER_ID);

prompt
prompt Creating table TB_CUSTOMER_APP_REL
prompt ==================================
prompt
create table CPIC_SXDX.TB_CUSTOMER_APP_REL
(
  application_id  VARCHAR2(18) not null,
  app_customer_id NUMBER(20) not null
)
;
comment on table CPIC_SXDX.TB_CUSTOMER_APP_REL
  is 'Ͷ���ͻ���Ͷ������ϵ��';
comment on column CPIC_SXDX.TB_CUSTOMER_APP_REL.application_id
  is 'Ͷ����ID';
comment on column CPIC_SXDX.TB_CUSTOMER_APP_REL.app_customer_id
  is 'Ͷ���ͻ�ID';
alter table CPIC_SXDX.TB_CUSTOMER_APP_REL
  add constraint PK_TB_APP_REL primary key (APPLICATION_ID, APP_CUSTOMER_ID);
alter table CPIC_SXDX.TB_CUSTOMER_APP_REL
  add constraint FK_TB_CUSTOMER_APP_REL_01 foreign key (APP_CUSTOMER_ID)
  references CPIC_SXDX.TB_APPLICATION_CUSTOMER (APP_CUSTOMER_ID);
alter table CPIC_SXDX.TB_CUSTOMER_APP_REL
  add constraint FK_TB_CUSTOMER_APP_REL_02 foreign key (APPLICATION_ID)
  references CPIC_SXDX.TB_APPLICATION (APPLICATION_ID);

prompt
prompt Creating table TB_ORGANIZATION
prompt ==============================
prompt
create table CPIC_SXDX.TB_ORGANIZATION
(
  org_id        NUMBER(10) not null,
  org_name      VARCHAR2(64) not null,
  company_id    NUMBER(10),
  parent_org_id NUMBER(10) not null,
  org_level     NUMBER(2) not null,
  org_desc      VARCHAR2(500),
  org_type      CHAR(2),
  org_code      VARCHAR2(20),
  is_del        CHAR(1) not null,
  create_user   VARCHAR2(24) not null,
  create_time   DATE not null,
  update_user   VARCHAR2(24),
  update_time   DATE,
  binding_user  VARCHAR2(24) default 0
)
;
comment on table CPIC_SXDX.TB_ORGANIZATION
  is '��֯����';
comment on column CPIC_SXDX.TB_ORGANIZATION.org_id
  is '������ˮ��';
comment on column CPIC_SXDX.TB_ORGANIZATION.org_name
  is '��������';
comment on column CPIC_SXDX.TB_ORGANIZATION.company_id
  is 'ҵ�����ID';
comment on column CPIC_SXDX.TB_ORGANIZATION.parent_org_id
  is '�ϼ�����ID';
comment on column CPIC_SXDX.TB_ORGANIZATION.org_level
  is '��������  0:�ܹ�˾ 1:���������� 2:���������� 3:��Ŀ 4:�Ŷ�';
comment on column CPIC_SXDX.TB_ORGANIZATION.org_desc
  is '������ע';
comment on column CPIC_SXDX.TB_ORGANIZATION.org_type
  is '��������';
comment on column CPIC_SXDX.TB_ORGANIZATION.org_code
  is '��������';
comment on column CPIC_SXDX.TB_ORGANIZATION.is_del
  is 'ɾ����־';
comment on column CPIC_SXDX.TB_ORGANIZATION.create_user
  is '������';
comment on column CPIC_SXDX.TB_ORGANIZATION.create_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_ORGANIZATION.update_user
  is '�޸���';
comment on column CPIC_SXDX.TB_ORGANIZATION.update_time
  is '�޸�ʱ��';
comment on column CPIC_SXDX.TB_ORGANIZATION.binding_user
  is '��Ŀ�Ƿ���ʼ���Ա   Ĭ��Ϊ0 δ�󶨣��󶨺�ֱ�ӷ�userId����';
alter table CPIC_SXDX.TB_ORGANIZATION
  add constraint PK_ORG primary key (ORG_ID);

prompt
prompt Creating table TB_CUSTOMER_ASSIGN
prompt =================================
prompt
create table CPIC_SXDX.TB_CUSTOMER_ASSIGN
(
  task_id     NUMBER(19) not null,
  batch_id    NUMBER(19),
  org_id      NUMBER(19),
  to_org_id   NUMBER(19),
  user_id     VARCHAR2(24),
  to_user_id  VARCHAR2(24),
  quantity    NUMBER(19) not null,
  assign_type NUMBER(2) not null,
  type        NUMBER(2),
  create_user VARCHAR2(24) not null,
  create_time DATE not null
)
;
comment on table CPIC_SXDX.TB_CUSTOMER_ASSIGN
  is '�������������б�';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.task_id
  is '��������ID';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.batch_id
  is '����';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.org_id
  is '������֯';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.to_org_id
  is '��������֯';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.user_id
  is '������';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.to_user_id
  is '��������';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.quantity
  is '��������';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.assign_type
  is '��������:1�Ŷӵ���ϯ��2��Ŀ���Ŷӣ� 3���ĵ���Ŀ  4��ϯ���Ŷӣ� 5��ϯ����Ŀ�� 6�Ŷӵ���ϯ��7�Ŷӵ���Ŀ��8��Ŀ����ϯ��9��Ŀ���Ŷ�';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.type
  is '1�������,2�������,3�����Զ�����';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.create_time
  is '���񴴽�ʱ��';
alter table CPIC_SXDX.TB_CUSTOMER_ASSIGN
  add constraint PK_CUSTOMER_ASSIGN primary key (TASK_ID);
alter table CPIC_SXDX.TB_CUSTOMER_ASSIGN
  add constraint FK_CUSTOMERASSIGN_ORGID_ORGID foreign key (ORG_ID)
  references CPIC_SXDX.TB_ORGANIZATION (ORG_ID);

prompt
prompt Creating table TB_CUSTOMER_ASSIGN_LOG
prompt =====================================
prompt
create table CPIC_SXDX.TB_CUSTOMER_ASSIGN_LOG
(
  assign_id   NUMBER(19) not null,
  org_id      NUMBER(19),
  to_org_id   VARCHAR2(128),
  user_id     VARCHAR2(24),
  to_user_id  VARCHAR2(128),
  quantity    NUMBER(19) not null,
  assign_type NUMBER(2) not null,
  batch_name  VARCHAR2(128),
  batch_id    VARCHAR2(128),
  create_user VARCHAR2(24),
  start_time  DATE,
  end_time    DATE
)
;
comment on table CPIC_SXDX.TB_CUSTOMER_ASSIGN_LOG
  is '����������ʷ';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN_LOG.org_id
  is '������֯';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN_LOG.to_org_id
  is '��������֯';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN_LOG.user_id
  is '������';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN_LOG.to_user_id
  is '��������';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN_LOG.quantity
  is '��������';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN_LOG.assign_type
  is '��������:0��ʾ����;1��ʾ�����ε��� 2��ʾ����������;';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN_LOG.start_time
  is '���俪ʼʱ��';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN_LOG.end_time
  is '���俪ʼʱ��';
alter table CPIC_SXDX.TB_CUSTOMER_ASSIGN_LOG
  add constraint PK_CUSTOMER_ASSIGN_LOG primary key (ASSIGN_ID);

prompt
prompt Creating table TB_CUSTOMER_CONTACT
prompt ==================================
prompt
create table CPIC_SXDX.TB_CUSTOMER_CONTACT
(
  cus_con_id     NUMBER(10) not null,
  customer_id    NUMBER(20),
  cus_con_typ_id NUMBER(5),
  con_value      VARCHAR2(50),
  con_note       VARCHAR2(100)
)
;
comment on table CPIC_SXDX.TB_CUSTOMER_CONTACT
  is '�ͻ���ϵ��ʽ��';
comment on column CPIC_SXDX.TB_CUSTOMER_CONTACT.cus_con_id
  is '��ϵ��ʽID';
comment on column CPIC_SXDX.TB_CUSTOMER_CONTACT.customer_id
  is '�ͻ�ID';
comment on column CPIC_SXDX.TB_CUSTOMER_CONTACT.cus_con_typ_id
  is '��ϵ��ʽ����ID';
comment on column CPIC_SXDX.TB_CUSTOMER_CONTACT.con_value
  is '��ϵ��ʽֵ';
comment on column CPIC_SXDX.TB_CUSTOMER_CONTACT.con_note
  is '��ϵ��ʽ��ע';
alter table CPIC_SXDX.TB_CUSTOMER_CONTACT
  add constraint PK_TB_CUSTOMER_CONTACT primary key (CUS_CON_ID);
alter table CPIC_SXDX.TB_CUSTOMER_CONTACT
  add constraint FK_TB_CUSTOMER_CONTACT_01 foreign key (CUS_CON_TYP_ID)
  references CPIC_SXDX.TB_CUSTOMER_CON_TYP (CUS_CON_TYP_ID);
alter table CPIC_SXDX.TB_CUSTOMER_CONTACT
  add constraint FK_TB_CUSTOMER_CONTACT_02 foreign key (CUSTOMER_ID)
  references CPIC_SXDX.TB_CUSTOMER (CUSTOMER_ID);

prompt
prompt Creating table TB_CUSTOMER_DEL_LIST
prompt ===================================
prompt
create table CPIC_SXDX.TB_CUSTOMER_DEL_LIST
(
  cus_list_id          NUMBER(20) not null,
  cus_unique_ide       VARCHAR2(30),
  cus_name             VARCHAR2(60),
  cus_sex              VARCHAR2(2),
  task_id              NUMBER(18),
  org_center           NUMBER(19),
  org_proj             NUMBER(19),
  org_team             NUMBER(19),
  user_id              VARCHAR2(24),
  call_status          NUMBER(19),
  status               VARCHAR2(3),
  cus_birthday         VARCHAR2(10),
  cus_age              VARCHAR2(2),
  ide_type             VARCHAR2(2),
  ide_number           VARCHAR2(50),
  cus_metier           VARCHAR2(7),
  mobile               VARCHAR2(16),
  mobile1              VARCHAR2(16),
  mobile2              VARCHAR2(16),
  contect_tel          VARCHAR2(20),
  home_tel             VARCHAR2(20),
  off_tel              VARCHAR2(20),
  contect_tel_type     VARCHAR2(2),
  detailed_address     VARCHAR2(300),
  postcode             VARCHAR2(6),
  add_type             VARCHAR2(4),
  emergency_con_person VARCHAR2(60),
  emergency_con_tel    VARCHAR2(20),
  emer_con_relation    VARCHAR2(3),
  contact_detailed_add VARCHAR2(300),
  contact_postcode     VARCHAR2(6),
  cus_company          VARCHAR2(300),
  metier_level         VARCHAR2(7),
  marital_status       VARCHAR2(3),
  bank_name            VARCHAR2(100),
  bank_account_holder  VARCHAR2(60),
  bank_account         VARCHAR2(30),
  is_vip               VARCHAR2(2),
  batch_id             NUMBER(19) not null,
  org_id               NUMBER(10) not null,
  creat_user           VARCHAR2(24),
  creat_time           DATE,
  modify_person        VARCHAR2(24),
  modify_time          DATE,
  is_blacklist         VARCHAR2(2) default 0,
  fax                  VARCHAR2(20),
  res                  VARCHAR2(300),
  marital_id           NUMBER(18)
)
;
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.cus_unique_ide
  is '�ͻ�Ψһ��ʶ';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.cus_name
  is '�ͻ�����';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.cus_sex
  is '�ͻ��Ա�';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.task_id
  is '������';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.org_center
  is '��������';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.org_proj
  is '��Ŀ';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.org_team
  is '�Ŷ�';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.user_id
  is '��ϯID';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.call_status
  is '1��ʾ�Ѳ���0��ʾδ����';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.status
  is '����״̬  1��ʾ�ѷ��䣬0��ʾδ����';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.cus_birthday
  is '��������';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.cus_age
  is '����';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.ide_type
  is '֤������';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.ide_number
  is '֤������';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.cus_metier
  is '�ͻ�ְҵ';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.mobile
  is '�ƶ��绰';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.mobile1
  is '�ƶ��绰1';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.mobile2
  is '�ƶ��绰2';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.contect_tel
  is '��ϵ�绰';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.home_tel
  is '��ͥ�绰';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.off_tel
  is '��λ�绰';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.contect_tel_type
  is '��ϵ�绰���ͣ����õ绰��־��';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.detailed_address
  is '��ַ_��ַ';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.postcode
  is '��ַ_�ʱ�';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.add_type
  is '��ַ����';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.emergency_con_person
  is '���������ˣ�������';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.emergency_con_tel
  is '���������ˣ��绰��';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.emer_con_relation
  is '������������ͻ���ϵ';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.contact_detailed_add
  is '�����ַ_��ַ';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.contact_postcode
  is '�����ַ�ʱ�';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.cus_company
  is '������λ';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.metier_level
  is 'ְҵ�ȼ�';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.marital_status
  is '����״��';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.bank_name
  is '���У������У�';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.bank_account_holder
  is '���п����ˣ������˻�������';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.bank_account
  is '�����˻����ʺţ�';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.is_vip
  is '�Ƿ�����VIP';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.batch_id
  is '����ID';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.org_id
  is '������ˮ��';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.creat_user
  is '������(Ĭ��ϵͳ)';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.creat_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.modify_person
  is '�޸���(���һ���޸�)';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.modify_time
  is '�޸�ʱ��(���һ���޸�)';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.is_blacklist
  is '�Ƿ������� Ĭ��0  �������Ϊ1';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.fax
  is '����';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.res
  is '��ע';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.marital_id
  is 'ְҵ';
alter table CPIC_SXDX.TB_CUSTOMER_DEL_LIST
  add constraint PK_CUS_DEL_LIST_ID primary key (CUS_LIST_ID);

prompt
prompt Creating table TB_CUSTOMER_DEL_LIST_BAK
prompt =======================================
prompt
create table CPIC_SXDX.TB_CUSTOMER_DEL_LIST_BAK
(
  cus_list_id          NUMBER(20) not null,
  cus_unique_ide       VARCHAR2(30),
  cus_name             VARCHAR2(60),
  cus_sex              VARCHAR2(2),
  task_id              NUMBER(18),
  org_center           NUMBER(19),
  org_proj             NUMBER(19),
  org_team             NUMBER(19),
  user_id              VARCHAR2(24),
  call_status          NUMBER(19),
  status               VARCHAR2(3),
  cus_birthday         VARCHAR2(10),
  cus_age              VARCHAR2(2),
  ide_type             VARCHAR2(2),
  ide_number           VARCHAR2(50),
  cus_metier           VARCHAR2(7),
  mobile               VARCHAR2(16),
  mobile1              VARCHAR2(16),
  mobile2              VARCHAR2(16),
  contect_tel          VARCHAR2(20),
  home_tel             VARCHAR2(20),
  off_tel              VARCHAR2(20),
  contect_tel_type     VARCHAR2(2),
  detailed_address     VARCHAR2(300),
  postcode             VARCHAR2(6),
  add_type             VARCHAR2(4),
  emergency_con_person VARCHAR2(60),
  emergency_con_tel    VARCHAR2(20),
  emer_con_relation    VARCHAR2(3),
  contact_detailed_add VARCHAR2(300),
  contact_postcode     VARCHAR2(6),
  cus_company          VARCHAR2(300),
  metier_level         VARCHAR2(7),
  marital_status       VARCHAR2(3),
  bank_name            VARCHAR2(100),
  bank_account_holder  VARCHAR2(60),
  bank_account         VARCHAR2(30),
  is_vip               VARCHAR2(2),
  batch_id             NUMBER(19) not null,
  org_id               NUMBER(10) not null,
  creat_user           VARCHAR2(24),
  creat_time           DATE,
  modify_person        VARCHAR2(24),
  modify_time          DATE,
  is_blacklist         VARCHAR2(2),
  fax                  VARCHAR2(20),
  res                  VARCHAR2(300),
  marital_id           NUMBER(18)
)
;

prompt
prompt Creating table TB_CUSTOMER_DEL_LIST_DTL
prompt =======================================
prompt
create table CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL
(
  cus_list_id            NUMBER(20) not null,
  add_province           VARCHAR2(50),
  add_city               VARCHAR2(50),
  add_area               VARCHAR2(50),
  cus_email              VARCHAR2(50),
  contact_add_province   VARCHAR2(50),
  contact_add_city       VARCHAR2(50),
  contact_add_area       VARCHAR2(50),
  introducer             VARCHAR2(60),
  intro_time             DATE,
  introducer_relation    VARCHAR2(3),
  income                 VARCHAR2(15),
  education              VARCHAR2(15),
  travel_mode            VARCHAR2(15),
  own_house              VARCHAR2(2),
  own_child              VARCHAR2(2),
  buy_product            VARCHAR2(100),
  car_type               VARCHAR2(15),
  car_price              VARCHAR2(15),
  car_purpose            VARCHAR2(15),
  buy_house_time         VARCHAR2(15),
  house_price            VARCHAR2(15),
  house_area             VARCHAR2(15),
  house_purpose          VARCHAR2(15),
  house_type             VARCHAR2(15),
  interest_type          VARCHAR2(15),
  house_ownership_status VARCHAR2(15),
  cus_company_assets     VARCHAR2(15),
  res1                   VARCHAR2(100),
  res2                   VARCHAR2(200),
  res3                   VARCHAR2(300),
  res4                   VARCHAR2(400),
  own_car                VARCHAR2(2)
)
;
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.add_province
  is '��ַ_ʡ';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.add_city
  is '��ַ_��';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.add_area
  is '��ַ_����';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.cus_email
  is '�����ʼ�';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.contact_add_province
  is '�����ַ_ʡ';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.contact_add_city
  is '�����ַ_��';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.contact_add_area
  is '�����ַ_����';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.introducer
  is '������';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.intro_time
  is 'ת����ʱ��';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.introducer_relation
  is '������˹�ϵ';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.income
  is '������';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.education
  is '����ˮƽ';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.travel_mode
  is '���з�ʽ';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.own_house
  is '�Ƿ��з�';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.own_child
  is '�Ƿ��к���';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.buy_product
  is '�ѹ���Ʒ';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.car_type
  is '��������';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.car_price
  is '����';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.car_purpose
  is '��ʹ������';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.buy_house_time
  is '���ݹ���ʱ��';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.house_price
  is '���ݹ��ü�';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.house_area
  is '���ݽ������';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.house_purpose
  is '������;';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.house_type
  is '��������';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.interest_type
  is '��Ȥ��������';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.house_ownership_status
  is 'סլ����Ȩ״��';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.cus_company_assets
  is '������˾�����ʲ�';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.res1
  is '��ע1';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.res2
  is '��ע2';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.res3
  is '��ע3';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.res4
  is '��ע4';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.own_car
  is '�Ƿ��г�';
alter table CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL
  add constraint PK_CUS_DEL_LIST_DTL primary key (CUS_LIST_ID);

prompt
prompt Creating table TB_CUSTOMER_DEL_LOG
prompt ==================================
prompt
create table CPIC_SXDX.TB_CUSTOMER_DEL_LOG
(
  assign_id        NUMBER(19) not null,
  batch_name       CHAR(64),
  quantity         NUMBER(19),
  failure_quantity NUMBER(19),
  result           CHAR(12),
  content          CHAR(1024),
  create_time      DATE
)
;
comment on table CPIC_SXDX.TB_CUSTOMER_DEL_LOG
  is '����������־';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LOG.assign_id
  is '����ID';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LOG.batch_name
  is '����';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LOG.quantity
  is '������������';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LOG.failure_quantity
  is '���������';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LOG.result
  is 'ִ�н��';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LOG.content
  is '��־��Ϣ';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LOG.create_time
  is 'ִ��ʱ��';
alter table CPIC_SXDX.TB_CUSTOMER_DEL_LOG
  add constraint PK_CUSTOMER_DEL_LOG primary key (ASSIGN_ID);

prompt
prompt Creating table TB_CUSTOMER_LIST
prompt ===============================
prompt
create table CPIC_SXDX.TB_CUSTOMER_LIST
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
  is_introduction      VARCHAR2(2) default 0,
  introduction_id      VARCHAR2(18)
)
;
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.cus_unique_ide
  is '�ͻ�Ψһ��ʶ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.cus_name
  is '�ͻ�����';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.cus_sex
  is '�ͻ��Ա�';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.task_id
  is '������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.org_center
  is '��������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.org_proj
  is '��Ŀ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.org_team
  is '�Ŷ�';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.user_id
  is '��ϯID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.call_status
  is '1��ʾ�Ѳ���0��ʾδ����';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.status
  is '����״̬  1��ʾ�ѷ��䣬0��ʾδ����';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.cus_birthday
  is '��������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.cus_age
  is '����';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.ide_type
  is '֤������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.ide_number
  is '֤������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.cus_metier
  is '�ͻ�ְҵ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.mobile
  is '�ƶ��绰';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.mobile1
  is '�ƶ��绰1';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.mobile2
  is '�ƶ��绰2';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.contect_tel
  is '��ϵ�绰';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.home_tel
  is '��ͥ�绰';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.off_tel
  is '��λ�绰';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.contect_tel_type
  is '��ϵ�绰���ͣ����õ绰��־��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.detailed_address
  is '��ַ_��ַ�����͵�ַ��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.postcode
  is '��ַ_�ʱࣨ���͵�ַ��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.add_type
  is '��ַ����';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.emergency_con_person
  is '���������ˣ�������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.emergency_con_tel
  is '���������ˣ��绰��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.emer_con_relation
  is '������������ͻ���ϵ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.contact_detailed_add
  is '�����ַ_��ַ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.contact_postcode
  is '�����ַ�ʱ�';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.cus_company
  is '������λ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.metier_level
  is 'ְҵ�ȼ�';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.marital_status
  is '����״��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.bank_name
  is '���У������У�';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.bank_account_holder
  is '���п����ˣ������˻�������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.bank_account
  is '�����˻����ʺţ�';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.is_vip
  is '�Ƿ�����VIP';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.batch_id
  is '����ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.org_id
  is '������ˮ��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.creat_user
  is '������(Ĭ��ϵͳ)';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.creat_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.modify_person
  is '�޸���(���һ���޸�)';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.modify_time
  is '�޸�ʱ��(���һ���޸�)';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.is_blacklist
  is '�Ƿ������� Ĭ��0  �������Ϊ1';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.fax
  is '����';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.res
  is '��ע';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.marital_id
  is 'ְҵ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.assign_date
  is '��������ʱ��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.is_introduction
  is '�Ƿ���ת�������� 0=���� 1=��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.introduction_id
  is 'ת����ID';
create index CPIC_SXDX.IDX_CUSLIST_USER_ID on CPIC_SXDX.TB_CUSTOMER_LIST (USER_ID);
create index CPIC_SXDX.IDX_CUSTOMER_LIST_CUSNAME on CPIC_SXDX.TB_CUSTOMER_LIST (CUS_NAME);
create index CPIC_SXDX.IDX_TB_CUST_MDFP_TEAM on CPIC_SXDX.TB_CUSTOMER_LIST (BATCH_ID, USER_ID, CALL_STATUS);
create index CPIC_SXDX.IDX_TB_CUST_STATUS on CPIC_SXDX.TB_CUSTOMER_LIST (ORG_ID, STATUS, CALL_STATUS);
alter table CPIC_SXDX.TB_CUSTOMER_LIST
  add constraint PK_CUS_LIST_ID primary key (CUS_LIST_ID);

prompt
prompt Creating table TB_CUSTOMER_LIST_BAK
prompt ===================================
prompt
create table CPIC_SXDX.TB_CUSTOMER_LIST_BAK
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
  is_introduction      VARCHAR2(2) default 0,
  introduction_id      VARCHAR2(18),
  remove_status        VARCHAR2(3) default 0
)
;
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.cus_unique_ide
  is '�ͻ�Ψһ��ʶ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.cus_name
  is '�ͻ�����';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.cus_sex
  is '�ͻ��Ա�';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.task_id
  is '������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.org_center
  is '��������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.org_proj
  is '��Ŀ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.org_team
  is '�Ŷ�';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.user_id
  is '��ϯID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.call_status
  is '1��ʾ�Ѳ���0��ʾδ����';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.status
  is '����״̬  1��ʾ�ѷ��䣬0��ʾδ����';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.cus_birthday
  is '��������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.cus_age
  is '����';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.ide_type
  is '֤������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.ide_number
  is '֤������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.cus_metier
  is '�ͻ�ְҵ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.mobile
  is '�ƶ��绰';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.mobile1
  is '�ƶ��绰1';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.mobile2
  is '�ƶ��绰2';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.contect_tel
  is '��ϵ�绰';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.home_tel
  is '��ͥ�绰';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.off_tel
  is '��λ�绰';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.contect_tel_type
  is '��ϵ�绰���ͣ����õ绰��־��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.detailed_address
  is '��ַ_��ַ�����͵�ַ��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.postcode
  is '��ַ_�ʱࣨ���͵�ַ��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.add_type
  is '��ַ����';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.emergency_con_person
  is '���������ˣ�������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.emergency_con_tel
  is '���������ˣ��绰��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.emer_con_relation
  is '������������ͻ���ϵ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.contact_detailed_add
  is '�����ַ_��ַ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.contact_postcode
  is '�����ַ�ʱ�';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.cus_company
  is '������λ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.metier_level
  is 'ְҵ�ȼ�';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.marital_status
  is '����״��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.bank_name
  is '���У������У�';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.bank_account_holder
  is '���п����ˣ������˻�������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.bank_account
  is '�����˻����ʺţ�';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.is_vip
  is '�Ƿ�����VIP';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.batch_id
  is '����ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.org_id
  is '������ˮ��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.creat_user
  is '������(Ĭ��ϵͳ)';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.creat_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.modify_person
  is '�޸���(���һ���޸�)';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.modify_time
  is '�޸�ʱ��(���һ���޸�)';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.is_blacklist
  is '�Ƿ������� Ĭ��0  �������Ϊ1';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.fax
  is '����';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.res
  is '��ע';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.marital_id
  is 'ְҵ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.assign_date
  is '��������ʱ��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.is_introduction
  is '�Ƿ���ת�������� 0=���� 1=��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.introduction_id
  is 'ת����ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.remove_status
  is '�����Ƴ���ʶ 0=û���Ƴ� 1=�Ƴ�';
create index CPIC_SXDX.IDX_CUSLIST_USER_ID_BAK on CPIC_SXDX.TB_CUSTOMER_LIST_BAK (USER_ID);
create index CPIC_SXDX.IDX_CUSTOMER_LIST_CUSNAME_BAK on CPIC_SXDX.TB_CUSTOMER_LIST_BAK (CUS_NAME);
create index CPIC_SXDX.IDX_TB_CUST_MDFP_TEAM_BAK on CPIC_SXDX.TB_CUSTOMER_LIST_BAK (BATCH_ID, USER_ID, CALL_STATUS);
create index CPIC_SXDX.IDX_TB_CUST_STATUS_BAK on CPIC_SXDX.TB_CUSTOMER_LIST_BAK (ORG_ID, STATUS, CALL_STATUS);
alter table CPIC_SXDX.TB_CUSTOMER_LIST_BAK
  add constraint PK_CUS_LIST_ID_BAK primary key (CUS_LIST_ID);

prompt
prompt Creating table TB_CUSTOMER_LIST_BAK4
prompt ====================================
prompt
create table CPIC_SXDX.TB_CUSTOMER_LIST_BAK4
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
  is_blacklist         VARCHAR2(2),
  fax                  VARCHAR2(20),
  res                  VARCHAR2(300),
  marital_id           VARCHAR2(50),
  assign_date          DATE,
  is_introduction      VARCHAR2(2),
  introduction_id      VARCHAR2(18)
)
;

prompt
prompt Creating table TB_CUSTOMER_LIST_REMOVE
prompt ======================================
prompt
create table CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE
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
  is_blacklist         VARCHAR2(2),
  fax                  VARCHAR2(20),
  res                  VARCHAR2(300),
  marital_id           VARCHAR2(50),
  assign_date          DATE,
  is_introduction      VARCHAR2(2),
  introduction_id      VARCHAR2(18),
  remove_type          VARCHAR2(2) default '0',
  remove_time          DATE
)
;
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.cus_unique_ide
  is '�ͻ�Ψһ��ʶ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.cus_name
  is '�ͻ�����';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.cus_sex
  is '�ͻ��Ա�';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.task_id
  is '������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.org_center
  is '��������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.org_proj
  is '��Ŀ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.org_team
  is '�Ŷ�';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.user_id
  is '��ϯID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.call_status
  is '1��ʾ�Ѳ���0��ʾδ����';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.status
  is '����״̬  1��ʾ�ѷ��䣬0��ʾδ����';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.cus_birthday
  is '��������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.cus_age
  is '����';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.ide_type
  is '֤������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.ide_number
  is '֤������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.cus_metier
  is '�ͻ�ְҵ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.mobile
  is '�ƶ��绰';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.mobile1
  is '�ƶ��绰1';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.mobile2
  is '�ƶ��绰2';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.contect_tel
  is '��ϵ�绰';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.home_tel
  is '��ͥ�绰';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.off_tel
  is '��λ�绰';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.contect_tel_type
  is '��ϵ�绰���ͣ����õ绰��־��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.detailed_address
  is '��ַ_��ַ�����͵�ַ��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.postcode
  is '��ַ_�ʱࣨ���͵�ַ��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.add_type
  is '��ַ����';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.emergency_con_person
  is '���������ˣ�������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.emergency_con_tel
  is '���������ˣ��绰��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.emer_con_relation
  is '������������ͻ���ϵ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.contact_detailed_add
  is '�����ַ_��ַ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.contact_postcode
  is '�����ַ�ʱ�';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.cus_company
  is '������λ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.metier_level
  is 'ְҵ�ȼ�';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.marital_status
  is '����״��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.bank_name
  is '���У������У�';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.bank_account_holder
  is '���п����ˣ������˻�������';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.bank_account
  is '�����˻����ʺţ�';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.is_vip
  is '�Ƿ�����VIP';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.batch_id
  is '����ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.org_id
  is '������ˮ��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.creat_user
  is '������(Ĭ��ϵͳ)';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.creat_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.modify_person
  is '�޸���(���һ���޸�)';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.modify_time
  is '�޸�ʱ��(���һ���޸�)';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.is_blacklist
  is '�Ƿ������� Ĭ��0  �������Ϊ1';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.fax
  is '����';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.res
  is '��ע';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.marital_id
  is 'ְҵ';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.assign_date
  is '��������ʱ��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.is_introduction
  is '�Ƿ���ת�������� 0=���� 1=��';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.introduction_id
  is 'ת����ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.remove_type
  is '�Ƴ�״̬��1�������Ƴ���Ĭ��0';
create index CPIC_SXDX.IDX_CUSLIST_USER_ID_RV on CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE (USER_ID);
create index CPIC_SXDX.IDX_CUSTOMER_LIST_CUSNAME_RV on CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE (CUS_NAME);
create index CPIC_SXDX.IDX_TB_CUST_MDFP_TEAM_RV on CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE (BATCH_ID, USER_ID, CALL_STATUS);
create index CPIC_SXDX.IDX_TB_CUST_STATUS_RV on CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE (ORG_ID, STATUS, CALL_STATUS);
alter table CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE
  add constraint PK_CUS_LIST_ID_RV primary key (CUS_LIST_ID);

prompt
prompt Creating table TB_CUSTOMER_LIST_RMV
prompt ===================================
prompt
create table CPIC_SXDX.TB_CUSTOMER_LIST_RMV
(
  cus_list_id NUMBER(20) not null,
  task_id     NUMBER(18)
)
;
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_RMV.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_RMV.task_id
  is '����id';
create index CPIC_SXDX.IDX_TB_CUS_LIST_RMV_TASKID on CPIC_SXDX.TB_CUSTOMER_LIST_RMV (TASK_ID);
alter table CPIC_SXDX.TB_CUSTOMER_LIST_RMV
  add constraint PK_CUSLISTID primary key (CUS_LIST_ID);

prompt
prompt Creating table TB_CUSTOMER_LIST_RMV_TEMP
prompt ========================================
prompt
create table CPIC_SXDX.TB_CUSTOMER_LIST_RMV_TEMP
(
  cus_list_id      NUMBER(20),
  cus_list_id_temp NUMBER(20)
)
;

prompt
prompt Creating table TB_CUS_ADD_INSURE
prompt ================================
prompt
create table CPIC_SXDX.TB_CUS_ADD_INSURE
(
  cus_add_insure_id NUMBER(18) not null,
  cus_list_id       NUMBER(20),
  cus_intention     VARCHAR2(400),
  agent_id          VARCHAR2(24),
  organ_id          NUMBER(10),
  cus_unique_ide    VARCHAR2(30),
  creat_time        DATE,
  status            VARCHAR2(2)
)
;
comment on column CPIC_SXDX.TB_CUS_ADD_INSURE.cus_add_insure_id
  is '�ӱ��ͻ�ID';
comment on column CPIC_SXDX.TB_CUS_ADD_INSURE.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_CUS_ADD_INSURE.cus_intention
  is '�ͻ�����';
comment on column CPIC_SXDX.TB_CUS_ADD_INSURE.agent_id
  is '��ϯID(������)';
comment on column CPIC_SXDX.TB_CUS_ADD_INSURE.organ_id
  is '��������ID����֯����ID��';
comment on column CPIC_SXDX.TB_CUS_ADD_INSURE.cus_unique_ide
  is '�ͻ�Ψһ��ʶ';
comment on column CPIC_SXDX.TB_CUS_ADD_INSURE.creat_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_CUS_ADD_INSURE.status
  is '״̬���·�״̬��';
alter table CPIC_SXDX.TB_CUS_ADD_INSURE
  add constraint PK_CUS_ADD_INSURE_ID primary key (CUS_ADD_INSURE_ID);

prompt
prompt Creating table TB_CUS_BELONG_INFO
prompt =================================
prompt
create table CPIC_SXDX.TB_CUS_BELONG_INFO
(
  user_id         VARCHAR2(24),
  agentid         VARCHAR2(20),
  employeename    VARCHAR2(32),
  parent_org_id   NUMBER(10),
  org_id          NUMBER(10),
  org_name        VARCHAR2(64),
  batch_id        NUMBER(19),
  batch_name      VARCHAR2(128),
  wait_assign_num NUMBER(10),
  wait_call_num   NUMBER(10),
  follow_num      NUMBER(10),
  ten_num         NUMBER(10),
  total_num       NUMBER(10),
  status          CHAR(1),
  warn_num        NUMBER(10)
)
;
comment on table CPIC_SXDX.TB_CUS_BELONG_INFO
  is '����������Ϣ��';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.user_id
  is '�û�ID';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.agentid
  is '��ϯ����';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.employeename
  is '��Ա����(��ϯ����)';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.parent_org_id
  is '�ϼ�����ID';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.org_id
  is '����id';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.org_name
  is '��֯��������';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.batch_id
  is '���δ���';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.batch_name
  is '��������';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.wait_assign_num
  is '��������';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.wait_call_num
  is '���ײ���';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.follow_num
  is '������';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.ten_num
  is 'ʮ���ڵ�������';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.total_num
  is '��������';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.status
  is '����״̬ 0 ��Ч 1 ��Ч';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.warn_num
  is '�ײ���10���ڵ��ڻ���������';

prompt
prompt Creating table TB_CUS_BLACKLIST
prompt ===============================
prompt
create table CPIC_SXDX.TB_CUS_BLACKLIST
(
  cus_id      NUMBER(10) not null,
  cus_nam     VARCHAR2(50),
  ide_typ     VARCHAR2(2),
  ide_num     VARCHAR2(50),
  mobile      VARCHAR2(20),
  hom_tel     VARCHAR2(30),
  off_tel     VARCHAR2(30),
  other_tel   VARCHAR2(30),
  use_id      VARCHAR2(32),
  creat_time  VARCHAR2(20),
  stat        VARCHAR2(2),
  res1        VARCHAR2(100),
  res2        VARCHAR2(100),
  res3        VARCHAR2(100),
  send_status VARCHAR2(2),
  pass_time   DATE,
  batch_id    NUMBER(19),
  cus_list_id NUMBER(20)
)
;
comment on table CPIC_SXDX.TB_CUS_BLACKLIST
  is '������������Ϣ��';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.cus_id
  is '���кţ�����';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.cus_nam
  is '�ͻ�����';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.ide_typ
  is '֤������,0���֤';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.ide_num
  is '֤�����';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.mobile
  is '�ֻ�����';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.hom_tel
  is '��ͥ�绰';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.off_tel
  is '�칫�绰';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.other_tel
  is '�����绰';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.use_id
  is '�û�ID';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.creat_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.stat
  is '״̬';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.res1
  is '����1';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.res2
  is '����2';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.res3
  is '����3';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.send_status
  is '�Ƿ�����00����NULL-δ������01-�ѹ�����';
alter table CPIC_SXDX.TB_CUS_BLACKLIST
  add constraint PK_TB_CUS_BLACKLIST primary key (CUS_ID);

prompt
prompt Creating table TB_CUS_BLACKLIST_FIX
prompt ===================================
prompt
create table CPIC_SXDX.TB_CUS_BLACKLIST_FIX
(
  cus_id      NUMBER(20) not null,
  batch_id    NUMBER(20),
  cus_list_id NUMBER(20),
  res1        VARCHAR2(3000),
  res2        VARCHAR2(500),
  res3        VARCHAR2(500)
)
;
comment on column CPIC_SXDX.TB_CUS_BLACKLIST_FIX.cus_id
  is '�������id';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST_FIX.batch_id
  is 'ԭ��������id';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST_FIX.cus_list_id
  is 'ԭ����id';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST_FIX.res1
  is '����1';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST_FIX.res2
  is '����2';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST_FIX.res3
  is '����3';
alter table CPIC_SXDX.TB_CUS_BLACKLIST_FIX
  add constraint PK_TB_CUS_BLACKLIST_FIX primary key (CUS_ID);

prompt
prompt Creating table TB_CUS_DTL_MODIFY_LOG_REMOVE
prompt ===========================================
prompt
create table CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE
(
  cus_modify_log_id      NUMBER(20) not null,
  cus_list_id            NUMBER(20),
  add_province           VARCHAR2(50),
  add_city               VARCHAR2(50),
  add_area               VARCHAR2(64),
  cus_email              VARCHAR2(64),
  contact_add_province   VARCHAR2(50),
  contact_add_city       VARCHAR2(50),
  contact_add_area       VARCHAR2(64),
  introducer             VARCHAR2(60),
  intro_time             DATE,
  introducer_relation    VARCHAR2(128),
  income                 VARCHAR2(32),
  education              VARCHAR2(32),
  travel_mode            VARCHAR2(32),
  own_house              VARCHAR2(6),
  own_child              VARCHAR2(6),
  buy_product            VARCHAR2(512),
  car_type               VARCHAR2(128),
  car_price              VARCHAR2(128),
  car_purpose            VARCHAR2(64),
  buy_house_time         VARCHAR2(128),
  house_price            VARCHAR2(128),
  house_area             VARCHAR2(128),
  house_purpose          VARCHAR2(64),
  house_type             VARCHAR2(16),
  interest_type          VARCHAR2(128),
  house_ownership_status VARCHAR2(64),
  cus_company_assets     VARCHAR2(256),
  res1                   VARCHAR2(3000),
  res2                   VARCHAR2(3000),
  res3                   VARCHAR2(512),
  res4                   VARCHAR2(512),
  own_car                VARCHAR2(6),
  fax                    VARCHAR2(20),
  res                    VARCHAR2(300)
)
;
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.cus_modify_log_id
  is '�޸���ʷ�汾��';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.add_province
  is '��ַ_ʡ';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.add_city
  is '��ַ_��';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.add_area
  is '��ַ_����';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.cus_email
  is '�����ʼ�';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.contact_add_province
  is '�����ַ_ʡ';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.contact_add_city
  is '�����ַ_��';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.contact_add_area
  is '�����ַ_����';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.introducer
  is '������';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.intro_time
  is 'ת����ʱ��';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.introducer_relation
  is '������˹�ϵ';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.income
  is '������';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.education
  is '����ˮƽ';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.travel_mode
  is '���з�ʽ';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.own_house
  is '�Ƿ��з�';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.own_child
  is '�Ƿ��к���';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.buy_product
  is '�ѹ���Ʒ';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.car_type
  is '��������';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.car_price
  is '����';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.car_purpose
  is '��ʹ������';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.buy_house_time
  is '���ݹ���ʱ��';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.house_price
  is '���ݹ��ü�';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.house_area
  is '���ݽ������';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.house_purpose
  is '������;';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.house_type
  is '��������';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.interest_type
  is '��Ȥ��������';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.house_ownership_status
  is 'סլ����Ȩ״��';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.cus_company_assets
  is '������˾�����ʲ�';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.res1
  is '��ע1';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.res2
  is '��ע2';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.res3
  is '��ע3';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.res4
  is '��ע4';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.own_car
  is '�Ƿ��г�';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.fax
  is '����';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.res
  is '��ע';
alter table CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE
  add constraint PK_CUS_LIST_DTL_MODIFY_LOG_RMV primary key (CUS_MODIFY_LOG_ID);

prompt
prompt Creating table TB_CUS_INTRODUCTION
prompt ==================================
prompt
create table CPIC_SXDX.TB_CUS_INTRODUCTION
(
  cus_introduction_id NUMBER(18) not null,
  cus_list_id         NUMBER(20),
  cus_unique_ide      VARCHAR2(30),
  cus_source          NUMBER(1),
  introducer_relation VARCHAR2(3),
  cus_name            VARCHAR2(60),
  cus_sex             VARCHAR2(2),
  cus_birthday        VARCHAR2(10),
  ide_type            VARCHAR2(2),
  ide_number          VARCHAR2(50),
  mobile              VARCHAR2(16),
  home_tel            VARCHAR2(20),
  off_tel             VARCHAR2(20),
  add_province        VARCHAR2(50),
  add_city            VARCHAR2(50),
  add_area            VARCHAR2(50),
  detailed_address    VARCHAR2(300),
  postcode            VARCHAR2(6),
  remark              VARCHAR2(1024),
  agent_id            VARCHAR2(24),
  organ_id            NUMBER(10),
  creat_time          DATE,
  status              NUMBER(1),
  batch_id            NUMBER,
  introductor_name    VARCHAR2(64),
  age                 NUMBER(2),
  obcom_id            NUMBER,
  is_delete           NUMBER(1) default 0
)
;
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.cus_introduction_id
  is '转介绍客户ID';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.cus_list_id
  is '介绍人名单Id';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.cus_unique_ide
  is '客户唯一标识';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.cus_source
  is '数据来源 1：导入，2：加保，3：转介绍';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.introducer_relation
  is '与介绍人关系';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.cus_name
  is '客户姓名';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.cus_sex
  is '客户性别';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.cus_birthday
  is '出生日期';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.ide_type
  is '证件类型';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.ide_number
  is '证件号码';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.mobile
  is '移动电话';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.home_tel
  is '家庭电话';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.off_tel
  is '单位电话';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.add_province
  is '联系地址：省';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.add_city
  is '联系地址：市';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.add_area
  is '��ϵ��ַ����/��';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.detailed_address
  is '��ϵ��ַ����ϸ��ַ';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.postcode
  is '�ʱ�';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.remark
  is '��ע';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.agent_id
  is '��ϯID�������ˣ�';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.organ_id
  is '��������ID����֯����ID��';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.creat_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.status
  is '0-δ����������1-����������';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.batch_id
  is '批次Id';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.introductor_name
  is '������';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.age
  is '����';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.obcom_id
  is '�ID';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.is_delete
  is '�Ƿ��ظ���0-δ�ظ���1-ɾ�����Ѵ���ͬ����ת���ܿͻ���';
alter table CPIC_SXDX.TB_CUS_INTRODUCTION
  add constraint PK_CUS_INTRODUCTION_ID primary key (CUS_INTRODUCTION_ID);

prompt
prompt Creating table TB_CUS_LIST_DTL
prompt ==============================
prompt
create table CPIC_SXDX.TB_CUS_LIST_DTL
(
  cus_list_id            NUMBER(20) not null,
  add_province           VARCHAR2(50),
  add_city               VARCHAR2(50),
  add_area               VARCHAR2(64),
  cus_email              VARCHAR2(64),
  contact_add_province   VARCHAR2(50),
  contact_add_city       VARCHAR2(50),
  contact_add_area       VARCHAR2(64),
  introducer             VARCHAR2(60),
  intro_time             DATE,
  introducer_relation    VARCHAR2(128),
  income                 VARCHAR2(32),
  education              VARCHAR2(32),
  travel_mode            VARCHAR2(32),
  own_house              VARCHAR2(6),
  own_child              VARCHAR2(6),
  buy_product            VARCHAR2(512),
  car_type               VARCHAR2(128),
  car_price              VARCHAR2(128),
  car_purpose            VARCHAR2(64),
  buy_house_time         VARCHAR2(128),
  house_price            VARCHAR2(128),
  house_area             VARCHAR2(128),
  house_purpose          VARCHAR2(64),
  house_type             VARCHAR2(16),
  interest_type          VARCHAR2(128),
  house_ownership_status VARCHAR2(64),
  cus_company_assets     VARCHAR2(256),
  res1                   VARCHAR2(3000),
  res2                   VARCHAR2(3000),
  res3                   VARCHAR2(512),
  res4                   VARCHAR2(512),
  own_car                VARCHAR2(6)
)
;
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.add_province
  is '��ַ_ʡ(���͵�ַ)';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.add_city
  is '��ַ_��(���͵�ַ)';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.add_area
  is '��ַ_����(���͵�ַ)';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.cus_email
  is '�����ʼ�';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.contact_add_province
  is '�����ַ_ʡ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.contact_add_city
  is '�����ַ_��';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.contact_add_area
  is '�����ַ_����';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.introducer
  is '������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.intro_time
  is 'ת����ʱ��';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.introducer_relation
  is '������˹�ϵ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.income
  is '������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.education
  is '����ˮƽ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.travel_mode
  is '���з�ʽ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.own_house
  is '�Ƿ��з�';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.own_child
  is '�Ƿ��к���';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.buy_product
  is '�ѹ���Ʒ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.car_type
  is '��������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.car_price
  is '����';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.car_purpose
  is '��ʹ������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.buy_house_time
  is '���ݹ���ʱ��';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.house_price
  is '���ݹ��ü�';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.house_area
  is '���ݽ������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.house_purpose
  is '������;';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.house_type
  is '��������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.interest_type
  is '��Ȥ��������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.house_ownership_status
  is 'סլ����Ȩ״��';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.cus_company_assets
  is '������˾�����ʲ�';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.res1
  is '��ע1';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.res2
  is '��ע2';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.res3
  is '��ע3';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.res4
  is '��ע4';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.own_car
  is '�Ƿ��г�';
alter table CPIC_SXDX.TB_CUS_LIST_DTL
  add constraint PK_CUS_LIST_DTL primary key (CUS_LIST_ID);
alter table CPIC_SXDX.TB_CUS_LIST_DTL
  add constraint FK_CUS_LIST_DTL foreign key (CUS_LIST_ID)
  references CPIC_SXDX.TB_CUSTOMER_LIST (CUS_LIST_ID);

prompt
prompt Creating table TB_CUS_LIST_DTL_BAK
prompt ==================================
prompt
create table CPIC_SXDX.TB_CUS_LIST_DTL_BAK
(
  cus_list_id            NUMBER(20) not null,
  add_province           VARCHAR2(50),
  add_city               VARCHAR2(50),
  add_area               VARCHAR2(64),
  cus_email              VARCHAR2(64),
  contact_add_province   VARCHAR2(50),
  contact_add_city       VARCHAR2(50),
  contact_add_area       VARCHAR2(64),
  introducer             VARCHAR2(60),
  intro_time             DATE,
  introducer_relation    VARCHAR2(128),
  income                 VARCHAR2(32),
  education              VARCHAR2(32),
  travel_mode            VARCHAR2(32),
  own_house              VARCHAR2(6),
  own_child              VARCHAR2(6),
  buy_product            VARCHAR2(512),
  car_type               VARCHAR2(128),
  car_price              VARCHAR2(128),
  car_purpose            VARCHAR2(64),
  buy_house_time         VARCHAR2(128),
  house_price            VARCHAR2(128),
  house_area             VARCHAR2(128),
  house_purpose          VARCHAR2(64),
  house_type             VARCHAR2(16),
  interest_type          VARCHAR2(128),
  house_ownership_status VARCHAR2(64),
  cus_company_assets     VARCHAR2(256),
  res1                   VARCHAR2(3000),
  res2                   VARCHAR2(3000),
  res3                   VARCHAR2(512),
  res4                   VARCHAR2(512),
  own_car                VARCHAR2(6)
)
;
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.add_province
  is '��ַ_ʡ(���͵�ַ)';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.add_city
  is '��ַ_��(���͵�ַ)';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.add_area
  is '��ַ_����(���͵�ַ)';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.cus_email
  is '�����ʼ�';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.contact_add_province
  is '�����ַ_ʡ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.contact_add_city
  is '�����ַ_��';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.contact_add_area
  is '�����ַ_����';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.introducer
  is '������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.intro_time
  is 'ת����ʱ��';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.introducer_relation
  is '������˹�ϵ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.income
  is '������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.education
  is '����ˮƽ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.travel_mode
  is '���з�ʽ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.own_house
  is '�Ƿ��з�';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.own_child
  is '�Ƿ��к���';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.buy_product
  is '�ѹ���Ʒ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.car_type
  is '��������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.car_price
  is '����';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.car_purpose
  is '��ʹ������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.buy_house_time
  is '���ݹ���ʱ��';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.house_price
  is '���ݹ��ü�';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.house_area
  is '���ݽ������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.house_purpose
  is '������;';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.house_type
  is '��������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.interest_type
  is '��Ȥ��������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.house_ownership_status
  is 'סլ����Ȩ״��';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.cus_company_assets
  is '������˾�����ʲ�';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.res1
  is '��ע1';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.res2
  is '��ע2';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.res3
  is '��ע3';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.res4
  is '��ע4';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.own_car
  is '�Ƿ��г�';
alter table CPIC_SXDX.TB_CUS_LIST_DTL_BAK
  add constraint PK_CUS_LIST_DTL_BAK primary key (CUS_LIST_ID);

prompt
prompt Creating table TB_CUS_LIST_DTL_MODIFY_LOG
prompt =========================================
prompt
create table CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG
(
  cus_modify_log_id      NUMBER(20) not null,
  cus_list_id            NUMBER(20),
  add_province           VARCHAR2(50),
  add_city               VARCHAR2(50),
  add_area               VARCHAR2(64),
  cus_email              VARCHAR2(64),
  contact_add_province   VARCHAR2(50),
  contact_add_city       VARCHAR2(50),
  contact_add_area       VARCHAR2(64),
  introducer             VARCHAR2(60),
  intro_time             DATE,
  introducer_relation    VARCHAR2(128),
  income                 VARCHAR2(32),
  education              VARCHAR2(32),
  travel_mode            VARCHAR2(32),
  own_house              VARCHAR2(6),
  own_child              VARCHAR2(6),
  buy_product            VARCHAR2(512),
  car_type               VARCHAR2(128),
  car_price              VARCHAR2(128),
  car_purpose            VARCHAR2(64),
  buy_house_time         VARCHAR2(128),
  house_price            VARCHAR2(128),
  house_area             VARCHAR2(128),
  house_purpose          VARCHAR2(64),
  house_type             VARCHAR2(16),
  interest_type          VARCHAR2(128),
  house_ownership_status VARCHAR2(64),
  cus_company_assets     VARCHAR2(256),
  res1                   VARCHAR2(3000),
  res2                   VARCHAR2(3000),
  res3                   VARCHAR2(512),
  res4                   VARCHAR2(512),
  own_car                VARCHAR2(6),
  fax                    VARCHAR2(20),
  res                    VARCHAR2(300)
)
;
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.cus_modify_log_id
  is '�޸���ʷ�汾��';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.add_province
  is '��ַ_ʡ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.add_city
  is '��ַ_��';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.add_area
  is '��ַ_����';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.cus_email
  is '�����ʼ�';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.contact_add_province
  is '�����ַ_ʡ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.contact_add_city
  is '�����ַ_��';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.contact_add_area
  is '�����ַ_����';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.introducer
  is '������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.intro_time
  is 'ת����ʱ��';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.introducer_relation
  is '������˹�ϵ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.income
  is '������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.education
  is '����ˮƽ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.travel_mode
  is '���з�ʽ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.own_house
  is '�Ƿ��з�';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.own_child
  is '�Ƿ��к���';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.buy_product
  is '�ѹ���Ʒ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.car_type
  is '��������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.car_price
  is '����';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.car_purpose
  is '��ʹ������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.buy_house_time
  is '���ݹ���ʱ��';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.house_price
  is '���ݹ��ü�';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.house_area
  is '���ݽ������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.house_purpose
  is '������;';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.house_type
  is '��������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.interest_type
  is '��Ȥ��������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.house_ownership_status
  is 'סլ����Ȩ״��';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.cus_company_assets
  is '������˾�����ʲ�';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.res1
  is '��ע1';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.res2
  is '��ע2';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.res3
  is '��ע3';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.res4
  is '��ע4';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.own_car
  is '�Ƿ��г�';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.fax
  is '����';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.res
  is '��ע';
alter table CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG
  add constraint PK_CUS_LIST_DTL_MODIFY_LOG primary key (CUS_MODIFY_LOG_ID);

prompt
prompt Creating table TB_CUS_LIST_DTL_REMOVE
prompt =====================================
prompt
create table CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE
(
  cus_list_id            NUMBER(20) not null,
  add_province           VARCHAR2(50),
  add_city               VARCHAR2(50),
  add_area               VARCHAR2(64),
  cus_email              VARCHAR2(64),
  contact_add_province   VARCHAR2(50),
  contact_add_city       VARCHAR2(50),
  contact_add_area       VARCHAR2(64),
  introducer             VARCHAR2(60),
  intro_time             DATE,
  introducer_relation    VARCHAR2(128),
  income                 VARCHAR2(32),
  education              VARCHAR2(32),
  travel_mode            VARCHAR2(32),
  own_house              VARCHAR2(6),
  own_child              VARCHAR2(6),
  buy_product            VARCHAR2(512),
  car_type               VARCHAR2(128),
  car_price              VARCHAR2(128),
  car_purpose            VARCHAR2(64),
  buy_house_time         VARCHAR2(128),
  house_price            VARCHAR2(128),
  house_area             VARCHAR2(128),
  house_purpose          VARCHAR2(64),
  house_type             VARCHAR2(16),
  interest_type          VARCHAR2(128),
  house_ownership_status VARCHAR2(64),
  cus_company_assets     VARCHAR2(256),
  res1                   VARCHAR2(3000),
  res2                   VARCHAR2(3000),
  res3                   VARCHAR2(512),
  res4                   VARCHAR2(512),
  own_car                VARCHAR2(6)
)
;
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.add_province
  is '��ַ_ʡ(���͵�ַ)';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.add_city
  is '��ַ_��(���͵�ַ)';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.add_area
  is '��ַ_����(���͵�ַ)';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.cus_email
  is '�����ʼ�';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.contact_add_province
  is '�����ַ_ʡ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.contact_add_city
  is '�����ַ_��';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.contact_add_area
  is '�����ַ_����';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.introducer
  is '������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.intro_time
  is 'ת����ʱ��';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.introducer_relation
  is '������˹�ϵ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.income
  is '������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.education
  is '����ˮƽ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.travel_mode
  is '���з�ʽ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.own_house
  is '�Ƿ��з�';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.own_child
  is '�Ƿ��к���';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.buy_product
  is '�ѹ���Ʒ';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.car_type
  is '��������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.car_price
  is '����';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.car_purpose
  is '��ʹ������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.buy_house_time
  is '���ݹ���ʱ��';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.house_price
  is '���ݹ��ü�';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.house_area
  is '���ݽ������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.house_purpose
  is '������;';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.house_type
  is '��������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.interest_type
  is '��Ȥ��������';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.house_ownership_status
  is 'סլ����Ȩ״��';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.cus_company_assets
  is '������˾�����ʲ�';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.res1
  is '��ע1';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.res2
  is '��ע2';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.res3
  is '��ע3';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.res4
  is '��ע4';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.own_car
  is '�Ƿ��г�';
alter table CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE
  add constraint PK_CUS_LIST_DTL_RV primary key (CUS_LIST_ID);

prompt
prompt Creating table TB_CUS_LIST_MODIFY_LOG
prompt =====================================
prompt
create table CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG
(
  cus_modify_log_id    NUMBER(20) not null,
  cus_list_id          NUMBER(20),
  cus_unique_ide       VARCHAR2(30),
  cus_name             VARCHAR2(64),
  cus_sex              VARCHAR2(6),
  org_center           NUMBER(19),
  org_proj             NUMBER(19),
  org_team             NUMBER(19),
  user_id              VARCHAR2(24),
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
  batch_id             NUMBER(19),
  org_id               NUMBER(10),
  creat_person         VARCHAR2(24),
  creat_time           DATE,
  modify_person        VARCHAR2(24),
  modify_time          DATE,
  is_blacklist         VARCHAR2(2),
  fax                  VARCHAR2(20),
  res                  VARCHAR2(300)
)
;
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.cus_modify_log_id
  is '�޸���ʷ�汾��';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.cus_unique_ide
  is '�ͻ�Ψһ��ʶ';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.cus_name
  is '�ͻ�����';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.cus_sex
  is '�ͻ��Ա�';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.org_center
  is '��������';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.org_proj
  is '��Ŀ';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.org_team
  is '�Ŷ�';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.user_id
  is '��ϯID';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.status
  is '����״̬';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.cus_birthday
  is '��������';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.cus_age
  is '����';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.ide_type
  is '֤������';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.ide_number
  is '֤������';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.cus_metier
  is '�ͻ�ְҵ';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.mobile
  is '�ƶ��绰';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.mobile1
  is '�ƶ��绰1';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.mobile2
  is '�ƶ��绰2';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.contect_tel
  is '��ϵ�绰';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.home_tel
  is '��ͥ�绰';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.off_tel
  is '��λ�绰';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.contect_tel_type
  is '��ϵ�绰���ͣ����õ绰��־��';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.detailed_address
  is '��ַ_��ַ';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.postcode
  is '��ַ_�ʱ�';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.add_type
  is '��ַ����';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.emergency_con_person
  is '���������ˣ�������';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.emergency_con_tel
  is '���������ˣ��绰��';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.emer_con_relation
  is '������������ͻ���ϵ';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.contact_detailed_add
  is '�����ַ_��ַ';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.contact_postcode
  is '�����ַ�ʱ�';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.cus_company
  is '������λ';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.metier_level
  is 'ְҵ�ȼ�';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.marital_status
  is '����״��';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.bank_name
  is '���У������У�';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.bank_account_holder
  is '���п����ˣ������˻�������';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.bank_account
  is '�����˻����ʺţ�';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.is_vip
  is '�Ƿ�����VIP';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.batch_id
  is '���α��';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.org_id
  is '������ˮ��';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.creat_person
  is '������(Ĭ��ϵͳ)';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.creat_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.modify_person
  is '�޸���(���һ���޸�)';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.modify_time
  is '�޸�ʱ��(���һ���޸�)';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.is_blacklist
  is '�Ƿ�������';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.fax
  is '����';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.res
  is '��ע';
create index CPIC_SXDX.IDX_CUS_MODIFY_LOG_01 on CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG (CUS_LIST_ID);
alter table CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG
  add constraint PK_CUS_MODIFY_LOG_ID primary key (CUS_MODIFY_LOG_ID);

prompt
prompt Creating table TB_CUS_LIST_MODIFY_LOG_REMOVE
prompt ============================================
prompt
create table CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE
(
  cus_modify_log_id    NUMBER(20) not null,
  cus_list_id          NUMBER(20),
  cus_unique_ide       VARCHAR2(30),
  cus_name             VARCHAR2(64),
  cus_sex              VARCHAR2(6),
  org_center           NUMBER(19),
  org_proj             NUMBER(19),
  org_team             NUMBER(19),
  user_id              VARCHAR2(24),
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
  batch_id             NUMBER(19),
  org_id               NUMBER(10),
  creat_person         VARCHAR2(24),
  creat_time           DATE,
  modify_person        VARCHAR2(24),
  modify_time          DATE,
  is_blacklist         VARCHAR2(2),
  fax                  VARCHAR2(20),
  res                  VARCHAR2(300)
)
;
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.cus_modify_log_id
  is '�޸���ʷ�汾��';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.cus_unique_ide
  is '�ͻ�Ψһ��ʶ';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.cus_name
  is '�ͻ�����';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.cus_sex
  is '�ͻ��Ա�';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.org_center
  is '��������';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.org_proj
  is '��Ŀ';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.org_team
  is '�Ŷ�';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.user_id
  is '��ϯID';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.status
  is '����״̬';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.cus_birthday
  is '��������';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.cus_age
  is '����';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.ide_type
  is '֤������';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.ide_number
  is '֤������';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.cus_metier
  is '�ͻ�ְҵ';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.mobile
  is '�ƶ��绰';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.mobile1
  is '�ƶ��绰1';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.mobile2
  is '�ƶ��绰2';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.contect_tel
  is '��ϵ�绰';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.home_tel
  is '��ͥ�绰';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.off_tel
  is '��λ�绰';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.contect_tel_type
  is '��ϵ�绰���ͣ����õ绰��־��';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.detailed_address
  is '��ַ_��ַ';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.postcode
  is '��ַ_�ʱ�';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.add_type
  is '��ַ����';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.emergency_con_person
  is '���������ˣ�������';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.emergency_con_tel
  is '���������ˣ��绰��';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.emer_con_relation
  is '������������ͻ���ϵ';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.contact_detailed_add
  is '�����ַ_��ַ';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.contact_postcode
  is '�����ַ�ʱ�';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.cus_company
  is '������λ';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.metier_level
  is 'ְҵ�ȼ�';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.marital_status
  is '����״��';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.bank_name
  is '���У������У�';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.bank_account_holder
  is '���п����ˣ������˻�������';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.bank_account
  is '�����˻����ʺţ�';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.is_vip
  is '�Ƿ�����VIP';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.batch_id
  is '���α��';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.org_id
  is '������ˮ��';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.creat_person
  is '������(Ĭ��ϵͳ)';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.creat_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.modify_person
  is '�޸���(���һ���޸�)';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.modify_time
  is '�޸�ʱ��(���һ���޸�)';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.is_blacklist
  is '�Ƿ�������';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.fax
  is '����';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.res
  is '��ע';
create index CPIC_SXDX.IDX_CUS_MODIFY_LOG_RMV_01 on CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE (CUS_LIST_ID);
alter table CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE
  add constraint PK_CUS_MODIFY_LOG_ID_RMV primary key (CUS_MODIFY_LOG_ID);

prompt
prompt Creating table TB_CUS_NEWLIST
prompt =============================
prompt
create table CPIC_SXDX.TB_CUS_NEWLIST
(
  cus_newlist_id NUMBER(18) not null,
  newlist_type   VARCHAR2(2),
  ori_batch      NUMBER(19),
  new_batch      NUMBER(19),
  ori_cus_name   VARCHAR2(150),
  ori_cus_mobile VARCHAR2(32),
  new_cus_name   VARCHAR2(150),
  new_cus_mobile VARCHAR2(32),
  organ_id       NUMBER(10),
  agent          VARCHAR2(24),
  create_user    VARCHAR2(24),
  create_time    DATE,
  is_delete      NUMBER(1) default 0,
  cus_list_id    NUMBER(20)
)
;
comment on table CPIC_SXDX.TB_CUS_NEWLIST
  is '����������';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.cus_newlist_id
  is '��������ID';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.newlist_type
  is '������������<0:�ͻ���Ϣ�����޸�,1:�����ͻ�,2:δ������ŮͶ��>';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.ori_batch
  is 'ԭ����ID';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.new_batch
  is '������������ID';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.ori_cus_name
  is 'ԭ�ͻ�����';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.ori_cus_mobile
  is 'ԭ�ͻ��绰';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.new_cus_name
  is '�����ͻ�����';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.new_cus_mobile
  is '�����ͻ��绰';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.organ_id
  is '��������';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.agent
  is '������ϯ';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.create_user
  is '�����û�';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.create_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.is_delete
  is '�Ƿ�ɾ��<0:δɾ��,1:ɾ��>';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.cus_list_id
  is '������ID';
alter table CPIC_SXDX.TB_CUS_NEWLIST
  add constraint PK_CUS_NEWLIST_ID primary key (CUS_NEWLIST_ID);

prompt
prompt Creating table TB_DATACONTROL
prompt =============================
prompt
create table CPIC_SXDX.TB_DATACONTROL
(
  data_id NUMBER(20) not null,
  org_id  NUMBER(10) not null,
  userid  VARCHAR2(24) not null
)
;
comment on table CPIC_SXDX.TB_DATACONTROL
  is '����Ȩ��';
comment on column CPIC_SXDX.TB_DATACONTROL.userid
  is '����,��ʽΪ(ΪtenmentId+"_"+loginId)';
alter table CPIC_SXDX.TB_DATACONTROL
  add constraint PK_DATACONTROL primary key (DATA_ID);
alter table CPIC_SXDX.TB_DATACONTROL
  add constraint FK_DATACONTROL_ORGID_ORGID foreign key (ORG_ID)
  references CPIC_SXDX.TB_ORGANIZATION (ORG_ID);
alter table CPIC_SXDX.TB_DATACONTROL
  add constraint Relationship_10 foreign key (USERID)
  references CPIC_SXDX.C_USER (USERID);

prompt
prompt Creating table TB_DATA_SYN_LOG
prompt ==============================
prompt
create table CPIC_SXDX.TB_DATA_SYN_LOG
(
  table_name VARCHAR2(100),
  status     CHAR(1),
  syn_date   DATE,
  note       VARCHAR2(1000)
)
;
comment on table CPIC_SXDX.TB_DATA_SYN_LOG
  is '����ϵͳ����ͬ�������Ϣ��';
comment on column CPIC_SXDX.TB_DATA_SYN_LOG.table_name
  is '����';
comment on column CPIC_SXDX.TB_DATA_SYN_LOG.status
  is 'ͬ��״̬ 0��ʧ�ܣ�1���ɹ���';
comment on column CPIC_SXDX.TB_DATA_SYN_LOG.syn_date
  is '���ͬ��ʱ��';
comment on column CPIC_SXDX.TB_DATA_SYN_LOG.note
  is 'ͬ����ϸ��Ϣ��¼';

prompt
prompt Creating table TB_DELIVERY_INFO
prompt ===============================
prompt
create table CPIC_SXDX.TB_DELIVERY_INFO
(
  deli_id        NUMBER(10) not null,
  application_id VARCHAR2(18),
  deli_prov      NUMBER(10),
  deli_city      NUMBER(10),
  deli_region    NUMBER(10),
  deli_dtl       VARCHAR2(300),
  deli_adds      VARCHAR2(500),
  deli_postcode  VARCHAR2(10),
  deli_name      VARCHAR2(50),
  deli_phoneno   VARCHAR2(50),
  deli_note      VARCHAR2(500),
  zone_code      VARCHAR2(50),
  mark           VARCHAR2(1)
)
;
comment on table CPIC_SXDX.TB_DELIVERY_INFO
  is '������Ϣ��';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_id
  is 'PK��ˮ��';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.application_id
  is 'Ͷ����ID����Ӧ��ϵͳ���APP_ID�ֶ�';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_prov
  is 'ʡ';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_city
  is '��';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_region
  is '����';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_dtl
  is '��ϸ��ַ';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_adds
  is 'ʡ+��+����+��ϸ��ַ����Ӧ��ϵͳ�����DELI_ADDS�ֶ�';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_postcode
  is '�ʱ�';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_name
  is '�ռ�������';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_phoneno
  is '�ռ��˵绰����Ӧ��ϵͳ���DELI_TEL�ֶ�';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_note
  is '��ע';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.zone_code
  is '�������';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.mark
  is '��ַ��Դ��0-�����ͻ���1-���������ͻ���2-����';
create unique index CPIC_SXDX.UNQ_TB_DELIVERYINFO_APPID on CPIC_SXDX.TB_DELIVERY_INFO (APPLICATION_ID);
alter table CPIC_SXDX.TB_DELIVERY_INFO
  add constraint PK_DELIVERY_INFO primary key (DELI_ID);
alter table CPIC_SXDX.TB_DELIVERY_INFO
  add constraint FK_DELIINFO_APPLICATIONID_APP foreign key (APPLICATION_ID)
  references CPIC_SXDX.TB_APPLICATION (APPLICATION_ID);

prompt
prompt Creating table TB_DICTIONARY_PARENT
prompt ===================================
prompt
create table CPIC_SXDX.TB_DICTIONARY_PARENT
(
  parent_id          VARCHAR2(10) not null,
  name               VARCHAR2(32),
  desc               VARCHAR2(64),
  istree             NUMBER(1) default 0 not null,
  belongtable        VARCHAR2(128),
  belongfield        VARCHAR2(128),
  issystem           NUMBER(1),
  isautodictionaryid NUMBER(1) default 0 not null,
  isdel              NUMBER(1) default 0 not null,
  create_user        VARCHAR2(24) not null,
  create_time        DATE not null,
  update_user        VARCHAR2(24),
  update_time        DATE
)
;
comment on table CPIC_SXDX.TB_DICTIONARY_PARENT
  is '�����ֵ����';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.parent_id
  is '�����ֵ���ID';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.name
  is '�����ֵ�������';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.desc
  is '����';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.istree
  is '�Ƿ�Ϊ���ڵ㡣
1�ǡ�
Ĭ��0';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.belongtable
  is '�����������֮���ö��ŷֿ�����������ʹ���ֶ�
';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.belongfield
  is '�����ֶΣ���������ʹ���ֶ�';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.issystem
  is '�Ƿ񲻿�
0����
1�ǡ�Ĭ��0

ϵͳ�ֵ䡣�����⻧�û�ֻ�ܲ鿴�������κβ�����';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.isautodictionaryid
  is '�ֵ�ֵ����Ƿ��Զ����ɣ�
0��Ĭ��0
1�ǡ�';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.isdel
  is '�Ƿ�ɾ����1ɾ����0��ɾ����';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.create_user
  is '������';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.create_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.update_user
  is '�޸���';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.update_time
  is '�޸�ʱ��';
alter table CPIC_SXDX.TB_DICTIONARY_PARENT
  add constraint PK_DICTIONARY_PARENT primary key (PARENT_ID);

prompt
prompt Creating table TB_DMTYPE
prompt ========================
prompt
create table CPIC_SXDX.TB_DMTYPE
(
  id           VARCHAR2(4) not null,
  name         VARCHAR2(1024),
  recordstatus CHAR(1),
  src          CHAR(2),
  pay_mode     CHAR(2),
  use_ali_id   VARCHAR2(16)
)
;
comment on table CPIC_SXDX.TB_DMTYPE
  is 'Ͷ�����������ͱ�';
alter table CPIC_SXDX.TB_DMTYPE
  add primary key (ID);

prompt
prompt Creating table TB_ELEMENT
prompt =========================
prompt
create table CPIC_SXDX.TB_ELEMENT
(
  element_id   NUMBER(20) not null,
  element_name VARCHAR2(50),
  element_code VARCHAR2(50),
  element_type VARCHAR2(10),
  sort         NUMBER(10),
  remark       VARCHAR2(100),
  is_delete    VARCHAR2(1)
)
;
comment on column CPIC_SXDX.TB_ELEMENT.element_id
  is '��������ID';
comment on column CPIC_SXDX.TB_ELEMENT.element_name
  is '��������';
comment on column CPIC_SXDX.TB_ELEMENT.element_code
  is '���Ա���';
comment on column CPIC_SXDX.TB_ELEMENT.element_type
  is '��������';
comment on column CPIC_SXDX.TB_ELEMENT.sort
  is '������ʾ����˳��';
comment on column CPIC_SXDX.TB_ELEMENT.remark
  is '��ע����ϵͳΪ��REMARK';
comment on column CPIC_SXDX.TB_ELEMENT.is_delete
  is '�Ƿ�ɾ����0����1����';
alter table CPIC_SXDX.TB_ELEMENT
  add constraint PK_ELEMENT_ID primary key (ELEMENT_ID);

prompt
prompt Creating table TB_ELEMENT_VALUE
prompt ===============================
prompt
create table CPIC_SXDX.TB_ELEMENT_VALUE
(
  element_value_id NUMBER(20) not null,
  name             VARCHAR2(20),
  value            VARCHAR2(20),
  remark           VARCHAR2(100),
  is_delete        VARCHAR2(2)
)
;
comment on column CPIC_SXDX.TB_ELEMENT_VALUE.element_value_id
  is '����Ԫ��ID';
comment on column CPIC_SXDX.TB_ELEMENT_VALUE.name
  is 'Ԫ��ֵ����';
comment on column CPIC_SXDX.TB_ELEMENT_VALUE.value
  is 'Ԫ��ֵ';
comment on column CPIC_SXDX.TB_ELEMENT_VALUE.remark
  is '��ע����ϵͳΪ��REMARK';
comment on column CPIC_SXDX.TB_ELEMENT_VALUE.is_delete
  is '�Ƿ�ɾ����0����1����';
alter table CPIC_SXDX.TB_ELEMENT_VALUE
  add constraint PK_ELEMENT_VALUE_ID primary key (ELEMENT_VALUE_ID);

prompt
prompt Creating table TB_ELE_ELEMENT_VALUE
prompt ===================================
prompt
create table CPIC_SXDX.TB_ELE_ELEMENT_VALUE
(
  ele_element_value_id NUMBER(20) not null,
  element_value_id     NUMBER(20),
  element_id           NUMBER(20)
)
;
comment on column CPIC_SXDX.TB_ELE_ELEMENT_VALUE.ele_element_value_id
  is '��ID';
comment on column CPIC_SXDX.TB_ELE_ELEMENT_VALUE.element_value_id
  is 'Ԫ��ID';
comment on column CPIC_SXDX.TB_ELE_ELEMENT_VALUE.element_id
  is '��������ID';
alter table CPIC_SXDX.TB_ELE_ELEMENT_VALUE
  add constraint PK_ELE_ELEMENT_VALUE_ID primary key (ELE_ELEMENT_VALUE_ID);
alter table CPIC_SXDX.TB_ELE_ELEMENT_VALUE
  add constraint FK_ELEMENT_VALUE_ELE foreign key (ELEMENT_VALUE_ID)
  references CPIC_SXDX.TB_ELEMENT_VALUE (ELEMENT_VALUE_ID);
alter table CPIC_SXDX.TB_ELE_ELEMENT_VALUE
  add constraint FK_ELE_ELEMENT_VALUE foreign key (ELEMENT_ID)
  references CPIC_SXDX.TB_ELEMENT (ELEMENT_ID);

prompt
prompt Creating table TB_FILE_LOG
prompt ==========================
prompt
create table CPIC_SXDX.TB_FILE_LOG
(
  file_log_id NUMBER(18) not null,
  filename    VARCHAR2(200),
  filetype    VARCHAR2(3),
  batchdate   VARCHAR2(15),
  dataname    VARCHAR2(100),
  createtime  DATE,
  changetime  DATE,
  issuccess   CHAR(1)
)
;
comment on column CPIC_SXDX.TB_FILE_LOG.file_log_id
  is 'id';
comment on column CPIC_SXDX.TB_FILE_LOG.filename
  is '�ļ�·��';
comment on column CPIC_SXDX.TB_FILE_LOG.filetype
  is '�ļ�����1=�����û�';
comment on column CPIC_SXDX.TB_FILE_LOG.batchdate
  is '��������';
comment on column CPIC_SXDX.TB_FILE_LOG.dataname
  is '�ļ���';
comment on column CPIC_SXDX.TB_FILE_LOG.createtime
  is '����ʱ��';
comment on column CPIC_SXDX.TB_FILE_LOG.changetime
  is '����ʱ��';
comment on column CPIC_SXDX.TB_FILE_LOG.issuccess
  is '0=�ɹ�1=ʧ��';
create index CPIC_SXDX.IDX_FILELOG_BATCHDATE on CPIC_SXDX.TB_FILE_LOG (BATCHDATE);
create index CPIC_SXDX.IDX_FILELOG_ISCUCCESS on CPIC_SXDX.TB_FILE_LOG (ISSUCCESS);
alter table CPIC_SXDX.TB_FILE_LOG
  add constraint PK_FILE_LOG_ID primary key (FILE_LOG_ID);

prompt
prompt Creating table TB_FILE_UPLOAD_LOG
prompt =================================
prompt
create table CPIC_SXDX.TB_FILE_UPLOAD_LOG
(
  file_id      NUMBER(20) not null,
  file_type    NUMBER(1),
  file_name    VARCHAR2(20),
  file_path    VARCHAR2(100),
  user_id      VARCHAR2(24),
  upload_date  DATE,
  upload_state NUMBER(1),
  is_save      NUMBER(1)
)
;
comment on column CPIC_SXDX.TB_FILE_UPLOAD_LOG.file_id
  is '�ļ�ID';
comment on column CPIC_SXDX.TB_FILE_UPLOAD_LOG.file_type
  is '�ļ�����(1-�����ļ���2-�ͻ���Ϣ�ļ�)';
comment on column CPIC_SXDX.TB_FILE_UPLOAD_LOG.file_name
  is '�ļ�����';
comment on column CPIC_SXDX.TB_FILE_UPLOAD_LOG.file_path
  is '�ļ�·��';
comment on column CPIC_SXDX.TB_FILE_UPLOAD_LOG.user_id
  is '�ϴ���ID';
comment on column CPIC_SXDX.TB_FILE_UPLOAD_LOG.upload_date
  is '�ϴ�����';
comment on column CPIC_SXDX.TB_FILE_UPLOAD_LOG.upload_state
  is '�ϴ�״̬��0-�ɹ���1-��ɾ����';
comment on column CPIC_SXDX.TB_FILE_UPLOAD_LOG.is_save
  is '�Ƿ��������(0-û��⣬1-���)';
alter table CPIC_SXDX.TB_FILE_UPLOAD_LOG
  add constraint PK_FILE_ID primary key (FILE_ID);

prompt
prompt Creating table TB_FREE_APPLICATION
prompt ==================================
prompt
create table CPIC_SXDX.TB_FREE_APPLICATION
(
  id                 NUMBER(10) not null,
  apper_name         VARCHAR2(50),
  apper_gender       VARCHAR2(4),
  apper_lic_type     VARCHAR2(2),
  apper_lic_no       VARCHAR2(20),
  apper_insed_rel    VARCHAR2(2),
  apper_email        VARCHAR2(64),
  apper_cell_no      VARCHAR2(14),
  apper_phone_no     VARCHAR2(20),
  apper_birthday     DATE,
  apper_postcode     VARCHAR2(6),
  apper_adds         VARCHAR2(1000),
  insed_name         VARCHAR2(20),
  insed_lic_type     VARCHAR2(2),
  insed_lic_no       VARCHAR2(50),
  insed_birthday     DATE,
  app_startdt        DATE,
  create_time        DATE,
  update_time        DATE,
  company_id         VARCHAR2(30),
  product_code_id    VARCHAR2(30),
  benifit            VARCHAR2(20),
  user_id            VARCHAR2(24),
  apper_province     VARCHAR2(50),
  apper_city         VARCHAR2(50),
  apper_area         VARCHAR2(50),
  is_take_in         CHAR(2),
  is_buy             CHAR(2),
  end_time           DATE,
  app_stat_new       VARCHAR2(2),
  presentins_type    CHAR(2),
  apper_metier       VARCHAR2(50),
  apper_keep_soc_ins VARCHAR2(2),
  apper_int_ins      VARCHAR2(2),
  apper_marital      VARCHAR2(2),
  apper_education    VARCHAR2(2),
  apper_salary       VARCHAR2(20),
  apper_health       VARCHAR2(2),
  apper_keep_ins     VARCHAR2(2),
  is_del             VARCHAR2(2),
  is_send            VARCHAR2(2) default 0,
  apper_id           VARCHAR2(10),
  obcom_id           NUMBER(10)
)
;
comment on column CPIC_SXDX.TB_FREE_APPLICATION.id
  is '����';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_name
  is 'Ͷ��������';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_gender
  is 'Ͷ�����Ա�-1:�� 2:Ů';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_lic_type
  is 'Ͷ����֤������';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_lic_no
  is 'Ͷ����֤������';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_insed_rel
  is 'Ͷ�����뱻�����˹�ϵ';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_email
  is 'Ͷ����MAIL';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_cell_no
  is 'Ͷ���˹̻�����';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_phone_no
  is 'Ͷ�����ֻ�����';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_birthday
  is 'Ͷ��������(YYYY-MM-DD)';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_postcode
  is 'Ͷ������������';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_adds
  is 'Ͷ���˵�ַ';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.insed_name
  is '����������';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.insed_lic_type
  is '������֤������';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.insed_lic_no
  is '������֤������';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.insed_birthday
  is '������(YYYY-MM-DD)';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.app_startdt
  is '���յ���Ч����(YYYY-MM-DD)';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.create_time
  is '����ʱ��(YYYY-MM-DD HH:MM:SS)';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.update_time
  is '����޸�ʱ��';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.company_id
  is 'Ͷ���ֹ�˾';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.product_code_id
  is '���ղ�Ʒid';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.benifit
  is '������';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.user_id
  is '�û�ID';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_province
  is 'Ͷ��������ʡ��';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_city
  is 'Ͷ�������ڵؼ���';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_area
  is 'Ͷ�������ڵ��¼�������';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.is_take_in
  is '�Ƿ������������';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.is_buy
  is '�Ƿ���';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.end_time
  is '���յ�������';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.app_stat_new
  is '�����̱���״̬ 01:�ݴ�ɹ� 02:���䱣���ųɹ� 03:���ύ ';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.presentins_type
  is '�������� 1���Խ�������Ϣ 2������������Ϣ3����������';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_metier
  is 'Ͷ����ְҵ';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_keep_soc_ins
  is '�Ƿ����籣';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_int_ins
  is '����Ȥ������';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_marital
  is '����״��';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_education
  is '���ѧ�� 1:��ʿ�о��� 2:˶ʿ�о��� 3:��ѧ���� 4:��ѧר�� 5:��ͨ���� 6:��ְ����ר��ְУ����У�� 7:���м�����';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_salary
  is '��������   1:3��Ԫ����  2:3�򣨺�����10��Ԫ  3:10�򣨺�����30��Ԫ  4:30��Ԫ����������';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_health
  is '����״��';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_keep_ins
  is '�Ƿ��������';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.is_del
  is '�Ƿ�ɾ���� 0Ĭ�ϡ�1Ϊɾ��';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.is_send
  is '�Ƿ��͸���ϵͳ 0û�з���   1�Ѿ����� Ĭ��Ϊ 0';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_id
  is '�ͻ���ID';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.obcom_id
  is '�ID';
alter table CPIC_SXDX.TB_FREE_APPLICATION
  add primary key (ID);

prompt
prompt Creating table TB_FREE_APPLICATION_TEMP
prompt =======================================
prompt
create table CPIC_SXDX.TB_FREE_APPLICATION_TEMP
(
  id                 NUMBER(10) not null,
  apper_name         VARCHAR2(30),
  apper_gender       VARCHAR2(4),
  apper_lic_type     VARCHAR2(2),
  apper_lic_no       VARCHAR2(20),
  apper_insed_rel    VARCHAR2(2),
  apper_email        VARCHAR2(64),
  apper_cell_no      VARCHAR2(14),
  apper_phone_no     VARCHAR2(20),
  apper_birthday     DATE,
  apper_postcode     VARCHAR2(6),
  apper_adds         VARCHAR2(1000),
  insed_name         VARCHAR2(20),
  insed_lic_type     VARCHAR2(2),
  insed_lic_no       VARCHAR2(50),
  insed_birthday     DATE,
  app_startdt        DATE,
  create_time        DATE,
  update_time        DATE,
  company_id         VARCHAR2(30),
  product_code_id    VARCHAR2(30),
  benifit            VARCHAR2(20),
  user_id            VARCHAR2(24),
  apper_province     VARCHAR2(50),
  apper_city         VARCHAR2(50),
  apper_area         VARCHAR2(50),
  is_take_in         CHAR(2),
  is_buy             CHAR(2),
  end_time           DATE,
  app_stat_new       VARCHAR2(2),
  presentins_type    CHAR(2),
  apper_metier       VARCHAR2(50),
  apper_keep_soc_ins VARCHAR2(2),
  apper_int_ins      VARCHAR2(2),
  apper_marital      VARCHAR2(2),
  apper_education    VARCHAR2(2),
  apper_salary       VARCHAR2(20),
  apper_health       VARCHAR2(2),
  apper_keep_ins     VARCHAR2(2),
  is_del             VARCHAR2(2),
  is_send            VARCHAR2(2) default 0,
  apper_id           VARCHAR2(10),
  obcom_id           NUMBER(10)
)
;
alter table CPIC_SXDX.TB_FREE_APPLICATION_TEMP
  add primary key (ID);

prompt
prompt Creating table TB_FREE_APP_OBCOM
prompt ================================
prompt
create table CPIC_SXDX.TB_FREE_APP_OBCOM
(
  id          NUMBER not null,
  obm_id      NUMBER,
  code        VARCHAR2(15),
  name        VARCHAR2(100),
  status      VARCHAR2(2),
  create_time DATE,
  creator     VARCHAR2(64),
  updator     VARCHAR2(64),
  update_time DATE
)
;
comment on column CPIC_SXDX.TB_FREE_APP_OBCOM.id
  is '����';
comment on column CPIC_SXDX.TB_FREE_APP_OBCOM.obm_id
  is '�id';
comment on column CPIC_SXDX.TB_FREE_APP_OBCOM.code
  is '���ղ�ƷCODE';
comment on column CPIC_SXDX.TB_FREE_APP_OBCOM.name
  is '���ղ�Ʒ����';
comment on column CPIC_SXDX.TB_FREE_APP_OBCOM.status
  is '״̬';
comment on column CPIC_SXDX.TB_FREE_APP_OBCOM.create_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_FREE_APP_OBCOM.creator
  is '������';
comment on column CPIC_SXDX.TB_FREE_APP_OBCOM.updator
  is '������';
comment on column CPIC_SXDX.TB_FREE_APP_OBCOM.update_time
  is '����ʱ��';
alter table CPIC_SXDX.TB_FREE_APP_OBCOM
  add constraint PK_TB_FREE_APP_OBCOM_ID primary key (ID);

prompt
prompt Creating table TB_FREE_APP_OBCOM_TEMP
prompt =====================================
prompt
create table CPIC_SXDX.TB_FREE_APP_OBCOM_TEMP
(
  id          NUMBER not null,
  obm_id      NUMBER,
  code        VARCHAR2(15),
  name        VARCHAR2(100),
  status      VARCHAR2(2),
  create_time DATE,
  creator     VARCHAR2(64),
  updator     VARCHAR2(64),
  update_time DATE
)
;

prompt
prompt Creating table TB_FREE_APP_PRODUCT
prompt ==================================
prompt
create table CPIC_SXDX.TB_FREE_APP_PRODUCT
(
  id                  NUMBER(10) not null,
  code                VARCHAR2(6) not null,
  name                VARCHAR2(100) not null,
  expired             NUMBER(3) not null,
  status              NUMBER(1) not null,
  insured_period      NUMBER(5),
  insured_period_unit VARCHAR2(2),
  insurance_ident     NUMBER(1),
  composite_ins_code  VARCHAR2(6),
  pay_stad            NUMBER(7,2),
  fs                  NUMBER(2),
  bxzr                VARCHAR2(100)
)
;
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.id
  is '����';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.code
  is '���ղ�Ʒcode';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.name
  is '���ղ�Ʒ����';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.status
  is '0:����,1:ɾ��';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.insured_period
  is '��������';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.insured_period_unit
  is '�������޵�λ 01���� 02���� 03����';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.insurance_ident
  is '���ֱ�ʶ 1:Ϊ�������գ�2:Ϊ����������';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.composite_ins_code
  is '�����մ���';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.pay_stad
  is '�ɷѱ�׼';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.fs
  is '����';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.bxzr
  is '��������';
alter table CPIC_SXDX.TB_FREE_APP_PRODUCT
  add constraint PK_TB_FREE_APP_PRODUCT primary key (ID);

prompt
prompt Creating table TB_FREE_APP_PRODUCT_TEMP
prompt =======================================
prompt
create table CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP
(
  id                  NUMBER(10) not null,
  code                VARCHAR2(6) not null,
  name                VARCHAR2(100) not null,
  expired             NUMBER(3) not null,
  status              NUMBER(1) not null,
  insured_period      NUMBER(5),
  insured_period_unit VARCHAR2(2),
  insurance_ident     NUMBER(1),
  composite_ins_code  VARCHAR2(6),
  pay_stad            NUMBER(7,2),
  fs                  NUMBER(2),
  bxzr                VARCHAR2(100)
)
;
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.id
  is '����';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.code
  is '���ղ�Ʒcode';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.name
  is '���ղ�Ʒ����';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.status
  is '0:����,1:ɾ��';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.insured_period
  is '��������';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.insured_period_unit
  is '�������޵�λ 01���� 02���� 03����';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.insurance_ident
  is '���ֱ�ʶ 1:Ϊ�������գ�2:Ϊ����������';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.composite_ins_code
  is '�����մ���';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.pay_stad
  is '�ɷѱ�׼';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.fs
  is '����';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.bxzr
  is '��������';
alter table CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP
  add constraint PK_TB_FREE_APP_PRODUCT_01 primary key (ID);

prompt
prompt Creating table TB_INSURANCE
prompt ===========================
prompt
create table CPIC_SXDX.TB_INSURANCE
(
  insurance_id   NUMBER(20) not null,
  insurance_name VARCHAR2(100),
  insurance_type VARCHAR2(2),
  insurance_sum  VARCHAR2(20),
  remark         VARCHAR2(200),
  is_delete      VARCHAR2(2),
  term_type      VARCHAR2(2)
)
;
comment on table CPIC_SXDX.TB_INSURANCE
  is '���ֱ�';
comment on column CPIC_SXDX.TB_INSURANCE.insurance_id
  is '����ID';
comment on column CPIC_SXDX.TB_INSURANCE.insurance_name
  is '��������';
comment on column CPIC_SXDX.TB_INSURANCE.insurance_type
  is '�������ͣ�0�����գ�1������';
comment on column CPIC_SXDX.TB_INSURANCE.insurance_sum
  is '����';
comment on column CPIC_SXDX.TB_INSURANCE.remark
  is '��ע����ϵͳΪ��REMARK';
comment on column CPIC_SXDX.TB_INSURANCE.is_delete
  is 'ɾ����ʶ';
comment on column CPIC_SXDX.TB_INSURANCE.term_type
  is '�����ڼ�����: 0�������ꣻ1�������ꣻ2������';
alter table CPIC_SXDX.TB_INSURANCE
  add constraint PK_INSURANCE_ID primary key (INSURANCE_ID);

prompt
prompt Creating table TB_INSURANCE_TERM_CODE
prompt =====================================
prompt
create table CPIC_SXDX.TB_INSURANCE_TERM_CODE
(
  insurance_term_code_id NUMBER(10) not null,
  insurance_id           NUMBER(20),
  term                   VARCHAR2(10),
  insurance_code         VARCHAR2(50),
  ff_insurance_code      VARCHAR2(50)
)
;
comment on table CPIC_SXDX.TB_INSURANCE_TERM_CODE
  is '���ִ����';
comment on column CPIC_SXDX.TB_INSURANCE_TERM_CODE.insurance_term_code_id
  is '���ִ���ID';
comment on column CPIC_SXDX.TB_INSURANCE_TERM_CODE.insurance_id
  is '����ID';
comment on column CPIC_SXDX.TB_INSURANCE_TERM_CODE.term
  is '�����ڼ�';
comment on column CPIC_SXDX.TB_INSURANCE_TERM_CODE.insurance_code
  is '���ִ���';
comment on column CPIC_SXDX.TB_INSURANCE_TERM_CODE.ff_insurance_code
  is 'FF���ִ���';
alter table CPIC_SXDX.TB_INSURANCE_TERM_CODE
  add constraint PK_INSURANCE_TERM_CODE_ID primary key (INSURANCE_TERM_CODE_ID);
alter table CPIC_SXDX.TB_INSURANCE_TERM_CODE
  add constraint FK_INSURANCE_CODE foreign key (INSURANCE_ID)
  references CPIC_SXDX.TB_INSURANCE (INSURANCE_ID);

prompt
prompt Creating table TB_INS_ELEMENT
prompt =============================
prompt
create table CPIC_SXDX.TB_INS_ELEMENT
(
  ins_element_id NUMBER(20) not null,
  element_id     NUMBER(20),
  insurance_id   NUMBER(20),
  default_value  VARCHAR2(500),
  is_hidden      VARCHAR2(2)
)
;
comment on table CPIC_SXDX.TB_INS_ELEMENT
  is '�������Թ�����';
comment on column CPIC_SXDX.TB_INS_ELEMENT.ins_element_id
  is '����ID';
comment on column CPIC_SXDX.TB_INS_ELEMENT.element_id
  is '��������ID';
comment on column CPIC_SXDX.TB_INS_ELEMENT.insurance_id
  is '����ID';
comment on column CPIC_SXDX.TB_INS_ELEMENT.default_value
  is 'Ĭ��ֵ';
comment on column CPIC_SXDX.TB_INS_ELEMENT.is_hidden
  is '�Ƿ�����';
alter table CPIC_SXDX.TB_INS_ELEMENT
  add constraint PK_INS_ELEMENT_ID primary key (INS_ELEMENT_ID);
alter table CPIC_SXDX.TB_INS_ELEMENT
  add constraint FK_ELEMENT_INSURANCE foreign key (ELEMENT_ID)
  references CPIC_SXDX.TB_ELEMENT (ELEMENT_ID);
alter table CPIC_SXDX.TB_INS_ELEMENT
  add constraint FK_INSURANCE_ELEMENT foreign key (INSURANCE_ID)
  references CPIC_SXDX.TB_INSURANCE (INSURANCE_ID);

prompt
prompt Creating table TB_INS_ELEMENT_VALUE
prompt ===================================
prompt
create table CPIC_SXDX.TB_INS_ELEMENT_VALUE
(
  ins_element_value_id NUMBER(20) not null,
  element_value_id     NUMBER(20),
  insurance_id         NUMBER(20),
  element_id           NUMBER(20)
)
;
comment on table CPIC_SXDX.TB_INS_ELEMENT_VALUE
  is '����Ԫ�ع�����';
comment on column CPIC_SXDX.TB_INS_ELEMENT_VALUE.ins_element_value_id
  is '����ID';
comment on column CPIC_SXDX.TB_INS_ELEMENT_VALUE.element_value_id
  is 'Ԫ��ID';
comment on column CPIC_SXDX.TB_INS_ELEMENT_VALUE.insurance_id
  is '����ID';
comment on column CPIC_SXDX.TB_INS_ELEMENT_VALUE.element_id
  is '��������ID';
alter table CPIC_SXDX.TB_INS_ELEMENT_VALUE
  add constraint PK_INS_ELEMENT_VALUE_ID primary key (INS_ELEMENT_VALUE_ID);
alter table CPIC_SXDX.TB_INS_ELEMENT_VALUE
  add constraint FK_ELEMENT_VALUE_INSURANCE foreign key (ELEMENT_VALUE_ID)
  references CPIC_SXDX.TB_ELEMENT_VALUE (ELEMENT_VALUE_ID);
alter table CPIC_SXDX.TB_INS_ELEMENT_VALUE
  add constraint FK_INSURANCE_ELEMENT_VALUE foreign key (INSURANCE_ID)
  references CPIC_SXDX.TB_INSURANCE (INSURANCE_ID);

prompt
prompt Creating table TB_LIMIT_METIERTYPE
prompt ==================================
prompt
create table CPIC_SXDX.TB_LIMIT_METIERTYPE
(
  limit_metiertype_id NUMBER(10) not null,
  metiertype_name     VARCHAR2(10),
  metiertype_des      VARCHAR2(100)
)
;
comment on table CPIC_SXDX.TB_LIMIT_METIERTYPE
  is '����ְҵ���ͱ�';
comment on column CPIC_SXDX.TB_LIMIT_METIERTYPE.limit_metiertype_id
  is '����ְҵ����ID';
comment on column CPIC_SXDX.TB_LIMIT_METIERTYPE.metiertype_name
  is 'ְҵ��������';
comment on column CPIC_SXDX.TB_LIMIT_METIERTYPE.metiertype_des
  is 'ְҵ��������';
alter table CPIC_SXDX.TB_LIMIT_METIERTYPE
  add constraint PK_LIMIT_METIERTYPE_ID primary key (LIMIT_METIERTYPE_ID);

prompt
prompt Creating table TB_LOG
prompt =====================
prompt
create table CPIC_SXDX.TB_LOG
(
  id      VARCHAR2(18) not null,
  ttime   DATE,
  idsort  CHAR(4),
  idobj   VARCHAR2(18),
  content VARCHAR2(2000)
)
;
comment on table CPIC_SXDX.TB_LOG
  is 'Ͷ�����ύ��־��';
alter table CPIC_SXDX.TB_LOG
  add primary key (ID);

prompt
prompt Creating table TB_LOG_EBI
prompt =========================
prompt
create table CPIC_SXDX.TB_LOG_EBI
(
  id      NUMBER(10) not null,
  ttime   DATE,
  idsort  VARCHAR2(4),
  idobj   VARCHAR2(18),
  content VARCHAR2(1024)
)
;
comment on table CPIC_SXDX.TB_LOG_EBI
  is '����ϵͳͶ�����ύ��־��';
alter table CPIC_SXDX.TB_LOG_EBI
  add primary key (ID);

prompt
prompt Creating table TB_MESSAGE_LOG
prompt =============================
prompt
create table CPIC_SXDX.TB_MESSAGE_LOG
(
  messageid    NUMBER(20) not null,
  mobiletel    VARCHAR2(16),
  message_time DATE,
  cus_list_id  NUMBER(20),
  task_id      NUMBER(20),
  is_success   NUMBER(1),
  memo         VARCHAR2(500),
  create_user  VARCHAR2(24),
  create_time  DATE,
  update_user  VARCHAR2(24),
  update_time  DATE
)
;
comment on column CPIC_SXDX.TB_MESSAGE_LOG.messageid
  is '����ID';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.mobiletel
  is '�ƶ��绰';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.message_time
  is '���͵Ķ���ʱ�䣨��ȷ��ʱ���룩';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.task_id
  is '����ID';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.is_success
  is '���ŷ����Ƿ�ɹ�   0--�ɹ�  1--ʧ��';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.memo
  is '���͵���־��Ϣ  ʧ�ܼ�¼ʱ���ʧ��ԭ��';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.create_user
  is '������';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.create_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.update_user
  is '�޸���';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.update_time
  is '�޸�ʱ��';

prompt
prompt Creating table TB_METIER
prompt ========================
prompt
create table CPIC_SXDX.TB_METIER
(
  id     NUMBER(20) not null,
  name   VARCHAR2(200),
  code   VARCHAR2(50),
  parent NUMBER(20),
  typ    VARCHAR2(50),
  lev    VARCHAR2(2),
  is_del VARCHAR2(2)
)
;
comment on column CPIC_SXDX.TB_METIER.typ
  is 'ְҵ���';
comment on column CPIC_SXDX.TB_METIER.is_del
  is '�Ƿ�ɾ����0����1����';
create unique index CPIC_SXDX.UNQ_TB_METIER_CODE on CPIC_SXDX.TB_METIER (CODE);
alter table CPIC_SXDX.TB_METIER
  add constraint PK_TB_METIER primary key (ID);

prompt
prompt Creating table TB_METIER_TEMP
prompt =============================
prompt
create table CPIC_SXDX.TB_METIER_TEMP
(
  name VARCHAR2(200),
  code VARCHAR2(50)
)
;

prompt
prompt Creating table TB_METIER_TYP
prompt ============================
prompt
create table CPIC_SXDX.TB_METIER_TYP
(
  id   NUMBER(10) not null,
  name VARCHAR2(10),
  des  VARCHAR2(100)
)
;
comment on column CPIC_SXDX.TB_METIER_TYP.name
  is 'ְҵ�������';
comment on column CPIC_SXDX.TB_METIER_TYP.des
  is 'ְҵ�������';
alter table CPIC_SXDX.TB_METIER_TYP
  add constraint PK_TB_METIER_TYP primary key (ID);

prompt
prompt Creating table TB_PROJECT_INFO
prompt ==============================
prompt
create table CPIC_SXDX.TB_PROJECT_INFO
(
  prj_id     NUMBER(10) not null,
  grp_id     NUMBER(10),
  prj_name   VARCHAR2(100) not null,
  prj_status VARCHAR2(2) not null,
  sale_cha   VARCHAR2(2),
  ins_src    VARCHAR2(2),
  oc_id      NUMBER(10),
  file_fmt   VARCHAR2(2),
  memo       VARCHAR2(300),
  sign_typ   VARCHAR2(2),
  deli_typ   VARCHAR2(2),
  bank_flag  CHAR(1),
  prj_typ    VARCHAR2(2),
  cus_typ    VARCHAR2(2),
  org_id     NUMBER(10),
  create_dat DATE,
  creator    VARCHAR2(20),
  modify_dat DATE,
  modifier   VARCHAR2(20),
  old_prj_id NUMBER(10)
)
;
comment on column CPIC_SXDX.TB_PROJECT_INFO.prj_id
  is '��ĿID';
comment on column CPIC_SXDX.TB_PROJECT_INFO.grp_id
  is '��ĿȺID';
comment on column CPIC_SXDX.TB_PROJECT_INFO.prj_name
  is '��Ŀ����';
comment on column CPIC_SXDX.TB_PROJECT_INFO.prj_status
  is '�Ƿ���Ч,1-��Ч;2-��Ч';
comment on column CPIC_SXDX.TB_PROJECT_INFO.sale_cha
  is '��������';
comment on column CPIC_SXDX.TB_PROJECT_INFO.ins_src
  is 'Ͷ������Դ';
comment on column CPIC_SXDX.TB_PROJECT_INFO.oc_id
  is '��������˾';
comment on column CPIC_SXDX.TB_PROJECT_INFO.file_fmt
  is '�����ļ���ʽ';
comment on column CPIC_SXDX.TB_PROJECT_INFO.memo
  is '��Ŀ˵��';
comment on column CPIC_SXDX.TB_PROJECT_INFO.sign_typ
  is '������ʽ';
comment on column CPIC_SXDX.TB_PROJECT_INFO.bank_flag
  is '�Ƿ�����ͨ';
comment on column CPIC_SXDX.TB_PROJECT_INFO.prj_typ
  is '��Ŀ���';
comment on column CPIC_SXDX.TB_PROJECT_INFO.cus_typ
  is '�ͻ����';
comment on column CPIC_SXDX.TB_PROJECT_INFO.org_id
  is 'ҵ�����,��Ŀ��������';
comment on column CPIC_SXDX.TB_PROJECT_INFO.create_dat
  is '����ʱ��';
comment on column CPIC_SXDX.TB_PROJECT_INFO.creator
  is '������';
comment on column CPIC_SXDX.TB_PROJECT_INFO.modify_dat
  is '�޸�ʱ��';
comment on column CPIC_SXDX.TB_PROJECT_INFO.modifier
  is '�޸���';
comment on column CPIC_SXDX.TB_PROJECT_INFO.old_prj_id
  is '��ϵͳ��ĿID';
create unique index CPIC_SXDX.UK_OLD_PRJ_ID on CPIC_SXDX.TB_PROJECT_INFO (OLD_PRJ_ID);
alter table CPIC_SXDX.TB_PROJECT_INFO
  add constraint PK_PROJECT_INFO unique (PRJ_ID);

prompt
prompt Creating table TB_OB_COM
prompt ========================
prompt
create table CPIC_SXDX.TB_OB_COM
(
  ob_com_id   NUMBER(10) not null,
  ob_com_name VARCHAR2(1024),
  sta_dat     DATE,
  ob_com_sta  CHAR(1),
  center      NUMBER(10),
  namlst_type VARCHAR2(2),
  recv_type   CHAR(1),
  pay_type    VARCHAR2(8),
  repay_type  VARCHAR2(8),
  company_id  NUMBER(10),
  create_dat  DATE not null,
  creator     VARCHAR2(20) not null,
  modify_dat  DATE,
  modifier    VARCHAR2(20),
  prj_id      NUMBER(10),
  ob_com_code VARCHAR2(20),
  main_pro_id NUMBER(10),
  promotionid NUMBER(19)
)
;
comment on table CPIC_SXDX.TB_OB_COM
  is '�����';
comment on column CPIC_SXDX.TB_OB_COM.ob_com_id
  is '�����';
comment on column CPIC_SXDX.TB_OB_COM.ob_com_sta
  is '3-����;4-ɾ��.�ӱ�ʶ�ֵ���ȡ';
comment on column CPIC_SXDX.TB_OB_COM.center
  is '����֯�ܹ��ж���';
comment on column CPIC_SXDX.TB_OB_COM.namlst_type
  is '���ֵ���ȡ';
comment on column CPIC_SXDX.TB_OB_COM.recv_type
  is '1-���շ�,2-����,�ӱ�ʶ�ֵ���л�ȡ';
comment on column CPIC_SXDX.TB_OB_COM.pay_type
  is 'ת�ˣ��ֽ�֧Ʊ��POS';
comment on column CPIC_SXDX.TB_OB_COM.repay_type
  is 'ת�ˣ��ֽ�֧Ʊ��POS';
comment on column CPIC_SXDX.TB_OB_COM.create_dat
  is '����ʱ��';
comment on column CPIC_SXDX.TB_OB_COM.creator
  is '������';
comment on column CPIC_SXDX.TB_OB_COM.modify_dat
  is '�޸�ʱ��';
comment on column CPIC_SXDX.TB_OB_COM.modifier
  is '�޸���';
comment on column CPIC_SXDX.TB_OB_COM.prj_id
  is '��ĿID';
comment on column CPIC_SXDX.TB_OB_COM.ob_com_code
  is '�����';
comment on column CPIC_SXDX.TB_OB_COM.main_pro_id
  is '����ƷID';
comment on column CPIC_SXDX.TB_OB_COM.promotionid
  is '����ƷID';
alter table CPIC_SXDX.TB_OB_COM
  add constraint PK_OBCOM primary key (OB_COM_ID);
alter table CPIC_SXDX.TB_OB_COM
  add constraint FK_OBCOM_PROJECT_PRJID foreign key (PRJ_ID)
  references CPIC_SXDX.TB_PROJECT_INFO (PRJ_ID);

prompt
prompt Creating table TB_SALES_PROMOTION
prompt =================================
prompt
create table CPIC_SXDX.TB_SALES_PROMOTION
(
  sales_promotion_id NUMBER(19) not null,
  code               VARCHAR2(6),
  name               VARCHAR2(128),
  org                NUMBER(19),
  is_assign          VARCHAR2(6),
  create_by          VARCHAR2(32),
  create_time        DATE,
  update_by          VARCHAR2(32),
  update_time        DATE,
  des                VARCHAR2(64)
)
;
comment on table CPIC_SXDX.TB_SALES_PROMOTION
  is '����Ʒ';
alter table CPIC_SXDX.TB_SALES_PROMOTION
  add constraint PK_PROMOTION_SALE primary key (SALES_PROMOTION_ID);

prompt
prompt Creating table TB_OBCOM_PROMOTION
prompt =================================
prompt
create table CPIC_SXDX.TB_OBCOM_PROMOTION
(
  ob_com_id          NUMBER(10) not null,
  sales_promotion_id NUMBER(19) not null,
  sta_dat            VARCHAR2(20),
  end_dat            VARCHAR2(20)
)
;
comment on column CPIC_SXDX.TB_OBCOM_PROMOTION.ob_com_id
  is '�����';
alter table CPIC_SXDX.TB_OBCOM_PROMOTION
  add constraint PK_OBCOM_PROMOTION primary key (OB_COM_ID, SALES_PROMOTION_ID);
alter table CPIC_SXDX.TB_OBCOM_PROMOTION
  add constraint FK_OBCOM_PROMOTION_OBCOMID foreign key (OB_COM_ID)
  references CPIC_SXDX.TB_OB_COM (OB_COM_ID);
alter table CPIC_SXDX.TB_OBCOM_PROMOTION
  add constraint FK_OBOCM_PROMOTION_PMID foreign key (SALES_PROMOTION_ID)
  references CPIC_SXDX.TB_SALES_PROMOTION (SALES_PROMOTION_ID);

prompt
prompt Creating table TB_PRESENT_PRODUCT
prompt =================================
prompt
create table CPIC_SXDX.TB_PRESENT_PRODUCT
(
  zx_id NUMBER(10) not null
)
;
alter table CPIC_SXDX.TB_PRESENT_PRODUCT
  add constraint PK_ZX primary key (ZX_ID);

prompt
prompt Creating table TB_OB_COM_PRESENT
prompt ================================
prompt
create table CPIC_SXDX.TB_OB_COM_PRESENT
(
  ob_com_id NUMBER(10) not null,
  zx_id     NUMBER(10) not null,
  sta_dat   VARCHAR2(20),
  end_dat   VARCHAR2(20)
)
;
comment on column CPIC_SXDX.TB_OB_COM_PRESENT.ob_com_id
  is '�����';
alter table CPIC_SXDX.TB_OB_COM_PRESENT
  add constraint PK_OBCOM_ZX primary key (OB_COM_ID, ZX_ID);
alter table CPIC_SXDX.TB_OB_COM_PRESENT
  add constraint FK_OBCOM_ZX_OBCOMID foreign key (OB_COM_ID)
  references CPIC_SXDX.TB_OB_COM (OB_COM_ID);
alter table CPIC_SXDX.TB_OB_COM_PRESENT
  add constraint FK_OBCOM_ZX_ZXID foreign key (ZX_ID)
  references CPIC_SXDX.TB_PRESENT_PRODUCT (ZX_ID);

prompt
prompt Creating table TB_PRODUCT
prompt =========================
prompt
create table CPIC_SXDX.TB_PRODUCT
(
  product_id            NUMBER(20) not null,
  product_name          VARCHAR2(50),
  product_introduction  VARCHAR2(1024),
  remark                VARCHAR2(1024),
  is_delete             VARCHAR2(2),
  minage                VARCHAR2(5),
  maxage                VARCHAR2(5),
  feemax                VARCHAR2(1024),
  bene_type             NUMBER(20),
  first_pay_month_total NUMBER(20),
  is_ff                 VARCHAR2(2),
  start_counts          NUMBER(8,2),
  add_counts            NUMBER(8,2),
  creat_person          VARCHAR2(24),
  creat_time            DATE,
  modify_person         VARCHAR2(24),
  modify_time           DATE,
  scale_flag            CHAR(1),
  bulk_sale_counts      NUMBER(8,2),
  product_type          VARCHAR2(5)
)
;
comment on column CPIC_SXDX.TB_PRODUCT.product_id
  is '��ƷID';
comment on column CPIC_SXDX.TB_PRODUCT.product_name
  is '��Ʒ����';
comment on column CPIC_SXDX.TB_PRODUCT.product_introduction
  is '��Ʒ����';
comment on column CPIC_SXDX.TB_PRODUCT.remark
  is '��ע����ϵͳ��עΪ��REMARK';
comment on column CPIC_SXDX.TB_PRODUCT.is_delete
  is 'ɾ����ʶ';
comment on column CPIC_SXDX.TB_PRODUCT.minage
  is '��С��������';
comment on column CPIC_SXDX.TB_PRODUCT.maxage
  is '�����������';
comment on column CPIC_SXDX.TB_PRODUCT.feemax
  is '�б��������';
comment on column CPIC_SXDX.TB_PRODUCT.bene_type
  is '�ֺ췽ʽ';
comment on column CPIC_SXDX.TB_PRODUCT.first_pay_month_total
  is '���ڽɷ�����';
comment on column CPIC_SXDX.TB_PRODUCT.is_ff
  is '���ͱ���ʱ�����ж��Ƿ��գ�1 �ǣ�0 ��';
comment on column CPIC_SXDX.TB_PRODUCT.start_counts
  is '���۷���';
comment on column CPIC_SXDX.TB_PRODUCT.add_counts
  is '�ۼӷ���';
comment on column CPIC_SXDX.TB_PRODUCT.creat_person
  is '������';
comment on column CPIC_SXDX.TB_PRODUCT.creat_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_PRODUCT.modify_person
  is '�޸���';
comment on column CPIC_SXDX.TB_PRODUCT.modify_time
  is '�޸�ʱ��';
comment on column CPIC_SXDX.TB_PRODUCT.scale_flag
  is '����С��λǰ���ñ�־��0-ǰ��;1-����';
comment on column CPIC_SXDX.TB_PRODUCT.bulk_sale_counts
  is '�������۷���';
comment on column CPIC_SXDX.TB_PRODUCT.product_type
  is '���';
alter table CPIC_SXDX.TB_PRODUCT
  add constraint PK_PK_PRODUCT_ID primary key (PRODUCT_ID);

prompt
prompt Creating table TB_OB_COM_PRODUCT
prompt ================================
prompt
create table CPIC_SXDX.TB_OB_COM_PRODUCT
(
  ob_com_id  NUMBER(10) not null,
  product_id NUMBER(20) not null
)
;
comment on column CPIC_SXDX.TB_OB_COM_PRODUCT.ob_com_id
  is '�����';
comment on column CPIC_SXDX.TB_OB_COM_PRODUCT.product_id
  is '��ƷID';
alter table CPIC_SXDX.TB_OB_COM_PRODUCT
  add constraint PK_OBCOM_PROD primary key (OB_COM_ID, PRODUCT_ID);
alter table CPIC_SXDX.TB_OB_COM_PRODUCT
  add constraint FK_OBCOM_PROD_OBCOMID foreign key (OB_COM_ID)
  references CPIC_SXDX.TB_OB_COM (OB_COM_ID);
alter table CPIC_SXDX.TB_OB_COM_PRODUCT
  add constraint FK_OBCOM_PROD_PRODID foreign key (PRODUCT_ID)
  references CPIC_SXDX.TB_PRODUCT (PRODUCT_ID);

prompt
prompt Creating table TB_SKILLS_TALK
prompt =============================
prompt
create table CPIC_SXDX.TB_SKILLS_TALK
(
  talk_id     NUMBER not null,
  code        CHAR(64),
  name        CHAR(64),
  type        NUMBER,
  content     CHAR(1024),
  create_user VARCHAR2(24) not null,
  create_time DATE not null,
  update_user VARCHAR2(24),
  update_time DATE
)
;
alter table CPIC_SXDX.TB_SKILLS_TALK
  add constraint PK_SKILLS_TALK primary key (TALK_ID);

prompt
prompt Creating table TB_OB_COM_SKILLS_TALK
prompt ====================================
prompt
create table CPIC_SXDX.TB_OB_COM_SKILLS_TALK
(
  ob_com_id NUMBER(10) not null,
  talk_id   NUMBER not null,
  sta_dat   VARCHAR2(20),
  end_dat   VARCHAR2(20)
)
;
comment on table CPIC_SXDX.TB_OB_COM_SKILLS_TALK
  is '��뻰������';
comment on column CPIC_SXDX.TB_OB_COM_SKILLS_TALK.ob_com_id
  is '�����';
alter table CPIC_SXDX.TB_OB_COM_SKILLS_TALK
  add constraint PK_OBCOM_SKILLS_TALK primary key (OB_COM_ID, TALK_ID);
alter table CPIC_SXDX.TB_OB_COM_SKILLS_TALK
  add constraint FK_OBCOM_SKILLSTALK_OBCOMID foreign key (OB_COM_ID)
  references CPIC_SXDX.TB_OB_COM (OB_COM_ID);
alter table CPIC_SXDX.TB_OB_COM_SKILLS_TALK
  add constraint FK_OBCOM_SKILLSTALK_TALKID foreign key (TALK_ID)
  references CPIC_SXDX.TB_SKILLS_TALK (TALK_ID);

prompt
prompt Creating table TB_OPERATE_USER
prompt ==============================
prompt
create table CPIC_SXDX.TB_OPERATE_USER
(
  operate_user_id    NUMBER(10) not null,
  company_id         NUMBER(10),
  operate_user_code  NVARCHAR2(30),
  operate_user_name  VARCHAR2(60),
  operate_user_statu VARCHAR2(3),
  remark             VARCHAR2(100),
  is_delete          VARCHAR2(2),
  org_id             NUMBER(10)
)
;
comment on table CPIC_SXDX.TB_OPERATE_USER
  is '�ֹ�˾ҵ��Ա��';
comment on column CPIC_SXDX.TB_OPERATE_USER.operate_user_id
  is 'ҵ��ԱID';
comment on column CPIC_SXDX.TB_OPERATE_USER.company_id
  is 'ҵ�����ID';
comment on column CPIC_SXDX.TB_OPERATE_USER.operate_user_code
  is 'ҵ��Ա����';
comment on column CPIC_SXDX.TB_OPERATE_USER.operate_user_name
  is 'ҵ��Ա����';
comment on column CPIC_SXDX.TB_OPERATE_USER.operate_user_statu
  is 'ҵ��Ա״̬';
comment on column CPIC_SXDX.TB_OPERATE_USER.remark
  is '��ע';
comment on column CPIC_SXDX.TB_OPERATE_USER.is_delete
  is 'ɾ����ʶ';
comment on column CPIC_SXDX.TB_OPERATE_USER.org_id
  is '��������ID';
alter table CPIC_SXDX.TB_OPERATE_USER
  add constraint PK_OPERATE_USER_ID primary key (OPERATE_USER_ID);
alter table CPIC_SXDX.TB_OPERATE_USER
  add constraint FK_COMPANY_OPERATE_USER foreign key (COMPANY_ID)
  references CPIC_SXDX.TB_COMPANY (COMPANY_ID);

prompt
prompt Creating table TB_ORGINFO
prompt =========================
prompt
create table CPIC_SXDX.TB_ORGINFO
(
  id           VARCHAR2(18) not null,
  orgname      VARCHAR2(64),
  levelcode    CHAR(4),
  idsuborg     VARCHAR2(18),
  idbranchorg  VARCHAR2(18),
  firstcreate  DATE,
  lastupdate   DATE,
  recordstatus CHAR(1)
)
;
alter table CPIC_SXDX.TB_ORGINFO
  add primary key (ID);

prompt
prompt Creating table TB_ORG_LINK
prompt ==========================
prompt
create table CPIC_SXDX.TB_ORG_LINK
(
  id           CHAR(18) not null,
  idorg        VARCHAR2(18),
  ctype        CHAR(4),
  val          VARCHAR2(254),
  lastupdate   DATE,
  recordstatus CHAR(1)
)
;
create index CPIC_SXDX.IDX_TB_OLRG_LINK_IDORG_CTYPE on CPIC_SXDX.TB_ORG_LINK (IDORG, CTYPE);
alter table CPIC_SXDX.TB_ORG_LINK
  add primary key (ID);

prompt
prompt Creating table TB_ORG_LINK_OLD
prompt ==============================
prompt
create table CPIC_SXDX.TB_ORG_LINK_OLD
(
  id           CHAR(18) not null,
  idorg        VARCHAR2(18),
  ctype        CHAR(4),
  val          VARCHAR2(254),
  lastupdate   DATE,
  recordstatus CHAR(1)
)
;
alter table CPIC_SXDX.TB_ORG_LINK_OLD
  add primary key (ID);

prompt
prompt Creating table TB_ORG_LINK_TEMP
prompt ===============================
prompt
create table CPIC_SXDX.TB_ORG_LINK_TEMP
(
  id           CHAR(22) not null,
  idorg        VARCHAR2(22),
  ctype        CHAR(4),
  val          VARCHAR2(254),
  lastupdate   DATE,
  recordstatus CHAR(3)
)
;

prompt
prompt Creating table TB_ORG_LINK_TEMP_ULINK
prompt =====================================
prompt
create table CPIC_SXDX.TB_ORG_LINK_TEMP_ULINK
(
  id           CHAR(19) not null,
  idorg        VARCHAR2(22),
  ctype        CHAR(8),
  val          VARCHAR2(254),
  lastupdate   DATE,
  recordstatus CHAR(3)
)
;

prompt
prompt Creating table TB_ORG_LINK_TYPE
prompt ===============================
prompt
create table CPIC_SXDX.TB_ORG_LINK_TYPE
(
  id           VARCHAR2(4) not null,
  name         VARCHAR2(1024),
  recordstatus CHAR(1)
)
;
alter table CPIC_SXDX.TB_ORG_LINK_TYPE
  add primary key (ID);

prompt
prompt Creating table TB_ORG_USER
prompt ==========================
prompt
create table CPIC_SXDX.TB_ORG_USER
(
  org_id    NUMBER(10) not null,
  user_id   NUMBER(10) not null,
  ob_com_id NUMBER(10) not null,
  id        NUMBER(10) not null
)
;
comment on column CPIC_SXDX.TB_ORG_USER.org_id
  is 'ҵ�����';
comment on column CPIC_SXDX.TB_ORG_USER.user_id
  is 'ҵ��Ա';
comment on column CPIC_SXDX.TB_ORG_USER.ob_com_id
  is '�����';
alter table CPIC_SXDX.TB_ORG_USER
  add constraint PK_ORG_USER_ID primary key (ID, ORG_ID, USER_ID, OB_COM_ID);
alter table CPIC_SXDX.TB_ORG_USER
  add constraint UNQ_ORG_USER unique (ORG_ID, USER_ID, OB_COM_ID);
alter table CPIC_SXDX.TB_ORG_USER
  add constraint FK_ORGUSER_OBCOM_OBCOMID foreign key (OB_COM_ID)
  references CPIC_SXDX.TB_OB_COM (OB_COM_ID);

prompt
prompt Creating table TB_PREMIUM
prompt =========================
prompt
create table CPIC_SXDX.TB_PREMIUM
(
  premium_id   NUMBER(20) not null,
  insurance_id NUMBER(20),
  age          VARCHAR2(10),
  sex          VARCHAR2(10),
  term         VARCHAR2(10),
  price        VARCHAR2(10),
  pay_way      VARCHAR2(2),
  is_delete    VARCHAR2(2)
)
;
comment on table CPIC_SXDX.TB_PREMIUM
  is '���ѷ��ʱ�';
comment on column CPIC_SXDX.TB_PREMIUM.premium_id
  is '����ID';
comment on column CPIC_SXDX.TB_PREMIUM.insurance_id
  is '����ID';
comment on column CPIC_SXDX.TB_PREMIUM.age
  is '����';
comment on column CPIC_SXDX.TB_PREMIUM.sex
  is '�Ա�';
comment on column CPIC_SXDX.TB_PREMIUM.term
  is '���ޡ������ڼ�';
comment on column CPIC_SXDX.TB_PREMIUM.price
  is '�۸��ɷѱ�׼';
comment on column CPIC_SXDX.TB_PREMIUM.pay_way
  is '�ɷѷ�ʽ';
comment on column CPIC_SXDX.TB_PREMIUM.is_delete
  is 'ɾ����ʶ��0Ϊ��1Ϊɾ��';
create index CPIC_SXDX.IDX_TB_PREMIUM_INSID on CPIC_SXDX.TB_PREMIUM (INSURANCE_ID);
alter table CPIC_SXDX.TB_PREMIUM
  add constraint PK_PREMIUM_ID primary key (PREMIUM_ID);
alter table CPIC_SXDX.TB_PREMIUM
  add constraint FK_INSURANCE_PREMIUM foreign key (INSURANCE_ID)
  references CPIC_SXDX.TB_INSURANCE (INSURANCE_ID);

prompt
prompt Creating table TB_PRJ_GRP
prompt =========================
prompt
create table CPIC_SXDX.TB_PRJ_GRP
(
  grp_id     NUMBER(10) not null,
  grp_name   VARCHAR2(100),
  grp_desc   VARCHAR2(300),
  is_del     CHAR(2) not null,
  org_id     NUMBER(10),
  create_dat DATE not null,
  creator    VARCHAR2(20) not null,
  modify_dat DATE,
  modifier   VARCHAR2(20)
)
;
comment on column CPIC_SXDX.TB_PRJ_GRP.grp_id
  is '��ĿȺID';
comment on column CPIC_SXDX.TB_PRJ_GRP.grp_name
  is '��ĿȺ����';
comment on column CPIC_SXDX.TB_PRJ_GRP.grp_desc
  is '��ĿȺ����';
comment on column CPIC_SXDX.TB_PRJ_GRP.is_del
  is 'ɾ�����,01-����;02-��ɾ��.Ĭ��ֵΪ01';
comment on column CPIC_SXDX.TB_PRJ_GRP.create_dat
  is '����ʱ��';
comment on column CPIC_SXDX.TB_PRJ_GRP.creator
  is '������';
comment on column CPIC_SXDX.TB_PRJ_GRP.modify_dat
  is '�޸�ʱ��';
comment on column CPIC_SXDX.TB_PRJ_GRP.modifier
  is '�޸���';
alter table CPIC_SXDX.TB_PRJ_GRP
  add constraint PK_PRJGRP primary key (GRP_ID);

prompt
prompt Creating table TB_PRODUCT_INSURANCE
prompt ===================================
prompt
create table CPIC_SXDX.TB_PRODUCT_INSURANCE
(
  product_insurance_id NUMBER(20) not null,
  insurance_id         NUMBER(20),
  product_id           NUMBER(20)
)
;
comment on column CPIC_SXDX.TB_PRODUCT_INSURANCE.product_insurance_id
  is '����ID';
comment on column CPIC_SXDX.TB_PRODUCT_INSURANCE.insurance_id
  is '����ID';
comment on column CPIC_SXDX.TB_PRODUCT_INSURANCE.product_id
  is '��ƷID';
alter table CPIC_SXDX.TB_PRODUCT_INSURANCE
  add constraint PK_PRODUCT_INSURANCE_ID primary key (PRODUCT_INSURANCE_ID);
alter table CPIC_SXDX.TB_PRODUCT_INSURANCE
  add constraint FK_INSURANCE_PRODUCT foreign key (INSURANCE_ID)
  references CPIC_SXDX.TB_INSURANCE (INSURANCE_ID);
alter table CPIC_SXDX.TB_PRODUCT_INSURANCE
  add constraint FK_PRODUCT_INSURANCE foreign key (PRODUCT_ID)
  references CPIC_SXDX.TB_PRODUCT (PRODUCT_ID);

prompt
prompt Creating table TB_PRODUCT_LIMIT_METIER
prompt ======================================
prompt
create table CPIC_SXDX.TB_PRODUCT_LIMIT_METIER
(
  product_limit_metier_id NUMBER(20) not null,
  limit_metiertype_id     NUMBER(10),
  product_id              NUMBER(20),
  flag                    VARCHAR2(2)
)
;
comment on table CPIC_SXDX.TB_PRODUCT_LIMIT_METIER
  is '��Ʒ������ְҵ���͹�����';
comment on column CPIC_SXDX.TB_PRODUCT_LIMIT_METIER.product_limit_metier_id
  is '����ID
';
comment on column CPIC_SXDX.TB_PRODUCT_LIMIT_METIER.limit_metiertype_id
  is '����ְҵ����ID';
comment on column CPIC_SXDX.TB_PRODUCT_LIMIT_METIER.product_id
  is '��ƷID';
comment on column CPIC_SXDX.TB_PRODUCT_LIMIT_METIER.flag
  is '1.Ϊ��Ʒ����  2��Ϊְҵ����';
alter table CPIC_SXDX.TB_PRODUCT_LIMIT_METIER
  add constraint PK_PRODUCT_LIMIT_METIER_ID primary key (PRODUCT_LIMIT_METIER_ID);
alter table CPIC_SXDX.TB_PRODUCT_LIMIT_METIER
  add constraint FK_LIMIT_METIERTYPE foreign key (LIMIT_METIERTYPE_ID)
  references CPIC_SXDX.TB_LIMIT_METIERTYPE (LIMIT_METIERTYPE_ID);
alter table CPIC_SXDX.TB_PRODUCT_LIMIT_METIER
  add constraint FK_PRODUCT_METIER foreign key (PRODUCT_ID)
  references CPIC_SXDX.TB_PRODUCT (PRODUCT_ID);

prompt
prompt Creating table TB_PRODUCT_QUESTION
prompt ==================================
prompt
create table CPIC_SXDX.TB_PRODUCT_QUESTION
(
  product_question_id NUMBER(10) not null,
  parent_question_id  NUMBER(10),
  question_name       VARCHAR2(500),
  question_value      VARCHAR2(2),
  remark              VARCHAR2(100),
  is_delete           VARCHAR2(2),
  question_lev        VARCHAR2(2),
  question_code       VARCHAR2(20),
  creat_person        VARCHAR2(24),
  creat_time          DATE,
  modify_person       VARCHAR2(24),
  modify_time         DATE
)
;
comment on table CPIC_SXDX.TB_PRODUCT_QUESTION
  is '��֪�����������';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.product_question_id
  is '��֪����ID';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.parent_question_id
  is '��֪���ID';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.question_name
  is '��������';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.question_value
  is '����𰸣�����ͨ��������Ĵ𰸣����п�����Y,N�������ϸô���Ըÿͻ�Ӫ���ʧ�ܣ�����Ϊ�ÿͻ���ɱ�����';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.remark
  is '��ע����ϵͳΪ��REMARK';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.is_delete
  is 'ɾ����ʶ';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.question_lev
  is '��֪����ȼ�';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.question_code
  is '��֪�������';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.creat_person
  is '������';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.creat_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.modify_person
  is '�޸���';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.modify_time
  is '�޸�ʱ��';
alter table CPIC_SXDX.TB_PRODUCT_QUESTION
  add constraint PK_PRODUCT_QUESTION_ID primary key (PRODUCT_QUESTION_ID);

prompt
prompt Creating table TB_PRODUCT_QUESTION_REL
prompt ======================================
prompt
create table CPIC_SXDX.TB_PRODUCT_QUESTION_REL
(
  product_question_id NUMBER(10) not null,
  product_id          NUMBER(20) not null
)
;
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION_REL.product_question_id
  is '��֪����ID';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION_REL.product_id
  is '��ƷID';
alter table CPIC_SXDX.TB_PRODUCT_QUESTION_REL
  add constraint FK_PRODUCT_QUESTION_ID primary key (PRODUCT_QUESTION_ID, PRODUCT_ID);
alter table CPIC_SXDX.TB_PRODUCT_QUESTION_REL
  add constraint FK_PRODUCT_QUESTION foreign key (PRODUCT_ID)
  references CPIC_SXDX.TB_PRODUCT (PRODUCT_ID);
alter table CPIC_SXDX.TB_PRODUCT_QUESTION_REL
  add constraint FK_QUESTION_PRODUCT foreign key (PRODUCT_QUESTION_ID)
  references CPIC_SXDX.TB_PRODUCT_QUESTION (PRODUCT_QUESTION_ID);

prompt
prompt Creating table TB_PROMOTION_APPLICATION
prompt =======================================
prompt
create table CPIC_SXDX.TB_PROMOTION_APPLICATION
(
  promotionapp_id NUMBER(20) not null,
  promotion_id    NUMBER(20),
  customer_id     NUMBER(20),
  delivery_date   DATE,
  ob_com_id       NUMBER(10),
  org_id          NUMBER(10)
)
;
comment on table CPIC_SXDX.TB_PROMOTION_APPLICATION
  is '����Ʒ������';
comment on column CPIC_SXDX.TB_PROMOTION_APPLICATION.promotionapp_id
  is '����Ʒ����ID';
comment on column CPIC_SXDX.TB_PROMOTION_APPLICATION.promotion_id
  is '����ƷID';
comment on column CPIC_SXDX.TB_PROMOTION_APPLICATION.customer_id
  is '�ͻ�ID';
comment on column CPIC_SXDX.TB_PROMOTION_APPLICATION.delivery_date
  is '��������';
comment on column CPIC_SXDX.TB_PROMOTION_APPLICATION.ob_com_id
  is '�ID';
comment on column CPIC_SXDX.TB_PROMOTION_APPLICATION.org_id
  is '��������';
create index CPIC_SXDX.IDX_PRO_APPLICATION_OBCOMID on CPIC_SXDX.TB_PROMOTION_APPLICATION (OB_COM_ID);
create index CPIC_SXDX.IDX_PRO_APPLICATION_ORGID on CPIC_SXDX.TB_PROMOTION_APPLICATION (ORG_ID);
alter table CPIC_SXDX.TB_PROMOTION_APPLICATION
  add constraint PK_TB_PROMOTION_APPLICATION primary key (PROMOTIONAPP_ID);

prompt
prompt Creating table TB_PROMOTION_PRODUCT
prompt ===================================
prompt
create table CPIC_SXDX.TB_PROMOTION_PRODUCT
(
  promotion_id NUMBER(20) not null,
  code         VARCHAR2(20),
  name         VARCHAR2(250),
  begin_date   DATE,
  end_date     DATE,
  description  VARCHAR2(1000),
  is_del       VARCHAR2(2) default '0',
  create_date  DATE,
  create_user  VARCHAR2(15),
  update_date  DATE,
  update_user  VARCHAR2(15)
)
;
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.promotion_id
  is '����ƷID ����';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.code
  is '������Ʒ����';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.name
  is '������Ʒ����';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.begin_date
  is '��Ч����';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.end_date
  is '��Чֹ��';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.description
  is '����Ʒ����';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.is_del
  is '�Ƿ�ɾ����0Ϊ��1Ϊ�ǣ�';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.create_date
  is '����ʱ��';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.create_user
  is '������';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.update_date
  is '����ʱ��';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.update_user
  is '������';
alter table CPIC_SXDX.TB_PROMOTION_PRODUCT
  add constraint PK_TB_PROMOTION_PRODUCT primary key (PROMOTION_ID);

prompt
prompt Creating table TB_RECONCILE
prompt ===========================
prompt
create table CPIC_SXDX.TB_RECONCILE
(
  id             NUMBER(20) not null,
  order_id       VARCHAR2(50) not null,
  policy_id      VARCHAR2(18) not null,
  order_amount   NUMBER(20,2) not null,
  company        VARCHAR2(50),
  currency       VARCHAR2(5),
  plug_pay       VARCHAR2(20),
  pay_date       DATE,
  bill_p10_date  DATE default sysdate,
  return_code    VARCHAR2(8),
  policy_date    DATE,
  is_ff          NUMBER(1),
  status         NUMBER(1) default 0,
  error_msg      VARCHAR2(500),
  create_date    DATE default sysdate,
  update_date    DATE default sysdate,
  ffdz           NUMBER(1) default 0,
  zjjs           NUMBER(1) default 0,
  trade_time     DATE,
  p10_desc       VARCHAR2(500),
  payment_status NUMBER(1)
)
;
comment on table CPIC_SXDX.TB_RECONCILE
  is '�����ļ���';
comment on column CPIC_SXDX.TB_RECONCILE.id
  is '����ID';
comment on column CPIC_SXDX.TB_RECONCILE.order_id
  is '������                         �ʽ�ƽ̨֧��ʱ�� ������';
comment on column CPIC_SXDX.TB_RECONCILE.policy_id
  is '������';
comment on column CPIC_SXDX.TB_RECONCILE.order_amount
  is '�������';
comment on column CPIC_SXDX.TB_RECONCILE.company
  is '��������                      �ñ�ҵ�������Ļ���������Ϊ�����������';
comment on column CPIC_SXDX.TB_RECONCILE.currency
  is '����                                �̶��CNY������ϵͳΪ001��';
comment on column CPIC_SXDX.TB_RECONCILE.plug_pay
  is '������                           ֧����ʽ : 2009-��Ǯ��2003-ͨ����2011-B2bi֧������2006-֧������2014-֧������������';
comment on column CPIC_SXDX.TB_RECONCILE.pay_date
  is 'ʵ�ʽɷ�����            ����ϵͳ��FF�����շ���Ϣ�����ڣ���ʽΪyyyyMMdd';
comment on column CPIC_SXDX.TB_RECONCILE.bill_p10_date
  is '�����������            ����ϵͳ��FF������˵����ڣ���ʽΪyyyyMMdd';
comment on column CPIC_SXDX.TB_RECONCILE.return_code
  is 'P10������                    0000000���ɹ�
       0000001������������
      0000002����ƥ����߲�����
      0000004���ظ�¼��';
comment on column CPIC_SXDX.TB_RECONCILE.policy_date
  is 'ǰ��ϵͳ��������   �����ڵ���ϵͳ��Ͷ�����ڣ���ʽΪyyyyMMdd';
comment on column CPIC_SXDX.TB_RECONCILE.is_ff
  is '0������  1������';
comment on column CPIC_SXDX.TB_RECONCILE.status
  is '���ʽ�ƽ̨����״̬                   0����ʼֵ      1��ʧ��     2:  �ɹ� ';
comment on column CPIC_SXDX.TB_RECONCILE.error_msg
  is '���ʽ�ƽ̨����ʧ��ԭ��';
comment on column CPIC_SXDX.TB_RECONCILE.create_date
  is '��������';
comment on column CPIC_SXDX.TB_RECONCILE.update_date
  is '��������';
comment on column CPIC_SXDX.TB_RECONCILE.ffdz
  is '��FF����״̬                        0 ����ʼֵ   1�����ύ����  2:����ʧ��  3�����˳ɹ�   4�����ύ����';
comment on column CPIC_SXDX.TB_RECONCILE.zjjs
  is '���ʽ�ƽ̨����״̬         0�� ��ʼֵ      1������  ';
comment on column CPIC_SXDX.TB_RECONCILE.trade_time
  is '����(����)����';
comment on column CPIC_SXDX.TB_RECONCILE.p10_desc
  is 'P10��������';
comment on column CPIC_SXDX.TB_RECONCILE.payment_status
  is '�ۿ�״̬ 0:�ۿ�ɹ� 1:�ۿ�ʧ�� 2:�ۿ�������';
create unique index CPIC_SXDX.IDX_RECONCILE_POLICY_ID on CPIC_SXDX.TB_RECONCILE (POLICY_ID);
create unique index CPIC_SXDX.INDEX_RECONCILE_ORDER_ID on CPIC_SXDX.TB_RECONCILE (ORDER_ID);
alter table CPIC_SXDX.TB_RECONCILE
  add constraint PK_RECONCILE_ID primary key (ID);

prompt
prompt Creating table TB_RECONCILE_HIS
prompt ===============================
prompt
create table CPIC_SXDX.TB_RECONCILE_HIS
(
  id                NUMBER(20) not null,
  policy_id         VARCHAR2(50),
  order_id          VARCHAR2(50),
  bill_type         NUMBER(1),
  status            NUMBER(1),
  bill_chanel       NUMBER(1),
  is_ff             NUMBER(1),
  bill_head_info    VARCHAR2(4000),
  bill_content_info VARCHAR2(4000),
  bill_num          VARCHAR2(50),
  bill_date         DATE default sysdate,
  setmt_date        DATE default sysdate,
  account_date      DATE default sysdate,
  create_date       DATE default sysdate
)
;
comment on table CPIC_SXDX.TB_RECONCILE_HIS
  is '�����ļ���ʷ��';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.policy_id
  is '������';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.order_id
  is '������';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.bill_type
  is '�˵�����                       0�����ʽ�ƽ̨�Ķ����ļ�    1����P10ƽ̨�Ķ����ļ�
  2�����ʽ�ƽ̨�Ľ����ļ�     3����P10ƽ̨�Ľ����ļ�   ';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.status
  is '����״̬                       0���ɹ� 1: ʧ��    ��������״̬�����ܲ���״̬��';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.bill_chanel
  is '�˵�����                       0������ 1������';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.is_ff
  is '��������                       0������  1������';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.bill_head_info
  is '��ͷ������Ϣ';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.bill_content_info
  is '�м�¼������Ϣ';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.bill_num
  is '�嵥��                            �ʽ�ƽ̨�Ķ��˵���';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.bill_date
  is '�嵥����                        ���˵ķ�������YYMMDD';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.setmt_date
  is '��������                        ��Ӧ���㵥�Ľ�������YYYYMMDD';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.account_date
  is '��������                        �˶Ե�������Ľ���YYMMDD';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.create_date
  is '�������� ';
alter table CPIC_SXDX.TB_RECONCILE_HIS
  add constraint PK_RECONCILE_HIS primary key (ID);

prompt
prompt Creating table TB_SALE_HISTORY
prompt ==============================
prompt
create table CPIC_SXDX.TB_SALE_HISTORY
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
  memo                VARCHAR2(800),
  configuration       VARCHAR2(1024),
  task_id             NUMBER(18),
  task_status         VARCHAR2(32),
  task_type           VARCHAR2(32),
  policy_id           VARCHAR2(30),
  policy_status       VARCHAR2(32),
  create_history_date DATE default SYSDATE,
  ext                 VARCHAR2(2000),
  call_duration       VARCHAR2(10),
  callstart_time      DATE,
  task_status_last    VARCHAR2(32),
  task_type_last      VARCHAR2(32),
  history_date_last   DATE
)
;
comment on table CPIC_SXDX.TB_SALE_HISTORY
  is '������ʷ��';
comment on column CPIC_SXDX.TB_SALE_HISTORY.history_id
  is '������ʷID';
comment on column CPIC_SXDX.TB_SALE_HISTORY.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_SALE_HISTORY.customer_id
  is '�ͻ�Ψһ��ʶ';
comment on column CPIC_SXDX.TB_SALE_HISTORY.obcom_id
  is '�ID';
comment on column CPIC_SXDX.TB_SALE_HISTORY.activity_name
  is '�����';
comment on column CPIC_SXDX.TB_SALE_HISTORY.user_id
  is 'ִ���ߣ���ǰ����Ա��';
comment on column CPIC_SXDX.TB_SALE_HISTORY.user_name
  is 'ִ���ߣ�����Ա���ƣ�';
comment on column CPIC_SXDX.TB_SALE_HISTORY.contact_phone
  is '��ϵ�绰';
comment on column CPIC_SXDX.TB_SALE_HISTORY.first_result
  is 'һ���������';
comment on column CPIC_SXDX.TB_SALE_HISTORY.second_result
  is '�����������';
comment on column CPIC_SXDX.TB_SALE_HISTORY.is_contact
  is '�Ӵ������0��δ�Ӵ���1���ѽӴ���';
comment on column CPIC_SXDX.TB_SALE_HISTORY.is_through
  is '��ͨ�����0��δ��ͨ��1���Ѳ�ͨ��';
comment on column CPIC_SXDX.TB_SALE_HISTORY.callover_time
  is 'ͨ������ʱ��';
comment on column CPIC_SXDX.TB_SALE_HISTORY.appoint_time
  is 'ԤԼ�ط�ʱ��';
comment on column CPIC_SXDX.TB_SALE_HISTORY.memo
  is '��ע';
comment on column CPIC_SXDX.TB_SALE_HISTORY.configuration
  is '���������ֶμ����Իس����֣�KEY/VALUE��ֵ�Ա��棩';
comment on column CPIC_SXDX.TB_SALE_HISTORY.task_id
  is '������';
comment on column CPIC_SXDX.TB_SALE_HISTORY.task_status
  is '��һ����״̬';
comment on column CPIC_SXDX.TB_SALE_HISTORY.task_type
  is '��һ��������';
comment on column CPIC_SXDX.TB_SALE_HISTORY.policy_id
  is 'Ͷ�������';
comment on column CPIC_SXDX.TB_SALE_HISTORY.policy_status
  is 'Ͷ����״̬';
comment on column CPIC_SXDX.TB_SALE_HISTORY.create_history_date
  is '��ʷ����ʱ��';
comment on column CPIC_SXDX.TB_SALE_HISTORY.ext
  is '��չ�ֶ�';
comment on column CPIC_SXDX.TB_SALE_HISTORY.call_duration
  is 'ͨ��ʱ��';
comment on column CPIC_SXDX.TB_SALE_HISTORY.callstart_time
  is 'ͨ����ʼʱ��';
comment on column CPIC_SXDX.TB_SALE_HISTORY.task_status_last
  is '����״̬';
comment on column CPIC_SXDX.TB_SALE_HISTORY.task_type_last
  is '��������';
comment on column CPIC_SXDX.TB_SALE_HISTORY.history_date_last
  is '�ϴ���ʷ����ʱ��';
create index CPIC_SXDX.IDX_TB_SALEHISTORY_CUSTLISTID on CPIC_SXDX.TB_SALE_HISTORY (CUS_LIST_ID);
create index CPIC_SXDX.IDX_TB_SALEHISTORY_CUSTOMERID on CPIC_SXDX.TB_SALE_HISTORY (CUSTOMER_ID);
create index CPIC_SXDX.IDX_TB_SALEHISTORY_TASKID on CPIC_SXDX.TB_SALE_HISTORY (TASK_ID);
alter table CPIC_SXDX.TB_SALE_HISTORY
  add constraint PK_TB_SALE_HISTORY primary key (HISTORY_ID);

prompt
prompt Creating table TB_SALE_HISTORY_FIX
prompt ==================================
prompt
create table CPIC_SXDX.TB_SALE_HISTORY_FIX
(
  history_id              NUMBER(18) not null,
  task_status_last_fix    VARCHAR2(40),
  task_type_last_fix      VARCHAR2(40),
  create_history_date_fix DATE
)
;
alter table CPIC_SXDX.TB_SALE_HISTORY_FIX
  add constraint TB_SALE_HISTORY_FIX_ID primary key (HISTORY_ID);

prompt
prompt Creating table TB_WORKPLACE
prompt ===========================
prompt
create table CPIC_SXDX.TB_WORKPLACE
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
  update_time     DATE
)
;
comment on table CPIC_SXDX.TB_WORKPLACE
  is 'ְ������';
comment on column CPIC_SXDX.TB_WORKPLACE.workplace_id
  is 'ְ��������е�ְ�����';
comment on column CPIC_SXDX.TB_WORKPLACE.org_id
  is '������ˮ��';
comment on column CPIC_SXDX.TB_WORKPLACE.workplace_name
  is 'ְ��������е�ְ������';
comment on column CPIC_SXDX.TB_WORKPLACE.softphone_url
  is 'ְ��������е���绰URL';
comment on column CPIC_SXDX.TB_WORKPLACE.cti_address
  is 'ְ��������е�CTI��ַ';
comment on column CPIC_SXDX.TB_WORKPLACE.cti_port
  is 'ְ��������е�CTI�˿�';
comment on column CPIC_SXDX.TB_WORKPLACE.workplace_type
  is 'ְ��������е�ְ������';
comment on column CPIC_SXDX.TB_WORKPLACE.contact_name
  is 'ְ��������е���ϵ��';
comment on column CPIC_SXDX.TB_WORKPLACE.contact_phone
  is 'ְ��������е���ϵ�˵绰';
comment on column CPIC_SXDX.TB_WORKPLACE.contact_address
  is 'ְ��������е���ϵ��ַ';
comment on column CPIC_SXDX.TB_WORKPLACE.contact_comment
  is 'ְ��������е�ְ����ע';
comment on column CPIC_SXDX.TB_WORKPLACE.ivr_group_num
  is 'ְ��������е�IVR���';
comment on column CPIC_SXDX.TB_WORKPLACE.is_del
  is 'ɾ����־';
comment on column CPIC_SXDX.TB_WORKPLACE.voice_address
  is 'ְ��������е�¼��������ַ';
alter table CPIC_SXDX.TB_WORKPLACE
  add constraint PK_WORKPLACE primary key (WORKPLACE_ID);

prompt
prompt Creating table TB_SKILL_GROUP
prompt =============================
prompt
create table CPIC_SXDX.TB_SKILL_GROUP
(
  skill_group_id   NUMBER(10) not null,
  workplace_id     NUMBER(10) not null,
  skill_group_code VARCHAR2(20) not null,
  skill_group_name VARCHAR2(50) not null,
  create_user      VARCHAR2(24),
  create_time      DATE,
  update_user      VARCHAR2(24),
  update_time      DATE,
  is_del           CHAR(1) default 0 not null
)
;
comment on table CPIC_SXDX.TB_SKILL_GROUP
  is 'ְ�������й����ļ������';
comment on column CPIC_SXDX.TB_SKILL_GROUP.workplace_id
  is 'ְ��������е�ְ�����';
alter table CPIC_SXDX.TB_SKILL_GROUP
  add constraint PK_SKILL_GROUP primary key (SKILL_GROUP_ID);
alter table CPIC_SXDX.TB_SKILL_GROUP
  add constraint FK_WP_WORKPLACE_ID_SKILL_GROUP foreign key (WORKPLACE_ID)
  references CPIC_SXDX.TB_WORKPLACE (WORKPLACE_ID);

prompt
prompt Creating table TB_STANDBY_ORDER
prompt ===============================
prompt
create table CPIC_SXDX.TB_STANDBY_ORDER
(
  standby_id          NUMBER(10) not null,
  tel_center          VARCHAR2(50) not null,
  new_date            DATE not null,
  project             VARCHAR2(50) not null,
  fen_company         VARCHAR2(50) not null,
  appno               CHAR(20) not null,
  policyno            CHAR(20) not null,
  product_connect     VARCHAR2(10) not null,
  product_connect_tel CHAR(12) not null,
  custer              VARCHAR2(10) not null,
  custer_card         CHAR(18) not null,
  custer_tel          CHAR(12) not null,
  project_name        VARCHAR2(100) not null,
  baoquan_pro         CHAR(12) not null,
  baoquan_content     VARCHAR2(40) not null,
  baoquan_comment     VARCHAR2(256),
  create_user         VARCHAR2(24),
  create_time         DATE,
  update_user         VARCHAR2(24),
  update_time         DATE
)
;
comment on table CPIC_SXDX.TB_STANDBY_ORDER
  is '���칤����';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.standby_id
  is '���칤����ʾid';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.tel_center
  is '�绰������������';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.new_date
  is '���칤������������';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.project
  is '���칤��������Ŀ����';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.fen_company
  is '���칤�������ֹ�˾����';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.appno
  is '���칤����Ͷ������';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.policyno
  is '���칤���ı�����';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.product_connect
  is '��������ϵ��';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.product_connect_tel
  is '��������ϵ�˵绰����';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.custer
  is '�����ϵĿͻ�����';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.custer_card
  is '�����Ͽͻ������֤����';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.custer_tel
  is '�����Ͽͻ�����ϵ�绰';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.project_name
  is '���칤���ϵĲ�Ʒ';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.baoquan_pro
  is '���칤���ϵı�ȫ��Ŀ����';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.baoquan_content
  is '���칤���ϵı�ȫ����';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.baoquan_comment
  is '���칤���ϵı�ȫ��ע';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.create_user
  is '������';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.create_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.update_user
  is '�޸���';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.update_time
  is '�޸�ʱ��';
alter table CPIC_SXDX.TB_STANDBY_ORDER
  add constraint PK_STANDBY_ORDER primary key (STANDBY_ID);

prompt
prompt Creating table TB_TASK_BAK
prompt ==========================
prompt
create table CPIC_SXDX.TB_TASK_BAK
(
  task_id          NUMBER(18) not null,
  task_level       NUMBER(5) default 60,
  create_time      DATE default SYSDATE not null,
  change_time      DATE,
  is_important     CHAR(1),
  appoint_time     DATE,
  active_status    CHAR(1) default 0 not null,
  task_memo        VARCHAR2(256),
  callresult_type  NUMBER(3) default 1,
  first_result     NUMBER(1),
  second_result    NUMBER(3),
  user_id          VARCHAR2(24),
  org_id           NUMBER(10) not null,
  status_id        NUMBER(5) not null,
  type_id          NUMBER(5) default 4 not null,
  policy_id        VARCHAR2(30),
  batch_id         NUMBER(19) not null,
  cus_list_id      NUMBER(20) not null,
  ext1             VARCHAR2(2000),
  ext2             VARCHAR2(256),
  ext3             VARCHAR2(256),
  ext4             VARCHAR2(256),
  ob_com_id        NUMBER(10) not null,
  policy_id_cancle VARCHAR2(30)
)
;
comment on table CPIC_SXDX.TB_TASK_BAK
  is '�����';
comment on column CPIC_SXDX.TB_TASK_BAK.task_id
  is '����ID';
comment on column CPIC_SXDX.TB_TASK_BAK.task_level
  is '�Ż���';
comment on column CPIC_SXDX.TB_TASK_BAK.create_time
  is '���񴴽�ʱ��';
comment on column CPIC_SXDX.TB_TASK_BAK.change_time
  is '���ı�ʱ��';
comment on column CPIC_SXDX.TB_TASK_BAK.is_important
  is '�Ƿ��ص����ѣ�ɾ����';
comment on column CPIC_SXDX.TB_TASK_BAK.appoint_time
  is 'ԤԼʱ��';
comment on column CPIC_SXDX.TB_TASK_BAK.active_status
  is '����״̬';
comment on column CPIC_SXDX.TB_TASK_BAK.task_memo
  is '����˵��';
comment on column CPIC_SXDX.TB_TASK_BAK.callresult_type
  is '����С��ģ��(��������=1 �����=2 �������=3 �ں���ѯ=4)';
comment on column CPIC_SXDX.TB_TASK_BAK.first_result
  is '����С��һ�����';
comment on column CPIC_SXDX.TB_TASK_BAK.second_result
  is '����С�ڶ������';
comment on column CPIC_SXDX.TB_TASK_BAK.user_id
  is '������ϯ';
comment on column CPIC_SXDX.TB_TASK_BAK.org_id
  is '��������';
comment on column CPIC_SXDX.TB_TASK_BAK.status_id
  is '״̬���';
comment on column CPIC_SXDX.TB_TASK_BAK.type_id
  is '���ͱ��';
comment on column CPIC_SXDX.TB_TASK_BAK.policy_id
  is 'Ͷ����ID';
comment on column CPIC_SXDX.TB_TASK_BAK.batch_id
  is '����ID';
comment on column CPIC_SXDX.TB_TASK_BAK.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_TASK_BAK.ob_com_id
  is '�ID';
comment on column CPIC_SXDX.TB_TASK_BAK.policy_id_cancle
  is '����Ͷ����Id';
alter table CPIC_SXDX.TB_TASK_BAK
  add constraint PK_TASK_BAK primary key (TASK_ID);

prompt
prompt Creating table TB_TASK_HISTORY
prompt ==============================
prompt
create table CPIC_SXDX.TB_TASK_HISTORY
(
  history_id          NUMBER(18) not null,
  task_id             NUMBER(18),
  task_level          NUMBER(5),
  create_time         DATE,
  change_time         DATE,
  is_important        CHAR(1),
  appoint_time        DATE,
  active_status       CHAR(1),
  task_memo           VARCHAR2(800),
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
  status_id_last      NUMBER(5),
  type_id_last        NUMBER(5)
)
;
comment on table CPIC_SXDX.TB_TASK_HISTORY
  is '������ʷ��';
comment on column CPIC_SXDX.TB_TASK_HISTORY.history_id
  is '������ʷ���';
comment on column CPIC_SXDX.TB_TASK_HISTORY.task_id
  is '����ID';
comment on column CPIC_SXDX.TB_TASK_HISTORY.task_level
  is '���ȼ�';
comment on column CPIC_SXDX.TB_TASK_HISTORY.create_time
  is '���񴴽�ʱ��';
comment on column CPIC_SXDX.TB_TASK_HISTORY.change_time
  is '�������仯ʱ��';
comment on column CPIC_SXDX.TB_TASK_HISTORY.is_important
  is '�Ƿ��ص�����';
comment on column CPIC_SXDX.TB_TASK_HISTORY.appoint_time
  is 'ԤԼʱ��';
comment on column CPIC_SXDX.TB_TASK_HISTORY.active_status
  is '����״̬';
comment on column CPIC_SXDX.TB_TASK_HISTORY.task_memo
  is '����˵��';
comment on column CPIC_SXDX.TB_TASK_HISTORY.callresult_type
  is '��󲦴�С��';
comment on column CPIC_SXDX.TB_TASK_HISTORY.first_result
  is '����һ�����';
comment on column CPIC_SXDX.TB_TASK_HISTORY.second_result
  is '����������';
comment on column CPIC_SXDX.TB_TASK_HISTORY.user_id
  is '������ϯID';
comment on column CPIC_SXDX.TB_TASK_HISTORY.org_id
  is '��������';
comment on column CPIC_SXDX.TB_TASK_HISTORY.status_id
  is '����״̬';
comment on column CPIC_SXDX.TB_TASK_HISTORY.type_id
  is '��������';
comment on column CPIC_SXDX.TB_TASK_HISTORY.policy_id
  is '������';
comment on column CPIC_SXDX.TB_TASK_HISTORY.ob_com_id
  is '����';
comment on column CPIC_SXDX.TB_TASK_HISTORY.batch_id
  is '����ID';
comment on column CPIC_SXDX.TB_TASK_HISTORY.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_TASK_HISTORY.create_history_date
  is '��ʷ��������ʱ��';
comment on column CPIC_SXDX.TB_TASK_HISTORY.ext1
  is '��չ�ֶ�2';
comment on column CPIC_SXDX.TB_TASK_HISTORY.ext2
  is '��չ�ֶ�2';
comment on column CPIC_SXDX.TB_TASK_HISTORY.ext3
  is '��չ�ֶ�3';
comment on column CPIC_SXDX.TB_TASK_HISTORY.ext4
  is '��չ�ֶ�4';
comment on column CPIC_SXDX.TB_TASK_HISTORY.status_id_last
  is '��һ״̬���';
comment on column CPIC_SXDX.TB_TASK_HISTORY.type_id_last
  is '��һ���ͱ��';
create index CPIC_SXDX.IDX_TB_TASK_HISTORY_TASKID on CPIC_SXDX.TB_TASK_HISTORY (TASK_ID);
alter table CPIC_SXDX.TB_TASK_HISTORY
  add constraint PK_TB_TASK_HISTORY primary key (HISTORY_ID);
alter table CPIC_SXDX.TB_TASK_HISTORY
  add constraint FK_TB_TASK__FK_TASKHI_TB_TASK foreign key (TASK_ID)
  references CPIC_SXDX.TB_TASK (TASK_ID);

prompt
prompt Creating table TB_TASK_HISTORY_FIX
prompt ==================================
prompt
create table CPIC_SXDX.TB_TASK_HISTORY_FIX
(
  history_id         NUMBER(18) not null,
  status_id_last_fix NUMBER,
  type_id_last_fix   NUMBER
)
;
alter table CPIC_SXDX.TB_TASK_HISTORY_FIX
  add constraint PK_FIX_HISTORY_ID primary key (HISTORY_ID);

prompt
prompt Creating table TB_TASK_HISTORY_REMOVE
prompt =====================================
prompt
create table CPIC_SXDX.TB_TASK_HISTORY_REMOVE
(
  history_id          NUMBER(18) not null,
  task_id             NUMBER(18),
  task_level          NUMBER(5),
  create_time         DATE,
  change_time         DATE,
  is_important        CHAR(1),
  appoint_time        DATE,
  active_status       CHAR(1),
  task_memo           VARCHAR2(800),
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
  status_id_last      NUMBER(5),
  type_id_last        NUMBER(5)
)
;
comment on table CPIC_SXDX.TB_TASK_HISTORY_REMOVE
  is '������ʷ��';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.history_id
  is '������ʷ���';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.task_id
  is '����ID';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.task_level
  is '���ȼ�';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.create_time
  is '���񴴽�ʱ��';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.change_time
  is '�������仯ʱ��';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.is_important
  is '�Ƿ��ص�����';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.appoint_time
  is 'ԤԼʱ��';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.active_status
  is '����״̬';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.task_memo
  is '����˵��';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.callresult_type
  is '��󲦴�С��';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.first_result
  is '����һ�����';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.second_result
  is '����������';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.user_id
  is '������ϯID';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.org_id
  is '��������';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.status_id
  is '����״̬';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.type_id
  is '��������';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.policy_id
  is '������';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.ob_com_id
  is '����';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.batch_id
  is '����ID';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.create_history_date
  is '��ʷ��������ʱ��';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.ext1
  is '��չ�ֶ�2';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.ext2
  is '��չ�ֶ�2';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.ext3
  is '��չ�ֶ�3';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.ext4
  is '��չ�ֶ�4';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.status_id_last
  is '��һ״̬���';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.type_id_last
  is '��һ���ͱ��';
create index CPIC_SXDX.IDX_TB_TASK_HISTORY_RMV_TASKID on CPIC_SXDX.TB_TASK_HISTORY_REMOVE (TASK_ID);
alter table CPIC_SXDX.TB_TASK_HISTORY_REMOVE
  add constraint PK_TB_TASK_HISTORY_RMV primary key (HISTORY_ID);

prompt
prompt Creating table TB_TASK_REMOVE
prompt =============================
prompt
create table CPIC_SXDX.TB_TASK_REMOVE
(
  task_id          NUMBER(18) not null,
  task_level       NUMBER(5),
  create_time      DATE not null,
  change_time      DATE,
  is_important     CHAR(1),
  appoint_time     DATE,
  active_status    CHAR(1) not null,
  task_memo        VARCHAR2(800),
  callresult_type  NUMBER(3),
  first_result     NUMBER(1),
  second_result    NUMBER(3),
  user_id          VARCHAR2(24),
  org_id           NUMBER(10) not null,
  status_id        NUMBER(5) not null,
  type_id          NUMBER(5) not null,
  policy_id        VARCHAR2(30),
  batch_id         NUMBER(19) not null,
  cus_list_id      NUMBER(20) not null,
  ext1             VARCHAR2(2000),
  ext2             VARCHAR2(256),
  ext3             VARCHAR2(256),
  ext4             VARCHAR2(256),
  ob_com_id        NUMBER(10) not null,
  policy_id_cancle VARCHAR2(30)
)
;
comment on table CPIC_SXDX.TB_TASK_REMOVE
  is '����������λ��ձ��ݱ�';
comment on column CPIC_SXDX.TB_TASK_REMOVE.task_id
  is '����ID';
comment on column CPIC_SXDX.TB_TASK_REMOVE.task_level
  is '�Ż���';
comment on column CPIC_SXDX.TB_TASK_REMOVE.create_time
  is '���񴴽�ʱ��';
comment on column CPIC_SXDX.TB_TASK_REMOVE.change_time
  is '���ı�ʱ��';
comment on column CPIC_SXDX.TB_TASK_REMOVE.is_important
  is '�Ƿ��ص����ѣ�ɾ����';
comment on column CPIC_SXDX.TB_TASK_REMOVE.appoint_time
  is 'ԤԼʱ��';
comment on column CPIC_SXDX.TB_TASK_REMOVE.active_status
  is '����״̬';
comment on column CPIC_SXDX.TB_TASK_REMOVE.task_memo
  is '����˵��';
comment on column CPIC_SXDX.TB_TASK_REMOVE.callresult_type
  is '����С��ģ��(��������=1 �����=2 �������=3 �ں���ѯ=4)';
comment on column CPIC_SXDX.TB_TASK_REMOVE.first_result
  is '����С��һ�����';
comment on column CPIC_SXDX.TB_TASK_REMOVE.second_result
  is '����С�ڶ������';
comment on column CPIC_SXDX.TB_TASK_REMOVE.user_id
  is '������ϯ';
comment on column CPIC_SXDX.TB_TASK_REMOVE.org_id
  is '��������';
comment on column CPIC_SXDX.TB_TASK_REMOVE.status_id
  is '״̬���';
comment on column CPIC_SXDX.TB_TASK_REMOVE.type_id
  is '���ͱ��';
comment on column CPIC_SXDX.TB_TASK_REMOVE.policy_id
  is 'Ͷ����ID';
comment on column CPIC_SXDX.TB_TASK_REMOVE.batch_id
  is '����ID';
comment on column CPIC_SXDX.TB_TASK_REMOVE.cus_list_id
  is '����ID';
comment on column CPIC_SXDX.TB_TASK_REMOVE.ob_com_id
  is '�ID';
comment on column CPIC_SXDX.TB_TASK_REMOVE.policy_id_cancle
  is '����Ͷ����Id';
alter table CPIC_SXDX.TB_TASK_REMOVE
  add constraint PK_TASK_REMOVE primary key (TASK_ID);

prompt
prompt Creating table TB_TASK_STATUS
prompt =============================
prompt
create table CPIC_SXDX.TB_TASK_STATUS
(
  status_id       NUMBER(5) not null,
  task_level      NUMBER(5) not null,
  result_template NUMBER(3) not null,
  task_type       NUMBER(5) not null,
  status_name     VARCHAR2(32) not null,
  descript        VARCHAR2(256),
  status          CHAR(1) default 0 not null
)
;
comment on table CPIC_SXDX.TB_TASK_STATUS
  is '???????';
comment on column CPIC_SXDX.TB_TASK_STATUS.status_id
  is '״̬ID�������ó������ȼ�һ�£�';
comment on column CPIC_SXDX.TB_TASK_STATUS.task_level
  is '�������ȼ�';
comment on column CPIC_SXDX.TB_TASK_STATUS.result_template
  is '����С��ģ��';
comment on column CPIC_SXDX.TB_TASK_STATUS.task_type
  is '��������';
comment on column CPIC_SXDX.TB_TASK_STATUS.status_name
  is '״̬����';
comment on column CPIC_SXDX.TB_TASK_STATUS.descript
  is '����';
comment on column CPIC_SXDX.TB_TASK_STATUS.status
  is '״̬��0����Ч��������ʧЧ��';
alter table CPIC_SXDX.TB_TASK_STATUS
  add constraint PK_TB_TASK_STATUS primary key (STATUS_ID);

prompt
prompt Creating table TB_TASK_TYPE
prompt ===========================
prompt
create table CPIC_SXDX.TB_TASK_TYPE
(
  type_id   NUMBER(5) not null,
  type_name VARCHAR2(32) not null,
  descript  VARCHAR2(256),
  status    CHAR(1) default 0
)
;
comment on table CPIC_SXDX.TB_TASK_TYPE
  is '???????';
comment on column CPIC_SXDX.TB_TASK_TYPE.type_id
  is '���ͱ��';
comment on column CPIC_SXDX.TB_TASK_TYPE.type_name
  is '��������';
comment on column CPIC_SXDX.TB_TASK_TYPE.descript
  is '����';
comment on column CPIC_SXDX.TB_TASK_TYPE.status
  is '״̬��0����Ч��������ʧЧ��';
alter table CPIC_SXDX.TB_TASK_TYPE
  add constraint PK_TB_TASK_TYPE primary key (TYPE_ID);

prompt
prompt Creating table TB_TEMP_APP_LIST
prompt ===============================
prompt
create table CPIC_SXDX.TB_TEMP_APP_LIST
(
  appno VARCHAR2(32)
)
;

prompt
prompt Creating table TB_TEMP_CUSTOMER_LIST_REMOVE
prompt ===========================================
prompt
create table CPIC_SXDX.TB_TEMP_CUSTOMER_LIST_REMOVE
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
  is_blacklist         VARCHAR2(2),
  fax                  VARCHAR2(20),
  res                  VARCHAR2(300),
  marital_id           VARCHAR2(50),
  assign_date          DATE,
  is_introduction      VARCHAR2(2),
  introduction_id      VARCHAR2(18),
  remove_status        VARCHAR2(2) default '0',
  remove_time          DATE
)
;

prompt
prompt Creating table TB_TEMP_CUS_BAS
prompt ==============================
prompt
create table CPIC_SXDX.TB_TEMP_CUS_BAS
(
  cus_id              NUMBER(19) not null,
  cus_name            VARCHAR2(64),
  batch_code          VARCHAR2(128),
  batch_name          VARCHAR2(128),
  center_id           NUMBER(19),
  task_id             NUMBER(19),
  status              NUMBER(19),
  issue               VARCHAR2(6),
  certificate_type    VARCHAR2(50),
  id_num              VARCHAR2(64),
  sex                 VARCHAR2(6),
  birthday            DATE,
  age                 NUMBER(19),
  occupation          VARCHAR2(32),
  phone_no1           VARCHAR2(32),
  phone_no2           VARCHAR2(32),
  phone_no3           VARCHAR2(32),
  home_tel            VARCHAR2(32),
  create_time         DATE,
  create_by           VARCHAR2(25),
  update_by           VARCHAR2(25),
  office_tel          VARCHAR2(32),
  commonly_tel        VARCHAR2(32),
  address             VARCHAR2(800),
  postalcode          VARCHAR2(16),
  car_models          VARCHAR2(128),
  car_price           VARCHAR2(128),
  c_purpose           VARCHAR2(64),
  house               VARCHAR2(128),
  house_price         VARCHAR2(128),
  house_area          VARCHAR2(128),
  h_purpose           VARCHAR2(64),
  t_type              VARCHAR2(16),
  interest            VARCHAR2(128),
  droit               VARCHAR2(64),
  other_asset         VARCHAR2(256),
  province            VARCHAR2(32),
  city                VARCHAR2(32),
  area                VARCHAR2(64),
  province2           VARCHAR2(32),
  city2               VARCHAR2(32),
  area2               VARCHAR2(64),
  address2            VARCHAR2(800),
  postalcode2         VARCHAR2(16),
  is_sms              VARCHAR2(6),
  is_children         VARCHAR2(6),
  is_property         VARCHAR2(6),
  transportation      VARCHAR2(32),
  vip                 VARCHAR2(6),
  account             VARCHAR2(64),
  account_name        VARCHAR2(64),
  bank                VARCHAR2(64),
  marital             VARCHAR2(6),
  education           VARCHAR2(32),
  income              VARCHAR2(32),
  job_level           VARCHAR2(32),
  company             VARCHAR2(800),
  emergency_call      VARCHAR2(32),
  contact_person      VARCHAR2(64),
  email               VARCHAR2(64),
  addr_type           VARCHAR2(32),
  remark1             VARCHAR2(3000),
  remark2             VARCHAR2(3000),
  remark3             VARCHAR2(512),
  remark4             VARCHAR2(512),
  buyedproduct        VARCHAR2(512),
  user_id             VARCHAR2(24),
  contect_tel         VARCHAR2(20),
  emer_con_relation   VARCHAR2(3),
  org_id              NUMBER(10),
  fax                 VARCHAR2(20),
  introducer          VARCHAR2(60),
  intro_time          DATE,
  introducer_relation VARCHAR2(128),
  own_car             VARCHAR2(6),
  customer_single     VARCHAR2(25),
  obcom_id            VARCHAR2(25),
  row_num             VARCHAR2(6)
)
;
comment on table CPIC_SXDX.TB_TEMP_CUS_BAS
  is '�ͻ���ʱ��';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.cus_id
  is '�ͻ�ID';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.cus_name
  is '�ͻ�����';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.batch_code
  is '���α��';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.batch_name
  is '��������';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.center_id
  is '��������ID';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.task_id
  is '����ID';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.status
  is '�������ɱ�־  1��ʾ�����ɣ�0��ʾδ����';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.issue
  is '�·���ʶ';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.certificate_type
  is '֤������';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.id_num
  is '֤������';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.sex
  is '�Ա�';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.birthday
  is '��������';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.age
  is '����';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.occupation
  is 'ְҵ';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.phone_no1
  is '�ƶ��绰1';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.phone_no2
  is '�ƶ��绰2';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.phone_no3
  is '�ƶ��绰3';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.home_tel
  is '��ͥ�绰';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.create_time
  is '����ʱ��';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.create_by
  is '������';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.update_by
  is '�޸���';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.office_tel
  is '��λ�绰';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.commonly_tel
  is '���õ绰��־';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.address
  is '�̶���ַ(��ϵ��ַ)';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.postalcode
  is '�ʱ�(��ϵ��ַ)';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.car_models
  is '��������';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.car_price
  is '����';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.c_purpose
  is 'ʹ������';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.house
  is '���ݹ���ʱ��';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.house_price
  is '���ݹ��ü�';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.house_area
  is '���ݽ������';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.h_purpose
  is '������;';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.t_type
  is '��������';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.interest
  is '��Ȥ����';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.droit
  is 'סլ����Ȩ״��';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.other_asset
  is '������˾�����ʲ�';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.province
  is 'ʡ(��ϵ��ַ)';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.city
  is '��(��ϵ��ַ)';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.area
  is '����(��ϵ��ַ)';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.province2
  is '����ʡ';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.city2
  is '������';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.area2
  is '��������';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.address2
  is '���͵�ַ��ַ';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.postalcode2
  is '���͵�ַ�ʱ�';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.is_sms
  is '�Ƿ���Ž�ֹ';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.is_children
  is '�Ƿ��к���';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.is_property
  is '�Ƿ��з�';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.transportation
  is '���з�ʽ';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.vip
  is '�Ƿ�����VIP';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.account
  is '�˺�';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.account_name
  is '�˻�����';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.bank
  is '����';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.marital
  is '����״��';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.education
  is '����ˮƽ';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.income
  is '������';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.job_level
  is 'ְҵ�ȼ�';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.company
  is '������λ';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.emergency_call
  is '���������˵绰';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.contact_person
  is '��������������';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.email
  is '�����ʼ�';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.addr_type
  is '��ַ����';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.remark1
  is '��ע1';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.remark2
  is '��ע2';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.remark3
  is '��ע3';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.remark4
  is '��ע4';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.buyedproduct
  is '�ѹ���Ʒ';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.user_id
  is '��ϯ';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.contect_tel
  is '��ϵ�绰';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.emer_con_relation
  is '������������ͻ���ϵ';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.org_id
  is '������ˮ��';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.fax
  is '����';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.introducer
  is '������';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.intro_time
  is 'ת����ʱ��';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.introducer_relation
  is '������˹�ϵ';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.own_car
  is '�Ƿ��г�';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.customer_single
  is '�ͻ�Ψһ��ʶ';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.row_num
  is '������excel���������';
alter table CPIC_SXDX.TB_TEMP_CUS_BAS
  add constraint PK_TEMP_CUS_BAS primary key (CUS_ID);

prompt
prompt Creating table TB_TEMP_CUS_BAS_FAILURE
prompt ======================================
prompt
create table CPIC_SXDX.TB_TEMP_CUS_BAS_FAILURE
(
  log_id              NUMBER(19) not null,
  failure_info        VARCHAR2(128),
  cus_id              VARCHAR2(64),
  cus_name            VARCHAR2(64),
  batch_code          VARCHAR2(128),
  batch_name          VARCHAR2(128),
  center_id           NUMBER(19),
  task_id             NUMBER(19),
  status              NUMBER(19),
  issue               VARCHAR2(6),
  certificate_type    VARCHAR2(50),
  id_num              VARCHAR2(64),
  sex                 VARCHAR2(6),
  birthday            VARCHAR2(20),
  age                 VARCHAR2(19),
  occupation          VARCHAR2(32),
  phone_no1           VARCHAR2(32),
  phone_no2           VARCHAR2(32),
  phone_no3           VARCHAR2(32),
  home_tel            VARCHAR2(32),
  create_time         DATE,
  create_by           VARCHAR2(25),
  update_by           VARCHAR2(25),
  office_tel          VARCHAR2(32),
  commonly_tel        VARCHAR2(32),
  address             VARCHAR2(800),
  postalcode          VARCHAR2(16),
  car_models          VARCHAR2(128),
  car_price           VARCHAR2(128),
  c_purpose           VARCHAR2(64),
  house_time          VARCHAR2(128),
  house_price         VARCHAR2(128),
  house_area          VARCHAR2(128),
  h_purpose           VARCHAR2(64),
  t_type              VARCHAR2(16),
  interest            VARCHAR2(128),
  droit               VARCHAR2(64),
  other_asset         VARCHAR2(256),
  province            VARCHAR2(32),
  city                VARCHAR2(32),
  area                VARCHAR2(64),
  province2           VARCHAR2(32),
  city2               VARCHAR2(32),
  area2               VARCHAR2(64),
  address2            VARCHAR2(800),
  postalcode2         VARCHAR2(16),
  is_sms              VARCHAR2(6),
  is_children         VARCHAR2(6),
  is_property         VARCHAR2(6),
  transportation      VARCHAR2(32),
  vip                 VARCHAR2(6),
  account             VARCHAR2(64),
  account_name        VARCHAR2(64),
  bank                VARCHAR2(64),
  marital             VARCHAR2(6),
  education           VARCHAR2(32),
  income              VARCHAR2(32),
  job_level           VARCHAR2(32),
  company             VARCHAR2(800),
  emergency_call      VARCHAR2(32),
  contact_person      VARCHAR2(64),
  email               VARCHAR2(64),
  addr_type           VARCHAR2(32),
  remark1             VARCHAR2(3000),
  remark2             VARCHAR2(3000),
  remark3             VARCHAR2(512),
  remark4             VARCHAR2(512),
  buyedproduct        VARCHAR2(512),
  user_id             VARCHAR2(24),
  contect_tel         VARCHAR2(20),
  emer_con_relation   VARCHAR2(64),
  org_id              NUMBER(10),
  fax                 VARCHAR2(20),
  introducer          VARCHAR2(60),
  intro_time          VARCHAR2(20),
  introducer_relation VARCHAR2(128),
  own_car             VARCHAR2(6),
  customer_single     VARCHAR2(25),
  row_num             VARCHAR2(6)
)
;
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS_FAILURE.row_num
  is '������excel���������';
alter table CPIC_SXDX.TB_TEMP_CUS_BAS_FAILURE
  add constraint PK_SALES_LOG primary key (LOG_ID);

prompt
prompt Creating table TB_TMP_TISHU
prompt ===========================
prompt
create table CPIC_SXDX.TB_TMP_TISHU
(
  dis_team    VARCHAR2(100),
  app_no      VARCHAR2(20) not null,
  risk_name   VARCHAR2(300),
  sell_org    VARCHAR2(300),
  acus_name   VARCHAR2(300),
  begin_date  VARCHAR2(30),
  fee         VARCHAR2(30),
  next_date   VARCHAR2(30),
  user_id     VARCHAR2(300),
  user_name   VARCHAR2(300),
  leader_name VARCHAR2(300),
  pm_name     VARCHAR2(300)
)
;
comment on column CPIC_SXDX.TB_TMP_TISHU.dis_team
  is '������';
comment on column CPIC_SXDX.TB_TMP_TISHU.app_no
  is '������';
comment on column CPIC_SXDX.TB_TMP_TISHU.risk_name
  is '��������';
comment on column CPIC_SXDX.TB_TMP_TISHU.sell_org
  is '���ۻ���';
comment on column CPIC_SXDX.TB_TMP_TISHU.acus_name
  is 'Ͷ��������';
comment on column CPIC_SXDX.TB_TMP_TISHU.begin_date
  is '��������';
comment on column CPIC_SXDX.TB_TMP_TISHU.fee
  is '���ڽɷ�';
comment on column CPIC_SXDX.TB_TMP_TISHU.next_date
  is '�����´νɷ���';
comment on column CPIC_SXDX.TB_TMP_TISHU.user_id
  is '������ϯ����';
comment on column CPIC_SXDX.TB_TMP_TISHU.user_name
  is '������ϯ����';
comment on column CPIC_SXDX.TB_TMP_TISHU.leader_name
  is '��������';
comment on column CPIC_SXDX.TB_TMP_TISHU.pm_name
  is '������Ŀ����';
alter table CPIC_SXDX.TB_TMP_TISHU
  add constraint PK_TMP_TISHU primary key (APP_NO);

prompt
prompt Creating table TB_TMP_TISHU2
prompt ============================
prompt
create table CPIC_SXDX.TB_TMP_TISHU2
(
  app_no      VARCHAR2(20) not null,
  user_id     VARCHAR2(300),
  user_name   VARCHAR2(300),
  leader_name VARCHAR2(300),
  pm_name     VARCHAR2(300)
)
;
alter table CPIC_SXDX.TB_TMP_TISHU2
  add constraint PK_TMP_TISHU2 primary key (APP_NO);

prompt
prompt Creating table TB_WORKAROUND_SEAT
prompt =================================
prompt
create table CPIC_SXDX.TB_WORKAROUND_SEAT
(
  seat_id      NUMBER(10) not null,
  workplace_id NUMBER(10) not null,
  seat_ip      VARCHAR2(15) not null,
  seat_tel_num VARCHAR2(8) not null,
  create_user  VARCHAR2(24),
  create_time  DATE,
  update_user  VARCHAR2(24),
  update_time  DATE,
  is_del       CHAR(1) default 0 not null
)
;
comment on table CPIC_SXDX.TB_WORKAROUND_SEAT
  is 'ְ��������صĹ�λ��';
comment on column CPIC_SXDX.TB_WORKAROUND_SEAT.seat_id
  is '��λ���е�������λ���';
comment on column CPIC_SXDX.TB_WORKAROUND_SEAT.workplace_id
  is 'ְ��������е�ְ�����';
comment on column CPIC_SXDX.TB_WORKAROUND_SEAT.seat_ip
  is '��λ���еĹ�λIP';
comment on column CPIC_SXDX.TB_WORKAROUND_SEAT.seat_tel_num
  is '��λ���еĹ�λ�ֻ���';
alter table CPIC_SXDX.TB_WORKAROUND_SEAT
  add constraint PK_WORKPLACE_SEAT primary key (SEAT_ID);
alter table CPIC_SXDX.TB_WORKAROUND_SEAT
  add constraint FK_WP_WORKPLACE_ID_SEAT foreign key (WORKPLACE_ID)
  references CPIC_SXDX.TB_WORKPLACE (WORKPLACE_ID);

prompt
prompt Creating table TB_ZZ
prompt ====================
prompt
create table CPIC_SXDX.TB_ZZ
(
  task_id          NUMBER(18) not null,
  task_level       NUMBER(5),
  create_time      DATE not null,
  change_time      DATE,
  is_important     CHAR(1),
  appoint_time     DATE,
  active_status    CHAR(1) not null,
  task_memo        VARCHAR2(256),
  callresult_type  NUMBER(3),
  first_result     NUMBER(1),
  second_result    NUMBER(3),
  user_id          VARCHAR2(24),
  org_id           NUMBER(10) not null,
  status_id        NUMBER(5) not null,
  type_id          NUMBER(5) not null,
  policy_id        VARCHAR2(30),
  batch_id         NUMBER(19) not null,
  cus_list_id      NUMBER(20) not null,
  ext1             VARCHAR2(2000),
  ext2             VARCHAR2(256),
  ext3             VARCHAR2(256),
  ext4             VARCHAR2(256),
  ob_com_id        NUMBER(10) not null,
  policy_id_cancle VARCHAR2(30)
)
;

prompt
prompt Creating table TEMPUSER
prompt =======================
prompt
create table CPIC_SXDX.TEMPUSER
(
  id              VARCHAR2(100),
  name            VARCHAR2(100),
  org_id          VARCHAR2(100),
  role_id         VARCHAR2(100),
  angent_id       VARCHAR2(100),
  workplace_id    VARCHAR2(100),
  workplace_name  VARCHAR2(100),
  workplace_level VARCHAR2(100),
  team_leader     VARCHAR2(100),
  team_name       VARCHAR2(100),
  project_leader  VARCHAR2(100)
)
;
comment on column CPIC_SXDX.TEMPUSER.id
  is '�û�id';
comment on column CPIC_SXDX.TEMPUSER.name
  is '�û�����';
comment on column CPIC_SXDX.TEMPUSER.org_id
  is '��֯����id';
comment on column CPIC_SXDX.TEMPUSER.role_id
  is '��ɫid';
comment on column CPIC_SXDX.TEMPUSER.angent_id
  is '��ϯid';
comment on column CPIC_SXDX.TEMPUSER.workplace_id
  is 'ְ��id';
comment on column CPIC_SXDX.TEMPUSER.workplace_name
  is 'ְ������';
comment on column CPIC_SXDX.TEMPUSER.workplace_level
  is 'ְ��';
comment on column CPIC_SXDX.TEMPUSER.team_leader
  is '�Ŷ�����';
comment on column CPIC_SXDX.TEMPUSER.team_name
  is '�Ŷӳ�����';
comment on column CPIC_SXDX.TEMPUSER.project_leader
  is '��Ŀ����';

prompt
prompt Creating table TEMPUSERAID
prompt ==========================
prompt
create table CPIC_SXDX.TEMPUSERAID
(
  user_id  VARCHAR2(20),
  agent_id VARCHAR2(20)
)
;
comment on column CPIC_SXDX.TEMPUSERAID.user_id
  is '�û�id';
comment on column CPIC_SXDX.TEMPUSERAID.agent_id
  is '��ϯid';

prompt
prompt Creating table TEMP_AID
prompt =======================
prompt
create table CPIC_SXDX.TEMP_AID
(
  user_id VARCHAR2(1000),
  aid     VARCHAR2(1000)
)
;

prompt
prompt Creating table TEMP_AID2
prompt ========================
prompt
create table CPIC_SXDX.TEMP_AID2
(
  id  NVARCHAR2(100),
  aid NVARCHAR2(100)
)
;

prompt
prompt Creating table TEMP_APP_NEW
prompt ===========================
prompt
create table CPIC_SXDX.TEMP_APP_NEW
(
  appno      VARCHAR2(50),
  app_status NUMBER,
  rsc1       VARCHAR2(100),
  rsc2       VARCHAR2(100),
  rsc3       VARCHAR2(100),
  rsc4       VARCHAR2(100)
)
;

prompt
prompt Creating table TEMP_APP_OLD
prompt ===========================
prompt
create table CPIC_SXDX.TEMP_APP_OLD
(
  appno      VARCHAR2(50),
  app_status VARCHAR2(2),
  rsc1       VARCHAR2(50),
  rsc2       VARCHAR2(50),
  rsc3       VARCHAR2(100),
  rsc4       VARCHAR2(100)
)
;

prompt
prompt Creating table TEMP_COMPANY_BANK
prompt ================================
prompt
create table CPIC_SXDX.TEMP_COMPANY_BANK
(
  bank_id    NUMBER(19),
  company_id NUMBER(19),
  bankid     NUMBER(19),
  companyid  NUMBER(19)
)
;

prompt
prompt Creating table TEMP_IPTEL
prompt =========================
prompt
create table CPIC_SXDX.TEMP_IPTEL
(
  ip        VARCHAR2(100),
  telnumber VARCHAR2(100),
  id        NUMBER(10)
)
;

prompt
prompt Creating table TEMP_METIER
prompt ==========================
prompt
create table CPIC_SXDX.TEMP_METIER
(
  id     NUMBER(10),
  name   NVARCHAR2(200),
  code   NVARCHAR2(200),
  parent NUMBER(10),
  typ    NVARCHAR2(200),
  lev    NVARCHAR2(200),
  is_del NVARCHAR2(2)
)
;

prompt
prompt Creating table TEMP_ORGANIZAITON
prompt ================================
prompt
create table CPIC_SXDX.TEMP_ORGANIZAITON
(
  org_id   NUMBER,
  org_name VARCHAR2(50)
)
;

prompt
prompt Creating table TEMP_TERM_CODE
prompt =============================
prompt
create table CPIC_SXDX.TEMP_TERM_CODE
(
  term_code    NVARCHAR2(100),
  ff_term_code NVARCHAR2(100)
)
;

prompt
prompt Creating table TEMP_TERM_CODE2
prompt ==============================
prompt
create table CPIC_SXDX.TEMP_TERM_CODE2
(
  term_code    NVARCHAR2(100),
  ff_term_code NVARCHAR2(100)
)
;

prompt
prompt Creating table TEMP_USER
prompt ========================
prompt
create table CPIC_SXDX.TEMP_USER
(
  userid            VARCHAR2(24),
  loginid           VARCHAR2(16),
  employeename      VARCHAR2(32),
  password          VARCHAR2(50),
  isdel             NUMBER(1) default 0,
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
  max_lists         NUMBER(4) default 0,
  agentid           VARCHAR2(20),
  skill_id          NUMBER(10),
  create_user       VARCHAR2(24),
  create_time       DATE,
  roleid            NUMBER(10)
)
;

prompt
prompt Creating table TEMP_USER_AID
prompt ============================
prompt
create table CPIC_SXDX.TEMP_USER_AID
(
  user_id VARCHAR2(100),
  aid     VARCHAR2(100)
)
;

prompt
prompt Creating table TEMP_ZUZHI
prompt =========================
prompt
create table CPIC_SXDX.TEMP_ZUZHI
(
  id                VARCHAR2(100),
  name              VARCHAR2(100),
  org_id            VARCHAR2(100),
  team_id           VARCHAR2(100),
  team_name         VARCHAR2(100),
  team_learder_name VARCHAR2(100)
)
;
comment on column CPIC_SXDX.TEMP_ZUZHI.id
  is '�û�id';
comment on column CPIC_SXDX.TEMP_ZUZHI.name
  is '�û�����';
comment on column CPIC_SXDX.TEMP_ZUZHI.org_id
  is '����id';
comment on column CPIC_SXDX.TEMP_ZUZHI.team_id
  is '�Ŷӻ���iid';
comment on column CPIC_SXDX.TEMP_ZUZHI.team_name
  is '�Ŷ�����';
comment on column CPIC_SXDX.TEMP_ZUZHI.team_learder_name
  is '�Ŷӳ�����';

prompt
prompt Creating table TEST
prompt ===================
prompt
create table CPIC_SXDX.TEST
(
  name VARCHAR2(100)
)
;

prompt
prompt Creating table TEST1
prompt ====================
prompt
create table CPIC_SXDX.TEST1
(
  id VARCHAR2(20)
)
;

prompt
prompt Creating table TEST_IVR2
prompt ========================
prompt
create table CPIC_SXDX.TEST_IVR2
(
  agent VARCHAR2(20)
)
;

prompt
prompt Creating table TEST_WGH
prompt =======================
prompt
create table CPIC_SXDX.TEST_WGH
(
  test_name VARCHAR2(100),
  test_sex  VARCHAR2(100)
)
;

prompt
prompt Creating table TEST_WGH1
prompt ========================
prompt
create table CPIC_SXDX.TEST_WGH1
(
  test_name1 VARCHAR2(100),
  test_sex1  VARCHAR2(100)
)
;

prompt
prompt Creating table TMP_BANK_RULE
prompt ============================
prompt
create table CPIC_SXDX.TMP_BANK_RULE
(
  id               NVARCHAR2(50),
  account_type     NVARCHAR2(50),
  start_characters NVARCHAR2(50),
  num              NVARCHAR2(50),
  bank_id          NVARCHAR2(50)
)
;

prompt
prompt Creating table TMP_FUYP
prompt =======================
prompt
create table CPIC_SXDX.TMP_FUYP
(
  id     NUMBER(10),
  name   NVARCHAR2(10),
  deptno CHAR(1),
  age    NUMBER(3),
  sale   NUMBER(10,2)
)
;

prompt
prompt Creating table T_BILLING_INFO_BAK
prompt =================================
prompt
create table CPIC_SXDX.T_BILLING_INFO_BAK
(
  app_no                  VARCHAR2(36) not null,
  policyno                VARCHAR2(40),
  polist                  CHAR(2),
  payment_type            VARCHAR2(60),
  app_nm                  VARCHAR2(60),
  contact_tel             VARCHAR2(60),
  app_mobile              VARCHAR2(60),
  insurance_name          VARCHAR2(200),
  rig_sta_des             VARCHAR2(128),
  tsrid                   VARCHAR2(20),
  payment_account_name    VARCHAR2(60),
  payment_accout_bankcode VARCHAR2(60),
  payment_account         VARCHAR2(60),
  id_no                   VARCHAR2(100),
  prj_id                  NUMBER(10),
  opdate                  DATE,
  submit_date             DATE,
  coverage                VARCHAR2(40),
  years                   NUMBER(20),
  cover1                  DATE,
  cover2                  DATE,
  amount                  NUMBER(20,4),
  nextdate                DATE,
  rectele                 VARCHAR2(60),
  sprerec_years           NUMBER(20),
  pay_sum                 NUMBER(20),
  insurance_code          VARCHAR2(100),
  company_id              NUMBER(10),
  owed                    NUMBER,
  owed_amount             NUMBER(20,4),
  appdate                 DATE,
  charge_status           CHAR(4),
  reason                  VARCHAR2(400),
  owed_status             CHAR(4)
)
;

prompt
prompt Creating table V_USER_ALL_FUNCTIONS
prompt ===================================
prompt
create table CPIC_SXDX.V_USER_ALL_FUNCTIONS
(
  id                NUMBER(10) not null,
  tenementid        NUMBER(19),
  userid            VARCHAR2(28),
  categoryid        NUMBER(19),
  active_categoryid VARCHAR2(56),
  readwrite         NUMBER(19),
  isauthority       NUMBER(19)
)
;

prompt
prompt Creating table ZX
prompt =================
prompt
create table CPIC_SXDX.ZX
(
  name VARCHAR2(32),
  id   VARCHAR2(32),
  a    VARCHAR2(32),
  b    VARCHAR2(32),
  c    VARCHAR2(32)
)
;

prompt
prompt Creating table ZX_01
prompt ====================
prompt
create table CPIC_SXDX.ZX_01
(
  name VARCHAR2(32),
  id   VARCHAR2(32),
  c    VARCHAR2(32),
  a    VARCHAR2(32),
  b    VARCHAR2(32)
)
;

prompt
prompt Creating sequence SEQ_APPNO
prompt ===========================
prompt
create sequence CPIC_SXDX.SEQ_APPNO
minvalue 1
maxvalue 999999999999999
start with 100001
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_PRESSURE
prompt ==============================
prompt
create sequence CPIC_SXDX.SEQ_PRESSURE
minvalue 1
maxvalue 999999999999999
start with 100001
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_TB_INSURANCE_TERM_CODE
prompt ============================================
prompt
create sequence CPIC_SXDX.SEQ_TB_INSURANCE_TERM_CODE
minvalue 0
maxvalue 999999
start with 71
increment by 1
cache 10;

prompt
prompt Creating sequence SEQ_TB_PRODUCT
prompt ================================
prompt
create sequence CPIC_SXDX.SEQ_TB_PRODUCT
minvalue 0
maxvalue 99999999
start with 19
increment by 1
cache 5;

prompt
prompt Creating sequence SEQ_TEMP_IPTEL
prompt ================================
prompt
create sequence CPIC_SXDX.SEQ_TEMP_IPTEL
minvalue 0
maxvalue 99999999
start with 11090
increment by 1
cache 5;

prompt
prompt Creating view V_CATEGORY_AUTHORIZE
prompt ==================================
prompt
create or replace view cpic_sxdx.v_category_authorize as
select rownum as id,t."HASCHILDREN",t."HASSUBOBJECT",t."TENEMENTID",t."CATEGORYID",t."PARENTID",t."NAME",t."CATEGORYTYPEID",t."DISORDER",t."ISACTIVITY",t."ISAUTHORITY",t."ISDEL",t."ISSYSTEM" from (
select
       decode((select 1
              from c_category c1
             where c1.parentid = c.categoryid
             and rownum = 1),null,0,1) as haschildren,
       decode((select 1
              from c_category c1,c_category_type y
             where c1.parentid = c.categoryid and
                   y.categorytypeid=c1.categorytypeid
                   and y.property=2
             and rownum = 1),null,0,1) as hassubobject,
       t.tenementid,
       c."CATEGORYID",
       c."PARENTID",
       c."NAME",
       c."CATEGORYTYPEID",
       c."DISORDER",
       c."ISACTIVITY",
       c."ISAUTHORITY",
       c."ISDEL",
       c."ISSYSTEM"
  from c_category_tenement t,c_category c,c_category_type y
 where c.categoryid = t.categoryid and y.property=1 and y.categorytypeid = c.categorytypeid
   and c.isdel = 0
 union
 select
        decode((select 1
              from c_category c1
             where c1.parentid = c.categoryid
             and rownum = 1),null,0,1) as haschildren,
       decode((select 1
              from c_category c1,c_category_type y
             where c1.parentid = c.categoryid and
                   y.categorytypeid=c1.categorytypeid
                   and y.property=2
             and rownum = 1),null,0,1) as hassubobject,
       null as tenementid,--����,�����⻧����
       c."CATEGORYID",
       c."PARENTID",
       c."NAME",
       c."CATEGORYTYPEID",
       c."DISORDER",
       c."ISACTIVITY",
       c."ISAUTHORITY",
       c."ISDEL",
       c."ISSYSTEM"
  from c_category c,c_category_type y where y.property in (2,9) and
 y.categorytypeid = c.categorytypeid
  ) t;

prompt
prompt Creating view V_CATEGORY_CONFCUSMENU
prompt ====================================
prompt
create or replace view cpic_sxdx.v_category_confcusmenu as
select rownum as id,c.categoryid,c.name,c.parentid,disorder,issystem,categorytypeid,
       decode(
          (select 1 from
                   c_category c1 where c1.parentid = c.categoryid
                    and c1.categorytypeid in (12)  and rownum=1),
              null,
              0,
              1) as haschildren,t.tenementid,
              c.tag_img,isdel as isdel,c.isactivity, c.isvalidate, c.customstatus
  from c_category c,c_category_tenement t where c.categorytypeid in (12)  and t.categoryid = c.categoryid
   order by t.tenementid,disorder;

prompt
prompt Creating view V_CATEGORY_CUSTOM_MENU
prompt ====================================
prompt
create or replace view cpic_sxdx.v_category_custom_menu as
select rownum as id,
       a.tenementid,
       a.name||'_'||b.name as name,
       b.categoryid,
       b.parentid,
       b.dorder as disorder,
       b.cattype as categorytypeid,
       b.haschildren,
       b.issystem,
       b.tag_img,
       b.isdel as isdel,
       b.isactivity,
       b.isvalidate,
       b.customstatus
  from (select t1.tenementid,
               t1.customformid,
               t1.name,
               t2.categoryid,
               t2.parentid
          from c_tenement t1, c_category t2
         where t1.customformid = t2.categoryid) a,
       (select categoryid,
               name,
               disorder,
               issystem,
               categorytypeid,
               disorder as dorder,
               categorytypeid as cattype,
               decode((select 1
                        from c_category c1
                       where c1.parentid = cat.categoryid
                         and c1.categorytypeid in (12)
                         and rownum = 1),
                      null,
                      0,
                      1) as haschildren,
               parentid,
               tag_img,
               isdel as isdel,
               isactivity,
               isvalidate,
               customstatus
          from c_category cat
         where categorytypeid = 12) b
 where b.categoryid in
       (select categoryid from c_category
         where categorytypeid = 12
         ����connect by parentid = prior categoryid
         ����start with categoryid = a.customformid)
 order by a.tenementid, b.dorder;

prompt
prompt Creating view V_CATEGORY_LEFTMENU
prompt =================================
prompt
create or replace view cpic_sxdx.v_category_leftmenu as
select rownum as id,c.categoryid,c.name,c.parentid,disorder,issystem,categorytypeid,
       decode(
          (select 1 from
                   c_category c1 where c1.parentid = c.categoryid
                    and c1.categorytypeid in (1,11,9,12) and isdel=0 and rownum=1),
              null,
              0,
              1) as haschildren,t.tenementid,
              c.tag_img,isdel as isdel,c.isactivity
  from c_category c,c_category_tenement t where c.categorytypeid in (1,11,9,12)  and t.categoryid = c.categoryid
   order by t.tenementid,disorder;

prompt
prompt Creating view V_CATEGORY_SYSTEM_MENU
prompt ====================================
prompt
create or replace view cpic_sxdx.v_category_system_menu as
select rownum as id,c.categoryid,c.name,c.parentid,disorder,issystem,categorytypeid,
       decode(
          (select 1 from
                   c_category c1 where c1.parentid = c.categoryid
                    and c1.categorytypeid in (1,7,10,12)  and rownum=1),
              null,
              0,
              1) as haschildren,t.tenementid,
              c.tag_img,isdel as isdel,c.isactivity, c.isvalidate
  from c_category c,c_category_tenement t where c.categorytypeid in (1,7,10,12)  and t.categoryid = c.categoryid
   order by t.tenementid,disorder;

prompt
prompt Creating view V_FAQ_GROUP
prompt =========================
prompt
create or replace view cpic_sxdx.v_faq_group as
select c.categoryid as groupid,c.name,c.parentid as parentid,c.disorder
           ,t.tenementid
     FROM c_category c,c_category_tenement t
        where c.categorytypeid = 11 and c.categoryid = t.categoryid and c.isdel=0;

prompt
prompt Creating view V_GROUP
prompt =====================
prompt
create or replace view cpic_sxdx.v_group as
select t1.name,t1.parentGroupId as parentGroupId,t1.disorder,
t1.groupid as categoryid,t1.tenementid,decode(p.allname,null,t1.name,p.allname) as allname,p.grouptypeid,p.groupcode from (
select c.categoryid as groupId,c.name,c.parentid as parentGroupId,c.disorder,t.tenementid
     FROM c_category c,c_category_tenement t
        where c.categorytypeid =9 and c.categoryid = t.categoryid  and c.isdel=0 ) t1
   left join c_group_properties p on p.categoryid = t1.groupId and p.tenementid = t1.tenementid;

prompt
prompt Creating view V_SALE_HISTORY
prompt ============================
prompt
create or replace view cpic_sxdx.v_sale_history
(historyid, cuslistid)
as
select t.history_id,t.cus_list_id from tb_sale_history t where t.ext=1;

prompt
prompt Creating view V_USER_ALL_FUNCTIONS_BAK
prompt ======================================
prompt
create or replace view cpic_sxdx.v_user_all_functions_bak as
select max(rownum) as id,t."TENEMENTID",t."USERID",t."CATEGORYID",t."ACTIVE_CATEGORYID",sum(READWRITE) as READWRITE,min(isauthority) as isauthority from
(
--�û���Ȩ
select u.tenementid,u.userid,u.categoryid,u.active_categoryid,u.readwrite,1 as isauthority
from c_user_function u,c_category c,c_tenement t
where c.categoryid = u.categoryid and c.isauthority = 1
  and c.isdel=0 and u.tenementid = t.tenementid and t.isdel=0
union
--��ɫ��Ȩ
select t.TENEMENTID,us.userid,f.categoryid,f.active_categoryid ,f.readwrite,1 as isauthority  from
       c_user_role u,c_role_function f,c_role c,c_category g,c_tenement t,c_user us where u.roleid=f.roleid
       and u.roleid = c.roleid and c.isdel=0  and g.categoryid = f.categoryid and g.isauthority = 1 and g.isdel=0
       and t.tenementid = c.TENEMENTID and t.isdel = 0 AND us.userid=u.userid
union
--����Ȩ�˵�
select tt.tenementid
 as tenementid,null as userid,c.categoryid,null as active_categoryid,1,isauthority
from c_category c
left join c_category_tenement tt
 on tt.categoryid = c.categoryid and c.isauthority = 0 and c.isdel=0 and c.categorytypeid in (select y.categorytypeid  from c_category_type y where y.property=1)
 where  c.isauthority = 0 and c.isdel=0--����Ҽ��˵������⴦��
) t group by t.TENEMENTID,t.userid,t.categoryid,t.active_categoryid;

prompt
prompt Creating view V_USER_DETAIL_BYGROUP
prompt ===================================
prompt
create or replace view cpic_sxdx.v_user_detail_bygroup as
select rownum as id,c.name as  defaultGroupName,t."USERID",t."LOGINID",t."EMPLOYEENAME",t."PASSWORD",t."ISDEL",t."DEFAULTLANGUAGE",t."ISSUPERADMIN",t."UPDATEDATE",t."UPDATEUSERID",t."EMPLOYEEID",t."DEFAULTTENEMENTID",t."DEFAULTGROUPID",t."ISTEAMLEADER",t."GROUPID",t."GROUPNAME",t."DISORDER",t."PARENTID",t."TENEMENTID",t."ISTEAMLEADERDESC" from (
select
       u.*,
       g.isteamleader,
       g.groupid,
       c.name as groupName,
       c.disorder,
       c.parentid,
       g.tenementid,
       decode(g.isteamleader,1,'��','��') as isteamleaderdesc
  from c_user u, c_user_group g, c_category c
 where u.userid = g.userid
   and u.defaulttenementid = g.tenementid
   and c.categoryid = g.groupid
) t,c_category c
where c.categoryid = t.defaultgroupid;

prompt
prompt Creating view V_USER_TENEMENT
prompt =============================
prompt
create or replace view cpic_sxdx.v_user_tenement as
select rownum as id,t."USERID",t."TENEMENTID" from (
select distinct userid,g.tenementid
    from c_user_group g) t;

prompt
prompt Creating procedure BACKUP_CUST_LIST
prompt ===================================
prompt
create or replace procedure cpic_sxdx.backup_cust_list(removeDate in varchar2, excuteNum in varchar2) is
  idsize number(20) := 0;--ѭ������
  minId number(20) := 0;
  maxId number(20) := 0;
  flag number(20) := 0;--������ͣ����
  totalNum number(20) := 0;--���η��ϻ���������������
begin
  dbms_output.put_line('begin');
  --�����ʱ��
  delete from tb_customer_list_rmv;
  --commit;
  --�����������Ĳ�����ʱ��
  insert into /*+ append */
  tb_customer_list_rmv r(r.cus_list_id,r.task_id)
    select t.cus_list_id, t.task_id
      from tb_customer_list t, tb_sale_batch t1
     where t.batch_id = t1.batch_id
       and t1.remove_date < to_date(removeDate, 'yyyyMMdd')
       order by t.cus_list_id;
  --commit;
  --������ѭ��������
  select count(1) into totalNum from tb_customer_list_rmv; 
  --������ѭ���Ĵ���
  select ceil(totalNum / excuteNum) into idsize from dual; 
  
  for j in 0 .. idsize-1 loop
       dbms_output.put_line(j+1);
       select nvl(min(cus_list_id),0),nvl(max(cus_list_id),0) into minId,maxId
         from (select r.cus_list_id, r.task_id, rownum rn1 from tb_customer_list_rmv r order by r.cus_list_id) where rn1 <=excuteNum;
       --���������ݱ��ݵ��������ݱ�
       insert into /*+ append */ tb_customer_list_remove t2(t2.cus_list_id,t2.cus_unique_ide,t2.cus_name,t2.cus_sex,t2.task_id,t2.org_center,t2.org_proj,t2.org_team,t2.user_id,t2.call_status,t2.status,t2.cus_birthday,t2.cus_age,t2.ide_type,t2.ide_number,t2.cus_metier,t2.mobile,t2.mobile2,t2.contect_tel,t2.home_tel,t2.off_tel,t2.contect_tel_type,t2.detailed_address,t2.postcode,t2.add_type,t2.emergency_con_person,t2.emergency_con_tel,t2.emer_con_relation,t2.contact_detailed_add,t2.contact_postcode,t2.cus_company,t2.metier_level,t2.marital_status,t2.bank_name,t2.bank_account_holder,t2.bank_account,t2.is_vip,t2.batch_id,t2.org_id,t2.creat_user,t2.creat_time,t2.modify_person,t2.modify_time,t2.is_blacklist,t2.fax,t2.res,t2.marital_id,t2.assign_date,t2.is_introduction,t2.introduction_id,t2.remove_type,t2.remove_time)
         select t.cus_list_id,t.cus_unique_ide,t.cus_name,t.cus_sex,t.task_id,t.org_center,t.org_proj,t.org_team,t.user_id,t.call_status,t.status,t.cus_birthday,t.cus_age,t.ide_type,t.ide_number,t.cus_metier,t.mobile,t.mobile2,t.contect_tel,t.home_tel,t.off_tel,t.contect_tel_type,t.detailed_address,t.postcode,t.add_type,t.emergency_con_person,t.emergency_con_tel,t.emer_con_relation,t.contact_detailed_add,t.contact_postcode,t.cus_company,t.metier_level,t.marital_status,t.bank_name,t.bank_account_holder,t.bank_account,t.is_vip,t.batch_id,t.org_id,t.creat_user,t.creat_time,t.modify_person,t.modify_time,t.is_blacklist,t.fax,t.res,t.marital_id,t.assign_date,t.is_introduction,t.introduction_id,'1',sysdate
           from tb_customer_list t, tb_customer_list_rmv t1
          where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId);
       --���������ݱ��ݵ�������ϸ���ݱ�  
       insert into /*+ append */ tb_cus_list_dtl_remove t2(t2.cus_list_id,t2.add_province,t2.add_city,t2.add_area,t2.cus_email,t2.contact_add_province,t2.contact_add_city,t2.contact_add_area,t2.introducer,t2.intro_time,t2.introducer_relation,t2.income,t2.education,t2.travel_mode,t2.own_house,t2.own_child,t2.buy_product,t2.car_type,t2.buy_house_time,t2.house_price,t2.house_area,t2.house_purpose,t2.house_type,t2.interest_type,t2.house_ownership_status,t2.cus_company_assets,t2.res1,t2.res2,t2.res3,t2.res4,t2.own_car)
         select t1.cus_list_id,t1.add_province,t1.add_city,t1.add_area,t1.cus_email,t1.contact_add_province,t1.contact_add_city,t1.contact_add_area,t1.introducer,t1.intro_time,t1.introducer_relation,t1.income,t1.education,t1.travel_mode,t1.own_house,t1.own_child,t1.buy_product,t1.car_type,t1.buy_house_time,t1.house_price,t1.house_area,t1.house_purpose,t1.house_type,t1.interest_type,t1.house_ownership_status,t1.cus_company_assets,t1.res1,t1.res2,t1.res3,t1.res4,t1.own_car
           from tb_cus_list_dtl t1, tb_customer_list_rmv t
          where t1.cus_list_id = t.cus_list_id and (t.cus_list_id between minId and maxId);
       --���������ݱ��ݵ����񱸷ݱ�  
       insert into /*+ append */ tb_task_remove t2(t2.task_id,t2.task_level,t2.create_time,t2.change_time,t2.is_important,t2.appoint_time,t2.active_status,t2.task_memo,t2.callresult_type,t2.first_result,t2.second_result,t2.user_id,t2.org_id,t2.status_id,t2.type_id,t2.policy_id,t2.batch_id,t2.cus_list_id,t2.ext1,t2.ext2,t2.ext3,t2.ext4,t2.ob_com_id,t2.policy_id_cancle)
         select t1.task_id,t1.task_level,t1.create_time,t1.change_time,t1.is_important,t1.appoint_time,t1.active_status,t1.task_memo,t1.callresult_type,t1.first_result,t1.second_result,t1.user_id,t1.org_id,t1.status_id,t1.type_id,t1.policy_id,t1.batch_id,t1.cus_list_id,t1.ext1,t1.ext2,t1.ext3,t1.ext4,t1.ob_com_id,t1.policy_id_cancle
           from tb_task t1, tb_customer_list_rmv t
          where t1.cus_list_id = t.cus_list_id and (t.cus_list_id between minId and maxId);
       --����������ʷ��
       insert into /*+ append */ tb_task_history_remove (HISTORY_ID, TASK_ID, TASK_LEVEL, CREATE_TIME, CHANGE_TIME, IS_IMPORTANT, APPOINT_TIME, ACTIVE_STATUS, TASK_MEMO, CALLRESULT_TYPE, FIRST_RESULT, SECOND_RESULT, USER_ID, ORG_ID, STATUS_ID, TYPE_ID, POLICY_ID, OB_COM_ID, BATCH_ID, CUS_LIST_ID, CREATE_HISTORY_DATE, EXT1, EXT2, EXT3, EXT4, STATUS_ID_LAST, TYPE_ID_LAST)
         select T1.HISTORY_ID, T1.TASK_ID, T1.TASK_LEVEL, T1.CREATE_TIME, T1.CHANGE_TIME, T1.IS_IMPORTANT, T1.APPOINT_TIME, T1.ACTIVE_STATUS, T1.TASK_MEMO, T1.CALLRESULT_TYPE, T1.FIRST_RESULT, T1.SECOND_RESULT, T1.USER_ID, T1.ORG_ID, T1.STATUS_ID, T1.TYPE_ID, T1.POLICY_ID, T1.OB_COM_ID, T1.BATCH_ID, T1.CUS_LIST_ID, T1.CREATE_HISTORY_DATE, T1.EXT1, T1.EXT2, T1.EXT3, T1.EXT4, T1.STATUS_ID_LAST, T1.TYPE_ID_LAST
          from tb_task_history t1, tb_customer_list_rmv t
          where t1.task_id = t.task_id
            and t1.cus_list_id = t.cus_list_id and (t.cus_list_id between minId and maxId);
       --���������޸���־��
       insert into TB_CUS_LIST_MODIFY_LOG_REMOVE (CUS_MODIFY_LOG_ID, CUS_LIST_ID, CUS_UNIQUE_IDE, CUS_NAME, CUS_SEX, ORG_CENTER, ORG_PROJ, ORG_TEAM, USER_ID, STATUS, CUS_BIRTHDAY, CUS_AGE, IDE_TYPE, IDE_NUMBER, CUS_METIER, MOBILE, MOBILE1, MOBILE2, CONTECT_TEL, HOME_TEL, OFF_TEL, CONTECT_TEL_TYPE, DETAILED_ADDRESS, POSTCODE, ADD_TYPE, EMERGENCY_CON_PERSON, EMERGENCY_CON_TEL, EMER_CON_RELATION, CONTACT_DETAILED_ADD, CONTACT_POSTCODE, CUS_COMPANY, METIER_LEVEL, MARITAL_STATUS, BANK_NAME, BANK_ACCOUNT_HOLDER, BANK_ACCOUNT, IS_VIP, BATCH_ID, ORG_ID, CREAT_PERSON, CREAT_TIME, MODIFY_PERSON, MODIFY_TIME, IS_BLACKLIST, FAX, RES)
         select T1.CUS_MODIFY_LOG_ID, T1.CUS_LIST_ID, T1.CUS_UNIQUE_IDE, T1.CUS_NAME, T1.CUS_SEX, T1.ORG_CENTER, T1.ORG_PROJ, T1.ORG_TEAM, T1.USER_ID, T1.STATUS, T1.CUS_BIRTHDAY, T1.CUS_AGE, T1.IDE_TYPE, T1.IDE_NUMBER, T1.CUS_METIER, T1.MOBILE, T1.MOBILE1, T1.MOBILE2, T1.CONTECT_TEL, T1.HOME_TEL, T1.OFF_TEL, T1.CONTECT_TEL_TYPE, T1.DETAILED_ADDRESS, T1.POSTCODE, T1.ADD_TYPE, T1.EMERGENCY_CON_PERSON, T1.EMERGENCY_CON_TEL, T1.EMER_CON_RELATION, T1.CONTACT_DETAILED_ADD, T1.CONTACT_POSTCODE, T1.CUS_COMPANY, T1.METIER_LEVEL, T1.MARITAL_STATUS, T1.BANK_NAME, T1.BANK_ACCOUNT_HOLDER, T1.BANK_ACCOUNT, T1.IS_VIP, T1.BATCH_ID, T1.ORG_ID, T1.CREAT_PERSON, T1.CREAT_TIME, T1.MODIFY_PERSON, T1.MODIFY_TIME, T1.IS_BLACKLIST, T1.FAX, T1.RES
           from TB_CUS_LIST_MODIFY_LOG t1, tb_customer_list_rmv t
          where t1.cus_list_id = t.cus_list_id
            and (t.cus_list_id between minId and maxId);
       --����������ϸ�޸���־��
       insert into TB_CUS_DTL_MODIFY_LOG_REMOVE (CUS_MODIFY_LOG_ID, CUS_LIST_ID, ADD_PROVINCE, ADD_CITY, ADD_AREA, CUS_EMAIL, CONTACT_ADD_PROVINCE, CONTACT_ADD_CITY, CONTACT_ADD_AREA, INTRODUCER, INTRO_TIME, INTRODUCER_RELATION, INCOME, EDUCATION, TRAVEL_MODE, OWN_HOUSE, OWN_CHILD, BUY_PRODUCT, CAR_TYPE, CAR_PRICE, CAR_PURPOSE, BUY_HOUSE_TIME, HOUSE_PRICE, HOUSE_AREA, HOUSE_PURPOSE, HOUSE_TYPE, INTEREST_TYPE, HOUSE_OWNERSHIP_STATUS, CUS_COMPANY_ASSETS, RES1, RES2, RES3, RES4, OWN_CAR)
         select T1.CUS_MODIFY_LOG_ID, T1.CUS_LIST_ID, T1.ADD_PROVINCE, T1.ADD_CITY, T1.ADD_AREA, T1.CUS_EMAIL, T1.CONTACT_ADD_PROVINCE, T1.CONTACT_ADD_CITY, T1.CONTACT_ADD_AREA, T1.INTRODUCER, T1.INTRO_TIME, T1.INTRODUCER_RELATION, T1.INCOME, T1.EDUCATION, T1.TRAVEL_MODE, T1.OWN_HOUSE, T1.OWN_CHILD, T1.BUY_PRODUCT, T1.CAR_TYPE, T1.CAR_PRICE, T1.CAR_PURPOSE, T1.BUY_HOUSE_TIME, T1.HOUSE_PRICE, T1.HOUSE_AREA, T1.HOUSE_PURPOSE, T1.HOUSE_TYPE, T1.INTEREST_TYPE, T1.HOUSE_OWNERSHIP_STATUS, T1.CUS_COMPANY_ASSETS, T1.RES1, T1.RES2, T1.RES3, T1.RES4, T1.OWN_CAR
           from TB_CUS_LIST_DTL_MODIFY_LOG t1, tb_customer_list_rmv t
          where t1.cus_list_id = t.cus_list_id
            and (t.cus_list_id between minId and maxId);

       --ɾ��������ϸ���ݺõ�����
       delete from (select t.* from tb_cus_list_dtl t, tb_customer_list_rmv t1 where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId));
       --ɾ���������ݺõ�����
       delete from (select t.* from tb_customer_list t, tb_customer_list_rmv t1 where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId));
       --ɾ��������ʷ��
       delete from (select t.* from tb_task_history t, tb_customer_list_rmv t1 where t.task_id = t1.task_id and t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId)); 
       --ɾ�������
       delete from (select t.* from tb_task t, tb_customer_list_rmv t1 where t.task_id = t1.task_id and t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId)); 
       --ɾ��������ϸ�޸���־��
       delete from (select t.* from TB_CUS_LIST_DTL_MODIFY_LOG t, tb_customer_list_rmv t1 where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId));
       --ɾ�������޸���־��
       delete from (select t.* from TB_CUS_LIST_MODIFY_LOG t, tb_customer_list_rmv t1 where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId));  
       --ɾ����ʱ�������
       delete from tb_customer_list_rmv t1 where (t1.cus_list_id between minId and maxId);
       
       --��¼�м���־��c_log
       if(excuteNum*(j+1)>totalNum) then
         insert into c_log
           select max(t.logid+1), '�����鵵��־', '', '��'||totalNum||'���������ѻ���'||totalNum||'��', 0, sysdate, '', '', '', ''
           from c_log t;
       else
         insert into c_log
           select max(t.logid+1), '�����鵵��־', '', '��'||totalNum||'���������ѻ���'||excuteNum*(j+1)||'��', 0, sysdate, '', '', '', ''
           from c_log t;
       end if;
       --commit;
       --ÿ�ύһ�β�ѯ�¿����ǲ��ǽ�����ͣ����ʼֵΪ14�����˱�־λ��Ϊ15�������ֹͣ
       select nvl(tk.tenementid, 0) into flag from c_server_tenement tk where tk.serverid = 226;
     exit when flag=15;
   end loop;
exception
  when others then
    dbms_output.put_line('�洢����ִ��ʧ��:' || Sqlerrm || '(errorcode=' || sqlcode || ')');
    rollback;
dbms_output.put_line('end');
end backup_cust_list;
/

prompt
prompt Creating procedure CLEARRUSHDATAABOUTCUSTOMERLIST
prompt =================================================
prompt
create or replace procedure cpic_sxdx.clearRushDataAboutCustomerList as
--variables
       v_sale_batch_total number(20) := 0;
       v_batch_id number(20) := 0;
       v_batch_name varchar2(100) := 0;
       v_temp_total number(22) := 0;
       v_temp_failure_total number(20) := 0;
       cursor batch_result is 
              select b.batch_id,b.batch_name,b.success,b.failure from tb_sale_batch b;
begin 
  select count(*) into v_sale_batch_total from tb_sale_batch;
  open batch_result;
  loop  
       fetch batch_result into v_batch_id,v_batch_name,v_temp_total,v_temp_failure_total;
       exit when batch_result%notfound;
       dbms_output.put_line('����id��'||v_batch_id||'�������ƣ�'||v_batch_name||';�ɹ�����'||v_temp_total||';ʧ����:'||v_temp_failure_total);
  end loop;
  
  for i  in 1 .. 10 loop 
       dbms_output.put_line(i);
  end loop;
  close batch_result;
  dbms_output.put_line('�ϴ�����������'||v_sale_batch_total);
end;
/

prompt
prompt Creating procedure CUS_LIST_BELONG_QUERY_TEAM
prompt =============================================
prompt
create or replace procedure cpic_sxdx.cus_list_belong_query_team as
  user_id varchar2(25);-- 1.��ѯ���Ŷ���������ϯ��
  total_num number := 0;-- 2.��ѯÿ����ϯ��ӵ�е�������������ȥ����״̬Ϊʧ�ܵ���������
  first_call_num number := 0;-- 3.��ѯÿ����ϯ��ӵ�еĴ��ײ���������
  follow_num number := 0;-- 4.��ѯÿ����ϯ��ӵ�еĸ�����������
  ten_num number := 0;-- 5.��ѯÿ����ϯ��ӵ�е�ʮ���ڵ�����������
  --�α�1���Ŷӵ�½  roleID=12  ��ʾ��ϯ
                     --��ϯ���ţ�AgentId��
                     --��ϯ����
                     --�ϼ�����ID
                     --����ID
                     --��������
                     --����ID
                     --�������� 
                     --������
                     --���ײ�������
                     --����������
                     --ʮ���ڵ���������
  cursor team_cur is
        select batch_id,batch_name,agentid,employeename,parent_org_id,org_id,org_name,sum(t),sum(a),sum(b),sum(c) from (      
              select s.batch_id,--����ID
                     s.batch_name,--�������� 
                     u.agentid,--��ϯ���ţ�AgentId��
                     u.employeename,--��ϯ����
                     o.parent_org_id,--�ϼ�����ID
                     u.org_id,--����ID
                     o.org_name,--��������
                     count(*) t,--������
                     case l.call_status when 0 then count(l.call_status) end a,--���ײ�������
                     case t.status_id when 5 then count(t.status_id) end b,--����������
                     case when s.remove_date <= sysdate+10 then count(s.remove_date) end c--ʮ���ڵ���������
              from tb_customer_list l,tb_task t,tb_sale_batch s,c_user u,tb_organization o
              where exists (
                  select u.userid from c_user_role ur,c_role r
                  where u.userid = ur.userid
                  and ur.roleid = r.roleid
                  and (r.roleid = 13 or r.roleid = 14)
                  and l.user_id = u.userid
              )
              and u.org_id = o.org_id
              and l.cus_list_id = t.cus_list_id
              and l.task_id = t.task_id
              and t.status_id != 11
              and s.batch_id = l.batch_id
              and l.user_id is not null
              group by s.batch_id,s.batch_name,u.agentid,u.employeename,o.parent_org_id,u.org_id,o.org_name,l.call_status,t.status_id,s.remove_date
              order by u.employeename
  )            
  group by batch_id,batch_name,agentid,employeename,parent_org_id,org_id,org_name
  order by employeename; 
        
        
  --�α�2����Ŀ�����½  roleID=11 
                     --�Ŷӳ�����
                     --�ϼ�����ID
                     --����ID
                     --��������
                     --����ID
                     --�������� 
                     --������
                     --������������
                     --����������
                     --ʮ���ڵ���������  
  
  --�α�2�����ĵ�½  roleID=9   
                     --��Ŀ��������
                     --�ϼ�����ID
                     --����ID
                     --��������
                     --����ID
                     --�������� 
                     --������
                     --������������
                     --����������
                     --ʮ���ڵ���������   
begin
  dbms_output.put_line('����������ѯ-�Ŷӳ���½');
  
  open team_cur;
  loop
    fetch team_cur into user_id,total_num,first_call_num,follow_num,ten_num;
    exit when team_cur%notfound;
    dbms_output.put_line(user_id||':'||total_num||'-'||first_call_num||'-'||follow_num||'-'||ten_num);
  end loop;
  close team_cur;

end;
/

prompt
prompt Creating procedure GET_WEEK
prompt ===========================
prompt
create or replace procedure cpic_sxdx.get_week is
 week_day varchar2(100);
begin

select next_day(to_date('2011-12-31','yyyy-mm-dd'),1) into week_day from dual;
dbms_output.put_line(week_day);
end get_week;
/

prompt
prompt Creating procedure INSERT_TB_SALE_HISTORY_TEMP
prompt ==============================================
prompt
create or replace procedure cpic_sxdx.insert_tb_sale_history_temp as
  cursor c is
  select * from (
    select t.cus_list_id,
           t.customer_id,
           t.obcom_id,
           t.activity_name,
           t.user_id,
           t.contact_phone,
           t.first_result,
           t.second_result,
           t.is_contact,
           t.is_through,
           t.callover_time,
           t.appoint_time,
           t.memo,
           t.configuration,
           t.task_id,
           t.task_status,
           t.task_type,
           t.policy_id,
           t.policy_status,
           t.create_history_date,
           t.ext,
           t.call_duration,
           t.callstart_time,
           t.task_status_last,
           t.task_type_last,
           t.history_date_last
      from tb_sale_history_temp t order by t.history_id desc) where rownum=1;
  begin
  for j in 0 .. 60000 loop
    for t in c loop
      insert into tb_sale_history_temp
        (HISTORY_ID,cus_list_id,
         customer_id,
         obcom_id,
         activity_name,
         user_id,
         contact_phone,
         first_result,
         second_result,
         is_contact,
         is_through,
         callover_time,
         appoint_time,
         memo,
         configuration,
         task_id,
         task_status,
         task_type,
         policy_id,
         policy_status,
         create_history_date,
         ext,
         call_duration,
         callstart_time,
         task_status_last,
         task_type_last,
         history_date_last)
      values
        (seq_sale_history_temp.nextval,t.cus_list_id,
         t.customer_id,
         t.obcom_id,
         t.activity_name,
         t.user_id,
         t.contact_phone,
         t.first_result,
         t.second_result,
         t.is_contact,
         t.is_through,
         t.callover_time,
         t.appoint_time,
         t.memo,
         t.configuration,
         t.task_id,
         t.task_status,
         t.task_type,
         t.policy_id,
         t.policy_status,
         t.create_history_date,
         t.ext,
         t.call_duration,
         t.callstart_time,
         t.task_status_last,
         t.task_type_last,
         t.history_date_last); commit;
    end loop;
  end loop;
end;
/

prompt
prompt Creating procedure P_DAY_TOTAL
prompt ==============================
prompt
create or replace procedure cpic_sxdx.p_day_total(para_date date) is
 
  v_ob_com_id     number(10) := 0; --����
  v_agent_id      number(10) := 0; -- ��ϯ����
  v_ob_com_name   varchar(50) :=''; --�����
  v_user_name     varchar(50) := ''; --�û�����
  v_batch_id      number(10) :=0;   --���α��
  v_batch_name    varchar(50) := ''; --��������
  v_cust_list     number(10) := 0; --��������
  v_call_list     number(10) := 0; --��������
  v_contact_list  number(10) := 0; --�Ӵ���
  v_contact_rate  varchar(10) := 0; --�Ӵ���
  v_deal_list     number(10) := 0; --�ɽ���
  v_deal_rate     varchar(10) := 0; --�ɽ���
  v_year_list     number(10) := 0; --���
  v_year_totail     number(10) := 0; --��ɶ�
  v_month_list     number(10) := 0; --�½�
  v_month_totail     number(10) := 0; --�½ɶ�
  v_current_date          Date;
  CURSOR cur is 
      select distinct c.user_id,b.batch_id,b.ob_com_id
   from tb_customer_list c ,tb_sale_batch b
   where c.batch_id=b.batch_id and to_char(c.creat_time, 'YYYY-MM-DD') =to_char(v_current_date, 'YYYY-MM-DD'); 
   
begin
  begin    
     begin                            
         if para_date is null then
            v_current_date := sysdate;
         else
            v_current_date := para_date;      
         end if ;   
        open cur;
        loop
             Fetch  cur into
              v_agent_id,v_batch_id, v_ob_com_id;
             exit when cur%notfound;
             
             select ob_com_name into v_ob_com_name from  tb_ob_com   where ob_com_id=v_ob_com_id; --�����
             
             select employeename,agentid into v_user_name,v_agent_id from c_user where userid=v_agent_id; --��ϯ���ƺ���ϯ����
             
             select batch_name into v_batch_name from tb_sale_batch  where batch_id=v_batch_id;--��������
             
             select count(*) into v_cust_list --��������
                    from   tb_customer_list a
                    where a.user_id = v_agent_id
                      and a.batch_id = v_batch_id
                      and to_char(a.ASSIGN_DATE, 'yyyy-mm-dd') = to_char(v_current_date, 'yyyy-mm-dd');
             
             select count(*) into v_call_list --��������
                   from   tb_call_history c ,tb_customer_list a
                   where c.task_id=a.task_id
                     and c.agentid = a.user_id
                     and a.user_id= v_agent_id
                     and a.batch_id=v_batch_id
                     and to_char(a.ASSIGN_DATE, 'yyyy-mm-dd') = to_char(v_current_date, 'yyyy-mm-dd');
                        
             select count(*) into v_contact_list --�Ӵ���
                    from
                    (select t.* from tb_sale_history t,tb_customer_list a
                              where is_contact=1 and t.create_history_date >= (v_current_date -1)
                              and t.task_id=a.task_id
                              and a.user_id= v_agent_id
                              and a.batch_id=v_batch_id
                              and to_char(a.ASSIGN_DATE, 'yyyy-mm-dd') = to_char(v_current_date, 'yyyy-mm-dd')
                       ) aa ,
                      (select t.* from tb_sale_history t,tb_customer_list a 
                              where is_contact=0 and t.create_history_date < (v_current_date -1)
                              and t.task_id=a.task_id
                              and a.user_id= v_agent_id
                              and a.batch_id=v_batch_id
                              and to_char(a.ASSIGN_DATE, 'yyyy-mm-dd') = to_char(v_current_date, 'yyyy-mm-dd')
                      ) b
                      where aa.task_id = b.task_id;
                      
              select count(*) into v_deal_list --�ɽ���
                     from tb_application p,tb_customer_list a
                     where p.task_id=a.task_id
                      and p.verify_status=1
                      and a.user_id= v_agent_id
                      and a.batch_id=v_batch_id
                      and to_char(a.assign_date, 'yyyy-mm-dd') = to_char(v_current_date, 'yyyy-mm-dd');
                      
              select count(*) into v_year_list --���
                     from tb_application p,tb_customer_list a,tb_app_prd_info x
                     where p.task_id=a.task_id 
                       and p.application_id=x.application_id 
                       and x.pay_typ='13'
                       and p.verify_status=1
                       and a.user_id= v_agent_id
                       and a.batch_id=v_batch_id
                       and to_char(a.assign_date, 'yyyy-mm-dd') = to_char(v_current_date, 'yyyy-mm-dd');
                              
              select sum(p.total_fee) into v_year_totail --���(���)
                     from tb_application p,tb_customer_list a,tb_app_prd_info x
                     where p.task_id=a.task_id 
                       and p.application_id=x.application_id 
                       and x.pay_typ='13'
                       and p.verify_status=1
                       and a.user_id= v_agent_id
                       and a.batch_id=v_batch_id
                       and to_char(a.assign_date, 'yyyy-mm-dd') = to_char(v_current_date, 'yyyy-mm-dd');
                       
              select count(*) into v_month_list --�½�
                     from tb_application p,tb_customer_list a,tb_app_prd_info x
                     where p.task_id=a.task_id 
                       and p.application_id=x.application_id 
                       and x.pay_typ='10'
                       and p.verify_status=1
                       and a.user_id= v_agent_id
                       and a.batch_id=v_batch_id
                       and to_char(a.assign_date, 'yyyy-mm-dd') = to_char(v_current_date, 'yyyy-mm-dd');
                              
              select sum(p.total_fee) into v_month_totail --�½�(���)
                     from tb_application p,tb_customer_list a,tb_app_prd_info x
                     where p.task_id=a.task_id 
                       and p.application_id=x.application_id 
                       and x.pay_typ='10'
                       and p.verify_status=1
                       and a.user_id= v_agent_id
                       and a.batch_id=v_batch_id
                       and to_char(a.assign_date, 'yyyy-mm-dd') = to_char(v_current_date, 'yyyy-mm-dd');
             
                               
              if v_contact_list <> 0 then
                if v_deal_list = 0 then
                  v_deal_rate := '0%';
                else
                  v_deal_rate := round((v_deal_list / v_contact_list), 2) * 100 || '%'; --�ɽ���
                end if;
                if v_cust_list = 0 then
                  v_contact_rate := '0%';
                else
                  v_contact_rate := round((v_contact_list / v_cust_list), 2) * 100 || '%'; --�Ӵ���
                end if;
              else
                v_contact_rate  := '0%'; --�Ӵ���
                v_deal_rate     := '0%'; --�ɽ���
              end if;
              
            if (v_cust_list <> 0 or v_deal_list <> 0 or v_contact_list <> 0) 
               then
               insert into rpt_deal_biz_day
                ( OB_COM_ID ,
                  AGENT_ID ,
                  OB_COM_NAME ,
                  USER_NAME  ,
                  BATCH_ID  ,
                  BATCH_NAME,
                  CUST_LIST,
                  CALL_LIST,
                  CONTACT_LIST,
                  CONTACT_RATE,
                  DEAL_LIST,
                  DEAL_RATE,
                  YEAR_LIST,
                  YEAR_TOTAIL,
                  MONTH_LIST,
                  MONTH_TOTAIL,
                  CURRENT_DATE )
              values
                ( v_ob_com_id,--����
                  v_agent_id,-- ��ϯ����
                  v_ob_com_name,--�����
                  v_user_name,--�û�����
                  v_batch_id,--���α��
                  v_batch_name, --��������
                  v_cust_list,--��������
                  v_call_list,--��������
                  v_contact_list,--�Ӵ���
                  v_contact_rate, --�Ӵ���
                  v_deal_list,--�ɽ���
                  v_deal_rate,--�ɽ���
                  v_year_list,--���
                  v_year_totail, --��ɶ�
                  v_month_list, --�½�
                  v_month_totail, --�½ɶ�
                  v_current_date );
            end if;      
        end loop;
        close cur;
        commit;
     end;   
  end; 
end;
/

prompt
prompt Creating procedure P_DEAL_BIZ_DAY
prompt =================================
prompt
create or replace procedure cpic_sxdx.p_deal_biz_day(para_date date) is
  v_ob_com_id    number(10) := 0;
  v_use_id       number(10) := 0;
  v_campaign_nam varchar(50) := '';
  v_cus_gro_name varchar(50) := '';
  v_n_list       number(10) := 0;
  v_n_dial       number(10) := 0;

  v_n_contact       number(10) := 0;
  v_pc_contact_list varchar2(20) := '';

  v_n_deal       number(10) := 0;
  v_n_deal_m     number(10) := 0;
  v_n_deal_y     number(10) := 0;
  v_pc_deal_list varchar2(20) := '';

  v_sum_deal   number(10, 2) := 0;
  v_sum_deal_m number(10, 2) := 0;
  v_sum_deal_y number(10, 2) := 0;

  v_accept_time varchar2(20) := '';
  v_pay_way     varchar2(20) := '';
  v_price       number(10, 2) := 0;
  v_if_exists   number(10) := 0;

  cur                types.cursorType;
  v_cus_gro_id       number(10) := 0;
  v_current_datetime date;

  v_current_date date;
  v_state_date   date;
  v_remark       varchar(100);

  v_exp      varchar2(4000);
  v_exp_code varchar2(100);
  ---�ɽ�ҵ����ͳ��
begin
  begin
    v_state_date := sysdate;
    if para_date is null then
      v_current_datetime := sysdate;
    else
      v_current_datetime := para_date;
    end if;

    v_current_date := to_date(to_char(v_current_datetime, 'YYYY-MM-DD'),
                              'YYYY-MM-DD');
    --�жϴ����ʱ���Ƿ�Ϊ�գ��յĻ�����v_current_datetimeΪϵͳʱ�䣬����Ϊ�����ʱ��
    --- ���û������ѯ����ĳɽ����
    begin
      open cur for
        select distinct use_id, ob_com_id
          from c_ob_com_cus a
         where cal_typ = '2';
      loop
        <<a>>
        fetch cur
          into v_use_id, v_ob_com_id;
        exit when cur%notfound;
        begin
          select distinct cus_gro_id
            into v_cus_gro_id
            from c_ob_com_cus
           where use_id = v_use_id
             and ob_com_id = v_ob_com_id; --Ŀ���б�ID

          select t.cus_gro_nam
            into v_cus_gro_name
            from C_CUS_GRO t
           where t.cus_gro_id = v_cus_gro_id; --Ŀ���б�����

          select ob_com_nam
            into v_campaign_nam
            from tb_ob_com
           where ob_com_id = v_ob_com_id; --�����
        exception
          when others then
            -- �����쳣��һЩ����
            begin
              dbms_output.put_line('data error :' || v_use_id || '--' || v_ob_com_id);
             goto a;
            end;

        end;

        select count(1)
          into v_n_list --��������
          from (select a.c_ob_com_cus_id
                  from c_ob_com_cus a
                 where a.use_id = v_use_id
                   and a.ob_com_id = v_ob_com_id
                   and to_char(a.asg_dat, 'yyyy-mm-dd') =
                       to_char(v_current_date, 'yyyy-mm-dd'));

        select n_dial
          into v_n_dial --��������
          from (select count(1) n_dial
                  from c_ob_com_cus a, c_ob_com_cus_dia_out b
                 where a.c_ob_com_cus_id = b.c_ob_com_cus_id
                   and a.use_id = v_use_id
                   and b.use_id = v_use_id -- ȥ������ϯ�����¼
                   and a.ob_com_id = v_ob_com_id
                   and to_char(b.dia_out_tim, 'yyyy-mm-dd') =
                       to_char(v_current_date, 'yyyy-mm-dd'));

        select count(1)
          into v_n_contact --�Ӵ���
          from (select b.contact
                  from c_ob_com_cus a, c_ob_com_cus_dia_out b
                 where a.c_ob_com_cus_id = b.c_ob_com_cus_id
                   and a.use_id = v_use_id
                   and b.use_id = v_use_id -- ȥ������ϯ�����¼
                   and a.ob_com_id = v_ob_com_id
                   and (a.con_sta_id like '2002%' or a.con_sta_id like '35%')
                   and to_char(dia_out_tim, 'yyyy-mm-dd') =
                       to_char(v_current_date, 'yyyy-mm-dd')
                 group by b.contact);

        select count(1)
          into v_n_deal
          from shcpic_proposal_form_result a, c_ob_com_cus b
         where a.c_ob_com_cus_id = b.c_ob_com_cus_id
           and use_id = v_use_id
           and b.ob_com_id = v_ob_com_id
           and substr(a.audittime, 0, 10) =
               to_char(v_current_date, 'yyyy-mm-dd')
           and a.audit_status = '1'; --�ɽ���

        select count(1)
          into v_n_deal_m
          from shcpic_proposal_form_result a,
               c_ob_com_cus                b,
               shcpic_product_result       c
         where a.c_ob_com_cus_id = b.c_ob_com_cus_id
           and a.id = c.proposal_form_id
           and c.element_id = '91'
           and c.element_value_value = '10'
           and use_id = v_use_id
           and ob_com_id = v_ob_com_id
           and substr(audittime, 0, 10) =
               to_char(v_current_date, 'yyyy-mm-dd')
           and a.audit_status = '1'; --�ɽ������½ɣ�

        select count(1)
          into v_n_deal_y
          from shcpic_proposal_form_result a,
               c_ob_com_cus                b,
               shcpic_product_result       c
         where a.c_ob_com_cus_id = b.c_ob_com_cus_id
           and a.id = c.proposal_form_id
           and c.element_id = '91'
           and c.element_value_value = '13'
           and use_id = v_use_id
           and ob_com_id = v_ob_com_id
           and substr(audittime, 0, 10) =
               to_char(v_current_date, 'yyyy-mm-dd')
           and a.audit_status = '1'; --�ɽ�������ɣ�

        select sum(price)
          into v_sum_deal
          from shcpic_proposal_form_result a, c_ob_com_cus b
         where a.c_ob_com_cus_id = b.c_ob_com_cus_id
           and use_id = v_use_id
           and ob_com_id = v_ob_com_id
           and substr(audittime, 0, 10) =
               to_char(v_current_date, 'yyyy-mm-dd')
           and a.audit_status = '1'; --�ɽ��ܶ�

        select sum(price)
          into v_sum_deal_m
          from shcpic_proposal_form_result a,
               c_ob_com_cus                b,
               shcpic_product_result       c
         where a.c_ob_com_cus_id = b.c_ob_com_cus_id
           and a.id = c.proposal_form_id
           and c.element_id = '91'
           and c.element_value_value = '10'
           and use_id = v_use_id
           and ob_com_id = v_ob_com_id
           and substr(audittime, 0, 10) =
               to_char(v_current_date, 'yyyy-mm-dd')
           and a.audit_status = '1'; --�ɽ��ܶ�½ɣ�

        select sum(price)
          into v_sum_deal_y
          from shcpic_proposal_form_result a,
               c_ob_com_cus                b,
               shcpic_product_result       c
         where a.c_ob_com_cus_id = b.c_ob_com_cus_id
           and a.id = c.proposal_form_id
           and c.element_id = '91'
           and c.element_value_value = '13'
           and use_id = v_use_id
           and ob_com_id = v_ob_com_id
           and substr(audittime, 0, 10) =
               to_char(v_current_date, 'yyyy-mm-dd')
           and a.audit_status = '1'; --�ɽ��ܶ��ɣ�

        if v_n_contact <> 0 then
          if v_n_deal = 0 then
            v_pc_deal_list := '0%';
          else
            v_pc_deal_list := round((v_n_deal / v_n_contact), 2) * 100 || '%'; --�ɽ���
          end if;
          if v_n_list = 0 then
            v_pc_contact_list := '0%';
          else
            v_pc_contact_list := round((v_n_contact / v_n_list), 2) * 100 || '%'; --�Ӵ���
          end if;
        else
          v_pc_deal_list    := '0%'; --����
          v_pc_contact_list := '0%'; --����
        end if;

        -- ɾ������浵����
        delete rpt_deal_biz_day
         where substr(t_archive, 0, 10) =
               to_char(v_current_datetime, 'YYYY-MM-DD')
           and campaign_id = v_ob_com_id
           and use_id = v_use_id;

        if (v_n_list <> 0 or v_n_dial <> 0 or v_n_contact <> 0 or
           v_n_deal <> 0) then
          insert into rpt_deal_biz_day
            (use_id,
             campaign_id,
             campaign_nam,
             cus_list_nam,
             n_list,
             n_dial,

             n_contact,
             pc_contact_list,

             n_deal,
             n_deal_m,
             n_deal_y,
             pc_deal_list,

             sum_deal,
             sum_deal_m,
             sum_deal_y,

             n_accept,
             n_accept_m,
             n_accept_y,
             pc_accept_list,

             sum_accept,
             sum_accept_m,
             sum_accept_y,

             t_archive)
          values
            (v_use_id,
             v_ob_com_id,
             v_campaign_nam,
             v_cus_gro_name,
             v_n_list,
             v_n_dial,

             v_n_contact,
             v_pc_contact_list,

             v_n_deal,
             v_n_deal_m,
             v_n_deal_y,
             v_pc_deal_list,

             v_sum_deal,
             v_sum_deal_m,
             v_sum_deal_y,

             0,
             0,
             0,
             '0%',

             0,
             0,
             0,
             to_char(v_current_datetime, 'YYYY-MM-DD HH24:MI:SS'));
        end if;

      end loop;
      close cur;
      commit;

    end;
    begin
      --- ���µ��췢������ĳб���¼��ֻҪ�������б��Ķ����뵱��ĳб���
      -- �Ӵ浵����Ϊ����ĳб��б��л�ȡ����
      open cur for
        select (select a.use_id from c_use a where a.use_ali_id = r.useid) use_id,
               (select b.element_value_value
                  from shcpic_product_result b
                 where b.proposal_form_id = p.id
                   and b.element_id = '91') pay_way,
               r.campaign_id,
               r.campaign_name,
               r.accept_time,
               (select distinct d.cus_gro_nam
                  from c_ob_com_cus c, c_cus_gro d
                 where c.c_ob_com_cus_id = p.c_ob_com_cus_id
                   and c.cus_gro_id = d.cus_gro_id) cus_gro_name,
               p.price
          from rpt_accept_ins_day r, shcpic_proposal_form_result p
         where r.appno = p.appno
           and substr(r.t_archive, 0, 10) =
               to_char(v_current_datetime, 'YYYY-MM-DD');
      loop
        fetch cur
          into v_use_id, v_pay_way, v_ob_com_id, v_campaign_nam, v_accept_time, v_cus_gro_name, v_price;
        exit when cur%notfound;
        select count(1)
          into v_if_exists
          from rpt_deal_biz_day a
         where a.use_id = v_use_id
           and a.campaign_id = v_ob_com_id
           and substr(a.t_archive, 0, 10) = substr(v_accept_time, 0, 10);

        if v_if_exists > 0 then

          update rpt_deal_biz_day
             set n_accept       = n_accept + 1,
                 sum_accept     = sum_accept + v_price,
                 pc_accept_list = decode(n_deal,
                                         0,
                                         '0%',
                                         round((n_accept + 1 / n_deal), 2) * 100 || '%'),
                 n_accept_m     = decode(v_pay_way,
                                         '10',
                                         n_accept_m + 1,
                                         n_accept_m),
                 sum_accept_m   = decode(v_pay_way,
                                         '10',
                                         sum_accept_m + v_price,
                                         sum_accept_m),
                 n_accept_y     = decode(v_pay_way,
                                         '13',
                                         n_accept_y + 1,
                                         n_accept_y),
                 sum_accept_y   = decode(v_pay_way,
                                         '13',
                                         sum_accept_y + v_price,
                                         sum_accept_y)

           where use_id = v_use_id
             and campaign_id = v_ob_com_id
             and substr(t_archive, 0, 10) = substr(v_accept_time, 0, 10);

        else

          insert into rpt_deal_biz_day
            (use_id,
             campaign_id,
             campaign_nam,
             cus_list_nam,
             n_list,
             n_dial,

             n_contact,
             pc_contact_list,

             n_deal,
             n_deal_m,
             n_deal_y,
             pc_deal_list,

             sum_deal,
             sum_deal_m,
             sum_deal_y,

             n_accept,
             n_accept_m,
             n_accept_y,
             pc_accept_list,

             sum_accept,
             sum_accept_m,
             sum_accept_y,

             t_archive)
          values
            (v_use_id,
             v_ob_com_id,
             v_campaign_nam,
             v_cus_gro_name,
             0,
             0,

             0,
             '0%',

             0,
             0,
             0,
             '0%',

             0,
             0,
             0,

             1,
             decode(v_pay_way, '10', 1, 0),
             decode(v_pay_way, '13', 1, 0),
             '0%',

             v_price,
             decode(v_pay_way, '10', v_price, 0),
             decode(v_pay_way, '13', v_price, 0),

             v_accept_time);
        end if;
      end loop;
      close cur;
      commit;
    end;
  EXCEPTION

    when NO_DATA_FOUND then
      begin
        v_exp      := SUBSTR(SQLERRM, 1, 3000);
        v_exp_code := sqlcode;
        close cur;
        v_remark := 'NO_DATA_FOUND error';
        dbms_output.put_line('NO_DATA_FOUND error');
        rollback;
        commit;
      end;
    when too_many_rows then
      begin
        v_exp      := SUBSTR(SQLERRM, 1, 3000);
        v_exp_code := sqlcode;
        close cur;
        v_remark := '����ֵ����';
        dbms_output.put_line('����ֵ����');
        rollback;
      end;
    when others then
      begin
        v_exp      := SUBSTR(SQLERRM, 1, 3000);
        v_exp_code := sqlcode;
        close cur;
        v_remark := 'others error';
        dbms_output.put_line('others error');
        rollback;
      end;
  end;
  begin
    insert into p_deal_biz_day_log
      (statetime, endtime, remark, ex, CODE)
    values
      (v_state_date, sysdate, v_remark, v_exp, v_exp_code);

    commit;
  end;
end;
/

prompt
prompt Creating procedure P_OUTPUT
prompt ===========================
prompt
create or replace procedure cpic_sxdx.p_output as
  i integer:=0;
begin
  for j in 0..9 loop
    i:=i+j;
    dbms_output.put_line(i);
  end loop;
end p_output;
/

prompt
prompt Creating procedure P_TB_APP
prompt ===========================
prompt
CREATE OR REPLACE PROCEDURE CPIC_SXDX.P_TB_APP(in_task_id in INTEGER) AS
  v_app_id     number(18);
  v_app_prd_id number(20);
  v_deli_id    number(10);
  v_cus_id     number(20);
  v_cus_con_id number(10);
  v_adds_id    number(10);

  --i integer;
BEGIN
  --for i in 1 .. in_cycle_count loop
  --Ͷ����������Ϣ��ID
  select to_number(max(t.application_id))
    into v_app_id
    from tb_application t;
  --Ͷ������Ʒ��Ϣ��ID
  select max(t.app_prd_id) into v_app_prd_id from tb_app_prd_info t;
  --������Ϣ��ID
  select max(t.deli_id) into v_deli_id from tb_delivery_info t;
  --Ͷ���ͻ�������Ϣ��ID
  select max(t.app_customer_id)
    into v_cus_id
    from tb_application_customer t;
  --Ͷ���ͻ���ϵ��ʽ��ID
  select max(t.cus_con_id)
    into v_cus_con_id
    from tb_app_customer_contact t;
  --Ͷ���ͻ���ַ��Ϣ��ID
  select max(t.adds_id) into v_adds_id from tb_app_customer_adds t;

  --Ͷ����������Ϣ��
  insert /*+ append nologging parallel */
  into tb_application
    select to_number(application_id) + v_app_id,
           appno,
           policyno,
           idorg,
           iddmsystem,
           iddmtype,
           firstcreate,
           lastupdate,
           isubmit,
           iaccept,
           recordstatus,
           tsrid,
           last_log,
           product_name,
           campaign_name,
           vaildaty,
           ialter,
           irepeal,
           iupdate,
           app_status,
           prj_id,
           ai_rel,
           acus_licno,
           acus_mob,
           acus_gender,
           acus_name,
           icus_licno,
           icus_mob,
           icus_gender,
           icus_name,
           agent_id,
           total_fee,
           org_id,
           site_status,
           pro_status,
           is_del,
           ob_com_id,
           task_id + in_task_id,
           verify_status,
           verify_note,
           update_user,
           verify_date,
           product_id,
           export_flag,
           export_time,
           fee_desc
      from tb_application;
  commit;

  --Ͷ������ϸ��Ϣ��
  insert /*+ append nologging parallel */
  into tb_app_dtl
    select to_number(application_id) + v_app_id,
           appno,
           policyno,
           app_typ,
           region_code,
           benefit_info,
           add_fee,
           tmp_fee_no,
           main_plc_no,
           fst_pay_typ,
           oth_pay_typ,
           fee_agt_typ,
           fee_acc_bank,
           fee_acc_nam,
           fee_acc_no,
           late_choice,
           bonus_recv_typ,
           death_func,
           argue_typ,
           trial_code,
           sale_cha,
           app_date,
           renewal_flag,
           back_info,
           special_clause,
           data_source,
           status,
           app_operator,
           app_slip_typ,
           sale_src,
           pay_mod,
           bene_avg_flag
      from tb_app_dtl;
  commit;

  ----Ͷ������Ʒ��Ϣ��
  insert /*+ append nologging parallel */
  into tb_app_prd_info
    select app_prd_id + v_app_prd_id,
           to_number(application_id) + v_app_id,
           ins_code,
           main_flag,
           amount,
           pay_lev,
           job_fee,
           pay_typ,
           pay_period,
           ins_period,
           ins_perd_typ,
           recv_typ,
           recv_age,
           fixed_plc_no,
           pieces
      from tb_app_prd_info;
  commit;

  --������Ϣ��  
  insert /*+ append nologging parallel */
  into tb_delivery_info
    select deli_id + v_deli_id,
           to_number(application_id) + v_app_id,
           deli_prov,
           deli_city,
           deli_region,
           deli_dtl,
           deli_adds,
           deli_postcode,
           deli_name,
           deli_phoneno,
           deli_note,
           zone_code,
           mark
      from tb_delivery_info;
  commit;

  --Ͷ���ͻ�������Ϣ��
  insert /*+ append nologging parallel */
  into tb_application_customer
    select app_customer_id + v_cus_id,
           customer_id,
           name,
           mari,
           lic_typ,
           lic_no,
           birthday,
           gender,
           nation,
           huk,
           moto_flag,
           job_code,
           job_code_sec,
           rev,
           height,
           weight,
           customer_typ,
           con_addr_typ_id,
           salary,
           company_name
      from tb_application_customer;
  commit;

  --Ͷ���ͻ���Ͷ������ϵ��
  insert /*+ append nologging parallel */
  into tb_customer_app_rel
    select to_number(application_id) + v_app_id, app_customer_id + v_cus_id
      from tb_customer_app_rel;
  commit;

  --Ͷ���ͻ���ϵ��ʽ��
  insert /*+ append nologging parallel */
  into tb_app_customer_contact
    select cus_con_id + v_cus_con_id,
           app_customer_id + v_cus_id,
           cus_con_typ_id,
           con_value,
           con_note
      from tb_app_customer_contact;
  commit;

  --Ͷ���ͻ���ַ��Ϣ��
  insert /*+ append nologging parallel */
  into tb_app_customer_adds
    select adds_id + v_adds_id,
           app_customer_id + v_cus_id,
           cus_adds_typ_id,
           adds_contry,
           adds_province,
           adds_city,
           adds_detail,
           adds_note,
           adds_postcode,
           adds_region
      from tb_app_customer_adds;
  commit;

  --end loop;

  --�޸�C_ID_BRO
  --Ͷ����������Ϣ��ID
  select to_number(max(t.application_id))
    into v_app_id
    from tb_application t;
  --Ͷ������Ʒ��Ϣ��ID
  select max(t.app_prd_id) into v_app_prd_id from tb_app_prd_info t;
  --������Ϣ��ID
  select max(t.deli_id) into v_deli_id from tb_delivery_info t;
  --Ͷ���ͻ�������Ϣ��ID
  select max(t.app_customer_id)
    into v_cus_id
    from tb_application_customer t;
  --Ͷ���ͻ���ϵ��ʽ��ID
  select max(t.cus_con_id)
    into v_cus_con_id
    from tb_app_customer_contact t;
  --Ͷ���ͻ���ַ��Ϣ��ID
  select max(t.adds_id) into v_adds_id from tb_app_customer_adds t;
  
  update c_id_bro t set t.nextvalue = v_app_id + 1 where t.name = 'tb_application';
  update c_id_bro t set t.nextvalue = v_app_prd_id + 1 where t.name = 'tb_app_prd_info';
  update c_id_bro t set t.nextvalue = v_deli_id + 1 where t.name = 'tb_delivery_info';
  update c_id_bro t set t.nextvalue = v_cus_id + 1 where t.name = 'tb_application_customer';
  update c_id_bro t set t.nextvalue = v_cus_con_id + 1 where t.name = 'tb_app_customer_contact';
  update c_id_bro t set t.nextvalue = v_cus_con_id + 1 where t.name = 'tb_app_customer_adds';
  commit;

exception
  when others then
    begin
      rollback;
      dbms_output.put_line(sqlcode || ':' || sqlerrm);
    end;
END P_TB_APP;
/

prompt
prompt Creating procedure P_TEST
prompt =========================
prompt
create or replace procedure cpic_sxdx.p_test()
begin
     dbms_output.put_line('dfdf');
end
/

prompt
prompt Creating procedure P_TKT_TEST
prompt =============================
prompt
create or replace procedure cpic_sxdx.P_TKT_TEST is

    cursor tmp_zx is select * from ZX;
    cc  tmp_zx%rowtype;
begin
    open tmp_zx;
    loop                 
      Fetch tmp_zx into cc;
    exit when tmp_zx%notfound;
    dbms_output.put_line('id:'||cc.id||'  name:'||cc.name);
  end loop;
  close tmp_zx;

end P_TKT_TEST;
/

prompt
prompt Creating procedure P_T_BILLING_INFO
prompt ===================================
prompt
create or replace procedure cpic_sxdx.P_T_BILLING_INFO is
  v_amount        NUMBER(20, 4); --���ڱ���..
  v_owed          NUMBER; --Ƿ���ڴ�
  v_owed_amount   NUMBER(20, 4); --�ۼ�Ƿ�ɱ���
  v_sprerec_years NUMBER(20); --Ӧ������
  v_pay_sum       NUMBER(20); --�ѽ��ڴ�
  v_years         NUMBER(20); --�ɷѴ���
  v_nextdate      date; --�´νɷ���..
  v_begdate       date; --������ʼ����
  v_paysch        char(2); --�ɷѷ�ʽ

  v_py int;

  cursor cur_policyno is
    select t.policyno from t_billing_info t;
  v_policyno cur_policyno%rowtype;
begin
  open cur_policyno;
  loop

    <<a>>

    fetch cur_policyno
      into v_policyno;
    exit when cur_policyno%notfound;

    begin
      --�´νɷ���
      select (select m.nextdate
                from xq_moneysch m
               where m.policyno = v_policyno.policyno
                 and rownum = 1)
        into v_nextdate
        from dual;

      if v_nextdate is null then
        --dbms_output.put_line('�´νɷ���Ϊ�ջ򲻴���');
        goto a;
      end if;

      --�ɷѷ�ʽ����ɡ����ɡ��½ɣ�
      select (select m.paysch
                from xq_moneysch m
               where m.policyno = v_policyno.policyno
                 and rownum = 1)
        into v_paysch
        from dual;

      --���ڱ��ѡ�������ʼ����
      select (select sum(r.npaylen) * max(r.pieces)
                from xq_riskcon r
               where r.policyno = v_policyno.policyno)
        into v_amount
        from dual;

      if v_amount is null then
        --dbms_output.put_line('���ڱ��ѡ�������ʼ����Ϊ�ջ򲻴���');
        goto a;
      end if;

      --���ڱ��ѡ�������ʼ����
      select (select max(r.begdate)
                from xq_riskcon r
               where r.policyno = v_policyno.policyno)
        into v_begdate
        from dual;

      if v_begdate is null then
        --dbms_output.put_line('���ڱ��ѡ�������ʼ����Ϊ�ջ򲻴���');
        goto a;
      end if;

      --Ӧ������,�ɷ��ڴ�
      select (select max(r.years)
                from xq_reminder r
               where r.policyno = v_policyno.policyno
                 and to_char(r.cover1, 'yyyy-mm') <=
                     to_char(sysdate, 'yyyy-mm'))
        into v_years
        from dual;

      if v_years is null then
        --dbms_output.put_line('Ӧ������,�ɷ��ڴ�Ϊ�ջ򲻴���');
        goto a;
      end if;

      v_sprerec_years := v_years;

      select decode(v_paysch, '11', 3, '12', 6, '13', 12, 1)
        into v_py
        from dual;

      --�ѽ�����=���´νɷ�������-������ʼ�������£�/�ɷѷ�ʽ
      v_pay_sum := floor(months_between(to_date(to_char(v_nextdate, 'yyyy-mm'),
                                          'yyyy-mm'),
                                  to_date(to_char(v_begdate, 'yyyy-mm'),
                                          'yyyy-mm')) / v_py);
      --�ɷ��ڴκ�Ӧ��������Ƿ������=Ӧ������-�ѽ�����
      v_owed := v_sprerec_years - v_pay_sum;
      if v_owed < 0 then
        v_owed := 0;
      end if;
      --�ۼ�Ƿ�ɱ���=���ڱ���*Ƿ������
      v_owed_amount := v_amount * v_owed;

      update t_billing_info f
         set f.amount        = v_amount, --���ڱ���
             f.owed          = v_owed, --Ƿ������
             f.owed_amount   = v_owed_amount, --�ۼ�Ƿ�ɱ���
             f.sprerec_years = v_sprerec_years, --Ӧ������
             f.pay_sum       = v_pay_sum, --�ѽ�����
             f.years         = v_years, --�ɷ��ڴ�
             f.nextdate      = v_nextdate --�´νɷ���
       where f.policyno = v_policyno.policyno;
      commit;
      --dbms_output.put_line('������' || v_nextdate || ','
      --   || v_paysch || ',' || v_amount || ',' || v_begdate || ',' || v_years);

    exception
      when no_data_found then
        begin
          rollback;
          dbms_output.put_line(sqlerrm || ':' || sqlcode);
          dbms_output.put_line(v_nextdate || ',' || v_paysch || ',' ||
                               v_amount || ',' || v_begdate || ',' ||
                               v_years);
        end;
    end;
  end loop;
  close cur_policyno;

exception
  when others then
    begin
      rollback;
      close cur_policyno;
      dbms_output.put_line(sqlerrm || ':' || sqlcode);
    end;
end P_T_BILLING_INFO;
/

prompt
prompt Creating procedure REMOVE_CUST_LIST
prompt ===================================
prompt
create or replace procedure cpic_sxdx.remove_cust_list is
  idsize number(20) := 0;
  minId number(20) := 0;
  maxId number(20) := 0;
begin
  delete from tb_customer_list_rmv;
  commit;
  insert into /*+ append */
  tb_customer_list_rmv r(r.cus_list_id,r.task_id)
    select t.cus_list_id, t.task_id
      from tb_customer_list t, tb_sale_batch t1
     where t.batch_id = t1.batch_id
       and to_date(t1.call_year_month, 'yyyy-MM') < to_date(to_char(sysdate, 'yyyy-MM'),'yyyy-MM')--to_date('2012-12', 'yyyy-MM')
       and (t.call_status = '0' or t.status = '0')
       and t1.batch_type <> 2
       order by t.cus_list_id;
  commit;
  --delete from tb_customer_list_rmv t where exists (select 1 from tb_task_history t1 where t1.cus_list_id = t.cus_list_id);
  --commit;
  select ceil(count(*) / 50000)
    into idsize from tb_customer_list_rmv; 
  
  for j in 0 .. idsize loop
       select nvl(min(cus_list_id),0),nvl(max(cus_list_id),0) into minId,maxId from tb_customer_list_rmv where rownum <=50000;
       --���������ݱ��ݵ��������ݱ�
       insert into /*+ append */ tb_customer_list_remove t2(t2.cus_list_id,t2.cus_unique_ide,t2.cus_name,t2.cus_sex,t2.task_id,t2.org_center,t2.org_proj,t2.org_team,t2.user_id,t2.call_status,t2.status,t2.cus_birthday,t2.cus_age,t2.ide_type,t2.ide_number,t2.cus_metier,t2.mobile,t2.mobile2,t2.contect_tel,t2.home_tel,t2.off_tel,t2.contect_tel_type,t2.detailed_address,t2.postcode,t2.add_type,t2.emergency_con_person,t2.emergency_con_tel,t2.emer_con_relation,t2.contact_detailed_add,t2.contact_postcode,t2.cus_company,t2.metier_level,t2.marital_status,t2.bank_name,t2.bank_account_holder,t2.bank_account,t2.is_vip,t2.batch_id,t2.org_id,t2.creat_user,t2.creat_time,t2.modify_person,t2.modify_time,t2.is_blacklist,t2.fax,t2.res,t2.marital_id,t2.assign_date,t2.is_introduction,t2.introduction_id,t2.remove_type,t2.remove_time)
         select t.cus_list_id,t.cus_unique_ide,t.cus_name,t.cus_sex,t.task_id,t.org_center,t.org_proj,t.org_team,t.user_id,t.call_status,t.status,t.cus_birthday,t.cus_age,t.ide_type,t.ide_number,t.cus_metier,t.mobile,t.mobile2,t.contect_tel,t.home_tel,t.off_tel,t.contect_tel_type,t.detailed_address,t.postcode,t.add_type,t.emergency_con_person,t.emergency_con_tel,t.emer_con_relation,t.contact_detailed_add,t.contact_postcode,t.cus_company,t.metier_level,t.marital_status,t.bank_name,t.bank_account_holder,t.bank_account,t.is_vip,t.batch_id,t.org_id,t.creat_user,t.creat_time,t.modify_person,t.modify_time,t.is_blacklist,t.fax,t.res,t.marital_id,t.assign_date,t.is_introduction,t.introduction_id,'0',sysdate
           from tb_customer_list t, tb_customer_list_rmv t1
          where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId);
       --���������ݱ��ݵ�������ϸ���ݱ�  
       insert into /*+ append */ tb_cus_list_dtl_remove t2(t2.cus_list_id,t2.add_province,t2.add_city,t2.add_area,t2.cus_email,t2.contact_add_province,t2.contact_add_city,t2.contact_add_area,t2.introducer,t2.intro_time,t2.introducer_relation,t2.income,t2.education,t2.travel_mode,t2.own_house,t2.own_child,t2.buy_product,t2.car_type,t2.buy_house_time,t2.house_price,t2.house_area,t2.house_purpose,t2.house_type,t2.interest_type,t2.house_ownership_status,t2.cus_company_assets,t2.res1,t2.res2,t2.res3,t2.res4,t2.own_car)
         select t1.cus_list_id,t1.add_province,t1.add_city,t1.add_area,t1.cus_email,t1.contact_add_province,t1.contact_add_city,t1.contact_add_area,t1.introducer,t1.intro_time,t1.introducer_relation,t1.income,t1.education,t1.travel_mode,t1.own_house,t1.own_child,t1.buy_product,t1.car_type,t1.buy_house_time,t1.house_price,t1.house_area,t1.house_purpose,t1.house_type,t1.interest_type,t1.house_ownership_status,t1.cus_company_assets,t1.res1,t1.res2,t1.res3,t1.res4,t1.own_car
           from tb_cus_list_dtl t1, tb_customer_list_rmv t
          where t1.cus_list_id = t.cus_list_id and (t.cus_list_id between minId and maxId);
       --���������ݱ��ݵ����񱸷ݱ�  
       insert into /*+ append */ tb_task_remove t2(t2.task_id,t2.task_level,t2.create_time,t2.change_time,t2.is_important,t2.appoint_time,t2.active_status,t2.task_memo,t2.callresult_type,t2.first_result,t2.second_result,t2.user_id,t2.org_id,t2.status_id,t2.type_id,t2.policy_id,t2.batch_id,t2.cus_list_id,t2.ext1,t2.ext2,t2.ext3,t2.ext4,t2.ob_com_id,t2.policy_id_cancle)
         select t1.task_id,t1.task_level,t1.create_time,t1.change_time,t1.is_important,t1.appoint_time,t1.active_status,t1.task_memo,t1.callresult_type,t1.first_result,t1.second_result,t1.user_id,t1.org_id,t1.status_id,t1.type_id,t1.policy_id,t1.batch_id,t1.cus_list_id,t1.ext1,t1.ext2,t1.ext3,t1.ext4,t1.ob_com_id,t1.policy_id_cancle
           from tb_task t1, tb_customer_list_rmv t
          where t1.cus_list_id = t.cus_list_id and (t.cus_list_id between minId and maxId);
       --����������ʷ��
       insert into /*+ append */ tb_task_history_remove (HISTORY_ID, TASK_ID, TASK_LEVEL, CREATE_TIME, CHANGE_TIME, IS_IMPORTANT, APPOINT_TIME, ACTIVE_STATUS, TASK_MEMO, CALLRESULT_TYPE, FIRST_RESULT, SECOND_RESULT, USER_ID, ORG_ID, STATUS_ID, TYPE_ID, POLICY_ID, OB_COM_ID, BATCH_ID, CUS_LIST_ID, CREATE_HISTORY_DATE, EXT1, EXT2, EXT3, EXT4, STATUS_ID_LAST, TYPE_ID_LAST)
         select T1.HISTORY_ID, T1.TASK_ID, T1.TASK_LEVEL, T1.CREATE_TIME, T1.CHANGE_TIME, T1.IS_IMPORTANT, T1.APPOINT_TIME, T1.ACTIVE_STATUS, T1.TASK_MEMO, T1.CALLRESULT_TYPE, T1.FIRST_RESULT, T1.SECOND_RESULT, T1.USER_ID, T1.ORG_ID, T1.STATUS_ID, T1.TYPE_ID, T1.POLICY_ID, T1.OB_COM_ID, T1.BATCH_ID, T1.CUS_LIST_ID, T1.CREATE_HISTORY_DATE, T1.EXT1, T1.EXT2, T1.EXT3, T1.EXT4, T1.STATUS_ID_LAST, T1.TYPE_ID_LAST
          from tb_task_history t1, tb_customer_list_rmv t
          where t1.task_id = t.task_id
            and t1.cus_list_id = t.cus_list_id and (t.cus_list_id between minId and maxId);
       --���������޸���־��
       insert into TB_CUS_LIST_MODIFY_LOG_REMOVE (CUS_MODIFY_LOG_ID, CUS_LIST_ID, CUS_UNIQUE_IDE, CUS_NAME, CUS_SEX, ORG_CENTER, ORG_PROJ, ORG_TEAM, USER_ID, STATUS, CUS_BIRTHDAY, CUS_AGE, IDE_TYPE, IDE_NUMBER, CUS_METIER, MOBILE, MOBILE1, MOBILE2, CONTECT_TEL, HOME_TEL, OFF_TEL, CONTECT_TEL_TYPE, DETAILED_ADDRESS, POSTCODE, ADD_TYPE, EMERGENCY_CON_PERSON, EMERGENCY_CON_TEL, EMER_CON_RELATION, CONTACT_DETAILED_ADD, CONTACT_POSTCODE, CUS_COMPANY, METIER_LEVEL, MARITAL_STATUS, BANK_NAME, BANK_ACCOUNT_HOLDER, BANK_ACCOUNT, IS_VIP, BATCH_ID, ORG_ID, CREAT_PERSON, CREAT_TIME, MODIFY_PERSON, MODIFY_TIME, IS_BLACKLIST, FAX, RES)
         select T1.CUS_MODIFY_LOG_ID, T1.CUS_LIST_ID, T1.CUS_UNIQUE_IDE, T1.CUS_NAME, T1.CUS_SEX, T1.ORG_CENTER, T1.ORG_PROJ, T1.ORG_TEAM, T1.USER_ID, T1.STATUS, T1.CUS_BIRTHDAY, T1.CUS_AGE, T1.IDE_TYPE, T1.IDE_NUMBER, T1.CUS_METIER, T1.MOBILE, T1.MOBILE1, T1.MOBILE2, T1.CONTECT_TEL, T1.HOME_TEL, T1.OFF_TEL, T1.CONTECT_TEL_TYPE, T1.DETAILED_ADDRESS, T1.POSTCODE, T1.ADD_TYPE, T1.EMERGENCY_CON_PERSON, T1.EMERGENCY_CON_TEL, T1.EMER_CON_RELATION, T1.CONTACT_DETAILED_ADD, T1.CONTACT_POSTCODE, T1.CUS_COMPANY, T1.METIER_LEVEL, T1.MARITAL_STATUS, T1.BANK_NAME, T1.BANK_ACCOUNT_HOLDER, T1.BANK_ACCOUNT, T1.IS_VIP, T1.BATCH_ID, T1.ORG_ID, T1.CREAT_PERSON, T1.CREAT_TIME, T1.MODIFY_PERSON, T1.MODIFY_TIME, T1.IS_BLACKLIST, T1.FAX, T1.RES
           from TB_CUS_LIST_MODIFY_LOG t1, tb_customer_list_rmv t
          where t1.cus_list_id = t.cus_list_id
            and (t.cus_list_id between minId and maxId);
       --����������ϸ�޸���־��
       insert into TB_CUS_DTL_MODIFY_LOG_REMOVE (CUS_MODIFY_LOG_ID, CUS_LIST_ID, ADD_PROVINCE, ADD_CITY, ADD_AREA, CUS_EMAIL, CONTACT_ADD_PROVINCE, CONTACT_ADD_CITY, CONTACT_ADD_AREA, INTRODUCER, INTRO_TIME, INTRODUCER_RELATION, INCOME, EDUCATION, TRAVEL_MODE, OWN_HOUSE, OWN_CHILD, BUY_PRODUCT, CAR_TYPE, CAR_PRICE, CAR_PURPOSE, BUY_HOUSE_TIME, HOUSE_PRICE, HOUSE_AREA, HOUSE_PURPOSE, HOUSE_TYPE, INTEREST_TYPE, HOUSE_OWNERSHIP_STATUS, CUS_COMPANY_ASSETS, RES1, RES2, RES3, RES4, OWN_CAR)
         select T1.CUS_MODIFY_LOG_ID, T1.CUS_LIST_ID, T1.ADD_PROVINCE, T1.ADD_CITY, T1.ADD_AREA, T1.CUS_EMAIL, T1.CONTACT_ADD_PROVINCE, T1.CONTACT_ADD_CITY, T1.CONTACT_ADD_AREA, T1.INTRODUCER, T1.INTRO_TIME, T1.INTRODUCER_RELATION, T1.INCOME, T1.EDUCATION, T1.TRAVEL_MODE, T1.OWN_HOUSE, T1.OWN_CHILD, T1.BUY_PRODUCT, T1.CAR_TYPE, T1.CAR_PRICE, T1.CAR_PURPOSE, T1.BUY_HOUSE_TIME, T1.HOUSE_PRICE, T1.HOUSE_AREA, T1.HOUSE_PURPOSE, T1.HOUSE_TYPE, T1.INTEREST_TYPE, T1.HOUSE_OWNERSHIP_STATUS, T1.CUS_COMPANY_ASSETS, T1.RES1, T1.RES2, T1.RES3, T1.RES4, T1.OWN_CAR
           from TB_CUS_LIST_DTL_MODIFY_LOG t1, tb_customer_list_rmv t
          where t1.cus_list_id = t.cus_list_id
            and (t.cus_list_id between minId and maxId);

       --ɾ��������ϸ���ݺõ�����
       delete from (select t.* from tb_cus_list_dtl t, tb_customer_list_rmv t1 where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId));
       --ɾ���������ݺõ�����
       delete from (select t.* from tb_customer_list t, tb_customer_list_rmv t1 where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId));
       --ɾ��������ʷ��
       delete from (select t.* from tb_task_history t, tb_customer_list_rmv t1 where t1.task_id = t.task_id and t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId)); 
       --ɾ��������ݺõ�����
       delete from (select t.* from tb_task t, tb_customer_list_rmv t1 where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId)); 
       --ɾ��������ϸ�޸���־��
       delete from (select t.* from TB_CUS_LIST_DTL_MODIFY_LOG t, tb_customer_list_rmv t1 where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId));
       --ɾ�������޸���־��
       delete from (select t.* from TB_CUS_LIST_MODIFY_LOG t, tb_customer_list_rmv t1 where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId));  
       --ɾ����ʱ�������
       delete from tb_customer_list_rmv t1 where (t1.cus_list_id between minId and maxId);
       commit;
   end loop;
end remove_cust_list;
/

prompt
prompt Creating procedure SP_PRO1
prompt ==========================
prompt
create or replace procedure cpic_sxdx.sp_pro1(spName varchar2,newdeptno in out number,newAge number,newSal number) is
   v_max_id tmp_fuyp.id%type;
begin
   select max(id) into v_max_id from tmp_fuyp;
   v_max_id:=v_max_id+1;
   newdeptno:=3;
   insert into tmp_fuyp(id,name,age,deptno,sale) values(v_max_id,spName,newAge,newdeptno,newSal);
end;
/

prompt
prompt Creating procedure TB_CUS_BELONG_INSERT
prompt =======================================
prompt
create or replace procedure cpic_sxdx.tb_cus_belong_insert is

begin
  /**
  * �������������Ϣ��(tb_cus_belong_info)��¼
  * agentid = flagColum �ļ�¼Ϊ�洢����ִ�б�ǣ�����Ϊִ����
  */
  --delete from tb_cus_belong_info t where t.user_id <> 'flagColum';
  update tb_cus_belong_info t
     set t.agentid      = '0',
         t.employeename = to_char(sysdate, 'yyyy-MM-dd HH24:mi:ss')
   where t.user_id = 'flagColum'; --ִ����
  commit;

  /**
  * �û�����������Ϣͳ��
  
  
  * �û���������ͳ�ƹ���
  *    ���ײ���������������� ����״̬ status_id = 6
  *    ���٣�������������� ����״̬ status_id = 5
  *    ʮ���ڵ��ڣ������������� �����Ƴ�����<=sysdate + 10
  *    ���������� ����ʧ�����������
  *    �������˹���������user_id  = �û���use_id
  *    �����û� ��֯ ���ε���Ϣ
  *    20121102Add�ײ���10���ڵ��ڻ���������
  */
  insert into tb_cus_belong_info
    (USER_ID,
     AGENTID,
     EMPLOYEENAME,
     PARENT_ORG_ID,
     ORG_ID,
     ORG_NAME,
     BATCH_ID,
     BATCH_NAME,
     WAIT_ASSIGN_NUM,
     WAIT_CALL_NUM,
     FOLLOW_NUM,
     TEN_NUM,
     WARN_NUM,
     TOTAL_NUM,
     STATUS)
    select u.userid,
           u.AgentId, --��ϯ���ţ�AgentId��
           u.employeename, --��ϯ����
           o.parent_org_id, --�ϼ�����ID
           u.org_id, --����ID
           o.org_name, --��������
           s.batch_id, --����ID
           s.batch_name, --�������� 
           '' as wait_assign_num,
           case t.status_id
             when 6 then
              count(t.status_id)
           end wait_call_num, --���ײ�������
           case t.status_id
             when 5 then
              count(t.status_id)
           end follow_num, --����������
           case
             when s.remove_date <= sysdate + 10 then
              count(s.remove_date)
           end ten_num, --ʮ���ڵ���������
           case
             when (add_months(to_date(s.call_year_month, 'yyyy-MM'), 1) - 23 <=
                  sysdate and (l.call_status = '0' or l.status = '0')) then
              count(s.call_year_month)
           end warn_num, --�ײ���10���ڵ��ڻ���������
           count(*) total_num, --������ 
           0 as status
      from tb_customer_list l,
           tb_task          t,
           tb_sale_batch    s,
           c_user           u,
           c_user_role      cu,
           tb_organization  o
     where u.userid = cu.userid
       and u.userid = l.user_id
       and (cu.roleid = 13 or cu.roleid = '14')
       and u.org_id = o.org_id
       and l.cus_list_id = t.cus_list_id
       and l.task_id = t.task_id
       and t.status_id != 11
       and s.batch_id = l.batch_id
     group by s.batch_id,
              s.batch_name,
              u.userid,
              u.AgentId,
              u.employeename,
              o.parent_org_id,
              u.org_id,
              o.org_name,
              t.status_id,
              s.remove_date,
              call_year_month,
              l.call_status,
              l.status
     order by u.employeename;

  /**
  * ��֯����������Ϣͳ��
  
  * ��֯��������ͳ�ƹ���
  *     �����䣺������������� ����״̬ status_id = 8 
  *    ���ײ���������������� ����״̬ status_id = 6  
  *    ���٣�������������� ����״̬ status_id = 5 ?  ?    
  *    ʮ���ڵ��ڣ������������� �����Ƴ�����<=sysdate + 10  ���¼���֯��
  *    ���������� ����ʧ�����������
  *    �������˹���������org_id = ��ǰ��֯id
  *    ���� ��֯ ���ε���Ϣ
       ��֯��ѯ���缶 07 -- �Ŷ�,06 -- ��Ŀ,05 -- ����������
  */

  insert into tb_cus_belong_info
    (USER_ID,
     AGENTID,
     EMPLOYEENAME,
     PARENT_ORG_ID,
     ORG_ID,
     ORG_NAME,
     BATCH_ID,
     BATCH_NAME,
     WAIT_ASSIGN_NUM,
     WAIT_CALL_NUM,
     FOLLOW_NUM,
     TEN_NUM,
     WARN_NUM,
     TOTAL_NUM,
     STATUS)
    SELECT USERID,
           AGENTID,
           EMPLOYEENAME,
           PARENT_ORG_ID,
           ORG_ID,
           ORG_NAME,
           BATCH_ID,
           BATCH_NAME,
           SUM(WAIT_ASSIGN_NUM),
           SUM(WAIT_CALL_NUM),
           SUM(FOLLOW_NUM),
           SUM(TEN_NUM),
           SUM(WARN_NUM),
           SUM(TOTAL_NUM),
           0 as status
      FROM (SELECT 'org' AS USERID,
                   'org' AS AGENTID, --��ϯ���ţ�AgentId��
                   U.EMPLOYEENAME, --��ϯ����
                   O.PARENT_ORG_ID, --�ϼ�����ID
                   U.ORG_ID, --����ID
                   O.ORG_NAME, --��������
                   S.BATCH_ID, --����ID
                   S.BATCH_NAME, --�������� 
                   CASE T.STATUS_ID
                     WHEN 8 THEN
                      COUNT(T.STATUS_ID)
                   END WAIT_ASSIGN_NUM, --������������               
                   CASE T.STATUS_ID
                     WHEN 6 THEN
                      COUNT(T.STATUS_ID)
                   END WAIT_CALL_NUM, --���ײ�������
                   CASE T.STATUS_ID
                     WHEN 5 THEN
                      COUNT(T.STATUS_ID)
                   END FOLLOW_NUM, --����������
                   CASE
                     WHEN S.REMOVE_DATE <= SYSDATE + 10 THEN
                      COUNT(S.REMOVE_DATE)
                   END TEN_NUM, --ʮ���ڵ���������
                   CASE
                     WHEN (add_months(to_date(s.call_year_month, 'yyyy-MM'),
                                      1) - 10 <= sysdate and
                          (l.call_status = '0' or l.status = '0')) THEN
                      COUNT(S.call_year_month)
                   END WARN_NUM, --�ײ���10���ڵ��ڻ���������
                   COUNT(*) TOTAL_NUM --������  
              FROM TB_CUSTOMER_LIST L,
                   TB_TASK          T,
                   TB_SALE_BATCH    S,
                   C_USER           U,
                   TB_ORGANIZATION  O,
                   C_USER_ROLE      CU
             WHERE U.USERID = CU.USERID
               AND (CU.ROLEID = '12' or CU.ROLEID = '11' or CU.ROLEID = '9' or
                   CU.ROLEID = '7')
               AND U.ORG_ID = O.ORG_ID
               AND L.CUS_LIST_ID = T.CUS_LIST_ID
               AND L.TASK_ID = T.TASK_ID
               AND T.STATUS_ID != 11
               AND S.BATCH_ID = L.BATCH_ID
               AND L.ORG_ID = U.ORG_ID
               AND L.USER_ID IS NULL
             GROUP BY S.BATCH_ID,
                      S.BATCH_NAME,
                      U.AGENTID,
                      U.EMPLOYEENAME,
                      O.PARENT_ORG_ID,
                      U.ORG_ID,
                      O.ORG_NAME,
                      T.STATUS_ID,
                      S.REMOVE_DATE,
                      S.CALL_YEAR_MONTH,
                      L.CALL_STATUS,
                      L.STATUS)
     GROUP BY USERID,
              AGENTID,
              EMPLOYEENAME,
              PARENT_ORG_ID,
              ORG_ID,
              ORG_NAME,
              BATCH_ID,
              BATCH_NAME;
  /**
  * agentid = flagColum �ļ�¼Ϊ�洢����ִ�б�ǣ�����Ϊִ�����
  */
  update tb_cus_belong_info t
     set t.agentid = '1'
   where t.user_id = 'flagColum'; --ִ�������         
  commit;

  /**
  * ɾ����Ч����
  */
  delete from tb_cus_belong_info t
   where t.status = 1
     and t.user_id <> 'flagColum';
  commit;

  /**
  * ���±��β�������Ϊ��Ч����
  */
  update tb_cus_belong_info t set t.status = '1' where t.status = 0;
  commit;

exception
  when no_data_found then
    dbms_output.put_line('����δ�ҵ�');
  when others then
    -- ��¼������־
    dbms_output.put_line('�洢����ִ��ʧ��:' || Sqlerrm);
    update tb_cus_belong_info t
       set t.status = '1'
     where t.user_id = 'flagColum'; --ִ�������
    --insert tb_log (?,?,?)
    commit;
  
end tb_cus_belong_insert;
/

prompt
prompt Creating procedure TEST11
prompt =========================
prompt
create or replace procedure cpic_sxdx.test11 is
  output varchar2(200) := '244';
  cursor cur1 is
    select count(1)
      from tb_organization o
     where o.org_id in ('732', '733');
  org_name number;
begin
elseif
  open cur1;
  loop
    fetch cur1
      into org_name;
    exit when cur1%notfound;
    dbms_output.put_line(org_name);
    exception
      
  end loop;
  close cur1;

end test11;
/

prompt
prompt Creating procedure U_TEST
prompt =========================
prompt
create or replace procedure cpic_sxdx.U_test(p1 number, p2 in varchar2,p3 out varchar2) is

begin
  p3 := 'out';
  --p1  Ĭ��Ϊin����     ���ɸ�ֵ
  dbms_output.put_line(p1);
  --p2  in����   ���ɸ�ֵ
  dbms_output.put_line(p2);
  dbms_output.put_line(p3);
  
end U_test;
/


spool off
