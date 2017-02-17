-- Create table
create table T_DA_ROLE_USER
(
  C_ID           NUMBER not null,
  C_ROLE_ID      NUMBER not null,
  C_USER_ACCOUNT VARCHAR2(100) not null
)
tablespace SXDXSJ_DATA
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table T_DA_ROLE_USER
  is '角色和用户关系表';
-- Add comments to the columns 
comment on column T_DA_ROLE_USER.C_ROLE_ID
  is '角色id';
comment on column T_DA_ROLE_USER.C_USER_ACCOUNT
  is '用户名';
-- Create/Recreate primary, unique and foreign key constraints 
alter table T_DA_ROLE_USER
  add constraint PK_ROLEUSERID primary key (C_ID)
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
alter table T_DA_ROLE_USER
  add constraint FK1_T_DA_ROLE_USER foreign key (C_ROLE_ID)
  references T_DA_ROLE (C_ROLE_ID) on delete cascade;
alter table T_DA_ROLE_USER
  add constraint FK2_T_DA_ROLE_USER foreign key (C_USER_ACCOUNT)
  references USER_MANAGEMENT (USER_ACCOUNT) on delete cascade;
