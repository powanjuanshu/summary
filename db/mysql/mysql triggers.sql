CREATE TABLE `ts_triggers_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `error_code` int(11) DEFAULT NULL COMMENT '触发器错误码',
  `error_message` varchar(500) DEFAULT NULL COMMENT '触发器错误信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ts_user 表
-- 增
DROP TRIGGER IF EXISTS tri_afterinsert_ts_user;
CREATE TRIGGER tri_afterinsert_ts_user 
AFTER INSERT ON ts_user
FOR EACH ROW
BEGIN
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(1, concat_ws(',','tri_afterinsert_ts_user出现SQLEXCEPTION', new.uid), now());
DECLARE CONTINUE HANDLER FOR SQLWARNING INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(2, concat_ws(',','tri_afterinsert_ts_user出现SQLWARNING', new.uid), now());
DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(12, concat_ws(',','tri_afterinsert_ts_user出现重复异常', new.uid), now());
DECLARE CONTINUE HANDLER FOR 1062 INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(13, concat_ws(',','tri_afterinsert_ts_user出现重复异常', new.uid), now());
DECLARE CONTINUE HANDLER FOR 1048 INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(14, concat_ws(',','tri_afterinsert_ts_user出现非空异常', new.uid), now());
-- DECLARE CONTINUE HANDLER FOR NOT FOUND INSERT INTO TEST_LOG(id) VALUES(3);
insert into ts_demo_data (
	`uid`,`login`,`password`,`login_salt`,`uname`,`email`,`sex`,`location`,`school_id`,`school`,
	`is_audit`,`is_active`,`is_init`,`ctime`,`identity`,`api_key`,`domain`,`province`,`city`,`area`,
	`reg_ip`,`lang`,`timezone`,`is_del`,`first_letter`,`intro`,`last_login_time`,`last_feed_id`,`last_post_time`,`search_key`,
	`invite_code`,`cyuid`,`updatetime`,`grade`,`subject`,`top_level`,`space_name`,`roleEnName`
)
values (
	new.uid,new.login,new.password,new.login_salt,new.uname,new.email,new.sex,new.location,new.school_id,new.school,
	new.is_audit,new.is_active,new.is_init,new.ctime,new.identity,new.api_key,new.domain,new.province,new.city,new.area,
	new.reg_ip,new.lang,new.timezone,new.is_del,new.first_letter,new.intro,new.last_login_time,new.last_feed_id,new.last_post_time,new.search_key,
	new.invite_code,new.cyuid,new.updatetime,new.grade,new.subject,new.top_level,new.space_name,''
);
END;

-- 删
DROP TRIGGER IF EXISTS tri_afterdelete_ts_user;
CREATE TRIGGER tri_afterdelete_ts_user
AFTER DELETE ON ts_user
FOR EACH ROW
BEGIN

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(4, concat_ws(',','tri_afterdelete_ts_user出现SQLEXCEPTION', old.uid), now());
	DECLARE CONTINUE HANDLER FOR SQLWARNING INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(5, concat_ws(',','tri_afterdelete_ts_user出现SQLWARNING', old.uid), now());
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(15, concat_ws(',','tri_afterdelete_ts_user出现重复异常', old.uid), now());
	DECLARE CONTINUE HANDLER FOR 1062 INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(16, concat_ws(',','tri_afterdelete_ts_user出现重复异常', old.uid), now());
	DECLARE CONTINUE HANDLER FOR 1048 INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(17, concat_ws(',','tri_afterdelete_ts_user出现非空异常', old.uid), now());
	-- DECLARE CONTINUE HANDLER FOR NOT FOUND INSERT INTO TEST_LOG(id) VALUES(3);

	delete from ts_demo_data where uid = old.uid;
END;

-- 改
DROP TRIGGER IF EXISTS tri_afterupdate_ts_user;
CREATE TRIGGER tri_afterupdate_ts_user 
AFTER UPDATE ON ts_user
FOR EACH ROW
BEGIN

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(31, concat_ws(',','tri_afterupdate_ts_user出现SQLEXCEPTION', new.uid), now());
	DECLARE CONTINUE HANDLER FOR SQLWARNING INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(32, concat_ws(',','tri_afterupdate_ts_user出现SQLWARNING', new.uid), now());
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(65, concat_ws(',','tri_afterupdate_ts_user出现重复异常', new.uid), now());
	DECLARE CONTINUE HANDLER FOR 1062 INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(76, concat_ws(',','tri_afterupdate_ts_user出现重复异常', new.uid), now());
	DECLARE CONTINUE HANDLER FOR 1048 INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(87, concat_ws(',','tri_afterupdate_ts_user出现非空异常', new.uid), now());
	-- DECLARE CONTINUE HANDLER FOR NOT FOUND INSERT INTO TEST_LOG(id) VALUES(3);

UPDATE ts_demo_data set 
	login=new.login,
	password=new.password,
	login_salt=new.login_salt,
	uname=new.uname,
	email=new.email,
	sex=new.sex,
	location=new.location,
	school_id=new.school_id,
	school=new.school,
	is_audit=new.is_audit,
	is_active=new.is_active,
	is_init=new.is_init,
	ctime=new.ctime,
	identity=new.identity,
	api_key=new.api_key,
	domain=new.domain,
	province=new.province,
	city=new.city,
	area=new.area,
	reg_ip=new.reg_ip,
	lang=new.lang,
	timezone=new.timezone,
	is_del=new.is_del,
	first_letter=new.first_letter,
	intro=new.intro,
	last_login_time=new.last_login_time,
	last_feed_id=new.last_feed_id,
	last_post_time=new.last_post_time,
	search_key=new.search_key,
	invite_code=new.invite_code,
	cyuid=new.cyuid,
	updatetime=new.updatetime,
	grade=new.grade,
	subject=new.subject,
	top_level=new.top_level,
	space_name=new.space_name
WHERE uid = new.uid;
END;

-- ts_user_role 表
-- 增
DROP TRIGGER IF EXISTS tri_afterinsert_ts_user_role;
CREATE TRIGGER tri_afterinsert_ts_user_role
AFTER INSERT ON ts_user_role
FOR EACH ROW
BEGIN
	DECLARE a CHAR(255);
	DECLARE b CHAR(255);
	DECLARE done INT DEFAULT FALSE;
	DECLARE cur CURSOR FOR SELECT rolename FROM ts_user_role where uid = new.uid;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(7, concat_ws(',','tri_afterinsert_ts_user_role出现SQLEXCEPTION', new.uid), now());
	DECLARE CONTINUE HANDLER FOR SQLWARNING INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(8, concat_ws(',','tri_afterinsert_ts_user_role出现SQLWARNING', new.uid), now());
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(66, concat_ws(',','tri_afterinsert_ts_user_role出现重复异常', new.uid), now());
	DECLARE CONTINUE HANDLER FOR 1062 INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(77, concat_ws(',','tri_afterinsert_ts_user_role出现重复异常', new.uid), now());
	DECLARE CONTINUE HANDLER FOR 1048 INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(88, concat_ws(',','tri_afterinsert_ts_user_role出现非空异常', new.uid), now());

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO a;
    IF done THEN
      LEAVE read_loop;
    END IF;
		set b = CONCAT_ws(',',a,b);
  END LOOP;
	update ts_demo_data set roleEnName = b where uid = new.uid;
  CLOSE cur;
END;

-- 删
DROP TRIGGER IF EXISTS tri_afterdelete_ts_user_role;
CREATE TRIGGER tri_afterdelete_ts_user_role
AFTER DELETE ON ts_user_role
FOR EACH ROW
BEGIN
	DECLARE a CHAR(255);
	DECLARE b CHAR(255);
	DECLARE done INT DEFAULT FALSE;
	DECLARE cur CURSOR FOR SELECT rolename FROM ts_user_role where uid = old.uid;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(10, concat_ws(',','tri_afterinsert_ts_user_role出现SQLEXCEPTION', old.uid), now());
	DECLARE CONTINUE HANDLER FOR SQLWARNING INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(11, concat_ws(',','tri_afterinsert_ts_user_role出现SQLWARNING', old.uid), now());
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(89, concat_ws(',','tri_afterinsert_ts_user_role出现重复异常', old.uid), now());
	DECLARE CONTINUE HANDLER FOR 1062 INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(90, concat_ws(',','tri_afterinsert_ts_user_role出现重复异常', old.uid), now());
	DECLARE CONTINUE HANDLER FOR 1048 INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(91, concat_ws(',','tri_afterinsert_ts_user_role出现非空异常', old.uid), now());

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO a;
    IF done THEN
      LEAVE read_loop;
    END IF;
		set b = CONCAT_ws(',',a,b);
  END LOOP;
	update ts_demo_data set roleEnName = b where uid = old.uid;
  CLOSE cur;
END;

-- 改
DROP TRIGGER IF EXISTS tri_afterupdate_ts_user_role;
CREATE TRIGGER tri_afterupdate_ts_user_role 
AFTER UPDATE ON ts_user_role
FOR EACH ROW
BEGIN
	DECLARE a CHAR(255);
	DECLARE b CHAR(255);
	DECLARE done INT DEFAULT FALSE;
	DECLARE cur CURSOR FOR SELECT rolename FROM ts_user_role where uid = new.uid;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(12, concat_ws(',','tri_afterupdate_ts_user_role出现SQLEXCEPTION', new.uid), now());
	DECLARE CONTINUE HANDLER FOR SQLWARNING INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(14, concat_ws(',','tri_afterupdate_ts_user_role出现SQLWARNING', new.uid), now());
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(92, concat_ws(',','tri_afterupdate_ts_user_role出现重复异常', new.uid), now());
	DECLARE CONTINUE HANDLER FOR 1062 INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(93, concat_ws(',','tri_afterupdate_ts_user_role出现重复异常', new.uid), now());
	DECLARE CONTINUE HANDLER FOR 1048 INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(94, concat_ws(',','tri_afterupdate_ts_user_role出现非空异常', new.uid), now());

  OPEN cur;
  read_loop: LOOP
    FETCH cur INTO a;
    IF done THEN
      LEAVE read_loop;
    END IF;
		set b = CONCAT_ws(',',a,b);
  END LOOP;
	update ts_demo_data set roleEnName = b where uid = new.uid;
  CLOSE cur;
END;


-- ts_user_data表
-- 增
DROP TRIGGER IF EXISTS tri_afterinsert_ts_user_data;
CREATE TRIGGER tri_afterinsert_ts_user_data 
AFTER INSERT ON ts_user_data
FOR EACH ROW
BEGIN
	DECLARE a CHAR(255);
	DECLARE b CHAR(255);
	DECLARE done INT DEFAULT FALSE;
	DECLARE cur CURSOR FOR SELECT `key`, `value` FROM ts_user_data where uid = new.uid;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(16, concat_ws(',','tri_afterinsert_ts_user_data出现SQLEXCEPTION', new.uid), now());
	DECLARE CONTINUE HANDLER FOR SQLWARNING INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(17, concat_ws(',','tri_afterinsert_ts_user_data出现SQLWARNING', new.uid), now());
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(95, concat_ws(',','tri_afterinsert_ts_user_data出现重复异常', new.uid), now());
	DECLARE CONTINUE HANDLER FOR 1062 INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(96, concat_ws(',','tri_afterinsert_ts_user_data出现重复异常', new.uid), now());
	DECLARE CONTINUE HANDLER FOR 1048 INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(97, concat_ws(',','tri_afterinsert_ts_user_data出现非空异常', new.uid), now());



  OPEN cur;
  read_loop: LOOP
		FETCH cur INTO a, b; /*把第一行数据写入变量中,游标也随之指向了记录的第一行*/
    IF done THEN
      LEAVE read_loop;
    END IF;
		if(a='article_count') THEN  
			update ts_demo_data set article_count = b where uid = new.uid;
		end if;
		if(a='check_connum') THEN  
			update ts_demo_data set check_connum = b where uid = new.uid;
		end if;
		if(a='check_totalnum') THEN  
			update ts_demo_data set check_totalnum = b where uid = new.uid;
		end if;
		if(a='favorite_count') THEN  
			update ts_demo_data set favorite_count = b where uid = new.uid;
		end if;
		if(a='feed_count') THEN  
			update ts_demo_data set feed_count = b where uid = new.uid;
		end if;
		if(a='follower_count') THEN  
			update ts_demo_data set follower_count = b where uid = new.uid;
		end if;
		if(a='following_count') THEN  
			update ts_demo_data set following_count = b where uid = new.uid;
		end if;
		if(a='new_folower_count') THEN  
			update ts_demo_data set new_folower_count = b where uid = new.uid;
		end if;
		if(a='perday_visitor_count') THEN  
			update ts_demo_data set perday_visitor_count = b where uid = new.uid;
		end if;
		if(a='unread_atme') THEN  
			update ts_demo_data set unread_atme = b where uid = new.uid;
		end if;
		if(a='unread_comment') THEN  
			update ts_demo_data set unread_comment = b where uid = new.uid;
		end if;
		if(a='upload_res_count') THEN  
			update ts_demo_data set upload_res_count = b where uid = new.uid;
		end if;
		if(a='upload_yunpan_count') THEN  
			update ts_demo_data set upload_yunpan_count = b where uid = new.uid;
		end if;
		if(a='user_recentat') THEN  
			update ts_demo_data set user_recentat = b where uid = new.uid;
		end if;
		if(a='view_follower_time') THEN  
			update ts_demo_data set view_follower_time = b where uid = new.uid;
		end if;
		if(a='visitor_count') THEN  
			update ts_demo_data set visitor_count = b where uid = new.uid;
		end if;
		if(a='weibo_count') THEN  
			update ts_demo_data set weibo_count = b where uid = new.uid;
		end if;
  END LOOP;
  CLOSE cur; /*用完后记得用CLOSE把资源释放掉*/
END;

-- 删
DROP TRIGGER IF EXISTS tri_afterdelete_ts_user_data;
CREATE TRIGGER tri_afterdelete_ts_user_data
AFTER DELETE ON ts_user_data
FOR EACH ROW
BEGIN

		DECLARE CONTINUE HANDLER FOR SQLEXCEPTION INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(19, concat_ws(',','tri_afterdelete_ts_user_data出现SQLEXCEPTION', old.uid), now());
		DECLARE CONTINUE HANDLER FOR SQLWARNING INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(20, concat_ws(',','tri_afterdelete_ts_user_data出现SQLWARNING', old.uid), now());
		DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(98, concat_ws(',','tri_afterdelete_ts_user_data出现重复异常', old.uid), now());
		DECLARE CONTINUE HANDLER FOR 1062 INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(99, concat_ws(',','tri_afterdelete_ts_user_data出现重复异常', old.uid), now());
		DECLARE CONTINUE HANDLER FOR 1048 INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(100, concat_ws(',','tri_afterdelete_ts_user_data出现非空异常', old.uid), now());

		if(old.`key`='article_count') THEN  
			update ts_demo_data set article_count = 0 where uid = old.uid;
		end if;
		if(old.`key`='check_connum') THEN  
			update ts_demo_data set check_connum = 0 where uid = old.uid;
		end if;
		if(old.`key`='check_totalnum') THEN  
			update ts_demo_data set check_totalnum = 0 where uid = old.uid;
		end if;
		if(old.`key`='favorite_count') THEN  
			update ts_demo_data set favorite_count = 0 where uid = old.uid;
		end if;
		if(old.`key`='feed_count') THEN  
			update ts_demo_data set feed_count = 0 where uid = old.uid;
		end if;
		if(old.`key`='follower_count') THEN  
			update ts_demo_data set follower_count = 0 where uid = old.uid;
		end if;
		if(old.`key`='following_count') THEN  
			update ts_demo_data set following_count = 0 where uid = old.uid;
		end if;
		if(old.`key`='new_folower_count') THEN  
			update ts_demo_data set new_folower_count = 0 where uid = old.uid;
		end if;
		if(old.`key`='perday_visitor_count') THEN  
			update ts_demo_data set perday_visitor_count = 0 where uid = old.uid;
		end if;
		if(old.`key`='unread_atme') THEN  
			update ts_demo_data set unread_atme = 0 where uid = old.uid;
		end if;
		if(old.`key`='unread_comment') THEN  
			update ts_demo_data set unread_comment = 0 where uid = old.uid;
		end if;
		if(old.`key`='upload_res_count') THEN  
			update ts_demo_data set upload_res_count = 0 where uid = old.uid;
		end if;
		if(old.`key`='upload_yunpan_count') THEN  
			update ts_demo_data set upload_yunpan_count = 0 where uid = old.uid;
		end if;
		if(old.`key`='user_recentat') THEN  
			update ts_demo_data set user_recentat = 0 where uid = old.uid;
		end if;
		if(old.`key`='view_follower_time') THEN  
			update ts_demo_data set view_follower_time = 0 where uid = old.uid;
		end if;
		if(old.`key`='visitor_count') THEN  
			update ts_demo_data set visitor_count = 0 where uid = old.uid;
		end if;
		if(old.`key`='weibo_count') THEN  
			update ts_demo_data set weibo_count = 0 where uid = old.uid;
		end if;
END;

-- 改
DROP TRIGGER IF EXISTS tri_afterupdate_ts_user_data;
CREATE TRIGGER tri_afterupdate_ts_user_data 
AFTER UPDATE ON ts_user_data
FOR EACH ROW
BEGIN
	DECLARE a CHAR(255);
	DECLARE b CHAR(255);
	DECLARE done INT DEFAULT FALSE;
	DECLARE cur CURSOR FOR SELECT `key`, `value` FROM ts_user_data where uid = new.uid;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(22, concat_ws(',','tri_afterupdate_ts_user_data出现SQLEXCEPTION', new.uid), now());
	DECLARE CONTINUE HANDLER FOR SQLWARNING INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(23, concat_ws(',','tri_afterupdate_ts_user_data出现SQLWARNING', new.uid), now());
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(101, concat_ws(',','tri_afterupdate_ts_user_data出现重复异常', new.uid), now());
	DECLARE CONTINUE HANDLER FOR 1062 INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(102, concat_ws(',','tri_afterupdate_ts_user_data出现重复异常', new.uid), now());
	DECLARE CONTINUE HANDLER FOR 1048 INSERT INTO ts_triggers_log(error_code, error_message, create_time) VALUES(103, concat_ws(',','tri_afterupdate_ts_user_data出现非空异常', new.uid), now());

  OPEN cur;
  read_loop: LOOP
		FETCH cur INTO a, b; /*把第一行数据写入变量中,游标也随之指向了记录的第一行*/
    IF done THEN
      LEAVE read_loop;
    END IF;
		if(a='article_count') THEN  
			update ts_demo_data set article_count = b where uid = new.uid;
		end if;
		if(a='check_connum') THEN  
			update ts_demo_data set check_connum = b where uid = new.uid;
		end if;
		if(a='check_totalnum') THEN  
			update ts_demo_data set check_totalnum = b where uid = new.uid;
		end if;
		if(a='favorite_count') THEN  
			update ts_demo_data set favorite_count = b where uid = new.uid;
		end if;
		if(a='feed_count') THEN  
			update ts_demo_data set feed_count = b where uid = new.uid;
		end if;
		if(a='follower_count') THEN  
			update ts_demo_data set follower_count = b where uid = new.uid;
		end if;
		if(a='following_count') THEN  
			update ts_demo_data set following_count = b where uid = new.uid;
		end if;
		if(a='new_folower_count') THEN  
			update ts_demo_data set new_folower_count = b where uid = new.uid;
		end if;
		if(a='perday_visitor_count') THEN  
			update ts_demo_data set perday_visitor_count = b where uid = new.uid;
		end if;
		if(a='unread_atme') THEN  
			update ts_demo_data set unread_atme = b where uid = new.uid;
		end if;
		if(a='unread_comment') THEN  
			update ts_demo_data set unread_comment = b where uid = new.uid;
		end if;
		if(a='upload_res_count') THEN  
			update ts_demo_data set upload_res_count = b where uid = new.uid;
		end if;
		if(a='upload_yunpan_count') THEN  
			update ts_demo_data set upload_yunpan_count = b where uid = new.uid;
		end if;
		if(a='user_recentat') THEN  
			update ts_demo_data set user_recentat = b where uid = new.uid;
		end if;
		if(a='view_follower_time') THEN  
			update ts_demo_data set view_follower_time = b where uid = new.uid;
		end if;
		if(a='visitor_count') THEN  
			update ts_demo_data set visitor_count = b where uid = new.uid;
		end if;
		if(a='weibo_count') THEN  
			update ts_demo_data set weibo_count = b where uid = new.uid;
		end if;
  END LOOP;
  CLOSE cur; /*用完后记得用CLOSE把资源释放掉*/
END;






-- 动态sql，触发器不能用动态sql，只能存储过程能用
DROP TRIGGER IF EXISTS tri_afterdelete_ts_user_data;
CREATE TRIGGER tri_afterdelete_ts_user_data
BEFORE DELETE ON ts_user_data
FOR EACH ROW
BEGIN
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION INSERT INTO TEST_LOG(id) VALUES(25);
	DECLARE CONTINUE HANDLER FOR SQLWARNING INSERT INTO TEST_LOG(id) VALUES(26);
	-- DECLARE CONTINUE HANDLER FOR NOT FOUND INSERT INTO TEST_LOG(id) VALUES(27);

	DECLARE l_sql VARCHAR(4000);
	SET l_sql=CONCAT_ws(' ', ' UPDATE ts_demo_data set ', old.`key`, '=0', ' where uid= ', old.uid);
	SET @sql=l_sql;
	PREPARE s1 FROM @sql;
	EXECUTE s1;
	DEALLOCATE PREPARE s1;
END;


















