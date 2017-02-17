-- Create table
create table T_DA_MENU
(
  C_MENU_ID   NUMBER not null,
  C_PARENT_ID NUMBER not null,
  C_ID_PATH   VARCHAR2(200) not null,
  C_NAME      VARCHAR2(50) not null,
  C_NAME_PATH VARCHAR2(500) not null,
  C_ICON      VARCHAR2(50),
  C_URL       VARCHAR2(1000),
  C_ORDER_NUM NUMBER,
  C_REM       VARCHAR2(200),
  C_AUTH_NAME VARCHAR2(20)
)
tablespace SXDXSJ_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table T_DA_MENU
  is '�˵���';
-- Add comments to the columns 
comment on column T_DA_MENU.C_MENU_ID
  is '�˵�id';
comment on column T_DA_MENU.C_PARENT_ID
  is '���˵�id';
comment on column T_DA_MENU.C_ID_PATH
  is 'id��·��';
comment on column T_DA_MENU.C_NAME
  is '�˵�������';
comment on column T_DA_MENU.C_NAME_PATH
  is '�˵�����·��';
comment on column T_DA_MENU.C_ICON
  is '�˵�ͼ��';
comment on column T_DA_MENU.C_URL
  is '�˵�����';
comment on column T_DA_MENU.C_ORDER_NUM
  is '�˵��������';
comment on column T_DA_MENU.C_REM
  is '�˵�����';
comment on column T_DA_MENU.C_AUTH_NAME
  is 'Ȩ������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_DA_MENU
  add constraint PK_MENUID primary key (C_MENU_ID)
  using index 
  tablespace SXDXSJ_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
