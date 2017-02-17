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
COMMENT ON TABLE t_da_role IS '角色表';
COMMENT ON COLUMN t_da_role.c_role_id IS '角色id';
COMMENT ON COLUMN t_da_role.c_role_name IS '角色名称';
COMMENT ON COLUMN t_da_role.c_auth_name IS '角色权限名称 如（ROLE_ADMIN）';
COMMENT ON COLUMN t_da_role.c_rem IS '角色描述';
ALTER TABLE t_da_role
      ADD CONSTRAINTS pk_roleid PRIMARY KEY(c_role_id)
      USING INDEX
      TABLESPACE sxdxsj_data
      PCTFREE 10
      INITRANS 2
      MAXTRANS 255;
