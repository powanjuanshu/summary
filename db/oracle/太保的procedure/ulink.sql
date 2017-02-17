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
  is '客户临时表';
comment on column CPIC_SXDX.CUST_LIST_RSLT.cus_id
  is '客户ID';
comment on column CPIC_SXDX.CUST_LIST_RSLT.customer_name
  is '客户名称';
comment on column CPIC_SXDX.CUST_LIST_RSLT.batch_code
  is '批次编号';
comment on column CPIC_SXDX.CUST_LIST_RSLT.batch_name
  is '批次名称';
comment on column CPIC_SXDX.CUST_LIST_RSLT.center_id
  is '电销中心ID';
comment on column CPIC_SXDX.CUST_LIST_RSLT.task_code
  is '任务ID';
comment on column CPIC_SXDX.CUST_LIST_RSLT.status
  is '名单生成标志  1表示已生成，0表示未生成';
comment on column CPIC_SXDX.CUST_LIST_RSLT.issue
  is '下发标识';
comment on column CPIC_SXDX.CUST_LIST_RSLT.code_type
  is '证件类型';
comment on column CPIC_SXDX.CUST_LIST_RSLT.customer_id
  is '证件号码';
comment on column CPIC_SXDX.CUST_LIST_RSLT.gender_code
  is '性别(性别:

01:男

02:女)';
comment on column CPIC_SXDX.CUST_LIST_RSLT.birthday
  is '出生日期';
comment on column CPIC_SXDX.CUST_LIST_RSLT.age
  is '年龄';
comment on column CPIC_SXDX.CUST_LIST_RSLT.job_name
  is '职业';
comment on column CPIC_SXDX.CUST_LIST_RSLT.phone1
  is '移动电话1';
comment on column CPIC_SXDX.CUST_LIST_RSLT.phone2
  is '移动电话2';
comment on column CPIC_SXDX.CUST_LIST_RSLT.phone3
  is '移动电话3';
comment on column CPIC_SXDX.CUST_LIST_RSLT.family_phone
  is '家庭电话';
comment on column CPIC_SXDX.CUST_LIST_RSLT.import_time
  is '创建时间';
comment on column CPIC_SXDX.CUST_LIST_RSLT.create_by
  is '创建人';
comment on column CPIC_SXDX.CUST_LIST_RSLT.update_by
  is '修改人';
comment on column CPIC_SXDX.CUST_LIST_RSLT.office_phone
  is '单位电话';
comment on column CPIC_SXDX.CUST_LIST_RSLT.phone_flage
  is '常用电话标志';
comment on column CPIC_SXDX.CUST_LIST_RSLT.address
  is '固定地址(联系地址)';
comment on column CPIC_SXDX.CUST_LIST_RSLT.postcode
  is '邮编(联系地址)';
comment on column CPIC_SXDX.CUST_LIST_RSLT.car_type
  is '车型名称';
comment on column CPIC_SXDX.CUST_LIST_RSLT.car_price
  is '车价';
comment on column CPIC_SXDX.CUST_LIST_RSLT.use_property
  is '使用性质';
comment on column CPIC_SXDX.CUST_LIST_RSLT.housing_purchase_time
  is '房屋购置时间';
comment on column CPIC_SXDX.CUST_LIST_RSLT.housing_purchase_price
  is '房屋购置价';
comment on column CPIC_SXDX.CUST_LIST_RSLT.construction_area
  is '房屋建筑面积';
comment on column CPIC_SXDX.CUST_LIST_RSLT.housing_use
  is '房产用途';
comment on column CPIC_SXDX.CUST_LIST_RSLT.property_types
  is '房产类型';
comment on column CPIC_SXDX.CUST_LIST_RSLT.interest_types
  is '兴趣爱好';
comment on column CPIC_SXDX.CUST_LIST_RSLT.home_ownership_status
  is '住宅所有权状况';
comment on column CPIC_SXDX.CUST_LIST_RSLT.other_company_financial_assets
  is '其他公司金融资产';
comment on column CPIC_SXDX.CUST_LIST_RSLT.province
  is '省(联系地址)';
comment on column CPIC_SXDX.CUST_LIST_RSLT.city
  is '市(联系地址)';
comment on column CPIC_SXDX.CUST_LIST_RSLT.county
  is '区县(联系地址)';
comment on column CPIC_SXDX.CUST_LIST_RSLT.delivery_province
  is '配送省';
comment on column CPIC_SXDX.CUST_LIST_RSLT.delivery_city
  is '配送市';
comment on column CPIC_SXDX.CUST_LIST_RSLT.delivery_county
  is '配送区县';
comment on column CPIC_SXDX.CUST_LIST_RSLT.delivery_address
  is '配送地址详址';
comment on column CPIC_SXDX.CUST_LIST_RSLT.delivery_postcode
  is '配送地址邮编';
comment on column CPIC_SXDX.CUST_LIST_RSLT.is_sms
  is '是否短信禁止';
comment on column CPIC_SXDX.CUST_LIST_RSLT.has_child
  is '是否有孩子';
comment on column CPIC_SXDX.CUST_LIST_RSLT.has_house
  is '是否有房';
comment on column CPIC_SXDX.CUST_LIST_RSLT.travel_mode
  is '出行方式';
comment on column CPIC_SXDX.CUST_LIST_RSLT.isvip
  is '是否寿险VIP';
comment on column CPIC_SXDX.CUST_LIST_RSLT.account_no
  is '账号';
comment on column CPIC_SXDX.CUST_LIST_RSLT.account_name
  is '账户姓名';
comment on column CPIC_SXDX.CUST_LIST_RSLT.bank_name
  is '银行';
comment on column CPIC_SXDX.CUST_LIST_RSLT.marital_status
  is '婚姻状况';
comment on column CPIC_SXDX.CUST_LIST_RSLT.education_level
  is '教育水平';
comment on column CPIC_SXDX.CUST_LIST_RSLT.income
  is '年收入';
comment on column CPIC_SXDX.CUST_LIST_RSLT.career_level
  is '职业等级';
comment on column CPIC_SXDX.CUST_LIST_RSLT.company_address
  is '工作单位';
comment on column CPIC_SXDX.CUST_LIST_RSLT.emergency_contact_phone
  is '紧急联络人电话';
comment on column CPIC_SXDX.CUST_LIST_RSLT.emergency_contact_name
  is '紧急联络人姓名';
comment on column CPIC_SXDX.CUST_LIST_RSLT.email
  is '电子邮件';
comment on column CPIC_SXDX.CUST_LIST_RSLT.add_type
  is '地址类型';
comment on column CPIC_SXDX.CUST_LIST_RSLT.remark1
  is '备注1';
comment on column CPIC_SXDX.CUST_LIST_RSLT.remark2
  is '备注2';
comment on column CPIC_SXDX.CUST_LIST_RSLT.remark3
  is '备注3';
comment on column CPIC_SXDX.CUST_LIST_RSLT.remark4
  is '备注4';
comment on column CPIC_SXDX.CUST_LIST_RSLT.products
  is '已购产品';
comment on column CPIC_SXDX.CUST_LIST_RSLT.reclined
  is '坐席';
comment on column CPIC_SXDX.CUST_LIST_RSLT.contract_phone
  is '联系电话';
comment on column CPIC_SXDX.CUST_LIST_RSLT.relationship
  is '紧急联络人与客户关系';
comment on column CPIC_SXDX.CUST_LIST_RSLT.org_id
  is '机构流水号';
comment on column CPIC_SXDX.CUST_LIST_RSLT.fax
  is '传真';
comment on column CPIC_SXDX.CUST_LIST_RSLT.introducer
  is '介绍人';
comment on column CPIC_SXDX.CUST_LIST_RSLT.introduce_time
  is '转介绍时间';
comment on column CPIC_SXDX.CUST_LIST_RSLT.introducer_relationship
  is '与介绍人关系';
comment on column CPIC_SXDX.CUST_LIST_RSLT.has_car
  is '是否有车';
comment on column CPIC_SXDX.CUST_LIST_RSLT.customer_flg
  is '客户唯一标识';
comment on column CPIC_SXDX.CUST_LIST_RSLT.row_num
  is '数据在excel里面的行数';
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
  is 'SQL源';
comment on column CPIC_SXDX.C_ART_ALL_SOURCES.object_id
  is 'ID';
comment on column CPIC_SXDX.C_ART_ALL_SOURCES.object_group_id
  is '组编号';
comment on column CPIC_SXDX.C_ART_ALL_SOURCES.line_number
  is '编号';
comment on column CPIC_SXDX.C_ART_ALL_SOURCES.query_id
  is '查询ID';
comment on column CPIC_SXDX.C_ART_ALL_SOURCES.text_info
  is '内容信息';
comment on column CPIC_SXDX.C_ART_ALL_SOURCES.tenementid
  is '租户ID';
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
  is '数据源

NAME：唯一。
URL+uesrId：唯一。';
comment on column CPIC_SXDX.C_ART_DATABASES."tenementid"
  is '租户ID';
comment on column CPIC_SXDX.C_ART_DATABASES.database_type
  is 'ORACLE/MYSQL/HBSQL...';
comment on column CPIC_SXDX.C_ART_DATABASES."isdefault"
  is '是否默认。0否。默认0
1是。';
comment on column CPIC_SXDX.C_ART_DATABASES."isdel"
  is '默认0
是1';
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
  is '模板明细查询';
comment on column CPIC_SXDX.C_ART_DRILLDOWN_QUERIES.drilldown_query_position
  is '排序';
comment on column CPIC_SXDX.C_ART_DRILLDOWN_QUERIES."tenementid"
  is '租户ID';
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
  is '定时任务';
comment on column CPIC_SXDX.C_ART_JOBS."tenementid"
  is '租户ID';
comment on column CPIC_SXDX.C_ART_JOBS.mail_tos
  is '发送至EMAIL';
comment on column CPIC_SXDX.C_ART_JOBS.subject
  is '标题';
comment on column CPIC_SXDX.C_ART_JOBS.message
  is '内容';
comment on column CPIC_SXDX.C_ART_JOBS.next_run_date
  is '下次运行时间';
comment on column CPIC_SXDX.C_ART_JOBS.active_status
  is '状态';
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
  is '租户ID';

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
  is '定时任务参数';
comment on column CPIC_SXDX.C_ART_JOBS_PARAMETERS."tenementid"
  is '租户ID';

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
  is '输出格式';
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
  is '定时任务时间设置';
comment on column CPIC_SXDX.C_ART_JOB_SCHEDULES."tenementid"
  is '租户ID';
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
  is '日志';
comment on column CPIC_SXDX.C_ART_LOGS."tenementid"
  is '租户ID';

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
  is '报表';
comment on column CPIC_SXDX.C_ART_QUERIES.query_group_id
  is '模板组，C_ART_QUERY_GROUPS外键';
comment on column CPIC_SXDX.C_ART_QUERIES.uses_rules
  is '不使用';
comment on column CPIC_SXDX.C_ART_QUERIES.database_id
  is '数据源';
comment on column CPIC_SXDX.C_ART_QUERIES.query_type
  is '模板类型';
comment on column CPIC_SXDX.C_ART_QUERIES.contact_person
  is '联系人';
comment on column CPIC_SXDX.C_ART_QUERIES.active_status
  is '状态';
comment on column CPIC_SXDX.C_ART_QUERIES.x_axis_label
  is 'X轴描述';
comment on column CPIC_SXDX.C_ART_QUERIES.y_axis_label
  is 'Y轴描述';
comment on column CPIC_SXDX.C_ART_QUERIES.graph_options
  is '图像属性';
comment on column CPIC_SXDX.C_ART_QUERIES.update_date
  is '更新日期';
comment on column CPIC_SXDX.C_ART_QUERIES.tenementid
  is '租户ID';
comment on column CPIC_SXDX.C_ART_QUERIES.refushtype
  is '刷新方式,0:通知刷新;1:页面刷新';
comment on column CPIC_SXDX.C_ART_QUERIES.isrealtime
  is '是否实时报表,0:否,1:是';
comment on column CPIC_SXDX.C_ART_QUERIES.grouptype
  is '默认0。报表组（常规） 1。字典 2。示例';
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
  is '报表授权';

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
  is '报表参数表';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.tenementid
  is '租户ID';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.field_position
  is '排序';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.field_class
  is '参数类型';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.default_value
  is '默认值';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.param_type
  is '单选/复选';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.use_lov
  is '是否使用字典模板';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.apply_rules_to_lov
  is '级联使用字典模板';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.lov_query_id
  is '字典模板ID';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.chained_param_position
  is '级联参数位置';
comment on column CPIC_SXDX.C_ART_QUERY_FIELDS.chained_value_position
  is '级联值位置';
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
  is '报表组';
comment on column CPIC_SXDX.C_ART_QUERY_GROUPS.query_group_id
  is 'ID主键';
comment on column CPIC_SXDX.C_ART_QUERY_GROUPS.name
  is '名称';
comment on column CPIC_SXDX.C_ART_QUERY_GROUPS.description
  is '描述';
comment on column CPIC_SXDX.C_ART_QUERY_GROUPS.createdate
  is '创建时间';
comment on column CPIC_SXDX.C_ART_QUERY_GROUPS.userid
  is '系统用户';
comment on column CPIC_SXDX.C_ART_QUERY_GROUPS.tenementid
  is '租户ID';
comment on column CPIC_SXDX.C_ART_QUERY_GROUPS.grouptype
  is '默认0。报表组（常规）
1。字典
2。示例';
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
  is '模板+Job+输出格式关系表';

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
  is '报表组';
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
  is '租户ID';
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
  is '输出格式';
comment on column CPIC_SXDX.C_ART_VIEW_MODEL.view_mode
  is '模版编号';
comment on column CPIC_SXDX.C_ART_VIEW_MODEL.name
  is '模版名称';
comment on column CPIC_SXDX.C_ART_VIEW_MODEL.description
  is '描述';
comment on column CPIC_SXDX.C_ART_VIEW_MODEL.code_desc
  is '代码';
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
  is '公告通知';
comment on column CPIC_SXDX.C_BULLETIN.bulletinid
  is '公告通知主键！';
comment on column CPIC_SXDX.C_BULLETIN.title
  is '标题！';
comment on column CPIC_SXDX.C_BULLETIN.content
  is '内容（汉字长度:500）';
comment on column CPIC_SXDX.C_BULLETIN.createuserid
  is '创建人';
comment on column CPIC_SXDX.C_BULLETIN.createdatetime
  is '创建时间，精确到时间！';
comment on column CPIC_SXDX.C_BULLETIN.efficientdate
  is '公告生效时间,必输字段(精确到日)';
comment on column CPIC_SXDX.C_BULLETIN.invalidate
  is '公告失交时间,必输字段(精确到日)';
comment on column CPIC_SXDX.C_BULLETIN.ispublished
  is '是否已发布,默认0,1是';
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
  is '公告通知附件表';
comment on column CPIC_SXDX.C_BULLETIN_ATTACHMENT.file_id
  is 'FILE_ID';
comment on column CPIC_SXDX.C_BULLETIN_ATTACHMENT.bulletinid
  is '公告通知主键！';
comment on column CPIC_SXDX.C_BULLETIN_ATTACHMENT.contenttype
  is '文件类型parent_code=faqfiletype

txt：文本类型
html：超文本类型
doc：word2007及兼容格式
docx：word2010及兼容格式
pdf：pdf文档
swf：flash的swf文档
';
comment on column CPIC_SXDX.C_BULLETIN_ATTACHMENT.pathfilename
  is 'FAQ正文。仅保存文件名，具体文件放在FTP服务器上。
路径组成：
1. 由FAQToken中getFaqFtpServerInfo得到路径+pathfilename字段存的文件名与路径
2.字段中保存的路径格式为：
CATEGORYID/创建时间(格式:YYYYMMDD)/用户ID (USERID)_YYYYMMYYHHMISS.后缀';
comment on column CPIC_SXDX.C_BULLETIN_ATTACHMENT.isimgage
  is '是否为图片，默认0。是为1.
';
comment on column CPIC_SXDX.C_BULLETIN_ATTACHMENT.naturefilename
  is '上传文件的实际文件名（含后缀）';
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
  is '公告通知分发表;
直接发给系统用户！';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER.deliverid
  is '分发表编号';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER.bulletinid
  is 'c_bullite表外键:公告通知主键';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER.receiveuserid
  is '接收用户';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER.isreaded
  is '是否已读？';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER.groupid
  is '分发的用户组ID';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER.senduserid
  is '发送人';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER.senddate
  is '发送时间';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER.ismarquee
  is '是否发布跑马灯,默认0';
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
  is '按公司机构公告读取标志明细表（有记录说明该用户已读取当前该公告，无记录则说明未读取该公告）';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER_DETAIL.detailid
  is '公司分发明细主键';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER_DETAIL.deliverid
  is '分发表编号(c_bulletin_deliver)';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER_DETAIL.bulletinid
  is '公告编号(c_bulletin)';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER_DETAIL.groupid
  is '机构组';
comment on column CPIC_SXDX.C_BULLETIN_DELIVER_DETAIL.userid
  is '已读用户';
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
  is '多媒体状态，对应ContactTypeFactoryToken.java以MEDIAL_STATUS开头的常量';
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
  is '渠道方向，常量：ContactTypeFactoryToken.java中以CONTACT_DIRECT开头的常量';
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
  is '渠道与厂商的字典表';
comment on column CPIC_SXDX.C_CONTACT_FACTORY.factorycode
  is '厂商代码';
comment on column CPIC_SXDX.C_CONTACT_FACTORY.isdel
  is '1删除,默认0';
comment on column CPIC_SXDX.C_CONTACT_FACTORY.remark
  is '说明';
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
  is '联络方式（渠道方式）

phone：语音(电话)
email：Email(电子邮件)
microblog.微博
instant.即时通讯
faq.传真';
comment on column CPIC_SXDX.C_CONTACT_TYPE.typecode
  is '类型代码';
comment on column CPIC_SXDX.C_CONTACT_TYPE.name
  is '名称';
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
  is '呼叫历史管理';
comment on column CPIC_SXDX.C_CALLHISTORY.callhistoryid
  is '呼叫历史编号';
comment on column CPIC_SXDX.C_CALLHISTORY.calid
  is '如果是 typecode=voice,则calid为cti随路数据传入的数值(用于录音调听时用）
如果是多媒体，则为多媒体文件对应的路径与文件名。

源ID（录音为callId）
邮件与Email 等，再定制。';
comment on column CPIC_SXDX.C_CALLHISTORY.direct
  is '方向
1：入
2：出

对应常量：ContactTypeFactoryToken.java中的CONTACT_DIRECT_INCOME
对应常量：ContactTypeFactoryToken.java中的CONTACT_DIRECT_OUTBOUND
';
comment on column CPIC_SXDX.C_CALLHISTORY.begintime
  is '开始时间';
comment on column CPIC_SXDX.C_CALLHISTORY.endtime
  is '结束时间';
comment on column CPIC_SXDX.C_CALLHISTORY.thisno
  is '我方号码(座席分机)';
comment on column CPIC_SXDX.C_CALLHISTORY.userid
  is '当前用户编号';
comment on column CPIC_SXDX.C_CALLHISTORY.agentid
  is '座席端号码
typecode=voice时，为工号
typecode=email时，为邮件地址
teypecode=msg时，为短信地址
...';
comment on column CPIC_SXDX.C_CALLHISTORY.descno
  is '客户号码';
comment on column CPIC_SXDX.C_CALLHISTORY.tenementid
  is '租户';
comment on column CPIC_SXDX.C_CALLHISTORY.contacttypecode
  is '渠道类型。渠道方式：C_contact_type表  由常量类：ContactTypeFactoryToken.java中“CONTACT_TYPE_"头的常量表示';
comment on column CPIC_SXDX.C_CALLHISTORY.cusid
  is '客户编号

客户表外键 c_cus_bas表外键。';
comment on column CPIC_SXDX.C_CALLHISTORY.ispredict
  is '是否为预测试外呼的联系历史。';
comment on column CPIC_SXDX.C_CALLHISTORY.ivrtrace
  is 'IVR按钮记录
中间用“|”线分隔？';
comment on column CPIC_SXDX.C_CALLHISTORY.fromcallhistoryid
  is '来源历史';
comment on column CPIC_SXDX.C_CALLHISTORY.medialstatus
  is '多媒体状态';
comment on column CPIC_SXDX.C_CALLHISTORY.factorycode
  is '厂商号';
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
  is '工单基本表

只有新增加的记录：当处理人与分配人才有可能相同。
caseLogid如果为空，则代码新增记录。

在来电弹屏与外呼营销界面上的录单时：
判断当前getcurrentCallHistoryId()是否为空。如果不为空，则创建关系表c_callhistory_case关系表。';
comment on column CPIC_SXDX.C_CASE_BAS.caseid
  is '工单编号';
comment on column CPIC_SXDX.C_CASE_BAS.fromgroupid
  is '源组';
comment on column CPIC_SXDX.C_CASE_BAS.fromuserid
  is '源系统用户';
comment on column CPIC_SXDX.C_CASE_BAS.togroupid
  is '分配给机构组';
comment on column CPIC_SXDX.C_CASE_BAS.touserid
  is '分配用户';
comment on column CPIC_SXDX.C_CASE_BAS.casestatus
  is '工单状态


订单状态

数据字典：
parentId=caseStatus


共享内置字典-->
（对应常量 flowstatustoken.java中以caes_status开头的常量）
00：待接收
01：待处理
02：处理中
90：完成
91：取消';
comment on column CPIC_SXDX.C_CASE_BAS.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_CASE_BAS.busitype
  is '业务类型（树状）

数据字典：

parentId=busiType';
comment on column CPIC_SXDX.C_CASE_BAS.cus_id
  is '客户编号';
comment on column CPIC_SXDX.C_CASE_BAS.task_id
  is '任务编号';
comment on column CPIC_SXDX.C_CASE_BAS.fromcaseid
  is '来源工单';
comment on column CPIC_SXDX.C_CASE_BAS.summary
  is '工单小结';
comment on column CPIC_SXDX.C_CASE_BAS.caseno
  is '工单号';
comment on column CPIC_SXDX.C_CASE_BAS.createdate
  is '创建时间';
comment on column CPIC_SXDX.C_CASE_BAS.lastupdatedate
  is '最后一次处理时间

与caseLog的创建时间相同';
comment on column CPIC_SXDX.C_CASE_BAS.productid
  is '产品编号';
comment on column CPIC_SXDX.C_CASE_BAS.productsuiteid
  is '套餐编号';
comment on column CPIC_SXDX.C_CASE_BAS.isflow
  is '是否通过工作流审批。
0否（默认），1是';
comment on column CPIC_SXDX.C_CASE_BAS.flowid
  is '流程编号';
comment on column CPIC_SXDX.C_CASE_BAS.source
  is '工单来源
1.来电弹屏
2.当前任务
0.普通

对应tasktoken.CASE_SOURCE_开头常量';
comment on column CPIC_SXDX.C_CASE_BAS.createuserid
  is '创建人';
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
  is '历史与工单关系表';
comment on column CPIC_SXDX.C_CALLHISTORY_CASE.id
  is '主键编号';
comment on column CPIC_SXDX.C_CALLHISTORY_CASE.callhistoryid
  is '服务历史编号';
comment on column CPIC_SXDX.C_CALLHISTORY_CASE.caseid
  is '工单表编号 c_case_bas外键。';
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
  is '多媒体内容表(pathFileName和content两者有一个不为空！)';
comment on column CPIC_SXDX.C_CALLHISTORY_MEDIAL.medialid
  is '多媒体内容表编号';
comment on column CPIC_SXDX.C_CALLHISTORY_MEDIAL.callhistoryid
  is '服务历史编号';
comment on column CPIC_SXDX.C_CALLHISTORY_MEDIAL.pathfilename
  is 'FTP上的文件与附件。';
comment on column CPIC_SXDX.C_CALLHISTORY_MEDIAL.ismain
  is '是否为正文。
1是。默认0';
comment on column CPIC_SXDX.C_CALLHISTORY_MEDIAL.content
  is '正文。短信记录在该字段里，如要是传真等存在ftp服务器上。';
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
  is '订单基本表


只有新增加的记录：当处理人与分配人才有可能相同。
caseLogid如果为空，则代码新增记录。



在来电弹屏与外呼营销界面上的录单时：
判断当前getcurrentCallHistoryId()是否为空。如果不为空，则创建关系表c_callhistory_order关系表。';
comment on column CPIC_SXDX.C_ORDER_BAS.orderid
  is '工单编号';
comment on column CPIC_SXDX.C_ORDER_BAS.fromgroupid
  is '源组';
comment on column CPIC_SXDX.C_ORDER_BAS.fromuserid
  is '源系统用户';
comment on column CPIC_SXDX.C_ORDER_BAS.togroupid
  is '分配给机构组';
comment on column CPIC_SXDX.C_ORDER_BAS.touserid
  is '分配用户';
comment on column CPIC_SXDX.C_ORDER_BAS.orderstatus
  is '订单状态

数据字典：
parentId=orderStatus


共享内置字典-->
（对应常量 flowstatustoken.java中以order_status开头的常量）

00：待接收
01：待处理
02：处理中
03：完成
04：取消


';
comment on column CPIC_SXDX.C_ORDER_BAS.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_ORDER_BAS.busitype
  is '业务类型（树状）

数据字典：

parentId=busiType';
comment on column CPIC_SXDX.C_ORDER_BAS.cus_id
  is '客户编号';
comment on column CPIC_SXDX.C_ORDER_BAS.task_id
  is '任务编号';
comment on column CPIC_SXDX.C_ORDER_BAS.summary
  is '工单小结';
comment on column CPIC_SXDX.C_ORDER_BAS.caseno
  is '订单号';
comment on column CPIC_SXDX.C_ORDER_BAS.createdate
  is '创建时间';
comment on column CPIC_SXDX.C_ORDER_BAS.lastupdatedate
  is '最后一次处理时间';
comment on column CPIC_SXDX.C_ORDER_BAS.productid
  is '产品编号';
comment on column CPIC_SXDX.C_ORDER_BAS.productsuiteid
  is '套餐编号';
comment on column CPIC_SXDX.C_ORDER_BAS.isflow
  is '是否通过工作流审批。
0否（默认），1是';
comment on column CPIC_SXDX.C_ORDER_BAS.flowid
  is '流程编号';
comment on column CPIC_SXDX.C_ORDER_BAS.source
  is '订单来源


1.来电弹屏
2.当前任务
0.普通

对应tasktoken.ORDRE_SOURCE_开头常量';
comment on column CPIC_SXDX.C_ORDER_BAS.createuserid
  is '创建人';
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
  is '历史与订单关系表';
comment on column CPIC_SXDX.C_CALLHISTORY_ORDER.id
  is '主键编号';
comment on column CPIC_SXDX.C_CALLHISTORY_ORDER.callhistoryid
  is '服务历史编号';
comment on column CPIC_SXDX.C_CALLHISTORY_ORDER.orderid
  is '订单表编号 c_ORDER_bas外键。';
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
  is '任务状态主表


对应TaskToken.java中“TASK_STATUS”开头的常量

	public static final Long TASK_STATUS_WAITINGASIGN=new Long(100);  //待分配
	public static final Long TASK_STATUS_WAITINGACCEPT=new Long(101); //待接收
	public static final Long TASK_STATUS_ACCEPTDEALING=new Long(102); //待处理
	public static final Long TASK_STATUS_DEALING=new Long(103);       //跟踪
	public static final Long TASK_STATUS_RECALL=new Long(104);        //回呼
	public static final Long TASK_STATUS_SUCCESS=new Long(105);       //成功
	public static final Long TASK_STATUS_FAIL=new Long(106);          //失败
	public static final Long TASK_STATUS_CANCEL=new Long(107);        //取消
	public static final Long TASK_STATUS_OTHER=new Long(108);         //其他
	public static final Long TASK_STATUS_BACK=new Long(109);          //退回：退回到分配人
	public static final Long TASK_STATUS_FINISH=new Long(110);        //完成


任务小结里不能选择的状态有：待分配、待接收、取消';
comment on column CPIC_SXDX.C_TASK_STATUS.taskstatusid
  is '状态编号,手工输入，数值。

共享编号：
101：待分配
102：待处理        备注：新分配给指定座席的任务
103：跟踪
104：回呼
105：待审批（走工作流）
106：成功
107：失败';
comment on column CPIC_SXDX.C_TASK_STATUS.isdel
  is '是否删除。1是。0否（默认）';
comment on column CPIC_SXDX.C_TASK_STATUS.name
  is '任务状态';
comment on column CPIC_SXDX.C_TASK_STATUS.remark
  is '备注';
comment on column CPIC_SXDX.C_TASK_STATUS.disorder
  is '排序字段';
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
  is '任务状态：二级状态

编号可自定义';
comment on column CPIC_SXDX.C_TASK_STATUS_CHILD.taskstatuschildid
  is '子状态编号。';
comment on column CPIC_SXDX.C_TASK_STATUS_CHILD.taskstatusid
  is '状态编号';
comment on column CPIC_SXDX.C_TASK_STATUS_CHILD.tasktypeid
  is '任务类别

对应常量：
TaskToken.java中以“TASK_TYPE_”开头的常量10：外呼营销
TaskToken.java中以“TASK_TYPE_”开头的常量';
comment on column CPIC_SXDX.C_TASK_STATUS_CHILD.name
  is '名称


名称、任务类别、状态、租户：四者唯一。';
comment on column CPIC_SXDX.C_TASK_STATUS_CHILD.isdel
  is '是否删除。1是。0否(默认)';
comment on column CPIC_SXDX.C_TASK_STATUS_CHILD.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_TASK_STATUS_CHILD.disorder
  is '排序';
comment on column CPIC_SXDX.C_TASK_STATUS_CHILD.remark
  is '备注';
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
  is '营销题项

如果在c_ob_compaign_top表中已有关联记录。则不能删除。否则可以做物理删除。';
comment on column CPIC_SXDX.C_OB_TOPIC.topicid
  is '题项编号';
comment on column CPIC_SXDX.C_OB_TOPIC.name
  is '题项名称';
comment on column CPIC_SXDX.C_OB_TOPIC.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_OB_TOPIC.createuserid
  is '创建用户';
comment on column CPIC_SXDX.C_OB_TOPIC.createdate
  is '创建时间';
comment on column CPIC_SXDX.C_OB_TOPIC.isdel
  is '1是.0否（默认）';
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
  is '营销活动表';
comment on column CPIC_SXDX.C_OB_COMPAIGN.compaignid
  is '活动编号';
comment on column CPIC_SXDX.C_OB_COMPAIGN.name
  is '活动名称';
comment on column CPIC_SXDX.C_OB_COMPAIGN.busitype
  is '业务类型（树状）

数据字典：

parentId=busiType';
comment on column CPIC_SXDX.C_OB_COMPAIGN.groupid
  is '活动所属机构 v_group';
comment on column CPIC_SXDX.C_OB_COMPAIGN.executetype
  is '执行方式
1.预览式外呼
2.预测试外呼

对应“CompaignToken.java“常量EXECUTE_TYPE_PREVIEW和EXECUTE_TYPE_PREDICT';
comment on column CPIC_SXDX.C_OB_COMPAIGN.contacttype
  is '执行渠道，渠道方式：C_contact_type表  由常量类：ContactTypeFactoryToken.java中“CONTACT_TYPE_"头的常量表示';
comment on column CPIC_SXDX.C_OB_COMPAIGN.begindate
  is '有效起始时间，精确至日。

原型：[]年[]  []月 []日  (年、月、日下拉框)
如果不填日，则为每个月的1日.年、月必输，年默认为当前年。';
comment on column CPIC_SXDX.C_OB_COMPAIGN.enddate
  is '有效结束时间，精确至日。

原型：[]年[]  []月 []日  (年、月、日下拉框)
如果不填日，则为每个月的最后一天。
年、月必输，年默认为当前年。';
comment on column CPIC_SXDX.C_OB_COMPAIGN.topicid
  is '问卷调查编号';
comment on column CPIC_SXDX.C_OB_COMPAIGN.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_OB_COMPAIGN.maxdialcount
  is '最大拨打次数。
默认1。预览式外呼无效。';
comment on column CPIC_SXDX.C_OB_COMPAIGN.isdel
  is '是否删除。1是。0否（默认）';
comment on column CPIC_SXDX.C_OB_COMPAIGN.createdate
  is '创建时间';
comment on column CPIC_SXDX.C_OB_COMPAIGN.createuserid
  is '创建用户';
comment on column CPIC_SXDX.C_OB_COMPAIGN.updatedate
  is '更新时间';
comment on column CPIC_SXDX.C_OB_COMPAIGN.updateuserid
  is '更新用户';
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
  is '任务管理，在话务系统中，相关于任务小结。


索引
tenementid
compaignId
isbook
taskTypeId
busiType
taskStatusId
taskStatuschildId
userId


任务类别：
外呼营销：执行外呼营销的专门任务，任务之间互转，只能在当前类别下。
待分配任务：如果任务类别为待分配任务，则可以将任务转移至任务类别的任务下。该任务不可做具体的业务操作。



在来电弹屏与当前任务中提交小结或新增任务时：
：判断参数getcurrentCallHistoryId()是否为空。如果不为空，则创建关系表c_callhistory_task关系表。';
comment on column CPIC_SXDX.C_TASK.taskid
  is '任务编号';
comment on column CPIC_SXDX.C_TASK.compaignid
  is '活动编号，则对像c_ob_compaign中的主键：CAMPAIGNID';
comment on column CPIC_SXDX.C_TASK.cus_id
  is '编号';
comment on column CPIC_SXDX.C_TASK.datalistid
  is '数据列表编号';
comment on column CPIC_SXDX.C_TASK.fromuserid
  is '分配用户';
comment on column CPIC_SXDX.C_TASK.fromdate
  is '分配时间';
comment on column CPIC_SXDX.C_TASK.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_TASK.togroupid
  is '如果为指定用户，则用户组为用户对应的默认用户组。

对应v_group视图中的外键。';
comment on column CPIC_SXDX.C_TASK.touserid
  is '分配用户Id，如果该值为空，则分配给全组。';
comment on column CPIC_SXDX.C_TASK.isbook
  is '是否有预约';
comment on column CPIC_SXDX.C_TASK.bookdatetime
  is '预约时间。精确至时分秒。';
comment on column CPIC_SXDX.C_TASK.contacttype
  is '渠道方式：C_contact_type表  由常量类：ContactTypeFactoryToken.java中“CONTACT_TYPE_"头的常量表示';
comment on column CPIC_SXDX.C_TASK.fromtaskid
  is '从来源编号，外呼，则对像c_ob_compaign中的主键：CAMPAIGNID';
comment on column CPIC_SXDX.C_TASK.dealcount
  is '处理次数';
comment on column CPIC_SXDX.C_TASK.tasktypeid
  is '任务类别

对应常量：
TaskToken.java中以“TASK_TYPE_”开头的常量10：外呼营销
TaskToken.java中以“TASK_TYPE_”开头的常量11：待分配任务

今后可扩展';
comment on column CPIC_SXDX.C_TASK.busisource
  is '数据来源

数据字典：

parentId=busiSource  数据来源
';
comment on column CPIC_SXDX.C_TASK.busitype
  is '业务类型（树状）

数据字典：

parentId=busiType';
comment on column CPIC_SXDX.C_TASK.taskstatusid
  is '状态编号


任务小结里不能选择的状态有：待分配、待接收、取消';
comment on column CPIC_SXDX.C_TASK.taskstatuschildid
  is '子状态编号';
comment on column CPIC_SXDX.C_TASK.createdate
  is '任务创建时间';
comment on column CPIC_SXDX.C_TASK.createuserid
  is '任务创建用户';
comment on column CPIC_SXDX.C_TASK.begindatetime
  is '开始时间';
comment on column CPIC_SXDX.C_TASK.enddatetime
  is '截止时间';
comment on column CPIC_SXDX.C_TASK.iscaseorder
  is '是否关联工单或订单
1是。0否（默认）';
comment on column CPIC_SXDX.C_TASK.lastcallhistoryid
  is '最新服务历史编号';
comment on column CPIC_SXDX.C_TASK.summary
  is '任务描述';
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
  is '历史与任务关系表';
comment on column CPIC_SXDX.C_CALLHISTORY_TASK.id
  is '主键编号';
comment on column CPIC_SXDX.C_CALLHISTORY_TASK.callhistoryid
  is '服务历史编号';
comment on column CPIC_SXDX.C_CALLHISTORY_TASK.taskid
  is '任务表编号 c_TASK_bas外键。';
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
  is '工单日志编号';
comment on column CPIC_SXDX.C_CASE_LOG.caseid
  is 'caseId';
comment on column CPIC_SXDX.C_CASE_LOG.fromgroupid
  is '源组';
comment on column CPIC_SXDX.C_CASE_LOG.fromuserid
  is 'fromUserId';
comment on column CPIC_SXDX.C_CASE_LOG.togroupid
  is 'toGroupId';
comment on column CPIC_SXDX.C_CASE_LOG.touserid
  is 'toUserID';
comment on column CPIC_SXDX.C_CASE_LOG.casestatus
  is '工单状态


订单状态

数据字典：
parentId=caseStatus


共享内置字典-->
（对应常量 flowstatustoken.java中以caes_status开头的常量）
00：待接收
01：待处理
02：处理中
90：完成
91：取消';
comment on column CPIC_SXDX.C_CASE_LOG.tenementid
  is 'tenementid';
comment on column CPIC_SXDX.C_CASE_LOG.summary
  is '处理意见';
comment on column CPIC_SXDX.C_CASE_LOG.changelog
  is '修改日志';
comment on column CPIC_SXDX.C_CASE_LOG.exttablecontent
  is '扩展信息内容。格式：

fieldId：字段中文名：值|
fieldId：字段中文名：值|
fieldId：字段中文名：值|
fieldId：字段中文名：值|
fieldId：字段中文名：值|';
comment on column CPIC_SXDX.C_CASE_LOG.createdate
  is '创建时间';
comment on column CPIC_SXDX.C_CASE_LOG.productid
  is '产品编号';
comment on column CPIC_SXDX.C_CASE_LOG.cus_id
  is '客户编号';
comment on column CPIC_SXDX.C_CASE_LOG.task_id
  is '任务编号';
