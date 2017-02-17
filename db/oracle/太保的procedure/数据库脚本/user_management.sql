CREATE TABLE user_management(
       user_account varchar2(100) NOT NULL,
       user_name VARCHAR2(120),
       PASSWORD VARCHAR2(50),
       cogtoken VARCHAR2(50),
       emai VARCHAR2(200),
       ROLE VARCHAR2(100),
       last_login_time DATE,
       hasonline CHAR(1),
       active CHAR(1)
)
TABLESPACE sxdxsj_data
PCTFREE 10
initrans 1
MAXTRANS 255
STORAGE(
        INITIAL 64
        NEXT 1
        MINEXTENTS 1
        MAXEXTENTS UNLIMITED
);
COMMENT ON TABLE user_management IS 'ÓÃ»§µÇÂ¼ÕÊºÅ';
ALTER TABLE user_management
ADD CONSTRAINT pk_user_management PRIMARY KEY (user_account) USING INDEX
TABLESPACE sxdxsj_data
PCTFREE 10
INITRANS 2
MAXTRANS 255
STORAGE(
        INITIAL 64k
        NEXT 1m
        MINEXTENTS 1
        MAXEXTENTS UNLIMITED
);