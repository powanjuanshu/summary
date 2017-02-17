CREATE TABLE t_da_role(
       c_role_id NUMBER NOT NULL,
       c_role_name VARCHAR2(50),
       c_auth_name VARCHAR2(20),
       c_rem VARCHAR2(200)
)
TABLESPACE sxdxsj_data
       PCTFREE 10
       INITRANS 1
       MAXTRANS 255;
COMMENT ON TABLE t_da_role IS '��ɫ��';
COMMENT ON COLUMN t_da_role.c_role_id IS '��ɫid';
COMMENT ON COLUMN t_da_role.c_role_name IS '��ɫ����';
COMMENT ON COLUMN t_da_role.c_auth_name IS '��ɫȨ������ �磨ROLE_ADMIN��';
COMMENT ON COLUMN t_da_role.c_rem IS '��ɫ����';
ALTER TABLE t_da_role
      ADD CONSTRAINTS pk_roleid PRIMARY KEY(c_role_id)
      USING INDEX
      TABLESPACE sxdxsj_data
      PCTFREE 10
      INITRANS 2
      MAXTRANS 255;