comment on column CPIC_SXDX.C_CASE_LOG.callhistoryid
  is '服务历史编号';
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
  is '菜单内容对应的布局。
   1,''控制栏上边，主内窗下边''
   2,''控制栏左边，主内窗右边''
   3,''控制栏右边, 内容窗左边''';
comment on column CPIC_SXDX.C_CATEGORY_MAINOBJECT.mainobjectid
  is 'MAINOBJECTID';
comment on column CPIC_SXDX.C_CATEGORY_MAINOBJECT.name
  is '名称';
comment on column CPIC_SXDX.C_CATEGORY_MAINOBJECT.templateurl
  is '模板文件';
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
  is '页面模板
1.  列明明细页（一般：主页为列表，子页面为明细页）
3.  主子对象页（主对象可以多个TAB、子对象也可以多个)';
comment on column CPIC_SXDX.C_CATEGORY_PAGELAYOUT.pagelayoutid
  is 'ID';
comment on column CPIC_SXDX.C_CATEGORY_PAGELAYOUT.name
  is '名称';
comment on column CPIC_SXDX.C_CATEGORY_PAGELAYOUT.templateurl
  is '框架模板URL';
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
  is '目录类型表

1. 菜单
2. 对象
3. 页面
4. 按钮
5. 数据字段
6. 子对象
7. 右边菜单
8. 软电话及多媒体
9.用户组(组织机构)
11.知识库
10. 弹屏菜单

20.活动目录对应的菜单列表


   31.控制区页面区(查询快捷)
   32.查询页面（高级查询）
   33.子页面


';
comment on column CPIC_SXDX.C_CATEGORY_TYPE.categorytypeid
  is 'ID';
comment on column CPIC_SXDX.C_CATEGORY_TYPE.name
  is '名称';
comment on column CPIC_SXDX.C_CATEGORY_TYPE.property
  is '属性  1菜单,2 对象,9其他, 对应categoryTokenCATEGORYPROPERTY开头的常量表';
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
  is '菜单目录表

parentid=categoryid=0：左边菜单根节点。


categoryID=''99''起“为活动目录（右键菜单）项目“
categoryID=''98"的为表单订单';
comment on column CPIC_SXDX.C_CATEGORY.categoryid
  is '目录菜单id,只能是数值, 不能填写任何字符( 字符程序会抛出异常)';
comment on column CPIC_SXDX.C_CATEGORY.parentid
  is '父节点,在hibernate映射时为String类型';
comment on column CPIC_SXDX.C_CATEGORY.name
  is '名称';
comment on column CPIC_SXDX.C_CATEGORY.categorytypeid
  is '菜单节点类型

c_category_type表';
comment on column CPIC_SXDX.C_CATEGORY.mainobjectid
  is '菜单内容的布局情况。
c_mainobject_layout';
comment on column CPIC_SXDX.C_CATEGORY.pagelayoutid
  is '列表页面的布局情况。
C_Pagelayout';
comment on column CPIC_SXDX.C_CATEGORY.remark
  is '描述';
comment on column CPIC_SXDX.C_CATEGORY.tag_img
  is '菜单图标（一级菜单有用）;
';
comment on column CPIC_SXDX.C_CATEGORY.isdel
  is '是否删除。
1为删除，默认为0。';
comment on column CPIC_SXDX.C_CATEGORY.pageurl
  is '页面的URL链接';
comment on column CPIC_SXDX.C_CATEGORY.isauthority
  is '是否需要授权。
菜单一定要授权，页面可根据情况，设置授权情况。
0为默认，1表明一定要授权。';
comment on column CPIC_SXDX.C_CATEGORY.disorder
  is '排序';
comment on column CPIC_SXDX.C_CATEGORY.isactivity
  is '是否支持底下有活动目录
，默认0
1是';
comment on column CPIC_SXDX.C_CATEGORY.issystem
  is '是否为系统菜单。
默认0,
是为"1"；
像代码生成器，多租户管理：这类菜单属于系统菜单只能有超级管理员看到';
comment on column CPIC_SXDX.C_CATEGORY.isdefaultload
  is '是否自动加载？

1自动加载；
默认为0；

对于子对象有效。
如果为自动加载，则ishiglight=1的页面将自动加载。
';
comment on column CPIC_SXDX.C_CATEGORY.updatedate
  is '更新时间';
comment on column CPIC_SXDX.C_CATEGORY.updateuser
  is '更新用户';
comment on column CPIC_SXDX.C_CATEGORY.isvalidate
  is '是否有效. 1是.  0否 (默认1), 只有为0的菜单才可以在菜单配置里做物理删除';
comment on column CPIC_SXDX.C_CATEGORY.customstatus
  is '自定义菜单的状态(:0,初始化,1发布)';
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
  is '用于生成categoryId两位。规则：不存在在c_category表中可以通过该表取到。';
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
  is '保留tenement=0的菜单。只需记录菜单项和首页项即可。对象、数据、按钮等关系不必建立';
comment on column CPIC_SXDX.C_CATEGORY_TENEMENT.categoryid
  is 'C_CATEGORY外键
一、00为一级菜单，0000为二级菜单，000000为三级菜单，以此类推；
二、对于活动目录，像faq等，一级菜单点三位，比如 000。';
comment on column CPIC_SXDX.C_CATEGORY_TENEMENT.tenementid
  is 'C_TENEMENT表外键';
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
  is '用户表
1.  超级管理员可以查看所有的用户及组.
4. 系统里只能有一个超级管理员.
';
comment on column CPIC_SXDX.C_USER.userid
  is '主键,格式为(为tenmentId+"_"+loginId)';
comment on column CPIC_SXDX.C_USER.loginid
  is '登录帐号。';
comment on column CPIC_SXDX.C_USER.employeename
  is '用户名（即雇员信息中的雇员名）';
comment on column CPIC_SXDX.C_USER.password
  is '密码';
comment on column CPIC_SXDX.C_USER.isdel
  is '1，删除；0不删除。
默认0';
comment on column CPIC_SXDX.C_USER.defaultlanguage
  is '当前使用的登录语言，目前只有zh_CN.
字典：parent=SYSTEM_LANGUAGE  系统字典';
comment on column CPIC_SXDX.C_USER.issuperadmin
  is '是否为超级管理员(可看到所有的菜单，包括租户管理、表单定制等)
否为0
是为1. ';
comment on column CPIC_SXDX.C_USER.updatedate
  is '更新时间
';
comment on column CPIC_SXDX.C_USER.updateuserid
  is '更新帐号';
comment on column CPIC_SXDX.C_USER.employeeid
  is 'C_EMPLOYEE外键';
comment on column CPIC_SXDX.C_USER.defaulttenementid
  is '默认租户外键(当前选中的租户)';
comment on column CPIC_SXDX.C_USER.defaultgroupid
  is '默认用户组';
comment on column CPIC_SXDX.C_USER.org_id
  is '机构ID';
comment on column CPIC_SXDX.C_USER.workplace_id
  is '职场管理表中的职场编号';
comment on column CPIC_SXDX.C_USER.sale_channel
  is '销售渠道';
comment on column CPIC_SXDX.C_USER.max_lists
  is '最大名单数';
comment on column CPIC_SXDX.C_USER.agentid
  is 'AGENTID';
comment on column CPIC_SXDX.C_USER.skill_id
  is '技能组ID';
comment on column CPIC_SXDX.C_USER.create_user
  is '创建人';
comment on column CPIC_SXDX.C_USER.create_time
  is '创建时间';
comment on column CPIC_SXDX.C_USER.isfreeze
  is '0，正常；1冻结。
默认0';
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
  is '多租户维护表


规定租户为0的为默认租户。
系统只至少存在一个租户。';
comment on column CPIC_SXDX.C_TENEMENT.tenementid
  is '租户ID';
comment on column CPIC_SXDX.C_TENEMENT.name
  is '名称';
comment on column CPIC_SXDX.C_TENEMENT.isdel
  is '是否删除，1删除，0不删除，默认0；
如果删除，则租户下所有的用户不能登录系统。

';
comment on column CPIC_SXDX.C_TENEMENT.remark
  is '备注';
comment on column CPIC_SXDX.C_TENEMENT.isdefault
  is '是否为默认租户。
只能有一个默认租户。

1是。
0否，默认0。';
comment on column CPIC_SXDX.C_TENEMENT.groupid
  is '租户对应的默认用户组(组织机构)。';
comment on column CPIC_SXDX.C_TENEMENT.adminuserid
  is '1. 租户管理员';
comment on column CPIC_SXDX.C_TENEMENT.updatedate
  is '更新时间,精确到秒';
comment on column CPIC_SXDX.C_TENEMENT.updateuserid
  is '更新用户';
comment on column CPIC_SXDX.C_TENEMENT.faqcategoryid
  is '知识库ID';
comment on column CPIC_SXDX.C_TENEMENT.code
  is '租户编号';
comment on column CPIC_SXDX.C_TENEMENT.customformid
  is '定制表单对应的categoryId';
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
  is '渠道的联系类型（比如家庭电话...办公邮件等）';
comment on column CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT.attributeid
  is '联络类型代码';
comment on column CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT.attributename
  is '联络类型名称';
comment on column CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT.tenementid
  is '租户ID,  租户为空说明为公用的. 如果指定租户下无typecode对应的联系方式, 则读取默认的';
comment on column CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT.typecode
  is '渠道类型';
comment on column CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT.isdel
  is '1删除. 默认0';
comment on column CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT.factorycode
  is 'C_CONTACT_FACTORY外键,厂商外键';
comment on column CPIC_SXDX.C_CONTACT_ATTRIBUTE_TENEMENT.disorder
  is '排序字段';
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
  is '租户多媒体渠道与厂商的关系表';
comment on column CPIC_SXDX.C_CONTACT_FACTORY_TENEMENT.tenementid
  is '一个租户下，一个类型的渠道对应一个厂商';
comment on column CPIC_SXDX.C_CONTACT_FACTORY_TENEMENT.typecode
  is ' c_contact_type表中的typecode字段';
comment on column CPIC_SXDX.C_CONTACT_FACTORY_TENEMENT.factorycode
  is 'C_CONTACT_FACTORY中factoryname字段';
comment on column CPIC_SXDX.C_CONTACT_FACTORY_TENEMENT.id
  is '编号';
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
  is '渠道技能组';
comment on column CPIC_SXDX.C_CONTACT_GROUP.groupno
  is 'GROUPNO, 对应语音为技能组';
comment on column CPIC_SXDX.C_CONTACT_GROUP.tenementid
  is '主键';
comment on column CPIC_SXDX.C_CONTACT_GROUP.name
  is '名称';
comment on column CPIC_SXDX.C_CONTACT_GROUP.isdel
  is '默认0
1删除';
comment on column CPIC_SXDX.C_CONTACT_GROUP.typecode
  is '属于哪个联系渠道类型,如果为语音,则为技能组';
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
  is '用户和技能组关系表';
comment on column CPIC_SXDX.C_CONTACT_GROUP_USER.userid
  is '系统帐户与登录帐户相同，唯一索引
只能是字母、数字+下划线';
comment on column CPIC_SXDX.C_CONTACT_GROUP_USER.groupid
  is '技能组编号';
comment on column CPIC_SXDX.C_CONTACT_GROUP_USER.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_CONTACT_GROUP_USER.groupuserid
  is '主键';
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
  is '接触历史';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.typecode
  is '渠道类型代码,contact_type_code外键。其常量位于ContactTypeFactoryToken.java中。';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.calid
  is '如果是 typecode=voice,则calid为cti随路数据传入的数值(用于录音调听时用）
如果是多媒体，则为多媒体文件对应的路径与文件名。

源ID（录音为callId）
邮件与Email 等，再定制。';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.direct
  is '方向
1：入
2：出

对应常量：TaskToken.java中的CONTACT_DIRECT_INCOME
对应常量：TaskToken.java中的CONTACT_DIRECT_OUTBOUND
';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.begintime
  is '开始时间';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.endtime
  is '结束时间';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.interval
  is '时长

开始时间减去结束时间的（单位为秒）';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.taskid
  is '任务外键';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.cus_id
  is '外键：C_CUS_BAS表cus_id';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.contact_id
  is '主键';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.person_id
  is '联系人编号，c_cus_contact表中person_id的冗余字段。';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.customername
  is 'c_cus_bas表中的NAME';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.agent_dn
  is '分机（接入方式为语音时有效）';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.agent_contactno
  is '座席端号码
typecode=voice时，为工号
typecode=email时，为邮件地址
teypecode=msg时，为短信地址
...';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.desc_contactno
  is '对方联络号，如果为语音，则号码规则为：区号_联络号码_分机号  （中间用"_"下线划隔开）';
comment on column CPIC_SXDX.C_CONTACT_HISTORY.userid
  is '系统用户ID';
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
  is '座席示忙原因字典表

1.小休
2.培训
3.会议
4.就餐';
comment on column CPIC_SXDX.C_CSR_AGENT_BUSYREASON.id
  is 'ID';
comment on column CPIC_SXDX.C_CSR_AGENT_BUSYREASON.tenementid
  is '主键';
comment on column CPIC_SXDX.C_CSR_AGENT_BUSYREASON.name
  is '名称';
comment on column CPIC_SXDX.C_CSR_AGENT_BUSYREASON.remark
  is '描述';
comment on column CPIC_SXDX.C_CSR_AGENT_BUSYREASON.reasoncode
  is '原因代码(同话务系统CTI等的原因代码一致';
comment on column CPIC_SXDX.C_CSR_AGENT_BUSYREASON.isdel
  is '0默认 1删除';
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
  is '分机号客户端IP绑定关系字典表';
comment on column CPIC_SXDX.C_CSR_DN_CLIENTIP.id
  is 'ID';
comment on column CPIC_SXDX.C_CSR_DN_CLIENTIP.tenementid
  is '主键';
comment on column CPIC_SXDX.C_CSR_DN_CLIENTIP.dn
  is '分机号';
comment on column CPIC_SXDX.C_CSR_DN_CLIENTIP.ip
  is '客户端IP';
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
  is '渠道排除表（无效联系内容表）';
comment on column CPIC_SXDX.C_CUSRULE_INVALIDCONTACT.excludeid
  is '联络内容排除编号';
comment on column CPIC_SXDX.C_CUSRULE_INVALIDCONTACT.attributeid
  is '联络类型代码.租户id.typecode.类型code';
comment on column CPIC_SXDX.C_CUSRULE_INVALIDCONTACT.contactno
  is '渠道号码，渠道类型为电话时，该渠道号规则为：区号_号码_分机号(中间用下划线分)';
comment on column CPIC_SXDX.C_CUSRULE_INVALIDCONTACT.ismobile
  is '是否为手机。
默认0。1是。';
comment on column CPIC_SXDX.C_CUSRULE_INVALIDCONTACT.tenementid
  is '租户编号';
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
  is '客户唯一性排除表';
comment on column CPIC_SXDX.C_CUSRULE_UNIQUE.name
  is '唯一性说明';
comment on column CPIC_SXDX.C_CUSRULE_UNIQUE.table_id
  is 'c_def_table外键';
comment on column CPIC_SXDX.C_CUSRULE_UNIQUE.column_id
  is 'c_def_table_field外键';
comment on column CPIC_SXDX.C_CUSRULE_UNIQUE.table_entity_name
  is '对应c_def_table表中的entity_name字段的值。';
comment on column CPIC_SXDX.C_CUSRULE_UNIQUE.field_entity_name
  is '对应c_def_table_field表中的entity_name字段的值';
comment on column CPIC_SXDX.C_CUSRULE_UNIQUE.tenementid
  is '租户ID';
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
  is '客户基本信息表';
comment on column CPIC_SXDX.C_CUS_BAS.cus_id
  is '编号';
comment on column CPIC_SXDX.C_CUS_BAS.name
  is '客户名称';
comment on column CPIC_SXDX.C_CUS_BAS.kind
  is '客户属性
1：企业客户
0：个人客户';
comment on column CPIC_SXDX.C_CUS_BAS.branchcode
  is '分公司，对应：c_group_property中类型为分公司的用户组对应的BUSINESSCODE
';
comment on column CPIC_SXDX.C_CUS_BAS.extbranchcode
  is '支公司，对应：c_group_property中类型为支公司的用户组对应的BUSINESSCODE
';
comment on column CPIC_SXDX.C_CUS_BAS.tenement_id
  is '租户表外键c_tenement，租户ID';
comment on column CPIC_SXDX.C_CUS_BAS.cus_level
  is '客户级别，由数据字典维护！
PARENT_ID=CUSTOMER_LEVEL
-1为未分级！

0.标准客户
1.重要客户
2.VIP客户
3.大客户';
comment on column CPIC_SXDX.C_CUS_BAS.code
  is '企业内部的客户编号！';
comment on column CPIC_SXDX.C_CUS_BAS.gender
  is '性别：0：不分类(默认)，1女，2男
';
comment on column CPIC_SXDX.C_CUS_BAS.birthday
  is '生日';
comment on column CPIC_SXDX.C_CUS_BAS.certno
  is '身份证号';
comment on column CPIC_SXDX.C_CUS_BAS.company
  is '单位';
comment on column CPIC_SXDX.C_CUS_BAS.title_id
  is '职务
PARENT_ID=CUSTOMER_TITLE';
comment on column CPIC_SXDX.C_CUS_BAS.address
  is '通讯地址';
comment on column CPIC_SXDX.C_CUS_BAS.post_code
  is '邮编';
comment on column CPIC_SXDX.C_CUS_BAS.industry_id
  is '行业：数据字典
PARENT_ID=CUSTOMER_INDUSTRY';
comment on column CPIC_SXDX.C_CUS_BAS.isdel
  is '默认0。
1是。';
comment on column CPIC_SXDX.C_CUS_BAS.black_type_id
  is '默认-1。
黑名单类型：
数据字典：
PARENT_ID=CUSTOMER_BLACKTYPE';
comment on column CPIC_SXDX.C_CUS_BAS.create_user_id
  is '创建客户';
comment on column CPIC_SXDX.C_CUS_BAS.create_time
  is '创建时间';
comment on column CPIC_SXDX.C_CUS_BAS.cert_type_id
  is '证件类型';
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
  is '客户基本信息临时表';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.cusid
  is '编号';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.name
  is '客户名称';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.cus_kind
  is '客户属性
1：企业客户
2：个人客户';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.branchcode
  is '分公司，对应：c_group_property中类型为分公司的用户组对应的BUSINESSCODE
';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.extbranchcode
  is '支公司，对应：c_group_property中类型为支公司的用户组对应的BUSINESSCODE
';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.tenementid
  is '租户表外键c_tenement，租户ID';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.cus_level
  is '客户级别，由数据字典维护！
PARENT_ID=CUSTOMER_LEVEL
-1为未分级！

0.标准客户
1.重要客户
2.VIP客户
3.大客户';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.cuscode
  is '企业内部的客户编号！';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.gender
  is '性别：0：不分类(默认)，1女，2男
';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.birthday
  is '生日';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.cert_type_id
  is '证件类型';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.certno
  is '证件号';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.company
  is '单位';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.title
  is '职务
PARENT_ID=CUSTOMER_TITLE';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.address
  is '通讯地址';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.postcode
  is '邮编';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.industry
  is '行业：数据字典
PARENT_ID=CUSTOMER_INDUSTRY';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.isdel
  is '默认0。
1是。';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.blacktypeid
  is '默认-1。
黑名单类型：
数据字典：
PARENT_ID=CUSTOMER_BLACKTYPE';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.createuserid
  is '创建客户';
comment on column CPIC_SXDX.C_CUS_BAS_TMP.createdatetime
  is '创建时间';

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
  is '客户黑名单表';
comment on column CPIC_SXDX.C_CUS_BLACKLIST.blacklistid
  is '黑名单表编号';
comment on column CPIC_SXDX.C_CUS_BLACKLIST.cus_id
  is '客户编号';
comment on column CPIC_SXDX.C_CUS_BLACKLIST.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_CUS_BLACKLIST.used
  is '黑名单用途：数据字典';
comment on column CPIC_SXDX.C_CUS_BLACKLIST.blacktype
  is '黑名单类型：数据字典';
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
  is '客户渠道及联系信息表';
comment on column CPIC_SXDX.C_CUS_CONTACT.contact_id
  is '主键';
comment on column CPIC_SXDX.C_CUS_CONTACT.cus_id
  is '客户编号';
comment on column CPIC_SXDX.C_CUS_CONTACT.person_id
  is '联络人编号, 对应c_cus_contact_person表主键';
comment on column CPIC_SXDX.C_CUS_CONTACT.factorycode
  is '厂商代码，对即时消息与微博有用。c_contact_factory外键！';
comment on column CPIC_SXDX.C_CUS_CONTACT.often_use
  is '是否为常0否。1是。默认0';
comment on column CPIC_SXDX.C_CUS_CONTACT.contactno
  is '渠道号码 电话号码其规则为 "区号_号码_分机号"';
comment on column CPIC_SXDX.C_CUS_CONTACT.tenementid
  is '租户id';
comment on column CPIC_SXDX.C_CUS_CONTACT.is_moblile
  is '是否为手机。默认为0';
comment on column CPIC_SXDX.C_CUS_CONTACT.black_type_id
  is '默认-1。
黑名单类型：
数据字典：
PARENT_ID=CUSTOMER_BLACKTYPE';
comment on column CPIC_SXDX.C_CUS_CONTACT.flag
  is '联络标识(0:默认属于联络人   1：属于客户)';
comment on column CPIC_SXDX.C_CUS_CONTACT.typecode
  is '联络类型';
comment on column CPIC_SXDX.C_CUS_CONTACT.attr_id
  is '联络类型属性ID';
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
  is '联系人信息表（企业客户）';
comment on column CPIC_SXDX.C_CUS_CONTACT_PERSON.person_id
  is '联络人编号';
comment on column CPIC_SXDX.C_CUS_CONTACT_PERSON.cus_id
  is '客户编号';
comment on column CPIC_SXDX.C_CUS_CONTACT_PERSON.name
  is '姓名';
comment on column CPIC_SXDX.C_CUS_CONTACT_PERSON.gender
  is '性别，字典：

parent_code=gender

性别：0：男    1：女

系统字典';
comment on column CPIC_SXDX.C_CUS_CONTACT_PERSON.title_id
  is '职务，字典';
comment on column CPIC_SXDX.C_CUS_CONTACT_PERSON.tenement_id
  is '租户id';
comment on column CPIC_SXDX.C_CUS_CONTACT_PERSON.birthday
  is '生日';
comment on column CPIC_SXDX.C_CUS_CONTACT_PERSON.flag
  is '0:默认  1：属于客户默认联络人';
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
  is '主键ID';
comment on column CPIC_SXDX.C_CUS_CONTACT_RULE.contact_attribute_id
  is '联络方式属性ID';
comment on column CPIC_SXDX.C_CUS_CONTACT_RULE.contact_attribute_name
  is '联络方式属性名称';
comment on column CPIC_SXDX.C_CUS_CONTACT_RULE.tenementid
  is '租户号';
comment on column CPIC_SXDX.C_CUS_CONTACT_RULE.isdel
  is '是否删除';
comment on column CPIC_SXDX.C_CUS_CONTACT_RULE.rule_name
  is '规则名称';
comment on column CPIC_SXDX.C_CUS_CONTACT_RULE.table_name
  is '表名称';
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
  is '客户扩展信息临时表';
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
  is '主键';
comment on column CPIC_SXDX.C_CUS_LOG.cus_id
  is '客户信息表外键';
comment on column CPIC_SXDX.C_CUS_LOG.tenement_id
  is '租户外键';
comment on column CPIC_SXDX.C_CUS_LOG.update_content
  is '修改内容';
comment on column CPIC_SXDX.C_CUS_LOG.update_user_id
  is '修改人';
comment on column CPIC_SXDX.C_CUS_LOG.update_time
  is '修改时间';
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
  is '调度类型

1  数据导入
2  数据清洗
3  数据导出';
comment on column CPIC_SXDX.C_DATA_JOB_TYPE.isdel
  is '默认0
1删除。';
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
  is '数据管理类别

1.客户数据管理';
comment on column CPIC_SXDX.C_DATA_MANAGE_TYPE.datatypeid
  is '类别编号';
comment on column CPIC_SXDX.C_DATA_MANAGE_TYPE.datatypename
  is '类别名称';
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
  is '数据导入组管理';
comment on column CPIC_SXDX.C_DATA_LIST.datalistid
  is '列表编号';
comment on column CPIC_SXDX.C_DATA_LIST.datalistname
  is '列表名称';
comment on column CPIC_SXDX.C_DATA_LIST.isdel
  is '默认0。1删除。！';
comment on column CPIC_SXDX.C_DATA_LIST.createdate
  is '创建时间';
comment on column CPIC_SXDX.C_DATA_LIST.userid
  is '创建用户';
comment on column CPIC_SXDX.C_DATA_LIST.remark
  is '备注';
comment on column CPIC_SXDX.C_DATA_LIST.datatypeid
  is '数据管理组类别
';
comment on column CPIC_SXDX.C_DATA_LIST.datasourceid
  is '数据源';
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
  is '数据管理调度表';
comment on column CPIC_SXDX.C_DATA_JOB.jobtypeid
  is '任务类型';
comment on column CPIC_SXDX.C_DATA_JOB.datajobid
  is '调度编号';
comment on column CPIC_SXDX.C_DATA_JOB.jobname
  is '调度名称';
comment on column CPIC_SXDX.C_DATA_JOB.executedate
  is '执行时间';
comment on column CPIC_SXDX.C_DATA_JOB.isvalidate
  is '1生效，默认0';
comment on column CPIC_SXDX.C_DATA_JOB.jobstatus
  is '默认0，未执行。
1：执行中
2：已执行';
comment on column CPIC_SXDX.C_DATA_JOB.userid
  is '创建人
';
comment on column CPIC_SXDX.C_DATA_JOB.createdate
  is '创建时间';
comment on column CPIC_SXDX.C_DATA_JOB.threadcount
  is '同时执行的线程数，暂定上限为20。

对excel和文本文件，一个文件一个线程。 对于数据库，则按条数计算。';
comment on column CPIC_SXDX.C_DATA_JOB.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_DATA_JOB.datalistid
  is '数据管理组ID';
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
  is '数据导入列表与客户关系表';
comment on column CPIC_SXDX.C_DATA_LIST_CUS.cus_id
  is '编号';
comment on column CPIC_SXDX.C_DATA_LIST_CUS.datalistid
  is '列表编号';
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
  is '数据管理日志';
comment on column CPIC_SXDX.C_DATA_LOG.datalogid
  is '日志编号
';
comment on column CPIC_SXDX.C_DATA_LOG.totalcount
  is '总记录数';
comment on column CPIC_SXDX.C_DATA_LOG.successcount
  is '成功数';
comment on column CPIC_SXDX.C_DATA_LOG.failcount
  is '失败数';
comment on column CPIC_SXDX.C_DATA_LOG.userid
  is '用户';
comment on column CPIC_SXDX.C_DATA_LOG.begindate
  is '开始时间';
comment on column CPIC_SXDX.C_DATA_LOG.datalistid
  is '数据组编号c_data_list外键。';
comment on column CPIC_SXDX.C_DATA_LOG.longtime
  is '时长';
comment on column CPIC_SXDX.C_DATA_LOG.enddate
  is '结束时间';
comment on column CPIC_SXDX.C_DATA_LOG.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_DATA_LOG.datajobid
  is '调节编号,C_DATA_JOB外键。';
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
  is '数据管理类别对应的表，实体信息';
comment on column CPIC_SXDX.C_DATA_MANAGE_TABLE.datatypeid
  is '业务类别编号';
comment on column CPIC_SXDX.C_DATA_MANAGE_TABLE.table_id
  is '对应c_def_table表中的table_id字段的值';
comment on column CPIC_SXDX.C_DATA_MANAGE_TABLE.table_code
  is '对应c_def_table表中的table_code字段的值';
comment on column CPIC_SXDX.C_DATA_MANAGE_TABLE.table_entity_name
  is '对应c_def_table表中的entity_name字段的值';
comment on column CPIC_SXDX.C_DATA_MANAGE_TABLE.tenementid
  is '租户';
comment on column CPIC_SXDX.C_DATA_MANAGE_TABLE.isshare
  is '共享 1：共享 0：不共享';
comment on column CPIC_SXDX.C_DATA_MANAGE_TABLE.isparent
  is '是否父表 1：是  0：否';
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
  is '客户数据源

1.excel win2003 版本导入';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.datasourceid
  is '数据源编号';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.sourcetypeid
  is '数据类型,c_dictionary表中parent_id="datasource"';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.sourcename
  is '数据源名称';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.sourceip
  is 'IP地址';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.sourceport
  is '端口';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.sourceuserid
  is '用户名';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.sourcepassword
  is '密码';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.isdefault
  is '是否为默认的数据源 1：默认 0不默认';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.module_code
  is '业务代码';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.source_url
  is '数据源地址';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.database_name
  is '数据库名称';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.driverclass
  is '驱动类';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.curr_sys_flag
  is '是否隶属于当前系统 1：是 0：否 默认';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.isdel
  is '是否删除 1：删除 0：未删除(默认)';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.isjndi
  is '是否通过JNDI连接 1：是 0：否(默认)';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.pool_timeout
  is '连接超时时间';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.testsql
  is '测试SQL语句';
comment on column CPIC_SXDX.C_SYS_DATASOURCE.datamanagetype_id
  is '数据业务管理类型';
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
  is '客户数据映射';
comment on column CPIC_SXDX.C_DATA_MAP.sourcemapid
  is '映射编号';
comment on column CPIC_SXDX.C_DATA_MAP.datasourceid
  is '数据源编号';
comment on column CPIC_SXDX.C_DATA_MAP.desctable
  is '目标表名';
comment on column CPIC_SXDX.C_DATA_MAP.desccolumn
  is '源表名';
comment on column CPIC_SXDX.C_DATA_MAP.sourcetable
  is '目标字段';
comment on column CPIC_SXDX.C_DATA_MAP.sourcecolumn
  is '源字段';
comment on column CPIC_SXDX.C_DATA_MAP.isdict
  is '默认0。1是。';
comment on column CPIC_SXDX.C_DATA_MAP.column_id
  is 'c_def_table_column外键';
comment on column CPIC_SXDX.C_DATA_MAP.entity_index
  is '实体索引';
comment on column CPIC_SXDX.C_DATA_MAP.source_view_column_name
  is '源字段页面显示内容';
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
  is '客户数据字典映射';
comment on column CPIC_SXDX.C_DATA_MAP_DICT.sourcemapid
  is '映射编号';
comment on column CPIC_SXDX.C_DATA_MAP_DICT.descvalue
  is '目标值';
comment on column CPIC_SXDX.C_DATA_MAP_DICT.sourcevalue
  is '源值';
comment on column CPIC_SXDX.C_DATA_MAP_DICT.remark
  is '字段描述';
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
  is '定义数据规则表达式

0-100：
为预留编号

100以后为正则表达式
100：日期：格式：yyyy-mm-dd
101：日期时间：yyyy-mm-dd hh:mi:ss
102：电子邮件
103：固话
104：手机号码
...';
comment on column CPIC_SXDX.C_DATA_REGEX.rulename
  is '规则名称';
comment on column CPIC_SXDX.C_DATA_REGEX.regex
  is '规则（用正则表达式）除id=1';
comment on column CPIC_SXDX.C_DATA_REGEX.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_DATA_REGEX.isshare
  is '是否为共享。。
1是。默认0';
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
  is '数据规则模板。';
comment on column CPIC_SXDX.C_DATA_TEMPLATE.templateid
  is '规则模板编号';
comment on column CPIC_SXDX.C_DATA_TEMPLATE.datatypeid
  is '类别编号';
comment on column CPIC_SXDX.C_DATA_TEMPLATE.templatename
  is '模板名称';
comment on column CPIC_SXDX.C_DATA_TEMPLATE.createdate
  is '创建时间';
comment on column CPIC_SXDX.C_DATA_TEMPLATE.userid
  is '创建用户';
comment on column CPIC_SXDX.C_DATA_TEMPLATE.isdel
  is '默认0，1删除。';
comment on column CPIC_SXDX.C_DATA_TEMPLATE.tenementid
  is '租户';
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
  is '客户数据规则';
comment on column CPIC_SXDX.C_DATA_RULE.cusruleid
  is '客户数据规则编号';
comment on column CPIC_SXDX.C_DATA_RULE.regexid
  is '规则（用正则表达式）除id=1';
comment on column CPIC_SXDX.C_DATA_RULE.isnull
  is '是否为空！';
comment on column CPIC_SXDX.C_DATA_RULE.minvalue
  is '最小值，默认为0';
comment on column CPIC_SXDX.C_DATA_RULE.maxvalue
  is '最大值';
comment on column CPIC_SXDX.C_DATA_RULE.maxlength
  is '长度限制';
comment on column CPIC_SXDX.C_DATA_RULE.minlength
  is '最小长度,默认为0';
comment on column CPIC_SXDX.C_DATA_RULE.defaultvalue
  is '默认值';
comment on column CPIC_SXDX.C_DATA_RULE.column_id
  is 'c_def_table_column外键';
comment on column CPIC_SXDX.C_DATA_RULE.table_id
  is 'c_def_table外键';
comment on column CPIC_SXDX.C_DATA_RULE.templateid
  is '规则模板编号';
comment on column CPIC_SXDX.C_DATA_RULE.table_entity_name
  is '对应c_def_table表中的entity_name字段的值。';
comment on column CPIC_SXDX.C_DATA_RULE.field_entity_name
  is '对应c_def_table_field表中的entity_name字段的值';
comment on column CPIC_SXDX.C_DATA_RULE.tenementid
  is '对应租户';
comment on column CPIC_SXDX.C_DATA_RULE.datatype_id
  is '数据类型';
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
  is '数据规则业务接口实现类';
comment on column CPIC_SXDX.C_DATA_RULE_INTERFACEIMPL.id
  is '主键';
comment on column CPIC_SXDX.C_DATA_RULE_INTERFACEIMPL.datatypeid
  is '类别编号';
comment on column CPIC_SXDX.C_DATA_RULE_INTERFACEIMPL.ruleinterfaceimpl
  is '实现类（含包在内的全名）实现DataRuleInterface.java';
comment on column CPIC_SXDX.C_DATA_RULE_INTERFACEIMPL.tenementid
  is '租户';
comment on column CPIC_SXDX.C_DATA_RULE_INTERFACEIMPL.remark
  is '备注';
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
  is '外部数据源设置

1. win2003及以下版本的 excel文件
2. win2007及以上版本的excel文件
3. 文本文件
4. oracle数据库
5. mysql


目前支持excel和文本文件。';
comment on column CPIC_SXDX.C_DATA_SOURCE_TYPE.isdel
  is '是否删除，1是。 默认0。';
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
  is '表单定制主表';
comment on column CPIC_SXDX.C_DEF_TABLE.table_name
  is '表DB备注';
comment on column CPIC_SXDX.C_DEF_TABLE.table_remarks
  is '备注';
comment on column CPIC_SXDX.C_DEF_TABLE.table_code
  is '表名';
comment on column CPIC_SXDX.C_DEF_TABLE.rapid_flag
  is 'RAPID生成代码标识(01,可生成;02,不可生成;)';
comment on column CPIC_SXDX.C_DEF_TABLE.table_type
  is '01，工单，02，订单，03：客户扩展表。。。99,普通表

常量类：CustomFormTokens.java，
    public static final String CUSTOMFORM_TYPE_GONGDAN = "01"; //工单扩展表
    public static final String CUSTOMFORM_TYPE_DINGDAN = "02";//订单扩展表
    public static final String CUSTOMFORM_TYPE_KEHU = "03";//客户扩展表
    public static final String CUSTOMFORM_TYPE_PUTONG = "99";//普通表

对应数据字典：parentid=custab_typ';
comment on column CPIC_SXDX.C_DEF_TABLE.status
  is '1,正常;9,删除';
comment on column CPIC_SXDX.C_DEF_TABLE.tenement_id
  is '租户表外键c_tenement，租户ID';
comment on column CPIC_SXDX.C_DEF_TABLE.init_flag
  is '初始化标识(0:否;1:是) ';
comment on column CPIC_SXDX.C_DEF_TABLE.data_type_id
  is '1：客户数据管理 C_DATA_MANAGE_TYPE表外键';
comment on column CPIC_SXDX.C_DEF_TABLE.isparent
  is '是否主表 1：是 0：否';
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
  is '定制表单字段表';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.sql_type
  is 'DB属性，字段数据类型';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.length
  is 'DB属性，字段长度';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.precision
  is 'DB属性，字段精度';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.code
  is 'DB属性，字段名';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.name
  is 'DB属性，字段注释';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.is_pk
  is 'DB属性，是否主键(Y,是;N,不是)';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.is_fk
  is 'DB属性，是否外键(Y,是;N,不是)';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.is_nullable
  is 'DB属性，是否可空(Y,是;N,不是)';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.default_value
  is 'DB属性，默认值';
comment on column CPIC_SXDX.C_DEF_TABLE_COLUMN.remarks
  is '备注';
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
  is '自定义表单字段的页面属性表';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.is_query
  is '页面属性，是否简单查询字段(Y,是;N,不是)';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.is_querys
  is '页面属性，是否高级查询字段(Y,是;N,不是)';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.is_list
  is '页面属性，是否列表字段(Y,是;N,不是)';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.is_hidden
  is '页面属性，是否隐藏输入(Y,是;N,不是)';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.is_readonly
  is '页面属性，是否只读输入(Y,是;N,不是)';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.page_type
  is '页面属性，输入样式(对应数据字典，文本框，下拉框。。。)';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.is_dict
  is '页面属性，是否使用数据字典';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.dic_id
  is '页面属性，对应数据字典取值字典项';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.enmu_string
  is '页面属性，枚举值,以分号分隔,示例值:M(1,男);F(0,女) 或者是:M(男);F(女)';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.query_index
  is '页面属性，简单查询显示顺序';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.querys_index
  is '页面属性，高级查询显示顺序';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.list_index
  is '页面属性，列表页面显示顺序';
comment on column CPIC_SXDX.C_DEF_COLUMN_PAGEPROPS.edit_index
  is '页面属性，编辑页面显示顺序';
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
  is '代码生成-->页面类别的字典表，该表手工维护。对应常量类：CustomFormTokens.java以PAGEPROPSTYPE开头的常量。';
comment on column CPIC_SXDX.C_DEF_PAGEPROPSTYPE.pagepropstypeid
  is '页面类型编号';
comment on column CPIC_SXDX.C_DEF_PAGEPROPSTYPE.name
  is '页面名称';
comment on column CPIC_SXDX.C_DEF_PAGEPROPSTYPE.isdel
  is '是否删除。0（否，默认），1是。';
comment on column CPIC_SXDX.C_DEF_PAGEPROPSTYPE.remark
  is '描述';
comment on column CPIC_SXDX.C_DEF_PAGEPROPSTYPE.disorder
  is '排序';
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
  is '自定义工单表与业务类型表之间的关系';
comment on column CPIC_SXDX.C_DEF_TABLE_CASE_BUSITYPE.busitype
  is '业务类型（树状）

数据字典：

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
  is '自定义表单页面属性表';
comment on column CPIC_SXDX.C_DEF_TABLE_PAGEPROPS.create_date
  is '代码生成时间';
comment on column CPIC_SXDX.C_DEF_TABLE_PAGEPROPS.url_create
  is '新增url';
comment on column CPIC_SXDX.C_DEF_TABLE_PAGEPROPS.url_retrieve
  is '查询url';
comment on column CPIC_SXDX.C_DEF_TABLE_PAGEPROPS.url_update
  is '明细url';
comment on column CPIC_SXDX.C_DEF_TABLE_PAGEPROPS.url_delete
  is '删除url';
comment on column CPIC_SXDX.C_DEF_TABLE_PAGEPROPS.url_list
  is '列表url';
comment on column CPIC_SXDX.C_DEF_TABLE_PAGEPROPS.url_simple_query
  is '快速查询url';
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
  is '定制表单关系表';
comment on column CPIC_SXDX.C_DEF_TABLE_REFERENCE.ref_column_id
  is '字表字段ID';
comment on column CPIC_SXDX.C_DEF_TABLE_REFERENCE.column_id
  is '主表字段ID';
comment on column CPIC_SXDX.C_DEF_TABLE_REFERENCE.join_type
  is '关系(1,1..0,n;2,1..1;)';
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
  is '数据字典

在数据字典真删除，如果所属的表字段中仍在使用，则不能让他删除。


is_user_belong_multitenement: 一个用户属于多个租户。
1:是
0:否(默认)

is_allow_marquee:是否允许跑马灯
1:是(默认)
0:否

IS_FAQ_COMPANY_PUBLIC_AUDIT. 公司知识库发布时是否需要审核
    1：是
    0：否（默认）
IS_FAQ_SHARE2COMPANY_AUDIT. 共享知识库转入公司知识库是否需要审批？
  1.是
  0.否（默认）

SYSTEM_LANGUAGE_SUPPORT.  国际化
   0中文（默认）  （对应的code=zn_CN ）


EMPLOYEE_TITLE. 雇员职位
EMPLOYEE_ORIGANIZATION: 雇员组织机构树
SYSTEM_VDN: 技能组字典表


CUSTOMER_LEVEL: 客户类别



Gender   系统字典  性别
0：男
1：女





';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.parent_id
  is '编号
';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.name
  is '描述';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.remark
  is '描述';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.istree
  is '是否为树节点。
1是。
默认0';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.belongtable
  is '所属表，多个表之间用逗号分开';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.belongfield
  is '所属字段';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.issystem
  is '是否不可
0不是
1是。默认0

系统字典。对于租户用户只能查看不能做任何操作。';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.isautogeneratecode
  is '字典编号是否自动生成？
0否，默认0
1是。';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.isdel
  is 'NUMBER(1)';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.userid
  is '创建用户';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.createdate
  is '创建人';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.dictvaluetype
  is '字典值类型: 1数值  2字符';
comment on column CPIC_SXDX.C_DICTIONARY_PARENT.issavememory
  is '是否读入内存. 1是0不否默认1';
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
  is '数据字典表："DICTIONRY_CODE, TENEMENTID, PARENT_ID和DISORDER, PARENT_ID treeparentid两个唯一约束一定存在!';
comment on column CPIC_SXDX.C_DICTIONARY.dictionry_id
  is '主键,该值由 PARENT_ID+''|''+TENEMENTID+''|''+DICTIONRY_CODE';
comment on column CPIC_SXDX.C_DICTIONARY.dictionary_code
  is '字典代码,DICTIONRY_CODE, TENEMENTID, PARENT_ID三者唯一';
comment on column CPIC_SXDX.C_DICTIONARY.tree_parent_id
  is 'TREE_PARENT_ID';
comment on column CPIC_SXDX.C_DICTIONARY.disorder
  is '排序字典,DISORDER, PARENT_ID treeparentid三者唯一';
comment on column CPIC_SXDX.C_DICTIONARY.dictdesc
  is '字典描述';
comment on column CPIC_SXDX.C_DICTIONARY.parent_id
  is 'PARENT_ID';
comment on column CPIC_SXDX.C_DICTIONARY.tenementid
  is '租户ID, 如果tenementId为空则为共享的数据字典表。';
comment on column CPIC_SXDX.C_DICTIONARY.isdel
  is '1删除。默认0';
comment on column CPIC_SXDX.C_DICTIONARY.istenementshare
  is '是否为所有租户间共享,默认0. 1是';
comment on column CPIC_SXDX.C_DICTIONARY.isegeneratepage
  is '是否允许代码生成器生成代码, 默认0. 1允许';
comment on column CPIC_SXDX.C_DICTIONARY.isdefaultvalue
  is '是否为默认值,1是, 默认0';
comment on column CPIC_SXDX.C_DICTIONARY.userid
  is '创建用户';
comment on column CPIC_SXDX.C_DICTIONARY.createdate
  is '创建人';
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
  is '字典内存更新通知，当字典数据发生变化时，往该表写入数据。通知后台将最新字典更新至内存！每次读取状态不为1的数据字典更新。';
comment on column CPIC_SXDX.C_DICTONARY_FLUSH_LOG.id
  is '编号';
comment on column CPIC_SXDX.C_DICTONARY_FLUSH_LOG.dictparentid
  is '字典id';
comment on column CPIC_SXDX.C_DICTONARY_FLUSH_LOG.requestdatetime
  is '请求时间';
comment on column CPIC_SXDX.C_DICTONARY_FLUSH_LOG.flushdatetime
  is '更新时间';
comment on column CPIC_SXDX.C_DICTONARY_FLUSH_LOG.status
  is '更新状态。
0：默认值
1：更新完成
2：更新失败';
comment on column CPIC_SXDX.C_DICTONARY_FLUSH_LOG.failreason
  is '失败原因';
comment on column CPIC_SXDX.C_DICTONARY_FLUSH_LOG.macaddress
  is '服务器mac地址(c_log_serverinfo)表外键';
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
  is '公司职工管理表

一个职位可以拥有多个员工帐号。

报表以雇员表为主。';
comment on column CPIC_SXDX.C_EMPLOYEE_INFO.employeeid
  is '职员ID';
comment on column CPIC_SXDX.C_EMPLOYEE_INFO.employeename
  is '雇员名称';
comment on column CPIC_SXDX.C_EMPLOYEE_INFO.remark
  is 'REMARK';
comment on column CPIC_SXDX.C_EMPLOYEE_INFO.photourl
  is '头像, ftp路径: c_server_tenement中常规ftp的serverpath/tenement_租户编号/employee/  文件名格式: photo_userid....';
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
  is '考核对象随机抽取Id记录表';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.extralogid
  is '对像随机抽取日志表主键';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.resultid
  is '考核结果主表id';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.resultuserid
  is '用户考核结果主表Id';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.resultpackageid
  is '按考核包汇总表编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.objectid
  is '考核对像编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.objectidkeyid
  is '考核对像对应的KEYID';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.extradate
  is '抽取时间';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.extrauserid
  is '抽取数据用户';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.status
  is '是否已考核。0否（默认），1是。';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.userid
  is '考核目标用户';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.examtimedate
  is '考核时间';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.total
  is '考核对象总分';
comment on column CPIC_SXDX.C_EXAM_RESULT_OBJECT_EXTRA.isappid
  is '申诉标志 默认0，1已申诉';
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
  is '抽取对象汇总表';
comment on column CPIC_SXDX.C_EXAMRESULTOBJECT_TOTAL.extralogid
  is '对像随机抽取日志表主键';
comment on column CPIC_SXDX.C_EXAMRESULTOBJECT_TOTAL.objectrandomcount
  is '计划抽取数（c_exam_package冗余字段）';
comment on column CPIC_SXDX.C_EXAMRESULTOBJECT_TOTAL.factextracount
  is '实际抽取数';
comment on column CPIC_SXDX.C_EXAMRESULTOBJECT_TOTAL.finishcount
  is '已考核数';
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
  is '考核结果复核表。';
comment on column CPIC_SXDX.C_EXAM_AUDIT.auditid
  is '编号';
comment on column CPIC_SXDX.C_EXAM_AUDIT.userid
  is '申诉人';
comment on column CPIC_SXDX.C_EXAM_AUDIT.reason
  is '申请原因';
comment on column CPIC_SXDX.C_EXAM_AUDIT.resultpackageid
  is '用户考核结果主表编号

默认0 ，申请复核
1：复核中
2：退回
3：重新打分';
comment on column CPIC_SXDX.C_EXAM_AUDIT.statusid
  is '状态

1：申请复核
2：复核中
3：复核完成
4：拒绝';
comment on column CPIC_SXDX.C_EXAM_AUDIT.statususerid
  is '状态修改人';
comment on column CPIC_SXDX.C_EXAM_AUDIT.statusdate
  is '状态修改时间';
comment on column CPIC_SXDX.C_EXAM_AUDIT.auditdate
  is '申请时间，精确到秒';
comment on column CPIC_SXDX.C_EXAM_AUDIT.dealremark
  is '处理意见';
comment on column CPIC_SXDX.C_EXAM_AUDIT.objectkeyid
  is '考核对象id';
comment on column CPIC_SXDX.C_EXAM_AUDIT.resultid
  is '质检报告id';
comment on column CPIC_SXDX.C_EXAM_AUDIT.tenementid
  is '租户id';
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
  is '复核状态
1.申请复核
2.复核中
3.复核完成
4.拒绝';

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
  is '评分方式

常量类：ExamToken.java

2.手工打分
3.sql脚本
4.接口，实现类。指定GradeModeInterface接口的实现类
';
comment on column CPIC_SXDX.C_EXAM_GRADE_MODE.grademodeid
  is '打分方式编号。该值对应ExamToken.java类“EXAM_GRADEMODE_"　开头的常量。';
comment on column CPIC_SXDX.C_EXAM_GRADE_MODE.name
  is '名称，';
comment on column CPIC_SXDX.C_EXAM_GRADE_MODE.isdel
  is '默认0。1是删除。';
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
  is '考核模板

';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.templateid
  is '模板编号';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.maxpoint
  is '总分，默认为100分';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.minpoint
  is '最低分，默认为0分。';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.name
  is '模板名称';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.isdel
  is '1删除。默认0';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.updateuserid
  is '修改用户。';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.updatedate
  is '新增或修改时间（最后一次）';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.cyclemode
  is '执行周期：1按月，2按周

对应常量：EXAM_TOKEN.JAVA中以"EXAM_EXECUTE_MODE_"开头的常量。';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.cyclemode_begin
  is '起始时间

';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.cyclemode_end
  is '开始时间';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.cycle_type
  is '如果为0，说明为自然月或周
如果为具体的时间，则为这个月/月的几号(周几)至下个月（周）的几号（周几）

需校验，是否为整月或整周。';
comment on column CPIC_SXDX.C_EXAM_TEMPLATE.exam_desc
  is '备注';
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
  is '考核对像设置

已开始抽取数据，不能修改与删除。


entityclassId 唯一';
comment on column CPIC_SXDX.C_EXAM_OBJECT.objectid
  is '考核对像';
comment on column CPIC_SXDX.C_EXAM_OBJECT.name
  is '对像名称';
comment on column CPIC_SXDX.C_EXAM_OBJECT.detailurl
  is '打分对像（对像明细）页面URL？keyId=${Id}';
comment on column CPIC_SXDX.C_EXAM_OBJECT.isdel
  is '是否删除。1是。默认0';
comment on column CPIC_SXDX.C_EXAM_OBJECT.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_EXAM_OBJECT.isshare
  is '是否共享！
1是。0否。';
comment on column CPIC_SXDX.C_EXAM_OBJECT.status
  is '是否可用。
测试成功status=1， 否则为0';
comment on column CPIC_SXDX.C_EXAM_OBJECT.entityclassid
  is '对应Hibernate实体名，用于抽随Id';
comment on column CPIC_SXDX.C_EXAM_OBJECT.remark
  is '备注';
comment on column CPIC_SXDX.C_EXAM_OBJECT.entitytenementid
  is '实体字段名_租户编号';
comment on column CPIC_SXDX.C_EXAM_OBJECT.entitykeyid
  is '实体字段名_表关键字';
comment on column CPIC_SXDX.C_EXAM_OBJECT.entitystartdate
  is '实体字段名_开始时间字段';
comment on column CPIC_SXDX.C_EXAM_OBJECT.entityenddate
  is '实体字段名_结束时间字段名';
comment on column CPIC_SXDX.C_EXAM_OBJECT.entityuserid
  is '实体字段名_被考核用户(目标)';
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
  is '考核包

打分方式，如果有结果存在，不让修改。


';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.packageid
  is '考核包编号';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.templateid
  is '模板编号';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.name
  is '名称';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.grademodeid
  is '打分方式编号。该值对应ExamToken.java类“EXAM_GRADEMODE_"　开头的常量。';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.objectid
  is '考核类型';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.weight
  is '权重。显示时以百分比显示！%。';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.isdel
  is '默认0，1删除。';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.disorder
  is '排序';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.objectrandomcount
  is '考核对像抽取的随机数';
comment on column CPIC_SXDX.C_EXAM_PACKAGE.remark
  is '备注';
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
  is '质检模板指标。';
comment on column CPIC_SXDX.C_EXAM_ITEM.itemid
  is '指标id';
comment on column CPIC_SXDX.C_EXAM_ITEM.itemname
  is '指标名称';
comment on column CPIC_SXDX.C_EXAM_ITEM.packageid
  is '考核包编号';
comment on column CPIC_SXDX.C_EXAM_ITEM.script
  is '评分脚本：

当grademode=2时，为sql脚本。
   内置参数有：${currentUserId}, ${itemId},${packageId},${templateId},${tenementId},${startDate},${endDate}，
   常量位于（ExamToken.java中"SCRIPT_INLINE_PARAMETER"开头的常量）
   在执行脚本时自动将其转换实际的数值，其中 userIds实际值为ExamToken.SCRIPT_INLINE_PARAMETER_USERIDS_VALUE常量中描述。


脚本返回的格式为（通过userIds参数得到参于计分的用户，一个脚本将几个用户的分数一次读出来）
insert into C_EXAM_USER_POINT(poing,userId,itemid)
select point,userId,{itemId} from ....


对于接口：对应集成GradeModeInterface接口的实现类。';
comment on column CPIC_SXDX.C_EXAM_ITEM.maxpoint
  is '最高分';
comment on column CPIC_SXDX.C_EXAM_ITEM.minpoint
  is '最低分，不可高于最高分。';
comment on column CPIC_SXDX.C_EXAM_ITEM.isdel
  is '1是。默认0';
comment on column CPIC_SXDX.C_EXAM_ITEM.tenementid
  is '租户Id';
comment on column CPIC_SXDX.C_EXAM_ITEM.updateuserid
  is '修改用户。';
comment on column CPIC_SXDX.C_EXAM_ITEM.updatedate
  is '新增或修改时间（最后一次）';
comment on column CPIC_SXDX.C_EXAM_ITEM.disorder
  is '排序';
comment on column CPIC_SXDX.C_EXAM_ITEM.tempalateid
  is '质检模板ID';
comment on column CPIC_SXDX.C_EXAM_ITEM.itmedesc
  is '描述';
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
  is '考核结果主表

如果有子表记录存（对应的C_EXAM_RESULT_DETAIL表如果有记录，则不可以删除。否则可以物理删除。）';
comment on column CPIC_SXDX.C_EXAM_RESULT.resultid
  is '质检结果编号';
comment on column CPIC_SXDX.C_EXAM_RESULT.templateid
  is '考核模板编号';
comment on column CPIC_SXDX.C_EXAM_RESULT.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_EXAM_RESULT.startdate
  is '自定义考核时间';
comment on column CPIC_SXDX.C_EXAM_RESULT.enddate
  is '结束时间  注：此次考核发布后更新结束时间';
comment on column CPIC_SXDX.C_EXAM_RESULT.groupid
  is '机构';
comment on column CPIC_SXDX.C_EXAM_RESULT.totaldate
  is '最后一次汇总时间';
comment on column CPIC_SXDX.C_EXAM_RESULT.createdate
  is '报告生成时间';
comment on column CPIC_SXDX.C_EXAM_RESULT.createuserid
  is '报表生成用户';
comment on column CPIC_SXDX.C_EXAM_RESULT.isdel
  is '是否作废。1是。0否（默认）';
comment on column CPIC_SXDX.C_EXAM_RESULT.cyclebegin
  is '周期开始时间';
comment on column CPIC_SXDX.C_EXAM_RESULT.cycleend
  is '周期结束时间';
comment on column CPIC_SXDX.C_EXAM_RESULT.resulttotal
  is '总分';
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
  is '统计状态表

0：默认
1：进行中
2：完成
3：失败
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
  is '用户考核结果主表';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.resultuserid
  is 'resultUserId';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.resultid
  is '质检编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.statusid
  is 'statusId 0：默认
1：进行中
2：完成
3：失败';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.templateid
  is '考核模板编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.startdate
  is '开始时间';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.enddate
  is '结束时间';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.userid
  is '考核目标用户（被质检人）';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.ispublish
  is '发布。
1是。默认0。';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.point
  is '总分';
comment on column CPIC_SXDX.C_EXAM_RESULT_USER.isaut
  is '自动考核标示 默认0  1已经自动考核';
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
  is '按考核包汇总表';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.resultpackageid
  is '考核结果考核表统计表';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.resultuserid
  is '考核目标用户';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.statusid
  is 'statusId';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.templateid
  is '模板编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.packageid
  is '考核包编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.point
  is '总分';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.userid
  is '被考核用户（考核目标）';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.resultid
  is '质检编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.totaldate
  is '最后一次汇总时间';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.objectid
  is '考核对象';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.weight
  is '权重。显示时以百分比显示！%。
考核对像抽取的随机数（c_exam_package冗余字段）';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.objectrandomcount
  is '计划抽取数（c_exam_package冗余字段）';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.factextracount
  is '实际抽取数';
comment on column CPIC_SXDX.C_EXAM_RESULT_PACKAGE.finishcount
  is '已考核数';
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
  is '质检结果指标统计表

QUALITCHECKID和OBJECTtypeid两者必须唯一，这样才能保证公平。';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.resultitemid
  is '指标结果编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.userid
  is '考核目标（被考核用户）';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.templateid
  is '模板编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.packageid
  is '考核包编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.itemid
  is '指标ID';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.point
  is '分数，由质检明细表平均分得到。';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.examresultid
  is '质检编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.resultpackageid
  is '考核结果考核表统计表';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.statusid
  is 'statusId';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.isvalid
  is '结果是否有效。默认1，有效。0无效。';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.totaldate
  is '最后一次汇总时间';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.scripttotal
  is '脚本考核时，返回的实际统计数值。';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.sumpoint
  is '明细总分';
comment on column CPIC_SXDX.C_EXAM_RESULT_ITEM.finishcount
  is '已考核数';
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
  is '质检结果明细表

';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.detailid
  is '指标结果编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.resultid
  is '质检编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.resultuserid
  is '用户考核主表编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.resultpackageid
  is '考核结果考核表统计表';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.resultitemid
  is '指标结果编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.userid
  is '被考核用户（考核目标）';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.templateid
  is '考核模板编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.packageid
  is '试卷分类编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.itemid
  is '指标ID';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.objectid
  is '对应的质检类型，数据字典：

parent_code=EXAMOBJECTID
record:录音
pki:PKI质检
case:工单
faq:知识库';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.objectidkeyid
  is '考核对像对应的KEYID';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.point
  is '分数';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.tenmentid
  is '租户编号';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.isvalid
  is '结果是否有效。默认1，有效。0无效。';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.examdate
  is '考核时间，精确到秒';
comment on column CPIC_SXDX.C_EXAM_RESULT_DETAIL.examuserid
  is '考核人';
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
  is '全文检索记录表';
comment on column CPIC_SXDX.C_FAQ_ALL_SEARCH.contentid
  is '知识库编号,主键';
comment on column CPIC_SXDX.C_FAQ_ALL_SEARCH.indextag
  is '索引标记//1：新增，2：修改;3删除；不为空';
comment on column CPIC_SXDX.C_FAQ_ALL_SEARCH.macaddress
  is '服务器可用的Mac地址信息(c_log_server_info表)';
comment on column CPIC_SXDX.C_FAQ_ALL_SEARCH.createdate
  is '记录创建时间';
comment on column CPIC_SXDX.C_FAQ_ALL_SEARCH.id
  is '主键';
comment on column CPIC_SXDX.C_FAQ_ALL_SEARCH.tenementid
  is '租户id';
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
  is '工作流转节点设置，节点名不可重复。';
comment on column CPIC_SXDX.C_SYS_FLOWNODE.name
  is '节点名称';
comment on column CPIC_SXDX.C_SYS_FLOWNODE.stepno
  is '流程序号(步骤)';
comment on column CPIC_SXDX.C_SYS_FLOWNODE.isdel
  is '删除。1删除。0否。默认（0）';
comment on column CPIC_SXDX.C_SYS_FLOWNODE.remark
  is '备注';
comment on column CPIC_SXDX.C_SYS_FLOWNODE.flowmoduleid
  is '对应常量:FlowStatusToken.FLOW_MODULE_*


//审批岗对应的审批模块
public static final String FLOW_MODULE_FAQ="FAQ";//工单
public static final String FLOW_MODULE_CASE="CASE";//订单
public static final String FLOW_MODULE_ORDER="ORDER";//知识库

';
comment on column CPIC_SXDX.C_SYS_FLOWNODE.tenementid
  is '租户ID';
comment on column CPIC_SXDX.C_SYS_FLOWNODE.isdefault
  is '默认岗位';
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
  is '知识库表

1.删除与修改时，要同时操作C_INFO_FAVORITE表和C_FAQ_VISIT_RECORD';
comment on column CPIC_SXDX.C_FAQ_CONTENT.contentid
  is 'CONTENTID';
comment on column CPIC_SXDX.C_FAQ_CONTENT.title
  is '标题：30个汉字';
comment on column CPIC_SXDX.C_FAQ_CONTENT.keyword
  is '关键字, 用逗号隔开';
comment on column CPIC_SXDX.C_FAQ_CONTENT.summary
  is '摘要';
comment on column CPIC_SXDX.C_FAQ_CONTENT.isdel
  is ' 0正常 1删除   默认0
为1时进入垃圾箱。如果从垃圾箱都从物理删除！';
comment on column CPIC_SXDX.C_FAQ_CONTENT.isprivated
  is '是否为私人知识点。默认0，1是。';
comment on column CPIC_SXDX.C_FAQ_CONTENT.isshared
  is '私人知道点，是否要共享？
默认0，1是。';
comment on column CPIC_SXDX.C_FAQ_CONTENT.companygroupid
  is '公司知识所属目录。对应v_faq_group视图中groupId';
comment on column CPIC_SXDX.C_FAQ_CONTENT.tenementid
  is '租户id,c_tenement外键！
user.getdefaulttenemnetid值置入';
comment on column CPIC_SXDX.C_FAQ_CONTENT.userid
  is '系统用户编号';
comment on column CPIC_SXDX.C_FAQ_CONTENT.createdate
  is '创建时间。为系统时间！收藏时间（精确到时分秒）';
comment on column CPIC_SXDX.C_FAQ_CONTENT.isfocuse
  is '是否为焦点
默认0。1是。仅对公司知识库有效。';
comment on column CPIC_SXDX.C_FAQ_CONTENT.focusdate
  is '设置焦点的时间';
comment on column CPIC_SXDX.C_FAQ_CONTENT.focususerid
  is '焦点设置人';
comment on column CPIC_SXDX.C_FAQ_CONTENT.deletedate
  is '删除时间';
comment on column CPIC_SXDX.C_FAQ_CONTENT.deleteuserid
  is '删除人';
comment on column CPIC_SXDX.C_FAQ_CONTENT.updatedate
  is '更新时间，等于系统时间';
comment on column CPIC_SXDX.C_FAQ_CONTENT.flowstatus
  is '状态。
    /**
     * 知识库审批状态
     */
    public static final String FAQ_FLOW_STATUS_INIT="00";//不审批（初始化）
    public static final String FAQ_FLOW_STATUS_WAITAUDIT="01";//待审批
    public static final String FAQ_FLOW_STATUS_AUDITING="05";//审批中
    public static final String FAQ_FLOW_STATUS_OK="10";//审批通过
    public static final String FAQ_FLOW_STATUS_FAIL="15";//审批不通过
';
comment on column CPIC_SXDX.C_FAQ_CONTENT.flowid
  is '工作流审批流程编号';
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
  is 'FAQ附件表。';
comment on column CPIC_SXDX.C_FAQ_ATTACHMENT.file_id
  is 'FILE_ID';
comment on column CPIC_SXDX.C_FAQ_ATTACHMENT.contentid
  is 'CONTENTID';
comment on column CPIC_SXDX.C_FAQ_ATTACHMENT.contenttype
  is '文件类型parent_code=faqfiletype

txt：文本类型
html：超文本类型
doc：word2007及兼容格式
docx：word2010及兼容格式
pdf：pdf文档
swf：flash的swf文档
';
comment on column CPIC_SXDX.C_FAQ_ATTACHMENT.pathfilename
  is 'FAQ正文。格式为由ftp.getPath+"/"+userid_yyyyMMdd_随机数+序号.后缀  组成';
comment on column CPIC_SXDX.C_FAQ_ATTACHMENT.naturefilename
  is '上传文件的实际文件名（含后缀）';
comment on column CPIC_SXDX.C_FAQ_ATTACHMENT.isimgage
  is '是否为图片，默认0。是为1.
';
comment on column CPIC_SXDX.C_FAQ_ATTACHMENT.isonline
  is '是否由在线编辑器编辑.默认0。否则为1';
comment on column CPIC_SXDX.C_FAQ_ATTACHMENT.ismain
  is '是否为正文。
1是。默认0';
comment on column CPIC_SXDX.C_FAQ_ATTACHMENT.filedesc
  is '文件描述';
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
  is '知识库日志表';
comment on column CPIC_SXDX.C_FAQ_AUDIT_LOG.logid
  is '主键';
comment on column CPIC_SXDX.C_FAQ_AUDIT_LOG.contentid
  is '外键 引用C_FAQ_CONTENT表主键';
comment on column CPIC_SXDX.C_FAQ_AUDIT_LOG.fromnodeid
  is '来源审批岗位';
comment on column CPIC_SXDX.C_FAQ_AUDIT_LOG.fromuserid
  is '源系统用户';
comment on column CPIC_SXDX.C_FAQ_AUDIT_LOG.tonodeid
  is '分配给机构组';
comment on column CPIC_SXDX.C_FAQ_AUDIT_LOG.touserid
  is '分配用户';
comment on column CPIC_SXDX.C_FAQ_AUDIT_LOG.auditremark
  is '处理意见';
comment on column CPIC_SXDX.C_FAQ_AUDIT_LOG.flowstatus
  is '状态';
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
  is '知识库评论！';
comment on column CPIC_SXDX.C_FAQ_COMMENT.commentid
  is 'commentid';
comment on column CPIC_SXDX.C_FAQ_COMMENT.contentid
  is '知识点编号';
comment on column CPIC_SXDX.C_FAQ_COMMENT.userid
  is '评论人';
comment on column CPIC_SXDX.C_FAQ_COMMENT.commentdate
  is '发布时间';
comment on column CPIC_SXDX.C_FAQ_COMMENT.commentlevel
  is '评论类别
数据字典
PARENT_ID:DICT_CUSTOMER_FAQ_COMMENTLEVEL
1.最好
2.好
3.一般
4.差
5.最好
';
comment on column CPIC_SXDX.C_FAQ_COMMENT.content
  is '评论内容
大小限制。';
comment on column CPIC_SXDX.C_FAQ_COMMENT.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_FAQ_COMMENT.flowstatus
  is '0（不审批）
5：审批中
10：审批通过
15：审批未通过

FlowStatusToken.java中
以"FAQ_FLOW"开头的常量。
    public static final String FAQ_FLOW_STATUS_INIT="0";//不审批（初始化）
    public static final String FAQ_FLOW_STATUS_AUDITING="5";//审批中
    public static final String FAQ_FLOW_STATUS_OK="10";//审批通过
    public static final String FAQ_FLOW_STATUS_FAIL="15";//审批不通过';
comment on column CPIC_SXDX.C_FAQ_COMMENT.flowid
  is '对应的审批流程编号';
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
  is '知识库临时表1.删除与修改时，要同时操作C_INFO_FAVORITE表和C_FAQ_VISIT_RECORD';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.contentid
  is 'CONTENTID';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.title
  is '标题：30个汉字';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.keyword
  is '关键字, 用逗号隔开';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.summary
  is '摘要';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.isprivated
  is '是否为私人知识点。默认0，1是。';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.isshared
  is '私人知道点，是否要共享？
默认0，1是。';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.companygroupid
  is '公司知识所属目录。对应v_faq_group视图中groupId';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.tenementid
  is '租户id,c_tenement外键！
user.getdefaulttenemnetid值置入';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.userid
  is '系统用户编号';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.createdate
  is '创建时间。为系统时间！收藏时间（精确到时分秒）';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.validateresult
  is '该字段为空，则说明数据正确。该字段保存校验出错信息。。';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.companycategorypath
  is '公司知识库目录';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.pathfilename
  is '对应ftp上保存的路径及文件名';
comment on column CPIC_SXDX.C_FAQ_CONTENT_TMP.naturefilename
  is '上传文件的实际文件名（含后缀）';
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
  is '知识库收藏夹

该表中有一些冗余字段，保存c_inf表在检索时少用。';
comment on column CPIC_SXDX.C_FAQ_FAVORITE.favoriteid
  is '收藏夹编号';
comment on column CPIC_SXDX.C_FAQ_FAVORITE.contentid
  is 'CONTENTID';
comment on column CPIC_SXDX.C_FAQ_FAVORITE.favoriteuserid
  is '当前收藏的用户';
comment on column CPIC_SXDX.C_FAQ_FAVORITE.favoritedate
  is '收藏时间（精确到时分秒）';
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
  is '目录ID';
comment on column CPIC_SXDX.C_FAQ_MENU.parentid
  is '父级目录ID';
comment on column CPIC_SXDX.C_FAQ_MENU.menulever
  is '目录级别';
comment on column CPIC_SXDX.C_FAQ_MENU.menuchame
  is '目录名称';
comment on column CPIC_SXDX.C_FAQ_MENU.menuename
  is '目录英文名称';
comment on column CPIC_SXDX.C_FAQ_MENU.tenementid
  is '租户';
comment on column CPIC_SXDX.C_FAQ_MENU.updateuser
  is '更新用户';
comment on column CPIC_SXDX.C_FAQ_MENU.updatedate
  is '更新时间';
comment on column CPIC_SXDX.C_FAQ_MENU.validstatus
  is '有效标志 0:有效，1为无效 ';
comment on column CPIC_SXDX.C_FAQ_MENU.left_val
  is '左支';
comment on column CPIC_SXDX.C_FAQ_MENU.right_val
  is '右支';
comment on column CPIC_SXDX.C_FAQ_MENU.remark
  is '备注';
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
  is '知识库访问情况统计';
comment on column CPIC_SXDX.C_FAQ_VISIT_RECORD.totalid
  is '访问统计编号';
comment on column CPIC_SXDX.C_FAQ_VISIT_RECORD.contentid
  is 'c_faq_content主键！';
comment on column CPIC_SXDX.C_FAQ_VISIT_RECORD.visitdatetime
  is '访问时间';
comment on column CPIC_SXDX.C_FAQ_VISIT_RECORD.userid
  is '访问人';
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
  is '首页面显示的内容的排序表';
comment on column CPIC_SXDX.C_FIRSTPAGE_CONTENT.userid
  is '系统帐户与登录帐户相同，唯一索引
只能是字母、数字+下划线';
comment on column CPIC_SXDX.C_FIRSTPAGE_CONTENT.categoryid
  is '菜单ID';
comment on column CPIC_SXDX.C_FIRSTPAGE_CONTENT.tenementid
  is '租户id';
comment on column CPIC_SXDX.C_FIRSTPAGE_CONTENT.disorder
  is '排序';
comment on column CPIC_SXDX.C_FIRSTPAGE_CONTENT.isdisplay
  is '是否显示。默认1
0：否（不显示）';
comment on column CPIC_SXDX.C_FIRSTPAGE_CONTENT.id
  is '主键';
comment on column CPIC_SXDX.C_FIRSTPAGE_CONTENT.layoutid
  is '页面布局容器ID';
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
  is '菜单快捷管理表';
comment on column CPIC_SXDX.C_FIRSTPAGE_SHORTCUT.shortcutid
  is 'ID';
comment on column CPIC_SXDX.C_FIRSTPAGE_SHORTCUT.categoryid
  is '规则：
一、00为一级菜单，0000为二级菜单，000000为三级菜单，以此类推；
二、对于活动目录，像faq等，一级菜单点三位，比如 000。';
comment on column CPIC_SXDX.C_FIRSTPAGE_SHORTCUT.userid
  is '系统帐户与登录帐户相同，唯一索引
只能是字母、数字+下划线';
comment on column CPIC_SXDX.C_FIRSTPAGE_SHORTCUT.tenementid
  is '主键';
comment on column CPIC_SXDX.C_FIRSTPAGE_SHORTCUT.disorder
  is '排序';
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
  is '组织机构对应的区号表';
comment on column CPIC_SXDX.C_GROUP_AREAMOBILE.categoryid
  is 'c_group_properties表外键，机构编号';
comment on column CPIC_SXDX.C_GROUP_AREAMOBILE.groupcode
  is '机构业务代码';
comment on column CPIC_SXDX.C_GROUP_AREAMOBILE.areacode
  is '具体区号由字典表维护';
comment on column CPIC_SXDX.C_GROUP_AREAMOBILE.mobilefix
  is '手机前缀，由字典表维护.';
comment on column CPIC_SXDX.C_GROUP_AREAMOBILE.tenementid
  is '同c_category_tenement对应的tenementid值相同';
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
  is '组织机构属性类型表,

  GroupTypeToken.java
  public static final Integer GROUPTYPE_GROUP=new Integer(1);//总部组织机构
  public static final Integer GROUPTYPE_GROUPADDRESS=new Integer(5);//职场
  public static final Integer GROUPTYPE_HEADQUARTER=new Integer(10);//总部
  public static final Integer GROUPTYPE_BRANCH=new Integer(15);//分公司
  public static final Integer GROUPTYPE_SUBBRANCH=new Integer(20);//部门/分支公司
  public static final Integer GROUPTYPE_FUNCDEPT=new Integer(25);//职能部门/中心
  ';
comment on column CPIC_SXDX.C_GROUP_TYPE.grouptypeid
  is '类型id';
comment on column CPIC_SXDX.C_GROUP_TYPE.name
  is '名称';
comment on column CPIC_SXDX.C_GROUP_TYPE.isdel
  is '默认0。删除1';
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
  is '组织机构属性表';
comment on column CPIC_SXDX.C_GROUP_PROPERTIES.categoryid
  is '主键，同时c_Category表外键。';
comment on column CPIC_SXDX.C_GROUP_PROPERTIES.allname
  is '全称';
comment on column CPIC_SXDX.C_GROUP_PROPERTIES.grouptypeid
  is '组织机构类型(C_GROUP_TYPE),常量GroupTypeToken.java中 GROUPTYPE_表头的常量';
comment on column CPIC_SXDX.C_GROUP_PROPERTIES.groupcode
  is '机构业务代码';
comment on column CPIC_SXDX.C_GROUP_PROPERTIES.tenementid
  is '租户id(冗余字段),同c_category_tenement对应的tenementid值相同';
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
  is '系统日志';
comment on column CPIC_SXDX.C_LOG.logid
  is 'ID';
comment on column CPIC_SXDX.C_LOG.function
  is '对象按钮或页面按钮对应的名称';
comment on column CPIC_SXDX.C_LOG.userid
  is 'c_user表外键';
comment on column CPIC_SXDX.C_LOG.remark
  is '详情描述';
comment on column CPIC_SXDX.C_LOG.tenementid
  is '租户id

租户ID为空的，则为超级管理员的日志。';
comment on column CPIC_SXDX.C_LOG.datetime
  is '操作时间';
comment on column CPIC_SXDX.C_LOG.username
  is '用户名
冗余字段。';
comment on column CPIC_SXDX.C_LOG.clientip
  is '客户端IP地址';
comment on column CPIC_SXDX.C_LOG.categoryid
  is '对象Id';
comment on column CPIC_SXDX.C_LOG.businessid
  is '业务Id';
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
  is '系统日志对应的操作菜单对象Id';
comment on column CPIC_SXDX.C_LOG_CATEGORY.id
  is '主键Id';
comment on column CPIC_SXDX.C_LOG_CATEGORY.categoryid
  is '菜单Id';
comment on column CPIC_SXDX.C_LOG_CATEGORY.tenementid
  is '租户编号';

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
  is '记录应用服务器对应的有效的mac地址及IP地址';
comment on column CPIC_SXDX.C_LOG_SERVERINFO.macaddress
  is 'MAC地址(默认)';
comment on column CPIC_SXDX.C_LOG_SERVERINFO.ipaddress
  is 'IP地址(默认)';
comment on column CPIC_SXDX.C_LOG_SERVERINFO.id
  is '主键';
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
  is '用户在线情况。

userID和clientIP唯一';
comment on column CPIC_SXDX.C_LOG_USER_ONLINE.userid
  is '用户';
comment on column CPIC_SXDX.C_LOG_USER_ONLINE.logindatetime
  is '登录时间';
comment on column CPIC_SXDX.C_LOG_USER_ONLINE.clientip
  is '客户端IP';
comment on column CPIC_SXDX.C_LOG_USER_ONLINE.tenementid
  is '当前登录的租户';
comment on column CPIC_SXDX.C_LOG_USER_ONLINE.onlineid
  is '主键';
comment on column CPIC_SXDX.C_LOG_USER_ONLINE.logoutdatetime
  is '登出时间';
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
  is '活动与数据列表关系表
';
comment on column CPIC_SXDX.C_OB_COMPAIGN_DATALIST.compaignid
  is '活动编号';
comment on column CPIC_SXDX.C_OB_COMPAIGN_DATALIST.datalistid
  is '列表编号';
comment on column CPIC_SXDX.C_OB_COMPAIGN_DATALIST.createdate
  is '绑定时间';
comment on column CPIC_SXDX.C_OB_COMPAIGN_DATALIST.createuserid
  is '绑定用户';
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
  is '知识库与活动绑定关系表';
comment on column CPIC_SXDX.C_OB_COMPAIGN_FAQ.contentid
  is '知识库编号c_faq_content';
comment on column CPIC_SXDX.C_OB_COMPAIGN_FAQ.compaignid
  is '活动编号';
comment on column CPIC_SXDX.C_OB_COMPAIGN_FAQ.id
  is '主键';
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
  is '活动与产品关系表';
comment on column CPIC_SXDX.C_OB_COMPAIGN_PRODUCT.id
  is 'ID';
comment on column CPIC_SXDX.C_OB_COMPAIGN_PRODUCT.compaignid
  is '活动编号';
comment on column CPIC_SXDX.C_OB_COMPAIGN_PRODUCT.productid
  is '产品基本信息编号';
comment on column CPIC_SXDX.C_OB_COMPAIGN_PRODUCT.suiteid
  is '套餐编号';
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
  is '话术管理';
comment on column CPIC_SXDX.C_OB_WORDSKILL.skillid
  is '话术编号';
comment on column CPIC_SXDX.C_OB_WORDSKILL.name
  is '话术名称';
comment on column CPIC_SXDX.C_OB_WORDSKILL.content
  is '话术内容';
comment on column CPIC_SXDX.C_OB_WORDSKILL.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_OB_WORDSKILL.createdate
  is '创建时间';
comment on column CPIC_SXDX.C_OB_WORDSKILL.createuserid
  is '创建者';
comment on column CPIC_SXDX.C_OB_WORDSKILL.isdel
  is '删除
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
  is '营销与话术关系表';
comment on column CPIC_SXDX.C_OB_COMPAIGN_SKILL.id
  is '主键';
comment on column CPIC_SXDX.C_OB_COMPAIGN_SKILL.skillid
  is '话术编号';
comment on column CPIC_SXDX.C_OB_COMPAIGN_SKILL.compaignid
  is '活动编号';
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
  is '指定租户下营销配置

除重配置：

1.如当前租户下，无对应的有效活动除重规则，则默认按客户编号在有效活动中除重。';
comment on column CPIC_SXDX.C_OB_CONFIG.tenementid
  is 'tenementId';
comment on column CPIC_SXDX.C_OB_CONFIG.predicdtfactory
  is '预测试外呼厂商


对应常量ContactToken.java中以CONTACT_FACTORY开头的常量';
comment on column CPIC_SXDX.C_OB_CONFIG.repeatmodel
  is '有效活动除重方式

CompaignToken.java
    public final static String COMPAIGN_REPEATTYPE_CUSID="1";       //根据客户编号在有效活动内除重
    public final static String COMPAIGN_REPEATTYPE_NULL="2";         //在有效活动内不除重
    public final static String COMPAIGN_REPEATTYPE_CUSRUNIQUE="3";  //根据客户唯一性要求在有效活动内除重

//根据客户唯一性要求在有效活动内除重

默认1';
comment on column CPIC_SXDX.C_OB_CONFIG.onlyphoningcasing
  is '仅允许在通话状态下录单。

1是。0或null否。（默认为0）,对应常量:compaignToken.java中ONLYPHONECASING_开头的常量';
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
  is '营销执行方式，对应CompaignToken.java中以EXECUTE_TYPE开头的常量';
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
  is '名单处理或分配日志';
comment on column CPIC_SXDX.C_OB_LIST_ASSIGN_LOG.logid
  is 'LogId';
comment on column CPIC_SXDX.C_OB_LIST_ASSIGN_LOG.compaignid
  is '活动编号';
comment on column CPIC_SXDX.C_OB_LIST_ASSIGN_LOG.datalistid
  is '列表编号';
comment on column CPIC_SXDX.C_OB_LIST_ASSIGN_LOG.userid
  is '座席编号';
comment on column CPIC_SXDX.C_OB_LIST_ASSIGN_LOG.planassigncount
  is '手工分配的名单数';
comment on column CPIC_SXDX.C_OB_LIST_ASSIGN_LOG.factassigncount
  is '实际分配的数据';
comment on column CPIC_SXDX.C_OB_LIST_ASSIGN_LOG.acceptcount
  is '总接收的名单数';
comment on column CPIC_SXDX.C_OB_LIST_ASSIGN_LOG.dealcount
  is '实际拨打数（即任务提交后的次数）';
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
  is '名单池';
comment on column CPIC_SXDX.C_OB_LIST_POOL.id
  is 'id';
comment on column CPIC_SXDX.C_OB_LIST_POOL.compaignid
  is '活动编号';
comment on column CPIC_SXDX.C_OB_LIST_POOL.cus_id
  is '名单编号';
comment on column CPIC_SXDX.C_OB_LIST_POOL.datalistid
  is '列表编号';
comment on column CPIC_SXDX.C_OB_LIST_POOL.busisource
  is '业务来源

数据字典：

parentId=busiSource  业务来源
';
comment on column CPIC_SXDX.C_OB_LIST_POOL.isimport
  is '是否已导入预测式外呼设备
0否（默认），1是';
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
  is '名单数据统计表';
comment on column CPIC_SXDX.C_OB_LIST_TOTAL.logid
  is 'LogId';
comment on column CPIC_SXDX.C_OB_LIST_TOTAL.campaignid
  is '活动编号';
comment on column CPIC_SXDX.C_OB_LIST_TOTAL.datalistid
  is '列表编号';
comment on column CPIC_SXDX.C_OB_LIST_TOTAL.userid
  is '座席编号';
comment on column CPIC_SXDX.C_OB_LIST_TOTAL.planassigncount
  is '手工分配的名单数';
comment on column CPIC_SXDX.C_OB_LIST_TOTAL.factassigncount
  is '实际分配的数据';
comment on column CPIC_SXDX.C_OB_LIST_TOTAL.acceptcount
  is '总接收的名单数';
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
  is '问卷类别

1. 单选题: 答案为 topicdetailId
2. 多选题: 答案为多个 topicdetailId
3. 判断题:答案为0或1，0否，1是真。
4. 问答题:答案为客户回答';
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
  is '问卷组';
comment on column CPIC_SXDX.C_OB_TOPIC_GROUP.topicgroupid
  is '题项组编号';
comment on column CPIC_SXDX.C_OB_TOPIC_GROUP.name
  is '问卷标题';
comment on column CPIC_SXDX.C_OB_TOPIC_GROUP.topictypeid
  is '问卷类型';
comment on column CPIC_SXDX.C_OB_TOPIC_GROUP.topicid
  is '题项编号';
comment on column CPIC_SXDX.C_OB_TOPIC_GROUP.disorder
  is '排序';
comment on column CPIC_SXDX.C_OB_TOPIC_GROUP.displaytag
  is '显示条件

0 无条件全显示
1 不显示
2 根据c_topic_CONDITION表设置条件显示';
comment on column CPIC_SXDX.C_OB_TOPIC_GROUP.tenementid
  is '租户ID';
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
  is '营销题项';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL.detailid
  is '题项明细编号';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL.topicid
  is '题项编号';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL.topicgroupid
  is '组编号';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL.code
  is '代码，同一个topicgroupId下，code唯一（只能不字母或数字）

判断题的detail为固定：
code=1
name=是

code=0
name=否';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL.name
  is '题目名称';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL.disorder
  is '排序';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL.displaytag
  is '显示条件

0 无条件全显示
1 不显示
2 根据c_topic_CONDITION表设置条件显示';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL.tenementid
  is '租户ID';
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
  is '跳题设置


topicgroupId：不为空，则为指定组的显示设置
      （当displaygroupId和displaydetailId都不为空，则指定displaydetailId选中时topicgroupId显示
         当displaygroupId不为空和displaydetailId为空，则displaygroupId显示时topicgroupId显示）
detailid：不为空，则为指定题项的显示设置，且displaydetailId不为空。displaygroupId一定为空。
         detailid的显示条件只能由同一个组内的detailid设置。

';
comment on column CPIC_SXDX.C_OB_TOPIC_CONDITION.conditionid
  is '跳题编号';
comment on column CPIC_SXDX.C_OB_TOPIC_CONDITION.topicgroupid
  is '题项组编号';
comment on column CPIC_SXDX.C_OB_TOPIC_CONDITION.detailid
  is '题项明细编号';
comment on column CPIC_SXDX.C_OB_TOPIC_CONDITION.displaygroupid
  is '使topicgroupId显示的条件，如果同一个记录“displaydetailId“不为空，则topicgroupId对应的displaydetailid为显示条件。';
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
  is '营销题项结果';
comment on column CPIC_SXDX.C_OB_TOPIC_RESULT.resultid
  is '题项结果编号';
comment on column CPIC_SXDX.C_OB_TOPIC_RESULT.callhistoryid
  is '服务历史编号';
comment on column CPIC_SXDX.C_OB_TOPIC_RESULT.compaignid
  is '活动编号';
comment on column CPIC_SXDX.C_OB_TOPIC_RESULT.topicid
  is '题项编号';
comment on column CPIC_SXDX.C_OB_TOPIC_RESULT.taskid
  is '任务编号';
comment on column CPIC_SXDX.C_OB_TOPIC_RESULT.cus_id
  is '编号';
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
  is '营销题项结果';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL_RESULT.topicdetailresultid
  is '题项结果明细编号';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL_RESULT.topicgroupid
  is '题项组编号';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL_RESULT.campaignid
  is '活动编号';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL_RESULT.topicid
  is '题项编号，C_OB_TOPIC表主键。';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL_RESULT.result
  is '选中的项';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL_RESULT.answerremark
  is '答案描述';
comment on column CPIC_SXDX.C_OB_TOPIC_DETAIL_RESULT.callhistoryid
  is '呼叫历史编号,c_call_historyId外键。';
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
  is '订单基本信息表';
comment on column CPIC_SXDX.C_ORDER_INFO.orderid
  is '订单ID';
comment on column CPIC_SXDX.C_ORDER_INFO.casestatus
  is '订单状态，字典
parent_code=casestatus

=0  初始化
=1 工作完成
=2 开始工作流
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
  is '工单日志编号';
comment on column CPIC_SXDX.C_ORDER_LOG.orderid
  is 'orderId';
comment on column CPIC_SXDX.C_ORDER_LOG.name
  is '工单类型';
comment on column CPIC_SXDX.C_ORDER_LOG.fromgroupid
  is '源组';
comment on column CPIC_SXDX.C_ORDER_LOG.fromuserid
  is 'fromUserId';
comment on column CPIC_SXDX.C_ORDER_LOG.togroupid
  is 'toGroupId';
comment on column CPIC_SXDX.C_ORDER_LOG.touserid
  is 'toUserID';
comment on column CPIC_SXDX.C_ORDER_LOG.tenementid
  is 'tenementid';
comment on column CPIC_SXDX.C_ORDER_LOG.summary
  is '处理意见';
comment on column CPIC_SXDX.C_ORDER_LOG.orderstatus
  is '订单状态

数据字典：
parentId=orderStatus


共享内置字典-->

（对应常量 flowstatustoken.java中以order_status开头的常量）
00：待接收
01：待处理
02：处理中
90：完成
91：取消';
comment on column CPIC_SXDX.C_ORDER_LOG.exttablecontent
  is '扩展信息内容。格式：

fieldId：字段中文名：值|
fieldId：字段中文名：值|
fieldId：字段中文名：值|
fieldId：字段中文名：值|
fieldId：字段中文名：值|';
comment on column CPIC_SXDX.C_ORDER_LOG.createdate
  is '创建时间';
comment on column CPIC_SXDX.C_ORDER_LOG.productid
  is '产品编号';
comment on column CPIC_SXDX.C_ORDER_LOG.productsuiteid
  is '套餐编号';
comment on column CPIC_SXDX.C_ORDER_LOG.cus_id
  is '客户编号';
comment on column CPIC_SXDX.C_ORDER_LOG.task_id
  is '任务编号';
comment on column CPIC_SXDX.C_ORDER_LOG.callhistoryid
  is '服务历史编号';
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
  is '系统参数类型,isfaqaudit：FAQ是否审批？ismarqueen：跑马灯是否启动？isplayagentid：是否报工号；istransfersurvey：是否转满意度调度';
comment on column CPIC_SXDX.C_PARAMETER_TYPE.typeid
  is '编号';
comment on column CPIC_SXDX.C_PARAMETER_TYPE.typename
  is '名称';
comment on column CPIC_SXDX.C_PARAMETER_TYPE.isbooleanvalue
  is '值是否为布尔类型
默认(1)是   0否。

如果是布尔类型，而参数值分别: 1代表是, 0代表否。

';
comment on column CPIC_SXDX.C_PARAMETER_TYPE.isdel
  is '值是否为布尔类型
默认(1)是   0否。

如果是布尔类型，而参数值分别: 1代表是, 0代表否。

';
comment on column CPIC_SXDX.C_PARAMETER_TYPE.defaultvalue
  is '默认值';
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
  is '多租户对应的参数表';
comment on column CPIC_SXDX.C_PARAMETER_TENEMENT.id
  is '编号(主键)';
comment on column CPIC_SXDX.C_PARAMETER_TENEMENT.tenementid
  is '租户ID';
comment on column CPIC_SXDX.C_PARAMETER_TENEMENT.typeid
  is '类型编号';
comment on column CPIC_SXDX.C_PARAMETER_TENEMENT.typename
  is '(冗余)类型名称';
comment on column CPIC_SXDX.C_PARAMETER_TENEMENT.paramvalue
  is '值。如果参数为boolean值的话，则只能为true和false';
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
  is '产品元素字典表';
comment on column CPIC_SXDX.C_PRODUCT_DICT_ELEMENT.dictelementid
  is '元素编号';
comment on column CPIC_SXDX.C_PRODUCT_DICT_ELEMENT.elementname
  is '产品元素值';
comment on column CPIC_SXDX.C_PRODUCT_DICT_ELEMENT.tenementid
  is '租户ID';
comment on column CPIC_SXDX.C_PRODUCT_DICT_ELEMENT.isdel
  is '是否删除。默认0，1是。';
comment on column CPIC_SXDX.C_PRODUCT_DICT_ELEMENT.datatype
  is '数据字典parent_id=dbdata_typ 中dictionarycode的值
在输入产品元素进行数值校验时用CustomFormTokens.getSqlType(dictionarycode)返回Types枚举进行校验';
comment on column CPIC_SXDX.C_PRODUCT_DICT_ELEMENT.disorder
  is '排序';
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
  is '产品基本信息';
comment on column CPIC_SXDX.C_PRODUCT_INFO.productid
  is '产品基本信息编号';
comment on column CPIC_SXDX.C_PRODUCT_INFO.productname
  is '品名';
comment on column CPIC_SXDX.C_PRODUCT_INFO.productcode
  is '产品编号';
comment on column CPIC_SXDX.C_PRODUCT_INFO.productcategoryid
  is '产品目录，数据字典（树状）
PARENT_ID=PRO_DICT  产品目录';
comment on column CPIC_SXDX.C_PRODUCT_INFO.belong
  is '0：公司自有产品
1：第三方产品';
comment on column CPIC_SXDX.C_PRODUCT_INFO.factory
  is '厂家，列表数据字典：PARENT_ID=PROFACTORY  产品产商列表';
comment on column CPIC_SXDX.C_PRODUCT_INFO.productdate
  is '生产时间';
comment on column CPIC_SXDX.C_PRODUCT_INFO.expiredate
  is '过期时间';
comment on column CPIC_SXDX.C_PRODUCT_INFO.price
  is '产品单价，RMB（元）';
comment on column CPIC_SXDX.C_PRODUCT_INFO.saleprice
  is '折后价，RMB（元）';
comment on column CPIC_SXDX.C_PRODUCT_INFO.rate
  is '汇率（100%）';
comment on column CPIC_SXDX.C_PRODUCT_INFO.remark
  is '产品备注';
comment on column CPIC_SXDX.C_PRODUCT_INFO.isdel
  is '是否删除。
0默认。
1为删除。';
comment on column CPIC_SXDX.C_PRODUCT_INFO.tenementid
  is '租户Id';
comment on column CPIC_SXDX.C_PRODUCT_INFO.productunit
  is '产品计件单位，数据字典：parent_id=pro_unit';
comment on column CPIC_SXDX.C_PRODUCT_INFO.vali_date
  is '生效时间';
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
  is '产品元素表';
comment on column CPIC_SXDX.C_PRODUCT_ELEMENT.elementid
  is '产品元素编号';
comment on column CPIC_SXDX.C_PRODUCT_ELEMENT.productid
  is '产品基本信息编号';
comment on column CPIC_SXDX.C_PRODUCT_ELEMENT.dictelementid
  is '产品元素代码
';
comment on column CPIC_SXDX.C_PRODUCT_ELEMENT.elementvalue
  is '产品元素值';
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
  is '产品元素表';
comment on column CPIC_SXDX.C_PRODUCT_ELEMENT_TMP.elementid
  is '产品元素编号';
comment on column CPIC_SXDX.C_PRODUCT_ELEMENT_TMP.productid
  is '产品基本信息编号';
comment on column CPIC_SXDX.C_PRODUCT_ELEMENT_TMP.dictelementid
  is '产品元素代码
';
comment on column CPIC_SXDX.C_PRODUCT_ELEMENT_TMP.elementvalue
  is '产品元素值';

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
  is '产品基本信息';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.productid
  is '产品基本信息编号';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.productname
  is '品名';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.productcode
  is '产品编号';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.productcategoryid
  is '产品目录，数据字典（树状）
PARENT_ID=PRO_DICT  产品目录';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.productcategoryname
  is '目录名称';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.belong
  is '0：公司自有产品
1：第三方产品';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.factory
  is '厂家，列表数据字典：PARENT_ID=PROFACTORY  产品产商列表';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.factoryname
  is '厂家名称';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.productdate
  is '生产时间';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.expiredate
  is '过期时间';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.price
  is '产品单价，RMB（元）';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.saleprice
  is '折后价，RMB（元）';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.rate
  is '汇率（100%）';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.tenementid
  is '租户Id';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.productunit
  is '产品计件单位，数据字典：parent_id=pro_unit';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.productunitname
  is '单位名称';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.validateresult
  is '该字段为空，则说明数据正确。该字段保存校验出错信息。。';
comment on column CPIC_SXDX.C_PRODUCT_INFO_TMP.vali_date
  is '生效时间';

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
  is '产品套件';
comment on column CPIC_SXDX.C_PRODUCT_SUITE.suiteid
  is '套餐编号';
comment on column CPIC_SXDX.C_PRODUCT_SUITE.suitename
  is '套餐名称';
comment on column CPIC_SXDX.C_PRODUCT_SUITE.suiteprice
  is '套餐价格(RMB元）';
comment on column CPIC_SXDX.C_PRODUCT_SUITE.salesuiteprice
  is '折扣套餐价格(RMB元)';
comment on column CPIC_SXDX.C_PRODUCT_SUITE.suitrate
  is '汇率(100%)';
comment on column CPIC_SXDX.C_PRODUCT_SUITE.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_PRODUCT_SUITE.remark
  is '套餐描述';
comment on column CPIC_SXDX.C_PRODUCT_SUITE.isdel
  is '默认0。1是。';
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
  is '产品套件与产品关系表。
productid  和 suiteid两者唯一';
comment on column CPIC_SXDX.C_PRODUCT_SUITE_PRODUCT.id
  is '套件关系表主键。';
comment on column CPIC_SXDX.C_PRODUCT_SUITE_PRODUCT.productid
  is '产品基本信息编号';
comment on column CPIC_SXDX.C_PRODUCT_SUITE_PRODUCT.suiteid
  is '套件Id';
comment on column CPIC_SXDX.C_PRODUCT_SUITE_PRODUCT.used
  is '用途
PARENT_ID=PRO_USED   用途';
comment on column CPIC_SXDX.C_PRODUCT_SUITE_PRODUCT.ispresent
  is '是否赠品，0否，1.是（默认0）';
comment on column CPIC_SXDX.C_PRODUCT_SUITE_PRODUCT.count
  is '数量';
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
  is '角色表

特殊说明：
1、删除角色之前先将其关联的系统用户删除，否则不能删除角色记录。
2、删除时，同时将角色下的菜单权限也一样删除。
';
comment on column CPIC_SXDX.C_ROLE.roleid
  is 'ROLEID';
comment on column CPIC_SXDX.C_ROLE.tenementid
  is '主键';
comment on column CPIC_SXDX.C_ROLE.name
  is '角色名';
comment on column CPIC_SXDX.C_ROLE.updatedate
  is '更新时间';
comment on column CPIC_SXDX.C_ROLE.updateuserid
  is '更新用户';
comment on column CPIC_SXDX.C_ROLE.isdel
  is '默认0
删除为1';
comment on column CPIC_SXDX.C_ROLE.remark
  is 'REMARK';
comment on column CPIC_SXDX.C_ROLE.role_type
  is '角色类型';
comment on column CPIC_SXDX.C_ROLE.create_user
  is '创建人';
comment on column CPIC_SXDX.C_ROLE.create_time
  is '创建时间';
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
  is '角色与菜单（权限）';
comment on column CPIC_SXDX.C_ROLE_FUNCTION.roleid
  is 'ROLEID  外键';
comment on column CPIC_SXDX.C_ROLE_FUNCTION.active_categoryid
  is '菜单对应的活动目录';
comment on column CPIC_SXDX.C_ROLE_FUNCTION.readwrite
  is '可浏览编辑

0:仅浏览权
1:可读写

默认0';
comment on column CPIC_SXDX.C_ROLE_FUNCTION.categoryid
  is '菜单ID';
comment on column CPIC_SXDX.C_ROLE_FUNCTION.functionid
  is '角色功能主键';
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
  is '服务器类别；

1. 知识库FTP
2. 常规FTP（存员工相片等）
3. 渠道类型对应的服务器信息
4. CTI主服务器
5. CTI备份服务器
6  录音调听地址
7. 录音调用URL
8  .邮件
9. 传真
10. webchat
11 .微博';
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
  is '租户的服务器信息配置表';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.serverid
  is 'ID';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.name
  is '冗余字段，等于servertypeid字典表中的名称。';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.servertypeid
  is '服务器类型ID';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.tenementid
  is '租户
1。如果对应的租户有相关的服务器信息，以租户对应的记录为主。如果不存在，则公共服务器取。';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.serveraddress
  is '服务器参数的IP地址
';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.port
  is '端口';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.rusername
  is '服务器对应的只读帐户';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.rpassword
  is '只读帐户密码';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.rwusername
  is '读写帐户';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.rwpassword
  is '读写帐户密码';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.ext1
  is '扩展1';
comment on column CPIC_SXDX.C_SERVER_TENEMENT.serverpath
  is '路径';
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
  is '服务器组（技能组）字典';
comment on column CPIC_SXDX.C_SERVER_GROUP.groupno
  is 'GROUPNO, 对应语音为技能组';
comment on column CPIC_SXDX.C_SERVER_GROUP.tenementid
  is '主键';
comment on column CPIC_SXDX.C_SERVER_GROUP.name
  is '名称';
comment on column CPIC_SXDX.C_SERVER_GROUP.isdel
  is '默认0
1删除';
comment on column CPIC_SXDX.C_SERVER_GROUP.serverid
  is '服务器编号
如果为空，否则为普通的话务技能组，否则为对应的服务器相应的技能组。
用于像传真等分组接收的情况。';
comment on column CPIC_SXDX.C_SERVER_GROUP.typecode
  is '属于哪个联系渠道类型,如果为语音,则为技能组';
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
  is '用户和技能组关系表';
comment on column CPIC_SXDX.C_SERVER_GROUP_USER.userid
  is '系统帐户与登录帐户相同，唯一索引
只能是字母、数字+下划线';
comment on column CPIC_SXDX.C_SERVER_GROUP_USER.groupid
  is '服务器组';
comment on column CPIC_SXDX.C_SERVER_GROUP_USER.tenementid
  is '主键';
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
  is '配置岗ID';
comment on column CPIC_SXDX.C_SYS_FLOWNODE_USERGROUP.categoryid
  is '用户组ID';
comment on column CPIC_SXDX.C_SYS_FLOWNODE_USERGROUP.tenementid
  is '租户ID';
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
  is '任务设置

默认1000条记录。';
comment on column CPIC_SXDX.C_TASK_CONFIG.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_TASK_CONFIG.resultrecord
  is '个人任务返回的结果集（最大数）';
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
  is '任务处理小结';
comment on column CPIC_SXDX.C_TASK_LOG.tasklogid
  is 'taskLogId';
comment on column CPIC_SXDX.C_TASK_LOG.taskid
  is '任务编号';
comment on column CPIC_SXDX.C_TASK_LOG.compaignid
  is '活动编号，则对像c_ob_compaign中的主键：CAMPAIGNID';
comment on column CPIC_SXDX.C_TASK_LOG.cus_id
  is '编号';
comment on column CPIC_SXDX.C_TASK_LOG.customename
  is '客户名称（冗余字段）';
comment on column CPIC_SXDX.C_TASK_LOG.datalistid
  is '数据列表编号';
comment on column CPIC_SXDX.C_TASK_LOG.fromuserid
  is '分配用户';
comment on column CPIC_SXDX.C_TASK_LOG.fromdate
  is '分配时间';
comment on column CPIC_SXDX.C_TASK_LOG.togroupid
  is '如果为指定用户，则用户组为用户对应的默认用户组。

对应v_group视图中的外键。';
comment on column CPIC_SXDX.C_TASK_LOG.touserid
  is '分配用户Id，如果该值为空，则分配给全组。';
comment on column CPIC_SXDX.C_TASK_LOG.isbook
  is '是否有预约';
comment on column CPIC_SXDX.C_TASK_LOG.bookdatetime
  is '预约时间。精确至时分秒。';
comment on column CPIC_SXDX.C_TASK_LOG.contacttype
  is '渠道方式：C_contact_type表  由常量类：ContactTypeFactoryToken.java中“CONTACT_TYPE_"头的常量表示';
comment on column CPIC_SXDX.C_TASK_LOG.fromtaskid
  is '从来源编号，外呼，则对像c_ob_compaign中的主键：CAMPAIGNID';
comment on column CPIC_SXDX.C_TASK_LOG.tasktypeid
  is '任务类别

对应常量：
TaskToken.java中以“TASK_TYPE_”开头的常量10：外呼营销
TaskToken.java中以“TASK_TYPE_”开头的常量11：待分配任务

今后可扩展';
comment on column CPIC_SXDX.C_TASK_LOG.busisource
  is '数据来源

数据字典：

parentId=busiSource  业务来源
';
comment on column CPIC_SXDX.C_TASK_LOG.busitype
  is '业务类型（树状）

数据字典：

parentId=busiType';
comment on column CPIC_SXDX.C_TASK_LOG.taskstatusid
  is '状态编号
';
comment on column CPIC_SXDX.C_TASK_LOG.taskstatuschildid
  is '子状态编号';
comment on column CPIC_SXDX.C_TASK_LOG.createdate
  is '任务创建时间';
comment on column CPIC_SXDX.C_TASK_LOG.createuserid
  is '任务创建用户';
comment on column CPIC_SXDX.C_TASK_LOG.callhistoryid
  is '当前LOG的服务历史编号';
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
  is '任务表中参加优先级排序的字段字典表';
comment on column CPIC_SXDX.C_TASK_PRIORITY.taskentityfield
  is '任务表对应的实体字段名';
comment on column CPIC_SXDX.C_TASK_PRIORITY.remark
  is '中文描述';
comment on column CPIC_SXDX.C_TASK_PRIORITY.foreign_entity
  is '排序表名';
comment on column CPIC_SXDX.C_TASK_PRIORITY.foreign_entity_field
  is '排序表主键';
comment on column CPIC_SXDX.C_TASK_PRIORITY.foreign_entity_orderfield
  is '排序字段名';
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
  is '数据来源优先级排序表';
comment on column CPIC_SXDX.C_TASK_PRIORITY_BUSISOURCE.id
  is '数据来源优先级排序表编号';
comment on column CPIC_SXDX.C_TASK_PRIORITY_BUSISOURCE.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_TASK_PRIORITY_BUSISOURCE.busisource
  is '数据来源';
comment on column CPIC_SXDX.C_TASK_PRIORITY_BUSISOURCE.disorder
  is '排序';
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
  is '任务子状态优先级排序表';
comment on column CPIC_SXDX.C_TASK_PRIORITY_CHILDSTATUS.id
  is '状态优先级主键';
comment on column CPIC_SXDX.C_TASK_PRIORITY_CHILDSTATUS.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_TASK_PRIORITY_CHILDSTATUS.taskstatuschildid
  is '子状态';
comment on column CPIC_SXDX.C_TASK_PRIORITY_CHILDSTATUS.disorder
  is '排序字段';
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
  is '任务状态优先级设置

一个租户与一个用户唯一值';
comment on column CPIC_SXDX.C_TASK_PRIORITY_CONFIG.priorityid
  is '优先级主键';
comment on column CPIC_SXDX.C_TASK_PRIORITY_CONFIG.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_TASK_PRIORITY_CONFIG.tasktypeid
  is '任务类别

对应常量：
TaskToken.java中以“TASK_TYPE_”开头的常量10：外呼营销
TaskToken.java中以“TASK_TYPE_”开头的常量11：待分配任务

今后可扩展';
comment on column CPIC_SXDX.C_TASK_PRIORITY_CONFIG.taskentityfield
  is '先级别字段列表

以“逗”号分隔

该成可以在sql后直接使用的排序列。';
comment on column CPIC_SXDX.C_TASK_PRIORITY_CONFIG.disorder
  is '优先级排序';
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
  is '任务状态优先级排序表';
comment on column CPIC_SXDX.C_TASK_PRIORITY_TASKSTATUS.id
  is '状态优先级主键';
comment on column CPIC_SXDX.C_TASK_PRIORITY_TASKSTATUS.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_TASK_PRIORITY_TASKSTATUS.taskstatus
  is '任务状态';
comment on column CPIC_SXDX.C_TASK_PRIORITY_TASKSTATUS.disorder
  is '排序字段';
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
  is '任务与产品的关系表';
comment on column CPIC_SXDX.C_TASK_PRODUCT.id
  is 'ID';
comment on column CPIC_SXDX.C_TASK_PRODUCT.taskid
  is '任务编号';
comment on column CPIC_SXDX.C_TASK_PRODUCT.productid
  is '产品基本信息编号';
comment on column CPIC_SXDX.C_TASK_PRODUCT.suiteid
  is '套餐编号';
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
  is '测试表';
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
  is '用户联络方式对应的扩展表。';
comment on column CPIC_SXDX.C_USER_CONTACT_EXT.id
  is '编号';
comment on column CPIC_SXDX.C_USER_CONTACT_EXT.typecode
  is '渠道类型';
comment on column CPIC_SXDX.C_USER_CONTACT_EXT.userid
  is '用户编号';
comment on column CPIC_SXDX.C_USER_CONTACT_EXT.isdel
  is '默认0. 1删除';
comment on column CPIC_SXDX.C_USER_CONTACT_EXT.tenementid
  is '租户编号';
comment on column CPIC_SXDX.C_USER_CONTACT_EXT.factorycode
  is '厂商编码，C_CONTACT_FACTORY表对应的值';
comment on column CPIC_SXDX.C_USER_CONTACT_EXT.typevalue
  is '渠道号';
comment on column CPIC_SXDX.C_USER_CONTACT_EXT.contacttypedefault
  is '1是,0否.. 如果TYPECODE和FACTORYCODE下只有一个typevalue,自动将其置为1';
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
  is 'userid、roleid、category_id、active_categoryid 四个字段唯了。';
comment on column CPIC_SXDX.C_USER_FUNCTION.userfunctionid
  is 'USERFUNCTIONID';
comment on column CPIC_SXDX.C_USER_FUNCTION.userid
  is '系统用户';
comment on column CPIC_SXDX.C_USER_FUNCTION.categoryid
  is '菜单Id';
comment on column CPIC_SXDX.C_USER_FUNCTION.readwrite
  is '可浏览编辑

0:仅浏览权
1:可读写

默认0';
comment on column CPIC_SXDX.C_USER_FUNCTION.tenementid
  is '租户ID';
comment on column CPIC_SXDX.C_USER_FUNCTION.active_categoryid
  is '菜单对应的活动目录ID。当活动目录Id为空时，为菜单本身权限。';
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
  is '用户组与用户之关的关系
C_USER_CATEGORY

超级管理员只可以有一个用户组。';
comment on column CPIC_SXDX.C_USER_GROUP.userid
  is '系统用户编号';
comment on column CPIC_SXDX.C_USER_GROUP.groupid
  is '用户组ID';
comment on column CPIC_SXDX.C_USER_GROUP.tenementid
  is '租户ID';
comment on column CPIC_SXDX.C_USER_GROUP.isteamleader
  is '是否为团队领导。1是。默认为0';
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
  is '系统用户在线情况表!

userID和clientIP唯一, 用户不可以同时在不同的租户下登录.';
comment on column CPIC_SXDX.C_USER_ONLINE.userid
  is '用户';
comment on column CPIC_SXDX.C_USER_ONLINE.logindatetime
  is '登录时间';
comment on column CPIC_SXDX.C_USER_ONLINE.clientip
  is '客户端IP';
comment on column CPIC_SXDX.C_USER_ONLINE.tenementid
  is '当前登录的租户';
comment on column CPIC_SXDX.C_USER_ONLINE.onlineid
  is '主键';
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
  is '用户与角色关系表';
comment on column CPIC_SXDX.C_USER_ROLE.roleid
  is 'ROLEID';
comment on column CPIC_SXDX.C_USER_ROLE.userid
  is 'USERID';
comment on column CPIC_SXDX.C_USER_ROLE.tenementid
  is '租户ID';
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
  is '定义批次表';
comment on column CPIC_SXDX.F_BATCH.batch_id
  is '批次号';
comment on column CPIC_SXDX.F_BATCH.batch_code
  is '批次编码';
comment on column CPIC_SXDX.F_BATCH.batch_name
  is '批次名称';
comment on column CPIC_SXDX.F_BATCH.create_time
  is '创建时间';
comment on column CPIC_SXDX.F_BATCH.plan_dial_date
  is '计划拨打年月';
comment on column CPIC_SXDX.F_BATCH.com_type
  is '名单类型';
comment on column CPIC_SXDX.F_BATCH.prj_id
  is '批次项目';
comment on column CPIC_SXDX.F_BATCH.company_id
  is '分公司';
comment on column CPIC_SXDX.F_BATCH.area_id
  is '城市';
comment on column CPIC_SXDX.F_BATCH.call_times
  is '拨打次数';
comment on column CPIC_SXDX.F_BATCH.back_date
  is '名单回收日期';
comment on column CPIC_SXDX.F_BATCH.ob_com_id
  is '活动ID';
comment on column CPIC_SXDX.F_BATCH.org_id
  is '机构ID';
comment on column CPIC_SXDX.F_BATCH.begin_age
  is '起始年龄';
comment on column CPIC_SXDX.F_BATCH.end_age
  is '结束年龄';
comment on column CPIC_SXDX.F_BATCH.task_id
  is '任务编号';
comment on column CPIC_SXDX.F_BATCH.task_name
  is '任务名称';
comment on column CPIC_SXDX.F_BATCH.begphone
  is '开始拨打日期';
comment on column CPIC_SXDX.F_BATCH.status
  is '批次错误标志（0为默认，1为批次有误）';
comment on column CPIC_SXDX.F_BATCH.error_content
  is '出错内容信息';
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
  is '业务成交统计表';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.ob_com_id
  is '活动编号';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.agent_id
  is '坐席工号';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.ob_com_name
  is '活动名称';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.user_name
  is '用户名称';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.batch_id
  is '批次编号';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.batch_name
  is '批次名称';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.cust_list
  is '名单总数';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.contact_list
  is '接触数';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.contact_rate
  is '接触率';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.deal_list
  is '成交数';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.deal_rate
  is '成交率';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.year_list
  is '年缴';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.year_totail
  is '年缴额';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.month_list
  is '月缴';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.month_totail
  is '月缴额';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.current_date
  is '存档时间';
comment on column CPIC_SXDX.RPT_DEAL_BIZ_DAY.call_list
  is '拨打总数';

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
  is '投保单基本信息表';
comment on column CPIC_SXDX.TB_APPLICATION.application_id
  is '投保单ID';
comment on column CPIC_SXDX.TB_APPLICATION.appno
  is '投保单号';
comment on column CPIC_SXDX.TB_APPLICATION.policyno
  is '保单号';
comment on column CPIC_SXDX.TB_APPLICATION.idorg
  is '中支公司编码';
comment on column CPIC_SXDX.TB_APPLICATION.iddmsystem
  is '外部系统投保单ID';
comment on column CPIC_SXDX.TB_APPLICATION.iddmtype
  is '数据来源类型';
comment on column CPIC_SXDX.TB_APPLICATION.firstcreate
  is '创建时间';
comment on column CPIC_SXDX.TB_APPLICATION.lastupdate
  is '修改时间';
comment on column CPIC_SXDX.TB_APPLICATION.isubmit
  is '是否提交';
comment on column CPIC_SXDX.TB_APPLICATION.iaccept
  is '是否落地成功 默认 0 ，1 ：落地成功';
comment on column CPIC_SXDX.TB_APPLICATION.tsrid
  is '录单座席工号';
comment on column CPIC_SXDX.TB_APPLICATION.product_name
  is '产品名称';
comment on column CPIC_SXDX.TB_APPLICATION.campaign_name
  is '活动名称';
comment on column CPIC_SXDX.TB_APPLICATION.ialter
  is '是否已修改 1是';
comment on column CPIC_SXDX.TB_APPLICATION.irepeal
  is '是否撤销  1是';
comment on column CPIC_SXDX.TB_APPLICATION.iupdate
  is '是否更新  1是';
comment on column CPIC_SXDX.TB_APPLICATION.app_status
  is '投保单状态';
comment on column CPIC_SXDX.TB_APPLICATION.prj_id
  is '项目ID';
comment on column CPIC_SXDX.TB_APPLICATION.ai_rel
  is '投保人和被保人关系';
comment on column CPIC_SXDX.TB_APPLICATION.acus_licno
  is '投保人证件号';
comment on column CPIC_SXDX.TB_APPLICATION.acus_mob
  is '投保手机';
comment on column CPIC_SXDX.TB_APPLICATION.acus_gender
  is '投保人性别';
comment on column CPIC_SXDX.TB_APPLICATION.acus_name
  is '投保人姓名';
comment on column CPIC_SXDX.TB_APPLICATION.icus_licno
  is '被保人证件号';
comment on column CPIC_SXDX.TB_APPLICATION.icus_mob
  is '被保人投保手机';
comment on column CPIC_SXDX.TB_APPLICATION.icus_gender
  is '被保人性别';
comment on column CPIC_SXDX.TB_APPLICATION.icus_name
  is '被保人姓名';
comment on column CPIC_SXDX.TB_APPLICATION.agent_id
  is '业务员工号';
comment on column CPIC_SXDX.TB_APPLICATION.total_fee
  is '总保费';
comment on column CPIC_SXDX.TB_APPLICATION.org_id
  is '实现数据权限过滤';
comment on column CPIC_SXDX.TB_APPLICATION.site_status
  is '是否退回现场（00-自留处理，01-已经退回现场）';
comment on column CPIC_SXDX.TB_APPLICATION.pro_status
  is '00-审核中，审核通过和审核不通过为NULL';
comment on column CPIC_SXDX.TB_APPLICATION.is_del
  is '是否删除（0为否，1为是）';
comment on column CPIC_SXDX.TB_APPLICATION.ob_com_id
  is '活动代码';
comment on column CPIC_SXDX.TB_APPLICATION.verify_status
  is '审核状态';
comment on column CPIC_SXDX.TB_APPLICATION.verify_note
  is '审核备注';
comment on column CPIC_SXDX.TB_APPLICATION.update_user
  is '修改人';
comment on column CPIC_SXDX.TB_APPLICATION.verify_date
  is '审核日期（审核通过时为成交日期）';
comment on column CPIC_SXDX.TB_APPLICATION.product_id
  is '产品ID';
comment on column CPIC_SXDX.TB_APPLICATION.export_flag
  is '是否已经导出到UNICALL（N：否；Y：是）';
comment on column CPIC_SXDX.TB_APPLICATION.export_time
  is '导出时间';
comment on column CPIC_SXDX.TB_APPLICATION.fee_desc
  is '保费明细';
comment on column CPIC_SXDX.TB_APPLICATION.note
  is '质检备注';
comment on column CPIC_SXDX.TB_APPLICATION.preappno
  is '原投保单号';
comment on column CPIC_SXDX.TB_APPLICATION.agreequitinsu
  is '是否要求退保（0为否，1为是）';
comment on column CPIC_SXDX.TB_APPLICATION.is_elecbill
  is '是否是电子账单（0为否，1为是）';
comment on column CPIC_SXDX.TB_APPLICATION.is_realtime
  is '是否是实时提交（0为否，1为是）';
comment on column CPIC_SXDX.TB_APPLICATION.product_type
  is '款别';
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
  is '投保客户基本信息表';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.app_customer_id
  is '投保客户ID';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.customer_id
  is '客户ID';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.name
  is '姓名';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.mari
  is '婚姻状况';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.lic_typ
  is '证件类型';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.lic_no
  is '证件号';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.birthday
  is '出生日期';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.gender
  is '性别';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.nation
  is '国籍';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.huk
  is '户口所在地';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.moto_flag
  is '是否以摩托车为交通工具';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.job_code
  is '职业代码';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.job_code_sec
  is '兼职职业代码';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.height
  is '身高';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.weight
  is '体重';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.customer_typ
  is '投保客户类型 01：投保人；02：被保人';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.con_addr_typ_id
  is '联系地址类别';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.salary
  is '薪水';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.company_name
  is '单位名称';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.lic_start_date
  is '证件开始日期';
comment on column CPIC_SXDX.TB_APPLICATION_CUSTOMER.lic_end_date
  is '证件截止日期';
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
  is '投保单基本信息表';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.application_id
  is '投保单ID';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.appno
  is '投保单号';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.policyno
  is '保单号';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.idorg
  is '中支公司编码';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.iddmsystem
  is '外部系统投保单ID';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.iddmtype
  is '数据来源类型';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.firstcreate
  is '创建时间';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.lastupdate
  is '修改时间';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.isubmit
  is '是否提交';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.iaccept
  is '是否落地成功 默认 0 ，1 ：落地成功';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.tsrid
  is '录单座席工号';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.product_name
  is '产品名称';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.campaign_name
  is '活动名称';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.ialter
  is '是否已修改 1是';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.irepeal
  is '是否撤销  1是';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.iupdate
  is '是否更新  1是';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.app_status
  is '投保单状态';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.prj_id
  is '项目ID';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.ai_rel
  is '投保人和被保人关系';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.acus_licno
  is '投保人证件号';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.acus_mob
  is '投保手机';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.acus_gender
  is '投保人性别';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.acus_name
  is '投保人姓名';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.icus_licno
  is '被保人证件号';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.icus_mob
  is '被保人投保手机';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.icus_gender
  is '被保人性别';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.icus_name
  is '被保人姓名';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.agent_id
  is '业务员工号';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.total_fee
  is '总保费';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.org_id
  is '实现数据权限过滤';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.site_status
  is '是否退回现场（00-自留处理，01-已经退回现场）';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.pro_status
  is '00-审核中，审核通过和审核不通过为NULL';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.is_del
  is '是否删除（0为否，1为是）';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.ob_com_id
  is '活动代码';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.verify_status
  is '审核状态';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.verify_note
  is '审核备注';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.update_user
  is '修改人';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.verify_date
  is '审核日期（审核通过时为成交日期）';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.product_id
  is '产品ID';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.export_flag
  is '是否已经导出到UNICALL（N：否；Y：是）';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.export_time
  is '导出时间';
comment on column CPIC_SXDX.TB_APPLICATION_TMP.fee_desc
  is '保费明细';
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
  is '投保单号流水号生成表';
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
  is '客户地址类型表';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS_TYP.cus_adds_typ_id
  is '地址类型ID';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS_TYP.con_typ_nam
  is '地址类型名';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS_TYP.addr_typ_desc
  is '地址类型描述';
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
  is '投保客户地址信息表';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.adds_id
  is '联系地址ID';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.app_customer_id
  is '投保客户ID';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.cus_adds_typ_id
  is '联系地址类型ID';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.adds_contry
  is '国家';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.adds_province
  is '省';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.adds_city
  is '市';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.adds_detail
  is '地址详细信息';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.adds_note
  is '地址备注';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.adds_postcode
  is '邮政编码';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_ADDS.adds_region
  is '区县';
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
  is '联系方式类别表';
comment on column CPIC_SXDX.TB_CUSTOMER_CON_TYP.cus_con_typ_id
  is '联系方式ID';
comment on column CPIC_SXDX.TB_CUSTOMER_CON_TYP.con_typ_nam
  is '联系方式名';
comment on column CPIC_SXDX.TB_CUSTOMER_CON_TYP.con_typ_desc
  is '联系方式描述';
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
  is '投保客户联系方式表';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_CONTACT.cus_con_id
  is '联系方式ID';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_CONTACT.app_customer_id
  is '投保客户ID';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_CONTACT.cus_con_typ_id
  is '联系方式类型ID';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_CONTACT.con_value
  is '联系方式值';
comment on column CPIC_SXDX.TB_APP_CUSTOMER_CONTACT.con_note
  is '联系方式备注';
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
  is '投保单详细信息表';
comment on column CPIC_SXDX.TB_APP_DTL.application_id
  is '投保单ID';
comment on column CPIC_SXDX.TB_APP_DTL.appno
  is '投保单号';
comment on column CPIC_SXDX.TB_APP_DTL.policyno
  is '保单号';
comment on column CPIC_SXDX.TB_APP_DTL.app_typ
  is '投保类型(1000)';
comment on column CPIC_SXDX.TB_APP_DTL.region_code
  is '区域编码';
comment on column CPIC_SXDX.TB_APP_DTL.benefit_info
  is '受益人信息';
comment on column CPIC_SXDX.TB_APP_DTL.add_fee
  is '追加保费（备用）';
comment on column CPIC_SXDX.TB_APP_DTL.tmp_fee_no
  is '暂收据号';
comment on column CPIC_SXDX.TB_APP_DTL.main_plc_no
  is '主险保单号';
comment on column CPIC_SXDX.TB_APP_DTL.fst_pay_typ
  is '首期支付方式';
comment on column CPIC_SXDX.TB_APP_DTL.oth_pay_typ
  is '续期支付方式';
comment on column CPIC_SXDX.TB_APP_DTL.fee_agt_typ
  is '缴费代缴形式';
comment on column CPIC_SXDX.TB_APP_DTL.fee_acc_bank
  is '缴费开户银行代码';
comment on column CPIC_SXDX.TB_APP_DTL.fee_acc_nam
  is '缴费开户名称';
comment on column CPIC_SXDX.TB_APP_DTL.fee_acc_no
  is '缴费账户';
comment on column CPIC_SXDX.TB_APP_DTL.late_choice
  is '保费逾期选择';
comment on column CPIC_SXDX.TB_APP_DTL.bonus_recv_typ
  is '红利领取方式';
comment on column CPIC_SXDX.TB_APP_DTL.death_func
  is '身故保险金功能选择';
comment on column CPIC_SXDX.TB_APP_DTL.argue_typ
  is '争议处理方式';
comment on column CPIC_SXDX.TB_APP_DTL.trial_code
  is '初审人员代码';
comment on column CPIC_SXDX.TB_APP_DTL.sale_cha
  is '销售渠道';
comment on column CPIC_SXDX.TB_APP_DTL.app_date
  is '投保日期';
comment on column CPIC_SXDX.TB_APP_DTL.renewal_flag
  is '是否自动续保';
comment on column CPIC_SXDX.TB_APP_DTL.back_info
  is '返回信息';
comment on column CPIC_SXDX.TB_APP_DTL.special_clause
  is '特别约定';
comment on column CPIC_SXDX.TB_APP_DTL.data_source
  is '数据来源';
comment on column CPIC_SXDX.TB_APP_DTL.status
  is 'P10报文状态';
comment on column CPIC_SXDX.TB_APP_DTL.app_operator
  is '操作员';
comment on column CPIC_SXDX.TB_APP_DTL.app_slip_typ
  is '投保单类型(2023)';
comment on column CPIC_SXDX.TB_APP_DTL.sale_src
  is '销售来源';
comment on column CPIC_SXDX.TB_APP_DTL.pay_mod
  is '收付模式';
comment on column CPIC_SXDX.TB_APP_DTL.bene_avg_flag
  is '受益比例是否为均分(受益人信息为按比例分配时保存)N：否，Y：是';
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
  is '投保单号';
comment on column CPIC_SXDX.TB_APP_IACCEPT_CHANGE.create_user
  is '创建人';
comment on column CPIC_SXDX.TB_APP_IACCEPT_CHANGE.create_time
  is '创建时间';
comment on column CPIC_SXDX.TB_APP_IACCEPT_CHANGE.iaccept_id
  is '自增长ID';
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
  is '投保单产品信息表';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.application_id
  is '投保单ID';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.ins_code
  is '险种代码';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.main_flag
  is '主附险标志';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.amount
  is '保额';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.pay_lev
  is '缴费标准';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.job_fee
  is '职业加费';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.pay_typ
  is '缴费方式';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.pay_period
  is '缴费年限';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.ins_period
  is '保险期间';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.ins_perd_typ
  is '保险期间类型';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.recv_typ
  is '领取方式';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.recv_age
  is '领取年龄';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.fixed_plc_no
  is '定额保单序号(默认00)';
comment on column CPIC_SXDX.TB_APP_PRD_INFO.pieces
  is '份数';
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
  is '问题件处理申请';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.id
  is '申请处理流水号';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.appid
  is '投保单ID';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.result1
  is '申请处理结果(00-客户来电撤单,01-撤单,02-重新核保,03-继续扣款,04-重新递送)';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.remark2
  is '申请处理备注';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.input_date
  is '创建时间';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.input_user
  is '创建用户';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.remark1
  is '程序处理备注';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.update_date
  is '更新时间';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.update_user
  is '更新用户';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.result2
  is '电销处理结果(00-审核中,01-审核通过,02-审核不通过)';
comment on column CPIC_SXDX.TB_APP_PROBLEM_REQ.remark3
  is '电销处理备注';
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
  is '投保单状态历史表';
comment on column CPIC_SXDX.TB_APP_STATUS_HIS.id
  is '序列号';
comment on column CPIC_SXDX.TB_APP_STATUS_HIS.app_no
  is '投保单号';
comment on column CPIC_SXDX.TB_APP_STATUS_HIS.app_status
  is '投保单状态 ';
comment on column CPIC_SXDX.TB_APP_STATUS_HIS.oper_time
  is '状态变化时间';
comment on column CPIC_SXDX.TB_APP_STATUS_HIS.oper_id
  is '操作人ID';
comment on column CPIC_SXDX.TB_APP_STATUS_HIS.note
  is '备注';
comment on column CPIC_SXDX.TB_APP_STATUS_HIS.status_src
  is '状态来源 01:ULINK 02:UNICALL';
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
  is '地区维护表';
comment on column CPIC_SXDX.TB_AREA.area_id
  is '行政单位序号，递增';
comment on column CPIC_SXDX.TB_AREA.area_num
  is '行政单位代码，同国家分配代码，也是下级行政单位的父代码内容';
comment on column CPIC_SXDX.TB_AREA.area_name
  is '行政单位名称';
comment on column CPIC_SXDX.TB_AREA.area_fath
  is '行政单位父代码';
comment on column CPIC_SXDX.TB_AREA.simple_name
  is '行政单位简称';
comment on column CPIC_SXDX.TB_AREA.area_level
  is '行政单位级别 1:省级 2:地级市 3:区县';
comment on column CPIC_SXDX.TB_AREA.area_order
  is '表示顺序，省级行政单位必须，间隔10，其他行政单位默认100';
comment on column CPIC_SXDX.TB_AREA.del_flg
  is '是否被删除的标示 0 未删除 1 已删除';
comment on column CPIC_SXDX.TB_AREA.create_user
  is '创建人 初始创建人为0_Admin';
comment on column CPIC_SXDX.TB_AREA.create_time
  is '创建时间';
comment on column CPIC_SXDX.TB_AREA.update_user
  is '修改人 初始修改人为空';
comment on column CPIC_SXDX.TB_AREA.update_time
  is '修改时间';
comment on column CPIC_SXDX.TB_AREA.city_cnt
  is '包含的地级市数量';
comment on column CPIC_SXDX.TB_AREA.area_cnt
  is '包含的区县数量';
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
  is '银行名称';
comment on column CPIC_SXDX.TB_BANK_DEBIT.bank_type
  is '银行所属类型';
comment on column CPIC_SXDX.TB_BANK_DEBIT.bank_debit
  is '银行简码';
comment on column CPIC_SXDX.TB_BANK_DEBIT.pay_type
  is '支付渠道';
comment on column CPIC_SXDX.TB_BANK_DEBIT.bank_head
  is '银行起始代码';
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
  is '转帐规则ID';
comment on column CPIC_SXDX.TB_BANK_RULE.transfer_rule
  is '转账规则';
comment on column CPIC_SXDX.TB_BANK_RULE.start_characters
  is '开始字符';
comment on column CPIC_SXDX.TB_BANK_RULE.card_length
  is '卡长度';
comment on column CPIC_SXDX.TB_BANK_RULE.card_type
  is '卡类型';
comment on column CPIC_SXDX.TB_BANK_RULE.bank_type
  is '银行类型';
comment on column CPIC_SXDX.TB_BANK_RULE.remark
  is '备注';
comment on column CPIC_SXDX.TB_BANK_RULE.creat_person
  is '创建人';
comment on column CPIC_SXDX.TB_BANK_RULE.creat_time
  is '创建时间';
comment on column CPIC_SXDX.TB_BANK_RULE.modify_person
  is '修改人';
comment on column CPIC_SXDX.TB_BANK_RULE.modify_time
  is '修改时间';
comment on column CPIC_SXDX.TB_BANK_RULE.is_del
  is '是否删除。 0默认。1为删除';
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
  is '受益人信息表';
comment on column CPIC_SXDX.TB_BENEFICLARY.id
  is '流水号';
comment on column CPIC_SXDX.TB_BENEFICLARY.application_id
  is '投保单ID';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_name
  is '受益人姓名';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_sex
  is '受益人性别';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_relation
  is '受益人与被保人关系';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_sort
  is '受益顺序';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_code_num
  is '受益人证件号';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_percent
  is '受益比例';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_nation
  is '受益人国籍';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_address
  is '受益人居住地址';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_mobile
  is '受益人联系方式';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_metier
  is '受益人职业';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_lic_start
  is '受益人证件有效开始日';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_lic_end
  is '受益人证件有效终止日';
comment on column CPIC_SXDX.TB_BENEFICLARY.benefit_lic_type
  is '受益人证件类型';
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
  is '分红方式表';
comment on column CPIC_SXDX.TB_BENE_TYPE.bene_type_id
  is '分红方式ID';
comment on column CPIC_SXDX.TB_BENE_TYPE.name
  is '分红方式名称';
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
  is '机构名称';
comment on column CPIC_SXDX.TB_BMDM_ORG.orgtype
  is '机构类型';
comment on column CPIC_SXDX.TB_BMDM_ORG.orgid
  is '机构代码';
comment on column CPIC_SXDX.TB_BMDM_ORG.uporgid
  is '上级机构代码';
comment on column CPIC_SXDX.TB_BMDM_ORG.orgname_bk
  is '导入时的原机构名称';
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
  is '拨打历史表';
comment on column CPIC_SXDX.TB_CALL_HISTORY.call_hisid
  is '拨打历史编号';
comment on column CPIC_SXDX.TB_CALL_HISTORY.called_phone
  is '拨打电话号码';
comment on column CPIC_SXDX.TB_CALL_HISTORY.start_time
  is '通话开始时间';
comment on column CPIC_SXDX.TB_CALL_HISTORY.end_time
  is '通话结束时间';
comment on column CPIC_SXDX.TB_CALL_HISTORY.call_id
  is '记录通话标识';
comment on column CPIC_SXDX.TB_CALL_HISTORY.workspace_id
  is '职场ID';
comment on column CPIC_SXDX.TB_CALL_HISTORY.duration
  is '通话时长（单位：秒）';
comment on column CPIC_SXDX.TB_CALL_HISTORY.call_resutl
  is '通话结果（0：未接通；1：接通）';
comment on column CPIC_SXDX.TB_CALL_HISTORY.agentid
  is 'AGENTID';
comment on column CPIC_SXDX.TB_CALL_HISTORY.call_no
  is '主叫号码';
comment on column CPIC_SXDX.TB_CALL_HISTORY.callout_no
  is '被叫号码';
comment on column CPIC_SXDX.TB_CALL_HISTORY.ccid
  is '话务平台ID';
comment on column CPIC_SXDX.TB_CALL_HISTORY.task_id
  is '任务ID';
comment on column CPIC_SXDX.TB_CALL_HISTORY.sale_history_id
  is '销售历史id';
comment on column CPIC_SXDX.TB_CALL_HISTORY.memo
  is '预约备注';
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
  is '地区维护省份表';
comment on column CPIC_SXDX.TB_PROVINCE.province_id
  is '省份代码';
comment on column CPIC_SXDX.TB_PROVINCE.province_name
  is '省份名称';
comment on column CPIC_SXDX.TB_PROVINCE.display_order
  is '省份名称的显示顺序';
comment on column CPIC_SXDX.TB_PROVINCE.del_flg
  is '是否被删除的标示 0 未删除 1 已删除';
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
  is '地区维护的地级市表';
comment on column CPIC_SXDX.TB_CITY.province_id
  is '省份代码';
comment on column CPIC_SXDX.TB_CITY.city_name
  is '城市名称';
comment on column CPIC_SXDX.TB_CITY.del_flg
  is '是否被删除的标示 0 未删除 1 已删除';
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
  is '业务机构ID';
comment on column CPIC_SXDX.TB_COMPANY.parent_company_id
  is '父业务机构ID';
comment on column CPIC_SXDX.TB_COMPANY.company_name
  is '机构名称';
comment on column CPIC_SXDX.TB_COMPANY.company_code
  is '机构编码';
comment on column CPIC_SXDX.TB_COMPANY.is_branch_company
  is '是否是分公司';
comment on column CPIC_SXDX.TB_COMPANY.is_delete
  is '删除标识';
comment on column CPIC_SXDX.TB_COMPANY.company_finance_code
  is '财务机构编码';
comment on column CPIC_SXDX.TB_COMPANY.region_code
  is '区域编码';
comment on column CPIC_SXDX.TB_COMPANY.operate_user_code
  is '业务员编码';
comment on column CPIC_SXDX.TB_COMPANY.operate_user_name
  is '业务员姓名';
comment on column CPIC_SXDX.TB_COMPANY.is_ff
  is '配送保单时辅助判断是否长险：1 是，0 否';
comment on column CPIC_SXDX.TB_COMPANY.company_type
  is '机构类型：01:分公司;02:中支公司;03:内部职场;04:外包职场;';
comment on column CPIC_SXDX.TB_COMPANY.orgid
  is '机构代码';
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
  is '机构银行表';
comment on column CPIC_SXDX.TB_COMPANY_BANK.company_bank_id
  is '银行ID';
comment on column CPIC_SXDX.TB_COMPANY_BANK.company_id
  is '业务机构ID';
comment on column CPIC_SXDX.TB_COMPANY_BANK.bank_name
  is '银行名称';
comment on column CPIC_SXDX.TB_COMPANY_BANK.bank_code
  is '银行编码';
comment on column CPIC_SXDX.TB_COMPANY_BANK.bank_type
  is '银行类型';
comment on column CPIC_SXDX.TB_COMPANY_BANK.creat_person
  is '创建人';
comment on column CPIC_SXDX.TB_COMPANY_BANK.creat_time
  is '创建时间';
comment on column CPIC_SXDX.TB_COMPANY_BANK.modify_person
  is '修改人';
comment on column CPIC_SXDX.TB_COMPANY_BANK.modify_time
  is '修改时间';
comment on column CPIC_SXDX.TB_COMPANY_BANK.is_del
  is '是否删除。 0默认。1为删除';
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
  is '转帐规则ID';
comment on column CPIC_SXDX.TB_COMPANY_BANK_RULE.company_bank_id
  is '银行ID';
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
  is '批次ID';
comment on column CPIC_SXDX.TB_SALE_BATCH.ob_com_id
  is '活动ID';
comment on column CPIC_SXDX.TB_SALE_BATCH.upload_way
  is '上载方式  1.手动上载  2.自动上载';
comment on column CPIC_SXDX.TB_SALE_BATCH.assign_way
  is '下发方式  1. 上载到组织   2.直接下发到座席';
comment on column CPIC_SXDX.TB_SALE_BATCH.batch_name
  is '批次名称';
comment on column CPIC_SXDX.TB_SALE_BATCH.batch_code
  is '批次编码';
comment on column CPIC_SXDX.TB_SALE_BATCH.com_type
  is '名单类型  字典表';
comment on column CPIC_SXDX.TB_SALE_BATCH.call_date
  is '开始拨打日期';
comment on column CPIC_SXDX.TB_SALE_BATCH.remove_date
  is '回收日期';
comment on column CPIC_SXDX.TB_SALE_BATCH.call_year_month
  is '拨打年月';
comment on column CPIC_SXDX.TB_SALE_BATCH.org_center
  is '中心';
comment on column CPIC_SXDX.TB_SALE_BATCH.org_pro
  is '项目';
comment on column CPIC_SXDX.TB_SALE_BATCH.org_team
  is '团队';
comment on column CPIC_SXDX.TB_SALE_BATCH.gerenerate_info
  is '上载名单数';
comment on column CPIC_SXDX.TB_SALE_BATCH.create_user
  is '上载人';
comment on column CPIC_SXDX.TB_SALE_BATCH.create_time
  is '上载时间';
comment on column CPIC_SXDX.TB_SALE_BATCH.update_user
  is '修改人';
comment on column CPIC_SXDX.TB_SALE_BATCH.update_time
  is '修改时间';
comment on column CPIC_SXDX.TB_SALE_BATCH.file_name
  is '文件名';
comment on column CPIC_SXDX.TB_SALE_BATCH.log_content
  is '日志内容';
comment on column CPIC_SXDX.TB_SALE_BATCH.belongcity
  is '所属城市';
comment on column CPIC_SXDX.TB_SALE_BATCH.com_seriars
  is '名单分类   字典表';
comment on column CPIC_SXDX.TB_SALE_BATCH.call_times
  is '拨打次数：1-首拨、2-二拨、3-三拨';
comment on column CPIC_SXDX.TB_SALE_BATCH.success
  is '导入名单成功数';
comment on column CPIC_SXDX.TB_SALE_BATCH.failure
  is '导入名单失败数';
comment on column CPIC_SXDX.TB_SALE_BATCH.introduction_batch
  is '转介绍批次';
comment on column CPIC_SXDX.TB_SALE_BATCH.batch_type
  is '批次类型：0-默认 1-转介绍 2-新增名单批次';
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
  is '任务表';
comment on column CPIC_SXDX.TB_TASK.task_id
  is '任务ID';
comment on column CPIC_SXDX.TB_TASK.task_level
  is '优化级';
comment on column CPIC_SXDX.TB_TASK.create_time
  is '任务创建时间';
comment on column CPIC_SXDX.TB_TASK.change_time
  is '最后改变时间';
comment on column CPIC_SXDX.TB_TASK.is_important
  is '是否重点提醒（删除）';
comment on column CPIC_SXDX.TB_TASK.appoint_time
  is '预约时间';
comment on column CPIC_SXDX.TB_TASK.active_status
  is '激活状态';
comment on column CPIC_SXDX.TB_TASK.task_memo
  is '任务说明';
comment on column CPIC_SXDX.TB_TASK.callresult_type
  is '拨打小节模板(跟踪销售=1 问题件=2 订单审核=3 内呼咨询=4)';
comment on column CPIC_SXDX.TB_TASK.first_result
  is '拨打小节一级结果';
comment on column CPIC_SXDX.TB_TASK.second_result
  is '拨打小节二级结果';
comment on column CPIC_SXDX.TB_TASK.user_id
  is '所属座席';
comment on column CPIC_SXDX.TB_TASK.org_id
  is '所属机构';
comment on column CPIC_SXDX.TB_TASK.status_id
  is '状态编号';
comment on column CPIC_SXDX.TB_TASK.type_id
  is '类型编号';
comment on column CPIC_SXDX.TB_TASK.policy_id
  is '投保单ID';
comment on column CPIC_SXDX.TB_TASK.batch_id
  is '批次ID';
comment on column CPIC_SXDX.TB_TASK.cus_list_id
  is '名单ID';
comment on column CPIC_SXDX.TB_TASK.ob_com_id
  is '活动ID';
comment on column CPIC_SXDX.TB_TASK.policy_id_cancle
  is '撤单投保单Id';
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
  is '内呼咨询工单表';
comment on column CPIC_SXDX.TB_CONSULT_CASE.order_id
  is '编号';
comment on column CPIC_SXDX.TB_CONSULT_CASE.task_id
  is '任务ID';
comment on column CPIC_SXDX.TB_CONSULT_CASE.call_reason
  is '呼叫原因';
comment on column CPIC_SXDX.TB_CONSULT_CASE.visit_time
  is '预约回访时间';
comment on column CPIC_SXDX.TB_CONSULT_CASE.visit_phone
  is '回访电话';
comment on column CPIC_SXDX.TB_CONSULT_CASE.assign_task
  is '分配任务（0：所属座席；1：所属团队）';
comment on column CPIC_SXDX.TB_CONSULT_CASE.deal_status
  is '处理状态（0：未处理；1：已处理）';
comment on column CPIC_SXDX.TB_CONSULT_CASE.memo
  is '备注';
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
  is '客户基本信息表';
comment on column CPIC_SXDX.TB_CUSTOMER.name
  is '姓名';
comment on column CPIC_SXDX.TB_CUSTOMER.mari
  is '婚姻状况';
comment on column CPIC_SXDX.TB_CUSTOMER.lic_typ
  is '证件类型';
comment on column CPIC_SXDX.TB_CUSTOMER.lic_no
  is '证件号';
comment on column CPIC_SXDX.TB_CUSTOMER.birthday
  is '出生日期';
comment on column CPIC_SXDX.TB_CUSTOMER.gender
  is '性别';
comment on column CPIC_SXDX.TB_CUSTOMER.nation
  is '国籍';
comment on column CPIC_SXDX.TB_CUSTOMER.huk
  is '户口所在地';
comment on column CPIC_SXDX.TB_CUSTOMER.moto_flag
  is '是否以摩托车为交通工具';
comment on column CPIC_SXDX.TB_CUSTOMER.job_code
  is '职业代码';
comment on column CPIC_SXDX.TB_CUSTOMER.job_code_sec
  is '兼职职业代码';
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
  is '客户地址信息表';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS.adds_id
  is '联系地址ID';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS.customer_id
  is '客户ID';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS.cus_adds_typ_id
  is '联系地址类型ID';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS.adds_contry
  is '国家';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS.adds_province
  is '省';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS.adds_city
  is '市';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS.adds_detail
  is '地址详细信息';
comment on column CPIC_SXDX.TB_CUSTOMER_ADDS.adds_note
  is '地址备注';
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
  is '投保客户与投保单关系表';
comment on column CPIC_SXDX.TB_CUSTOMER_APP_REL.application_id
  is '投保单ID';
comment on column CPIC_SXDX.TB_CUSTOMER_APP_REL.app_customer_id
  is '投保客户ID';
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
  is '组织机构';
comment on column CPIC_SXDX.TB_ORGANIZATION.org_id
  is '机构流水号';
comment on column CPIC_SXDX.TB_ORGANIZATION.org_name
  is '机构名称';
comment on column CPIC_SXDX.TB_ORGANIZATION.company_id
  is '业务机构ID';
comment on column CPIC_SXDX.TB_ORGANIZATION.parent_org_id
  is '上级机构ID';
comment on column CPIC_SXDX.TB_ORGANIZATION.org_level
  is '机构级别  0:总公司 1:电销总中心 2:电销分中心 3:项目 4:团队';
comment on column CPIC_SXDX.TB_ORGANIZATION.org_desc
  is '机构备注';
comment on column CPIC_SXDX.TB_ORGANIZATION.org_type
  is '机构类型';
comment on column CPIC_SXDX.TB_ORGANIZATION.org_code
  is '机构代码';
comment on column CPIC_SXDX.TB_ORGANIZATION.is_del
  is '删除标志';
comment on column CPIC_SXDX.TB_ORGANIZATION.create_user
  is '创建人';
comment on column CPIC_SXDX.TB_ORGANIZATION.create_time
  is '创建时间';
comment on column CPIC_SXDX.TB_ORGANIZATION.update_user
  is '修改人';
comment on column CPIC_SXDX.TB_ORGANIZATION.update_time
  is '修改时间';
comment on column CPIC_SXDX.TB_ORGANIZATION.binding_user
  is '项目是否绑定质检人员   默认为0 未绑定，绑定后直接放userId进来';
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
  is '名单分配任务列表';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.task_id
  is '分配任务ID';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.batch_id
  is '批次';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.org_id
  is '分配组织';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.to_org_id
  is '被分配组织';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.user_id
  is '分配人';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.to_user_id
  is '被分配人';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.quantity
  is '分配数量';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.assign_type
  is '分配类型:1团队到座席；2项目到团队； 3中心到项目  4座席到团队； 5座席到项目； 6团队到座席；7团队到项目；8项目到座席；9项目到团队';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.type
  is '1代表分配,2代表调配,3代表自动分配';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN.create_time
  is '任务创建时间';
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
  is '名单分配历史';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN_LOG.org_id
  is '分配组织';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN_LOG.to_org_id
  is '被分配组织';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN_LOG.user_id
  is '分配人';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN_LOG.to_user_id
  is '被分配人';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN_LOG.quantity
  is '分配数量';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN_LOG.assign_type
  is '分配类型:0表示分配;1表示按批次调配 2表示按名单调配;';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN_LOG.start_time
  is '分配开始时间';
comment on column CPIC_SXDX.TB_CUSTOMER_ASSIGN_LOG.end_time
  is '分配开始时间';
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
  is '客户联系方式表';
comment on column CPIC_SXDX.TB_CUSTOMER_CONTACT.cus_con_id
  is '联系方式ID';
comment on column CPIC_SXDX.TB_CUSTOMER_CONTACT.customer_id
  is '客户ID';
comment on column CPIC_SXDX.TB_CUSTOMER_CONTACT.cus_con_typ_id
  is '联系方式类型ID';
comment on column CPIC_SXDX.TB_CUSTOMER_CONTACT.con_value
  is '联系方式值';
comment on column CPIC_SXDX.TB_CUSTOMER_CONTACT.con_note
  is '联系方式备注';
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
  is '名单ID';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.cus_unique_ide
  is '客户唯一标识';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.cus_name
  is '客户姓名';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.cus_sex
  is '客户性别';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.task_id
  is '任务编号';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.org_center
  is '电销中心';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.org_proj
  is '项目';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.org_team
  is '团队';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.user_id
  is '座席ID';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.call_status
  is '1表示已拨打，0表示未拨打';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.status
  is '名单状态  1表示已分配，0表示未分配';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.cus_birthday
  is '出生日期';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.cus_age
  is '年龄';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.ide_type
  is '证件类型';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.ide_number
  is '证件号码';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.cus_metier
  is '客户职业';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.mobile
  is '移动电话';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.mobile1
  is '移动电话1';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.mobile2
  is '移动电话2';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.contect_tel
  is '联系电话';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.home_tel
  is '家庭电话';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.off_tel
  is '单位电话';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.contect_tel_type
  is '联系电话类型（常用电话标志）';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.detailed_address
  is '地址_详址';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.postcode
  is '地址_邮编';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.add_type
  is '地址类型';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.emergency_con_person
  is '紧急联络人（姓名）';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.emergency_con_tel
  is '紧急联络人（电话）';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.emer_con_relation
  is '紧急联络人与客户关系';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.contact_detailed_add
  is '联络地址_详址';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.contact_postcode
  is '联络地址邮编';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.cus_company
  is '工作单位';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.metier_level
  is '职业等级';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.marital_status
  is '婚姻状况';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.bank_name
  is '银行（开户行）';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.bank_account_holder
  is '银行开户人（银行账户姓名）';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.bank_account
  is '银行账户（帐号）';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.is_vip
  is '是否寿险VIP';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.batch_id
  is '批次ID';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.org_id
  is '机构流水号';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.creat_user
  is '创建人(默认系统)';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.creat_time
  is '创建时间';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.modify_person
  is '修改人(最后一次修改)';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.modify_time
  is '修改时间(最后一次修改)';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.is_blacklist
  is '是否红黑名单 默认0  红黑名单为1';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.fax
  is '传真';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.res
  is '备注';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST.marital_id
  is '职业';
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
  is '名单ID';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.add_province
  is '地址_省';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.add_city
  is '地址_市';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.add_area
  is '地址_区县';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.cus_email
  is '电子邮件';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.contact_add_province
  is '联络地址_省';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.contact_add_city
  is '联络地址_市';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.contact_add_area
  is '联络地址_区县';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.introducer
  is '介绍人';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.intro_time
  is '转介绍时间';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.introducer_relation
  is '与介绍人关系';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.income
  is '年收入';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.education
  is '教育水平';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.travel_mode
  is '出行方式';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.own_house
  is '是否有房';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.own_child
  is '是否有孩子';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.buy_product
  is '已购产品';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.car_type
  is '车型名称';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.car_price
  is '车价';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.car_purpose
  is '车使用性质';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.buy_house_time
  is '房屋购置时间';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.house_price
  is '房屋购置价';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.house_area
  is '房屋建筑面积';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.house_purpose
  is '房产用途';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.house_type
  is '房产类型';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.interest_type
  is '兴趣爱好类型';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.house_ownership_status
  is '住宅所有权状况';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.cus_company_assets
  is '其他公司金融资产';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.res1
  is '备注1';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.res2
  is '备注2';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.res3
  is '备注3';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.res4
  is '备注4';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LIST_DTL.own_car
  is '是否有车';
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
  is '名单回收日志';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LOG.assign_id
  is '回收ID';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LOG.batch_name
  is '批次';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LOG.quantity
  is '回收名单数量';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LOG.failure_quantity
  is '红黑名单数';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LOG.result
  is '执行结果';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LOG.content
  is '日志信息';
comment on column CPIC_SXDX.TB_CUSTOMER_DEL_LOG.create_time
  is '执行时间';
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
  is '名单ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.cus_unique_ide
  is '客户唯一标识';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.cus_name
  is '客户姓名';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.cus_sex
  is '客户性别';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.task_id
  is '任务编号';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.org_center
  is '电销中心';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.org_proj
  is '项目';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.org_team
  is '团队';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.user_id
  is '座席ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.call_status
  is '1表示已拨打，0表示未拨打';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.status
  is '名单状态  1表示已分配，0表示未分配';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.cus_birthday
  is '出生日期';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.cus_age
  is '年龄';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.ide_type
  is '证件类型';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.ide_number
  is '证件号码';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.cus_metier
  is '客户职业';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.mobile
  is '移动电话';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.mobile1
  is '移动电话1';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.mobile2
  is '移动电话2';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.contect_tel
  is '联系电话';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.home_tel
  is '家庭电话';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.off_tel
  is '单位电话';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.contect_tel_type
  is '联系电话类型（常用电话标志）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.detailed_address
  is '地址_详址（配送地址）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.postcode
  is '地址_邮编（配送地址）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.add_type
  is '地址类型';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.emergency_con_person
  is '紧急联络人（姓名）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.emergency_con_tel
  is '紧急联络人（电话）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.emer_con_relation
  is '紧急联络人与客户关系';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.contact_detailed_add
  is '联络地址_详址';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.contact_postcode
  is '联络地址邮编';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.cus_company
  is '工作单位';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.metier_level
  is '职业等级';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.marital_status
  is '婚姻状况';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.bank_name
  is '银行（开户行）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.bank_account_holder
  is '银行开户人（银行账户姓名）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.bank_account
  is '银行账户（帐号）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.is_vip
  is '是否寿险VIP';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.batch_id
  is '批次ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.org_id
  is '机构流水号';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.creat_user
  is '创建人(默认系统)';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.creat_time
  is '创建时间';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.modify_person
  is '修改人(最后一次修改)';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.modify_time
  is '修改时间(最后一次修改)';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.is_blacklist
  is '是否红黑名单 默认0  红黑名单为1';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.fax
  is '传真';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.res
  is '备注';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.marital_id
  is '职业';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.assign_date
  is '分配或调配时间';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.is_introduction
  is '是否是转介绍名单 0=不是 1=是';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST.introduction_id
  is '转介绍ID';
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
  is '名单ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.cus_unique_ide
  is '客户唯一标识';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.cus_name
  is '客户姓名';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.cus_sex
  is '客户性别';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.task_id
  is '任务编号';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.org_center
  is '电销中心';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.org_proj
  is '项目';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.org_team
  is '团队';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.user_id
  is '座席ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.call_status
  is '1表示已拨打，0表示未拨打';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.status
  is '名单状态  1表示已分配，0表示未分配';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.cus_birthday
  is '出生日期';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.cus_age
  is '年龄';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.ide_type
  is '证件类型';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.ide_number
  is '证件号码';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.cus_metier
  is '客户职业';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.mobile
  is '移动电话';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.mobile1
  is '移动电话1';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.mobile2
  is '移动电话2';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.contect_tel
  is '联系电话';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.home_tel
  is '家庭电话';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.off_tel
  is '单位电话';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.contect_tel_type
  is '联系电话类型（常用电话标志）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.detailed_address
  is '地址_详址（配送地址）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.postcode
  is '地址_邮编（配送地址）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.add_type
  is '地址类型';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.emergency_con_person
  is '紧急联络人（姓名）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.emergency_con_tel
  is '紧急联络人（电话）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.emer_con_relation
  is '紧急联络人与客户关系';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.contact_detailed_add
  is '联络地址_详址';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.contact_postcode
  is '联络地址邮编';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.cus_company
  is '工作单位';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.metier_level
  is '职业等级';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.marital_status
  is '婚姻状况';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.bank_name
  is '银行（开户行）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.bank_account_holder
  is '银行开户人（银行账户姓名）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.bank_account
  is '银行账户（帐号）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.is_vip
  is '是否寿险VIP';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.batch_id
  is '批次ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.org_id
  is '机构流水号';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.creat_user
  is '创建人(默认系统)';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.creat_time
  is '创建时间';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.modify_person
  is '修改人(最后一次修改)';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.modify_time
  is '修改时间(最后一次修改)';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.is_blacklist
  is '是否红黑名单 默认0  红黑名单为1';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.fax
  is '传真';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.res
  is '备注';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.marital_id
  is '职业';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.assign_date
  is '分配或调配时间';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.is_introduction
  is '是否是转介绍名单 0=不是 1=是';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.introduction_id
  is '转介绍ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_BAK.remove_status
  is '名单移除标识 0=没有移除 1=移除';
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
  is '名单ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.cus_unique_ide
  is '客户唯一标识';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.cus_name
  is '客户姓名';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.cus_sex
  is '客户性别';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.task_id
  is '任务编号';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.org_center
  is '电销中心';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.org_proj
  is '项目';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.org_team
  is '团队';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.user_id
  is '座席ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.call_status
  is '1表示已拨打，0表示未拨打';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.status
  is '名单状态  1表示已分配，0表示未分配';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.cus_birthday
  is '出生日期';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.cus_age
  is '年龄';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.ide_type
  is '证件类型';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.ide_number
  is '证件号码';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.cus_metier
  is '客户职业';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.mobile
  is '移动电话';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.mobile1
  is '移动电话1';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.mobile2
  is '移动电话2';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.contect_tel
  is '联系电话';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.home_tel
  is '家庭电话';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.off_tel
  is '单位电话';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.contect_tel_type
  is '联系电话类型（常用电话标志）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.detailed_address
  is '地址_详址（配送地址）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.postcode
  is '地址_邮编（配送地址）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.add_type
  is '地址类型';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.emergency_con_person
  is '紧急联络人（姓名）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.emergency_con_tel
  is '紧急联络人（电话）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.emer_con_relation
  is '紧急联络人与客户关系';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.contact_detailed_add
  is '联络地址_详址';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.contact_postcode
  is '联络地址邮编';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.cus_company
  is '工作单位';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.metier_level
  is '职业等级';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.marital_status
  is '婚姻状况';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.bank_name
  is '银行（开户行）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.bank_account_holder
  is '银行开户人（银行账户姓名）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.bank_account
  is '银行账户（帐号）';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.is_vip
  is '是否寿险VIP';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.batch_id
  is '批次ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.org_id
  is '机构流水号';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.creat_user
  is '创建人(默认系统)';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.creat_time
  is '创建时间';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.modify_person
  is '修改人(最后一次修改)';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.modify_time
  is '修改时间(最后一次修改)';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.is_blacklist
  is '是否红黑名单 默认0  红黑名单为1';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.fax
  is '传真';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.res
  is '备注';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.marital_id
  is '职业';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.assign_date
  is '分配或调配时间';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.is_introduction
  is '是否是转介绍名单 0=不是 1=是';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.introduction_id
  is '转介绍ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_REMOVE.remove_type
  is '移除状态，1代表已移除，默认0';
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
  is '名单ID';
comment on column CPIC_SXDX.TB_CUSTOMER_LIST_RMV.task_id
  is '任务id';
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
  is '加保客户ID';
comment on column CPIC_SXDX.TB_CUS_ADD_INSURE.cus_list_id
  is '名单ID';
comment on column CPIC_SXDX.TB_CUS_ADD_INSURE.cus_intention
  is '客户意向';
comment on column CPIC_SXDX.TB_CUS_ADD_INSURE.agent_id
  is '座席ID(创建人)';
comment on column CPIC_SXDX.TB_CUS_ADD_INSURE.organ_id
  is '电销中心ID（组织机构ID）';
comment on column CPIC_SXDX.TB_CUS_ADD_INSURE.cus_unique_ide
  is '客户唯一标识';
comment on column CPIC_SXDX.TB_CUS_ADD_INSURE.creat_time
  is '创建时间';
comment on column CPIC_SXDX.TB_CUS_ADD_INSURE.status
  is '状态（下发状态）';
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
  is '名单归属信息表';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.user_id
  is '用户ID';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.agentid
  is '坐席工号';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.employeename
  is '雇员姓名(坐席姓名)';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.parent_org_id
  is '上级机构ID';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.org_id
  is '机构id';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.org_name
  is '组织机构名称';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.batch_id
  is '批次代码';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.batch_name
  is '批次名称';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.wait_assign_num
  is '待分配数';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.wait_call_num
  is '待首拨数';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.follow_num
  is '跟踪数';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.ten_num
  is '十日内到期名单';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.total_num
  is '名单总数';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.status
  is '数据状态 0 无效 1 有效';
comment on column CPIC_SXDX.TB_CUS_BELONG_INFO.warn_num
  is '首拨月10日内到期回收名单量';

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
  is '黑名单基本信息表';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.cus_id
  is '序列号，主键';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.cus_nam
  is '客户姓名';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.ide_typ
  is '证件类型,0身份证';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.ide_num
  is '证件编号';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.mobile
  is '手机号码';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.hom_tel
  is '家庭电话';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.off_tel
  is '办公电话';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.other_tel
  is '其他电话';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.use_id
  is '用户ID';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.creat_time
  is '创建时间';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.stat
  is '状态';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.res1
  is '备用1';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.res2
  is '备用2';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.res3
  is '备用3';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST.send_status
  is '是否供数（00或者NULL-未供数，01-已供数）';
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
  is '红黑名单id';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST_FIX.batch_id
  is '原名单批次id';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST_FIX.cus_list_id
  is '原名单id';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST_FIX.res1
  is '备用1';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST_FIX.res2
  is '备用2';
comment on column CPIC_SXDX.TB_CUS_BLACKLIST_FIX.res3
  is '备用3';
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
  is '修改历史版本号';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.cus_list_id
  is '名单ID';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.add_province
  is '地址_省';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.add_city
  is '地址_市';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.add_area
  is '地址_区县';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.cus_email
  is '电子邮件';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.contact_add_province
  is '联络地址_省';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.contact_add_city
  is '联络地址_市';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.contact_add_area
  is '联络地址_区县';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.introducer
  is '介绍人';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.intro_time
  is '转介绍时间';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.introducer_relation
  is '与介绍人关系';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.income
  is '年收入';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.education
  is '教育水平';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.travel_mode
  is '出行方式';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.own_house
  is '是否有房';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.own_child
  is '是否有孩子';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.buy_product
  is '已购产品';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.car_type
  is '车型名称';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.car_price
  is '车价';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.car_purpose
  is '车使用性质';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.buy_house_time
  is '房屋购置时间';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.house_price
  is '房屋购置价';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.house_area
  is '房屋建筑面积';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.house_purpose
  is '房产用途';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.house_type
  is '房产类型';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.interest_type
  is '兴趣爱好类型';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.house_ownership_status
  is '住宅所有权状况';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.cus_company_assets
  is '其他公司金融资产';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.res1
  is '备注1';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.res2
  is '备注2';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.res3
  is '备注3';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.res4
  is '备注4';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.own_car
  is '是否有车';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.fax
  is '传真';
comment on column CPIC_SXDX.TB_CUS_DTL_MODIFY_LOG_REMOVE.res
  is '备注';
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
  is '杞粙缁嶅鎴稩D';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.cus_list_id
  is '浠嬬粛浜哄悕鍗旾d';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.cus_unique_ide
  is '瀹㈡埛鍞竴鏍囪瘑';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.cus_source
  is '鏁版嵁鏉ユ簮 1锛氬鍏ワ紝2锛氬姞淇濓紝3锛氳浆浠嬬粛';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.introducer_relation
  is '涓庝粙缁嶄汉鍏崇郴';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.cus_name
  is '瀹㈡埛濮撳悕';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.cus_sex
  is '瀹㈡埛鎬у埆';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.cus_birthday
  is '鍑虹敓鏃ユ湡';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.ide_type
  is '璇佷欢绫诲瀷';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.ide_number
  is '璇佷欢鍙风爜';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.mobile
  is '绉诲姩鐢佃瘽';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.home_tel
  is '瀹跺涵鐢佃瘽';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.off_tel
  is '鍗曚綅鐢佃瘽';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.add_province
  is '鑱旂郴鍦板潃锛氱渷';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.add_city
  is '鑱旂郴鍦板潃锛氬競';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.add_area
  is '联系地址：区/县';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.detailed_address
  is '联系地址：详细地址';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.postcode
  is '邮编';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.remark
  is '备注';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.agent_id
  is '座席ID（创建人）';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.organ_id
  is '电销中心ID（组织机构ID）';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.creat_time
  is '创建时间';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.status
  is '0-未生成名单，1-已生成名单';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.batch_id
  is '鎵规Id';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.introductor_name
  is '介绍人';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.age
  is '年龄';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.obcom_id
  is '活动ID';
comment on column CPIC_SXDX.TB_CUS_INTRODUCTION.is_delete
  is '是否重复：0-未重复；1-删除（已存在同样的转介绍客户）';
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
  is '名单ID';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.add_province
  is '地址_省(配送地址)';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.add_city
  is '地址_市(配送地址)';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.add_area
  is '地址_区县(配送地址)';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.cus_email
  is '电子邮件';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.contact_add_province
  is '联络地址_省';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.contact_add_city
  is '联络地址_市';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.contact_add_area
  is '联络地址_区县';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.introducer
  is '介绍人';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.intro_time
  is '转介绍时间';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.introducer_relation
  is '与介绍人关系';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.income
  is '年收入';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.education
  is '教育水平';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.travel_mode
  is '出行方式';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.own_house
  is '是否有房';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.own_child
  is '是否有孩子';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.buy_product
  is '已购产品';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.car_type
  is '车型名称';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.car_price
  is '车价';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.car_purpose
  is '车使用性质';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.buy_house_time
  is '房屋购置时间';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.house_price
  is '房屋购置价';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.house_area
  is '房屋建筑面积';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.house_purpose
  is '房产用途';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.house_type
  is '房产类型';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.interest_type
  is '兴趣爱好类型';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.house_ownership_status
  is '住宅所有权状况';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.cus_company_assets
  is '其他公司金融资产';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.res1
  is '备注1';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.res2
  is '备注2';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.res3
  is '备注3';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.res4
  is '备注4';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL.own_car
  is '是否有车';
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
  is '名单ID';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.add_province
  is '地址_省(配送地址)';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.add_city
  is '地址_市(配送地址)';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.add_area
  is '地址_区县(配送地址)';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.cus_email
  is '电子邮件';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.contact_add_province
  is '联络地址_省';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.contact_add_city
  is '联络地址_市';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.contact_add_area
  is '联络地址_区县';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.introducer
  is '介绍人';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.intro_time
  is '转介绍时间';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.introducer_relation
  is '与介绍人关系';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.income
  is '年收入';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.education
  is '教育水平';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.travel_mode
  is '出行方式';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.own_house
  is '是否有房';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.own_child
  is '是否有孩子';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.buy_product
  is '已购产品';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.car_type
  is '车型名称';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.car_price
  is '车价';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.car_purpose
  is '车使用性质';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.buy_house_time
  is '房屋购置时间';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.house_price
  is '房屋购置价';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.house_area
  is '房屋建筑面积';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.house_purpose
  is '房产用途';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.house_type
  is '房产类型';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.interest_type
  is '兴趣爱好类型';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.house_ownership_status
  is '住宅所有权状况';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.cus_company_assets
  is '其他公司金融资产';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.res1
  is '备注1';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.res2
  is '备注2';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.res3
  is '备注3';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.res4
  is '备注4';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_BAK.own_car
  is '是否有车';
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
  is '修改历史版本号';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.cus_list_id
  is '名单ID';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.add_province
  is '地址_省';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.add_city
  is '地址_市';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.add_area
  is '地址_区县';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.cus_email
  is '电子邮件';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.contact_add_province
  is '联络地址_省';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.contact_add_city
  is '联络地址_市';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.contact_add_area
  is '联络地址_区县';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.introducer
  is '介绍人';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.intro_time
  is '转介绍时间';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.introducer_relation
  is '与介绍人关系';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.income
  is '年收入';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.education
  is '教育水平';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.travel_mode
  is '出行方式';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.own_house
  is '是否有房';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.own_child
  is '是否有孩子';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.buy_product
  is '已购产品';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.car_type
  is '车型名称';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.car_price
  is '车价';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.car_purpose
  is '车使用性质';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.buy_house_time
  is '房屋购置时间';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.house_price
  is '房屋购置价';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.house_area
  is '房屋建筑面积';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.house_purpose
  is '房产用途';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.house_type
  is '房产类型';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.interest_type
  is '兴趣爱好类型';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.house_ownership_status
  is '住宅所有权状况';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.cus_company_assets
  is '其他公司金融资产';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.res1
  is '备注1';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.res2
  is '备注2';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.res3
  is '备注3';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.res4
  is '备注4';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.own_car
  is '是否有车';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.fax
  is '传真';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_MODIFY_LOG.res
  is '备注';
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
  is '名单ID';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.add_province
  is '地址_省(配送地址)';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.add_city
  is '地址_市(配送地址)';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.add_area
  is '地址_区县(配送地址)';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.cus_email
  is '电子邮件';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.contact_add_province
  is '联络地址_省';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.contact_add_city
  is '联络地址_市';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.contact_add_area
  is '联络地址_区县';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.introducer
  is '介绍人';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.intro_time
  is '转介绍时间';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.introducer_relation
  is '与介绍人关系';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.income
  is '年收入';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.education
  is '教育水平';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.travel_mode
  is '出行方式';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.own_house
  is '是否有房';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.own_child
  is '是否有孩子';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.buy_product
  is '已购产品';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.car_type
  is '车型名称';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.car_price
  is '车价';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.car_purpose
  is '车使用性质';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.buy_house_time
  is '房屋购置时间';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.house_price
  is '房屋购置价';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.house_area
  is '房屋建筑面积';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.house_purpose
  is '房产用途';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.house_type
  is '房产类型';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.interest_type
  is '兴趣爱好类型';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.house_ownership_status
  is '住宅所有权状况';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.cus_company_assets
  is '其他公司金融资产';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.res1
  is '备注1';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.res2
  is '备注2';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.res3
  is '备注3';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.res4
  is '备注4';
comment on column CPIC_SXDX.TB_CUS_LIST_DTL_REMOVE.own_car
  is '是否有车';
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
  is '修改历史版本号';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.cus_list_id
  is '名单ID';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.cus_unique_ide
  is '客户唯一标识';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.cus_name
  is '客户姓名';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.cus_sex
  is '客户性别';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.org_center
  is '电销中心';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.org_proj
  is '项目';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.org_team
  is '团队';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.user_id
  is '座席ID';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.status
  is '名单状态';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.cus_birthday
  is '出生日期';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.cus_age
  is '年龄';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.ide_type
  is '证件类型';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.ide_number
  is '证件号码';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.cus_metier
  is '客户职业';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.mobile
  is '移动电话';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.mobile1
  is '移动电话1';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.mobile2
  is '移动电话2';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.contect_tel
  is '联系电话';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.home_tel
  is '家庭电话';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.off_tel
  is '单位电话';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.contect_tel_type
  is '联系电话类型（常用电话标志）';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.detailed_address
  is '地址_详址';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.postcode
  is '地址_邮编';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.add_type
  is '地址类型';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.emergency_con_person
  is '紧急联络人（姓名）';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.emergency_con_tel
  is '紧急联络人（电话）';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.emer_con_relation
  is '紧急联络人与客户关系';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.contact_detailed_add
  is '联络地址_详址';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.contact_postcode
  is '联络地址邮编';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.cus_company
  is '工作单位';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.metier_level
  is '职业等级';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.marital_status
  is '婚姻状况';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.bank_name
  is '银行（开户行）';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.bank_account_holder
  is '银行开户人（银行账户姓名）';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.bank_account
  is '银行账户（帐号）';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.is_vip
  is '是否寿险VIP';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.batch_id
  is '批次编号';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.org_id
  is '机构流水号';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.creat_person
  is '创建人(默认系统)';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.creat_time
  is '创建时间';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.modify_person
  is '修改人(最后一次修改)';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.modify_time
  is '修改时间(最后一次修改)';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.is_blacklist
  is '是否红黑名单';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.fax
  is '传真';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG.res
  is '备注';
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
  is '修改历史版本号';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.cus_list_id
  is '名单ID';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.cus_unique_ide
  is '客户唯一标识';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.cus_name
  is '客户姓名';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.cus_sex
  is '客户性别';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.org_center
  is '电销中心';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.org_proj
  is '项目';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.org_team
  is '团队';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.user_id
  is '座席ID';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.status
  is '名单状态';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.cus_birthday
  is '出生日期';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.cus_age
  is '年龄';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.ide_type
  is '证件类型';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.ide_number
  is '证件号码';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.cus_metier
  is '客户职业';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.mobile
  is '移动电话';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.mobile1
  is '移动电话1';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.mobile2
  is '移动电话2';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.contect_tel
  is '联系电话';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.home_tel
  is '家庭电话';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.off_tel
  is '单位电话';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.contect_tel_type
  is '联系电话类型（常用电话标志）';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.detailed_address
  is '地址_详址';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.postcode
  is '地址_邮编';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.add_type
  is '地址类型';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.emergency_con_person
  is '紧急联络人（姓名）';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.emergency_con_tel
  is '紧急联络人（电话）';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.emer_con_relation
  is '紧急联络人与客户关系';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.contact_detailed_add
  is '联络地址_详址';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.contact_postcode
  is '联络地址邮编';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.cus_company
  is '工作单位';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.metier_level
  is '职业等级';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.marital_status
  is '婚姻状况';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.bank_name
  is '银行（开户行）';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.bank_account_holder
  is '银行开户人（银行账户姓名）';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.bank_account
  is '银行账户（帐号）';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.is_vip
  is '是否寿险VIP';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.batch_id
  is '批次编号';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.org_id
  is '机构流水号';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.creat_person
  is '创建人(默认系统)';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.creat_time
  is '创建时间';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.modify_person
  is '修改人(最后一次修改)';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.modify_time
  is '修改时间(最后一次修改)';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.is_blacklist
  is '是否红黑名单';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.fax
  is '传真';
comment on column CPIC_SXDX.TB_CUS_LIST_MODIFY_LOG_REMOVE.res
  is '备注';
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
  is '新增名单表';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.cus_newlist_id
  is '新增名单ID';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.newlist_type
  is '新增名单类型<0:客户信息错误修改,1:新增客户,2:未成年子女投保>';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.ori_batch
  is '原批次ID';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.new_batch
  is '新增名单批次ID';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.ori_cus_name
  is '原客户姓名';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.ori_cus_mobile
  is '原客户电话';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.new_cus_name
  is '新增客户姓名';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.new_cus_mobile
  is '新增客户电话';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.organ_id
  is '所属中心';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.agent
  is '所属坐席';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.create_user
  is '创建用户';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.create_time
  is '创建时间';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.is_delete
  is '是否删除<0:未删除,1:删除>';
comment on column CPIC_SXDX.TB_CUS_NEWLIST.cus_list_id
  is '名单表ID';
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
  is '数据权限';
comment on column CPIC_SXDX.TB_DATACONTROL.userid
  is '主键,格式为(为tenmentId+"_"+loginId)';
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
  is '新老系统数据同步监控信息表';
comment on column CPIC_SXDX.TB_DATA_SYN_LOG.table_name
  is '表名';
comment on column CPIC_SXDX.TB_DATA_SYN_LOG.status
  is '同步状态 0：失败；1：成功；';
comment on column CPIC_SXDX.TB_DATA_SYN_LOG.syn_date
  is '最后同步时间';
comment on column CPIC_SXDX.TB_DATA_SYN_LOG.note
  is '同步详细信息记录';

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
  is '配送信息表';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_id
  is 'PK流水号';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.application_id
  is '投保单ID，对应老系统表的APP_ID字段';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_prov
  is '省';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_city
  is '市';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_region
  is '区县';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_dtl
  is '详细地址';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_adds
  is '省+市+区县+详细地址，对应老系统表里的DELI_ADDS字段';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_postcode
  is '邮编';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_name
  is '收件人姓名';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_phoneno
  is '收件人电话，对应老系统里的DELI_TEL字段';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.deli_note
  is '备注';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.zone_code
  is '区域编码';
comment on column CPIC_SXDX.TB_DELIVERY_INFO.mark
  is '地址来源：0-名单客户；1-名单紧急客户；2-其他';
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
  is '数据字典项表';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.parent_id
  is '数据字典项ID';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.name
  is '数据字典项名称';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.desc
  is '描述';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.istree
  is '是否为树节点。
1是。
默认0';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.belongtable
  is '所属表，多个表之间用逗号分开，代码生成使用字段
';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.belongfield
  is '所属字段，代码生成使用字段';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.issystem
  is '是否不可
0不是
1是。默认0

系统字典。对于租户用户只能查看不能做任何操作。';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.isautodictionaryid
  is '字典值编号是否自动生成？
0否，默认0
1是。';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.isdel
  is '是否删除。1删除。0不删除。';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.create_user
  is '创建人';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.create_time
  is '创建时间';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.update_user
  is '修改人';
comment on column CPIC_SXDX.TB_DICTIONARY_PARENT.update_time
  is '修改时间';
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
  is '投保单渠道类型表';
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
  is '险种属性ID';
comment on column CPIC_SXDX.TB_ELEMENT.element_name
  is '属性名称';
comment on column CPIC_SXDX.TB_ELEMENT.element_code
  is '属性编码';
comment on column CPIC_SXDX.TB_ELEMENT.element_type
  is '属性类型';
comment on column CPIC_SXDX.TB_ELEMENT.sort
  is '属性显示排列顺序';
comment on column CPIC_SXDX.TB_ELEMENT.remark
  is '备注，老系统为：REMARK';
comment on column CPIC_SXDX.TB_ELEMENT.is_delete
  is '是否删除：0，否；1，是';
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
  is '险种元素ID';
comment on column CPIC_SXDX.TB_ELEMENT_VALUE.name
  is '元素值名称';
comment on column CPIC_SXDX.TB_ELEMENT_VALUE.value
  is '元素值';
comment on column CPIC_SXDX.TB_ELEMENT_VALUE.remark
  is '备注，老系统为：REMARK';
comment on column CPIC_SXDX.TB_ELEMENT_VALUE.is_delete
  is '是否删除：0，否；1，是';
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
  is '逐渐ID';
comment on column CPIC_SXDX.TB_ELE_ELEMENT_VALUE.element_value_id
  is '元素ID';
comment on column CPIC_SXDX.TB_ELE_ELEMENT_VALUE.element_id
  is '险种属性ID';
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
  is '文件路径';
comment on column CPIC_SXDX.TB_FILE_LOG.filetype
  is '文件类型1=冻结用户';
comment on column CPIC_SXDX.TB_FILE_LOG.batchdate
  is '日期批次';
comment on column CPIC_SXDX.TB_FILE_LOG.dataname
  is '文件名';
comment on column CPIC_SXDX.TB_FILE_LOG.createtime
  is '创建时间';
comment on column CPIC_SXDX.TB_FILE_LOG.changetime
  is '更新时间';
comment on column CPIC_SXDX.TB_FILE_LOG.issuccess
  is '0=成功1=失败';
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
  is '文件ID';
comment on column CPIC_SXDX.TB_FILE_UPLOAD_LOG.file_type
  is '文件类型(1-批次文件、2-客户信息文件)';
comment on column CPIC_SXDX.TB_FILE_UPLOAD_LOG.file_name
  is '文件名称';
comment on column CPIC_SXDX.TB_FILE_UPLOAD_LOG.file_path
  is '文件路径';
comment on column CPIC_SXDX.TB_FILE_UPLOAD_LOG.user_id
  is '上传人ID';
comment on column CPIC_SXDX.TB_FILE_UPLOAD_LOG.upload_date
  is '上传日期';
comment on column CPIC_SXDX.TB_FILE_UPLOAD_LOG.upload_state
  is '上传状态（0-成功，1-已删除）';
comment on column CPIC_SXDX.TB_FILE_UPLOAD_LOG.is_save
  is '是否跑批入库(0-没入库，1-入库)';
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
  is '主键';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_name
  is '投保人姓名';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_gender
  is '投保人性别-1:男 2:女';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_lic_type
  is '投保人证件类型';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_lic_no
  is '投保人证件号码';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_insed_rel
  is '投保人与被保护人关系';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_email
  is '投保人MAIL';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_cell_no
  is '投保人固话号码';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_phone_no
  is '投保人手机号码';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_birthday
  is '投保人生日(YYYY-MM-DD)';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_postcode
  is '投保人邮政编码';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_adds
  is '投保人地址';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.insed_name
  is '被保人姓名';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.insed_lic_type
  is '被保人证件类型';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.insed_lic_no
  is '被保人证件号码';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.insed_birthday
  is '被保人(YYYY-MM-DD)';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.app_startdt
  is '赠险单生效日期(YYYY-MM-DD)';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.create_time
  is '创建时间(YYYY-MM-DD HH:MM:SS)';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.update_time
  is '最后修改时间';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.company_id
  is '投保分公司';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.product_code_id
  is '赠险产品id';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.benifit
  is '受益人';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.user_id
  is '用户ID';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_province
  is '投保人所在省份';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_city
  is '投保人所在地级市';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_area
  is '投保人所在的下级区或县';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.is_take_in
  is '是否接受其它保险';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.is_buy
  is '是否买车';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.end_time
  is '车险到期日期';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.app_stat_new
  is '新流程保单状态 01:暂存成功 02:分配保单号成功 03:已提交 ';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.presentins_type
  is '保单类型 1：自建赠险信息 2：导入赠险信息3：行销导入';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_metier
  is '投保人职业';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_keep_soc_ins
  is '是否有社保';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_int_ins
  is '感兴趣的险种';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_marital
  is '健康状况';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_education
  is '最高学历 1:博士研究生 2:硕士研究生 3:大学本科 4:大学专科 5:普通高中 6:中职（中专、职校、技校） 7:初中及以下';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_salary
  is '年收入金额   1:3万元以下  2:3万（含）至10万元  3:10万（含）至30万元  4:30万元（含）以上';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_health
  is '健康状况';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_keep_ins
  is '是否购买过保险';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.is_del
  is '是否删除。 0默认。1为删除';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.is_send
  is '是否发送给老系统 0没有发送   1已经发送 默认为 0';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.apper_id
  is '客户的ID';
comment on column CPIC_SXDX.TB_FREE_APPLICATION.obcom_id
  is '活动ID';
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
  is '主键';
comment on column CPIC_SXDX.TB_FREE_APP_OBCOM.obm_id
  is '活动id';
comment on column CPIC_SXDX.TB_FREE_APP_OBCOM.code
  is '赠险产品CODE';
comment on column CPIC_SXDX.TB_FREE_APP_OBCOM.name
  is '赠险产品名称';
comment on column CPIC_SXDX.TB_FREE_APP_OBCOM.status
  is '状态';
comment on column CPIC_SXDX.TB_FREE_APP_OBCOM.create_time
  is '创建时间';
comment on column CPIC_SXDX.TB_FREE_APP_OBCOM.creator
  is '创建人';
comment on column CPIC_SXDX.TB_FREE_APP_OBCOM.updator
  is '更新人';
comment on column CPIC_SXDX.TB_FREE_APP_OBCOM.update_time
  is '更新时间';
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
  is '主键';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.code
  is '赠险产品code';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.name
  is '赠险产品名称';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.status
  is '0:正常,1:删除';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.insured_period
  is '保障期限';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.insured_period_unit
  is '保障期限单位 01：天 02：月 03：年';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.insurance_ident
  is '险种标识 1:为其他赠险，2:为世纪行赠险';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.composite_ins_code
  is '综意险代码';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.pay_stad
  is '缴费标准';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.fs
  is '分数';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT.bxzr
  is '保险责任';
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
  is '主键';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.code
  is '赠险产品code';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.name
  is '赠险产品名称';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.status
  is '0:正常,1:删除';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.insured_period
  is '保障期限';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.insured_period_unit
  is '保障期限单位 01：天 02：月 03：年';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.insurance_ident
  is '险种标识 1:为其他赠险，2:为世纪行赠险';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.composite_ins_code
  is '综意险代码';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.pay_stad
  is '缴费标准';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.fs
  is '分数';
comment on column CPIC_SXDX.TB_FREE_APP_PRODUCT_TEMP.bxzr
  is '保险责任';
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
  is '险种表';
comment on column CPIC_SXDX.TB_INSURANCE.insurance_id
  is '险种ID';
comment on column CPIC_SXDX.TB_INSURANCE.insurance_name
  is '险种名称';
comment on column CPIC_SXDX.TB_INSURANCE.insurance_type
  is '险种类型：0，主险；1，辅险';
comment on column CPIC_SXDX.TB_INSURANCE.insurance_sum
  is '保额';
comment on column CPIC_SXDX.TB_INSURANCE.remark
  is '备注，老系统为：REMARK';
comment on column CPIC_SXDX.TB_INSURANCE.is_delete
  is '删除标识';
comment on column CPIC_SXDX.TB_INSURANCE.term_type
  is '保险期间类型: 0，定期年；1，定期岁；2，终身';
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
  is '险种代码表';
comment on column CPIC_SXDX.TB_INSURANCE_TERM_CODE.insurance_term_code_id
  is '险种代码ID';
comment on column CPIC_SXDX.TB_INSURANCE_TERM_CODE.insurance_id
  is '险种ID';
comment on column CPIC_SXDX.TB_INSURANCE_TERM_CODE.term
  is '保险期间';
comment on column CPIC_SXDX.TB_INSURANCE_TERM_CODE.insurance_code
  is '险种代码';
comment on column CPIC_SXDX.TB_INSURANCE_TERM_CODE.ff_insurance_code
  is 'FF险种代码';
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
  is '险种属性关联表';
comment on column CPIC_SXDX.TB_INS_ELEMENT.ins_element_id
  is '主键ID';
comment on column CPIC_SXDX.TB_INS_ELEMENT.element_id
  is '险种属性ID';
comment on column CPIC_SXDX.TB_INS_ELEMENT.insurance_id
  is '险种ID';
comment on column CPIC_SXDX.TB_INS_ELEMENT.default_value
  is '默认值';
comment on column CPIC_SXDX.TB_INS_ELEMENT.is_hidden
  is '是否隐藏';
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
  is '险种元素关联表';
comment on column CPIC_SXDX.TB_INS_ELEMENT_VALUE.ins_element_value_id
  is '主键ID';
comment on column CPIC_SXDX.TB_INS_ELEMENT_VALUE.element_value_id
  is '元素ID';
comment on column CPIC_SXDX.TB_INS_ELEMENT_VALUE.insurance_id
  is '险种ID';
comment on column CPIC_SXDX.TB_INS_ELEMENT_VALUE.element_id
  is '险种属性ID';
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
  is '受限职业类型表';
comment on column CPIC_SXDX.TB_LIMIT_METIERTYPE.limit_metiertype_id
  is '寿险职业类型ID';
comment on column CPIC_SXDX.TB_LIMIT_METIERTYPE.metiertype_name
  is '职业类型名称';
comment on column CPIC_SXDX.TB_LIMIT_METIERTYPE.metiertype_des
  is '职业类型描述';
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
  is '投保单提交日志表';
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
  is '核心系统投保单提交日志表';
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
  is '短信ID';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.mobiletel
  is '移动电话';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.message_time
  is '发送的短信时间（精确到时分秒）';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.cus_list_id
  is '名单ID';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.task_id
  is '任务ID';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.is_success
  is '短信发送是否成功   0--成功  1--失败';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.memo
  is '发送的日志信息  失败记录时间和失败原因';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.create_user
  is '创建人';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.create_time
  is '创建时间';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.update_user
  is '修改人';
comment on column CPIC_SXDX.TB_MESSAGE_LOG.update_time
  is '修改时间';

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
  is '职业类别';
comment on column CPIC_SXDX.TB_METIER.is_del
  is '是否删除：0，否；1，是';
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
  is '职业类别名称';
comment on column CPIC_SXDX.TB_METIER_TYP.des
  is '职业类别描述';
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
  is '项目ID';
comment on column CPIC_SXDX.TB_PROJECT_INFO.grp_id
  is '项目群ID';
comment on column CPIC_SXDX.TB_PROJECT_INFO.prj_name
  is '项目名称';
comment on column CPIC_SXDX.TB_PROJECT_INFO.prj_status
  is '是否有效,1-有效;2-无效';
comment on column CPIC_SXDX.TB_PROJECT_INFO.sale_cha
  is '销售渠道';
comment on column CPIC_SXDX.TB_PROJECT_INFO.ins_src
  is '投保单来源';
comment on column CPIC_SXDX.TB_PROJECT_INFO.oc_id
  is '相关外包公司';
comment on column CPIC_SXDX.TB_PROJECT_INFO.file_fmt
  is '导入文件格式';
comment on column CPIC_SXDX.TB_PROJECT_INFO.memo
  is '项目说明';
comment on column CPIC_SXDX.TB_PROJECT_INFO.sign_typ
  is '出单方式';
comment on column CPIC_SXDX.TB_PROJECT_INFO.bank_flag
  is '是否银保通';
comment on column CPIC_SXDX.TB_PROJECT_INFO.prj_typ
  is '项目类别';
comment on column CPIC_SXDX.TB_PROJECT_INFO.cus_typ
  is '客户类别';
comment on column CPIC_SXDX.TB_PROJECT_INFO.org_id
  is '业务机构,项目所属机构';
comment on column CPIC_SXDX.TB_PROJECT_INFO.create_dat
  is '创建时间';
comment on column CPIC_SXDX.TB_PROJECT_INFO.creator
  is '创建人';
comment on column CPIC_SXDX.TB_PROJECT_INFO.modify_dat
  is '修改时间';
comment on column CPIC_SXDX.TB_PROJECT_INFO.modifier
  is '修改人';
comment on column CPIC_SXDX.TB_PROJECT_INFO.old_prj_id
  is '老系统项目ID';
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
  is '活动管理';
comment on column CPIC_SXDX.TB_OB_COM.ob_com_id
  is '活动主键';
comment on column CPIC_SXDX.TB_OB_COM.ob_com_sta
  is '3-正常;4-删除.从标识字典中取';
comment on column CPIC_SXDX.TB_OB_COM.center
  is '从组织架构中读出';
comment on column CPIC_SXDX.TB_OB_COM.namlst_type
  is '从字典中取';
comment on column CPIC_SXDX.TB_OB_COM.recv_type
  is '1-先收费,2-出单,从标识字典表中获取';
comment on column CPIC_SXDX.TB_OB_COM.pay_type
  is '转账，现金，支票，POS';
comment on column CPIC_SXDX.TB_OB_COM.repay_type
  is '转账，现金，支票，POS';
comment on column CPIC_SXDX.TB_OB_COM.create_dat
  is '创建时间';
comment on column CPIC_SXDX.TB_OB_COM.creator
  is '创建人';
comment on column CPIC_SXDX.TB_OB_COM.modify_dat
  is '修改时间';
comment on column CPIC_SXDX.TB_OB_COM.modifier
  is '修改人';
comment on column CPIC_SXDX.TB_OB_COM.prj_id
  is '项目ID';
comment on column CPIC_SXDX.TB_OB_COM.ob_com_code
  is '活动代码';
comment on column CPIC_SXDX.TB_OB_COM.main_pro_id
  is '主产品ID';
comment on column CPIC_SXDX.TB_OB_COM.promotionid
  is '促销品ID';
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
  is '促销品';
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
  is '活动代码';
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
  is '活动代码';
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
  is '产品ID';
comment on column CPIC_SXDX.TB_PRODUCT.product_name
  is '产品名称';
comment on column CPIC_SXDX.TB_PRODUCT.product_introduction
  is '产品介绍';
comment on column CPIC_SXDX.TB_PRODUCT.remark
  is '备注，老系统备注为：REMARK';
comment on column CPIC_SXDX.TB_PRODUCT.is_delete
  is '删除标识';
comment on column CPIC_SXDX.TB_PRODUCT.minage
  is '最小销售年龄';
comment on column CPIC_SXDX.TB_PRODUCT.maxage
  is '最大销售年龄';
comment on column CPIC_SXDX.TB_PRODUCT.feemax
  is '承保金额上限';
comment on column CPIC_SXDX.TB_PRODUCT.bene_type
  is '分红方式';
comment on column CPIC_SXDX.TB_PRODUCT.first_pay_month_total
  is '首期缴费月数';
comment on column CPIC_SXDX.TB_PRODUCT.is_ff
  is '配送保单时辅助判断是否长险：1 是，0 否';
comment on column CPIC_SXDX.TB_PRODUCT.start_counts
  is '起售份数';
comment on column CPIC_SXDX.TB_PRODUCT.add_counts
  is '累加份数';
comment on column CPIC_SXDX.TB_PRODUCT.creat_person
  is '创建人';
comment on column CPIC_SXDX.TB_PRODUCT.creat_time
  is '创建时间';
comment on column CPIC_SXDX.TB_PRODUCT.modify_person
  is '修改人';
comment on column CPIC_SXDX.TB_PRODUCT.modify_time
  is '修改时间';
comment on column CPIC_SXDX.TB_PRODUCT.scale_flag
  is '保费小数位前后置标志：0-前置;1-后置';
comment on column CPIC_SXDX.TB_PRODUCT.bulk_sale_counts
  is '趸缴起售份数';
comment on column CPIC_SXDX.TB_PRODUCT.product_type
  is '款别';
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
  is '活动代码';
comment on column CPIC_SXDX.TB_OB_COM_PRODUCT.product_id
  is '产品ID';
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
  is '活动与话术关联';
comment on column CPIC_SXDX.TB_OB_COM_SKILLS_TALK.ob_com_id
  is '活动代码';
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
  is '分公司业务员表';
comment on column CPIC_SXDX.TB_OPERATE_USER.operate_user_id
  is '业务员ID';
comment on column CPIC_SXDX.TB_OPERATE_USER.company_id
  is '业务机构ID';
comment on column CPIC_SXDX.TB_OPERATE_USER.operate_user_code
  is '业务员编码';
comment on column CPIC_SXDX.TB_OPERATE_USER.operate_user_name
  is '业务员姓名';
comment on column CPIC_SXDX.TB_OPERATE_USER.operate_user_statu
  is '业务员状态';
comment on column CPIC_SXDX.TB_OPERATE_USER.remark
  is '备注';
comment on column CPIC_SXDX.TB_OPERATE_USER.is_delete
  is '删除标识';
comment on column CPIC_SXDX.TB_OPERATE_USER.org_id
  is '电销中心ID';
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
  is '业务机构';
comment on column CPIC_SXDX.TB_ORG_USER.user_id
  is '业务员';
comment on column CPIC_SXDX.TB_ORG_USER.ob_com_id
  is '活动代码';
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
  is '保费费率表';
comment on column CPIC_SXDX.TB_PREMIUM.premium_id
  is '保费ID';
comment on column CPIC_SXDX.TB_PREMIUM.insurance_id
  is '险种ID';
comment on column CPIC_SXDX.TB_PREMIUM.age
  is '年龄';
comment on column CPIC_SXDX.TB_PREMIUM.sex
  is '性别';
comment on column CPIC_SXDX.TB_PREMIUM.term
  is '年限、保险期间';
comment on column CPIC_SXDX.TB_PREMIUM.price
  is '价格或缴费标准';
comment on column CPIC_SXDX.TB_PREMIUM.pay_way
  is '缴费方式';
comment on column CPIC_SXDX.TB_PREMIUM.is_delete
  is '删除标识：0为否，1为删除';
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
  is '项目群ID';
comment on column CPIC_SXDX.TB_PRJ_GRP.grp_name
  is '项目群名称';
comment on column CPIC_SXDX.TB_PRJ_GRP.grp_desc
  is '项目群描述';
comment on column CPIC_SXDX.TB_PRJ_GRP.is_del
  is '删除标记,01-正常;02-已删除.默认值为01';
comment on column CPIC_SXDX.TB_PRJ_GRP.create_dat
  is '创建时间';
comment on column CPIC_SXDX.TB_PRJ_GRP.creator
  is '创建人';
comment on column CPIC_SXDX.TB_PRJ_GRP.modify_dat
  is '修改时间';
comment on column CPIC_SXDX.TB_PRJ_GRP.modifier
  is '修改人';
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
  is '主键ID';
comment on column CPIC_SXDX.TB_PRODUCT_INSURANCE.insurance_id
  is '险种ID';
comment on column CPIC_SXDX.TB_PRODUCT_INSURANCE.product_id
  is '产品ID';
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
  is '产品与受限职业类型关联表';
comment on column CPIC_SXDX.TB_PRODUCT_LIMIT_METIER.product_limit_metier_id
  is '主键ID
';
comment on column CPIC_SXDX.TB_PRODUCT_LIMIT_METIER.limit_metiertype_id
  is '寿险职业类型ID';
comment on column CPIC_SXDX.TB_PRODUCT_LIMIT_METIER.product_id
  is '产品ID';
comment on column CPIC_SXDX.TB_PRODUCT_LIMIT_METIER.flag
  is '1.为产品名称  2。为职业类型';
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
  is '告知事项，保项问题';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.product_question_id
  is '告知事项ID';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.parent_question_id
  is '告知事项父ID';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.question_name
  is '问题名称';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.question_value
  is '问题答案（可以通过该问题的答案，仅有可能是Y,N，不符合该答案则对该客户营销活动失败，不能为该客户完成保单）';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.remark
  is '备注，老系统为：REMARK';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.is_delete
  is '删除标识';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.question_lev
  is '告知事项等级';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.question_code
  is '告知事项编码';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.creat_person
  is '创建人';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.creat_time
  is '创建时间';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.modify_person
  is '修改人';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION.modify_time
  is '修改时间';
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
  is '告知事项ID';
comment on column CPIC_SXDX.TB_PRODUCT_QUESTION_REL.product_id
  is '产品ID';
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
  is '促销品保单表';
comment on column CPIC_SXDX.TB_PROMOTION_APPLICATION.promotionapp_id
  is '促销品保单ID';
comment on column CPIC_SXDX.TB_PROMOTION_APPLICATION.promotion_id
  is '促销品ID';
comment on column CPIC_SXDX.TB_PROMOTION_APPLICATION.customer_id
  is '客户ID';
comment on column CPIC_SXDX.TB_PROMOTION_APPLICATION.delivery_date
  is '赠送日期';
comment on column CPIC_SXDX.TB_PROMOTION_APPLICATION.ob_com_id
  is '活动ID';
comment on column CPIC_SXDX.TB_PROMOTION_APPLICATION.org_id
  is '电销中心';
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
  is '促销品ID 主键';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.code
  is '促销产品编码';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.name
  is '促销产品名称';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.begin_date
  is '有效起期';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.end_date
  is '有效止期';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.description
  is '促销品描述';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.is_del
  is '是否删除（0为否，1为是）';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.create_date
  is '创建时间';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.create_user
  is '创建人';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.update_date
  is '更新时间';
comment on column CPIC_SXDX.TB_PROMOTION_PRODUCT.update_user
  is '更新人';
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
  is '对账文件表';
comment on column CPIC_SXDX.TB_RECONCILE.id
  is '递增ID';
comment on column CPIC_SXDX.TB_RECONCILE.order_id
  is '订单号                         资金平台支付时的 订单号';
comment on column CPIC_SXDX.TB_RECONCILE.policy_id
  is '保单号';
comment on column CPIC_SXDX.TB_RECONCILE.order_amount
  is '订单金额';
comment on column CPIC_SXDX.TB_RECONCILE.company
  is '机构代码                      该笔业务所属的机构，机构为财务机构代码';
comment on column CPIC_SXDX.TB_RECONCILE.currency
  is '币种                                固定填：CNY（电销系统为001）';
comment on column CPIC_SXDX.TB_RECONCILE.plug_pay
  is '第三方                           支付方式 : 2009-快钱，2003-通联，2011-B2bi支付宝，2006-支付宝，2014-支付宝（电销）';
comment on column CPIC_SXDX.TB_RECONCILE.pay_date
  is '实际缴费日期            电销系统向FF发送收费信息的日期，格式为yyyyMMdd';
comment on column CPIC_SXDX.TB_RECONCILE.bill_p10_date
  is '发起对帐日期            电销系统向FF发起对账的日期，格式为yyyyMMdd';
comment on column CPIC_SXDX.TB_RECONCILE.return_code
  is 'P10返回码                    0000000：成功
       0000001：保单不存在
      0000002：金额不匹配或者不存在
      0000004：重复录入';
comment on column CPIC_SXDX.TB_RECONCILE.policy_date
  is '前端系统出单日期   保单在电销系统中投保日期，格式为yyyyMMdd';
comment on column CPIC_SXDX.TB_RECONCILE.is_ff
  is '0：短险  1：长险';
comment on column CPIC_SXDX.TB_RECONCILE.status
  is '与资金平台对账状态                   0：初始值      1：失败     2:  成功 ';
comment on column CPIC_SXDX.TB_RECONCILE.error_msg
  is '与资金平台对账失败原因';
comment on column CPIC_SXDX.TB_RECONCILE.create_date
  is '创建日期';
comment on column CPIC_SXDX.TB_RECONCILE.update_date
  is '更新日期';
comment on column CPIC_SXDX.TB_RECONCILE.ffdz
  is '与FF对账状态                        0 ：初始值   1：已提交对账  2:对账失败  3：对账成功   4：已提交结算';
comment on column CPIC_SXDX.TB_RECONCILE.zjjs
  is '与资金平台结算状态         0： 初始值      1：结算  ';
comment on column CPIC_SXDX.TB_RECONCILE.trade_time
  is '交易(付款)日期';
comment on column CPIC_SXDX.TB_RECONCILE.p10_desc
  is 'P10返回描述';
comment on column CPIC_SXDX.TB_RECONCILE.payment_status
  is '扣款状态 0:扣款成功 1:扣款失败 2:扣款受理中';
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
  is '对账文件历史表';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.policy_id
  is '保单号';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.order_id
  is '订单号';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.bill_type
  is '账单类型                       0：与资金平台的对账文件    1：与P10平台的对账文件
  2：与资金平台的结算文件     3：与P10平台的结算文件   ';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.status
  is '对账状态                       0：成功 1: 失败    （发送无状态，接受才有状态）';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.bill_chanel
  is '账单渠道                       0：接收 1：发送';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.is_ff
  is '险种区分                       0：短险  1：长险';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.bill_head_info
  is '表头报文信息';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.bill_content_info
  is '行记录报文信息';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.bill_num
  is '清单号                            资金平台的对账单号';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.bill_date
  is '清单日期                        对账的发送日期YYMMDD';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.setmt_date
  is '结算日期                        对应结算单的结算日期YYYYMMDD';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.account_date
  is '交易日期                        核对的是哪天的交易YYMMDD';
comment on column CPIC_SXDX.TB_RECONCILE_HIS.create_date
  is '创建日期 ';
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
  is '销售历史表';
comment on column CPIC_SXDX.TB_SALE_HISTORY.history_id
  is '销售历史ID';
comment on column CPIC_SXDX.TB_SALE_HISTORY.cus_list_id
  is '名单ID';
comment on column CPIC_SXDX.TB_SALE_HISTORY.customer_id
  is '客户唯一标识';
comment on column CPIC_SXDX.TB_SALE_HISTORY.obcom_id
  is '活动ID';
comment on column CPIC_SXDX.TB_SALE_HISTORY.activity_name
  is '活动名称';
comment on column CPIC_SXDX.TB_SALE_HISTORY.user_id
  is '执行者（当前操作员）';
comment on column CPIC_SXDX.TB_SALE_HISTORY.user_name
  is '执行者（操作员名称）';
comment on column CPIC_SXDX.TB_SALE_HISTORY.contact_phone
  is '联系电话';
comment on column CPIC_SXDX.TB_SALE_HISTORY.first_result
  is '一级电销结果';
comment on column CPIC_SXDX.TB_SALE_HISTORY.second_result
  is '二级电销结果';
comment on column CPIC_SXDX.TB_SALE_HISTORY.is_contact
  is '接触情况（0：未接触，1：已接触）';
comment on column CPIC_SXDX.TB_SALE_HISTORY.is_through
  is '拨通情况（0：未拨通，1：已拨通）';
comment on column CPIC_SXDX.TB_SALE_HISTORY.callover_time
  is '通话结束时间';
comment on column CPIC_SXDX.TB_SALE_HISTORY.appoint_time
  is '预约回妨时间';
comment on column CPIC_SXDX.TB_SALE_HISTORY.memo
  is '备注';
comment on column CPIC_SXDX.TB_SALE_HISTORY.configuration
  is '其它属性字段集（以回车区分，KEY/VALUE键值对保存）';
comment on column CPIC_SXDX.TB_SALE_HISTORY.task_id
  is '任务编号';
comment on column CPIC_SXDX.TB_SALE_HISTORY.task_status
  is '上一任务状态';
comment on column CPIC_SXDX.TB_SALE_HISTORY.task_type
  is '上一任务类型';
comment on column CPIC_SXDX.TB_SALE_HISTORY.policy_id
  is '投保单编号';
comment on column CPIC_SXDX.TB_SALE_HISTORY.policy_status
  is '投保单状态';
comment on column CPIC_SXDX.TB_SALE_HISTORY.create_history_date
  is '历史生成时间';
comment on column CPIC_SXDX.TB_SALE_HISTORY.ext
  is '扩展字段';
comment on column CPIC_SXDX.TB_SALE_HISTORY.call_duration
  is '通话时长';
comment on column CPIC_SXDX.TB_SALE_HISTORY.callstart_time
  is '通话开始时间';
comment on column CPIC_SXDX.TB_SALE_HISTORY.task_status_last
  is '任务状态';
comment on column CPIC_SXDX.TB_SALE_HISTORY.task_type_last
  is '任务类型';
comment on column CPIC_SXDX.TB_SALE_HISTORY.history_date_last
  is '上次历史生成时间';
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
  is '职场管理';
comment on column CPIC_SXDX.TB_WORKPLACE.workplace_id
  is '职场管理表中的职场编号';
comment on column CPIC_SXDX.TB_WORKPLACE.org_id
  is '机构流水号';
comment on column CPIC_SXDX.TB_WORKPLACE.workplace_name
  is '职场管理表中的职场名称';
comment on column CPIC_SXDX.TB_WORKPLACE.softphone_url
  is '职场管理表中的软电话URL';
comment on column CPIC_SXDX.TB_WORKPLACE.cti_address
  is '职场管理表中的CTI地址';
comment on column CPIC_SXDX.TB_WORKPLACE.cti_port
  is '职场管理表中的CTI端口';
comment on column CPIC_SXDX.TB_WORKPLACE.workplace_type
  is '职场管理表中的职场类型';
comment on column CPIC_SXDX.TB_WORKPLACE.contact_name
  is '职场管理表中的联系人';
comment on column CPIC_SXDX.TB_WORKPLACE.contact_phone
  is '职场管理表中的联系人电话';
comment on column CPIC_SXDX.TB_WORKPLACE.contact_address
  is '职场管理表中的联系地址';
comment on column CPIC_SXDX.TB_WORKPLACE.contact_comment
  is '职场管理表中的职场备注';
comment on column CPIC_SXDX.TB_WORKPLACE.ivr_group_num
  is '职场管理表中的IVR组号';
comment on column CPIC_SXDX.TB_WORKPLACE.is_del
  is '删除标志';
comment on column CPIC_SXDX.TB_WORKPLACE.voice_address
  is '职场管理表中的录音调听地址';
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
  is '职场管理中关联的技能组表';
comment on column CPIC_SXDX.TB_SKILL_GROUP.workplace_id
  is '职场管理表中的职场编号';
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
  is '待办工单表';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.standby_id
  is '待办工单标示id';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.tel_center
  is '电话销售中心名称';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.new_date
  is '待办工单的新增日期';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.project
  is '待办工单所属项目名称';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.fen_company
  is '待办工单所属分公司名称';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.appno
  is '待办工单的投保单号';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.policyno
  is '待办工单的保单号';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.product_connect
  is '保单的联系人';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.product_connect_tel
  is '保单的联系人电话号码';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.custer
  is '保单上的客户姓名';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.custer_card
  is '保单上客户的身份证号码';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.custer_tel
  is '保单上客户的联系电话';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.project_name
  is '待办工单上的产品';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.baoquan_pro
  is '待办工单上的保全项目名称';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.baoquan_content
  is '待办工单上的保全内容';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.baoquan_comment
  is '待办工单上的保全备注';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.create_user
  is '创建人';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.create_time
  is '创建时间';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.update_user
  is '修改人';
comment on column CPIC_SXDX.TB_STANDBY_ORDER.update_time
  is '修改时间';
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
  is '任务表';
comment on column CPIC_SXDX.TB_TASK_BAK.task_id
  is '任务ID';
comment on column CPIC_SXDX.TB_TASK_BAK.task_level
  is '优化级';
comment on column CPIC_SXDX.TB_TASK_BAK.create_time
  is '任务创建时间';
comment on column CPIC_SXDX.TB_TASK_BAK.change_time
  is '最后改变时间';
comment on column CPIC_SXDX.TB_TASK_BAK.is_important
  is '是否重点提醒（删除）';
comment on column CPIC_SXDX.TB_TASK_BAK.appoint_time
  is '预约时间';
comment on column CPIC_SXDX.TB_TASK_BAK.active_status
  is '激活状态';
comment on column CPIC_SXDX.TB_TASK_BAK.task_memo
  is '任务说明';
comment on column CPIC_SXDX.TB_TASK_BAK.callresult_type
  is '拨打小节模板(跟踪销售=1 问题件=2 订单审核=3 内呼咨询=4)';
comment on column CPIC_SXDX.TB_TASK_BAK.first_result
  is '拨打小节一级结果';
comment on column CPIC_SXDX.TB_TASK_BAK.second_result
  is '拨打小节二级结果';
comment on column CPIC_SXDX.TB_TASK_BAK.user_id
  is '所属座席';
comment on column CPIC_SXDX.TB_TASK_BAK.org_id
  is '所属机构';
comment on column CPIC_SXDX.TB_TASK_BAK.status_id
  is '状态编号';
comment on column CPIC_SXDX.TB_TASK_BAK.type_id
  is '类型编号';
comment on column CPIC_SXDX.TB_TASK_BAK.policy_id
  is '投保单ID';
comment on column CPIC_SXDX.TB_TASK_BAK.batch_id
  is '批次ID';
comment on column CPIC_SXDX.TB_TASK_BAK.cus_list_id
  is '名单ID';
comment on column CPIC_SXDX.TB_TASK_BAK.ob_com_id
  is '活动ID';
comment on column CPIC_SXDX.TB_TASK_BAK.policy_id_cancle
  is '撤单投保单Id';
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
  is '任务历史表';
comment on column CPIC_SXDX.TB_TASK_HISTORY.history_id
  is '销售历史编号';
comment on column CPIC_SXDX.TB_TASK_HISTORY.task_id
  is '任务ID';
comment on column CPIC_SXDX.TB_TASK_HISTORY.task_level
  is '优先级';
comment on column CPIC_SXDX.TB_TASK_HISTORY.create_time
  is '任务创建时间';
comment on column CPIC_SXDX.TB_TASK_HISTORY.change_time
  is '任务最后变化时间';
comment on column CPIC_SXDX.TB_TASK_HISTORY.is_important
  is '是否重点提醒';
comment on column CPIC_SXDX.TB_TASK_HISTORY.appoint_time
  is '预约时间';
comment on column CPIC_SXDX.TB_TASK_HISTORY.active_status
  is '激活状态';
comment on column CPIC_SXDX.TB_TASK_HISTORY.task_memo
  is '任务说明';
comment on column CPIC_SXDX.TB_TASK_HISTORY.callresult_type
  is '最后拨打小节';
comment on column CPIC_SXDX.TB_TASK_HISTORY.first_result
  is '拨打一级结果';
comment on column CPIC_SXDX.TB_TASK_HISTORY.second_result
  is '拨打二级结果';
comment on column CPIC_SXDX.TB_TASK_HISTORY.user_id
  is '所属座席ID';
comment on column CPIC_SXDX.TB_TASK_HISTORY.org_id
  is '所属机构';
comment on column CPIC_SXDX.TB_TASK_HISTORY.status_id
  is '任务状态';
comment on column CPIC_SXDX.TB_TASK_HISTORY.type_id
  is '任务类型';
comment on column CPIC_SXDX.TB_TASK_HISTORY.policy_id
  is '保单号';
comment on column CPIC_SXDX.TB_TASK_HISTORY.ob_com_id
  is '活动编号';
comment on column CPIC_SXDX.TB_TASK_HISTORY.batch_id
  is '批次ID';
comment on column CPIC_SXDX.TB_TASK_HISTORY.cus_list_id
  is '名单ID';
comment on column CPIC_SXDX.TB_TASK_HISTORY.create_history_date
  is '历史任务生成时间';
comment on column CPIC_SXDX.TB_TASK_HISTORY.ext1
  is '扩展字段2';
comment on column CPIC_SXDX.TB_TASK_HISTORY.ext2
  is '扩展字段2';
comment on column CPIC_SXDX.TB_TASK_HISTORY.ext3
  is '扩展字段3';
comment on column CPIC_SXDX.TB_TASK_HISTORY.ext4
  is '扩展字段4';
comment on column CPIC_SXDX.TB_TASK_HISTORY.status_id_last
  is '上一状态编号';
comment on column CPIC_SXDX.TB_TASK_HISTORY.type_id_last
  is '上一类型编号';
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
  is '任务历史表';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.history_id
  is '销售历史编号';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.task_id
  is '任务ID';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.task_level
  is '优先级';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.create_time
  is '任务创建时间';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.change_time
  is '任务最后变化时间';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.is_important
  is '是否重点提醒';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.appoint_time
  is '预约时间';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.active_status
  is '激活状态';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.task_memo
  is '任务说明';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.callresult_type
  is '最后拨打小节';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.first_result
  is '拨打一级结果';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.second_result
  is '拨打二级结果';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.user_id
  is '所属座席ID';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.org_id
  is '所属机构';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.status_id
  is '任务状态';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.type_id
  is '任务类型';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.policy_id
  is '保单号';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.ob_com_id
  is '活动编号';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.batch_id
  is '批次ID';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.cus_list_id
  is '名单ID';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.create_history_date
  is '历史任务生成时间';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.ext1
  is '扩展字段2';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.ext2
  is '扩展字段2';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.ext3
  is '扩展字段3';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.ext4
  is '扩展字段4';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.status_id_last
  is '上一状态编号';
comment on column CPIC_SXDX.TB_TASK_HISTORY_REMOVE.type_id_last
  is '上一类型编号';
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
  is '任务表到期屏蔽回收备份表';
comment on column CPIC_SXDX.TB_TASK_REMOVE.task_id
  is '任务ID';
comment on column CPIC_SXDX.TB_TASK_REMOVE.task_level
  is '优化级';
comment on column CPIC_SXDX.TB_TASK_REMOVE.create_time
  is '任务创建时间';
comment on column CPIC_SXDX.TB_TASK_REMOVE.change_time
  is '最后改变时间';
comment on column CPIC_SXDX.TB_TASK_REMOVE.is_important
  is '是否重点提醒（删除）';
comment on column CPIC_SXDX.TB_TASK_REMOVE.appoint_time
  is '预约时间';
comment on column CPIC_SXDX.TB_TASK_REMOVE.active_status
  is '激活状态';
comment on column CPIC_SXDX.TB_TASK_REMOVE.task_memo
  is '任务说明';
comment on column CPIC_SXDX.TB_TASK_REMOVE.callresult_type
  is '拨打小节模板(跟踪销售=1 问题件=2 订单审核=3 内呼咨询=4)';
comment on column CPIC_SXDX.TB_TASK_REMOVE.first_result
  is '拨打小节一级结果';
comment on column CPIC_SXDX.TB_TASK_REMOVE.second_result
  is '拨打小节二级结果';
comment on column CPIC_SXDX.TB_TASK_REMOVE.user_id
  is '所属座席';
comment on column CPIC_SXDX.TB_TASK_REMOVE.org_id
  is '所属机构';
comment on column CPIC_SXDX.TB_TASK_REMOVE.status_id
  is '状态编号';
comment on column CPIC_SXDX.TB_TASK_REMOVE.type_id
  is '类型编号';
comment on column CPIC_SXDX.TB_TASK_REMOVE.policy_id
  is '投保单ID';
comment on column CPIC_SXDX.TB_TASK_REMOVE.batch_id
  is '批次ID';
comment on column CPIC_SXDX.TB_TASK_REMOVE.cus_list_id
  is '名单ID';
comment on column CPIC_SXDX.TB_TASK_REMOVE.ob_com_id
  is '活动ID';
comment on column CPIC_SXDX.TB_TASK_REMOVE.policy_id_cancle
  is '撤单投保单Id';
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
  is '状态ID（可配置成与优先级一致）';
comment on column CPIC_SXDX.TB_TASK_STATUS.task_level
  is '任务优先级';
comment on column CPIC_SXDX.TB_TASK_STATUS.result_template
  is '拨打小节模板';
comment on column CPIC_SXDX.TB_TASK_STATUS.task_type
  is '任务类型';
comment on column CPIC_SXDX.TB_TASK_STATUS.status_name
  is '状态名称';
comment on column CPIC_SXDX.TB_TASK_STATUS.descript
  is '描述';
comment on column CPIC_SXDX.TB_TASK_STATUS.status
  is '状态（0：有效；其它：失效）';
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
  is '类型编号';
comment on column CPIC_SXDX.TB_TASK_TYPE.type_name
  is '类型名称';
comment on column CPIC_SXDX.TB_TASK_TYPE.descript
  is '描述';
comment on column CPIC_SXDX.TB_TASK_TYPE.status
  is '状态（0：有效，其它：失效）';
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
  is '客户临时表';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.cus_id
  is '客户ID';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.cus_name
  is '客户名称';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.batch_code
  is '批次编号';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.batch_name
  is '批次名称';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.center_id
  is '电销中心ID';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.task_id
  is '任务ID';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.status
  is '名单生成标志  1表示已生成，0表示未生成';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.issue
  is '下发标识';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.certificate_type
  is '证件类型';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.id_num
  is '证件号码';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.sex
  is '性别';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.birthday
  is '出生日期';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.age
  is '年龄';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.occupation
  is '职业';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.phone_no1
  is '移动电话1';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.phone_no2
  is '移动电话2';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.phone_no3
  is '移动电话3';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.home_tel
  is '家庭电话';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.create_time
  is '创建时间';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.create_by
  is '创建人';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.update_by
  is '修改人';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.office_tel
  is '单位电话';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.commonly_tel
  is '常用电话标志';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.address
  is '固定地址(联系地址)';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.postalcode
  is '邮编(联系地址)';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.car_models
  is '车型名称';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.car_price
  is '车价';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.c_purpose
  is '使用性质';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.house
  is '房屋购置时间';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.house_price
  is '房屋购置价';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.house_area
  is '房屋建筑面积';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.h_purpose
  is '房产用途';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.t_type
  is '房产类型';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.interest
  is '兴趣爱好';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.droit
  is '住宅所有权状况';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.other_asset
  is '其他公司金融资产';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.province
  is '省(联系地址)';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.city
  is '市(联系地址)';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.area
  is '区县(联系地址)';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.province2
  is '配送省';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.city2
  is '配送市';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.area2
  is '配送区县';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.address2
  is '配送地址详址';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.postalcode2
  is '配送地址邮编';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.is_sms
  is '是否短信禁止';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.is_children
  is '是否有孩子';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.is_property
  is '是否有房';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.transportation
  is '出行方式';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.vip
  is '是否寿险VIP';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.account
  is '账号';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.account_name
  is '账户姓名';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.bank
  is '银行';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.marital
  is '婚姻状况';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.education
  is '教育水平';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.income
  is '年收入';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.job_level
  is '职业等级';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.company
  is '工作单位';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.emergency_call
  is '紧急联络人电话';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.contact_person
  is '紧急联络人姓名';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.email
  is '电子邮件';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.addr_type
  is '地址类型';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.remark1
  is '备注1';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.remark2
  is '备注2';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.remark3
  is '备注3';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.remark4
  is '备注4';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.buyedproduct
  is '已购产品';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.user_id
  is '坐席';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.contect_tel
  is '联系电话';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.emer_con_relation
  is '紧急联络人与客户关系';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.org_id
  is '机构流水号';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.fax
  is '传真';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.introducer
  is '介绍人';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.intro_time
  is '转介绍时间';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.introducer_relation
  is '与介绍人关系';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.own_car
  is '是否有车';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.customer_single
  is '客户唯一标识';
comment on column CPIC_SXDX.TB_TEMP_CUS_BAS.row_num
  is '数据在excel里面的行数';
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
  is '数据在excel里面的行数';
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
  is '分配组';
comment on column CPIC_SXDX.TB_TMP_TISHU.app_no
  is '保单号';
comment on column CPIC_SXDX.TB_TMP_TISHU.risk_name
  is '险种名称';
comment on column CPIC_SXDX.TB_TMP_TISHU.sell_org
  is '销售机构';
comment on column CPIC_SXDX.TB_TMP_TISHU.acus_name
  is '投保人姓名';
comment on column CPIC_SXDX.TB_TMP_TISHU.begin_date
  is '责任起期';
comment on column CPIC_SXDX.TB_TMP_TISHU.fee
  is '单期缴费';
comment on column CPIC_SXDX.TB_TMP_TISHU.next_date
  is '更新下次缴费日';
comment on column CPIC_SXDX.TB_TMP_TISHU.user_id
  is '拨打坐席工号';
comment on column CPIC_SXDX.TB_TMP_TISHU.user_name
  is '拨打坐席姓名';
comment on column CPIC_SXDX.TB_TMP_TISHU.leader_name
  is '所属主管';
comment on column CPIC_SXDX.TB_TMP_TISHU.pm_name
  is '所属项目经理';
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
  is '职场管理相关的工位表';
comment on column CPIC_SXDX.TB_WORKAROUND_SEAT.seat_id
  is '工位表中的主键工位编号';
comment on column CPIC_SXDX.TB_WORKAROUND_SEAT.workplace_id
  is '职场管理表中的职场编号';
comment on column CPIC_SXDX.TB_WORKAROUND_SEAT.seat_ip
  is '工位表中的工位IP';
comment on column CPIC_SXDX.TB_WORKAROUND_SEAT.seat_tel_num
  is '工位表中的工位分机号';
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
  is '用户id';
comment on column CPIC_SXDX.TEMPUSER.name
  is '用户姓名';
comment on column CPIC_SXDX.TEMPUSER.org_id
  is '组织机构id';
comment on column CPIC_SXDX.TEMPUSER.role_id
  is '角色id';
comment on column CPIC_SXDX.TEMPUSER.angent_id
  is '坐席id';
comment on column CPIC_SXDX.TEMPUSER.workplace_id
  is '职场id';
comment on column CPIC_SXDX.TEMPUSER.workplace_name
  is '职场名称';
comment on column CPIC_SXDX.TEMPUSER.workplace_level
  is '职级';
comment on column CPIC_SXDX.TEMPUSER.team_leader
  is '团队名称';
comment on column CPIC_SXDX.TEMPUSER.team_name
  is '团队长姓名';
comment on column CPIC_SXDX.TEMPUSER.project_leader
  is '项目经理';

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
  is '用户id';
comment on column CPIC_SXDX.TEMPUSERAID.agent_id
  is '坐席id';

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
  is '用户id';
comment on column CPIC_SXDX.TEMP_ZUZHI.name
  is '用户姓名';
comment on column CPIC_SXDX.TEMP_ZUZHI.org_id
  is '机构id';
comment on column CPIC_SXDX.TEMP_ZUZHI.team_id
  is '团队机构iid';
comment on column CPIC_SXDX.TEMP_ZUZHI.team_name
  is '团队名称';
comment on column CPIC_SXDX.TEMP_ZUZHI.team_learder_name
  is '团队长姓名';

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
       null as tenementid,--所空,所有租户共享
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
         　　connect by parentid = prior categoryid
         　　start with categoryid = a.customformid)
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
--用户授权
select u.tenementid,u.userid,u.categoryid,u.active_categoryid,u.readwrite,1 as isauthority
from c_user_function u,c_category c,c_tenement t
where c.categoryid = u.categoryid and c.isauthority = 1
  and c.isdel=0 and u.tenementid = t.tenementid and t.isdel=0
union
--角色授权
select t.TENEMENTID,us.userid,f.categoryid,f.active_categoryid ,f.readwrite,1 as isauthority  from
       c_user_role u,c_role_function f,c_role c,c_category g,c_tenement t,c_user us where u.roleid=f.roleid
       and u.roleid = c.roleid and c.isdel=0  and g.categoryid = f.categoryid and g.isauthority = 1 and g.isdel=0
       and t.tenementid = c.TENEMENTID and t.isdel = 0 AND us.userid=u.userid
union
--无授权菜单
select tt.tenementid
 as tenementid,null as userid,c.categoryid,null as active_categoryid,1,isauthority
from c_category c
left join c_category_tenement tt
 on tt.categoryid = c.categoryid and c.isauthority = 0 and c.isdel=0 and c.categorytypeid in (select y.categorytypeid  from c_category_type y where y.property=1)
 where  c.isauthority = 0 and c.isdel=0--鼠标右键菜单，特殊处理
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
       decode(g.isteamleader,1,'是','否') as isteamleaderdesc
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
  idsize number(20) := 0;--循环次数
  minId number(20) := 0;
  maxId number(20) := 0;
  flag number(20) := 0;--紧急叫停开关
  totalNum number(20) := 0;--本次符合回收条件的名单数
begin
  dbms_output.put_line('begin');
  --清空临时表
  delete from tb_customer_list_rmv;
  --commit;
  --将符合条件的插入临时表
  insert into /*+ append */
  tb_customer_list_rmv r(r.cus_list_id,r.task_id)
    select t.cus_list_id, t.task_id
      from tb_customer_list t, tb_sale_batch t1
     where t.batch_id = t1.batch_id
       and t1.remove_date < to_date(removeDate, 'yyyyMMdd')
       order by t.cus_list_id;
  --commit;
  --计算需循环的总数
  select count(1) into totalNum from tb_customer_list_rmv; 
  --计算需循环的次数
  select ceil(totalNum / excuteNum) into idsize from dual; 
  
  for j in 0 .. idsize-1 loop
       dbms_output.put_line(j+1);
       select nvl(min(cus_list_id),0),nvl(max(cus_list_id),0) into minId,maxId
         from (select r.cus_list_id, r.task_id, rownum rn1 from tb_customer_list_rmv r order by r.cus_list_id) where rn1 <=excuteNum;
       --将回收数据备份到名单备份表
       insert into /*+ append */ tb_customer_list_remove t2(t2.cus_list_id,t2.cus_unique_ide,t2.cus_name,t2.cus_sex,t2.task_id,t2.org_center,t2.org_proj,t2.org_team,t2.user_id,t2.call_status,t2.status,t2.cus_birthday,t2.cus_age,t2.ide_type,t2.ide_number,t2.cus_metier,t2.mobile,t2.mobile2,t2.contect_tel,t2.home_tel,t2.off_tel,t2.contect_tel_type,t2.detailed_address,t2.postcode,t2.add_type,t2.emergency_con_person,t2.emergency_con_tel,t2.emer_con_relation,t2.contact_detailed_add,t2.contact_postcode,t2.cus_company,t2.metier_level,t2.marital_status,t2.bank_name,t2.bank_account_holder,t2.bank_account,t2.is_vip,t2.batch_id,t2.org_id,t2.creat_user,t2.creat_time,t2.modify_person,t2.modify_time,t2.is_blacklist,t2.fax,t2.res,t2.marital_id,t2.assign_date,t2.is_introduction,t2.introduction_id,t2.remove_type,t2.remove_time)
         select t.cus_list_id,t.cus_unique_ide,t.cus_name,t.cus_sex,t.task_id,t.org_center,t.org_proj,t.org_team,t.user_id,t.call_status,t.status,t.cus_birthday,t.cus_age,t.ide_type,t.ide_number,t.cus_metier,t.mobile,t.mobile2,t.contect_tel,t.home_tel,t.off_tel,t.contect_tel_type,t.detailed_address,t.postcode,t.add_type,t.emergency_con_person,t.emergency_con_tel,t.emer_con_relation,t.contact_detailed_add,t.contact_postcode,t.cus_company,t.metier_level,t.marital_status,t.bank_name,t.bank_account_holder,t.bank_account,t.is_vip,t.batch_id,t.org_id,t.creat_user,t.creat_time,t.modify_person,t.modify_time,t.is_blacklist,t.fax,t.res,t.marital_id,t.assign_date,t.is_introduction,t.introduction_id,'1',sysdate
           from tb_customer_list t, tb_customer_list_rmv t1
          where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId);
       --将回收数据备份到名单明细备份表  
       insert into /*+ append */ tb_cus_list_dtl_remove t2(t2.cus_list_id,t2.add_province,t2.add_city,t2.add_area,t2.cus_email,t2.contact_add_province,t2.contact_add_city,t2.contact_add_area,t2.introducer,t2.intro_time,t2.introducer_relation,t2.income,t2.education,t2.travel_mode,t2.own_house,t2.own_child,t2.buy_product,t2.car_type,t2.buy_house_time,t2.house_price,t2.house_area,t2.house_purpose,t2.house_type,t2.interest_type,t2.house_ownership_status,t2.cus_company_assets,t2.res1,t2.res2,t2.res3,t2.res4,t2.own_car)
         select t1.cus_list_id,t1.add_province,t1.add_city,t1.add_area,t1.cus_email,t1.contact_add_province,t1.contact_add_city,t1.contact_add_area,t1.introducer,t1.intro_time,t1.introducer_relation,t1.income,t1.education,t1.travel_mode,t1.own_house,t1.own_child,t1.buy_product,t1.car_type,t1.buy_house_time,t1.house_price,t1.house_area,t1.house_purpose,t1.house_type,t1.interest_type,t1.house_ownership_status,t1.cus_company_assets,t1.res1,t1.res2,t1.res3,t1.res4,t1.own_car
           from tb_cus_list_dtl t1, tb_customer_list_rmv t
          where t1.cus_list_id = t.cus_list_id and (t.cus_list_id between minId and maxId);
       --将回收数据备份到任务备份表  
       insert into /*+ append */ tb_task_remove t2(t2.task_id,t2.task_level,t2.create_time,t2.change_time,t2.is_important,t2.appoint_time,t2.active_status,t2.task_memo,t2.callresult_type,t2.first_result,t2.second_result,t2.user_id,t2.org_id,t2.status_id,t2.type_id,t2.policy_id,t2.batch_id,t2.cus_list_id,t2.ext1,t2.ext2,t2.ext3,t2.ext4,t2.ob_com_id,t2.policy_id_cancle)
         select t1.task_id,t1.task_level,t1.create_time,t1.change_time,t1.is_important,t1.appoint_time,t1.active_status,t1.task_memo,t1.callresult_type,t1.first_result,t1.second_result,t1.user_id,t1.org_id,t1.status_id,t1.type_id,t1.policy_id,t1.batch_id,t1.cus_list_id,t1.ext1,t1.ext2,t1.ext3,t1.ext4,t1.ob_com_id,t1.policy_id_cancle
           from tb_task t1, tb_customer_list_rmv t
          where t1.cus_list_id = t.cus_list_id and (t.cus_list_id between minId and maxId);
       --备份任务历史表
       insert into /*+ append */ tb_task_history_remove (HISTORY_ID, TASK_ID, TASK_LEVEL, CREATE_TIME, CHANGE_TIME, IS_IMPORTANT, APPOINT_TIME, ACTIVE_STATUS, TASK_MEMO, CALLRESULT_TYPE, FIRST_RESULT, SECOND_RESULT, USER_ID, ORG_ID, STATUS_ID, TYPE_ID, POLICY_ID, OB_COM_ID, BATCH_ID, CUS_LIST_ID, CREATE_HISTORY_DATE, EXT1, EXT2, EXT3, EXT4, STATUS_ID_LAST, TYPE_ID_LAST)
         select T1.HISTORY_ID, T1.TASK_ID, T1.TASK_LEVEL, T1.CREATE_TIME, T1.CHANGE_TIME, T1.IS_IMPORTANT, T1.APPOINT_TIME, T1.ACTIVE_STATUS, T1.TASK_MEMO, T1.CALLRESULT_TYPE, T1.FIRST_RESULT, T1.SECOND_RESULT, T1.USER_ID, T1.ORG_ID, T1.STATUS_ID, T1.TYPE_ID, T1.POLICY_ID, T1.OB_COM_ID, T1.BATCH_ID, T1.CUS_LIST_ID, T1.CREATE_HISTORY_DATE, T1.EXT1, T1.EXT2, T1.EXT3, T1.EXT4, T1.STATUS_ID_LAST, T1.TYPE_ID_LAST
          from tb_task_history t1, tb_customer_list_rmv t
          where t1.task_id = t.task_id
            and t1.cus_list_id = t.cus_list_id and (t.cus_list_id between minId and maxId);
       --备份名单修改日志表
       insert into TB_CUS_LIST_MODIFY_LOG_REMOVE (CUS_MODIFY_LOG_ID, CUS_LIST_ID, CUS_UNIQUE_IDE, CUS_NAME, CUS_SEX, ORG_CENTER, ORG_PROJ, ORG_TEAM, USER_ID, STATUS, CUS_BIRTHDAY, CUS_AGE, IDE_TYPE, IDE_NUMBER, CUS_METIER, MOBILE, MOBILE1, MOBILE2, CONTECT_TEL, HOME_TEL, OFF_TEL, CONTECT_TEL_TYPE, DETAILED_ADDRESS, POSTCODE, ADD_TYPE, EMERGENCY_CON_PERSON, EMERGENCY_CON_TEL, EMER_CON_RELATION, CONTACT_DETAILED_ADD, CONTACT_POSTCODE, CUS_COMPANY, METIER_LEVEL, MARITAL_STATUS, BANK_NAME, BANK_ACCOUNT_HOLDER, BANK_ACCOUNT, IS_VIP, BATCH_ID, ORG_ID, CREAT_PERSON, CREAT_TIME, MODIFY_PERSON, MODIFY_TIME, IS_BLACKLIST, FAX, RES)
         select T1.CUS_MODIFY_LOG_ID, T1.CUS_LIST_ID, T1.CUS_UNIQUE_IDE, T1.CUS_NAME, T1.CUS_SEX, T1.ORG_CENTER, T1.ORG_PROJ, T1.ORG_TEAM, T1.USER_ID, T1.STATUS, T1.CUS_BIRTHDAY, T1.CUS_AGE, T1.IDE_TYPE, T1.IDE_NUMBER, T1.CUS_METIER, T1.MOBILE, T1.MOBILE1, T1.MOBILE2, T1.CONTECT_TEL, T1.HOME_TEL, T1.OFF_TEL, T1.CONTECT_TEL_TYPE, T1.DETAILED_ADDRESS, T1.POSTCODE, T1.ADD_TYPE, T1.EMERGENCY_CON_PERSON, T1.EMERGENCY_CON_TEL, T1.EMER_CON_RELATION, T1.CONTACT_DETAILED_ADD, T1.CONTACT_POSTCODE, T1.CUS_COMPANY, T1.METIER_LEVEL, T1.MARITAL_STATUS, T1.BANK_NAME, T1.BANK_ACCOUNT_HOLDER, T1.BANK_ACCOUNT, T1.IS_VIP, T1.BATCH_ID, T1.ORG_ID, T1.CREAT_PERSON, T1.CREAT_TIME, T1.MODIFY_PERSON, T1.MODIFY_TIME, T1.IS_BLACKLIST, T1.FAX, T1.RES
           from TB_CUS_LIST_MODIFY_LOG t1, tb_customer_list_rmv t
          where t1.cus_list_id = t.cus_list_id
            and (t.cus_list_id between minId and maxId);
       --备份名单明细修改日志表
       insert into TB_CUS_DTL_MODIFY_LOG_REMOVE (CUS_MODIFY_LOG_ID, CUS_LIST_ID, ADD_PROVINCE, ADD_CITY, ADD_AREA, CUS_EMAIL, CONTACT_ADD_PROVINCE, CONTACT_ADD_CITY, CONTACT_ADD_AREA, INTRODUCER, INTRO_TIME, INTRODUCER_RELATION, INCOME, EDUCATION, TRAVEL_MODE, OWN_HOUSE, OWN_CHILD, BUY_PRODUCT, CAR_TYPE, CAR_PRICE, CAR_PURPOSE, BUY_HOUSE_TIME, HOUSE_PRICE, HOUSE_AREA, HOUSE_PURPOSE, HOUSE_TYPE, INTEREST_TYPE, HOUSE_OWNERSHIP_STATUS, CUS_COMPANY_ASSETS, RES1, RES2, RES3, RES4, OWN_CAR)
         select T1.CUS_MODIFY_LOG_ID, T1.CUS_LIST_ID, T1.ADD_PROVINCE, T1.ADD_CITY, T1.ADD_AREA, T1.CUS_EMAIL, T1.CONTACT_ADD_PROVINCE, T1.CONTACT_ADD_CITY, T1.CONTACT_ADD_AREA, T1.INTRODUCER, T1.INTRO_TIME, T1.INTRODUCER_RELATION, T1.INCOME, T1.EDUCATION, T1.TRAVEL_MODE, T1.OWN_HOUSE, T1.OWN_CHILD, T1.BUY_PRODUCT, T1.CAR_TYPE, T1.CAR_PRICE, T1.CAR_PURPOSE, T1.BUY_HOUSE_TIME, T1.HOUSE_PRICE, T1.HOUSE_AREA, T1.HOUSE_PURPOSE, T1.HOUSE_TYPE, T1.INTEREST_TYPE, T1.HOUSE_OWNERSHIP_STATUS, T1.CUS_COMPANY_ASSETS, T1.RES1, T1.RES2, T1.RES3, T1.RES4, T1.OWN_CAR
           from TB_CUS_LIST_DTL_MODIFY_LOG t1, tb_customer_list_rmv t
          where t1.cus_list_id = t.cus_list_id
            and (t.cus_list_id between minId and maxId);

       --删除名单明细表备份好的数据
       delete from (select t.* from tb_cus_list_dtl t, tb_customer_list_rmv t1 where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId));
       --删除名单表备份好的数据
       delete from (select t.* from tb_customer_list t, tb_customer_list_rmv t1 where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId));
       --删除任务历史表
       delete from (select t.* from tb_task_history t, tb_customer_list_rmv t1 where t.task_id = t1.task_id and t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId)); 
       --删除任务表
       delete from (select t.* from tb_task t, tb_customer_list_rmv t1 where t.task_id = t1.task_id and t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId)); 
       --删除名单明细修改日志表
       delete from (select t.* from TB_CUS_LIST_DTL_MODIFY_LOG t, tb_customer_list_rmv t1 where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId));
       --删除名单修改日志表
       delete from (select t.* from TB_CUS_LIST_MODIFY_LOG t, tb_customer_list_rmv t1 where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId));  
       --删除临时表的数据
       delete from tb_customer_list_rmv t1 where (t1.cus_list_id between minId and maxId);
       
       --记录中间日志到c_log
       if(excuteNum*(j+1)>totalNum) then
         insert into c_log
           select max(t.logid+1), '名单归档日志', '', '共'||totalNum||'条名单，已回收'||totalNum||'条', 0, sysdate, '', '', '', ''
           from c_log t;
       else
         insert into c_log
           select max(t.logid+1), '名单归档日志', '', '共'||totalNum||'条名单，已回收'||excuteNum*(j+1)||'条', 0, sysdate, '', '', '', ''
           from c_log t;
       end if;
       --commit;
       --每提交一次查询下开关是不是紧急叫停，初始值为14，若此标志位变为15，则紧急停止
       select nvl(tk.tenementid, 0) into flag from c_server_tenement tk where tk.serverid = 226;
     exit when flag=15;
   end loop;
exception
  when others then
    dbms_output.put_line('存储过程执行失败:' || Sqlerrm || '(errorcode=' || sqlcode || ')');
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
       dbms_output.put_line('批次id：'||v_batch_id||'批次名称：'||v_batch_name||';成功数：'||v_temp_total||';失败数:'||v_temp_failure_total);
  end loop;
  
  for i  in 1 .. 10 loop 
       dbms_output.put_line(i);
  end loop;
  close batch_result;
  dbms_output.put_line('上传批次总量：'||v_sale_batch_total);
end;
/

prompt
prompt Creating procedure CUS_LIST_BELONG_QUERY_TEAM
prompt =============================================
prompt
create or replace procedure cpic_sxdx.cus_list_belong_query_team as
  user_id varchar2(25);-- 1.查询该团队下所有坐席；
  total_num number := 0;-- 2.查询每个坐席所拥有的总名单数（除去任务状态为失败的名单）；
  first_call_num number := 0;-- 3.查询每个坐席所拥有的待首拨名单数；
  follow_num number := 0;-- 4.查询每个坐席所拥有的跟踪名单数；
  ten_num number := 0;-- 5.查询每个坐席所拥有的十日内到期名单数；
  --游标1：团队登陆  roleID=12  显示坐席
                     --坐席工号（AgentId）
                     --坐席姓名
                     --上级机构ID
                     --机构ID
                     --机构名称
                     --批次ID
                     --批次名称 
                     --名单数
                     --待首拨名单数
                     --跟踪名单数
                     --十日内到期名单数
  cursor team_cur is
        select batch_id,batch_name,agentid,employeename,parent_org_id,org_id,org_name,sum(t),sum(a),sum(b),sum(c) from (      
              select s.batch_id,--批次ID
                     s.batch_name,--批次名称 
                     u.agentid,--坐席工号（AgentId）
                     u.employeename,--坐席姓名
                     o.parent_org_id,--上级机构ID
                     u.org_id,--机构ID
                     o.org_name,--机构名称
                     count(*) t,--名单数
                     case l.call_status when 0 then count(l.call_status) end a,--待首拨名单数
                     case t.status_id when 5 then count(t.status_id) end b,--跟踪名单数
                     case when s.remove_date <= sysdate+10 then count(s.remove_date) end c--十日内到期名单数
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
        
        
  --游标2：项目经理登陆  roleID=11 
                     --团队长姓名
                     --上级机构ID
                     --机构ID
                     --机构名称
                     --批次ID
                     --批次名称 
                     --名单数
                     --待分配名单数
                     --跟踪名单数
                     --十日内到期名单数  
  
  --游标2：中心登陆  roleID=9   
                     --项目经理姓名
                     --上级机构ID
                     --机构ID
                     --机构名称
                     --批次ID
                     --批次名称 
                     --名单数
                     --待分配名单数
                     --跟踪名单数
                     --十日内到期名单数   
begin
  dbms_output.put_line('名单归属查询-团队长登陆');
  
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
 
  v_ob_com_id     number(10) := 0; --活动编号
  v_agent_id      number(10) := 0; -- 坐席工号
  v_ob_com_name   varchar(50) :=''; --活动名称
  v_user_name     varchar(50) := ''; --用户名称
  v_batch_id      number(10) :=0;   --批次编号
  v_batch_name    varchar(50) := ''; --批次名称
  v_cust_list     number(10) := 0; --名单总数
  v_call_list     number(10) := 0; --拨打总数
  v_contact_list  number(10) := 0; --接触数
  v_contact_rate  varchar(10) := 0; --接触率
  v_deal_list     number(10) := 0; --成交数
  v_deal_rate     varchar(10) := 0; --成交率
  v_year_list     number(10) := 0; --年缴
  v_year_totail     number(10) := 0; --年缴额
  v_month_list     number(10) := 0; --月缴
  v_month_totail     number(10) := 0; --月缴额
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
             
             select ob_com_name into v_ob_com_name from  tb_ob_com   where ob_com_id=v_ob_com_id; --活动名称
             
             select employeename,agentid into v_user_name,v_agent_id from c_user where userid=v_agent_id; --坐席名称和坐席工号
             
             select batch_name into v_batch_name from tb_sale_batch  where batch_id=v_batch_id;--批次名称
             
             select count(*) into v_cust_list --名单总数
                    from   tb_customer_list a
                    where a.user_id = v_agent_id
                      and a.batch_id = v_batch_id
                      and to_char(a.ASSIGN_DATE, 'yyyy-mm-dd') = to_char(v_current_date, 'yyyy-mm-dd');
             
             select count(*) into v_call_list --拨打总数
                   from   tb_call_history c ,tb_customer_list a
                   where c.task_id=a.task_id
                     and c.agentid = a.user_id
                     and a.user_id= v_agent_id
                     and a.batch_id=v_batch_id
                     and to_char(a.ASSIGN_DATE, 'yyyy-mm-dd') = to_char(v_current_date, 'yyyy-mm-dd');
                        
             select count(*) into v_contact_list --接触数
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
                      
              select count(*) into v_deal_list --成交数
                     from tb_application p,tb_customer_list a
                     where p.task_id=a.task_id
                      and p.verify_status=1
                      and a.user_id= v_agent_id
                      and a.batch_id=v_batch_id
                      and to_char(a.assign_date, 'yyyy-mm-dd') = to_char(v_current_date, 'yyyy-mm-dd');
                      
              select count(*) into v_year_list --年缴
                     from tb_application p,tb_customer_list a,tb_app_prd_info x
                     where p.task_id=a.task_id 
                       and p.application_id=x.application_id 
                       and x.pay_typ='13'
                       and p.verify_status=1
                       and a.user_id= v_agent_id
                       and a.batch_id=v_batch_id
                       and to_char(a.assign_date, 'yyyy-mm-dd') = to_char(v_current_date, 'yyyy-mm-dd');
                              
              select sum(p.total_fee) into v_year_totail --年缴(金额)
                     from tb_application p,tb_customer_list a,tb_app_prd_info x
                     where p.task_id=a.task_id 
                       and p.application_id=x.application_id 
                       and x.pay_typ='13'
                       and p.verify_status=1
                       and a.user_id= v_agent_id
                       and a.batch_id=v_batch_id
                       and to_char(a.assign_date, 'yyyy-mm-dd') = to_char(v_current_date, 'yyyy-mm-dd');
                       
              select count(*) into v_month_list --月缴
                     from tb_application p,tb_customer_list a,tb_app_prd_info x
                     where p.task_id=a.task_id 
                       and p.application_id=x.application_id 
                       and x.pay_typ='10'
                       and p.verify_status=1
                       and a.user_id= v_agent_id
                       and a.batch_id=v_batch_id
                       and to_char(a.assign_date, 'yyyy-mm-dd') = to_char(v_current_date, 'yyyy-mm-dd');
                              
              select sum(p.total_fee) into v_month_totail --月缴(金额)
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
                  v_deal_rate := round((v_deal_list / v_contact_list), 2) * 100 || '%'; --成交率
                end if;
                if v_cust_list = 0 then
                  v_contact_rate := '0%';
                else
                  v_contact_rate := round((v_contact_list / v_cust_list), 2) * 100 || '%'; --接触率
                end if;
              else
                v_contact_rate  := '0%'; --接触率
                v_deal_rate     := '0%'; --成交率
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
                ( v_ob_com_id,--活动编号
                  v_agent_id,-- 坐席工号
                  v_ob_com_name,--活动名称
                  v_user_name,--用户名称
                  v_batch_id,--批次编号
                  v_batch_name, --批次名称
                  v_cust_list,--名单总数
                  v_call_list,--拨打总数
                  v_contact_list,--接触数
                  v_contact_rate, --接触率
                  v_deal_list,--成交数
                  v_deal_rate,--成交率
                  v_year_list,--年缴
                  v_year_totail, --年缴额
                  v_month_list, --月缴
                  v_month_totail, --月缴额
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
  ---成交业务量统计
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
    --判断传入的时间是否为空，空的话设置v_current_datetime为系统时间，否则为传入的时间
    --- 按用户，活动查询当天的成交情况
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
             and ob_com_id = v_ob_com_id; --目标列表ID

          select t.cus_gro_nam
            into v_cus_gro_name
            from C_CUS_GRO t
           where t.cus_gro_id = v_cus_gro_id; --目标列表名称

          select ob_com_nam
            into v_campaign_nam
            from tb_ob_com
           where ob_com_id = v_ob_com_id; --活动名称
        exception
          when others then
            -- 遇到异常做一些处理
            begin
              dbms_output.put_line('data error :' || v_use_id || '--' || v_ob_com_id);
             goto a;
            end;

        end;

        select count(1)
          into v_n_list --名单总数
          from (select a.c_ob_com_cus_id
                  from c_ob_com_cus a
                 where a.use_id = v_use_id
                   and a.ob_com_id = v_ob_com_id
                   and to_char(a.asg_dat, 'yyyy-mm-dd') =
                       to_char(v_current_date, 'yyyy-mm-dd'));

        select n_dial
          into v_n_dial --拨打总数
          from (select count(1) n_dial
                  from c_ob_com_cus a, c_ob_com_cus_dia_out b
                 where a.c_ob_com_cus_id = b.c_ob_com_cus_id
                   and a.use_id = v_use_id
                   and b.use_id = v_use_id -- 去除非座席拨打记录
                   and a.ob_com_id = v_ob_com_id
                   and to_char(b.dia_out_tim, 'yyyy-mm-dd') =
                       to_char(v_current_date, 'yyyy-mm-dd'));

        select count(1)
          into v_n_contact --接触数
          from (select b.contact
                  from c_ob_com_cus a, c_ob_com_cus_dia_out b
                 where a.c_ob_com_cus_id = b.c_ob_com_cus_id
                   and a.use_id = v_use_id
                   and b.use_id = v_use_id -- 去除非座席拨打记录
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
           and a.audit_status = '1'; --成交数

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
           and a.audit_status = '1'; --成交数（月缴）

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
           and a.audit_status = '1'; --成交数（年缴）

        select sum(price)
          into v_sum_deal
          from shcpic_proposal_form_result a, c_ob_com_cus b
         where a.c_ob_com_cus_id = b.c_ob_com_cus_id
           and use_id = v_use_id
           and ob_com_id = v_ob_com_id
           and substr(audittime, 0, 10) =
               to_char(v_current_date, 'yyyy-mm-dd')
           and a.audit_status = '1'; --成交总额

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
           and a.audit_status = '1'; --成交总额（月缴）

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
           and a.audit_status = '1'; --成交总额（年缴）

        if v_n_contact <> 0 then
          if v_n_deal = 0 then
            v_pc_deal_list := '0%';
          else
            v_pc_deal_list := round((v_n_deal / v_n_contact), 2) * 100 || '%'; --成交率
          end if;
          if v_n_list = 0 then
            v_pc_contact_list := '0%';
          else
            v_pc_contact_list := round((v_n_contact / v_n_list), 2) * 100 || '%'; --接触率
          end if;
        else
          v_pc_deal_list    := '0%'; --比例
          v_pc_contact_list := '0%'; --比例
        end if;

        -- 删除当天存档数据
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
      --- 更新当天发生变更的承保记录，只要发生过承保的都计入当天的承保数
      -- 从存档日期为当天的承保列表中获取数据
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
        v_remark := '返回值多行';
        dbms_output.put_line('返回值多行');
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
  --投保单基本信息表ID
  select to_number(max(t.application_id))
    into v_app_id
    from tb_application t;
  --投保单产品信息表ID
  select max(t.app_prd_id) into v_app_prd_id from tb_app_prd_info t;
  --配送信息表ID
  select max(t.deli_id) into v_deli_id from tb_delivery_info t;
  --投保客户基本信息表ID
  select max(t.app_customer_id)
    into v_cus_id
    from tb_application_customer t;
  --投保客户联系方式表ID
  select max(t.cus_con_id)
    into v_cus_con_id
    from tb_app_customer_contact t;
  --投保客户地址信息表ID
  select max(t.adds_id) into v_adds_id from tb_app_customer_adds t;

  --投保单基本信息表
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

  --投保单详细信息表
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

  ----投保单产品信息表
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

  --配送信息表  
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

  --投保客户基本信息表
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

  --投保客户与投保单关系表
  insert /*+ append nologging parallel */
  into tb_customer_app_rel
    select to_number(application_id) + v_app_id, app_customer_id + v_cus_id
      from tb_customer_app_rel;
  commit;

  --投保客户联系方式表
  insert /*+ append nologging parallel */
  into tb_app_customer_contact
    select cus_con_id + v_cus_con_id,
           app_customer_id + v_cus_id,
           cus_con_typ_id,
           con_value,
           con_note
      from tb_app_customer_contact;
  commit;

  --投保客户地址信息表
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

  --修改C_ID_BRO
  --投保单基本信息表ID
  select to_number(max(t.application_id))
    into v_app_id
    from tb_application t;
  --投保单产品信息表ID
  select max(t.app_prd_id) into v_app_prd_id from tb_app_prd_info t;
  --配送信息表ID
  select max(t.deli_id) into v_deli_id from tb_delivery_info t;
  --投保客户基本信息表ID
  select max(t.app_customer_id)
    into v_cus_id
    from tb_application_customer t;
  --投保客户联系方式表ID
  select max(t.cus_con_id)
    into v_cus_con_id
    from tb_app_customer_contact t;
  --投保客户地址信息表ID
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
  v_amount        NUMBER(20, 4); --单期保费..
  v_owed          NUMBER; --欠缴期次
  v_owed_amount   NUMBER(20, 4); --累计欠缴保费
  v_sprerec_years NUMBER(20); --应缴期数
  v_pay_sum       NUMBER(20); --已缴期次
  v_years         NUMBER(20); --缴费次数
  v_nextdate      date; --下次缴费日..
  v_begdate       date; --责任起始日期
  v_paysch        char(2); --缴费方式

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
      --下次缴费日
      select (select m.nextdate
                from xq_moneysch m
               where m.policyno = v_policyno.policyno
                 and rownum = 1)
        into v_nextdate
        from dual;

      if v_nextdate is null then
        --dbms_output.put_line('下次缴费日为空或不存在');
        goto a;
      end if;

      --缴费方式（年缴、季缴、月缴）
      select (select m.paysch
                from xq_moneysch m
               where m.policyno = v_policyno.policyno
                 and rownum = 1)
        into v_paysch
        from dual;

      --单期保费、责任起始日期
      select (select sum(r.npaylen) * max(r.pieces)
                from xq_riskcon r
               where r.policyno = v_policyno.policyno)
        into v_amount
        from dual;

      if v_amount is null then
        --dbms_output.put_line('单期保费、责任起始日期为空或不存在');
        goto a;
      end if;

      --单期保费、责任起始日期
      select (select max(r.begdate)
                from xq_riskcon r
               where r.policyno = v_policyno.policyno)
        into v_begdate
        from dual;

      if v_begdate is null then
        --dbms_output.put_line('单期保费、责任起始日期为空或不存在');
        goto a;
      end if;

      --应缴期数,缴费期次
      select (select max(r.years)
                from xq_reminder r
               where r.policyno = v_policyno.policyno
                 and to_char(r.cover1, 'yyyy-mm') <=
                     to_char(sysdate, 'yyyy-mm'))
        into v_years
        from dual;

      if v_years is null then
        --dbms_output.put_line('应缴期数,缴费期次为空或不存在');
        goto a;
      end if;

      v_sprerec_years := v_years;

      select decode(v_paysch, '11', 3, '12', 6, '13', 12, 1)
        into v_py
        from dual;

      --已缴期数=（下次缴费日年月-责任起始日期年月）/缴费方式
      v_pay_sum := floor(months_between(to_date(to_char(v_nextdate, 'yyyy-mm'),
                                          'yyyy-mm'),
                                  to_date(to_char(v_begdate, 'yyyy-mm'),
                                          'yyyy-mm')) / v_py);
      --缴费期次和应缴期数、欠缴期数=应缴期数-已缴期数
      v_owed := v_sprerec_years - v_pay_sum;
      if v_owed < 0 then
        v_owed := 0;
      end if;
      --累计欠缴保费=单期保费*欠缴期数
      v_owed_amount := v_amount * v_owed;

      update t_billing_info f
         set f.amount        = v_amount, --单期保费
             f.owed          = v_owed, --欠缴期数
             f.owed_amount   = v_owed_amount, --累计欠缴保费
             f.sprerec_years = v_sprerec_years, --应缴期数
             f.pay_sum       = v_pay_sum, --已缴期数
             f.years         = v_years, --缴费期次
             f.nextdate      = v_nextdate --下次缴费日
       where f.policyno = v_policyno.policyno;
      commit;
      --dbms_output.put_line('正常：' || v_nextdate || ','
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
       --将回收数据备份到名单备份表
       insert into /*+ append */ tb_customer_list_remove t2(t2.cus_list_id,t2.cus_unique_ide,t2.cus_name,t2.cus_sex,t2.task_id,t2.org_center,t2.org_proj,t2.org_team,t2.user_id,t2.call_status,t2.status,t2.cus_birthday,t2.cus_age,t2.ide_type,t2.ide_number,t2.cus_metier,t2.mobile,t2.mobile2,t2.contect_tel,t2.home_tel,t2.off_tel,t2.contect_tel_type,t2.detailed_address,t2.postcode,t2.add_type,t2.emergency_con_person,t2.emergency_con_tel,t2.emer_con_relation,t2.contact_detailed_add,t2.contact_postcode,t2.cus_company,t2.metier_level,t2.marital_status,t2.bank_name,t2.bank_account_holder,t2.bank_account,t2.is_vip,t2.batch_id,t2.org_id,t2.creat_user,t2.creat_time,t2.modify_person,t2.modify_time,t2.is_blacklist,t2.fax,t2.res,t2.marital_id,t2.assign_date,t2.is_introduction,t2.introduction_id,t2.remove_type,t2.remove_time)
         select t.cus_list_id,t.cus_unique_ide,t.cus_name,t.cus_sex,t.task_id,t.org_center,t.org_proj,t.org_team,t.user_id,t.call_status,t.status,t.cus_birthday,t.cus_age,t.ide_type,t.ide_number,t.cus_metier,t.mobile,t.mobile2,t.contect_tel,t.home_tel,t.off_tel,t.contect_tel_type,t.detailed_address,t.postcode,t.add_type,t.emergency_con_person,t.emergency_con_tel,t.emer_con_relation,t.contact_detailed_add,t.contact_postcode,t.cus_company,t.metier_level,t.marital_status,t.bank_name,t.bank_account_holder,t.bank_account,t.is_vip,t.batch_id,t.org_id,t.creat_user,t.creat_time,t.modify_person,t.modify_time,t.is_blacklist,t.fax,t.res,t.marital_id,t.assign_date,t.is_introduction,t.introduction_id,'0',sysdate
           from tb_customer_list t, tb_customer_list_rmv t1
          where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId);
       --将回收数据备份到名单明细备份表  
       insert into /*+ append */ tb_cus_list_dtl_remove t2(t2.cus_list_id,t2.add_province,t2.add_city,t2.add_area,t2.cus_email,t2.contact_add_province,t2.contact_add_city,t2.contact_add_area,t2.introducer,t2.intro_time,t2.introducer_relation,t2.income,t2.education,t2.travel_mode,t2.own_house,t2.own_child,t2.buy_product,t2.car_type,t2.buy_house_time,t2.house_price,t2.house_area,t2.house_purpose,t2.house_type,t2.interest_type,t2.house_ownership_status,t2.cus_company_assets,t2.res1,t2.res2,t2.res3,t2.res4,t2.own_car)
         select t1.cus_list_id,t1.add_province,t1.add_city,t1.add_area,t1.cus_email,t1.contact_add_province,t1.contact_add_city,t1.contact_add_area,t1.introducer,t1.intro_time,t1.introducer_relation,t1.income,t1.education,t1.travel_mode,t1.own_house,t1.own_child,t1.buy_product,t1.car_type,t1.buy_house_time,t1.house_price,t1.house_area,t1.house_purpose,t1.house_type,t1.interest_type,t1.house_ownership_status,t1.cus_company_assets,t1.res1,t1.res2,t1.res3,t1.res4,t1.own_car
           from tb_cus_list_dtl t1, tb_customer_list_rmv t
          where t1.cus_list_id = t.cus_list_id and (t.cus_list_id between minId and maxId);
       --将回收数据备份到任务备份表  
       insert into /*+ append */ tb_task_remove t2(t2.task_id,t2.task_level,t2.create_time,t2.change_time,t2.is_important,t2.appoint_time,t2.active_status,t2.task_memo,t2.callresult_type,t2.first_result,t2.second_result,t2.user_id,t2.org_id,t2.status_id,t2.type_id,t2.policy_id,t2.batch_id,t2.cus_list_id,t2.ext1,t2.ext2,t2.ext3,t2.ext4,t2.ob_com_id,t2.policy_id_cancle)
         select t1.task_id,t1.task_level,t1.create_time,t1.change_time,t1.is_important,t1.appoint_time,t1.active_status,t1.task_memo,t1.callresult_type,t1.first_result,t1.second_result,t1.user_id,t1.org_id,t1.status_id,t1.type_id,t1.policy_id,t1.batch_id,t1.cus_list_id,t1.ext1,t1.ext2,t1.ext3,t1.ext4,t1.ob_com_id,t1.policy_id_cancle
           from tb_task t1, tb_customer_list_rmv t
          where t1.cus_list_id = t.cus_list_id and (t.cus_list_id between minId and maxId);
       --备份任务历史表
       insert into /*+ append */ tb_task_history_remove (HISTORY_ID, TASK_ID, TASK_LEVEL, CREATE_TIME, CHANGE_TIME, IS_IMPORTANT, APPOINT_TIME, ACTIVE_STATUS, TASK_MEMO, CALLRESULT_TYPE, FIRST_RESULT, SECOND_RESULT, USER_ID, ORG_ID, STATUS_ID, TYPE_ID, POLICY_ID, OB_COM_ID, BATCH_ID, CUS_LIST_ID, CREATE_HISTORY_DATE, EXT1, EXT2, EXT3, EXT4, STATUS_ID_LAST, TYPE_ID_LAST)
         select T1.HISTORY_ID, T1.TASK_ID, T1.TASK_LEVEL, T1.CREATE_TIME, T1.CHANGE_TIME, T1.IS_IMPORTANT, T1.APPOINT_TIME, T1.ACTIVE_STATUS, T1.TASK_MEMO, T1.CALLRESULT_TYPE, T1.FIRST_RESULT, T1.SECOND_RESULT, T1.USER_ID, T1.ORG_ID, T1.STATUS_ID, T1.TYPE_ID, T1.POLICY_ID, T1.OB_COM_ID, T1.BATCH_ID, T1.CUS_LIST_ID, T1.CREATE_HISTORY_DATE, T1.EXT1, T1.EXT2, T1.EXT3, T1.EXT4, T1.STATUS_ID_LAST, T1.TYPE_ID_LAST
          from tb_task_history t1, tb_customer_list_rmv t
          where t1.task_id = t.task_id
            and t1.cus_list_id = t.cus_list_id and (t.cus_list_id between minId and maxId);
       --备份名单修改日志表
       insert into TB_CUS_LIST_MODIFY_LOG_REMOVE (CUS_MODIFY_LOG_ID, CUS_LIST_ID, CUS_UNIQUE_IDE, CUS_NAME, CUS_SEX, ORG_CENTER, ORG_PROJ, ORG_TEAM, USER_ID, STATUS, CUS_BIRTHDAY, CUS_AGE, IDE_TYPE, IDE_NUMBER, CUS_METIER, MOBILE, MOBILE1, MOBILE2, CONTECT_TEL, HOME_TEL, OFF_TEL, CONTECT_TEL_TYPE, DETAILED_ADDRESS, POSTCODE, ADD_TYPE, EMERGENCY_CON_PERSON, EMERGENCY_CON_TEL, EMER_CON_RELATION, CONTACT_DETAILED_ADD, CONTACT_POSTCODE, CUS_COMPANY, METIER_LEVEL, MARITAL_STATUS, BANK_NAME, BANK_ACCOUNT_HOLDER, BANK_ACCOUNT, IS_VIP, BATCH_ID, ORG_ID, CREAT_PERSON, CREAT_TIME, MODIFY_PERSON, MODIFY_TIME, IS_BLACKLIST, FAX, RES)
         select T1.CUS_MODIFY_LOG_ID, T1.CUS_LIST_ID, T1.CUS_UNIQUE_IDE, T1.CUS_NAME, T1.CUS_SEX, T1.ORG_CENTER, T1.ORG_PROJ, T1.ORG_TEAM, T1.USER_ID, T1.STATUS, T1.CUS_BIRTHDAY, T1.CUS_AGE, T1.IDE_TYPE, T1.IDE_NUMBER, T1.CUS_METIER, T1.MOBILE, T1.MOBILE1, T1.MOBILE2, T1.CONTECT_TEL, T1.HOME_TEL, T1.OFF_TEL, T1.CONTECT_TEL_TYPE, T1.DETAILED_ADDRESS, T1.POSTCODE, T1.ADD_TYPE, T1.EMERGENCY_CON_PERSON, T1.EMERGENCY_CON_TEL, T1.EMER_CON_RELATION, T1.CONTACT_DETAILED_ADD, T1.CONTACT_POSTCODE, T1.CUS_COMPANY, T1.METIER_LEVEL, T1.MARITAL_STATUS, T1.BANK_NAME, T1.BANK_ACCOUNT_HOLDER, T1.BANK_ACCOUNT, T1.IS_VIP, T1.BATCH_ID, T1.ORG_ID, T1.CREAT_PERSON, T1.CREAT_TIME, T1.MODIFY_PERSON, T1.MODIFY_TIME, T1.IS_BLACKLIST, T1.FAX, T1.RES
           from TB_CUS_LIST_MODIFY_LOG t1, tb_customer_list_rmv t
          where t1.cus_list_id = t.cus_list_id
            and (t.cus_list_id between minId and maxId);
       --备份名单明细修改日志表
       insert into TB_CUS_DTL_MODIFY_LOG_REMOVE (CUS_MODIFY_LOG_ID, CUS_LIST_ID, ADD_PROVINCE, ADD_CITY, ADD_AREA, CUS_EMAIL, CONTACT_ADD_PROVINCE, CONTACT_ADD_CITY, CONTACT_ADD_AREA, INTRODUCER, INTRO_TIME, INTRODUCER_RELATION, INCOME, EDUCATION, TRAVEL_MODE, OWN_HOUSE, OWN_CHILD, BUY_PRODUCT, CAR_TYPE, CAR_PRICE, CAR_PURPOSE, BUY_HOUSE_TIME, HOUSE_PRICE, HOUSE_AREA, HOUSE_PURPOSE, HOUSE_TYPE, INTEREST_TYPE, HOUSE_OWNERSHIP_STATUS, CUS_COMPANY_ASSETS, RES1, RES2, RES3, RES4, OWN_CAR)
         select T1.CUS_MODIFY_LOG_ID, T1.CUS_LIST_ID, T1.ADD_PROVINCE, T1.ADD_CITY, T1.ADD_AREA, T1.CUS_EMAIL, T1.CONTACT_ADD_PROVINCE, T1.CONTACT_ADD_CITY, T1.CONTACT_ADD_AREA, T1.INTRODUCER, T1.INTRO_TIME, T1.INTRODUCER_RELATION, T1.INCOME, T1.EDUCATION, T1.TRAVEL_MODE, T1.OWN_HOUSE, T1.OWN_CHILD, T1.BUY_PRODUCT, T1.CAR_TYPE, T1.CAR_PRICE, T1.CAR_PURPOSE, T1.BUY_HOUSE_TIME, T1.HOUSE_PRICE, T1.HOUSE_AREA, T1.HOUSE_PURPOSE, T1.HOUSE_TYPE, T1.INTEREST_TYPE, T1.HOUSE_OWNERSHIP_STATUS, T1.CUS_COMPANY_ASSETS, T1.RES1, T1.RES2, T1.RES3, T1.RES4, T1.OWN_CAR
           from TB_CUS_LIST_DTL_MODIFY_LOG t1, tb_customer_list_rmv t
          where t1.cus_list_id = t.cus_list_id
            and (t.cus_list_id between minId and maxId);

       --删除名单明细表备份好的数据
       delete from (select t.* from tb_cus_list_dtl t, tb_customer_list_rmv t1 where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId));
       --删除名单表备份好的数据
       delete from (select t.* from tb_customer_list t, tb_customer_list_rmv t1 where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId));
       --删除任务历史表
       delete from (select t.* from tb_task_history t, tb_customer_list_rmv t1 where t1.task_id = t.task_id and t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId)); 
       --删除任务表备份好的数据
       delete from (select t.* from tb_task t, tb_customer_list_rmv t1 where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId)); 
       --删除名单明细修改日志表
       delete from (select t.* from TB_CUS_LIST_DTL_MODIFY_LOG t, tb_customer_list_rmv t1 where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId));
       --删除名单修改日志表
       delete from (select t.* from TB_CUS_LIST_MODIFY_LOG t, tb_customer_list_rmv t1 where t.cus_list_id = t1.cus_list_id and (t1.cus_list_id between minId and maxId));  
       --删除临时表的数据
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
  * 清空名单归属信息表(tb_cus_belong_info)记录
  * agentid = flagColum 的记录为存储过程执行标记，更新为执行中
  */
  --delete from tb_cus_belong_info t where t.user_id <> 'flagColum';
  update tb_cus_belong_info t
     set t.agentid      = '0',
         t.employeename = to_char(sysdate, 'yyyy-MM-dd HH24:mi:ss')
   where t.user_id = 'flagColum'; --执行中
  commit;

  /**
  * 用户名单归属信息统计
  
  
  * 用户名单归属统计规则
  *    待首拨：名单关联任务表 任务状态 status_id = 6
  *    跟踪：名单关联任务表 任务状态 status_id = 5
  *    十日内到期：名单关联批次 批次移除日期<=sysdate + 10
  *    名单总数： 过滤失败任务的名单
  *    名单过滤规则：名单的user_id  = 用户的use_id
  *    关联用户 组织 批次等信息
  *    20121102Add首拨月10日内到期回收名单量
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
           u.AgentId, --坐席工号（AgentId）
           u.employeename, --坐席姓名
           o.parent_org_id, --上级机构ID
           u.org_id, --机构ID
           o.org_name, --机构名称
           s.batch_id, --批次ID
           s.batch_name, --批次名称 
           '' as wait_assign_num,
           case t.status_id
             when 6 then
              count(t.status_id)
           end wait_call_num, --待首拨名单数
           case t.status_id
             when 5 then
              count(t.status_id)
           end follow_num, --跟踪名单数
           case
             when s.remove_date <= sysdate + 10 then
              count(s.remove_date)
           end ten_num, --十日内到期名单数
           case
             when (add_months(to_date(s.call_year_month, 'yyyy-MM'), 1) - 23 <=
                  sysdate and (l.call_status = '0' or l.status = '0')) then
              count(s.call_year_month)
           end warn_num, --首拨月10日内到期回收名单量
           count(*) total_num, --名单数 
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
  * 组织名单归属信息统计
  
  * 组织名单归属统计规则
  *     待分配：名单关联任务表 任务状态 status_id = 8 
  *    待首拨：名单关联任务表 任务状态 status_id = 6  
  *    跟踪：名单关联任务表 任务状态 status_id = 5 ?  ?    
  *    十日内到期：名单关联批次 批次移除日期<=sysdate + 10  查下级组织？
  *    名单总数： 过滤失败任务的名单
  *    名单过滤规则：名单的org_id = 当前组织id
  *    关联 组织 批次等信息
       组织查询不跨级 07 -- 团队,06 -- 项目,05 -- 电销分中心
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
                   'org' AS AGENTID, --坐席工号（AgentId）
                   U.EMPLOYEENAME, --坐席姓名
                   O.PARENT_ORG_ID, --上级机构ID
                   U.ORG_ID, --机构ID
                   O.ORG_NAME, --机构名称
                   S.BATCH_ID, --批次ID
                   S.BATCH_NAME, --批次名称 
                   CASE T.STATUS_ID
                     WHEN 8 THEN
                      COUNT(T.STATUS_ID)
                   END WAIT_ASSIGN_NUM, --待分配名单数               
                   CASE T.STATUS_ID
                     WHEN 6 THEN
                      COUNT(T.STATUS_ID)
                   END WAIT_CALL_NUM, --待首拨名单数
                   CASE T.STATUS_ID
                     WHEN 5 THEN
                      COUNT(T.STATUS_ID)
                   END FOLLOW_NUM, --跟踪名单数
                   CASE
                     WHEN S.REMOVE_DATE <= SYSDATE + 10 THEN
                      COUNT(S.REMOVE_DATE)
                   END TEN_NUM, --十日内到期名单数
                   CASE
                     WHEN (add_months(to_date(s.call_year_month, 'yyyy-MM'),
                                      1) - 10 <= sysdate and
                          (l.call_status = '0' or l.status = '0')) THEN
                      COUNT(S.call_year_month)
                   END WARN_NUM, --首拨月10日内到期回收名单量
                   COUNT(*) TOTAL_NUM --名单数  
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
  * agentid = flagColum 的记录为存储过程执行标记，更新为执行完毕
  */
  update tb_cus_belong_info t
     set t.agentid = '1'
   where t.user_id = 'flagColum'; --执行中完毕         
  commit;

  /**
  * 删除有效数据
  */
  delete from tb_cus_belong_info t
   where t.status = 1
     and t.user_id <> 'flagColum';
  commit;

  /**
  * 更新本次插入数据为有效数据
  */
  update tb_cus_belong_info t set t.status = '1' where t.status = 0;
  commit;

exception
  when no_data_found then
    dbms_output.put_line('数据未找到');
  when others then
    -- 记录错误日志
    dbms_output.put_line('存储过程执行失败:' || Sqlerrm);
    update tb_cus_belong_info t
       set t.status = '1'
     where t.user_id = 'flagColum'; --执行中完毕
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
  --p1  默认为in类型     不可赋值
  dbms_output.put_line(p1);
  --p2  in类型   不可赋值
  dbms_output.put_line(p2);
  dbms_output.put_line(p3);
  
end U_test;
/


spool off
