---------------------------------------------------
-- Export file for user SXDXSJ                   --
-- Created by c_lijie115 on 2012-11-27, 14:15:47 --
---------------------------------------------------

spool aaa.log

prompt
prompt Creating function FUN_PARSE_NUMBER
prompt ==================================
prompt
create or replace function sxdxsj.fun_parse_number(
  number_string varchar2
)return number as
begin
  return to_number(number_string);
  exception
    when others then
    return -9;
end fun_parse_number;
/

prompt
prompt Creating function FUN_AGE_CHECK
prompt ===============================
prompt
create or replace function sxdxsj.fun_age_check(
  birthday in date
  ,v_sysdate in date default sysdate
  )
return number as
begin
  -- 0-17��	18-25��	26-35��	36-45��	46-55��	>55��
  declare age_code number;
  age number;
  v_date date;
  begin
  	begin
  		v_date:=birthday;
  		age:= to_number(to_char(v_sysdate,'yyyy'))-fun_parse_number(to_char(v_date,'yyyy'));
		exception
      when others then
    	age:= 0;
    end;
    case
      when age <=17
      then
        age_code := 0;
      when age>=18 and age <=25
      then
        age_code := 1;
      when age>=26 and age <=35
      then
        age_code := 2;
      when age>=36 and age <=45
      then
        age_code := 3;
      when age>=46 and age <=50
      then
        age_code := 4;
      when age>=51 and age <=55
      then
        age_code := 5;
      when age>55
      then
        age_code := 6;
      else
        age_code := 0;
    end case;
    return (age_code);
  end;
end fun_age_check;
/

prompt
prompt Creating function FUN_BIRTH_MONTH_DAY_CODE
prompt ==========================================
prompt
create or replace function sxdxsj.fun_birth_month_day_code(
  birthday in date)
return number as
begin
  DECLARE
  birth_month number(2);
  birth_day number(2);
  v_date date;
  begin
  	begin
  		v_date:=birthday;
  		birth_month:= to_number(to_char(v_date,'mm'));
    	birth_day:= to_number(to_char(v_date,'dd'));
		exception
      when others then
    	birth_month:= 1;
    	birth_day:= 1;
    end;
	  -- monthȡֵ��
	  -- 1��	2��	3��	4��	5��	6��	7��	8��	9��	10��	11��	12��
	  -- weekȡֵ��
	  -- 1-7��	8-15��	16-23��	24-31��
	  case
	    when birth_day>=1 and birth_day <=7
	    then
	      return(birth_month*4-3);
	    when birth_day>=8 and birth_day <=15
	    then
	      return(birth_month*4-2);
	    when birth_day>=16 and birth_day <=23
	    then
	      return(birth_month*4-1);
	    when birth_day>=24 and birth_day <=31
	    then
	      return(birth_month*4);
	    else
	      return(1);
      end case;
  end;
end;
/

prompt
prompt Creating function FUN_BRANCH_CHILD_CODE
prompt =======================================
prompt
create or replace function sxdxsj.fun_branch_child_code(
i_branch_code in number
,i_branch_abbr in varchar2
,i_govern_id in varchar2
) return number as
begin
  declare v_code number;
  begin
    if i_branch_code>0 then--�зֹ�˾����
       if  i_govern_id is null then
         select min(branch_code) into v_code from d_branch_info where d_branch_code=i_branch_code;
       else
         select min(d.branch_code) into v_code from d_branch_info d inner join help_govern_phone_code h
          on d.branch_abbreviation=h.branch_abbreviation and d.child_branch_name=h.govern_name
          where h.govern_id=i_govern_id;
       end if;
       if v_code is null then
         select min(branch_code) into v_code from d_branch_info where d_branch_code=i_branch_code;
       end if;
    elsif i_branch_abbr is not null then--�зֹ�˾���
       if  i_govern_id is null then
         select min(branch_code) into v_code from d_branch_info where upper(branch_abbreviation)=upper(i_branch_abbr);
       else
         select min(d.branch_code) into v_code from d_branch_info d inner join help_govern_phone_code h
          on d.branch_abbreviation=h.branch_abbreviation and d.child_branch_name=h.govern_name
          where h.govern_id=i_govern_id;
       end if;
       if v_code is null then
         select min(branch_code) into v_code from d_branch_info where upper(branch_abbreviation)=upper(i_branch_abbr);
       end if;
    elsif i_govern_id is not null then--�л�����
       select min(d.branch_code) into v_code from d_branch_info d inner join help_govern_phone_code h
          on d.branch_abbreviation=h.branch_abbreviation and d.child_branch_name=h.govern_name
          where h.govern_id=i_govern_id;
    else--�޷�ȷ���ֹ�˾����֧
	    v_code:= 0 ;
     end if;
	  return nvl(v_code,0);
  end;
end fun_branch_child_code;
/

prompt
prompt Creating function FUN_CHECK_ID
prompt ==============================
prompt
CREATE OR REPLACE Function SXDXSJ.Fun_Check_Id(Card_Id In Varchar2)
Return  Number As
Begin
  if Regexp_Like(Card_Id,'^((000)|(111)|(222)|(333)|(444)|(555)|(666)|(777)|(888)|(999))') then
    Return 0;
  Else
    Return 1;
  end if;
end;
/

prompt
prompt Creating function FUN_CHECK_PAYCODE
prompt ===================================
prompt
create or replace function sxdxsj.fun_check_paycode(
       v_source_type_code number
       ,v_paycode varchar2
       ,v_begin_date date
       ,v_end_date date
) return  number
/*���ݽɷѷ�ʽ�����ڲ��ж������Ƿ����
�����򷵻�true;�������򷵻�false
*/
as
v_ret number(1):=1;
v_date_diff number(6);
begin
    if v_source_type_code=1 and v_paycode in ('01','13') then
        select (Extract(Year From v_end_date) -
                  Extract(Year From v_begin_date)) * 12 +
                 (Extract(Month From v_end_date) -
                  Extract(Month From v_begin_date))
                   into v_date_diff from dual;
        if v_paycode='01' and v_date_diff<6 or v_paycode='13' and v_date_diff<13 then
          v_ret:=0;
        end if;
    end if;
  return v_ret;
   exception
    when others then
    return 0;
end;
/

prompt
prompt Creating function FUN_CHECK_PAYCODE_RIGHT
prompt =========================================
prompt
create or replace function sxdxsj.fun_check_paycode_right(
       v_source_type_code number
       ,v_paycode varchar2
       ,v_begin_date date
       ,v_end_date date
) return  number
/*���ݽɷѷ�ʽ�����ڲ��ж������Ƿ����
�����򷵻�true;�������򷵻�false
*/
as
v_ret number(1):=1;
v_date_diff number(6);
begin
    if v_source_type_code=1 and v_paycode in ('01','13') then
        select (Extract(Year From v_end_date) -
                  Extract(Year From v_begin_date)) * 12 +
                 (Extract(Month From v_end_date) -
                  Extract(Month From v_begin_date))
                   into v_date_diff from dual;
        if v_paycode='01' and v_date_diff<6 or v_paycode='13' and v_date_diff<13 then
          v_ret:=0;
        end if;
    end if;
  return v_ret;
   exception
    when others then
    return 0;
end;
/

prompt
prompt Creating function FUN_CHECK_PRODUCT
prompt ===================================
prompt
create or replace function sxdxsj.fun_check_product(
  selected_list varchar2
  ,purcharsed_list varchar2
)return number as
v_selected_list varchar2(20);
v_purcharsed_list varchar2(20);
begin
  v_selected_list:=upper(trim(selected_list));
  v_purcharsed_list:=upper(trim(purcharsed_list));
  if v_selected_list is null then--�û�δѡ���κβ�Ʒ
    return 1;
  elsif v_purcharsed_list is null then--�ͻ�δ�����κβ�Ʒ
    return 0;
  else
    for s in 1..length(v_selected_list) loop
      if instr(v_purcharsed_list,substr(v_selected_list,s,1),1)=0 then--�û�ѡ�Ĳ�Ʒ���ڿͻ�����Ĳ�Ʒ��
        return 0;
      end if;
    end loop;
  end if;
  return 1;
  exception
    when others then
    return 0;
end fun_check_product;
/

prompt
prompt Creating function FUN_CLEAN_MOBILE
prompt ==================================
prompt
CREATE OR REPLACE FUNCTION SXDXSJ.FUN_CLEAN_MOBILE(I_TEL VARCHAR2) RETURN VARCHAR2 AS
       V_TEL  VARCHAR2(50);
BEGIN

  /*======================================================================================
    ��Ȩ��Ϣ����Ȩ����(c) 2012��neusoft
    �������ƣ�PROC_INSERT
    ����˵�����ֻ�������ϴ����
    ���������I_TEL ��ϴǰ����
    ���������V_TEL ��ϴ�����

    ��    �ߣ�¬��ƽ
    �������ڣ�2012-8-16
    �� �� �ţ�V2.0


    �޸���ʷ
    �汾    �޸�����            �޸���       �޸�˵��
    ---------------------------------------------------------------------------------------


  ========================================================================================*/
  V_TEL := TO_SINGLE_BYTE(I_TEL);

  V_TEL := REGEXP_REPLACE(V_TEL,'[^0-9]','');

  V_TEL := REGEXP_REPLACE(V_TEL,'^[0|86]+','');

  IF REGEXP_INSTR(V_TEL,'1') = 1 AND LENGTH(V_TEL) = 11
  THEN
     V_TEL := V_TEL;
  ELSE
     V_TEL := '';
  END IF;

  RETURN V_TEL;

END FUN_CLEAN_MOBILE;
/

prompt
prompt Creating function FUN_CONTACT_CODE
prompt ==================================
prompt
create or replace function sxdxsj.fun_contact_code(contact_status in number)
return number
as
begin
case
when contact_status in (35,3501,3500,3505,3510) then return 1;--�ɽ�
when contact_status in (2002010101,2002010201,200201,20020101,20020102) then return 2;--��׷�٣�������
when contact_status in (2002010202,2002010203) then return 3;--��׷�٣�����
when contact_status in (2002,20) then return 5;--��׷�٣�����
when contact_status in (20020901) then return 6;--�ܾ�������������
when contact_status in (20020903) then return 7;--�ܾ��������ܵ���
when contact_status in (20020902,20020904,200209) then return 9;--�ܾ�������
when contact_status in (3001,2001) then return 14;--δ��ͨ�����˽���
when contact_status in (30,3003,300301,300302,300303,300304) then return 15;--δ��ͨ���պ�
else return 16;
end case;
end;
/

prompt
prompt Creating function FUN_DATE_DIFF
prompt ===============================
prompt
CREATE OR REPLACE FUNCTION SXDXSJ.FUN_DATE_DIFF
(
  birthday in date
  ,v_sysdate in date default sysdate
) RETURN NUMBER AS
begin
/*
��������������ϵͳʱ���
0���޲��
1:3������
2:3~6����
3:6~9����
4:9~12����
5:12��������
*/
  declare  day_diff  number;
  month_diff  number;
  --YEAR_DIFF  NUMBER
  v_date date;
  begin
  		--v_date:=fun_parse_date(birthday,format_string);
      v_date:=birthday;
  		--�����뵱ǰʱ���������
      select floor(v_sysdate - v_date) into day_diff from dual;
      --������
      --select floor((v_sysdate - v_date)/365) into year_diff from dual;
      --������
      select floor((v_sysdate - v_date)/30) into month_diff from dual;
      if day_diff<=0 then return 0;
      elsif month_diff<3 then return 1;
      elsif month_diff<6 then return 2;
      elsif month_diff<9 then return 3;
      elsif month_diff<12 then return 4;
      elsif month_diff>=12 then return 5;
      else  return 0;
      end if;
		exception
      when others then
    	return 0;
  end;
END FUN_DATE_DIFF;
/

prompt
prompt Creating function FUN_DATE_INTERVAL
prompt ===================================
prompt
create or replace function sxdxsj.fun_date_interval(date_code in date,
                                             v_day     in char,
                                             v_flag    in char default 0)
  return varchar2 as
  v_result    varchar2(30);
  v_week_code varchar2(10);
  v_daycode   char;
begin
  /*--============================
   --v_flag Ϊ 0 ��Ĭ�ϸ�ʽ��Ϊ 1 �� ���ͳ�����������ã�
   -- v_day Ϊ W ��������
   -- v_day Ϊ M ��������
   -- v_day Ϊ Q �Ǽ�����
   -- v_day Ϊ Y ��������
  --============================*/
  v_week_code := to_char(date_code, 'DAY');
  v_daycode   := Upper(v_day);

  if v_flag = 1 and v_daycode = 'W' then
    case
      when v_week_code = '������' then
        v_result := to_char(date_code - 6, 'YYYY-MM-DD') || '��' ||
                    to_char(date_code, 'YYYY-MM-DD');
      when v_week_code = '����һ' then
        v_result := to_char(date_code, 'YYYY-MM-DD') || '��' ||
                    to_char(date_code + 6, 'YYYY-MM-DD');
      when v_week_code = '���ڶ�' then
        v_result := to_char(date_code - 1, 'YYYY-MM-DD') || '��' ||
                    to_char(date_code + 5, 'YYYY-MM-DD');
      when v_week_code = '������' then
        v_result := to_char(date_code - 2, 'YYYY-MM-DD') || '��' ||
                    to_char(date_code + 4, 'YYYY-MM-DD');
      when v_week_code = '������' then
        v_result := to_char(date_code - 3, 'YYYY-MM-DD') || '��' ||
                    to_char(date_code + 3, 'YYYY-MM-DD');
      when v_week_code = '������' then
        v_result := to_char(date_code - 4, 'YYYY-MM-DD') || '��' ||
                    to_char(date_code + 2, 'YYYY-MM-DD');
      when v_week_code = '������' then
        v_result := to_char(date_code - 5, 'YYYY-MM-DD') || '��' ||
                    to_char(date_code + 1, 'YYYY-MM-DD');
    end case;elsif v_flag = 0 and v_daycode = 'W' then
    case
      when v_week_code = '������' then
        v_result := to_char(date_code, 'YYYY-MM-DD') || '��' ||
                    to_char(date_code + 6, 'YYYY-MM-DD');
      when v_week_code = '����һ' then
        v_result := to_char(date_code - 1, 'YYYY-MM-DD') || '��' ||
                    to_char(date_code + 5, 'YYYY-MM-DD');
      when v_week_code = '���ڶ�' then
        v_result := to_char(date_code - 2, 'YYYY-MM-DD') || '��' ||
                    to_char(date_code + 4, 'YYYY-MM-DD');
      when v_week_code = '������' then
        v_result := to_char(date_code - 3, 'YYYY-MM-DD') || '��' ||
                    to_char(date_code + 3, 'YYYY-MM-DD');
      when v_week_code = '������' then
        v_result := to_char(date_code - 4, 'YYYY-MM-DD') || '��' ||
                    to_char(date_code + 2, 'YYYY-MM-DD');
      when v_week_code = '������' then
        v_result := to_char(date_code - 5, 'YYYY-MM-DD') || '��' ||
                    to_char(date_code + 1, 'YYYY-MM-DD');
      when v_week_code = '������' then
        v_result := to_char(date_code - 6, 'YYYY-MM-DD') || '��' ||
                    to_char(date_code, 'YYYY-MM-DD');
    end case; end if;
  --�������ж�
  if v_daycode = 'Y' and v_flag = 0 then
    v_result := to_char(date_code, 'YYYY') || '-01-01��' ||
                to_char(date_code, 'YYYY') || '-12-31';
  end if;
  --���������ж�
  if v_daycode = 'Q' and v_flag = 0 then
    if date_code <=
       to_date(substr(to_char(date_code, 'YYYYMMDD'), 1, 4) || '0331',
               'YYYYMMDD') then
      v_result := to_char(date_code, 'YYYY') || '-01-01��' ||
                  to_char(date_code, 'YYYY') || '-03-31';
    elsif date_code >=
          to_date(substr(to_char(date_code, 'YYYYMMDD'), 1, 4) || '0401',
                  'YYYYMMDD') and
          date_code <=
          to_date(substr(to_char(date_code, 'YYYYMMDD'), 1, 4) || '0630',
                  'YYYYMMDD') then
      v_result := to_char(date_code, 'YYYY') || '-04-01��' ||
                  to_char(date_code, 'YYYY') || '-06-30';
    elsif date_code >=
          to_date(substr(to_char(date_code, 'YYYYMMDD'), 1, 4) || '0701',
                  'YYYYMMDD') and
          date_code <=
          to_date(substr(to_char(date_code, 'YYYYMMDD'), 1, 4) || '0930',
                  'YYYYMMDD') then
      v_result := to_char(date_code, 'YYYY') || '-07-01��' ||
                  to_char(date_code, 'YYYY') || '-09-30';
    else
      v_result := to_char(date_code, 'YYYY') || '-10-01��' ||
                  to_char(date_code, 'YYYY') || '-12-31';
    end if;
  end if;
  --�������ж�
  if v_daycode = 'M' and v_flag = 0 then
    v_result := to_char(date_code, 'YYYY-MM') || '-01��' ||
                to_char(last_day(date_code), 'YYYY-MM-DD');
  end if;
  return(v_result);
end fun_date_interval;
/

prompt
prompt Creating function FUN_FIND_BRANCH
prompt =================================
prompt
create or replace function sxdxsj.fun_find_branch(
       v_condition varchar2
) return  number
/*���û�ѡ���������ɾѡ����Ӧ�ķֹ�˾����
����������зֹ�˾���룬ֱ�ӷ��ض�Ӧ�Ĵ���
�������������֧���룬������֮��Ӧ�ķֹ�˾����
�����û�У������ܹ�˾����
��������а�������ֹ�˾�����ڶ���ֹ�˾����֧��
�򷵻����ȳ��ֵķֹ�˾�������֧��Ӧ�ķֹ�˾����
*/
as
v_branch_code number(3);
v_position number(6);
begin
    select instr(v_condition,'CHILD_BRANCH_CODE') into v_position from dual;
    if v_position>0 then
        select max(d_branch_code) into v_branch_code from d_branch_info
        where branch_code=to_number(regexp_replace(substr(v_condition,v_position+18,3),'[^0-9]',''));
    else
        select instr(v_condition,'D_BRANCH_CODE') into v_position from dual;
        if v_position>0 then
           select to_number(regexp_replace(substr(v_condition,v_position+14,3),'[^0-9]','')) into v_branch_code from dual;
        else
            v_branch_code:=0;
        end if;
    end if;
  return nvl(v_branch_code,0);
   exception
    when others then
    return 0;
end;
/

prompt
prompt Creating function FUN_FIND_SOURCE
prompt =================================
prompt
create or replace function sxdxsj.fun_find_source(
       v_condition varchar2
) return  number
/*从用户选择的条件中删选出对应的数据源代码
如果条件中有数据源代码，直接返回对应的代�?
如果都没有，返回0
如果条件中包含多个数据源�?
则返回最先出现的数据源代�?
*/
as
v_source_type_code number(3);
v_position number(6);
begin
    select instr(v_condition,'SOURCE_TYPE_CODE') into v_position from dual;
    if v_position>0 then
        select to_number(regexp_replace(substr(v_condition,v_position+17,3),'[^0-9]','')) into v_source_type_code from dual;
    else
        v_source_type_code:=0;
    end if;
  return nvl(v_source_type_code,0);
   exception
    when others then
    return 0;
end;
/

prompt
prompt Creating function FUN_GET_ORGID
prompt ===============================
prompt
CREATE OR REPLACE FUNCTION SXDXSJ.FUN_GET_ORGID(V_ORG_ID NUMBER,V_LEVEL NUMBER) RETURN NUMBER AS
  R_ORG_ID NUMBER;
  
  V_CurrentLevel number; --��ǰORG LEVEL
BEGIN
    /*========================================================================================
         ��Ȩ��Ϣ����Ȩ����(c) 2010��neusoft
         �������ƣ�FUN_GET_ORGID
         ����˵���������û�ID������LEVEL�õ�ORGID
         ������  : 
         �汾��  : v1.1.0.0
         
         org_level ��������  0:�ܹ�˾ 1:���������� 2:���������� 3:��Ŀ 4:�Ŷ�
         
         �޸���ʷ:
         �汾     ��������:              ������             ����˵��
    ---------------------------------------------------------------------
         v1.1.0.1 2012-04-06             
    ========================================================================================*/
    --��ȡ��ǰORG �� LEVEL
    SELECT ORG_LEVEL,PARENT_ORG_ID INTO V_CurrentLevel,R_ORG_ID
    FROM TB_ORGANIZATION WHERE ORG_ID  = V_ORG_ID;
    
    --��ǰLEVE�ȴ���ߣ�����-1�����磺��ǰlevelΪ3,�뷵�صõ�level 4
    IF V_CurrentLevel < V_LEVEL  THEN
         RETURN -1;
    --����ǰLEVE�ʹ���LEVEL��ֱͬ�ӷ��أ�
    ELSIF V_LEVEL = V_CurrentLevel THEN
         RETURN V_ORG_ID;
   --��ǰ����ȴ���ͣ����еݹ����
    ELSE 
         RETURN FUN_GET_ORGID(R_ORG_ID,V_LEVEL);
    END IF;
END FUN_GET_ORGID;
/

prompt
prompt Creating function FUN_IDENTIFY_ID
prompt =================================
prompt
create or replace function sxdxsj.fun_identify_id
(
  id_num in varchar2
) return varchar2 
is
begin
if regexp_like(id_num,'^\d{15}$') then
  return concat(concat(concat(SUBSTR(id_num,1,6),'19'),SUBSTR(id_num,7,9)),
           SUBSTR('10X98765432',(
           mod(
            (CAST(SUBSTR(id_num, 1,1) AS INT)*7
            +CAST(SUBSTR(id_num, 2,1) AS INT)*9
            +CAST(SUBSTR(id_num, 3,1) AS INT)*10
            +CAST(SUBSTR(id_num, 4,1) AS INT)*5
            +CAST(SUBSTR(id_num, 5,1) AS INT)*8
            +CAST(SUBSTR(id_num, 6,1) AS INT)*4
            +1*2
            +9*1
            +CAST(SUBSTR(id_num, 7,1) AS INT)*6
            +CAST(SUBSTR(id_num, 8,1) AS INT)*3
            +CAST(SUBSTR(id_num, 9,1) AS INT)*7
            +CAST(SUBSTR(id_num,10,1) AS INT)*9
            +CAST(SUBSTR(id_num,11,1) AS INT)*10
            +CAST(SUBSTR(id_num,12,1) AS INT)*5
            +CAST(SUBSTR(id_num,13,1) AS INT)*8
            +CAST(SUBSTR(id_num,14,1) AS INT)*4
            +CAST(SUBSTR(id_num,15,1) AS INT)*2
            ),11) + 1),
            1));
else
 return id_num;
end if;
end;
/

prompt
prompt Creating function FUN_IS_DATE
prompt =============================
prompt
CREATE OR REPLACE FUNCTION SXDXSJ.FUN_IS_DATE(I_CHAR VARCHAR2)
 RETURN NUMBER IS  V_CHAR DATE;
 BEGIN
   V_CHAR := TO_DATE(NVL(I_CHAR, 'a'), 'yyyy-mm-dd hh24:mi:ss');
   RETURN 1;

 EXCEPTION  WHEN OTHERS THEN
    RETURN 0;

 END FUN_IS_DATE;
/

prompt
prompt Creating function FUN_ISIDCARD
prompt ==============================
prompt
CREATE OR REPLACE FUNCTION SXDXSJ.FUN_ISIDCARD(I_ID VARCHAR2) RETURN NUMBER AS
  V_ID VARCHAR(30);

  C_YYYYMMDD INTEGER;
  C_Check_Flag VARCHAR2(1);

  TYPE CHAR_TABLETYPE IS TABLE OF VARCHAR2(1) NOT NULL INDEX BY BINARY_INTEGER;
  TYPE NUM_TABLETYPE  IS TABLE OF NUMBER NOT NULL INDEX BY BINARY_INTEGEr;
  TAB_A CHAR_TABLETYPE;
  TAB_W NUM_TABLETYPE;
  TAB_I CHAR_TABLETYPE;

  SIGMA NUMBER(8) := 0;
BEGIN
    /*========================================================================================
         ��Ȩ��Ϣ����Ȩ����(c) 2010��������ͨ
         �������ƣ�FUN_ISIDCARD
         ����˵�������֤�������
         ������  : ¬��ƽ
         �汾��  : v1.1.0.0

         �޸���ʷ:
         �汾     ��������:              ������             ����˵��
    ---------------------------------------------------------------------
         v1.1.0.1 2011-11-30             ¬��ƽ
    ========================================================================================*/
    V_ID := I_ID;
    IF REGEXP_INSTR(V_ID,'^[0-9]{17}[0-9Xx]$',1) = 1  THEN
	    --�ж����
	    C_YYYYMMDD := SUBSTR(V_ID,7,8);
	    IF FUN_IS_DATE(C_YYYYMMDD) = 0 THEN
         RETURN 1;
      END IF;

      --У�����ж�
		  TAB_I(0) := '1';
	    TAB_I(1) := '0';
	    TAB_I(2) := 'X';
	    TAB_I(3) := '9';
	    TAB_I(4) := '8';
	    TAB_I(5) := '7';
	    TAB_I(6) := '6';
	    TAB_I(7) := '5';
	    TAB_I(8) := '4';
	    TAB_I(9) := '3';
	    TAB_I(10) := '2';
	    FOR i IN 1 .. 17 LOOP
		      TAB_W(i) := MOD(POWER(2, ((19 - i) - 1)), 11);
		      TAB_A(i) := SUBSTR(V_ID, i, 1);
		      SIGMA := SIGMA + TAB_W(i) * TAB_A(i);
	    END LOOP;
	    C_Check_Flag := TAB_I(MOD(SIGMA, 11));

      IF C_Check_Flag = SUBSTR(V_ID,18,1) THEN
         RETURN 0;
      END IF;
    END IF;


    RETURN 1;
END FUN_ISIDCARD;
/

prompt
prompt Creating function FUN_LEVEL_CODE
prompt ================================
prompt
CREATE OR REPLACE FUNCTION SXDXSJ.FUN_level_code
(
  source_type_code in number
  ,policy_status_code in number
  ,revist_result in number
  ,age_zone_code in number
  ,zone_type_code in number
  ,bank_status_code in number
  ,orphan_status_code in number
) return number as
  v_count number;
  v_code number;
begin
    if orphan_status_code=1 then
       v_code:=7;
    --�¶����ּ�
    elsif source_type_code=0 then
      v_count:=policy_status_code*1000+age_zone_code*100+zone_type_code*10+bank_status_code;
      case
        when regexp_like(v_count,'1[12345]01') then v_code:=0;
        when regexp_like(v_count,'1[12345]00') then v_code:=1;
        when regexp_like(v_count,'1[12345][123]1') then v_code:=2;
        when regexp_like(v_count,'1[12345][123]0') then v_code:=3;
        when regexp_like(v_count,'1[06]\d{2}') then v_code:=4;
        when regexp_like(v_count,'2[12345]\d{2}') then v_code:=5;
        when regexp_like(v_count,'2[06]\d{2}') then v_code:=6;
        else  v_code:=7;
      end case;
      
         --���ε��ּ�
    elsif source_type_code=-2 then
      v_count:=policy_status_code*1000+age_zone_code*100+zone_type_code*10+bank_status_code;
      case
        when regexp_like(v_count,'1[12345]01') then v_code:=0;
        when regexp_like(v_count,'1[12345]00') then v_code:=1;
        when regexp_like(v_count,'1[12345][123]1') then v_code:=2;
        when regexp_like(v_count,'1[12345][123]0') then v_code:=3;
        when regexp_like(v_count,'1[06]\d{2}') then v_code:=4;
        when regexp_like(v_count,'2[12345]\d{2}') then v_code:=5;
        when regexp_like(v_count,'2[06]\d{2}') then v_code:=6;
        else  v_code:=7;
      end case;
      
    --�����ּ�
    elsif source_type_code=1 then
      v_count:=policy_status_code*10000+revist_result*1000+age_zone_code*100+zone_type_code*10+bank_status_code;
      case
        when regexp_like(v_count,'11[12345]01') then v_code:=0;
        when regexp_like(v_count,'11[12345]00') then v_code:=1;
        when regexp_like(v_count,'11[12345][123]1') then v_code:=2;
        when regexp_like(v_count,'11[12345][123]0') then v_code:=3;
        when regexp_like(v_count,'11[06]\d{2}') then v_code:=4;
        when regexp_like(v_count,'1[^1][12345]\d{2}') then v_code:=5;
        when regexp_like(v_count,'1[^1][06]\d{2}') then v_code:=6;
        else  v_code:=7;
      end case;
    else
      v_code:=7;
    end if;
    return v_code;
END;
/

prompt
prompt Creating function FUN_PARSE_DATE
prompt ================================
prompt
create or replace function sxdxsj.fun_parse_date(
  date_string varchar2
  ,format_string varchar2
)return date as
begin
  return to_date(date_string,format_string);
  exception
    when others then
    return to_date('1800-1-1','yyyy-mm-dd');
end fun_parse_date;
/

prompt
prompt Creating function FUN_PART_COL
prompt ==============================
prompt
create or replace function sxdxsj.fun_part_col(cus_id in varchar2)
return number
as
begin
  return nvl(to_number(substr(cus_id,14,1)),0);
  exception when others
    then
    return 0;
end;
/

prompt
prompt Creating function FUN_PAY_WAY
prompt =============================
prompt
CREATE OR REPLACE FUNCTION SXDXSJ.FUN_PAY_WAY
(
/**************************************
����������ʼ����(begin_date)���ɷѷ�ʽ(charge_way)
���ж��Ƿ������ڽ�/����״̬
**************************************/
  source_type_code number,
  begin_date in date,
  charge_way in varchar2
) RETURN NUMBER AS
begin
/*
0��������
1������
99��������
*/
if source_type_code = 1 then
    if charge_way='13'  and trunc(months_between(sysdate,begin_date))>13  then  return 1;
    elsif charge_way='13'  and trunc(months_between(sysdate,begin_date))<=13 then return 0;
    elsif charge_way='01'  and trunc(months_between(sysdate,begin_date))>6 then return 1;
    elsif charge_way='01'  and trunc(months_between(sysdate,begin_date))<=6 then return 0;
--elsif charge_way <>'01' and charge_way <> '13' then return 1;
    else return 1;
    end if;
else
    return 99;
end if;
END FUN_PAY_WAY;
/

prompt
prompt Creating function FUN_POLICY_STATUS
prompt ===================================
prompt
CREATE OR REPLACE FUNCTION SXDXSJ.FUN_policy_status
(
  policy_status in varchar2
) RETURN NUMBER AS
begin
/*1:2
2:6,f,F
3:����
4����*/
if policy_status='2' then return 1;
elsif policy_status in('6','f','F') then return 2;
elsif policy_status is not null then return 3;
else return 4;
end if;
END FUN_policy_status;
/

prompt
prompt Creating function FUN_PREINS_AGE_CHECK
prompt ======================================
prompt
create or replace function sxdxsj.fun_preins_age_check(
  i_birthday in varchar2
  )
return varchar2 as
begin
  -- 0-17��  18-25��  26-35��  36-45��  46-55��  51-55�� >55��
  declare age_code varchar2(3);
  age varchar2(8);
  v_date date;
  begin
    begin

      v_date:=to_date(i_birthday,'yyyy-MM-dd');
      dbms_output.put_line(to_char(sysdate,'yyyymmdd'));
      dbms_output.put_line(fun_parse_number(to_char(v_date,'yyyymmdd')));
      age:= to_number(to_char(sysdate,'yyyymmdd'))-fun_parse_number(to_char(v_date,'yyyymmdd'));
    exception
      when others then
      dbms_output.put_line('��������γ���' || sqlerrm(sqlcode));
      age:= '0';
    end;
    case
      when age <=180000
      then
        age_code := '0';
      when age>180000 and age <= 260000
      then
        age_code := '1';
      when age>260000 and age <= 360000
      then
        age_code := '2';
      when age>360000 and age <= 460000
      then
        age_code := '3';
      when age>460000 and age <= 510000
      then
        age_code := '4';
      when age>510000 and age <= 560000
      then
        age_code := '5';
      when age>560000
      then
        age_code := '6';
      else
        age_code := '0';
    end case;
    return (age_code);
  end;
end ;
/

prompt
prompt Creating function FUN_SPLIT_STR
prompt ===============================
prompt
CREATE OR REPLACE FUNCTION SXDXSJ.FUN_SPLIT_STR (p_str IN VARCHAR2, p_delimiter IN VARCHAR2)
    RETURN ty_str_split
IS
    j INT := 0;
    i INT := 1;
    len INT := 0;
    len1 INT := 0;
    str VARCHAR2 (4000);
    str_split ty_str_split := ty_str_split ();            ------����һ������
BEGIN
    len := LENGTH (p_str)+1;
    len1 := LENGTH (p_delimiter);
DBMS_OUTPUT.put_line (p_str);
    WHILE j < len
    LOOP
        j := INSTR (p_str, p_delimiter, i);
DBMS_OUTPUT.put_line (j);

        IF j = 0
        THEN
            j := len;
             str := SUBSTR (p_str, i);
             IF length(trim(to_char(str)))<>0 THEN           -----ȥ������,����Ϊ1��Ϊ����
                str_split.EXTEND;
                str_split (str_split.COUNT) := to_char(str);
             END IF;

            IF i >= len
            THEN
                EXIT;
            END IF;
        ELSE
            str := SUBSTR (p_str, i, j - i);
            i := j + len1;
            IF length(trim(to_char(str)))<>0 THEN            -----ȥ������,����Ϊ1��Ϊ����
               str_split.EXTEND;
                str_split (str_split.COUNT) := to_char(str);
             END IF;
        END IF;
    END LOOP;
    RETURN str_split;
END FUN_SPLIT_STR;
/

prompt
prompt Creating function FUN_TIME_LENGTH
prompt =================================
prompt
CREATE OR REPLACE FUNCTION SXDXSJ.FUN_time_length
(
  seconds in number
) RETURN NUMBER AS
begin
/*
0��1��������
1:1~2����
2:2~5����
3:5��������
*/
  if seconds>=300 then return 3;
  elsif seconds>=120 then return 2;
  elsif seconds>=60 then return 1;
  else  return 0;
  end if;
end;
/

prompt
prompt Creating function FUN_ZONE_TYPE
prompt ===============================
prompt
CREATE OR REPLACE FUNCTION SXDXSJ.FUN_zone_type
(
  zone_type in varchar2
) RETURN NUMBER AS
begin
/*0	����
1	�س�
2	����
3	����*/
case trim(zone_type)
  when '����' then return 0;
  when '�س�' then return 1;
  when '����' then return 2;
  else return 3;
end case;
END FUN_zone_type;
/

prompt
prompt Creating function F_CATSTRING
prompt =============================
prompt
CREATE OR REPLACE FUNCTION SXDXSJ.f_catstring (p_str VARCHAR2)
   RETURN VARCHAR2
   AGGREGATE USING t_stringconcat;
/

prompt
prompt Creating function F_USER
prompt ========================
prompt
CREATE OR REPLACE FUNCTION SXDXSJ.F_USER(T_ORG_ID   IN VARCHAR2,NUM  IN NUMBER)
 RETURN VARCHAR2 IS
--------------------------------------
 /*��ȡ�Ŷӳ�����Ŀ�����Ӧ����
    ���ҷ�*/
  --  NUM=12 ��ȡ�Ŷӳ�ID��11��ȡ��Ŀ����ID
--------------------------------------
  PRATE VARCHAR2(20);
  PRATE2 VARCHAR2(20);
  V_PARENT_ORG_ID VARCHAR2(20);
  V_ROLEID NUMBER;
BEGIN
  --------��ȡ��ǰ����ְ����ɫ
    SELECT TT.ROLEID,TT.PARENT_ORG_ID  INTO V_ROLEID,V_PARENT_ORG_ID
 FROM (SELECT CR.ROLEID,
          T2.PARENT_ORG_ID,
          C.ISDEL,
           ROW_NUMBER() OVER (PARTITION BY T2.PARENT_ORG_ID ORDER BY  C.ISDEL ) NUM
  FROM C_USER_ROLE CR,
       C_USER C,
       TB_ORGANIZATION T2
   WHERE C.ORG_ID=T2.ORG_ID
    AND CR.USERID = C.USERID
    AND CR.ROLEID IN (8,10,11,12)
   AND T2.ORG_ID=T_ORG_ID) TT
  WHERE TT.NUM=1
   GROUP BY  TT.PARENT_ORG_ID,TT.ROLEID;
   --��ȡ��Ч����Ŀ���������
  SELECT nvl((SELECT MAX(C.USERID)
  FROM C_USER_ROLE CR,
       C_USER C,
       TB_ORGANIZATION T2
   WHERE C.ORG_ID=T2.ORG_ID
    AND CR.USERID = C.USERID
    AND CR.ROLEID =NUM
    AND T2.ORG_ID=T_ORG_ID
  AND C.ISDEL='0'),'-1')
  INTO PRATE2
  FROM DUAL;

  -- ��ǰV_ROLEID�ȴ�NUMֵ��󣬷���-1��
  IF V_ROLEID<NUM THEN
     RETURN '-1';
  --��ǰV_ROLEIDֵ����NUMֵ���򷵻�V_USERID
   ELSIF V_ROLEID=NUM THEN
    RETURN PRATE2;
  -- -- ��ǰV_ROLEID�ȴ�NUMֵ��С���ݹ����
   ELSE
      RETURN F_USER(V_PARENT_ORG_ID,NUM);
    END IF;
END F_USER;
/

prompt
prompt Creating function F_WORKPLACE
prompt =============================
prompt
CREATE OR REPLACE FUNCTION SXDXSJ.F_workplace(T_ORG_ID   IN VARCHAR2)
 RETURN VARCHAR2 IS
--------------------------------------
 /*��ȡ�Ŷӳ�����Ŀ�����Ӧ����
    ���ҷ�*/
  --  NUM=12 ��ȡ�Ŷӳ�ID��11��ȡ��Ŀ����ID
--------------------------------------
  PRATE VARCHAR2(20);
BEGIN

  SELECT NVL((SELECT max(c.workplace_id)
               FROM C_USER C
                 WHERE C.ISDEL=0--��Ч����
                 AND C.ORG_ID = T_ORG_ID),
             '-1')
    INTO PRATE
    FROM DUAL;

  RETURN PRATE;
END F_workplace;
/

prompt
prompt Creating function ID_CARD_17TO18
prompt ================================
prompt
CREATE OR REPLACE FUNCTION SXDXSJ.ID_CARD_17TO18(I_ID VARCHAR2)  RETURN VARCHAR AS
  V_ID VARCHAR(30);

  C_YYYYMMDD INTEGER;
  I_YYYYMMDD INTEGER;

  TYPE CHAR_TABLETYPE IS TABLE OF VARCHAR2(1) NOT NULL INDEX BY BINARY_INTEGER;
  TYPE NUM_TABLETYPE  IS TABLE OF NUMBER NOT NULL INDEX BY BINARY_INTEGEr;
  TAB_A CHAR_TABLETYPE;
  TAB_W NUM_TABLETYPE;
  TAB_I CHAR_TABLETYPE;

  SIGMA NUMBER(8) := 0;
BEGIN
    /*========================================================================================
         ��Ȩ��Ϣ����Ȩ����(c) 2010��������ͨ
         �������ƣ�ID_CARD_15TO18
         ����˵����15λ���֤����ת18λ
         ������  : ¬��ƽ
         �汾��  : v1.1.0.0

         �޸���ʷ:
         �汾     ��������:              ������             ����˵��
    ---------------------------------------------------------------------
         v1.0.0.1 2011-03-23 20:00:00    ¬��ƽ
    ========================================================================================*/
   V_ID := I_ID;
   IF REGEXP_INSTR(V_ID,'^[0-9]{17}$',1) = 1  THEN


    TAB_I(0) := '1';
    TAB_I(1) := '0';
    TAB_I(2) := 'X';
    TAB_I(3) := '9';
    TAB_I(4) := '8';
    TAB_I(5) := '7';
    TAB_I(6) := '6';
    TAB_I(7) := '5';
    TAB_I(8) := '4';
    TAB_I(9) := '3';
    TAB_I(10) := '2';
    FOR i IN 1 .. 17 LOOP
    TAB_W(i) := MOD(POWER(2, ((19 - i) - 1)), 11);
    TAB_A(i) := SUBSTR(V_ID, i, 1);
    SIGMA := SIGMA + TAB_W(i) * TAB_A(i);
    END LOOP;
    V_ID := V_ID || TAB_I(MOD(SIGMA, 11));

   END IF;

   RETURN V_ID;
END ID_CARD_17TO18;
/

prompt
prompt Creating function SF_CREATE_STEP
prompt ================================
prompt
create or replace function sxdxsj.sf_create_step(p_step_no number)
return varchar2
as
/*===============================================
by zfyan
date:2012-03-29
===============================================*/
  v_num    number;
  v_return varchar2(10);
begin
  v_num := p_step_no;
  if v_num < 10 then
    v_return := 'STEP_0' || TO_CHAR(V_NUM);
  ELSE
        v_return := 'STEP_' || TO_CHAR(V_NUM);
    END IF;
    return v_return;
end;
/

prompt
prompt Creating procedure PROC_ALL_CUSTOMER_OPERATE
prompt ============================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_ALL_CUSTOMER_OPERATE (
/**********************************************
�������±�����Ϣ��ȫ�����¿ͻ�����
�ͻ�����ر�����Ϣ
***********************************************/
  i_partition_code in number
) as
v_sql varchar2(9000);
vc_PARTITION varchar2(10);
v_start_time timestamp;
o_ret_code number;
begin
   vc_PARTITION :='PART0'||i_partition_code;
   v_start_time:=systimestamp;
   v_sql:='MERGE INTO customer PARTITION ('||vc_PARTITION||') a
   USING (
         select wp.email email
        ,wp.fax fax
        ,wp.reczip zone_code
        ,wp.education_level education_level
        ,wp.income income
        ,wp.govern_id govern_id
        ,wp.update_time update_time
        ,nvl(ps.policy_code,case wp.policy_status when null then 4 else 3 end) policy_status_code
        ,case when wp.account_no is not null then 1 else 0 end bank_status_code
        ,gt.child_branch_code branch_code
        ,gt.phone_code tel_code
        ,nvl(gt.zone_type_code,3)  zone_type_code
        ,nvl(sd.is_branchi_delivery,0)  branch_delivery_code
        ,nvl(sd.is_pos_pay,0)  pay_by_pos_code
        ,nvl(sd.is_bank_proxy,0)  pay_by_bank_code
        ,fun_level_code(wc.SOURCE_TYPE_CODE
        ,nvl(ps.policy_code,case wp.policy_status when null then 4 else 3 end)
        ,nvl(wc.revist_result,0)
        ,wc.age_zone_code
        ,nvl(gt.zone_type_code,3)
        ,case when wp.account_no is not null then 1 else 0 end
        ,case wc.SOURCE_TYPE_CODE when 0 then 0 else 3 end
        ) level_code
        ,wp.begin_date begin_date
        ,wp.charge_way charge_way
        ,wc.customer_id policy_holder_id
   from(
        select customer_id,source_type_code,age_zone_code,revist_result from customer PARTITION ('||vc_PARTITION||')   
   ) wc 
   left join f_latest_policy PARTITION ('||vc_PARTITION||') wp on wc.customer_id=wp.policy_holder_id
   left join help_govern_phone_code gt on trim(wp.govern_id)=gt.govern_id
   left join static_delivery_infor sd on wp.reczip=sd.zone_code
   left join(
      select ''2'' policy_status,1 policy_code from dual
      union all
      select ''6'' policy_status,2 policy_code from dual
      union all
      select ''f'' policy_status,2 policy_code from dual
      union all
      select ''F'' policy_status,2 policy_code from dual
   )ps on wp.policy_status=ps.policy_status
) b
ON (a.customer_id=b.policy_holder_id)
WHEN MATCHED THEN UPDATE SET
    a.email=b.email,
    a.fax=b.fax,
    a.zone_code=b.zone_code,
    a.education_level=b.education_level,
    a.income=b.income,
    a.govern_id=b.govern_id,
    a.update_time=b.update_time,
    a.policy_status_code=b.policy_status_code,
    a.bank_status_code=b.bank_status_code,
    a.branch_code=b.branch_code,
    a.tel_code=b.tel_code,
    a.zone_type_code=b.zone_type_code,
    a.branch_delivery_code=b.branch_delivery_code,
    a.pay_by_pos_code=b.pay_by_pos_code,
    a.pay_by_bank_code=b.pay_by_bank_code,
    a.level_code=b.level_code,
    a.ismeet = FUN_PAY_WAY(a.source_type_code,b.begin_date,b.charge_way)';
execute immediate v_sql;
o_ret_code:=sql%rowcount;
insert into log_information(command_name, command_type, start_time,end_time,  add_number)
values('ȫ���ͻ������,������:'||i_partition_code, '����', v_start_time,systimestamp, o_ret_code);
commit;
exception
  when others then
  rollback;
  o_ret_code:= -1;
   insert into log_information(command_name, command_type, start_time,end_time,  add_number)
   values('ȫ���ͻ������,������:'||i_partition_code, '����', v_start_time,systimestamp, o_ret_code);
end;
/

prompt
prompt Creating procedure PROC_CALENDAR_DAY_LOAD
prompt =========================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_CALENDAR_DAY_LOAD(I_BEGIN_DATE in VARCHAR2,
                                                   I_END_DATE   in VARCHAR2) as
  VT_BEGIN_DATE      DATE;
  VT_END_DATE        DATE;
  VT_DATE            DATE;
  V_DAY_ID           NUMBER(8);
  V_DAY_NM           VARCHAR2(20);
  V_DAY_CODE         DATE;
  V_WEEK_ID          NUMBER(4);
  V_WEEK_NM          VARCHAR2(20);
  V_WEEK_CODE        VARCHAR2(30);
  V_WEEK_DAY         VARCHAR2(10); --���ڼ�
  V_WEEK_MON         VARCHAR2(10); --���µڼ���
  V_TEN_DAY          NUMBER(1); --1��Ϊ��Ѯ��2Ϊ��Ѯ��3Ϊ��Ѯ
  V_TEN_DAY_DESC     VARCHAR2(10); --��Ѯ����Ѯ����Ѯ
  V_MON_ID           NUMBER(9);
  V_MON_NM           VARCHAR2(20);
  V_MON_NUM          NUMBER(2);
  V_QUARTER_ID       NUMBER(9);
  V_QUARTER_NM       VARCHAR2(30);
  V_QUARTER_NUM      NUMBER(1);
  V_YR_ID            NUMBER(4);
  V_YR_NM            VARCHAR2(20);
  V_YEAR_SEGM        VARCHAR2(20); --2001�ϰ���
  V_YEAR_INTERVAL    VARCHAR2(30); --2012-1-1��2011-12-31
  V_QUARTER_INTERVAL VARCHAR2(30); --2012-1-1��2012-3-31
  V_MONTH_INTERVAL   VARCHAR2(30); --2012-2-1��2012-2-29
  V_WEEK_INTERVAL    VARCHAR2(30); --2012-2-2��2012-2-8  ͳ���ܣ���һ������Ϊ����Σ�
  V_WEEK_INTERVAL_ID VARCHAR2(16);

  /*===============================================================+
       ��Ȩ��Ϣ��
       ��ҵ���ƣ�
       ������  : WENGR
       �汾��  : V1.0.0.0
       ����    : �������ݸ����ա��ܡ��¡����ȡ���������򣬲��뵽D_CALENDAR_DIMά����
       ��ע    :
       �޸���ʷ:
       �汾     ��������:              ������             ����˵��
  ---------------------------------------------------------------------

     ================================================================*/

BEGIN
  --ע�⣺������ͨ�����ղ�����ʽֱ�����нű�
  VT_BEGIN_DATE := TO_DATE(I_BEGIN_DATE, 'YYYYMMDD');
  VT_END_DATE   := TO_DATE(I_END_DATE, 'YYYYMMDD');
  VT_DATE       := VT_BEGIN_DATE;

  --- ���ݵ������������������
  DELETE FROM D_CALENDAR_DIM
   WHERE CAL_DAY_ID BETWEEN TO_NUMBER(I_BEGIN_DATE) AND
         TO_NUMBER(I_END_DATE);
  COMMIT;

  LOOP
    IF VT_DATE > VT_END_DATE THEN
      EXIT;
    END IF;
    V_DAY_ID    := TO_NUMBER(SUBSTR(TO_CHAR(VT_DATE, 'YYYYMMDD'), 1, 8));
    V_DAY_CODE  := VT_DATE;
    V_WEEK_ID   := TO_CHAR(VT_DATE, 'WW');
    V_WEEK_NM   := V_WEEK_ID || '��';
    V_YR_ID     := TO_NUMBER(SUBSTR(TO_CHAR(VT_DATE, 'YYYYMMDD'), 1, 4));
    V_YR_NM     := TO_CHAR(V_YR_ID) || '��';
    V_WEEK_CODE := V_YR_NM || '��' || V_WEEK_NM;
    V_MON_ID    := TO_NUMBER(SUBSTR(TO_CHAR(VT_DATE, 'YYYYMMDD'), 1, 6));
    V_MON_NUM   := TO_NUMBER(SUBSTR(TO_CHAR(VT_DATE, 'YYYYMMDD'), 5, 2));
    V_MON_NM    := V_YR_NM || TO_CHAR(V_MON_NUM) || '��';
    V_DAY_NM    := V_MON_NM ||
                   TO_NUMBER(SUBSTR(TO_CHAR(VT_DATE, 'YYYYMMDD'), 7, 2)) || '��';
    IF V_MON_NUM IN (1, 2, 3) THEN
      V_QUARTER_NUM := 1;
    ELSIF V_MON_NUM IN (4, 5, 6) THEN
      V_QUARTER_NUM := 2;
    ELSIF V_MON_NUM IN (7, 8, 9) THEN
      V_QUARTER_NUM := 3;
    ELSE
      V_QUARTER_NUM := 4;
    END IF;

    V_WEEK_DAY   := TO_NUMBER(TO_CHAR(VT_DATE, 'DD'));
    V_WEEK_MON   := TO_CHAR(VT_DATE, 'DAY');
    V_QUARTER_ID := V_YR_ID * 10 + V_QUARTER_NUM;
    V_QUARTER_NM := V_YR_NM || '��' || TO_CHAR(V_QUARTER_NUM) || '����';

    -- Ѯ�ж�
    IF V_WEEK_DAY IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10) THEN
      V_TEN_DAY      := 1;
      V_TEN_DAY_DESC := '��Ѯ';
    ELSIF V_WEEK_DAY IN (11, 12, 13, 14, 15, 16, 17, 18, 19, 20) THEN
      V_TEN_DAY      := 2;
      V_TEN_DAY_DESC := '��Ѯ';
    ELSIF V_WEEK_DAY IN (20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31) THEN
      V_TEN_DAY      := 3;
      V_TEN_DAY_DESC := '��Ѯ';
    END IF;

    -- ��ݶ��ж�
    IF V_QUARTER_NUM IN (1, 2) THEN
      V_YEAR_SEGM := '�ϰ���';
    ELSIF V_QUARTER_NUM IN (3, 4) THEN
      V_YEAR_SEGM := '�°���';
    END IF;

    --- �������ж�
    V_YEAR_INTERVAL := FUN_DATE_INTERVAL(VT_DATE,'Y');
    --- ���������ж�
    V_QUARTER_INTERVAL := FUN_DATE_INTERVAL(VT_DATE,'Q');
    --- �������ж�
    V_MONTH_INTERVAL := FUN_DATE_INTERVAL(VT_DATE,'M');
    --- �������ж�
    V_WEEK_INTERVAL := FUN_DATE_INTERVAL(VT_DATE,'W', 1);
    --- �������ʶ�ж�
    V_WEEK_INTERVAL_ID :=  TO_CHAR(TO_DATE(SUBSTR(FUN_DATE_INTERVAL(VT_DATE,'W',1), 1, 10), 'YYYY-MM-DD'),'YYYYMMDD') ||
        TO_CHAR(TO_DATE(SUBSTR(FUN_DATE_INTERVAL(VT_DATE,'W',1), 12, 10), 'YYYY-MM-DD'),'YYYYMMDD');

    INSERT INTO D_CALENDAR_DIM
      (CAL_DAY_ID,
       CAL_DAY_NM,
       CAL_DAY_CODE,
       CAL_WEEK_ID,
       CAL_WEEK_NM,
       CAL_WEEK_CODE,
       CAL_MON_ID,
       CAL_MON_NM,
       CAL_MON_NUM,
       CAL_TEN_DAY,
       CAL_TEN_DAY_DESC,
       CAL_WEEK_DAY,
       CAL_WEEK_MON,
       CAL_QUARTER_ID,
       CAL_QUARTER_NM,
       CAL_QUARTER_NUM,
       CAL_YR_ID,
       CAL_YR_NM,
       YEAR_SEGM,
       YEAR_INTERVAL,
       QUARTER_INTERVAL,
       MONTH_INTERVAL,
       WEEK_INTERVAL,WEEK_INTERVAL_ID)
    VALUES
      (V_DAY_ID,
       V_DAY_NM,
       V_DAY_CODE,
       V_WEEK_ID,
       V_WEEK_NM,
       V_WEEK_CODE,
       V_MON_ID,
       V_MON_NM,
       V_MON_NUM,
       V_TEN_DAY,
       V_TEN_DAY_DESC,
       V_WEEK_DAY,
       V_WEEK_MON,
       V_QUARTER_ID,
       V_QUARTER_NM,
       V_QUARTER_NUM,
       V_YR_ID,
       V_YR_NM,
       V_YEAR_SEGM,
       V_YEAR_INTERVAL,
       V_QUARTER_INTERVAL,
       V_MONTH_INTERVAL,
       V_WEEK_INTERVAL,V_WEEK_INTERVAL_ID);
    VT_DATE := VT_DATE + 1;
    COMMIT;
  END LOOP;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    NULL;
  WHEN OTHERS THEN
    -- CONSIDER LOGGING THE ERROR AND THEN RE-RAISE
    RAISE;
END PROC_CALENDAR_DAY_LOAD;
/

prompt
prompt Creating procedure PROC_CLEAN_MOBILE
prompt ====================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_CLEAN_MOBILE(
      I_TASK_ID IN NUMBER
    , o_govern_id out varchar2
    , O_SERVICE_TYPE OUT VARCHAR2
    , O_EXT_CODE OUT VARCHAR2
    , O_START_TIME OUT date
    , o_dt out SYS_REFCURSOR
    , O_Updated_Rows Out Number
    , o_customer_count out number
) as
--����洢�����н��õ��ı���
v_sql varchar2(8000);
v_condition varchar2(4000);
v_branch_code number(20);
v_max_id number;
v_og_name varchar2(50);
v_start_time timestamp;
v_process_code number(3);
begin
v_start_time:=systimestamp;
--�������ز�������ʼֵ
o_govern_id:='300000043';--��03000000�޸�Ϊ300000043  by zfyan
o_ext_code:='3035';--��3000�޸�Ϊ3035 by zfyan
o_service_type:='DX-dhqx';--��dhqr�޸�ΪDX-dhqx
o_updated_rows:= 0;
--��ȡ���ֲ������������Ⲧ��������ID������ƽ̨����
begin
  select processcode,nvl(regexp_replace(lower(trim(task_condition)),'^(and( )+)*',''),' 1=1'),fun_find_branch(upper(task_condition)) INTO v_process_code,v_condition,v_branch_code from tasks where id=I_TASK_ID;
  select nvl(max(id),0) into v_max_id from c_cpic_dial;
  select '����'||d_branch_name into v_og_name from d_branch_info where d_branch_code=v_branch_code and rownum=1;
  select nvl(max(sms_send_end_time),max(mobile_begin_dial)) into o_start_time from batch_management;
  if o_start_time<sysdate then
    O_START_TIME:=sysdate;
  end if;
  exception
      when others then
      o_updated_rows:= -1;
      insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
      values('��ϴ�绰���޷���ȡ�绰��ϴ����Ĳ���', '����', v_start_time,systimestamp, o_updated_rows, i_task_id);
end;
--��1������ȡ���д���ϴ�绰����,������ϴ��ʷ��¼���´���ϴ�绰����,Ȼ��������ϴ��ʱ��
if v_process_code=1 and o_updated_rows<> -1 then
  begin
    v_sql:='merge into cleaning_phone cp
    using(
    select '||I_TASK_ID||' batch_code,cus.customer_id, ph.phone,case substr(ph.phone,1,1) when ''1'' then 1 else 0 end is_mobile,nvl(h.dial_result,0) status from
    (
      select customer_id from customer cus
      inner join d_birthdate_month b on cus.BIRTHDATE_MONTH_DAY_CODE=b.BIRTHDATE_MONTH_DAY_CODE
      inner join d_branch_info d on cus.branch_code=d.branch_code
      where clear_status_code=1 and '||v_condition||'
      minus
      select customer_id from filter_red_black where clean_filter=1 and status=1
    ) cus inner join customer_phone ph
    on cus.customer_id=ph.customer_id
    left join clean_phone_history h on ph.phone=h.phone
    where not exists (select 1 from filter_red_black where clean_filter=1 and status=1 and telephone=ph.phone)
    ) td on(cp.phone=td.phone)
    when not matched then
    insert values(td.batch_code, td.customer_id, td.phone, td.is_mobile, td.status)';
    execute immediate v_sql;
    o_updated_rows:=sql%rowcount;
    --����������׶�
    v_process_code:=v_process_code+1;
    update tasks set processcode=v_process_code where id=i_task_id;
    insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
    values('��ϴ�绰������ϴ��ʱ���в������ϴ�绰', '�绰��ϴ', v_start_time,systimestamp, o_updated_rows, i_task_id);
    exception
       when others then
       o_updated_rows:= -1;
       insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
       values('��ϴ�绰������ϴ��ʱ���в������ϴ�绰', '����', v_start_time,systimestamp, o_updated_rows, i_task_id);
       end;
  end if;
--��2������¼��ϴ������Ϣ
if v_process_code=2 and o_updated_rows<> -1 then
  begin
      insert all
      into nuance_batch(batch_code,batch_description,total_count,clean_status,begin_id,end_id,send_clean_tel_count,begin_dial)
      values(i_task_id,batch_description,total_count-mobile_count,0,v_max_id+1,send_clean_tel_count+v_max_id,send_clean_tel_count,sysdate)
      into batch_management(batch_code,clean_status,mobile_dial_status,tel_dial_status,mobile_begin_dial,tel_begin_dial,commit_time,init_count,init_mobile_count,init_tel_count,send_clean_mobile_count,send_clean_tel_count)
      values(i_task_id,0,0,0,O_START_TIME,sysdate,sysdate,total_count,mobile_count,total_count-mobile_count,send_clean_mobile_count,send_clean_tel_count)
      select count(1) total_count,sum(is_mobile) mobile_count
      ,sum(case when is_mobile=1 and status=0 then 1 else 0 end) send_clean_mobile_count
      ,sum(case when is_mobile=0 and status=0 then 1 else 0 end) send_clean_tel_count
      ,max(batch_description) batch_description
      from cleaning_phone
      ,(
        select max(d_branch_name) batch_description from d_branch_info where d_branch_code=v_branch_code
      ) --batch_description
      where batch_code=i_task_id ;
      o_updated_rows:=sql%rowcount;
    --����������׶�
    v_process_code:=v_process_code+1;
    update tasks set processcode=v_process_code where id=i_task_id;
    insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
    VALUES('��ϴ�绰���������ϴ�绰������Ϣ', '�绰��ϴ', v_start_time,systimestamp, o_updated_rows, i_task_id);
    exception
       when others then
       o_updated_rows:= -1;
       insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
       values('��ϴ�绰���������ϴ�绰������Ϣ', '����', v_start_time,systimestamp, o_updated_rows, i_task_id);
       end;
end if;
--��3�����Ѵ���ϴ�̻������Ⲧ��
if v_process_code=3 and  o_updated_rows<> -1 then
  begin
    insert all
    into c_cpic_dial(id,card_id,zipcode,addr,pro,ftel,fgs_code)
    values(v_max_id+c_id,customer_id,family_zip_code,family_address,province,phone,branch_abbreviation)
    into shcpic_outdata(out_id,phonenum)
    values((v_max_id+c_id)||'a',phone)
    select rownum c_id, p.customer_id,cus.family_zip_code,cus.family_address,substr(cus.province,1,6) province,p.phone,d.branch_abbreviation
    from cleaning_phone p inner join customer cus
    on p.customer_id=cus.customer_id inner join d_branch_info d on d.branch_code=cus.branch_code
    where p.batch_code=i_task_id and p.status=0 and p.is_mobile=0;
    o_updated_rows:=sql%rowcount;
    --����������׶�
    v_process_code:=v_process_code+1;
    update tasks set processcode=v_process_code where id=i_task_id;
    insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
    VALUES('��ϴ�绰�����Ⲧ���в������ϴ�绰', '�绰��ϴ', v_start_time,systimestamp, o_updated_rows, i_task_id);
    exception
       when others then
       o_updated_rows:= -1;
       insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
       values('��ϴ�绰�����Ⲧ���в������ϴ�绰', '����', v_start_time,systimestamp, o_updated_rows, i_task_id);
       end;
end if;
--��4�������¿ͻ���ϴ״̬
if v_process_code=4 AND o_updated_rows<> -1 then
  begin
        merge into customer cus
        using(
            select distinct customer_id from cleaning_phone where batch_code=i_task_id
        )nc on(cus.customer_id=nc.customer_id)
        when matched then
        update set CUS.CLEAR_STATUS_CODE=2;
    o_updated_rows:=sql%rowcount;
    --����������׶�
    v_process_code:=v_process_code+1;
    update tasks set processcode=v_process_code where id=i_task_id;
    insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
    VALUES('��ϴ�绰�����¿ͻ�״̬', '�绰��ϴ', v_start_time,systimestamp, o_updated_rows, i_task_id);
    exception
       when others then
       o_updated_rows:= -1;
       insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
       values('��ϴ�绰�����¿ͻ�״̬', '����', v_start_time,systimestamp, o_updated_rows, i_task_id);
       end;
end if;
--��5�������ش���ϴ�ֻ�����
if v_process_code=5 and  o_updated_rows<> -1 then
  begin
    --����������׶�
    v_process_code:=v_process_code+1;
    Update Tasks Set Processcode=V_Process_Code Where Id=I_Task_Id;
    Select Sum(case when cp.is_mobile=1 then 1 else 0 end),Count(Distinct Customer_Id) INTO O_Updated_Rows,O_Customer_Count
    from cleaning_phone cp,(select message_content from sms_message_library where active=1 and rownum=1) WHERE cp.batch_code=i_task_id;
    open o_dt for
    select distinct phone,sms.message_content from cleaning_phone cp,(select message_content from sms_message_library where active=1 and rownum=1) sms
    where cp.batch_code=i_task_id and cp.status=0 and cp.is_mobile=1;
    exception
       when others then
       o_updated_rows:= -1;
       insert into log_information(command_name, command_type,start_time,end_time,update_number,condition_id)
       VALUES('��ϴ�绰�����ش���ϴ�ֻ�����', '����', v_start_time,systimestamp, o_updated_rows, i_task_id);
    end;
end if;
end ;
/

prompt
prompt Creating procedure SP_LOG_EXEC_AFT
prompt ==================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.SP_LOG_EXEC_AFT(
    P_PROC_NAME            IN                VARCHAR2
   ,P_STEP_NO              IN                VARCHAR2
   ,P_ROW_NUM              IN                NUMBER
   ,P_BEGIN_TIME           IN                DATE
)
AS
/*============================================================
��¼�洢���̽�����־
BY ZFYAN  2012-03-28
==============================================================*/
    V_PROC_NAME                   VARCHAR2(50);
    V_STEP_NO                     VARCHAR2(20);
    V_ROW_NUM                     NUMBER;
    V_BEGIN_TIME                  DATE;
BEGIN
    V_PROC_NAME                := P_PROC_NAME;
    V_STEP_NO                  := P_STEP_NO;
    V_ROW_NUM                  := P_ROW_NUM;
    V_BEGIN_TIME               := P_BEGIN_TIME;

    UPDATE LOG_TRACE_STAT
       SET END_TIME = SYSDATE
          ,ROW_NUM = V_ROW_NUM
          ,ELAPSED = (SYSDATE - BEGIN_TIME) * 24 * 60 * 60
     WHERE PROC_NAME = V_PROC_NAME
       AND STEP_NO = V_STEP_NO
       AND BEGIN_TIME = V_BEGIN_TIME;

    COMMIT;
END;
/

prompt
prompt Creating procedure SP_LOG_EXEC_BEF
prompt ==================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.SP_LOG_EXEC_BEF(
    P_PROC_NAME                   IN       VARCHAR2
   ,P_STEP_NO                     IN       VARCHAR2
   ,P_WORK_DATE                   IN       NUMBER
   ,P_STEP_DESC                   IN       VARCHAR2
   ,P_BEGIN_TIME                  IN       DATE
   ,P_REPORT_ID                   IN       NUMBER
)
AS
/*===========================================================
   * ���������� ��¼�洢������־
     * ���������
     * ���������
     * ��д��Ա�� yzf
     * �������ڣ� 2012-03-28
     * ��˾���ƣ�
===========================================================*/
    V_PROC_NAME                   VARCHAR2(50);
    V_STEP_NO                     VARCHAR2(20);
    V_WORK_DATE                   NUMBER;
    V_STEP_DESC                   VARCHAR2(200);
    V_BEGIN_TIME                  DATE;
    V_REPORT_ID                   NUMBER;
BEGIN
    V_PROC_NAME                := P_PROC_NAME;
    V_STEP_NO                  := P_STEP_NO;
    V_WORK_DATE                := P_WORK_DATE;
    V_STEP_DESC                := P_STEP_DESC;
    V_BEGIN_TIME               := P_BEGIN_TIME;
    V_REPORT_ID                := P_REPORT_ID;

    INSERT INTO LOG_TRACE_STAT
                (PROC_NAME
                ,STEP_NO
                ,BEGIN_TIME
                ,WORK_DATE
                ,STEP_DESC
                ,REPORT_ID
                )
         VALUES (V_PROC_NAME
                ,V_STEP_NO
                ,V_BEGIN_TIME
                ,V_WORK_DATE
                ,V_STEP_DESC
                ,V_REPORT_ID
                );

    COMMIT;
END;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_DAY_1
prompt ========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_DAY_1( STAT_DATE in NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
   V_REPORT_ID                   NUMBER :=0;                       --�������
   V_DAY                         NUMBER := STAT_DATE;  --����ʱ��
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_DAY_1'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   --ERR_NUM                       NUMBER := 0;
   -- ERR_MSG                        VARCHAR2 (200);
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_DATE)||' 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_DATE)||' 23:59:59','YYYY-MM-DD HH24:MI:SS');  --��������
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_1';
  --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�����ײ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;

   insert into  TEMP_TA_SALES_RPT_1(
      PAY_MODE,   ACTV_ID ,   BAT_ID, COM_TYP, BAT_PRJT , COMP_ID ,
      ORG_TYP  , City_Id,     WP_ID   , PRJT_MGR_ID  , TEM_LEAD_ID ,
    USER_ID ,  FST_CAL_LIST_QTY
    )
 WITH V_TASK_H AS(
SELECT
 -1                  AS HISTORY_ID
,T1.TASK_ID              AS TASK_ID
--,T1.CREATE_TIME          AS CREATE_TIME
,T1.CHANGE_TIME          AS CHANGE_TIME
--,T1.FIRST_RESULT         AS FIRST_RESULT
--,T1.SECOND_RESULT        AS SECOND_RESULT
,T1.USER_ID              AS USER_ID
,T1.ORG_ID               AS ORG_ID
,T1.STATUS_ID            AS STATUS_ID
,T1.TYPE_ID              AS TYPE_ID
--,T1.POLICY_ID            AS POLICY_ID
,T1.OB_COM_ID            AS OB_COM_ID
,T1.BATCH_ID             AS BATCH_ID
,T1.CUS_LIST_ID          AS CUS_LIST_ID
,T1.CHANGE_TIME          AS CREATE_HISTORY_DATE
FROM TB_TASK T1
WHERE T1.CHANGE_TIME >= V_BEG_DATE
AND T1.CHANGE_TIME <= V_END_DATE
AND T1.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
AND T1.TYPE_ID<>'4'--�������� �ײ�
UNION ALL
 SELECT
 T2.HISTORY_ID           AS HISTORY_ID
,T2.TASK_ID              AS TASK_ID
--,T2.CREATE_TIME          AS CREATE_TIME
,T2.CHANGE_TIME          AS CHANGE_TIME
--,T2.FIRST_RESULT         AS FIRST_RESULT
--,T2.SECOND_RESULT        AS SECOND_RESULT
,T2.USER_ID              AS USER_ID
,T2.ORG_ID               AS ORG_ID
,T2.STATUS_ID            AS STATUS_ID
,T2.TYPE_ID              AS TYPE_ID
--,T2.POLICY_ID            AS POLICY_ID
,T2.OB_COM_ID            AS OB_COM_ID
,T2.BATCH_ID             AS BATCH_ID
,T2.CUS_LIST_ID          AS CUS_LIST_ID
,T2.CHANGE_TIME  AS CREATE_HISTORY_DATE
FROM TB_TASK_HISTORY T2
WHERE T2.CHANGE_TIME >= V_BEG_DATE
AND T2.CHANGE_TIME <= V_END_DATE
AND T2.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T2.TYPE_ID<>'4'--�������� �ײ�
--to_date(CREATE_HISTORY_DATE) =to_date( STAT_DATE, 'yyyymmdd')
)
    SELECT
       '-1' as PAYMODE,  --���ѷ�ʽ
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME, --���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T1.ORG_ID,--��֯����
       T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ�����
       T1.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T1.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T1.USER_ID, --��ϯ����
       COUNT(DISTINCT T1.CUS_LIST_ID) as FST_CAL_LIST_QTY--����
        FROM V_TASK_H T1
       --inner join  TB_TASK T3  on T1.TASK_ID=T3.TASK_ID
       inner join  TB_SALE_BATCH  T2 on T1.BATCH_ID=T2.BATCH_ID
       inner join  TB_OB_COM  T4 on T4.OB_COM_ID=T1.OB_COM_ID
       inner join  C_USER  T5 on  T5.USERID=T1.USER_ID  AND T5.ORG_ID=T1.ORG_ID
 WHERE
   T1.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T1.TYPE_ID<>'4'--�������� �ײ�
   AND EXISTS
      (SELECT NULL
        FROM TB_TASK_HISTORY TT
             WHERE
                  TT.TASK_ID=T1.TASK_ID
                  AND TT.STATUS_ID='6'
                  AND TT.TYPE_ID='4'
                  AND TO_CHAR(TT.CREATE_HISTORY_DATE,'YYYYMMDD')=TO_CHAR(T1.CREATE_HISTORY_DATE,'YYYYMMDD')--���ײ�״̬�ı�ʱ����ύ����С��ʱ����ͬһ��
                  )
   --AND to_date(to_char(T1.CREATE_HISTORY_DATE, 'yyyymmdd'), 'yyyymmdd') =to_date( STAT_DATE, 'yyyymmdd')
   GROUP BY
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME, --���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T1.ORG_ID,--��֯����
       T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ�����
       T1.ORG_ID ,--��Ŀ������
       T1.ORG_ID ,  ---�Ŷӳ����
       T1.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;
   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_DAY_1;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_DAY_10
prompt =========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_DAY_10(STAT_DATE in NUMBER,
                                                   ERR_NUM   OUT NUMBER,
                                                   ERR_MSG   OUT VARCHAR2) is
  V_REPORT_ID  NUMBER := 0; --�������
  V_DAY			 NUMBER := STAT_DATE;  --����ʱ�� 
  V_PROC_NAME  VARCHAR2(50) := 'SP_TA_SALES_RPT_DAY_10'; --��ǰ��������
  V_STEP       NUMBER := 0; --ִ�в�����ų�ʼֵ
  V_STEP_NO    VARCHAR2(10); --ִ�в���
  V_STEP_DESC  VARCHAR2(200); --��������
  V_ROW_NUM    NUMBER; --SQLִ��Ӱ��ļ�¼��
  V_BEGIN_TIME DATE; --SQL��ʼִ�е�ʱ��
  V_END_TIME   DATE; --SQLִ�н���ʱ��
  --ERR_NUM                       NUMBER := 0;
  --ERR_MSG                        VARCHAR2 (200);
BEGIN
  --���ڲ����Ƿ�Ϊ���ж�
  IF STAT_DATE IS NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'STAT_DATE IS NULL!');
  END IF;

  --�����������
  EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_10';
         --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�������ڿۿ�ɹ��� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;

  insert into TEMP_TA_SALES_RPT_10
    (PAY_MODE,
     ACTV_ID,
     BAT_ID,
     COM_TYP,
     BAT_PRJT,
     COMP_ID,
     ORG_TYP,
     City_Id,
     WP_ID,
     PRJT_MGR_ID,
     TEM_LEAD_ID,
     USER_ID,
     FST_CHARGBK_SUCC_QTY)
    SELECT '-1' as PAY_MODE,
           T4.OB_COM_NAME, --�ID
           T2.BATCH_NAME, ---���α���
           T2.COM_TYPE, --�������ࣨ�¶������������н飩
           T4.PRJ_ID, --������Ŀ
           T4.COMPANY_ID, --�ֹ� 
           T3.ORG_ID, --����
           T2.BELONGCITY, --��������
           nvl(T5.WORKPLACE_ID, '-1'), --ְ��ID
           T5.ORG_ID, --��Ŀ������
           T5.ORG_ID, ---�Ŷӳ����
           T3.USER_ID, --��ϯ����
           COUNT(DISTINCT Z.POLICYNO) AS KKBJ
      FROM PREREC        Z,
           RISKCON       T1,
           TB_SALE_BATCH T2,
           TB_TASK       T3,
           TB_OB_COM     T4,
           C_USER        T5
    /*  FROM PREREC Z inner join RISKCON T1 on  Z.POLICYNO = T1.POLICYNO AND Z.CLASSCODE=T1.CLASSCODE --����ʵ�ձ�--���˱�����
    inner join TB_SALE_BATCH  T2 on T2.BATCH_ID=T3.BATCH_ID
    inner join TB_TASK T3 on T1.APPNO=T3.POLICY_ID
    inner join TB_OB_COM T4 on T4.OB_COM_ID=T3.OB_COM_ID 
    inner join C_USER  T5 on T3.USER_ID=T5.USERID AND  T3.ORG_ID=T5.ORG_ID    */
     WHERE Z.POLICYNO = T1.POLICYNO
       AND Z.CLASSCODE = T1.CLASSCODE
       AND T2.BATCH_ID = T3.BATCH_ID
       AND T1.APPNO = T3.POLICY_ID
       AND T4.OB_COM_ID = T3.OB_COM_ID
       AND T3.USER_ID = T5.USERID
       AND T3.ORG_ID = T5.ORG_ID
       AND Z.PCODE NOT IN ('Z', 'X', 'Y', '6', 'M')
       AND Z.SETCODE <> '9'
       AND T1.SALEATTR IN ('61', '62', '63', '64') --���������������ܹ�˾���ֹ�˾
          --AND Z.YEARNO = 1--�����
       AND Z.PCODE = '2' --�շ�
          --AND Z.DEPTCODE IS NOT NULL
       AND Z.PAYDATE = TO_DATE(TO_CHAR(Z.POPULATION_TSMP,'YYYYMMDD'),'YYYY-MM-DD')-(TO_DATE(TO_CHAR(Z.POPULATION_TSMP,'YYYYMMDD'),'YYYY-MM-DD')-Z.PAYDATE)
       AND TO_DATE(TO_CHAR(Z.POPULATION_TSMP,'YYYYMMDD'),'YYYY-MM-DD')=to_date(STAT_DATE, 'yyyymmdd')+1  
    GROUP BY T4.OB_COM_NAME, --�ID
              T2.BATCH_NAME, ---���α���
              T4.PRJ_ID, --������Ŀ
              T2.COM_TYPE, --�������ࣨ�¶������������н飩
              T4.COMPANY_ID, --�ֹ� 
              T3.ORG_ID, --����
              T2.BELONGCITY, --��������
              nvl(T5.WORKPLACE_ID, '-1'), --ְ��ID
              T5.ORG_ID, --��Ŀ������
              T5.ORG_ID, ---�Ŷӳ����
              T3.USER_ID --��ϯ����
    ;

  V_ROW_NUM := SQL%ROWCOUNT;
  COMMIT;
  --��¼��־����
  SP_LOG_EXEC_AFT(V_PROC_NAME, V_STEP_NO, V_ROW_NUM, V_BEGIN_TIME);

  ERR_NUM := 0;
  ERR_MSG := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;
      
      COMMIT;
  
end SP_TA_SALES_RPT_DAY_10;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_DAY_11
prompt =========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_DAY_11(STAT_DATE in NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
  V_DAY			                   NUMBER := STAT_DATE;  --����ʱ�� 
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_DAY_11'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   --ERR_NUM                       NUMBER := 0;
  -- ERR_MSG                        VARCHAR2 (200);
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_11';
    --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�����껯�±����� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;
   INSERT INTO TEMP_TA_SALES_RPT_11
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,ANNUL_FST_PRM_PRM)
    SELECT 
       Z.PAYCODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���     
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����
       SUM(DISTINCT NVL((CASE
             WHEN Z.PCODE = '2' AND
                  Z.YEARNO = 1 AND
                  Z.PAYCODE = '10' THEN
              T1.NPAYLEN * T1.PIECES * 12
             WHEN Z.PCODE = '2' AND
                  PAYCODE = '11' THEN
              T1.NPAYLEN * T1.PIECES * 4
             WHEN Z.PCODE = '2' AND
                  Z.PAYCODE = '12' THEN
              T1.NPAYLEN * T1.PIECES * 2
             WHEN Z.PCODE = '2' AND
                  Z.PAYCODE = '13' THEN
             T1.NPAYLEN * T1.PIECES * 1
             ELSE
              0 END), 0)) +
               SUM(DISTINCT NVL((CASE
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '10' THEN
                  T1.NPAYLEN * T1.PIECES * -12
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '11' THEN
                  T1.NPAYLEN * T1.PIECES * -4
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '12' THEN
                  T1.NPAYLEN * T1.PIECES * -2
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '13' THEN
                  T1.NPAYLEN * T1.PIECES * -1
                 ELSE
                  0 END),0)) NHAMOUNT
  FROM PREREC  Z INNER JOIN RISKCON T1 ON Z.POLICYNO = T1.POLICYNO AND Z.CLASSCODE = T1.CLASSCODE --����ʵ�ձ�
       INNER JOIN  TB_TASK T3 ON T1.APPNO=T3.POLICY_ID
       INNER JOIN TB_SALE_BATCH  T2 ON T2.BATCH_ID=T3.BATCH_ID
       INNER JOIN TB_OB_COM  T4 ON T4.OB_COM_ID=T3.OB_COM_ID
       INNER JOIN C_USER  T5 ON T3.USER_ID=T5.USERID AND T3.ORG_ID=T5.ORG_ID
  WHERE 
    Z.PCODE NOT IN ('Z', 'X', 'Y', '6', 'M')
   AND Z.SETCODE <> '9'
   AND T1.SALEATTR IN ('61', '62', '63', '64')--���������������ܹ�˾���ֹ�˾
   AND Z.PCODE IN('8', '2')--�շ�
   --AND Z.DEPTCODE IS NOT NULL
   AND Z.PAYDATE = TO_DATE(TO_CHAR(Z.POPULATION_TSMP,'YYYYMMDD'),'YYYY-MM-DD')-(TO_DATE(TO_CHAR(Z.POPULATION_TSMP,'YYYYMMDD'),'YYYY-MM-DD')-Z.PAYDATE)
   AND TO_DATE(TO_CHAR(Z.POPULATION_TSMP,'YYYYMMDD'),'YYYY-MM-DD')=to_date(STAT_DATE, 'yyyymmdd')+1  
   GROUP BY 
       Z.PAYCODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID,--��Ŀ������
       T5.ORG_ID ,  ---�Ŷӳ����
       T3.USER_ID --��ϯ����
       ;
   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;
   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_DAY_11;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_DAY_12
prompt =========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_DAY_12(STAT_DATE in NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_DAY_12'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DAY			                   NUMBER := STAT_DATE;  --����ʱ�� 
  -- ERR_NUM                       NUMBER := 0;
  -- ERR_MSG                        VARCHAR2 (200);
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_12';
            --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '����ʵ���±����� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;
   INSERT INTO TEMP_TA_SALES_RPT_12
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,ACTL_FST_PRM_PRM)
    SELECT 
      '-1' as PAY_MODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������	
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID  
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����
       SUM(DISTINCT NVL((CASE WHEN Z.PCODE = '2' AND Z.YEARNO = 1 
                     THEN Z.AMOUNT
                     ELSE 0
                     END),0)) + SUM(DISTINCT NVL(
                (CASE WHEN Z.PCODE = '8' AND Z.YEARNO = 1 
                        THEN Z.AMOUNT
                        ELSE 0
                        END),0)) + SUM(NVL(
                (CASE WHEN Z.PCODE NOT IN ('8', '2') AND Z.YEARNO = 1
                      THEN Z.AMOUNT               --�޸Ľ�תȡֵ����
                      ELSE 0
                      END),0)) SSAMOUNT
  FROM PREREC  Z inner join RISKCON T1 on Z.POLICYNO = T1.POLICYNO AND Z.CLASSCODE = T1.CLASSCODE
       inner join TB_TASK  T3 on   T1.APPNO=T3.POLICY_ID
       inner join TB_SALE_BATCH   T2 on T2.BATCH_ID=T3.BATCH_ID
       inner join TB_OB_COM     T4 on T4.OB_COM_ID=T3.OB_COM_ID
       inner join C_USER        T5 on T3.USER_ID=T5.USERID and T3.ORG_ID=T5.ORG_ID
 WHERE 
   Z.PCODE NOT IN ('Z', 'X', 'Y', '6', 'M')
   AND Z.SETCODE <> '9'
   AND T1.SALEATTR IN ('61', '62', '63', '64')--���������������ܹ�˾���ֹ�˾
   --AND Z.DEPTCODE IS NOT NULL
   AND Z.PAYDATE = TO_DATE(TO_CHAR(Z.POPULATION_TSMP,'YYYYMMDD'),'YYYY-MM-DD')-(TO_DATE(TO_CHAR(Z.POPULATION_TSMP,'YYYYMMDD'),'YYYY-MM-DD')-Z.PAYDATE)
   AND TO_DATE(TO_CHAR(Z.POPULATION_TSMP,'YYYYMMDD'),'YYYY-MM-DD')=TO_DATE(STAT_DATE, 'YYYYMMDD')+1  
   GROUP BY 
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������	
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID     
       T5.ORG_ID,--��Ŀ������
       T5.ORG_ID,  ---�Ŷӳ����
       T3.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_DAY_12;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_DAY_13
prompt =========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_DAY_13(STAT_DATE in varchar2
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_DAY_13'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DAY			                   NUMBER := STAT_DATE;  --����ʱ��
  -- ERR_NUM                       NUMBER := 0;
   --ERR_MSG                        VARCHAR2 (200);
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_13';
          --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '������ԥ���˱����������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;

   INSERT INTO TEMP_TA_SALES_RPT_13
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,CNCL_QTY
       ,CNCL_PRM)
   SELECT Z.PAYCODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����
        COUNT(DISTINCT(CASE  WHEN Z.PCODE = '8' AND Z.YEARNO = 1
                             THEN Z.POLICYNO
                             END)) * 1   AS YTBJ,
                   --���˱���
                   SUM(DISTINCT NVL((CASE
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '10' THEN
                                T1.NPAYLEN * T1.PIECES * 12
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '11' THEN
                                T1.NPAYLEN * T1.PIECES * 4
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '12' THEN
                                T1.NPAYLEN * T1.PIECES * 2
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '13' THEN
                                T1.NPAYLEN * T1.PIECES * 1
                               ELSE
                                0
                           END),
                           0)) YTAMOUNT
  FROM PREREC  Z  inner join RISKCON T1 on Z.POLICYNO = T1.POLICYNO
       inner join TB_TASK  T3 on T1.APPNO=T3.POLICY_ID
       inner join TB_SALE_BATCH  T2 on T2.BATCH_ID=T3.BATCH_ID
       inner join TB_OB_COM  T4 on T4.OB_COM_ID=T3.OB_COM_ID
       inner join C_USER T5  on T3.User_Id = T5.USERID and T3.Org_Id = T5.Org_Id
 WHERE Z.PCODE NOT IN ('Z', 'X', 'Y', '6', 'M')
   AND Z.PCODE = '8'
   AND Z.SETCODE <> '9'
   AND T1.SALEATTR IN ('61', '62', '63', '64')--���������������ܹ�˾���ֹ�˾
  -- AND Z.DEPTCODE IS NOT NULL
    AND Z.PAYDATE = TO_DATE(TO_CHAR(Z.POPULATION_TSMP,'YYYYMMDD'),'YYYY-MM-DD')-(TO_DATE(TO_CHAR(Z.POPULATION_TSMP,'YYYYMMDD'),'YYYY-MM-DD')-Z.PAYDATE)
    AND TO_DATE(TO_CHAR(Z.POPULATION_TSMP,'YYYYMMDD'),'YYYY-MM-DD')=to_date(STAT_DATE, 'yyyymmdd')+1  
  
   GROUP BY
       Z.PAYCODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID ,  ---�Ŷӳ����
       T3.USER_ID
       ;
   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
 EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;
end SP_TA_SALES_RPT_DAY_13;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_DAY_2
prompt ========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_DAY_2(STAT_DATE in NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_DAY_2'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DAY			                   NUMBER := STAT_DATE;  --����ʱ��
   --ERR_NUM                       NUMBER := 0;
   --ERR_MSG                        VARCHAR2 (200);
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_DATE)||' 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_DATE)||' 23:59:59','YYYY-MM-DD HH24:MI:SS');  --��������
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_2';
  --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�����ײ��Ӵ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;

   INSERT INTO TEMP_TA_SALES_RPT_2
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,USER_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,FST_CAL_CONT_LIST_QTY)
  WITH V_TASK_H AS(
SELECT
 -1                  AS HISTORY_ID
,T1.TASK_ID              AS TASK_ID
--,T1.CREATE_TIME          AS CREATE_TIME
,T1.CHANGE_TIME          AS CHANGE_TIME
--,T1.FIRST_RESULT         AS FIRST_RESULT
--,T1.SECOND_RESULT        AS SECOND_RESULT
,T1.USER_ID              AS USER_ID
,T1.ORG_ID               AS ORG_ID
,T1.STATUS_ID            AS STATUS_ID
,T1.TYPE_ID              AS TYPE_ID
--,T1.POLICY_ID            AS POLICY_ID
,T1.OB_COM_ID            AS OB_COM_ID
,T1.BATCH_ID             AS BATCH_ID
,T1.CUS_LIST_ID          AS CUS_LIST_ID
,T1.CHANGE_TIME          AS CREATE_HISTORY_DATE
FROM TB_TASK T1
WHERE T1.CHANGE_TIME >= V_BEG_DATE
AND T1.CHANGE_TIME <= V_END_DATE
AND T1.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
AND T1.TYPE_ID<>'4'--�������� �ײ�
UNION ALL
 SELECT
 T2.HISTORY_ID           AS HISTORY_ID
,T2.TASK_ID              AS TASK_ID
--,T2.CREATE_TIME          AS CREATE_TIME
,T2.CHANGE_TIME          AS CHANGE_TIME
--,T2.FIRST_RESULT         AS FIRST_RESULT
--,T2.SECOND_RESULT        AS SECOND_RESULT
,T2.USER_ID              AS USER_ID
,T2.ORG_ID               AS ORG_ID
,T2.STATUS_ID            AS STATUS_ID
,T2.TYPE_ID              AS TYPE_ID
--,T2.POLICY_ID            AS POLICY_ID
,T2.OB_COM_ID            AS OB_COM_ID
,T2.BATCH_ID             AS BATCH_ID
,T2.CUS_LIST_ID          AS CUS_LIST_ID
,T2.CHANGE_TIME  AS CREATE_HISTORY_DATE
FROM TB_TASK_HISTORY T2
WHERE T2.CHANGE_TIME >= V_BEG_DATE
AND T2.CHANGE_TIME <= V_END_DATE
AND T2.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T2.TYPE_ID<>'4'--�������� �ײ�
--to_date(CREATE_HISTORY_DATE) =to_date( STAT_DATE, 'yyyymmdd')
)
    SELECT
      '-1' as PAY_MODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME, --���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ�����
       T3.USER_ID, --��ϯ����,
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       COUNT(DISTINCT T1.CUS_LIST_ID)--����
  FROM TB_SALE_HISTORY T1
       inner join  V_TASK_H T3 on T1.TASK_ID=T3.TASK_ID
       inner join TB_SALE_BATCH  T2 on T2.BATCH_ID=T3.BATCH_ID
       inner join TB_OB_COM  T4 on T4.OB_COM_ID=T1.OBCOM_ID
       inner join  C_USER  T5  on T5.USERID=T3.USER_ID  and T5.ORG_ID=T3.ORG_ID

 WHERE  T3.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
     AND T3.TYPE_ID<>'4'--�������� �ײ�
     AND T1.IS_CONTACT='1'--�Ӵ������0��δ�Ӵ���1���ѽӴ���
     AND EXISTS
      (SELECT NULL
        FROM TB_TASK_HISTORY TT
             WHERE TT.TASK_ID=T3.TASK_ID
                  AND TT.STATUS_ID='6'
                  AND TT.TYPE_ID='4'
                  AND TO_CHAR(TT.CREATE_HISTORY_DATE,'YYYYMMDD')=TO_CHAR(T3.CREATE_HISTORY_DATE,'YYYYMMDD')--���ײ�״̬�ı�ʱ����ύ����С��ʱ����ͬһ��
                  )
   --AND TO_DATE(T3.CREATE_HISTORY_DATE) =to_date(STAT_DATE, 'yyyymmdd')
   GROUP BY
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME, --���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ�����
       T3.USER_ID, --��ϯ����,
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID
       ;
   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_DAY_2;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_DAY_3
prompt ========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_DAY_3(STAT_DATE in NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_DAY_3'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DAY			                   NUMBER := STAT_DATE;  --����ʱ��
  -- ERR_NUM                       NUMBER := 0;
  -- ERR_MSG                        VARCHAR2 (200);
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_DATE)||' 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_DATE)||' 23:59:59','YYYY-MM-DD HH24:MI:SS');  --��������
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_3';
    --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '���� ���������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;

   INSERT INTO TEMP_TA_SALES_RPT_3
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,TRK_LIST_QTY)
    WITH V_TASK_H AS(
SELECT
 -1                   AS HISTORY_ID
,T1.TASK_ID              AS TASK_ID
--,T1.CREATE_TIME          AS CREATE_TIME
,T1.CHANGE_TIME          AS CHANGE_TIME
--,T1.FIRST_RESULT         AS FIRST_RESULT
--,T1.SECOND_RESULT        AS SECOND_RESULT
,T1.USER_ID              AS USER_ID
,T1.ORG_ID               AS ORG_ID
,T1.STATUS_ID            AS STATUS_ID
,T1.TYPE_ID              AS TYPE_ID
--,T1.POLICY_ID            AS POLICY_ID
,T1.OB_COM_ID            AS OB_COM_ID
,T1.BATCH_ID             AS BATCH_ID
,T1.CUS_LIST_ID          AS CUS_LIST_ID
,T1.CHANGE_TIME          AS CREATE_HISTORY_DATE
FROM TB_TASK T1
WHERE --TO_DATE(CHANGE_TIME)=to_date(STAT_DATE, 'yyyymmdd')
      T1.CHANGE_TIME >= V_BEG_DATE 
   AND T1.CHANGE_TIME <= V_END_DATE
   AND TYPE_ID='2' --�������� 2��������������
   AND T1.TYPE_ID<>'4'--��ǰ�������Ͳ�Ϊ�ײ�����
UNION ALL
 SELECT
 T2.HISTORY_ID           AS HISTORY_ID
,T2.TASK_ID              AS TASK_ID
--,T2.CREATE_TIME          AS CREATE_TIME
,T2.CHANGE_TIME          AS CHANGE_TIME
--,T2.FIRST_RESULT         AS FIRST_RESULT
--,T2.SECOND_RESULT        AS SECOND_RESULT
,T2.USER_ID              AS USER_ID
,T2.ORG_ID               AS ORG_ID
,T2.STATUS_ID            AS STATUS_ID
,T2.TYPE_ID              AS TYPE_ID
--,T2.POLICY_ID            AS POLICY_ID
,T2.OB_COM_ID            AS OB_COM_ID
,T2.BATCH_ID             AS BATCH_ID
,T2.CUS_LIST_ID          AS CUS_LIST_ID
,T2.CHANGE_TIME  AS CREATE_HISTORY_DATE
FROM TB_TASK_HISTORY T2
WHERE --TO_DATE(CREATE_HISTORY_DATE)=to_date(STAT_DATE, 'yyyymmdd')
      T2.CHANGE_TIME >= V_BEG_DATE 
   AND T2.CHANGE_TIME <= V_END_DATE
   AND T2.TYPE_ID='2' --�������� 2��������������
   AND T2.TYPE_ID<>'4'--��ǰ�������Ͳ�Ϊ�ײ�����
)
    SELECT
      '-1' as PAY_MODE,
       T4.OB_COM_NAME, --�����
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T1.ORG_ID,--����
       T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T1.USER_ID, --��ϯ����
       COUNT(DISTINCT T1.CUS_LIST_ID)--����
  FROM V_TASK_H T1
       --inner join TB_TASK T3  on T1.TASK_ID=T3.TASK_ID
       inner join  TB_SALE_BATCH   T2 on T2.BATCH_ID=T1.BATCH_ID
       inner join TB_OB_COM  T4 on T4.OB_COM_ID=T1.OB_COM_ID
       inner join C_USER T5 on  T1.USER_ID=T5.USERID AND T1.ORG_ID=T5.ORG_ID

 WHERE 1=1
   AND T1.TYPE_ID='2' --�������� 2��������������
   AND T1.TYPE_ID<>'4'--��ǰ�������Ͳ�Ϊ�ײ�����
   AND NOT EXISTS
      (SELECT NULL
        FROM TB_TASK_HISTORY TT
             WHERE TT.TASK_ID=T1.TASK_ID
                  AND TT.TYPE_ID='4'--�ײ�����
                  AND TO_CHAR(TT.CREATE_HISTORY_DATE,'YYYYMMDD')=TO_CHAR(T1.CREATE_HISTORY_DATE,'YYYYMMDD') --���ײ����͸ı�ʱ������۸��������ύ����С��ʱ����ͬһͳ������
                  )
   --AND to_date(T1.CREATE_HISTORY_DATE) =to_date(STAT_DATE, 'yyyymmdd')
   GROUP BY
       T4.OB_COM_NAME, --�����
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T1.ORG_ID,--����
       T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID ,  ---�Ŷӳ����
       T1.USER_ID
       ;
   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_DAY_3;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_DAY_4
prompt ========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_DAY_4(STAT_DATE in NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_DAY_4'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DAY			                   NUMBER := STAT_DATE;  --����ʱ�� 
   --ERR_NUM                       NUMBER := 0;
  -- ERR_MSG                        VARCHAR2 (200);
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_DATE)||' 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_DATE)||' 23:59:59','YYYY-MM-DD HH24:MI:SS');  --��������
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_4';
  --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '����Ӵ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;

   INSERT INTO TEMP_TA_SALES_RPT_4
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,CONT_LIST_QTY)
    SELECT 
       '-1' as PAY_MODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����
       COUNT(DISTINCT T1.CUS_LIST_ID)--����
  FROM TB_SALE_HISTORY T1 inner join  TB_TASK  T3 on T1.TASK_ID=T3.TASK_ID
      inner join  TB_SALE_BATCH  T2 on T2.BATCH_ID=T3.BATCH_ID
      inner join TB_OB_COM T4 on T4.OB_COM_ID=T1.OBCOM_ID 
      inner join C_USER T5  on T3.USER_ID=T5.USERID and T3.ORG_ID=T5.ORG_ID
 WHERE 
   T1.IS_CONTACT='1'--�Ӵ������0��δ�Ӵ���1���ѽӴ���
   AND T1.CREATE_HISTORY_DATE >= V_BEG_DATE AND T1.CREATE_HISTORY_DATE <= V_END_DATE
   GROUP BY
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID ,  ---�Ŷӳ����
       T3.USER_ID 
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_DAY_4;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_DAY_5
prompt ========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_DAY_5(STAT_DATE in NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_DAY_5'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DAY			                   NUMBER := STAT_DATE;  --����ʱ�� 
   --ERR_NUM                       NUMBER := 0;
   --ERR_MSG                        VARCHAR2 (200);
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_DATE)||' 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_DATE)||' 23:59:59','YYYY-MM-DD HH24:MI:SS');  --��������
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_5';
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '����ܾ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;
  --���㵱ǰ״̬����
   INSERT INTO TEMP_TA_SALES_RPT_5
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,REJ_LIST_QTY)
    SELECT
       '-1' as PAY_MODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
      T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����
       COUNT(DISTINCT T3.CUS_LIST_ID)--����
  FROM TB_TASK T3
       inner join TB_SALE_BATCH   T2 on T2.BATCH_ID=T3.BATCH_ID 
       inner join TB_OB_COM  T4 on T4.OB_COM_ID=T3.OB_COM_ID
       inner join C_USER T5 on T3.USER_ID=T5.USERID and T3.ORG_ID=T5.ORG_ID
 WHERE 1=1
   AND T3.STATUS_ID='11'--ʧ��״̬
   AND T3.SECOND_RESULT IN ('1','2','5')--�������������1�պš�2��š�5������� Ϊ��Ч����
   AND T3.CHANGE_TIME >= V_BEG_DATE AND T3.CHANGE_TIME <= V_END_DATE
   GROUP BY
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,  
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID ,  ---�Ŷӳ����
       T3.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;
   --������ʷ����
   INSERT INTO TEMP_TA_SALES_RPT_5
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,REJ_LIST_QTY)
    SELECT
       '-1' as PAY_MODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
      T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����
       COUNT(DISTINCT T3.CUS_LIST_ID)--����
  FROM TB_TASK_HISTORY T3
       inner join TB_SALE_BATCH   T2 on T2.BATCH_ID=T3.BATCH_ID 
       inner join TB_OB_COM  T4 on T4.OB_COM_ID=T3.OB_COM_ID
       inner join C_USER T5 on T3.USER_ID=T5.USERID and T3.ORG_ID=T5.ORG_ID
 WHERE 1=1
   AND T3.STATUS_ID='11'--ʧ��״̬
   AND T3.SECOND_RESULT IN ('1','2','5')--�������������1�պš�2��š�5������� Ϊ��Ч����
   AND --to_date(T3.CREATE_HISTORY_DATE) =to_date(STAT_DATE, 'yyyymmdd')
       T3.CHANGE_TIME >= V_BEG_DATE 
    AND T3.CHANGE_TIME <= V_END_DATE
   GROUP BY
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,  
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
      T5.ORG_ID,--��Ŀ������
       T5.ORG_ID ,  ---�Ŷӳ����
       T3.USER_ID
       ;
         V_ROW_NUM   := V_ROW_NUM+SQL%ROWCOUNT;
   COMMIT;
   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
 EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_DAY_5;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_DAY_6
prompt ========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_DAY_6(STAT_DATE in NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_DAY_6'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DAY			                   NUMBER := STAT_DATE;  --����ʱ��
   --ERR_NUM                       NUMBER := 0;
   -- ERR_MSG                        VARCHAR2 (200);
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_DATE)||' 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_DATE)||' 23:59:59','YYYY-MM-DD HH24:MI:SS');  --��������
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_6';
     --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '���������ύ���������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;
  --���㵱ǰ״̬����ʷ����
   INSERT INTO TEMP_TA_SALES_RPT_6
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,OLINE_SMIT_QTY
       ,OLINE_SMIT_PRM)
   SELECT
       TT.PAY_TYP AS PAY_MODE,
       TT.OB_COM_NAME,--�ID
       TT.BATCH_NAME, ---���α���
       TT.COM_TYPE,--�������ࣨ�¶������������н飩
       TT.PRJ_ID,--������Ŀ
       TT.COMPANY_ID,--�ֹ�˾
       TT.ORG_ID,--����
       TT.BELONGCITY,--��������
       NVL(TT.WORKPLACE_ID, '-1'),--ְ��ID
       TT.PRJT_MGR_ID AS PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID AS TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID,  --��ϯ
       COUNT(DISTINCT  TT.APPNO),--Ͷ������
       SUM(CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                ELSE TT.TOTAL_FEE END) --�껯����
FROM  ( SELECT DISTINCT
         T2.OB_COM_NAME,
         T3.BATCH_NAME,
         T3.COM_TYPE ,
         T2.PRJ_ID ,
         T2.COMPANY_ID,
         T3.BELONGCITY,
         T1.ORG_ID,
         T6.ORG_ID AS PRJT_MGR_ID,
         T6.ORG_ID AS TEM_LEAD_ID,
         T1.USER_ID ,
         T1.STATUS_ID,
         T1.TYPE_ID,
         T5.PAY_TYP,
         T4.APPNO,
         T6.WORKPLACE_ID,
         T4.TOTAL_FEE

FROM (SELECT A.ORG_ID,A.USER_ID,A.STATUS_ID,A.TYPE_ID,A.OB_COM_ID,A.BATCH_ID,A.TASK_ID,A.POLICY_ID,A.CHANGE_TIME
              FROM TB_TASK A
              WHERE A.STATUS_ID ='7'
               AND  A.TYPE_ID ='5'
         UNION ALL
             SELECT B.ORG_ID,B.USER_ID,B.STATUS_ID,B.TYPE_ID,B.OB_COM_ID,B.BATCH_ID,B.TASK_ID,B.POLICY_ID,B.CHANGE_TIME AS CHANGE_TIME
             FROM  TB_TASK_HISTORY B
               WHERE B.STATUS_ID ='7'
              AND  B.TYPE_ID ='5'
              ) T1,
      TB_OB_COM      T2,
      TB_SALE_BATCH  T3,
      C_USER         T6,
      TB_APPLICATION    T4,--Ͷ����������Ϣ��
      TB_APP_PRD_INFO   T5--Ͷ������Ʒ��
 WHERE T1.OB_COM_ID=T2.OB_COM_ID
   AND T1.BATCH_ID=T3.BATCH_ID
   AND T1.USER_ID=T6.USERID
   AND T1.ORG_ID=T6.ORG_ID
   AND T1.TASK_ID=T4.TASK_ID
   AND T1.POLICY_ID=T4.APPNO--Ͷ����ID
   AND T4.APPLICATION_ID=T5.APPLICATION_ID
   AND T1.CHANGE_TIME >= V_BEG_DATE
   AND T1.CHANGE_TIME <= V_END_DATE

           )TT

  GROUP BY
       TT.PAY_TYP,
       TT.OB_COM_NAME,--�ID
       TT.BATCH_NAME, ---���α���
       TT.PRJ_ID,--������Ŀ
       TT.COM_TYPE,--�������ࣨ�¶������������н飩
       TT.COMPANY_ID,--�ֹ�˾
       TT.BELONGCITY,--��������
       TT.ORG_ID,--����
       NVL(TT.WORKPLACE_ID, '-1'),--ְ��ID
       TT.PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID
       ;
     V_ROW_NUM   :=V_ROW_NUM+SQL%ROWCOUNT;
 COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
 EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_DAY_6;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_DAY_8
prompt ========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_DAY_8(STAT_DATE in NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_DAY_8'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DAY			                   NUMBER := STAT_DATE;  --����ʱ��
   --ERR_NUM                       NUMBER := 0;
   --ERR_MSG                        VARCHAR2 (200);
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_DATE)||' 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_DATE)||' 23:59:59','YYYY-MM-DD HH24:MI:SS');  --��������
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_8';
         --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�������ϳɽ����������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;

   INSERT INTO TEMP_TA_SALES_RPT_8
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,OLINE_TRAN_QTY --���ϳɽ���
       ,OLINE_TRAN_PRM)--���ϳɽ�����
     SELECT
       TT.PAY_TYP AS PAY_MODE,
       TT.OB_COM_NAME,--�ID
       TT.BATCH_NAME, ---���α���
       TT.COM_TYPE,--�������ࣨ�¶������������н飩
       TT.PRJ_ID,--������Ŀ
       TT.COMPANY_ID,--�ֹ�˾
       TT.ORG_ID,--����
       TT.BELONGCITY,--��������
       NVL(TT.WORKPLACE_ID, '-1'),--ְ��ID
       TT.PRJT_MGR_ID AS PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID AS TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID,  --��ϯ
       COUNT(DISTINCT TT.APPNO) AS OLINE_TRAN_QTY,--Ͷ������
       SUM(CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                ELSE TT.TOTAL_FEE END) AS OLINE_TRAN_PRM--�껯����
FROM  ( SELECT DISTINCT
         T2.OB_COM_NAME,
         T3.BATCH_NAME,
         T3.COM_TYPE ,
         T2.PRJ_ID ,
         T2.COMPANY_ID,
         T3.BELONGCITY,
         T1.ORG_ID,
         T6.ORG_ID AS PRJT_MGR_ID,
         T6.ORG_ID AS TEM_LEAD_ID,
         T1.USER_ID ,
         T1.STATUS_ID,
         T1.TYPE_ID,
         T5.PAY_TYP,
         T4.APPNO,
         T6.WORKPLACE_ID,
         T4.TOTAL_FEE

FROM (SELECT A.ORG_ID,A.USER_ID,A.STATUS_ID,A.TYPE_ID,A.OB_COM_ID,A.BATCH_ID,A.TASK_ID,A.POLICY_ID,A.CHANGE_TIME
              FROM TB_TASK A
              WHERE A.STATUS_ID ='12'
               AND  A.TYPE_ID ='7'
         UNION ALL
             SELECT B.ORG_ID,B.USER_ID,B.STATUS_ID,B.TYPE_ID,B.OB_COM_ID,B.BATCH_ID,B.TASK_ID,B.POLICY_ID,B.CHANGE_TIME AS CHANGE_TIME
             FROM  TB_TASK_HISTORY B
               WHERE B.STATUS_ID ='12'
              AND  B.TYPE_ID ='7'
              ) T1,
      TB_OB_COM      T2,
      TB_SALE_BATCH  T3,
      C_USER         T6,
      TB_APPLICATION    T4,--Ͷ����������Ϣ��
      TB_APP_PRD_INFO   T5--Ͷ������Ʒ��
 WHERE T1.OB_COM_ID=T2.OB_COM_ID
   AND T1.BATCH_ID=T3.BATCH_ID
   AND T1.USER_ID=T6.USERID
   AND T1.ORG_ID=T6.ORG_ID
   AND T1.TASK_ID=T4.TASK_ID
   AND T1.POLICY_ID=T4.APPNO--Ͷ����ID
   AND T4.APPLICATION_ID=T5.APPLICATION_ID
   AND T1.CHANGE_TIME >= V_BEG_DATE
   AND T1.CHANGE_TIME <= V_END_DATE

           )TT

  GROUP BY
       TT.PAY_TYP,
       TT.OB_COM_NAME,--�ID
       TT.BATCH_NAME, ---���α���
       TT.PRJ_ID,--������Ŀ
       TT.COM_TYPE,--�������ࣨ�¶������������н飩
       TT.COMPANY_ID,--�ֹ�˾
       TT.BELONGCITY,--��������
       TT.ORG_ID,--����
       NVL(TT.WORKPLACE_ID, '-1'),--ְ��ID
       TT.PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;
   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
----------------------------------
 --��¼��־��ʼ
 V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '������سɹ����������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;

   INSERT INTO TEMP_TA_SALES_RPT_8
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,LAND_SUCC_QTY --��سɹ�����
       ,LAND_SUCC_PRM)--��سɹ�������
     
 SELECT
       TT.PAY_TYP AS PAY_MODE,
       TT.OB_COM_NAME AS ACTV_ID,--�ID
       TT.BATCH_NAME AS BAT_ID, ---���α���
       TT.COM_TYPE AS COM_TYP,--�������ࣨ�¶������������н飩
       TT.PRJ_ID AS BAT_PRJT,--������Ŀ
       TT.COMPANY_ID AS COMP_ID,--�ֹ�˾
       TT.ORG_ID AS ORG_TYP,--����
       TT.BELONGCITY AS CITY_ID,--��������
       NVL(TT.WORKPLACE_ID, '-1') WP_ID,--ְ��ID
       TT.PRJT_MGR_ID AS PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID AS TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID,  --��ϯ
       COUNT(DISTINCT TT.APPNO) AS LAND_SUCC_QTY,--Ͷ������
       SUM(CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                ELSE TT.TOTAL_FEE END) AS LAND_SUCC_PRM--�껯����
FROM  ( SELECT DISTINCT
         T2.OB_COM_NAME,
         T3.BATCH_NAME,
         T3.COM_TYPE ,
         T2.PRJ_ID ,
         T2.COMPANY_ID,
         T3.BELONGCITY,
         T1.ORG_ID,
         T6.ORG_ID AS PRJT_MGR_ID,
         T6.ORG_ID AS TEM_LEAD_ID,
         T1.USER_ID ,
         T1.STATUS_ID,
         T1.TYPE_ID,
         T5.PAY_TYP,
         T4.APPNO,
         T6.WORKPLACE_ID,
         T4.TOTAL_FEE
FROM (SELECT A.ORG_ID,A.USER_ID,A.STATUS_ID,A.TYPE_ID,A.OB_COM_ID,A.BATCH_ID,A.TASK_ID,A.POLICY_ID,A.CHANGE_TIME
              FROM TB_TASK A
              WHERE A.STATUS_ID ='12'
               AND  A.TYPE_ID ='7'
         UNION ALL
             SELECT B.ORG_ID,B.USER_ID,B.STATUS_ID,B.TYPE_ID,B.OB_COM_ID,B.BATCH_ID,B.TASK_ID,B.POLICY_ID,B.CHANGE_TIME AS CHANGE_TIME
             FROM  TB_TASK_HISTORY B
               WHERE B.STATUS_ID ='12'
              AND  B.TYPE_ID ='7'
              ) T1,
      TB_OB_COM      T2,
      TB_SALE_BATCH  T3,
      C_USER         T6,
      TB_APPLICATION    T4,--Ͷ����������Ϣ��
      TB_APP_PRD_INFO   T5,--Ͷ������Ʒ��
      TB_LOG T7
 WHERE T1.OB_COM_ID=T2.OB_COM_ID
   AND T1.BATCH_ID=T3.BATCH_ID
   AND T1.USER_ID=T6.USERID
   AND T1.ORG_ID=T6.ORG_ID
   AND T1.TASK_ID=T4.TASK_ID
   AND T1.POLICY_ID=T4.APPNO--Ͷ����ID
   AND T4.APPLICATION_ID=T5.APPLICATION_ID
   AND T7.IDOBJ=T4.APPLICATION_ID
   AND T4.IACCEPT='1'--�����ɹ����״̬
   AND T7.TTIME >= V_BEG_DATE
   AND T7.TTIME <= V_END_DATE
           )TT
  GROUP BY
       TT.PAY_TYP,
       TT.OB_COM_NAME,--�ID
       TT.BATCH_NAME, ---���α���
       TT.PRJ_ID,--������Ŀ
       TT.COM_TYPE,--�������ࣨ�¶������������н飩
       TT.COMPANY_ID,--�ֹ�˾
       TT.BELONGCITY,--��������
       TT.ORG_ID,--����
       NVL(TT.WORKPLACE_ID, '-1'),--ְ��ID
       TT.PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID;
       
   V_ROW_NUM   := SQL%ROWCOUNT+V_ROW_NUM;
   COMMIT;
   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_DAY_8;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_MON_1
prompt ========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_MON_1(STAT_MON in varchar2
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
   V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_MON_1'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DAY			                   NUMBER := STAT_MON;  --����ʱ��
   --ERR_NUM                       NUMBER := 0;
   --ERR_MSG                        VARCHAR2 (200);
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_MON)||'01 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=LAST_DAY(TO_DATE(TO_CHAR(STAT_MON)||'01 23:59:59','YYYY-MM-DD HH24:MI:SS'));  --��������
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_MON IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_1';

  --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�����ײ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_MON
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;

   INSERT INTO TEMP_TA_SALES_RPT_1
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,FST_CAL_LIST_QTY)
       WITH V_TASK_H AS(
SELECT
 -1                  AS HISTORY_ID
,T1.TASK_ID              AS TASK_ID
--,T1.CREATE_TIME          AS CREATE_TIME
,T1.CHANGE_TIME          AS CHANGE_TIME
--,T1.FIRST_RESULT         AS FIRST_RESULT
--,T1.SECOND_RESULT        AS SECOND_RESULT
,T1.USER_ID              AS USER_ID
,T1.ORG_ID               AS ORG_ID
,T1.STATUS_ID            AS STATUS_ID
,T1.TYPE_ID              AS TYPE_ID
--,T1.POLICY_ID            AS POLICY_ID
,T1.OB_COM_ID            AS OB_COM_ID
,T1.BATCH_ID             AS BATCH_ID
,T1.CUS_LIST_ID          AS CUS_LIST_ID
,T1.CHANGE_TIME          AS CREATE_HISTORY_DATE
FROM TB_TASK T1
WHERE --substr(to_char(CHANGE_TIME, 'yyyymmdd'), 1, 6) =STAT_MON
      T1.CHANGE_TIME >= V_BEG_DATE AND T1.CHANGE_TIME <= V_END_DATE
AND T1.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T1.TYPE_ID<> '4'--�������� �ײ�
UNION ALL
 SELECT
 T2.HISTORY_ID           AS HISTORY_ID
,T2.TASK_ID              AS TASK_ID
--,T2.CREATE_TIME          AS CREATE_TIME
,T2.CHANGE_TIME          AS CHANGE_TIME
--,T2.FIRST_RESULT         AS FIRST_RESULT
--,T2.SECOND_RESULT        AS SECOND_RESULT
,T2.USER_ID              AS USER_ID
,T2.ORG_ID               AS ORG_ID
,T2.STATUS_ID            AS STATUS_ID
,T2.TYPE_ID              AS TYPE_ID
--,T2.POLICY_ID            AS POLICY_ID
,T2.OB_COM_ID            AS OB_COM_ID
,T2.BATCH_ID             AS BATCH_ID
,T2.CUS_LIST_ID          AS CUS_LIST_ID
,T2.CHANGE_TIME  AS CREATE_HISTORY_DATE
FROM TB_TASK_HISTORY T2
WHERE --substr(to_char(CREATE_HISTORY_DATE, 'yyyymmdd'), 1, 6) =STAT_MON
      T2.CHANGE_TIME >= V_BEG_DATE
AND T2.CHANGE_TIME <= V_END_DATE
AND T2.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T2.TYPE_ID<> '4'--�������� �ײ�
)
    SELECT
       '-1' as PAYMODE,  --���ѷ�ʽ
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME, --���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T1.ORG_ID,--����
       T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ�����
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T1.USER_ID, --��ϯ����
       COUNT(DISTINCT T1.CUS_LIST_ID) as FST_CAL_LIST_QTY--�ײ�������
    FROM V_TASK_H T1
      -- inner join  TB_TASK T3  on T1.TASK_ID=T3.TASK_ID
       inner join  TB_SALE_BATCH  T2 on T2.BATCH_ID=T1.BATCH_ID
       inner join  TB_OB_COM  T4 on T4.OB_COM_ID=T1.OB_COM_ID
       inner join  C_USER  T5 on  T5.USERID=T1.USER_ID  AND T5.ORG_ID=T1.ORG_ID

 WHERE
   T1.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T1.TYPE_ID<> '4'--�������� �ײ�
   AND EXISTS
      (SELECT NULL
        FROM TB_TASK_HISTORY TT
             WHERE
                  TT.TASK_ID=T1.TASK_ID
                  AND TT.STATUS_ID='6'
                  AND TT.TYPE_ID='4'
                  AND TO_CHAR(TT.CREATE_HISTORY_DATE,'YYYYMMDD')=TO_CHAR(T1.CREATE_HISTORY_DATE,'YYYYMMDD')--���ײ�״̬�ı�ʱ����ύ����С��ʱ����ͬһ��
                  )
   --AND substr(to_char(T1.CREATE_HISTORY_DATE, 'yyyymmdd'), 1, 6) =STAT_MON
   GROUP BY

       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME, --���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T1.ORG_ID,--����
       T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ�����
       T5.ORG_ID,--��Ŀ������
       T5.ORG_ID,  ---�Ŷӳ����
       T1.USER_ID
       ;
   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
 EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_MON_1;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_MON_10
prompt =========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_MON_10(STAT_MON in NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_MON_10'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DAY			                   NUMBER := STAT_MON;  --����ʱ�� 
   -- ERR_NUM                       NUMBER := 0;
   -- ERR_MSG                       VARCHAR2 (200);
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_MON)||'01 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=LAST_DAY(TO_DATE(TO_CHAR(STAT_MON)||'01 23:59:59','YYYY-MM-DD HH24:MI:SS'));  --��������
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_MON IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_10';
    --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�������ڿۿ�ɹ��� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_MON
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;
   INSERT INTO TEMP_TA_SALES_RPT_10
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,FST_CHARGBK_SUCC_QTY)
    SELECT
       Z.PAYCODE as PAY_MODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID ,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����
       COUNT(DISTINCT Z.POLICYNO)   AS  KKBJ--���ڿۿ�ɹ���
   FROM PREREC Z,
     RISKCON T1 ,
     TB_SALE_BATCH  T2,
     TB_TASK T3,
     TB_OB_COM T4,
     C_USER  T5
/*  FROM PREREC Z inner join RISKCON T1 on  Z.POLICYNO = T1.POLICYNO AND Z.CLASSCODE=T1.CLASSCODE --����ʵ�ձ�--���˱�����
       inner join TB_SALE_BATCH  T2 on T2.BATCH_ID=T3.BATCH_ID
       inner join TB_TASK T3 on T1.APPNO=T3.POLICY_ID
       inner join TB_OB_COM T4 on T4.OB_COM_ID=T3.OB_COM_ID 
       inner join C_USER  T5 on T3.USER_ID=T5.USERID AND  T3.ORG_ID=T5.ORG_ID    */    
 WHERE Z.POLICYNO = T1.POLICYNO AND Z.CLASSCODE=T1.CLASSCODE
    AND T2.BATCH_ID=T3.BATCH_ID
    AND T1.APPNO=T3.POLICY_ID
    AND T4.OB_COM_ID=T3.OB_COM_ID 
    AND T3.USER_ID=T5.USERID AND  T3.ORG_ID=T5.ORG_ID
    AND Z.PCODE NOT IN ('Z', 'X', 'Y', '6', 'M')
    AND Z.SETCODE <> '9'
    AND T1.SALEATTR IN ('61', '62', '63', '64')--���������������ܹ�˾���ֹ�˾
    AND Z.YEARNO = 1--�����
    AND Z.PCODE = '2'--�շ�
    --AND Z.DEPTCODE IS NOT NULL
    AND --substr(to_char(Z.PAYDATE, 'yyyymmdd'),  1, 6) =STAT_MON
        Z.PAYDATE >= V_BEG_DATE AND Z.PAYDATE <= V_END_DATE
   GROUP BY
        Z.PAYCODE ,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T2.BELONGCITY,--��������
       T3.ORG_ID,--����      
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID ,  ---�Ŷӳ����
       T3.USER_ID
       ;
   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;
end SP_TA_SALES_RPT_MON_10;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_MON_11
prompt =========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_MON_11(STAT_MON in NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_MON_11'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DAY			                   NUMBER := STAT_MON;  --����ʱ�� 
   --ERR_NUM                       NUMBER := 0;
   --ERR_MSG                        VARCHAR2 (200);
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_MON)||'01 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=LAST_DAY(TO_DATE(TO_CHAR(STAT_MON)||'01 23:59:59','YYYY-MM-DD HH24:MI:SS'));  --��������
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_MON IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_11';
     --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�����껯�±����� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_MON
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;
   INSERT INTO TEMP_TA_SALES_RPT_11
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,ANNUL_FST_PRM_PRM)
    SELECT
       Z.PAYCODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID     
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����
       SUM(DISTINCT NVL((CASE
             WHEN Z.PCODE = '2' AND
                  Z.YEARNO = 1 AND
                  Z.PAYCODE = '10' THEN
              T1.NPAYLEN * T1.PIECES * 12
             WHEN Z.PCODE = '2' AND
                  PAYCODE = '11' THEN
              T1.NPAYLEN * T1.PIECES * 4
             WHEN Z.PCODE = '2' AND
                  Z.PAYCODE = '12' THEN
              T1.NPAYLEN * T1.PIECES * 2
             WHEN Z.PCODE = '2' AND
                  Z.PAYCODE = '13' THEN
             T1.NPAYLEN * T1.PIECES * 1
             ELSE
              0 END), 0)) +
               SUM(DISTINCT NVL((CASE
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '10' THEN
                  T1.NPAYLEN * T1.PIECES * -12
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '11' THEN
                  T1.NPAYLEN * T1.PIECES * -4
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '12' THEN
                  T1.NPAYLEN * T1.PIECES * -2
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '13' THEN
                  T1.NPAYLEN * T1.PIECES * -1
                 ELSE
                  0 END),0)) NHAMOUNT--�껯�±�����
  FROM PREREC  Z inner join RISKCON T1 on Z.POLICYNO = T1.POLICYNO    AND Z.CLASSCODE = T1.CLASSCODE --����ʵ�ձ�
       inner join  TB_TASK T3 on T1.appno=T3.POLICY_ID
       inner join TB_SALE_BATCH  T2 on T2.BATCH_ID=T3.BATCH_ID
       inner join TB_OB_COM  T4 on T4.OB_COM_ID=T3.OB_COM_ID
       inner join C_USER  T5 on T3.USER_ID=T5.USERID and T3.ORG_ID=T5.ORG_ID
      -- inner join TB_APPLICATION T6 on  T3.POLICY_ID=T6.APPNO AND T3.TASK_ID=T6.TASK_ID--Ͷ����������Ϣ��
      -- inner join TB_APP_PRD_INFO T7 on T6.APPLICATION_ID=T7.APPLICATION_ID--Ͷ������Ʒ��
       
 WHERE
    Z.PCODE NOT IN ('Z', 'X', 'Y', '6', 'M')
   AND Z.SETCODE <> '9'
   AND T1.SALEATTR IN ('61', '62', '63', '64')--���������������ܹ�˾���ֹ�˾
   AND Z.PCODE IN('8', '2')--�շ�
  -- AND Z.DEPTCODE IS NOT NULL
   AND --substr(to_char(Z.PAYDATE, 'yyyymmdd'),  1, 6) =STAT_MON
        Z.PAYDATE >= V_BEG_DATE AND Z.PAYDATE <= V_END_DATE
   GROUP BY
       Z.PAYCODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T2.BELONGCITY,--��������
       T3.ORG_ID,--����       
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID    
       T5.ORG_ID,--��Ŀ������
       T5.ORG_ID,  ---�Ŷӳ����
       T3.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_MON_11;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_MON_12
prompt =========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_MON_12(STAT_MON in NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_MON_12'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
     V_DAY			                   NUMBER := STAT_MON;  --����ʱ�� 
   --ERR_NUM                       NUMBER := 0;
   -- ERR_MSG                        VARCHAR2 (200);
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_MON)||'01 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=LAST_DAY(TO_DATE(TO_CHAR(STAT_MON)||'01 23:59:59','YYYY-MM-DD HH24:MI:SS'));  --��������
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_MON IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_12';
  --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '����ʵ���±����� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_MON
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;

   INSERT INTO TEMP_TA_SALES_RPT_12
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,ACTL_FST_PRM_PRM)
    SELECT
      '-1' as PAY_MODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID   
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����
       SUM(DISTINCT NVL((CASE WHEN Z.PCODE = '2' AND Z.YEARNO = 1
                     THEN Z.AMOUNT
                     ELSE 0
                     END),0)) + SUM(DISTINCT NVL(
                (CASE WHEN Z.PCODE = '8' AND Z.YEARNO = 1
                        THEN Z.AMOUNT
                        ELSE 0
                        END),0)) + SUM(DISTINCT NVL(
                (CASE WHEN Z.PCODE NOT IN ('8', '2') AND Z.YEARNO = 1
                      THEN Z.AMOUNT               --�޸Ľ�תȡֵ����
                      ELSE 0
                      END),0)) SSAMOUNT--ʵ���±�
  FROM PREREC  Z 
       inner join RISKCON T1 on Z.POLICYNO = T1.POLICYNO AND Z.CLASSCODE = T1.CLASSCODE
       inner join TB_TASK  T3 on   T1.APPNO=T3.POLICY_ID
       inner join TB_SALE_BATCH   T2 on T2.BATCH_ID=T3.BATCH_ID
       inner join TB_OB_COM     T4 on T4.OB_COM_ID=T3.OB_COM_ID
       inner join C_USER        T5 on T3.USER_ID=T5.USERID and T3.ORG_ID=T5.ORG_ID
       
 WHERE
   Z.PCODE NOT IN ('Z', 'X', 'Y', '6', 'M')
   AND Z.SETCODE <> '9'
   AND T1.SALEATTR IN ('61', '62', '63', '64')--���������������ܹ�˾���ֹ�˾
   --AND Z.DEPTCODE IS NOT NULL
   AND --substr(to_char(Z.PAYDATE, 'yyyymmdd'),  1, 6) =STAT_MON
       Z.PAYDATE >= V_BEG_DATE AND Z.PAYDATE <= V_END_DATE
   GROUP BY
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID   
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID,  ---�Ŷӳ����
       T3.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_MON_12;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_MON_13
prompt =========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_MON_13(STAT_MON in NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_MON_13'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DAY			                   NUMBER := STAT_MON;  --����ʱ�� 
   --ERR_NUM                       NUMBER := 0;
   --ERR_MSG                        VARCHAR2 (200);
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_MON)||'01 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=LAST_DAY(TO_DATE(TO_CHAR(STAT_MON)||'01 23:59:59','YYYY-MM-DD HH24:MI:SS'));  --��������
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_MON IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_13';
    --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '������ԥ���˱����������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_MON
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;

   INSERT INTO TEMP_TA_SALES_RPT_13
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,CNCL_QTY
       ,CNCL_PRM)
   SELECT '-1' AS PAY_MODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����
        COUNT(DISTINCT(CASE  WHEN Z.PCODE = '8' AND Z.YEARNO = 1
                             THEN Z.POLICYNO
                             END)) * 1   AS YTBJ,
                   --���˱���
                   SUM(DISTINCT NVL((CASE
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '10' THEN
                                T1.NPAYLEN * T1.PIECES * 12
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '11' THEN
                                T1.NPAYLEN * T1.PIECES * 4
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '12' THEN
                                T1.NPAYLEN * T1.PIECES * 2
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '13' THEN
                                T1.NPAYLEN * T1.PIECES * 1
                               ELSE
                                0
                           END),
                           0)) YTAMOUNT
  FROM PREREC  Z  inner join RISKCON T1 on Z.POLICYNO = T1.POLICYNO
       inner join TB_TASK  T3 on T1.APPNO=T3.POLICY_ID
       inner join TB_SALE_BATCH  T2 on T2.BATCH_ID=T3.BATCH_ID
       inner join TB_OB_COM  T4 on T4.OB_COM_ID=T3.OB_COM_ID
       inner join C_USER T5  on T3.User_Id = T5.USERID and T3.Org_Id = T5.Org_Id

 WHERE Z.PCODE NOT IN ('Z', 'X', 'Y', '6', 'M')
   AND Z.PCODE = '8'
   AND Z.SETCODE <> '9'
   AND T1.SALEATTR IN ('61', '62', '63', '64')--���������������ܹ�˾���ֹ�˾
   --AND Z.DEPTCODE IS NOT NULL
   AND --substr(to_char(Z.PAYDATE, 'yyyymmdd'),  1, 6) =STAT_MON
       Z.PAYDATE >= V_BEG_DATE AND Z.PAYDATE <= V_END_DATE
   GROUP BY
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID,  ---�Ŷӳ����
       T3.USER_ID
       ;
  V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;
end SP_TA_SALES_RPT_MON_13;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_MON_2
prompt ========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_MON_2(STAT_MON in NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_MON_2'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DAY			                   NUMBER := STAT_MON;  --����ʱ��
   --ERR_NUM                       NUMBER := 0;
   --ERR_MSG                        VARCHAR2 (200);
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_MON)||'01 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=LAST_DAY(TO_DATE(TO_CHAR(STAT_MON)||'01 23:59:59','YYYY-MM-DD HH24:MI:SS'));  --��������
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_MON IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_2';
  --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�����ײ��Ӵ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_MON
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;
   INSERT INTO TEMP_TA_SALES_RPT_2
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,USER_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,FST_CAL_CONT_LIST_QTY)
       WITH V_TASK_H AS(
SELECT
 -1                  AS HISTORY_ID
,T1.TASK_ID              AS TASK_ID
--,T1.CREATE_TIME          AS CREATE_TIME
,T1.CHANGE_TIME          AS CHANGE_TIME
--,T1.FIRST_RESULT         AS FIRST_RESULT
--,T1.SECOND_RESULT        AS SECOND_RESULT
,T1.USER_ID              AS USER_ID
,T1.ORG_ID               AS ORG_ID
,T1.STATUS_ID            AS STATUS_ID
,T1.TYPE_ID              AS TYPE_ID
--,T1.POLICY_ID            AS POLICY_ID
,T1.OB_COM_ID            AS OB_COM_ID
,T1.BATCH_ID             AS BATCH_ID
,T1.CUS_LIST_ID          AS CUS_LIST_ID
,T1.CHANGE_TIME          AS CREATE_HISTORY_DATE
FROM TB_TASK T1
WHERE --substr(to_char(CHANGE_TIME, 'yyyymmdd'), 1, 6) =STAT_MON
      T1.CHANGE_TIME >= V_BEG_DATE AND T1.CHANGE_TIME <= V_END_DATE
AND T1.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T1.TYPE_ID<> '4'--�������� �ײ�
UNION ALL
 SELECT
 T2.HISTORY_ID           AS HISTORY_ID
,T2.TASK_ID              AS TASK_ID
--,T2.CREATE_TIME          AS CREATE_TIME
,T2.CHANGE_TIME          AS CHANGE_TIME
--,T2.FIRST_RESULT         AS FIRST_RESULT
--,T2.SECOND_RESULT        AS SECOND_RESULT
,T2.USER_ID              AS USER_ID
,T2.ORG_ID               AS ORG_ID
,T2.STATUS_ID            AS STATUS_ID
,T2.TYPE_ID              AS TYPE_ID
--,T2.POLICY_ID            AS POLICY_ID
,T2.OB_COM_ID            AS OB_COM_ID
,T2.BATCH_ID             AS BATCH_ID
,T2.CUS_LIST_ID          AS CUS_LIST_ID
,T2.CHANGE_TIME  AS CREATE_HISTORY_DATE
FROM TB_TASK_HISTORY T2
WHERE --substr(to_char(CREATE_HISTORY_DATE, 'yyyymmdd'), 1, 6) =STAT_MON
      T2.CHANGE_TIME >= V_BEG_DATE
AND T2.CHANGE_TIME <= V_END_DATE
AND T2.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T2.TYPE_ID<> '4'--�������� �ײ�
)
    SELECT
      '-1' as PAY_MODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME, --���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ�����
       T3.USER_ID, --��ϯ����,
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       COUNT(DISTINCT T1.CUS_LIST_ID)--�ײ��Ӵ�������
  FROM TB_SALE_HISTORY T1
       INNER JOIN  V_TASK_H T3 ON T1.TASK_ID=T3.TASK_ID
       INNER JOIN TB_SALE_BATCH  T2 ON T2.BATCH_ID=T3.BATCH_ID
       INNER JOIN TB_OB_COM  T4 ON T4.OB_COM_ID=T1.OBCOM_ID
       INNER JOIN  C_USER  T5  ON T5.USERID=T3.USER_ID  AND T5.ORG_ID=T3.ORG_ID

 WHERE  T3.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T1.IS_CONTACT='1'--�Ӵ������0��δ�Ӵ���1���ѽӴ���
   AND T3.TYPE_ID<>'4'--�������� �ײ�
   AND EXISTS
      (SELECT NULL
        FROM TB_TASK_HISTORY TT
             WHERE TT.TASK_ID=T3.TASK_ID
                  AND TT.STATUS_ID='6'
                  AND TT.TYPE_ID='4'
                  AND TO_CHAR(TT.CREATE_HISTORY_DATE,'YYYYMMDD')=TO_CHAR(T3.CREATE_HISTORY_DATE,'YYYYMMDD')--���ײ�״̬�ı�ʱ����ύ����С��ʱ����ͬһ��
                  )
   --AND substr(to_char(T3.CREATE_HISTORY_DATE, 'yyyymmdd'),  1, 6) =STAT_MON
   GROUP BY
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME, --���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ�����
       T3.USER_ID, --��ϯ����,
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
 EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_MON_2;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_MON_3
prompt ========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_MON_3(STAT_MON in NUMBER,
                                                  ERR_NUM  OUT NUMBER,
                                                  ERR_MSG  OUT VARCHAR2) is
  V_REPORT_ID  NUMBER := 0; --�������
  V_PROC_NAME  VARCHAR2(50) := 'SP_TA_SALES_RPT_MON_3'; --��ǰ��������
  V_STEP       NUMBER := 0; --ִ�в�����ų�ʼֵ
  V_STEP_NO    VARCHAR2(10); --ִ�в���
  V_STEP_DESC  VARCHAR2(200); --��������
  V_ROW_NUM    NUMBER; --SQLִ��Ӱ��ļ�¼��
  V_BEGIN_TIME DATE; --SQL��ʼִ�е�ʱ��
  V_END_TIME   DATE; --SQLִ�н���ʱ��
  V_DAY			                   NUMBER := STAT_MON;  --����ʱ��
  --ERR_NUM                       NUMBER := 0;
  --ERR_MSG                        VARCHAR2 (200);
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_MON)||'01 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=LAST_DAY(TO_DATE(TO_CHAR(STAT_MON)||'01 23:59:59','YYYY-MM-DD HH24:MI:SS'));  --��������
BEGIN
  --���ڲ����Ƿ�Ϊ���ж�
  IF STAT_MON IS NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'STAT_DATE IS NULL!');
  END IF;

  --�����������
  EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_3';
  --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '������������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_MON
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;

  insert into TEMP_TA_SALES_RPT_3
    (PAY_MODE,
     ACTV_ID,
     BAT_ID,
     COM_TYP,
     BAT_PRJT,
     COMP_ID,
     ORG_TYP,
     City_Id,
     WP_ID,
     PRJT_MGR_ID,
     TEM_LEAD_ID,
     USER_ID,
     TRK_LIST_QTY)
WITH V_TASK_H AS(
SELECT
 -1                   AS HISTORY_ID
,T1.TASK_ID              AS TASK_ID
--,T1.CREATE_TIME          AS CREATE_TIME
,T1.CHANGE_TIME          AS CHANGE_TIME
--,T1.FIRST_RESULT         AS FIRST_RESULT
--,T1.SECOND_RESULT        AS SECOND_RESULT
,T1.USER_ID              AS USER_ID
,T1.ORG_ID               AS ORG_ID
,T1.STATUS_ID            AS STATUS_ID
,T1.TYPE_ID              AS TYPE_ID
--,T1.POLICY_ID            AS POLICY_ID
,T1.OB_COM_ID            AS OB_COM_ID
,T1.BATCH_ID             AS BATCH_ID
,T1.CUS_LIST_ID          AS CUS_LIST_ID
,T1.CHANGE_TIME          AS CREATE_HISTORY_DATE
FROM TB_TASK T1
WHERE T1.CHANGE_TIME >= V_BEG_DATE 
   AND T1.CHANGE_TIME <= V_END_DATE
   AND TYPE_ID='2' --�������� 2��������������
   AND T1.TYPE_ID<>'4'--��ǰ�������Ͳ�Ϊ�ײ�����
UNION ALL
 SELECT
 T2.HISTORY_ID           AS HISTORY_ID
,T2.TASK_ID              AS TASK_ID
--,T2.CREATE_TIME          AS CREATE_TIME
,T2.CHANGE_TIME          AS CHANGE_TIME
--,T2.FIRST_RESULT         AS FIRST_RESULT
--,T2.SECOND_RESULT        AS SECOND_RESULT
,T2.USER_ID              AS USER_ID
,T2.ORG_ID               AS ORG_ID
,T2.STATUS_ID            AS STATUS_ID
,T2.TYPE_ID              AS TYPE_ID
--,T2.POLICY_ID            AS POLICY_ID
,T2.OB_COM_ID            AS OB_COM_ID
,T2.BATCH_ID             AS BATCH_ID
,T2.CUS_LIST_ID          AS CUS_LIST_ID
,T2.CHANGE_TIME  AS CREATE_HISTORY_DATE
FROM TB_TASK_HISTORY T2
WHERE T2.CHANGE_TIME >= V_BEG_DATE 
   AND T2.CHANGE_TIME <= V_END_DATE
   AND T2.TYPE_ID='2' --�������� 2��������������
   AND T2.TYPE_ID<>'4'--��ǰ�������Ͳ�Ϊ�ײ�����
)
    SELECT '-1' as PAY_MODE,
           T4.OB_COM_NAME, --�����
           T2.BATCH_NAME, ---���α���
           T2.COM_TYPE, --�������ࣨ�¶������������н飩
           T4.PRJ_ID, --������Ŀ
           T4.COMPANY_ID, --�ֹ�˾
           T1.ORG_ID, --����
           T2.BELONGCITY,
           NVL(T5.WORKPLACE_ID, '-1'), --ְ��ID
           T5.ORG_ID as PRJT_MGR_ID, --��Ŀ������
           T5.ORG_ID as TEM_LEAD_ID, ---�Ŷӳ����
           T1.USER_ID, --��ϯ����
           COUNT(DISTINCT T1.CUS_LIST_ID) --����������
      FROM V_TASK_H T1
    -- INNER JOIN TB_TASK T3
      --  ON T1.TASK_ID = T3.TASK_ID
     INNER JOIN TB_SALE_BATCH T2
        ON T2.BATCH_ID = T1.BATCH_ID
     INNER JOIN TB_OB_COM T4
        ON T4.OB_COM_ID = T1.OB_COM_ID
     INNER JOIN C_USER T5
        ON T1.USER_ID = T5.USERID
       AND T1.ORG_ID = T5.ORG_ID
     WHERE 1=1
       AND T1.TYPE_ID='2' --�������� 2��������������
       AND T1.TYPE_ID <> '4' --��ǰ�������Ͳ�Ϊ�ײ�����
       AND NOT EXISTS
     (SELECT NULL
              FROM TB_TASK_HISTORY TT
             WHERE TT.TASK_ID = T1.TASK_ID
               AND TT.TYPE_ID = '4' --�ײ�����
               AND TO_CHAR(TT.CREATE_HISTORY_DATE,'YYYYMMDD')=TO_CHAR(T1.CREATE_HISTORY_DATE,'YYYYMMDD')
                    --���ײ����͸ı�ʱ������۸��������ύ����С��ʱ����ͬһͳ������
            )
      -- AND substr(to_char(T1.CREATE_HISTORY_DATE, 'yyyymmdd'), 1, 6) =STAT_MON
     GROUP BY T4.OB_COM_NAME, --�����
              T2.BATCH_NAME, ---���α���
              T4.PRJ_ID, --������Ŀ
              T2.COM_TYPE, --�������ࣨ�¶������������н飩
              T4.COMPANY_ID, --�ֹ�˾
              T1.ORG_ID, --����
              T2.BELONGCITY,
              NVL(T5.WORKPLACE_ID, '-1'), --ְ��ID
              T5.ORG_ID, --��Ŀ������
              T5.ORG_ID, ---�Ŷӳ����
              T1.USER_ID;

  V_ROW_NUM := SQL%ROWCOUNT;
  COMMIT;

  --��¼��־����
  SP_LOG_EXEC_AFT(V_PROC_NAME, V_STEP_NO, V_ROW_NUM, V_BEGIN_TIME);

  ERR_NUM := 0;
  ERR_MSG := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_MON_3;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_MON_4
prompt ========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_MON_4(STAT_MON   in NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_MON_4'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DAY			                   NUMBER := STAT_MON;  --����ʱ��
  -- ERR_NUM                       NUMBER := 0;
  -- ERR_MSG                        VARCHAR2 (200);
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_MON)||'01 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=LAST_DAY(TO_DATE(TO_CHAR(STAT_MON)||'01 23:59:59','YYYY-MM-DD HH24:MI:SS'));  --��������
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_MON IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_4';
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '����Ӵ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_MON
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;
   INSERT INTO TEMP_TA_SALES_RPT_4
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,CONT_LIST_QTY)
    SELECT
       '-1' as PAY_MODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����
       COUNT(DISTINCT T1.CUS_LIST_ID)--�Ӵ�������
  FROM TB_SALE_HISTORY T1 
      INNER JOIN  TB_TASK  T3 ON T1.TASK_ID=T3.TASK_ID
      INNER JOIN  TB_SALE_BATCH  T2 ON T2.BATCH_ID=T3.BATCH_ID
      INNER JOIN TB_OB_COM T4 ON T4.OB_COM_ID=T1.OBCOM_ID
      INNER JOIN C_USER T5  ON T3.USER_ID=T5.USERID AND T3.ORG_ID=T5.ORG_ID    
 WHERE
   T1.IS_CONTACT='1'--�Ӵ������0��δ�Ӵ���1���ѽӴ���
   AND T1.CREATE_HISTORY_DATE >= V_BEG_DATE AND T1.CREATE_HISTORY_DATE <= V_END_DATE
   --substr(to_char(T1.CREATE_HISTORY_DATE, 'yyyymmdd'),  1, 6) =STAT_MON
   GROUP BY
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID ,  ---�Ŷӳ����
       T3.USER_ID
       ;
   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_MON_4;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_MON_5
prompt ========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_MON_5(STAT_MON NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_MON_5'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DAY			                   NUMBER := STAT_MON;  --����ʱ�� 
   --ERR_NUM                       NUMBER := 0;
   --ERR_MSG                        VARCHAR2 (200);
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_MON)||'01 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=LAST_DAY(TO_DATE(TO_CHAR(STAT_MON)||'01 23:59:59','YYYY-MM-DD HH24:MI:SS'));  --��������
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_MON IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_5';
    --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '����ܾ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_MON
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;

INSERT INTO TEMP_TA_SALES_RPT_5
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,REJ_LIST_QTY)
    SELECT
       '-1' as PAY_MODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
      T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����
       COUNT(DISTINCT T3.CUS_LIST_ID)--����
  FROM TB_TASK T3
       inner join TB_SALE_BATCH   T2 on T2.BATCH_ID=T3.BATCH_ID 
       inner join TB_OB_COM  T4 on T4.OB_COM_ID=T3.OB_COM_ID
       inner join C_USER T5 on T3.USER_ID=T5.USERID and T3.ORG_ID=T5.ORG_ID
 WHERE 1=1
   AND T3.STATUS_ID='11'--ʧ��״̬
   AND T3.SECOND_RESULT IN ('1','2','5')--�������������1�պš�2��š�5������� Ϊ��Ч����
   AND T3.CHANGE_TIME >= V_BEG_DATE AND T3.CHANGE_TIME <= V_END_DATE
   --substr(to_char(T3.CHANGE_TIME, 'yyyymmdd'),  1, 6) =STAT_MON
   GROUP BY
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID      
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID ,  ---�Ŷӳ����
       T3.USER_ID
       ;
  V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;
--������ʷ����
INSERT INTO TEMP_TA_SALES_RPT_5
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,REJ_LIST_QTY)
    SELECT
       '-1' as PAY_MODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
      T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����
       COUNT(DISTINCT T3.CUS_LIST_ID)--����
  FROM TB_TASK_HISTORY T3
       INNER JOIN TB_SALE_BATCH   T2 ON T2.BATCH_ID=T3.BATCH_ID 
       INNER JOIN TB_OB_COM  T4 ON T4.OB_COM_ID=T3.OB_COM_ID
       INNER JOIN C_USER T5 ON T3.USER_ID=T5.USERID AND T3.ORG_ID=T5.ORG_ID
 WHERE 1=1
   AND T3.STATUS_ID='11'--ʧ��״̬
   AND T3.SECOND_RESULT IN ('1','2','5')--�������������1�պš�2��š�5������� Ϊ��Ч����
   AND T3.CHANGE_TIME >= V_BEG_DATE 
   AND T3.CHANGE_TIME <= V_END_DATE
   --substr(to_char(T3.CHANGE_TIME, 'yyyymmdd'),  1, 6) =STAT_MON
   GROUP BY
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID      
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID ,  ---�Ŷӳ����
       T3.USER_ID
       ;
  V_ROW_NUM   := V_ROW_NUM+SQL%ROWCOUNT;
   COMMIT;
   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM      := 0;
    ERR_MSG     := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_MON_5;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_MON_6
prompt ========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_MON_6(STAT_MON NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_MON_6'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DAY			                   NUMBER := STAT_MON;  --����ʱ��
  -- ERR_NUM                       NUMBER := 0;
  -- ERR_MSG                        VARCHAR2 (200);
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_MON)||'01 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=LAST_DAY(TO_DATE(TO_CHAR(STAT_MON)||'01 23:59:59','YYYY-MM-DD HH24:MI:SS'));  --��������
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_MON IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_6';
    --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '���������ύ�������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_MON
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;

   INSERT INTO TEMP_TA_SALES_RPT_6
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,OLINE_SMIT_QTY
       ,OLINE_SMIT_PRM)

    SELECT
       TT.PAY_TYP AS PAY_MODE,
       TT.OB_COM_NAME,--�ID
       TT.BATCH_NAME, ---���α���
       TT.COM_TYPE,--�������ࣨ�¶������������н飩
       TT.PRJ_ID,--������Ŀ
       TT.COMPANY_ID,--�ֹ�˾
       TT.ORG_ID,--����
       TT.BELONGCITY,--��������
       NVL(TT.WORKPLACE_ID, '-1'),--ְ��ID
       TT.PRJT_MGR_ID AS PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID AS TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID,  --��ϯ
       COUNT(DISTINCT TT.APPNO) AS OLINE_SMIT_QTY,--Ͷ������
       SUM(CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                ELSE TT.TOTAL_FEE END) AS OLINE_SMIT_PRM--�껯����
FROM  (SELECT DISTINCT
         T2.OB_COM_NAME,
         T3.BATCH_NAME,
         T3.COM_TYPE ,
         T2.PRJ_ID ,
         T2.COMPANY_ID,
         T3.BELONGCITY,
         T1.ORG_ID,
         T6.ORG_ID AS PRJT_MGR_ID,
         T6.ORG_ID AS TEM_LEAD_ID,
         T1.USER_ID ,
         T1.STATUS_ID,
         T1.TYPE_ID,
         T5.PAY_TYP,
         T4.APPNO,
         T6.WORKPLACE_ID,
         T4.TOTAL_FEE

FROM (SELECT A.ORG_ID,A.USER_ID,A.STATUS_ID,A.TYPE_ID,A.OB_COM_ID,A.BATCH_ID,A.TASK_ID,A.POLICY_ID,A.CHANGE_TIME
              FROM TB_TASK A
              WHERE A.STATUS_ID ='7'
               AND  A.TYPE_ID ='5'
         UNION ALL
             SELECT B.ORG_ID,B.USER_ID,B.STATUS_ID,B.TYPE_ID,B.OB_COM_ID,B.BATCH_ID,B.TASK_ID,B.POLICY_ID,B.CHANGE_TIME AS CHANGE_TIME
             FROM  TB_TASK_HISTORY B
               WHERE B.STATUS_ID ='7'
              AND  B.TYPE_ID ='5'
              )         T1,
      TB_OB_COM         T2,
      TB_SALE_BATCH     T3,
      C_USER            T6,
      TB_APPLICATION    T4,--Ͷ����������Ϣ��
      TB_APP_PRD_INFO   T5--Ͷ������Ʒ��
 WHERE T1.OB_COM_ID=T2.OB_COM_ID
   AND T1.BATCH_ID=T3.BATCH_ID
   AND T1.USER_ID=T6.USERID
   AND T1.ORG_ID=T6.ORG_ID
   AND T1.TASK_ID=T4.TASK_ID
   AND T1.POLICY_ID=T4.APPNO--Ͷ����ID
   AND T4.APPLICATION_ID=T5.APPLICATION_ID
   AND T1.CHANGE_TIME >= V_BEG_DATE
   AND T1.CHANGE_TIME <= V_END_DATE
          )TT

  GROUP BY
       TT.PAY_TYP,
       TT.OB_COM_NAME,--�ID
       TT.BATCH_NAME, ---���α���
       TT.PRJ_ID,--������Ŀ
       TT.COM_TYPE,--�������ࣨ�¶������������н飩
       TT.COMPANY_ID,--�ֹ�˾
       TT.BELONGCITY,--��������
       TT.ORG_ID,--����
       NVL(TT.WORKPLACE_ID, '-1'),--ְ��ID
       TT.PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID
       ;
 V_ROW_NUM   :=V_ROW_NUM+ SQL%ROWCOUNT;
   COMMIT;
   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
 EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_MON_6;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_MON_8
prompt ========================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.SP_TA_SALES_RPT_MON_8(STAT_MON NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) IS
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_MON_8'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DAY			                   NUMBER := STAT_MON;  --����ʱ��
   --ERR_NUM                       NUMBER := 0;
   --ERR_MSG                        VARCHAR2 (200);
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_MON)||'01 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=LAST_DAY(TO_DATE(TO_CHAR(STAT_MON)||'01 23:59:59','YYYY-MM-DD HH24:MI:SS'));  --��������
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_MON IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_8';
    --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�������ϳɽ��������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_MON
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;

   INSERT INTO TEMP_TA_SALES_RPT_8
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,OLINE_TRAN_QTY
       ,OLINE_TRAN_PRM)
    SELECT
       TT.PAY_TYP AS PAY_MODE,
       TT.OB_COM_NAME,--�ID
       TT.BATCH_NAME, ---���α���
       TT.COM_TYPE,--�������ࣨ�¶������������н飩
       TT.PRJ_ID,--������Ŀ
       TT.COMPANY_ID,--�ֹ�˾
       TT.ORG_ID,--����
       TT.BELONGCITY,--��������
       NVL(TT.WORKPLACE_ID, '-1'),--ְ��ID
       TT.PRJT_MGR_ID AS PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID AS TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID,  --��ϯ
       COUNT(DISTINCT TT.APPNO) AS OLINE_TRAN_QTY,--Ͷ������
       SUM(CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                ELSE TT.TOTAL_FEE END) AS OLINE_TRAN_PRM--�껯����
FROM  ( SELECT DISTINCT
         T2.OB_COM_NAME,
         T3.BATCH_NAME,
         T3.COM_TYPE ,
         T2.PRJ_ID ,
         T2.COMPANY_ID,
         T3.BELONGCITY,
         T1.ORG_ID,
         T6.ORG_ID AS PRJT_MGR_ID,
         T6.ORG_ID AS TEM_LEAD_ID,
         T1.USER_ID ,
         T1.STATUS_ID,
         T1.TYPE_ID,
         T5.PAY_TYP,
         T4.APPNO,
         T6.WORKPLACE_ID,
         T4.TOTAL_FEE

FROM (SELECT A.ORG_ID,A.USER_ID,A.STATUS_ID,A.TYPE_ID,A.OB_COM_ID,A.BATCH_ID,A.TASK_ID,A.POLICY_ID,A.CHANGE_TIME
              FROM TB_TASK A
              WHERE A.STATUS_ID ='12'
               AND  A.TYPE_ID ='7'
         UNION ALL
             SELECT B.ORG_ID,B.USER_ID,B.STATUS_ID,B.TYPE_ID,B.OB_COM_ID,B.BATCH_ID,B.TASK_ID,B.POLICY_ID,B.CHANGE_TIME AS CHANGE_TIME
             FROM  TB_TASK_HISTORY B
               WHERE B.STATUS_ID ='12'
              AND  B.TYPE_ID ='7'
              ) T1,
      TB_OB_COM      T2,
      TB_SALE_BATCH  T3,
      C_USER         T6,
      TB_APPLICATION    T4,--Ͷ����������Ϣ��
      TB_APP_PRD_INFO   T5--Ͷ������Ʒ��
 WHERE T1.OB_COM_ID=T2.OB_COM_ID
   AND T1.BATCH_ID=T3.BATCH_ID
   AND T1.USER_ID=T6.USERID
   AND T1.ORG_ID=T6.ORG_ID
   AND T1.TASK_ID=T4.TASK_ID
   AND T1.POLICY_ID=T4.APPNO--Ͷ����ID
   AND T4.APPLICATION_ID=T5.APPLICATION_ID
   AND T1.CHANGE_TIME >= V_BEG_DATE
   AND T1.CHANGE_TIME <= V_END_DATE

           )TT

  GROUP BY
       TT.PAY_TYP,
       TT.OB_COM_NAME,--�ID
       TT.BATCH_NAME, ---���α���
       TT.PRJ_ID,--������Ŀ
       TT.COM_TYPE,--�������ࣨ�¶������������н飩
       TT.COMPANY_ID,--�ֹ�˾
       TT.BELONGCITY,--��������
       TT.ORG_ID,--����
       NVL(TT.WORKPLACE_ID, '-1'),--ְ��ID
       TT.PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID
       ;

   V_ROW_NUM   := V_ROW_NUM+SQL%ROWCOUNT;
  COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
----------------------------------
    --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '������سɹ��������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_MON
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

   INSERT INTO TEMP_TA_SALES_RPT_8
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,LAND_SUCC_QTY --��سɹ�����
       ,LAND_SUCC_PRM)--��سɹ�������
     
 SELECT
       TT.PAY_TYP AS PAY_MODE,
       TT.OB_COM_NAME AS ACTV_ID,--�ID
       TT.BATCH_NAME AS BAT_ID, ---���α���
       TT.COM_TYPE AS COM_TYP,--�������ࣨ�¶������������н飩
       TT.PRJ_ID AS BAT_PRJT,--������Ŀ
       TT.COMPANY_ID AS COMP_ID,--�ֹ�˾
       TT.ORG_ID AS ORG_TYP,--����
       TT.BELONGCITY AS CITY_ID,--��������
       NVL(TT.WORKPLACE_ID, '-1') WP_ID,--ְ��ID
       TT.PRJT_MGR_ID AS PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID AS TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID,  --��ϯ
       COUNT(DISTINCT TT.APPNO) AS LAND_SUCC_QTY,--Ͷ������
       SUM(CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                ELSE TT.TOTAL_FEE END) AS LAND_SUCC_PRM--�껯����
FROM  ( SELECT DISTINCT
         T2.OB_COM_NAME,
         T3.BATCH_NAME,
         T3.COM_TYPE ,
         T2.PRJ_ID ,
         T2.COMPANY_ID,
         T3.BELONGCITY,
         T1.ORG_ID,
         T6.ORG_ID AS PRJT_MGR_ID,
         T6.ORG_ID AS TEM_LEAD_ID,
         T1.USER_ID ,
         T1.STATUS_ID,
         T1.TYPE_ID,
         T5.PAY_TYP,
         T4.APPNO,
         T6.WORKPLACE_ID,
         T4.TOTAL_FEE
FROM (SELECT A.ORG_ID,A.USER_ID,A.STATUS_ID,A.TYPE_ID,A.OB_COM_ID,A.BATCH_ID,A.TASK_ID,A.POLICY_ID,A.CHANGE_TIME
              FROM TB_TASK A
              WHERE A.STATUS_ID ='12'
               AND  A.TYPE_ID ='7'
         UNION ALL
             SELECT B.ORG_ID,B.USER_ID,B.STATUS_ID,B.TYPE_ID,B.OB_COM_ID,B.BATCH_ID,B.TASK_ID,B.POLICY_ID,B.CHANGE_TIME AS CHANGE_TIME
             FROM  TB_TASK_HISTORY B
               WHERE B.STATUS_ID ='12'
              AND  B.TYPE_ID ='7'
              ) T1,
      TB_OB_COM      T2,
      TB_SALE_BATCH  T3,
      C_USER         T6,
      TB_APPLICATION    T4,--Ͷ����������Ϣ��
      TB_APP_PRD_INFO   T5,--Ͷ������Ʒ��
      TB_LOG T7
 WHERE T1.OB_COM_ID=T2.OB_COM_ID
   AND T1.BATCH_ID=T3.BATCH_ID
   AND T1.USER_ID=T6.USERID
   AND T1.ORG_ID=T6.ORG_ID
   AND T1.TASK_ID=T4.TASK_ID
   AND T1.POLICY_ID=T4.APPNO--Ͷ����ID
   AND T4.APPLICATION_ID=T5.APPLICATION_ID
   AND T7.IDOBJ=T4.APPLICATION_ID
   AND T4.IACCEPT='1'--�����ɹ����״̬
   AND T7.TTIME >= V_BEG_DATE
   AND T7.TTIME <= V_END_DATE
           )TT
  GROUP BY
       TT.PAY_TYP,
       TT.OB_COM_NAME,--�ID
       TT.BATCH_NAME, ---���α���
       TT.PRJ_ID,--������Ŀ
       TT.COM_TYPE,--�������ࣨ�¶������������н飩
       TT.COMPANY_ID,--�ֹ�˾
       TT.BELONGCITY,--��������
       TT.ORG_ID,--����
       NVL(TT.WORKPLACE_ID, '-1'),--ְ��ID
       TT.PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID;
       
   V_ROW_NUM   := SQL%ROWCOUNT+V_ROW_NUM;
   COMMIT;
   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

END SP_TA_SALES_RPT_MON_8;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_WEEK_1
prompt =========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_WEEK_1(STAT_DATE  IN NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
   V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_WEEK_1'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DAY			                   NUMBER := STAT_DATE;  --����ʱ��
   --ERR_NUM                       NUMBER := 0;
   --ERR_MSG                       VARCHAR2 (200);
   BEGIN_DATE                    DATE ;
   END_DATE                      DATE ;
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_1';
      /*
     TEMP_TA_SALES_RPT_DAY_1 ͳ�� FST_CAL_LIST_QTY : �ײ�������
   */
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�����ײ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;
   SELECT TO_DATE(SUBSTR(WEEK_INTERVAL, 1, 10)||' 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
         ,TO_DATE(SUBSTR(WEEK_INTERVAL, 12, 10)||' 23:59:59', 'YYYY-MM-DD HH24:MI:SS')
     INTO BEGIN_DATE
         ,END_DATE
     FROM D_CALENDAR_DIM
    WHERE CAL_DAY_ID = STAT_DATE;

   INSERT INTO TEMP_TA_SALES_RPT_1
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,FST_CAL_LIST_QTY)
        WITH V_TASK_H AS(
SELECT
 -1                  AS HISTORY_ID
,T1.TASK_ID              AS TASK_ID
--,T1.CREATE_TIME          AS CREATE_TIME
,T1.CHANGE_TIME          AS CHANGE_TIME
--,T1.FIRST_RESULT         AS FIRST_RESULT
--,T1.SECOND_RESULT        AS SECOND_RESULT
,T1.USER_ID              AS USER_ID
,T1.ORG_ID               AS ORG_ID
,T1.STATUS_ID            AS STATUS_ID
,T1.TYPE_ID              AS TYPE_ID
--,T1.POLICY_ID            AS POLICY_ID
,T1.OB_COM_ID            AS OB_COM_ID
,T1.BATCH_ID             AS BATCH_ID
,T1.CUS_LIST_ID          AS CUS_LIST_ID
,T1.CHANGE_TIME          AS CREATE_HISTORY_DATE
FROM TB_TASK T1
WHERE --substr(to_char(CHANGE_TIME, 'yyyymmdd'), 1, 6) =STAT_MON
      T1.CHANGE_TIME >= BEGIN_DATE AND T1.CHANGE_TIME <= END_DATE
AND T1.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T1.TYPE_ID<> '4'--�������� �ײ�
UNION ALL
 SELECT
 T2.HISTORY_ID           AS HISTORY_ID
,T2.TASK_ID              AS TASK_ID
--,T2.CREATE_TIME          AS CREATE_TIME
,T2.CHANGE_TIME          AS CHANGE_TIME
--,T2.FIRST_RESULT         AS FIRST_RESULT
--,T2.SECOND_RESULT        AS SECOND_RESULT
,T2.USER_ID              AS USER_ID
,T2.ORG_ID               AS ORG_ID
,T2.STATUS_ID            AS STATUS_ID
,T2.TYPE_ID              AS TYPE_ID
--,T2.POLICY_ID            AS POLICY_ID
,T2.OB_COM_ID            AS OB_COM_ID
,T2.BATCH_ID             AS BATCH_ID
,T2.CUS_LIST_ID          AS CUS_LIST_ID
,T2.CHANGE_TIME  AS CREATE_HISTORY_DATE
FROM TB_TASK_HISTORY T2
WHERE --substr(to_char(CREATE_HISTORY_DATE, 'yyyymmdd'), 1, 6) =STAT_MON
      T2.CHANGE_TIME >= BEGIN_DATE
AND T2.CHANGE_TIME <= END_DATE
AND T2.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T2.TYPE_ID<> '4'--�������� �ײ�
)
    SELECT
       '-1' as PAYMODE,  --���ѷ�ʽ
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME, --���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T1.ORG_ID,--����
       T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ�����
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T1.USER_ID, --��ϯ����
       COUNT(DISTINCT T1.CUS_LIST_ID) as FST_CAL_LIST_QTY--����
        FROM V_TASK_H T1
       --inner join  TB_TASK T3  on T1.TASK_ID=T3.TASK_ID
       inner join  TB_SALE_BATCH  T2 on T2.BATCH_ID=T1.BATCH_ID
       inner join  TB_OB_COM  T4 on T4.OB_COM_ID=T1.OB_COM_ID
       inner join  C_USER  T5 on  T5.USERID=T1.USER_ID  AND T5.ORG_ID=T1.ORG_ID

 WHERE
   T1.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T1.TYPE_ID<>'4'--�������� �ײ�
   AND EXISTS
      (SELECT NULL
        FROM TB_TASK_HISTORY TT
             WHERE
                  TT.TASK_ID=T1.TASK_ID
                  AND TT.STATUS_ID='6'
                  AND TT.TYPE_ID='4'
                  AND TO_CHAR(TT.CREATE_HISTORY_DATE,'YYYYMMDD')=TO_CHAR(T1.CREATE_HISTORY_DATE,'YYYYMMDD')--���ײ�״̬�ı�ʱ����ύ����С��ʱ����ͬһ��
                  )
/*   AND TO_DATE(T1.CREATE_HISTORY_DATE) >=BEGIN_DATE
   and TO_DATE(T1.CREATE_HISTORY_DATE) <= END_DATE*/
   GROUP BY
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME, --���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T1.ORG_ID,--����
       T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ�����
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID ,  ---�Ŷӳ����
       T1.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

    ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_WEEK_1;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_WEEK_10
prompt ==========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_WEEK_10(STAT_DATE IN NUMBER,
                                                    ERR_NUM   OUT NUMBER,
                                                    ERR_MSG   OUT VARCHAR2) is
  V_REPORT_ID  NUMBER := 0; --�������
  V_PROC_NAME  VARCHAR2(50) := 'SP_TA_SALES_RPT_WEEK_10'; --��ǰ��������
  V_STEP       NUMBER := 0; --ִ�в�����ų�ʼֵ
  V_STEP_NO    VARCHAR2(10); --ִ�в���
  V_STEP_DESC  VARCHAR2(200); --��������
  V_ROW_NUM    NUMBER; --SQLִ��Ӱ��ļ�¼��
  V_BEGIN_TIME DATE; --SQL��ʼִ�е�ʱ��
  V_END_TIME   DATE; --SQLִ�н���ʱ��
  --ERR_NUM                       NUMBER := 0;
  --ERR_MSG                        VARCHAR2 (200);
  BEGIN_DATE DATE;
  END_DATE   DATE;
  V_DAY			                   NUMBER := STAT_DATE;  --����ʱ��
BEGIN
  --���ڲ����Ƿ�Ϊ���ж�
  IF STAT_DATE IS NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'STAT_DATE IS NULL!');
  END IF;

  --�����������
  EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_10';
  SELECT TO_DATE(SUBSTR(WEEK_INTERVAL, 1, 10), 'yyyy-mm-dd'),
         TO_DATE(SUBSTR(WEEK_INTERVAL, 12, 10), 'yyyy-mm-dd')
    INTO BEGIN_DATE, END_DATE
    FROM D_CALENDAR_DIM
   WHERE CAL_DAY_ID = STAT_DATE;
  /*
    TEMP_TA_SALES_RPT_DAY_1 ͳ�� FST_CAL_LIST_QTY : �ײ�������
  */
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�������ڿۿ�ɹ��� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;

  INSERT INTO TEMP_TA_SALES_RPT_10
    (PAY_MODE,
     ACTV_ID,
     BAT_ID,
     COM_TYP,
     BAT_PRJT,
     COMP_ID,
     ORG_TYP,
     CITY_ID,
     WP_ID,
     PRJT_MGR_ID,
     TEM_LEAD_ID,
     USER_ID,
     FST_CHARGBK_SUCC_QTY)
    SELECT '-1' as PAY_MODE,
           T4.OB_COM_NAME, --�ID
           T2.BATCH_NAME, ---���α���
           T2.COM_TYPE, --�������ࣨ�¶������������н飩
           T4.PRJ_ID, --������Ŀ
           T4.COMPANY_ID, --�ֹ�˾
           T3.ORG_ID, --����
           T2.BELONGCITY, --��������
           NVL(T5.WORKPLACE_ID, '-1'), --ְ��ID
           T5.ORG_ID, --��Ŀ������
           T5.ORG_ID, ---�Ŷӳ����
           T3.USER_ID, --��ϯ����
           COUNT(DISTINCT Z.POLICYNO) AS KKBJ--���ڿۿ�ɹ���
      FROM PREREC        Z,
           RISKCON       T1,
           TB_SALE_BATCH T2,
           TB_TASK       T3,
           TB_OB_COM     T4,
           C_USER        T5
    /*  FROM PREREC Z inner join RISKCON T1 on  Z.POLICYNO = T1.POLICYNO AND Z.CLASSCODE=T1.CLASSCODE --����ʵ�ձ�--���˱�����
    inner join TB_SALE_BATCH  T2 on T2.BATCH_ID=T3.BATCH_ID
    inner join TB_TASK T3 on T1.APPNO=T3.POLICY_ID
    inner join TB_OB_COM T4 on T4.OB_COM_ID=T3.OB_COM_ID
    inner join C_USER  T5 on T3.USER_ID=T5.USERID AND  T3.ORG_ID=T5.ORG_ID    */
     WHERE Z.POLICYNO = T1.POLICYNO
       AND Z.CLASSCODE = T1.CLASSCODE
       AND T2.BATCH_ID = T3.BATCH_ID
       AND T1.APPNO = T3.POLICY_ID
       AND T4.OB_COM_ID = T3.OB_COM_ID
       AND T3.USER_ID = T5.USERID
       AND T3.ORG_ID = T5.ORG_ID
       AND Z.PCODE NOT IN ('Z', 'X', 'Y', '6', 'M')
       AND Z.SETCODE <> '9'
       AND T1.SALEATTR IN ('61', '62', '63', '64') --���������������ܹ�˾���ֹ�˾
       AND Z.YEARNO = 1 --�����
       AND Z.PCODE = '2' --�շ�
          --AND Z.DEPTCODE IS NOT NULL
       AND Z.PAYDATE between BEGIN_DATE and END_DATE --
     GROUP BY T4.OB_COM_NAME, --�ID
           T2.BATCH_NAME, ---���α���
           T4.PRJ_ID, --������Ŀ
           T2.COM_TYPE, --�������ࣨ�¶������������н飩
           T4.COMPANY_ID, --�ֹ�˾
           T3.ORG_ID, --����
           T2.BELONGCITY, --��������
           NVL(T5.WORKPLACE_ID, '-1'), --ְ��ID
           T5.ORG_ID, --��Ŀ������
           T5.ORG_ID, ---�Ŷӳ����
           T3.USER_ID;

  V_ROW_NUM := SQL%ROWCOUNT;
  COMMIT;

  --��¼��־����
  SP_LOG_EXEC_AFT(V_PROC_NAME, V_STEP_NO, V_ROW_NUM, V_BEGIN_TIME);

  ERR_NUM := 0;
  ERR_MSG := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_WEEK_10;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_WEEK_11
prompt ==========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_WEEK_11(STAT_DATE  IN NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_WEEK_11'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DAY			                   NUMBER := STAT_DATE;  --����ʱ�� 
   --ERR_NUM                       NUMBER := 0;
   --ERR_MSG                        VARCHAR2 (200);
   BEGIN_DATE                    DATE;
   END_DATE                      DATE;
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_11';
      /*
     TEMP_TA_SALES_RPT_DAY_1 ͳ�� FST_CAL_LIST_QTY : �ײ�������
   */
SELECT TO_DATE(SUBSTR(WEEK_INTERVAL, 1, 10), 'yyyy-mm-dd')
      ,TO_DATE(SUBSTR(WEEK_INTERVAL, 12, 10), 'yyyy-mm-dd')
  INTO BEGIN_DATE
      ,END_DATE
  FROM D_CALENDAR_DIM
 WHERE CAL_DAY_ID = TO_NUMBER(STAT_DATE);
 
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�����껯�±� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;
 
   INSERT INTO TEMP_TA_SALES_RPT_11
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,ANNUL_FST_PRM_PRM)
    SELECT
       Z.PAYCODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����
       SUM(DISTINCT NVL((CASE
             WHEN Z.PCODE = '2' AND
                  Z.YEARNO = 1 AND
                  Z.PAYCODE = '10' THEN
              T1.NPAYLEN * T1.PIECES * 12
             WHEN Z.PCODE = '2' AND
                  PAYCODE = '11' THEN
              T1.NPAYLEN * T1.PIECES * 4
             WHEN Z.PCODE = '2' AND
                  Z.PAYCODE = '12' THEN
              T1.NPAYLEN * T1.PIECES * 2
             WHEN Z.PCODE = '2' AND
                  Z.PAYCODE = '13' THEN
             T1.NPAYLEN * T1.PIECES * 1
             ELSE
              0 END), 0)) +
               SUM(DISTINCT NVL((CASE
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '10' THEN
                  T1.NPAYLEN * T1.PIECES * -12
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '11' THEN
                  T1.NPAYLEN * T1.PIECES * -4
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '12' THEN
                  T1.NPAYLEN * T1.PIECES * -2
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '13' THEN
                  T1.NPAYLEN * T1.PIECES * -1
                 ELSE
                  0 END),0)) NHAMOUNT--�껪�±�
  FROM PREREC  Z inner join RISKCON T1 on Z.POLICYNO = T1.POLICYNO    AND Z.CLASSCODE = T1.CLASSCODE --����ʵ�ձ�
       inner join  TB_TASK T3 on T1.appno=T3.POLICY_ID
       inner join TB_SALE_BATCH  T2 on T2.BATCH_ID=T3.BATCH_ID
       inner join TB_OB_COM  T4 on T4.OB_COM_ID=T3.OB_COM_ID
       inner join C_USER  T5 on T3.USER_ID=T5.USERID and T3.ORG_ID=T5.ORG_ID
      -- inner join TB_APPLICATION T6 on  T3.POLICY_ID=T6.APPNO AND T3.TASK_ID=T6.TASK_ID--Ͷ����������Ϣ��
      -- inner join TB_APP_PRD_INFO T7 on T6.APPLICATION_ID=T7.APPLICATION_ID--Ͷ������Ʒ��
       
 WHERE
    Z.PCODE NOT IN ('Z', 'X', 'Y', '6', 'M')
   AND Z.SETCODE <> '9'
   AND T1.SALEATTR IN ('61', '62', '63', '64')--���������������ܹ�˾���ֹ�˾
   AND Z.PCODE IN('8', '2')--�շ�
  -- AND Z.DEPTCODE IS NOT NULL
   AND Z.PAYDATE  between BEGIN_DATE and END_DATE --
   GROUP BY
       Z.PAYCODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID ,  ---�Ŷӳ����
       T3.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_WEEK_11;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_WEEK_12
prompt ==========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_WEEK_12(STAT_DATE  IN NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_WEEK_12'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   --ERR_NUM                       NUMBER := 0;
   --ERR_MSG                        VARCHAR2 (200);
   BEGIN_DATE                    DATE;
   END_DATE                      DATE;
   V_DAY			                   NUMBER := STAT_DATE;  --����ʱ��
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;
   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_12';
      /*
     TEMP_TA_SALES_RPT_DAY_1 ͳ�� FST_CAL_LIST_QTY : �ײ�������
   */
SELECT TO_DATE(SUBSTR(WEEK_INTERVAL, 1, 10), 'yyyy-mm-dd')
      ,TO_DATE(SUBSTR(WEEK_INTERVAL, 12, 10), 'yyyy-mm-dd')
  INTO BEGIN_DATE
      ,END_DATE
  FROM D_CALENDAR_DIM
 WHERE CAL_DAY_ID = STAT_DATE;
 
  V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '����ʵ���±� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;
 
   INSERT INTO TEMP_TA_SALES_RPT_12
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,ACTL_FST_PRM_PRM)
    SELECT
      '-1' as PAY_MODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����
       SUM(DISTINCT NVL((CASE WHEN Z.PCODE = '2' AND Z.YEARNO = 1
                     THEN Z.AMOUNT
                     ELSE 0
                     END),0)) + SUM(DISTINCT NVL(
                (CASE WHEN Z.PCODE = '8' AND Z.YEARNO = 1
                        THEN Z.AMOUNT
                        ELSE 0
                        END),0)) + SUM(DISTINCT NVL(
                (CASE WHEN Z.PCODE NOT IN ('8', '2') AND Z.YEARNO = 1
                      THEN Z.AMOUNT               --�޸Ľ�תȡֵ����
                      ELSE 0
                      END),0)) SSAMOUNT--ʵ���±�
  FROM PREREC  Z inner join RISKCON T1 on Z.POLICYNO = T1.POLICYNO AND Z.CLASSCODE = T1.CLASSCODE
       inner join TB_TASK  T3 on   T1.APPNO=T3.POLICY_ID
       inner join TB_SALE_BATCH   T2 on T2.BATCH_ID=T3.BATCH_ID
       inner join TB_OB_COM     T4 on T4.OB_COM_ID=T3.OB_COM_ID
       inner join C_USER        T5 on T3.USER_ID=T5.USERID and T3.ORG_ID=T5.ORG_ID

 WHERE
   Z.PCODE NOT IN ('Z', 'X', 'Y', '6', 'M')
   AND Z.SETCODE <> '9'
   AND T1.SALEATTR IN ('61', '62', '63', '64')--���������������ܹ�˾���ֹ�˾
  -- AND Z.DEPTCODE IS NOT NULL
   AND Z.PAYDATE between BEGIN_DATE and END_DATE--
   GROUP BY
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T2.BELONGCITY,--��������
       T3.ORG_ID,--����
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID,  ---�Ŷӳ����
       T3.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_WEEK_12;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_WEEK_13
prompt ==========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_WEEK_13(STAT_DATE  IN NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
   V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_WEEK_13'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   --ERR_NUM                       NUMBER := 0;
  -- ERR_MSG                        VARCHAR2 (200);
   BEGIN_DATE                    DATE;
   END_DATE                      DATE;
   V_DAY			                   NUMBER := STAT_DATE;  --����ʱ��
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_13';
      /*
     TEMP_TA_SALES_RPT_DAY_1 ͳ�� FST_CAL_LIST_QTY : �ײ�������
   */
SELECT TO_DATE(SUBSTR(WEEK_INTERVAL, 1, 10), 'yyyy-mm-dd')
      ,TO_DATE(SUBSTR(WEEK_INTERVAL, 12, 10), 'yyyy-mm-dd')
  INTO BEGIN_DATE
      ,END_DATE
  FROM D_CALENDAR_DIM
 WHERE CAL_DAY_ID = STAT_DATE;
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '������ԥ���˱����������˱��� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;
INSERT INTO TEMP_TA_SALES_RPT_13
    (PAY_MODE
    ,ACTV_ID
    ,BAT_ID
    ,COM_TYP
    ,BAT_PRJT
    ,COMP_ID
    ,ORG_TYP
    ,CITY_ID
    ,WP_ID
    ,PRJT_MGR_ID
    ,TEM_LEAD_ID
    ,USER_ID
    ,CNCL_QTY
    ,CNCL_PRM)
   SELECT '-1' AS PAY_MODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����
        COUNT(DISTINCT(CASE  WHEN Z.PCODE = '8' AND Z.YEARNO = 1 
                             THEN Z.POLICYNO
                             END)) * 1   AS YTBJ,--��ԥ���˱�����
                   --���˱���
                   SUM(DISTINCT NVL((CASE
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '10' THEN
                                T1.NPAYLEN * T1.PIECES * 12
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '11' THEN
                                T1.NPAYLEN * T1.PIECES * 4
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '12' THEN
                                T1.NPAYLEN * T1.PIECES * 2
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '13' THEN
                                T1.NPAYLEN * T1.PIECES * 1
                               ELSE
                                0
                           END),
                           0)) YTAMOUNT--��ԥ���˱�����
  FROM PREREC  Z  inner join RISKCON T1 on Z.POLICYNO = T1.POLICYNO
       inner join TB_TASK  T3 on T1.APPNO=T3.POLICY_ID
       inner join TB_SALE_BATCH  T2 on T2.BATCH_ID=T3.BATCH_ID
       inner join TB_OB_COM  T4 on T4.OB_COM_ID=T3.OB_COM_ID
       inner join C_USER T5  on T3.User_Id = T5.USERID and T3.Org_Id = T5.Org_Id
       
 WHERE Z.PCODE NOT IN ('Z', 'X', 'Y', '6', 'M')
   AND Z.PCODE = '8'
   AND Z.SETCODE <> '9'
   AND T1.SALEATTR IN ('61', '62', '63', '64')--���������������ܹ�˾���ֹ�˾
   --AND Z.DEPTCODE IS NOT NULL
   AND Z.PAYDATE between BEGIN_DATE and END_DATE 
   GROUP BY 
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID ,  ---�Ŷӳ����
       T3.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_WEEK_13;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_WEEK_2
prompt =========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_WEEK_2(STAT_DATE  IN NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
   V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_WEEK_2'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   --ERR_NUM                       NUMBER := 0;
   --ERR_MSG                        VARCHAR2 (200);
   BEGIN_DATE                    DATE;
   END_DATE                      DATE;
   V_DAY			                   NUMBER := STAT_DATE;  --����ʱ��
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_2';
      /*
     TEMP_TA_SALES_RPT_DAY_1 ͳ�� FST_CAL_LIST_QTY : �ײ�������
   */

   SELECT TO_DATE(SUBSTR(WEEK_INTERVAL, 1, 10)||' 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
         ,TO_DATE(SUBSTR(WEEK_INTERVAL, 12, 10)||' 23:59:59', 'YYYY-MM-DD HH24:MI:SS')
      INTO BEGIN_DATE
          ,END_DATE
      FROM D_CALENDAR_DIM
     WHERE CAL_DAY_ID = STAT_DATE;

   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�����ײ��Ӵ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;

   INSERT INTO TEMP_TA_SALES_RPT_2
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,FST_CAL_CONT_LIST_QTY)
        WITH V_TASK_H AS(
SELECT
 -1                  AS HISTORY_ID
,T1.TASK_ID              AS TASK_ID
--,T1.CREATE_TIME          AS CREATE_TIME
,T1.CHANGE_TIME          AS CHANGE_TIME
--,T1.FIRST_RESULT         AS FIRST_RESULT
--,T1.SECOND_RESULT        AS SECOND_RESULT
,T1.USER_ID              AS USER_ID
,T1.ORG_ID               AS ORG_ID
,T1.STATUS_ID            AS STATUS_ID
,T1.TYPE_ID              AS TYPE_ID
--,T1.POLICY_ID            AS POLICY_ID
,T1.OB_COM_ID            AS OB_COM_ID
,T1.BATCH_ID             AS BATCH_ID
,T1.CUS_LIST_ID          AS CUS_LIST_ID
,T1.CHANGE_TIME          AS CREATE_HISTORY_DATE
FROM TB_TASK T1
WHERE --substr(to_char(CHANGE_TIME, 'yyyymmdd'), 1, 6) =STAT_MON
      T1.CHANGE_TIME >= BEGIN_DATE AND T1.CHANGE_TIME <= END_DATE
AND T1.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T1.TYPE_ID<> '4'--�������� �ײ�
UNION ALL
 SELECT
 T2.HISTORY_ID           AS HISTORY_ID
,T2.TASK_ID              AS TASK_ID
--,T2.CREATE_TIME          AS CREATE_TIME
,T2.CHANGE_TIME          AS CHANGE_TIME
--,T2.FIRST_RESULT         AS FIRST_RESULT
--,T2.SECOND_RESULT        AS SECOND_RESULT
,T2.USER_ID              AS USER_ID
,T2.ORG_ID               AS ORG_ID
,T2.STATUS_ID            AS STATUS_ID
,T2.TYPE_ID              AS TYPE_ID
--,T2.POLICY_ID            AS POLICY_ID
,T2.OB_COM_ID            AS OB_COM_ID
,T2.BATCH_ID             AS BATCH_ID
,T2.CUS_LIST_ID          AS CUS_LIST_ID
,T2.CHANGE_TIME  AS CREATE_HISTORY_DATE
FROM TB_TASK_HISTORY T2
WHERE --substr(to_char(CREATE_HISTORY_DATE, 'yyyymmdd'), 1, 6) =STAT_MON
      T2.CHANGE_TIME >= BEGIN_DATE
AND T2.CHANGE_TIME <= END_DATE
AND T2.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T2.TYPE_ID<> '4'--�������� �ײ�
)
    SELECT
      '-1' as PAY_MODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME, --���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'), --ְ�����
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����,
       COUNT(DISTINCT T1.CUS_LIST_ID)--�ײ��Ӵ�������
  FROM TB_SALE_HISTORY T1
       inner join  V_TASK_H T3 on T1.TASK_ID=T3.TASK_ID
       inner join TB_SALE_BATCH  T2 on T2.BATCH_ID=T3.BATCH_ID
       inner join TB_OB_COM  T4 on T4.OB_COM_ID=T1.OBCOM_ID
       inner join  C_USER  T5  on T5.USERID=T3.USER_ID  and T5.ORG_ID=T3.ORG_ID

 WHERE  T3.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T1.IS_CONTACT='1'--�Ӵ������0��δ�Ӵ���1���ѽӴ���
   AND T3.TYPE_ID<>'4'--�������� �ײ�
   AND EXISTS
      (SELECT NULL
        FROM TB_TASK_HISTORY TT
             WHERE TT.TASK_ID=T3.TASK_ID
                  AND TT.STATUS_ID='6'
                  AND TT.TYPE_ID='4'
                  AND TO_CHAR(TT.CREATE_HISTORY_DATE,'YYYYMMDD')=TO_CHAR(T3.CREATE_HISTORY_DATE,'YYYYMMDD')--���ײ�״̬�ı�ʱ����ύ����С��ʱ����ͬһ��
                  )
   --AND TO_DATE(T3.CREATE_HISTORY_DATE)  between BEGIN_DATE and END_DATE
   GROUP BY
      '-1' ,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME, --���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'), --ְ�����
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID ,  ---�Ŷӳ����
       T3.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_WEEK_2;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_WEEK_3
prompt =========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_WEEK_3(STAT_DATE  IN NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
   V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_WEEK_3'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   --ERR_NUM                       NUMBER := 0;
   --ERR_MSG                       VARCHAR2 (200);
   BEGIN_DATE                    DATE;
   END_DATE                      DATE;
   V_DAY			                   NUMBER := STAT_DATE;  --����ʱ��
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_3';
      /*
     TEMP_TA_SALES_RPT_DAY_1 ͳ�� FST_CAL_LIST_QTY : �ײ�������
   */
   SELECT TO_DATE(SUBSTR(WEEK_INTERVAL, 1, 10)||' 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
         ,TO_DATE(SUBSTR(WEEK_INTERVAL, 12, 10)||' 23:59:59', 'YYYY-MM-DD HH24:MI:SS')
  INTO BEGIN_DATE
      ,END_DATE
  FROM D_CALENDAR_DIM
 WHERE CAL_DAY_ID = STAT_DATE;
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '������������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;

   INSERT INTO TEMP_TA_SALES_RPT_3
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,TRK_LIST_QTY)
WITH V_TASK_H AS(
SELECT
 -1                   AS HISTORY_ID
,T1.TASK_ID              AS TASK_ID
--,T1.CREATE_TIME          AS CREATE_TIME
,T1.CHANGE_TIME          AS CHANGE_TIME
--,T1.FIRST_RESULT         AS FIRST_RESULT
--,T1.SECOND_RESULT        AS SECOND_RESULT
,T1.USER_ID              AS USER_ID
,T1.ORG_ID               AS ORG_ID
,T1.STATUS_ID            AS STATUS_ID
,T1.TYPE_ID              AS TYPE_ID
--,T1.POLICY_ID            AS POLICY_ID
,T1.OB_COM_ID            AS OB_COM_ID
,T1.BATCH_ID             AS BATCH_ID
,T1.CUS_LIST_ID          AS CUS_LIST_ID
,T1.CHANGE_TIME          AS CREATE_HISTORY_DATE
FROM TB_TASK T1
WHERE T1.CHANGE_TIME >= BEGIN_DATE 
   AND T1.CHANGE_TIME <= END_DATE
   AND TYPE_ID='2' --�������� 2��������������
   AND T1.TYPE_ID<>'4'--��ǰ�������Ͳ�Ϊ�ײ�����
UNION ALL
 SELECT
 T2.HISTORY_ID           AS HISTORY_ID
,T2.TASK_ID              AS TASK_ID
--,T2.CREATE_TIME          AS CREATE_TIME
,T2.CHANGE_TIME          AS CHANGE_TIME
--,T2.FIRST_RESULT         AS FIRST_RESULT
--,T2.SECOND_RESULT        AS SECOND_RESULT
,T2.USER_ID              AS USER_ID
,T2.ORG_ID               AS ORG_ID
,T2.STATUS_ID            AS STATUS_ID
,T2.TYPE_ID              AS TYPE_ID
--,T2.POLICY_ID            AS POLICY_ID
,T2.OB_COM_ID            AS OB_COM_ID
,T2.BATCH_ID             AS BATCH_ID
,T2.CUS_LIST_ID          AS CUS_LIST_ID
,T2.CHANGE_TIME  AS CREATE_HISTORY_DATE
FROM TB_TASK_HISTORY T2
WHERE T2.CHANGE_TIME >= BEGIN_DATE 
   AND T2.CHANGE_TIME <= END_DATE
   AND T2.TYPE_ID='2' --�������� 2��������������
   AND T2.TYPE_ID<>'4'--��ǰ�������Ͳ�Ϊ�ײ�����
)
    SELECT
      '-1' as PAY_MODE,
       T4.OB_COM_NAME, --�����
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T1.ORG_ID,--����
       T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T1.USER_ID, --��ϯ����
       COUNT(DISTINCT T1.CUS_LIST_ID)--����������
  FROM V_TASK_H T1
       --inner join TB_TASK T3  on T1.TASK_ID=T3.TASK_ID
       inner join  TB_SALE_BATCH   T2 on T2.BATCH_ID=T1.BATCH_ID
       inner join TB_OB_COM  T4 on T4.OB_COM_ID=T1.OB_COM_ID
       inner join C_USER T5 on  T1.USER_ID=T5.USERID AND T1.ORG_ID=T5.ORG_ID

 WHERE 1=1
       AND T1.TYPE_ID='2' --�������� 2��������������
   AND T1.TYPE_ID<>'4'--��ǰ�������Ͳ�Ϊ�ײ�����
   AND NOT EXISTS
      (SELECT NULL
        FROM TB_TASK_HISTORY TT
             WHERE TT.TASK_ID=T1.TASK_ID
                  AND TT.TYPE_ID='4'--�ײ�����
                 AND TO_CHAR(TT.CREATE_HISTORY_DATE,'YYYYMMDD')=TO_CHAR(T1.CREATE_HISTORY_DATE,'YYYYMMDD')--���ײ����͸ı�ʱ������۸��������ύ����С��ʱ����ͬһͳ������
                  )
   --AND TO_DATE(T1.CREATE_HISTORY_DATE) between BEGIN_DATE and END_DATE
   GROUP BY
      '-1' ,
       T4.OB_COM_NAME, --�����
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T1.ORG_ID,--����
       T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID ,  ---�Ŷӳ����
       T1.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;
end SP_TA_SALES_RPT_WEEK_3;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_WEEK_4
prompt =========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_WEEK_4(STAT_DATE  IN NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_WEEK_4'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
  -- ERR_NUM                       NUMBER := 0;
  -- ERR_MSG                        VARCHAR2 (200);
   BEGIN_DATE                    DATE;
   END_DATE                      DATE;
    V_DAY			                   NUMBER := STAT_DATE;  --����ʱ�� 
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_4';
      /*
     TEMP_TA_SALES_RPT_DAY_1 ͳ�� FST_CAL_LIST_QTY : �ײ�������
   */
 SELECT TO_DATE(SUBSTR(WEEK_INTERVAL, 1, 10)||' 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
       ,TO_DATE(SUBSTR(WEEK_INTERVAL, 12, 10)||' 23:59:59', 'YYYY-MM-DD HH24:MI:SS')
  INTO BEGIN_DATE,END_DATE
  FROM D_CALENDAR_DIM
 WHERE CAL_DAY_ID = STAT_DATE;
 
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '����Ӵ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;
   INSERT INTO TEMP_TA_SALES_RPT_4
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,CONT_LIST_QTY)
    SELECT 
       '-1' as PAY_MODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,--��������
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����
       COUNT(DISTINCT T1.CUS_LIST_ID)--�Ӵ�������
  FROM TB_SALE_HISTORY T1 inner join  TB_TASK  T3 on T1.TASK_ID=T3.TASK_ID
      inner join  TB_SALE_BATCH  T2 on T2.BATCH_ID=T3.BATCH_ID
      inner join TB_OB_COM T4 on T4.OB_COM_ID=T1.OBCOM_ID 
      inner join C_USER T5  on T3.USER_ID=T5.USERID and T3.ORG_ID=T5.ORG_ID
      
 WHERE 
   T1.IS_CONTACT='1'--�Ӵ������0��δ�Ӵ���1���ѽӴ���
   AND T1.CREATE_HISTORY_DATE BETWEEN BEGIN_DATE AND END_DATE
   GROUP BY
      '-1' ,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T2.BELONGCITY,--��������
       T3.ORG_ID,--����
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID ,--��Ŀ������
       T5.ORG_ID ,  ---�Ŷӳ����
       T3.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_WEEK_4;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_WEEK_5
prompt =========================================
prompt
create or replace procedure sxdxsj.SP_TA_SALES_RPT_WEEK_5(STAT_DATE  IN NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) is
 V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_WEEK_5'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
  -- ERR_NUM                       NUMBER := 0;
  -- ERR_MSG                        VARCHAR2 (200);
   BEGIN_DATE                    DATE;
   END_DATE                      DATE;
   V_DAY			                   NUMBER := STAT_DATE;  --����ʱ�� 
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_5';
      /*
     TEMP_TA_SALES_RPT_DAY_1 ͳ�� FST_CAL_LIST_QTY : �ײ�������
   */
 SELECT TO_DATE(SUBSTR(WEEK_INTERVAL, 1, 10)||' 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
       ,TO_DATE(SUBSTR(WEEK_INTERVAL, 12, 10)||' 23:59:59', 'YYYY-MM-DD HH24:MI:SS')
  INTO BEGIN_DATE
      ,END_DATE
  FROM D_CALENDAR_DIM
 WHERE CAL_DAY_ID = STAT_DATE;
 V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '����ܾ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM := 0;
  --���㵱ǰ״̬����
   INSERT INTO TEMP_TA_SALES_RPT_5
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,REJ_LIST_QTY)
    SELECT
       '-1' as PAY_MODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
      T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����
       COUNT(DISTINCT T3.CUS_LIST_ID)--����
  FROM TB_TASK T3
       inner join TB_SALE_BATCH   T2 on T2.BATCH_ID=T3.BATCH_ID 
       inner join TB_OB_COM  T4 on T4.OB_COM_ID=T3.OB_COM_ID
       inner join C_USER T5 on T3.USER_ID=T5.USERID and T3.ORG_ID=T5.ORG_ID
 WHERE 1=1
   AND T3.STATUS_ID='11'--ʧ��״̬
   AND T3.SECOND_RESULT IN ('1','2','5')--�������������1�պš�2��š�5������� Ϊ��Ч����
   AND T3.CHANGE_TIME between BEGIN_DATE and END_DATE
   GROUP BY
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID,--��Ŀ������
       T5.ORG_ID,  ---�Ŷӳ����
       T3.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;
  --���㵱ǰ״̬����
   INSERT INTO TEMP_TA_SALES_RPT_5
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,REJ_LIST_QTY)
    SELECT
       '-1' as PAY_MODE,
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.PRJ_ID,--������Ŀ
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
      T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID as PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID as TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID, --��ϯ����
       COUNT(DISTINCT T3.CUS_LIST_ID)--����
  FROM TB_TASK_HISTORY T3
       inner join TB_SALE_BATCH   T2 on T2.BATCH_ID=T3.BATCH_ID 
       inner join TB_OB_COM  T4 on T4.OB_COM_ID=T3.OB_COM_ID
       inner join C_USER T5 on T3.USER_ID=T5.USERID and T3.ORG_ID=T5.ORG_ID
 WHERE 1=1
   AND T3.STATUS_ID='11'--ʧ��״̬
   AND T3.SECOND_RESULT IN ('1','2','5')--�������������1�պš�2��š�5������� Ϊ��Ч����
   AND T3.CHANGE_TIME between BEGIN_DATE and END_DATE
   GROUP BY
       T4.OB_COM_NAME, --�ID
       T2.BATCH_NAME,   ---���α���
       T4.PRJ_ID,--������Ŀ
       T2.COM_TYPE,--�������ࣨ�¶������������н飩
       T4.COMPANY_ID,--�ֹ�˾
       T3.ORG_ID,--����
       T2.BELONGCITY,
       NVL(T5.WORKPLACE_ID, '-1'),--ְ��ID
       T5.ORG_ID,--��Ŀ������
       T5.ORG_ID,  ---�Ŷӳ����
       T3.USER_ID
       ;

   V_ROW_NUM   := V_ROW_NUM+SQL%ROWCOUNT;
   COMMIT;
   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

end SP_TA_SALES_RPT_WEEK_5;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_WEEK_6
prompt =========================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.SP_TA_SALES_RPT_WEEK_6(STAT_DATE  IN NUMBER
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2)
       IS
   V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_WEEK_6'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   --ERR_NUM                       NUMBER := 0;
   --ERR_MSG                       VARCHAR2 (200);
   BEGIN_DATE                    DATE;
   END_DATE                      DATE;
   V_DAY			                   NUMBER := STAT_DATE;  --����ʱ��
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_6';
 SELECT TO_DATE(SUBSTR(WEEK_INTERVAL, 1, 10)||' 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
       ,TO_DATE(SUBSTR(WEEK_INTERVAL, 12, 10)||' 23:59:59', 'YYYY-MM-DD HH24:MI:SS')
  INTO BEGIN_DATE
      ,END_DATE
  FROM D_CALENDAR_DIM
 WHERE CAL_DAY_ID = STAT_DATE;
/*
     TEMP_TA_SALES_RPT_DAY_1 ͳ�� FST_CAL_LIST_QTY : �ײ�������
   */

   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '���������ύ�������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM  := 0;

INSERT INTO TEMP_TA_SALES_RPT_6
    (PAY_MODE
    ,ACTV_ID
    ,BAT_ID
    ,COM_TYP
    ,BAT_PRJT
    ,COMP_ID
    ,ORG_TYP
    ,CITY_ID
    ,WP_ID
    ,PRJT_MGR_ID
    ,TEM_LEAD_ID
    ,USER_ID
    ,OLINE_SMIT_QTY
    ,OLINE_SMIT_PRM)
    SELECT
       TT.PAY_TYP AS PAY_MODE,
       TT.OB_COM_NAME,--�ID
       TT.BATCH_NAME, ---���α���
       TT.COM_TYPE,--�������ࣨ�¶������������н飩
       TT.PRJ_ID,--������Ŀ
       TT.COMPANY_ID,--�ֹ�˾
       TT.ORG_ID,--����
       TT.BELONGCITY,--��������
       NVL(TT.WORKPLACE_ID, '-1'),--ְ��ID
       TT.PRJT_MGR_ID AS PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID AS TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID,  --��ϯ
       COUNT(DISTINCT TT.APPNO) AS OLINE_SMIT_QTY,--Ͷ������
       SUM(CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                ELSE TT.TOTAL_FEE END)AS OLINE_SMIT_PRM --�껯����
FROM  ( SELECT DISTINCT
         T2.OB_COM_NAME,
         T3.BATCH_NAME,
         T3.COM_TYPE ,
         T2.PRJ_ID ,
         T2.COMPANY_ID,
         T3.BELONGCITY,
         T1.ORG_ID,
         T6.ORG_ID AS PRJT_MGR_ID,
         T6.ORG_ID AS TEM_LEAD_ID,
         T1.USER_ID ,
         T1.STATUS_ID,
         T1.TYPE_ID,
         T5.PAY_TYP,
         T4.APPNO,
         T6.WORKPLACE_ID,
         T4.TOTAL_FEE

FROM (SELECT A.ORG_ID,A.USER_ID,A.STATUS_ID,A.TYPE_ID,A.OB_COM_ID,A.BATCH_ID,A.TASK_ID,A.POLICY_ID,A.CHANGE_TIME
              FROM TB_TASK A
              WHERE A.STATUS_ID ='7'
               AND  A.TYPE_ID ='5'
         UNION ALL
             SELECT B.ORG_ID,B.USER_ID,B.STATUS_ID,B.TYPE_ID,B.OB_COM_ID,B.BATCH_ID,B.TASK_ID,B.POLICY_ID,B.CHANGE_TIME AS CHANGE_TIME
             FROM  TB_TASK_HISTORY B
               WHERE B.STATUS_ID ='7'
              AND  B.TYPE_ID ='5'
              ) T1,
      TB_OB_COM      T2,
      TB_SALE_BATCH  T3,
      C_USER         T6,
      TB_APPLICATION    T4,--Ͷ����������Ϣ��
      TB_APP_PRD_INFO   T5--Ͷ������Ʒ��
 WHERE T1.OB_COM_ID=T2.OB_COM_ID
   AND T1.BATCH_ID=T3.BATCH_ID
   AND T1.USER_ID=T6.USERID
   AND T1.ORG_ID=T6.ORG_ID
   AND T1.TASK_ID=T4.TASK_ID
   AND T1.POLICY_ID=T4.APPNO--Ͷ����ID
   AND T4.APPLICATION_ID=T5.APPLICATION_ID
   AND T1.CHANGE_TIME BETWEEN BEGIN_DATE AND END_DATE

           )TT

  GROUP BY
       TT.PAY_TYP,
       TT.OB_COM_NAME,--�ID
       TT.BATCH_NAME, ---���α���
       TT.PRJ_ID,--������Ŀ
       TT.COM_TYPE,--�������ࣨ�¶������������н飩
       TT.COMPANY_ID,--�ֹ�˾
       TT.BELONGCITY,--��������
       TT.ORG_ID,--����
       NVL(TT.WORKPLACE_ID, '-1'),--ְ��ID
       TT.PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID
       ;

   V_ROW_NUM   := V_ROW_NUM+SQL%ROWCOUNT;
   COMMIT;
   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

    ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

END SP_TA_SALES_RPT_WEEK_6;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_WEEK_8
prompt =========================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.SP_TA_SALES_RPT_WEEK_8(STAT_DATE  IN VARCHAR2
                                                   ,ERR_NUM   OUT  NUMBER
                                                   ,ERR_MSG   OUT  VARCHAR2) IS
   V_REPORT_ID                   NUMBER :=01;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_WEEK_8'; --��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   -- ERR_NUM                       NUMBER := 0;
   -- ERR_MSG                       VARCHAR2 (200);
   BEGIN_DATE                    DATE;
   END_DATE                      DATE;
   V_DAY			                   NUMBER := STAT_DATE;  --����ʱ��
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_DATE IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'STAT_DATE IS NULL!');
   END IF;

   --�����������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_8';
    --��¼��־��ʼ
    V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�������ϳɽ��������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
  V_ROW_NUM  := 0;
 SELECT TO_DATE(SUBSTR(WEEK_INTERVAL, 1, 10)||' 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
       ,TO_DATE(SUBSTR(WEEK_INTERVAL, 12, 10)||' 23:59:59', 'YYYY-MM-DD HH24:MI:SS')
          INTO BEGIN_DATE,
                END_DATE
    FROM D_CALENDAR_DIM
     WHERE  CAL_DAY_ID =TO_NUMBER(STAT_DATE);

   INSERT INTO TEMP_TA_SALES_RPT_8
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,OLINE_TRAN_QTY
       ,OLINE_TRAN_PRM)
     SELECT
       TT.PAY_TYP AS PAY_MODE,
       TT.OB_COM_NAME,--�ID
       TT.BATCH_NAME, ---���α���
       TT.COM_TYPE,--�������ࣨ�¶������������н飩
       TT.PRJ_ID,--������Ŀ
       TT.COMPANY_ID,--�ֹ�˾
       TT.ORG_ID,--����
       TT.BELONGCITY,--��������
       NVL(TT.WORKPLACE_ID, '-1'),--ְ��ID
       TT.PRJT_MGR_ID AS PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID AS TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID,  --��ϯ
       COUNT(DISTINCT TT.APPNO) AS OLINE_TRAN_QTY,--Ͷ������
       SUM(CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                ELSE TT.TOTAL_FEE END) AS OLINE_TRAN_PRM--�껯����
FROM  ( SELECT DISTINCT
         T2.OB_COM_NAME,
         T3.BATCH_NAME,
         T3.COM_TYPE ,
         T2.PRJ_ID ,
         T2.COMPANY_ID,
         T3.BELONGCITY,
         T1.ORG_ID,
         T6.ORG_ID AS PRJT_MGR_ID,
         T6.ORG_ID AS TEM_LEAD_ID,
         T1.USER_ID ,
         T1.STATUS_ID,
         T1.TYPE_ID,
         T5.PAY_TYP,
         T4.APPNO,
         T6.WORKPLACE_ID,
         T4.TOTAL_FEE

FROM (SELECT A.ORG_ID,A.USER_ID,A.STATUS_ID,A.TYPE_ID,A.OB_COM_ID,A.BATCH_ID,A.TASK_ID,A.POLICY_ID,A.CHANGE_TIME
              FROM TB_TASK A
              WHERE A.STATUS_ID ='12'
               AND  A.TYPE_ID ='7'
         UNION ALL
             SELECT B.ORG_ID,B.USER_ID,B.STATUS_ID,B.TYPE_ID,B.OB_COM_ID,B.BATCH_ID,B.TASK_ID,B.POLICY_ID,B.CHANGE_TIME AS CHANGE_TIME
             FROM  TB_TASK_HISTORY B
               WHERE B.STATUS_ID ='12'
              AND  B.TYPE_ID ='7'
              ) T1,
      TB_OB_COM      T2,
      TB_SALE_BATCH  T3,
      C_USER         T6,
      TB_APPLICATION    T4,--Ͷ����������Ϣ��
      TB_APP_PRD_INFO   T5--Ͷ������Ʒ��
 WHERE T1.OB_COM_ID=T2.OB_COM_ID
   AND T1.BATCH_ID=T3.BATCH_ID
   AND T1.USER_ID=T6.USERID
   AND T1.ORG_ID=T6.ORG_ID
   AND T1.TASK_ID=T4.TASK_ID
   AND T1.POLICY_ID=T4.APPNO--Ͷ����ID
   AND T4.APPLICATION_ID=T5.APPLICATION_ID
   AND T1.CHANGE_TIME >= BEGIN_DATE
   AND T1.CHANGE_TIME <= END_DATE

           )TT

  GROUP BY
       TT.PAY_TYP,
       TT.OB_COM_NAME,--�ID
       TT.BATCH_NAME, ---���α���
       TT.PRJ_ID,--������Ŀ
       TT.COM_TYPE,--�������ࣨ�¶������������н飩
       TT.COMPANY_ID,--�ֹ�˾
       TT.BELONGCITY,--��������
       TT.ORG_ID,--����
       NVL(TT.WORKPLACE_ID, '-1'),--ְ��ID
       TT.PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID
       ;
 V_ROW_NUM   := V_ROW_NUM+SQL%ROWCOUNT;
   COMMIT;
   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
----------------------------------
    --��¼��־��ʼ
    V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '������سɹ��������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , STAT_DATE
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

   INSERT INTO TEMP_TA_SALES_RPT_8
       (PAY_MODE
       ,ACTV_ID
       ,BAT_ID
       ,COM_TYP
       ,BAT_PRJT
       ,COMP_ID
       ,ORG_TYP
       ,CITY_ID
       ,WP_ID
       ,PRJT_MGR_ID
       ,TEM_LEAD_ID
       ,USER_ID
       ,LAND_SUCC_QTY --��سɹ�����
       ,LAND_SUCC_PRM)--��سɹ�������
     
 SELECT
       TT.PAY_TYP AS PAY_MODE,
       TT.OB_COM_NAME AS ACTV_ID,--�ID
       TT.BATCH_NAME AS BAT_ID, ---���α���
       TT.COM_TYPE AS COM_TYP,--�������ࣨ�¶������������н飩
       TT.PRJ_ID AS BAT_PRJT,--������Ŀ
       TT.COMPANY_ID AS COMP_ID,--�ֹ�˾
       TT.ORG_ID AS ORG_TYP,--����
       TT.BELONGCITY AS CITY_ID,--��������
       NVL(TT.WORKPLACE_ID, '-1') WP_ID,--ְ��ID
       TT.PRJT_MGR_ID AS PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID AS TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID,  --��ϯ
       COUNT(DISTINCT TT.APPNO) AS LAND_SUCC_QTY,--Ͷ������
       SUM(CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                ELSE TT.TOTAL_FEE END) AS LAND_SUCC_PRM--�껯����
FROM  ( SELECT DISTINCT
         T2.OB_COM_NAME,
         T3.BATCH_NAME,
         T3.COM_TYPE ,
         T2.PRJ_ID ,
         T2.COMPANY_ID,
         T3.BELONGCITY,
         T1.ORG_ID,
         T6.ORG_ID AS PRJT_MGR_ID,
         T6.ORG_ID AS TEM_LEAD_ID,
         T1.USER_ID ,
         T1.STATUS_ID,
         T1.TYPE_ID,
         T5.PAY_TYP,
         T4.APPNO,
         T6.WORKPLACE_ID,
         T4.TOTAL_FEE
FROM (SELECT A.ORG_ID,A.USER_ID,A.STATUS_ID,A.TYPE_ID,A.OB_COM_ID,A.BATCH_ID,A.TASK_ID,A.POLICY_ID,A.CHANGE_TIME
              FROM TB_TASK A
              WHERE A.STATUS_ID ='12'
               AND  A.TYPE_ID ='7'
         UNION ALL
             SELECT B.ORG_ID,B.USER_ID,B.STATUS_ID,B.TYPE_ID,B.OB_COM_ID,B.BATCH_ID,B.TASK_ID,B.POLICY_ID,B.CHANGE_TIME AS CHANGE_TIME
             FROM  TB_TASK_HISTORY B
               WHERE B.STATUS_ID ='12'
              AND  B.TYPE_ID ='7'
              ) T1,
      TB_OB_COM      T2,
      TB_SALE_BATCH  T3,
      C_USER         T6,
      TB_APPLICATION    T4,--Ͷ����������Ϣ��
      TB_APP_PRD_INFO   T5,--Ͷ������Ʒ��
      TB_LOG T7
 WHERE T1.OB_COM_ID=T2.OB_COM_ID
   AND T1.BATCH_ID=T3.BATCH_ID
   AND T1.USER_ID=T6.USERID
   AND T1.ORG_ID=T6.ORG_ID
   AND T1.TASK_ID=T4.TASK_ID
   AND T1.POLICY_ID=T4.APPNO--Ͷ����ID
   AND T4.APPLICATION_ID=T5.APPLICATION_ID
   AND T7.IDOBJ=T4.APPLICATION_ID
   AND T4.IACCEPT='1'--�����ɹ����״̬
   AND T7.TTIME >= BEGIN_DATE
   AND T7.TTIME <= END_DATE
           )TT
  GROUP BY
       TT.PAY_TYP,
       TT.OB_COM_NAME,--�ID
       TT.BATCH_NAME, ---���α���
       TT.PRJ_ID,--������Ŀ
       TT.COM_TYPE,--�������ࣨ�¶������������н飩
       TT.COMPANY_ID,--�ֹ�˾
       TT.BELONGCITY,--��������
       TT.ORG_ID,--����
       NVL(TT.WORKPLACE_ID, '-1'),--ְ��ID
       TT.PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID;
       
   V_ROW_NUM   := SQL%ROWCOUNT+V_ROW_NUM;
   COMMIT;
   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
    ERR_NUM                    := 0;
    ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;

END SP_TA_SALES_RPT_WEEK_8;
/

prompt
prompt Creating procedure PROC_TA_SALES_RPT
prompt ====================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_TA_SALES_RPT(I_DATE_DAY IN NUMBER
                                              --, I_END_DATE     IN       NUMBER
                                             ,
                                              ERR_NUM OUT NUMBER,
                                              ERR_MSG OUT VARCHAR2) AS
    /**
    * ���������� ���ô洢����
    * ��������� I_DATE_DAY             ����ʱ��,�������Ϊ��,�׳��쳣
    * ��������� ERR_NUM                ���ִ���ʱ����ִ�д����
    * �������������ERR_MSG             ���ִ���ʱ���صĴ�����Ϣ
    * ��д��Ա�����ҷ�
    * �������ڣ�2012-03-29
    * ��˾���ƣ�
    **/
    V_DATE_DAY NUMBER := I_DATE_DAY; --����ʱ��
    STAT_DATE  NUMBER :=V_DATE_DAY;
    STAT_MON  NUMBER(6);
    V_DATE VARCHAR2(20);
    --V_END_DAY                     NUMBER := I_END_DATE;       --����ʱ��
    V_REPORT_ID  NUMBER := 01; --�������
    V_PROC_NAME  VARCHAR2(50) := 'PROC_DAILY_RPT_CALL'; --��ǰ��������
    V_STEP       NUMBER := 0; --ִ�в�����ų�ʼֵ
    V_STEP_NO    VARCHAR2(10); --ִ�в���
    V_STEP_DESC  VARCHAR2(200); --��������
    V_ROW_NUM    NUMBER; --SQLִ��Ӱ��ļ�¼��
    V_BEGIN_TIME DATE; --SQL��ʼִ�е�ʱ��
    V_END_TIME   DATE; --SQLִ�н���ʱ��
BEGIN
    --���ڲ����Ƿ�Ϊ���ж�
    IF V_DATE_DAY IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'I_DATE_DAY IS NULL!');
    END IF;
    /* IF V_END_DAY IS NULL
    THEN
       RAISE_APPLICATION_ERROR (-20001, 'I_END_DATE IS NULL!');
    END IF;*/
    --�����ʱ������
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_1';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_2';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_3';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_4';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_5';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_6';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_8';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_10';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_11';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_12';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_13';
    --��¼��־��ʼ
    V_STEP       := V_STEP + 1;
    V_STEP_NO    := SF_CREATE_STEP(V_STEP);
    V_STEP_DESC  := '���������ձ��洢����';
    V_BEGIN_TIME := SYSDATE;
    SP_LOG_EXEC_BEF(V_PROC_NAME,
                    V_STEP_NO,
                    V_DATE_DAY,
                    V_STEP_DESC,
                    V_BEGIN_TIME,
                    V_REPORT_ID);
 V_ROW_NUM := 0;
   -- STAT_DATE := V_DATE_DAY;
   SP_TA_SALES_RPT_DAY_1(STAT_DATE,ERR_NUM,ERR_MSG );
   SP_TA_SALES_RPT_DAY_2(STAT_DATE,ERR_NUM,ERR_MSG );
   SP_TA_SALES_RPT_DAY_3(STAT_DATE,ERR_NUM,ERR_MSG );
   SP_TA_SALES_RPT_DAY_4(STAT_DATE,ERR_NUM,ERR_MSG );
   SP_TA_SALES_RPT_DAY_5(STAT_DATE,ERR_NUM,ERR_MSG );
   SP_TA_SALES_RPT_DAY_6(STAT_DATE,ERR_NUM,ERR_MSG );
   SP_TA_SALES_RPT_DAY_8(STAT_DATE,ERR_NUM,ERR_MSG );
   SP_TA_SALES_RPT_DAY_10(STAT_DATE,ERR_NUM,ERR_MSG );
   SP_TA_SALES_RPT_DAY_11(STAT_DATE,ERR_NUM,ERR_MSG );
   SP_TA_SALES_RPT_DAY_12(STAT_DATE,ERR_NUM,ERR_MSG );
   SP_TA_SALES_RPT_DAY_13(STAT_DATE,ERR_NUM,ERR_MSG );
   --֧�ֶ��μ���
   DELETE FROM TA_SALES_RPT_DAY T
       WHERE T.CAL_DAY_ID=TO_DATE(STAT_DATE,'yyyy-mm-dd');
       COMMIT;
    INSERT INTO TA_SALES_RPT_DAY
        (CAL_DAY_ID
        ,PAY_MODE
        ,ACTV_ID
        ,BAT_CODE
        ,COM_TYP
        ,BAT_PRJT
        ,COMP_ID
        ,CITY_ID
        ,CTR_CODE
        ,SALES_PRJT
        ,TEM_CODE
        ,WP_ID
        ,PRJT_MGR_ID
        ,TEM_LEAD_ID
        ,USER_ID
        ,FST_CAL_LIST_QTY
        ,FST_CAL_CONT_LIST_QTY
        ,TRK_LIST_QTY
        ,CONT_LIST_QTY
        ,REJ_LIST_QTY
        ,OLINE_SMIT_QTY
        ,OLINE_SMIT_PRM
        ,OLINE_TRAN_QTY
        ,OLINE_TRAN_PRM
        ,LAND_SUCC_QTY
        ,LAND_SUCC_PRM
        ,FST_CHARGBK_SUCC_QTY
        ,ANNUL_FST_PRM_PRM
        ,ACTL_FST_PRM_PRM
        ,CNCL_QTY
        ,CNCL_PRM)
      SELECT    TT.CAL_DAY_ID      AS CAL_DAY_ID
                ,TT.PAY_MODE        AS  PAY_MODE
                ,TT.ACTV_ID         AS  ACTV_ID
                ,TT.BAT_ID        AS  BAT_CODE
                ,TT.COM_TYP         AS  COM_TYP
                ,TT.BAT_PRJT        AS  BAT_PRJT
                ,TT.COMP_ID         AS  COMP_ID
                ,NVL(TT.CITY_ID,-1)         AS  CITY_ID
                ,Z.P_ORG_ID_LV2         AS  CTR_CODE
                ,Z.P_ORG_ID_LV3    AS  SALES_PRJT
                ,Z.P_ORG_ID_LV4      AS  TEM_CODE
                ,NVL(TT.WP_ID,-1)           AS  WP_ID
                ,Z.PRJT_MGR_ID     AS  PRJT_MGR_ID
                ,Z.TEM_LEAD_ID     AS  TEM_LEAD_ID
                ,NVL(TT.USER_ID,'-1')         AS  USER_ID
                ,SUM(TT.FST_CAL_LIST_QTY)
                ,SUM(TT.FST_CAL_CONT_LIST_QTY)
                ,SUM(TT.TRK_LIST_QTY)
                ,SUM(TT.CONT_LIST_QTY)
                ,SUM(TT.REJ_LIST_QTY)
                ,SUM(TT.OLINE_SMIT_QTY)
                ,SUM(TT.OLINE_SMIT_PRM)
                ,SUM(TT.OLINE_TRAN_QTY)
                ,SUM(TT.OLINE_TRAN_PRM)
                ,SUM(TT.LAND_SUCC_QTY)
                ,SUM(TT.LAND_SUCC_PRM)
                ,SUM(TT.FST_CHARGBK_SUCC_QTY)
                ,SUM(TT.ANNUL_FST_PRM_PRM)
                ,SUM(TT.ACTL_FST_PRM_PRM)
                ,SUM(TT.CNCL_QTY)
                ,SUM(TT.CNCL_PRM)
FROM
        (SELECT TO_DATE(STAT_DATE, 'yyyy-mm-dd')  AS CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,FST_CAL_LIST_QTY AS   FST_CAL_LIST_QTY
              ,0                AS  FST_CAL_CONT_LIST_QTY
              ,0                AS  TRK_LIST_QTY
              ,0                AS  CONT_LIST_QTY
              ,0                AS  REJ_LIST_QTY
              ,0                AS  OLINE_SMIT_QTY
              ,0                AS  OLINE_SMIT_PRM
              ,0                AS  OLINE_TRAN_QTY
              ,0                AS  OLINE_TRAN_PRM
              ,0                AS  LAND_SUCC_QTY
              ,0                AS  LAND_SUCC_PRM
              ,0                AS  FST_CHARGBK_SUCC_QTY
              ,0                AS  ANNUL_FST_PRM_PRM
              ,0                AS  ACTL_FST_PRM_PRM
              ,0                AS  CNCL_QTY
              ,0                AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_1 T1
          UNION ALL
            SELECT TO_DATE(STAT_DATE, 'yyyy-mm-dd')  AS CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                        AS   FST_CAL_LIST_QTY
              ,FST_CAL_CONT_LIST_QTY    AS  FST_CAL_CONT_LIST_QTY
              ,0                        AS  TRK_LIST_QTY
              ,0                        AS  CONT_LIST_QTY
              ,0                        AS  REJ_LIST_QTY
              ,0                        AS  OLINE_SMIT_QTY
              ,0                        AS  OLINE_SMIT_PRM
              ,0                        AS  OLINE_TRAN_QTY
              ,0                        AS  OLINE_TRAN_PRM
              ,0                        AS  LAND_SUCC_QTY
              ,0                        AS  LAND_SUCC_PRM
              ,0                        AS  FST_CHARGBK_SUCC_QTY
              ,0                        AS  ANNUL_FST_PRM_PRM
              ,0                        AS  ACTL_FST_PRM_PRM
              ,0                        AS  CNCL_QTY
              ,0                        AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_2
          UNION ALL
          SELECT TO_DATE(STAT_DATE, 'yyyy-mm-dd')  AS CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                AS   FST_CAL_LIST_QTY
              ,0                AS  FST_CAL_CONT_LIST_QTY
              ,TRK_LIST_QTY     AS  TRK_LIST_QTY
              ,0                AS  CONT_LIST_QTY
              ,0                AS  REJ_LIST_QTY
              ,0                AS  OLINE_SMIT_QTY
              ,0                AS  OLINE_SMIT_PRM
              ,0                AS  OLINE_TRAN_QTY
              ,0                AS  OLINE_TRAN_PRM
              ,0                AS  LAND_SUCC_QTY
              ,0                AS  LAND_SUCC_PRM
              ,0                AS  FST_CHARGBK_SUCC_QTY
              ,0                AS  ANNUL_FST_PRM_PRM
              ,0                AS  ACTL_FST_PRM_PRM
              ,0                AS  CNCL_QTY
              ,0                AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_3
          UNION ALL
            SELECT TO_DATE(STAT_DATE, 'yyyy-mm-dd')  AS CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                  AS   FST_CAL_LIST_QTY
              ,0                  AS  FST_CAL_CONT_LIST_QTY
              ,0                  AS  TRK_LIST_QTY
              ,CONT_LIST_QTY      AS  CONT_LIST_QTY
              ,0                  AS  REJ_LIST_QTY
              ,0                  AS  OLINE_SMIT_QTY
              ,0                  AS  OLINE_SMIT_PRM
              ,0                  AS  OLINE_TRAN_QTY
              ,0                  AS  OLINE_TRAN_PRM
              ,0                  AS  LAND_SUCC_QTY
              ,0                  AS  LAND_SUCC_PRM
              ,0                  AS  FST_CHARGBK_SUCC_QTY
              ,0                  AS  ANNUL_FST_PRM_PRM
              ,0                  AS  ACTL_FST_PRM_PRM
              ,0                  AS  CNCL_QTY
              ,0                  AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_4
          UNION ALL
          SELECT TO_DATE(STAT_DATE, 'yyyy-mm-dd')  AS CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                  AS   FST_CAL_LIST_QTY
              ,0                  AS  FST_CAL_CONT_LIST_QTY
              ,0                  AS  TRK_LIST_QTY
              ,0                  AS  CONT_LIST_QTY
              ,REJ_LIST_QTY       AS  REJ_LIST_QTY
              ,0                  AS  OLINE_SMIT_QTY
              ,0                  AS  OLINE_SMIT_PRM
              ,0                  AS  OLINE_TRAN_QTY
              ,0                  AS  OLINE_TRAN_PRM
              ,0                  AS  LAND_SUCC_QTY
              ,0                  AS  LAND_SUCC_PRM
              ,0                  AS  FST_CHARGBK_SUCC_QTY
              ,0                  AS  ANNUL_FST_PRM_PRM
              ,0                  AS  ACTL_FST_PRM_PRM
              ,0                  AS  CNCL_QTY
              ,0                  AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_5
          UNION ALL
    SELECT TO_DATE(STAT_DATE, 'yyyy-mm-dd')  AS CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                  AS   FST_CAL_LIST_QTY
              ,0                  AS  FST_CAL_CONT_LIST_QTY
              ,0                  AS  TRK_LIST_QTY
              ,0                  AS  CONT_LIST_QTY
              ,0                  AS  REJ_LIST_QTY
              ,OLINE_SMIT_QTY     AS  OLINE_SMIT_QTY
              ,OLINE_SMIT_PRM     AS  OLINE_SMIT_PRM
              ,0                  AS  OLINE_TRAN_QTY
              ,0                  AS  OLINE_TRAN_PRM
              ,0                  AS  LAND_SUCC_QTY
              ,0                  AS  LAND_SUCC_PRM
              ,0                  AS  FST_CHARGBK_SUCC_QTY
              ,0                  AS  ANNUL_FST_PRM_PRM
              ,0                  AS  ACTL_FST_PRM_PRM
              ,0                  AS  CNCL_QTY
              ,0                  AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_6
          UNION ALL
    SELECT TO_DATE(STAT_DATE, 'yyyy-mm-dd')  AS CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                  AS   FST_CAL_LIST_QTY
              ,0                  AS  FST_CAL_CONT_LIST_QTY
              ,0                  AS  TRK_LIST_QTY
              ,0                  AS  CONT_LIST_QTY
              ,0                  AS  REJ_LIST_QTY
              ,0                  AS  OLINE_SMIT_QTY
              ,0                  AS  OLINE_SMIT_PRM
              ,OLINE_TRAN_QTY     AS  OLINE_TRAN_QTY
              ,OLINE_TRAN_PRM     AS  OLINE_TRAN_PRM
              ,LAND_SUCC_QTY      AS  LAND_SUCC_QTY
              ,LAND_SUCC_PRM      AS  LAND_SUCC_PRM
              ,0                  AS  FST_CHARGBK_SUCC_QTY
              ,0                  AS  ANNUL_FST_PRM_PRM
              ,0                  AS  ACTL_FST_PRM_PRM
              ,0                  AS  CNCL_QTY
              ,0                  AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_8
          UNION ALL
       SELECT TO_DATE(STAT_DATE, 'yyyy-mm-dd')  AS CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                        AS   FST_CAL_LIST_QTY
              ,0                        AS  FST_CAL_CONT_LIST_QTY
              ,0                        AS  TRK_LIST_QTY
              ,0                        AS  CONT_LIST_QTY
              ,0                        AS  REJ_LIST_QTY
              ,0                        AS  OLINE_SMIT_QTY
              ,0                        AS  OLINE_SMIT_PRM
              ,0                        AS  OLINE_TRAN_QTY
              ,0                        AS  OLINE_TRAN_PRM
              ,0                        AS  LAND_SUCC_QTY
              ,0                        AS  LAND_SUCC_PRM
              ,FST_CHARGBK_SUCC_QTY     AS  FST_CHARGBK_SUCC_QTY
              ,0                        AS  ANNUL_FST_PRM_PRM
              ,0                        AS  ACTL_FST_PRM_PRM
              ,0                        AS  CNCL_QTY
              ,0                        AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_10
          UNION ALL
        SELECT TO_DATE(STAT_DATE, 'yyyy-mm-dd')  AS CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                      AS   FST_CAL_LIST_QTY
              ,0                      AS  FST_CAL_CONT_LIST_QTY
              ,0                      AS  TRK_LIST_QTY
              ,0                      AS  CONT_LIST_QTY
              ,0                      AS  REJ_LIST_QTY
              ,0                      AS  OLINE_SMIT_QTY
              ,0                      AS  OLINE_SMIT_PRM
              ,0                      AS  OLINE_TRAN_QTY
              ,0                      AS  OLINE_TRAN_PRM
              ,0                  AS  LAND_SUCC_QTY
              ,0                  AS  LAND_SUCC_PRM
              ,0                      AS  FST_CHARGBK_SUCC_QTY
              ,ANNUL_FST_PRM_PRM      AS  ANNUL_FST_PRM_PRM
              ,0                      AS  ACTL_FST_PRM_PRM
              ,0                      AS  CNCL_QTY
              ,0                      AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_11
           UNION ALL
         SELECT TO_DATE(STAT_DATE, 'yyyy-mm-dd')  AS CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                            AS   FST_CAL_LIST_QTY
              ,0                            AS  FST_CAL_CONT_LIST_QTY
              ,0                            AS  TRK_LIST_QTY
              ,0                            AS  CONT_LIST_QTY
              ,0                            AS  REJ_LIST_QTY
              ,0                            AS  OLINE_SMIT_QTY
              ,0                            AS  OLINE_SMIT_PRM
              ,0                            AS  OLINE_TRAN_QTY
              ,0                            AS  OLINE_TRAN_PRM
              ,0                            AS  LAND_SUCC_QTY
              ,0                            AS  LAND_SUCC_PRM
              ,0                            AS  FST_CHARGBK_SUCC_QTY
              ,0                            AS  ANNUL_FST_PRM_PRM
              ,ACTL_FST_PRM_PRM             AS  ACTL_FST_PRM_PRM
              ,0                            AS  CNCL_QTY
              ,0                            AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_12
          union all
       SELECT TO_DATE(STAT_DATE, 'yyyy-mm-dd')  AS CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                           AS   FST_CAL_LIST_QTY
              ,0                           AS  FST_CAL_CONT_LIST_QTY
              ,0                           AS  TRK_LIST_QTY
              ,0                           AS  CONT_LIST_QTY
              ,0                           AS  REJ_LIST_QTY
              ,0                           AS  OLINE_SMIT_QTY
              ,0                           AS  OLINE_SMIT_PRM
              ,0                           AS  OLINE_TRAN_QTY
              ,0                           AS  OLINE_TRAN_PRM
              ,0                           AS  LAND_SUCC_QTY
              ,0                           AS  LAND_SUCC_PRM
              ,0                           AS  FST_CHARGBK_SUCC_QTY
              ,0                           AS  ANNUL_FST_PRM_PRM
              ,0                           AS  ACTL_FST_PRM_PRM
              ,CNCL_QTY                    AS  CNCL_QTY
              ,CNCL_PRM                    AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_13
          )  TT,
          ORGID_REF  Z
          WHERE TT.ORG_TYP=Z.ORG_ID
          GROUP BY
           TT.CAL_DAY_ID
          ,TT.PAY_MODE
          ,TT.ACTV_ID
          ,TT.BAT_ID
          ,TT.COM_TYP
          ,TT.BAT_PRJT
          ,TT.COMP_ID
          ,NVL(TT.CITY_ID,-1) 
          ,Z.P_ORG_ID_LV2 
          ,Z.P_ORG_ID_LV3
          ,Z.P_ORG_ID_LV4
          ,NVL(TT.WP_ID,'-1')
          ,Z.PRJT_MGR_ID
          ,Z.TEM_LEAD_ID
          ,NVL(TT.USER_ID,'-1')  ;
       V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;
    --��¼��־����
    SP_LOG_EXEC_AFT(V_PROC_NAME,
                     V_STEP_NO,
                     V_ROW_NUM,
                     V_BEGIN_TIME);
    ---------------------------------------------------------
        --��¼��־��ʼ
    V_STEP       := V_STEP + 1;
    V_STEP_NO    := SF_CREATE_STEP(V_STEP);
    V_STEP_DESC  := '���������±��洢����';
    V_BEGIN_TIME := SYSDATE;
    SP_LOG_EXEC_BEF(V_PROC_NAME,
                    V_STEP_NO,
                    V_DATE_DAY,
                    V_STEP_DESC,
                    V_BEGIN_TIME,
                    V_REPORT_ID);
       V_ROW_NUM := 0;
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_1';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_2';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_3';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_4';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_5';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_6';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_8';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_10';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_11';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_12';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_13';
        STAT_MON  := TO_NUMBER(SUBSTR(TO_CHAR(TO_DATE(STAT_DATE, 'yyyymmdd'), 'yyyymmdd'), 1, 6));

    SP_TA_SALES_RPT_MON_1 (STAT_MON,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_MON_2 (STAT_MON,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_MON_3 (STAT_MON,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_MON_4 (STAT_MON,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_MON_5 (STAT_MON,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_MON_6 (STAT_MON,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_MON_8 (STAT_MON,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_MON_10(STAT_MON,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_MON_11(STAT_MON,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_MON_12(STAT_MON,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_MON_13(STAT_MON,ERR_NUM,ERR_MSG );
    --֧�ֶ��μ���
    DELETE FROM TA_SALES_RPT_MON T
     WHERE T.CAL_MON_ID=STAT_MON;
     COMMIT;
INSERT INTO TA_SALES_RPT_MON
        (CAL_MON_ID
        ,PAY_MODE
        ,ACTV_ID
        ,BAT_CODE
        ,COM_TYP
        ,BAT_PRJT
        ,COMP_ID
        ,CITY_ID
        ,CTR_CODE
        ,SALES_PRJT
        ,TEM_CODE
        ,WP_ID
        ,PRJT_MGR_ID
        ,TEM_LEAD_ID
        ,USER_ID
        ,FST_CAL_LIST_QTY
        ,FST_CAL_CONT_LIST_QTY
        ,TRK_LIST_QTY
        ,CONT_LIST_QTY
        ,REJ_LIST_QTY
        ,OLINE_SMIT_QTY
        ,OLINE_SMIT_PRM
        ,OLINE_TRAN_QTY
        ,OLINE_TRAN_PRM
        ,LAND_SUCC_QTY
        ,LAND_SUCC_PRM
        ,FST_CHARGBK_SUCC_QTY
        ,ANNUL_FST_PRM_PRM
        ,ACTL_FST_PRM_PRM
        ,CNCL_QTY
        ,CNCL_PRM)
      SELECT    TT.CAL_MON_ID  AS CAL_MON_ID
                ,TT.PAY_MODE    AS  PAY_MODE
                ,TT.ACTV_ID     AS  ACTV_ID
                ,TT.BAT_ID    AS  BAT_ID
                ,TT.COM_TYP     AS  COM_TYP
                ,TT.BAT_PRJT    AS  BAT_PRJT
                ,TT.COMP_ID     AS  COMP_ID
                ,NVL(TT.CITY_ID,-1)      AS  CITY_ID
                ,Z.P_ORG_ID_LV2         AS  CTR_CODE
                ,Z.P_ORG_ID_LV3    AS  SALES_PRJT
                ,Z.P_ORG_ID_LV4      AS  TEM_CODE
                ,NVL(TT.WP_ID,'-1')      AS  WP_ID
                ,Z.PRJT_MGR_ID AS  PRJT_MGR_ID
                ,Z.TEM_LEAD_ID AS  TEM_LEAD_ID
                ,NVL(TT.USER_ID,'-1')     AS  USER_ID
                ,SUM(TT.FST_CAL_LIST_QTY)
                ,SUM(TT.FST_CAL_CONT_LIST_QTY)
                ,SUM(TT.TRK_LIST_QTY)
                ,SUM(TT.CONT_LIST_QTY)
                ,SUM(TT.REJ_LIST_QTY)
                ,SUM(TT.OLINE_SMIT_QTY)
                ,SUM(TT.OLINE_SMIT_PRM)
                ,SUM(TT.OLINE_TRAN_QTY)
                ,SUM(TT.OLINE_TRAN_PRM)
                ,SUM(TT.LAND_SUCC_QTY)
                ,SUM(TT.LAND_SUCC_PRM)
                ,SUM(TT.FST_CHARGBK_SUCC_QTY)
                ,SUM(TT.ANNUL_FST_PRM_PRM)
                ,SUM(TT.ACTL_FST_PRM_PRM)
                ,SUM(TT.CNCL_QTY)
                ,SUM(TT.CNCL_PRM)
FROM
        (SELECT STAT_MON AS  CAL_MON_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,FST_CAL_LIST_QTY AS   FST_CAL_LIST_QTY
              ,0                AS  FST_CAL_CONT_LIST_QTY
              ,0                AS  TRK_LIST_QTY
              ,0                AS  CONT_LIST_QTY
              ,0                AS  REJ_LIST_QTY
              ,0                AS  OLINE_SMIT_QTY
              ,0                AS  OLINE_SMIT_PRM
              ,0                AS  OLINE_TRAN_QTY
              ,0                AS  OLINE_TRAN_PRM
              ,0                  AS  LAND_SUCC_QTY
              ,0                  AS  LAND_SUCC_PRM
              ,0                AS  FST_CHARGBK_SUCC_QTY
              ,0                AS  ANNUL_FST_PRM_PRM
              ,0                AS  ACTL_FST_PRM_PRM
              ,0                AS  CNCL_QTY
              ,0                AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_1 T1
          UNION ALL
            SELECT STAT_MON AS  CAL_MON_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                        AS   FST_CAL_LIST_QTY
              ,FST_CAL_CONT_LIST_QTY    AS  FST_CAL_CONT_LIST_QTY
              ,0                        AS  TRK_LIST_QTY
              ,0                        AS  CONT_LIST_QTY
              ,0                        AS  REJ_LIST_QTY
              ,0                        AS  OLINE_SMIT_QTY
              ,0                        AS  OLINE_SMIT_PRM
              ,0                        AS  OLINE_TRAN_QTY
              ,0                        AS  OLINE_TRAN_PRM
              ,0                        AS  LAND_SUCC_QTY
              ,0                        AS  LAND_SUCC_PRM
              ,0                        AS  FST_CHARGBK_SUCC_QTY
              ,0                        AS  ANNUL_FST_PRM_PRM
              ,0                        AS  ACTL_FST_PRM_PRM
              ,0                        AS  CNCL_QTY
              ,0                        AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_2
          UNION ALL
          SELECT STAT_MON AS  CAL_MON_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                AS   FST_CAL_LIST_QTY
              ,0                AS  FST_CAL_CONT_LIST_QTY
              ,TRK_LIST_QTY     AS  TRK_LIST_QTY
              ,0                AS  CONT_LIST_QTY
              ,0                AS  REJ_LIST_QTY
              ,0                AS  OLINE_SMIT_QTY
              ,0                AS  OLINE_SMIT_PRM
              ,0                AS  OLINE_TRAN_QTY
              ,0                AS  OLINE_TRAN_PRM
              ,0                  AS  LAND_SUCC_QTY
              ,0                  AS  LAND_SUCC_PRM
              ,0                AS  FST_CHARGBK_SUCC_QTY
              ,0                AS  ANNUL_FST_PRM_PRM
              ,0                AS  ACTL_FST_PRM_PRM
              ,0                AS  CNCL_QTY
              ,0                AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_3
          UNION ALL
            SELECT STAT_MON AS  CAL_MON_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                  AS   FST_CAL_LIST_QTY
              ,0                  AS  FST_CAL_CONT_LIST_QTY
              ,0                  AS  TRK_LIST_QTY
              ,CONT_LIST_QTY      AS  CONT_LIST_QTY
              ,0                  AS  REJ_LIST_QTY
              ,0                  AS  OLINE_SMIT_QTY
              ,0                  AS  OLINE_SMIT_PRM
              ,0                  AS  OLINE_TRAN_QTY
              ,0                  AS  OLINE_TRAN_PRM
              ,0                  AS  LAND_SUCC_QTY
              ,0                  AS  LAND_SUCC_PRM
              ,0                  AS  FST_CHARGBK_SUCC_QTY
              ,0                  AS  ANNUL_FST_PRM_PRM
              ,0                  AS  ACTL_FST_PRM_PRM
              ,0                  AS  CNCL_QTY
              ,0                  AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_4
          UNION ALL
          SELECT STAT_MON AS  CAL_MON_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                  AS   FST_CAL_LIST_QTY
              ,0                  AS  FST_CAL_CONT_LIST_QTY
              ,0                  AS  TRK_LIST_QTY
              ,0                  AS  CONT_LIST_QTY
              ,REJ_LIST_QTY       AS  REJ_LIST_QTY
              ,0                  AS  OLINE_SMIT_QTY
              ,0                  AS  OLINE_SMIT_PRM
              ,0                  AS  OLINE_TRAN_QTY
              ,0                  AS  OLINE_TRAN_PRM
              ,0                  AS  LAND_SUCC_QTY
              ,0                  AS  LAND_SUCC_PRM
              ,0                  AS  FST_CHARGBK_SUCC_QTY
              ,0                  AS  ANNUL_FST_PRM_PRM
              ,0                  AS  ACTL_FST_PRM_PRM
              ,0                  AS  CNCL_QTY
              ,0                  AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_5
          UNION ALL
       SELECT STAT_MON AS  CAL_MON_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                  AS   FST_CAL_LIST_QTY
              ,0                  AS  FST_CAL_CONT_LIST_QTY
              ,0                  AS  TRK_LIST_QTY
              ,0                  AS  CONT_LIST_QTY
              ,0                  AS  REJ_LIST_QTY
              ,OLINE_SMIT_QTY     AS  OLINE_SMIT_QTY
              ,OLINE_SMIT_PRM     AS  OLINE_SMIT_PRM
              ,0                  AS  OLINE_TRAN_QTY
              ,0                  AS  OLINE_TRAN_PRM
              ,0                  AS  LAND_SUCC_QTY
              ,0                  AS  LAND_SUCC_PRM
              ,0                  AS  FST_CHARGBK_SUCC_QTY
              ,0                  AS  ANNUL_FST_PRM_PRM
              ,0                  AS  ACTL_FST_PRM_PRM
              ,0                  AS  CNCL_QTY
              ,0                  AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_6
          UNION ALL
    SELECT STAT_MON AS  CAL_MON_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                  AS   FST_CAL_LIST_QTY
              ,0                  AS  FST_CAL_CONT_LIST_QTY
              ,0                  AS  TRK_LIST_QTY
              ,0                  AS  CONT_LIST_QTY
              ,0                  AS  REJ_LIST_QTY
              ,0                  AS  OLINE_SMIT_QTY
              ,0                  AS  OLINE_SMIT_PRM
              ,OLINE_TRAN_QTY     AS  OLINE_TRAN_QTY
              ,OLINE_TRAN_PRM     AS  OLINE_TRAN_PRM
              ,LAND_SUCC_QTY      AS  LAND_SUCC_QTY
              ,LAND_SUCC_PRM      AS  LAND_SUCC_PRM
              ,0                  AS  FST_CHARGBK_SUCC_QTY
              ,0                  AS  ANNUL_FST_PRM_PRM
              ,0                  AS  ACTL_FST_PRM_PRM
              ,0                  AS  CNCL_QTY
              ,0                  AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_8
          UNION ALL
    SELECT STAT_MON AS  CAL_MON_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                        AS   FST_CAL_LIST_QTY
              ,0                        AS  FST_CAL_CONT_LIST_QTY
              ,0                        AS  TRK_LIST_QTY
              ,0                        AS  CONT_LIST_QTY
              ,0                        AS  REJ_LIST_QTY
              ,0                        AS  OLINE_SMIT_QTY
              ,0                        AS  OLINE_SMIT_PRM
              ,0                        AS  OLINE_TRAN_QTY
              ,0                        AS  OLINE_TRAN_PRM
              ,0                        AS  LAND_SUCC_QTY
              ,0                        AS  LAND_SUCC_PRM
              ,FST_CHARGBK_SUCC_QTY     AS  FST_CHARGBK_SUCC_QTY
              ,0                        AS  ANNUL_FST_PRM_PRM
              ,0                        AS  ACTL_FST_PRM_PRM
              ,0                        AS  CNCL_QTY
              ,0                        AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_10
          UNION ALL
        SELECT STAT_MON AS  CAL_MON_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                      AS   FST_CAL_LIST_QTY
              ,0                      AS  FST_CAL_CONT_LIST_QTY
              ,0                      AS  TRK_LIST_QTY
              ,0                      AS  CONT_LIST_QTY
              ,0                      AS  REJ_LIST_QTY
              ,0                      AS  OLINE_SMIT_QTY
              ,0                      AS  OLINE_SMIT_PRM
              ,0                      AS  OLINE_TRAN_QTY
              ,0                      AS  OLINE_TRAN_PRM
              ,0                      AS  LAND_SUCC_QTY
              ,0                      AS  LAND_SUCC_PRM
              ,0                      AS  FST_CHARGBK_SUCC_QTY
              ,ANNUL_FST_PRM_PRM      AS  ANNUL_FST_PRM_PRM
              ,0                      AS  ACTL_FST_PRM_PRM
              ,0                      AS  CNCL_QTY
              ,0                      AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_11
           UNION ALL
         SELECT STAT_MON AS  CAL_MON_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                            AS   FST_CAL_LIST_QTY
              ,0                            AS  FST_CAL_CONT_LIST_QTY
              ,0                            AS  TRK_LIST_QTY
              ,0                            AS  CONT_LIST_QTY
              ,0                            AS  REJ_LIST_QTY
              ,0                            AS  OLINE_SMIT_QTY
              ,0                            AS  OLINE_SMIT_PRM
              ,0                            AS  OLINE_TRAN_QTY
              ,0                            AS  OLINE_TRAN_PRM
              ,0                            AS  LAND_SUCC_QTY
              ,0                            AS  LAND_SUCC_PRM
              ,0                            AS  FST_CHARGBK_SUCC_QTY
              ,0                            AS  ANNUL_FST_PRM_PRM
              ,ACTL_FST_PRM_PRM             AS  ACTL_FST_PRM_PRM
              ,0                            AS  CNCL_QTY
              ,0                            AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_12
          UNION ALL
             SELECT STAT_MON AS  CAL_MON_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                            AS   FST_CAL_LIST_QTY
              ,0                           AS  FST_CAL_CONT_LIST_QTY
              ,0                           AS  TRK_LIST_QTY
              ,0                           AS  CONT_LIST_QTY
              ,0                           AS  REJ_LIST_QTY
              ,0                           AS  OLINE_SMIT_QTY
              ,0                           AS  OLINE_SMIT_PRM
              ,0                           AS  OLINE_TRAN_QTY
              ,0                           AS  OLINE_TRAN_PRM
              ,0                           AS  LAND_SUCC_QTY
              ,0                           AS  LAND_SUCC_PRM
              ,0                           AS  FST_CHARGBK_SUCC_QTY
              ,0                           AS  ANNUL_FST_PRM_PRM
              ,0                           AS  ACTL_FST_PRM_PRM
              ,CNCL_QTY                    AS  CNCL_QTY
              ,CNCL_PRM                    AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_13
          )  TT,
           ORGID_REF Z
           WHERE TT.ORG_TYP=Z.ORG_ID
          GROUP BY
          TT.CAL_MON_ID
          ,TT.PAY_MODE
          ,TT.ACTV_ID
          ,TT.BAT_ID
          ,TT.COM_TYP
          ,TT.BAT_PRJT
          ,TT.COMP_ID
          ,NVL(TT.CITY_ID,-1) 
          ,Z.P_ORG_ID_LV2 
          ,Z.P_ORG_ID_LV3
          ,Z.P_ORG_ID_LV4
          ,NVL(TT.WP_ID,'-1')
          ,Z.PRJT_MGR_ID
          ,Z.TEM_LEAD_ID
          ,NVL(TT.USER_ID,'-1')
           ;
     V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;
    --��¼��־����
    SP_LOG_EXEC_AFT(V_PROC_NAME,
                     V_STEP_NO,
                     V_ROW_NUM,
                     V_BEGIN_TIME);
    ---------------------------------------------------------
        --��¼��־��ʼ
    V_STEP       := V_STEP + 1;
    V_STEP_NO    := SF_CREATE_STEP(V_STEP);
    V_STEP_DESC  := '���������ܱ��洢����';
    V_BEGIN_TIME := SYSDATE;
    SP_LOG_EXEC_BEF(V_PROC_NAME,
                    V_STEP_NO,
                    V_DATE_DAY,
                    V_STEP_DESC,
                    V_BEGIN_TIME,
                    V_REPORT_ID);
       V_ROW_NUM := 0;
          --�����ʱ������
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_1';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_2';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_3';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_4';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_5';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_6';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_8';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_10';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_11';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_12';
     EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_TA_SALES_RPT_13';
     --�����ݼ��ص���ʱ��
    SP_TA_SALES_RPT_WEEK_1 (STAT_DATE,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_WEEK_2 (STAT_DATE,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_WEEK_3 (STAT_DATE,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_WEEK_4 (STAT_DATE,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_WEEK_5 (STAT_DATE,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_WEEK_6 (STAT_DATE,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_WEEK_8 (STAT_DATE,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_WEEK_10(STAT_DATE,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_WEEK_11(STAT_DATE,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_WEEK_12(STAT_DATE,ERR_NUM,ERR_MSG );
    SP_TA_SALES_RPT_WEEK_13(STAT_DATE,ERR_NUM,ERR_MSG );
    ---��ȡ������ʱ�������
   SELECT WEEK_INTERVAL_ID INTO V_DATE
        FROM D_CALENDAR_DIM
          WHERE CAL_DAY_ID = STAT_DATE;
  --֧�ֶ��μ���
  DELETE FROM    TA_SALES_RPT_WEK  T
      WHERE T.CAL_WEEK_ID=V_DATE ;
      COMMIT;
    INSERT INTO TA_SALES_RPT_WEK
        (CAL_WEEK_ID
        ,PAY_MODE
        ,ACTV_ID
        ,BAT_CODE
        ,COM_TYP
        ,BAT_PRJT
        ,COMP_ID
        ,CITY_ID
        ,CTR_CODE
        ,SALES_PRJT
        ,TEM_CODE
        ,WP_ID
        ,PRJT_MGR_ID
        ,TEM_LEAD_ID
        ,USER_ID
        ,FST_CAL_LIST_QTY
        ,FST_CAL_CONT_LIST_QTY
        ,TRK_LIST_QTY
        ,CONT_LIST_QTY
        ,REJ_LIST_QTY
        ,OLINE_SMIT_QTY
        ,OLINE_SMIT_PRM
        ,OLINE_TRAN_QTY
        ,OLINE_TRAN_PRM
        ,LAND_SUCC_QTY
        ,LAND_SUCC_PRM
        ,FST_CHARGBK_SUCC_QTY
        ,ANNUL_FST_PRM_PRM
        ,ACTL_FST_PRM_PRM
        ,CNCL_QTY
        ,CNCL_PRM)
      SELECT    TT.CAL_DAY_ID  AS CAL_DAY_ID
                ,TT.PAY_MODE    AS  PAY_MODE
                ,TT.ACTV_ID     AS  ACTV_ID
                ,TT.BAT_ID    AS  BAT_ID
                ,TT.COM_TYP     AS  COM_TYP
                ,TT.BAT_PRJT    AS  BAT_PRJT
                ,TT.COMP_ID     AS  COMP_ID
                ,NVL(TT.CITY_ID,-1)     AS  CITY_ID
                ,Z.P_ORG_ID_LV2         AS  CTR_CODE
                ,Z.P_ORG_ID_LV3    AS  SALES_PRJT
                ,Z.P_ORG_ID_LV4      AS  TEM_CODE
                ,NVL(TT.WP_ID,'-1')       AS  WP_ID
                ,Z.PRJT_MGR_ID AS  PRJT_MGR_ID
                ,Z.TEM_LEAD_ID AS  TEM_LEAD_ID
                ,NVL(TT.USER_ID,'-1')     AS  USER_ID
                ,SUM(TT.FST_CAL_LIST_QTY)
                ,SUM(TT.FST_CAL_CONT_LIST_QTY)
                ,SUM(TT.TRK_LIST_QTY)
                ,SUM(TT.CONT_LIST_QTY)
                ,SUM(TT.REJ_LIST_QTY)
                ,SUM(TT.OLINE_SMIT_QTY)
                ,SUM(TT.OLINE_SMIT_PRM)
                ,SUM(TT.OLINE_TRAN_QTY)
                ,SUM(TT.OLINE_TRAN_PRM)
                ,SUM(TT.LAND_SUCC_QTY)
                ,SUM(TT.LAND_SUCC_PRM)
                ,SUM(TT.FST_CHARGBK_SUCC_QTY)
                ,SUM(TT.ANNUL_FST_PRM_PRM)
                ,SUM(TT.ACTL_FST_PRM_PRM)
                ,SUM(TT.CNCL_QTY)
                ,SUM(TT.CNCL_PRM)
FROM
        (SELECT V_DATE AS  CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,FST_CAL_LIST_QTY AS   FST_CAL_LIST_QTY
              ,0                AS  FST_CAL_CONT_LIST_QTY
              ,0                AS  TRK_LIST_QTY
              ,0                AS  CONT_LIST_QTY
              ,0                AS  REJ_LIST_QTY
              ,0                AS  OLINE_SMIT_QTY
              ,0                AS  OLINE_SMIT_PRM
              ,0                AS  OLINE_TRAN_QTY
              ,0                AS  OLINE_TRAN_PRM
              ,0                  AS  LAND_SUCC_QTY
              ,0                  AS  LAND_SUCC_PRM
              ,0                AS  FST_CHARGBK_SUCC_QTY
              ,0                AS  ANNUL_FST_PRM_PRM
              ,0                AS  ACTL_FST_PRM_PRM
              ,0                AS  CNCL_QTY
              ,0                AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_1 T1
          UNION ALL
            SELECT V_DATE AS  CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                        AS   FST_CAL_LIST_QTY
              ,FST_CAL_CONT_LIST_QTY    AS  FST_CAL_CONT_LIST_QTY
              ,0                        AS  TRK_LIST_QTY
              ,0                        AS  CONT_LIST_QTY
              ,0                        AS  REJ_LIST_QTY
              ,0                        AS  OLINE_SMIT_QTY
              ,0                        AS  OLINE_SMIT_PRM
              ,0                        AS  OLINE_TRAN_QTY
              ,0                        AS  OLINE_TRAN_PRM
              ,0                        AS  LAND_SUCC_QTY
              ,0                        AS  LAND_SUCC_PRM
              ,0                        AS  FST_CHARGBK_SUCC_QTY
              ,0                        AS  ANNUL_FST_PRM_PRM
              ,0                        AS  ACTL_FST_PRM_PRM
              ,0                        AS  CNCL_QTY
              ,0                        AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_2
          UNION ALL
          SELECT V_DATE AS  CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                AS   FST_CAL_LIST_QTY
              ,0                AS  FST_CAL_CONT_LIST_QTY
              ,TRK_LIST_QTY     AS  TRK_LIST_QTY
              ,0                AS  CONT_LIST_QTY
              ,0                AS  REJ_LIST_QTY
              ,0                AS  OLINE_SMIT_QTY
              ,0                AS  OLINE_SMIT_PRM
              ,0                AS  OLINE_TRAN_QTY
              ,0                AS  OLINE_TRAN_PRM
              ,0                  AS  LAND_SUCC_QTY
              ,0                  AS  LAND_SUCC_PRM
              ,0                AS  FST_CHARGBK_SUCC_QTY
              ,0                AS  ANNUL_FST_PRM_PRM
              ,0                AS  ACTL_FST_PRM_PRM
              ,0                AS  CNCL_QTY
              ,0                AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_3
          UNION ALL
            SELECT V_DATE AS  CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                  AS   FST_CAL_LIST_QTY
              ,0                  AS  FST_CAL_CONT_LIST_QTY
              ,0                  AS  TRK_LIST_QTY
              ,CONT_LIST_QTY      AS  CONT_LIST_QTY
              ,0                  AS  REJ_LIST_QTY
              ,0                  AS  OLINE_SMIT_QTY
              ,0                  AS  OLINE_SMIT_PRM
              ,0                  AS  OLINE_TRAN_QTY
              ,0                  AS  OLINE_TRAN_PRM
              ,0                  AS  LAND_SUCC_QTY
              ,0                  AS  LAND_SUCC_PRM
              ,0                  AS  FST_CHARGBK_SUCC_QTY
              ,0                  AS  ANNUL_FST_PRM_PRM
              ,0                  AS  ACTL_FST_PRM_PRM
              ,0                  AS  CNCL_QTY
              ,0                  AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_4
          UNION ALL
          SELECT V_DATE AS  CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                  AS   FST_CAL_LIST_QTY
              ,0                  AS  FST_CAL_CONT_LIST_QTY
              ,0                  AS  TRK_LIST_QTY
              ,0                  AS  CONT_LIST_QTY
              ,REJ_LIST_QTY       AS  REJ_LIST_QTY
              ,0                  AS  OLINE_SMIT_QTY
              ,0                  AS  OLINE_SMIT_PRM
              ,0                  AS  OLINE_TRAN_QTY
              ,0                  AS  OLINE_TRAN_PRM
              ,0                  AS  LAND_SUCC_QTY
              ,0                  AS  LAND_SUCC_PRM
              ,0                  AS  FST_CHARGBK_SUCC_QTY
              ,0                  AS  ANNUL_FST_PRM_PRM
              ,0                  AS  ACTL_FST_PRM_PRM
              ,0                  AS  CNCL_QTY
              ,0                  AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_5
          UNION ALL
                    SELECT V_DATE AS  CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                  AS   FST_CAL_LIST_QTY
              ,0                  AS  FST_CAL_CONT_LIST_QTY
              ,0                  AS  TRK_LIST_QTY
              ,0                  AS  CONT_LIST_QTY
              ,0                  AS  REJ_LIST_QTY
              ,OLINE_SMIT_QTY     AS  OLINE_SMIT_QTY
              ,OLINE_SMIT_PRM     AS  OLINE_SMIT_PRM
              ,0                  AS  OLINE_TRAN_QTY
              ,0                  AS  OLINE_TRAN_PRM
              ,0                  AS  LAND_SUCC_QTY
              ,0                  AS  LAND_SUCC_PRM
              ,0                  AS  FST_CHARGBK_SUCC_QTY
              ,0                  AS  ANNUL_FST_PRM_PRM
              ,0                  AS  ACTL_FST_PRM_PRM
              ,0                  AS  CNCL_QTY
              ,0                  AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_6
          UNION ALL
         SELECT V_DATE AS  CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                  AS   FST_CAL_LIST_QTY
              ,0                  AS  FST_CAL_CONT_LIST_QTY
              ,0                  AS  TRK_LIST_QTY
              ,0                  AS  CONT_LIST_QTY
              ,0                  AS  REJ_LIST_QTY
              ,0                  AS  OLINE_SMIT_QTY
              ,0                  AS  OLINE_SMIT_PRM
              ,OLINE_TRAN_QTY     AS  OLINE_TRAN_QTY
              ,OLINE_TRAN_PRM     AS  OLINE_TRAN_PRM
              ,LAND_SUCC_QTY      AS  LAND_SUCC_QTY
              ,LAND_SUCC_PRM      AS  LAND_SUCC_PRM
              ,0                  AS  FST_CHARGBK_SUCC_QTY
              ,0                  AS  ANNUL_FST_PRM_PRM
              ,0                  AS  ACTL_FST_PRM_PRM
              ,0                  AS  CNCL_QTY
              ,0                  AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_8
          UNION ALL
   SELECT V_DATE AS  CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                        AS   FST_CAL_LIST_QTY
              ,0                        AS  FST_CAL_CONT_LIST_QTY
              ,0                        AS  TRK_LIST_QTY
              ,0                        AS  CONT_LIST_QTY
              ,0                        AS  REJ_LIST_QTY
              ,0                        AS  OLINE_SMIT_QTY
              ,0                        AS  OLINE_SMIT_PRM
              ,0                        AS  OLINE_TRAN_QTY
              ,0                        AS  OLINE_TRAN_PRM
              ,0                  AS  LAND_SUCC_QTY
              ,0                  AS  LAND_SUCC_PRM
              ,FST_CHARGBK_SUCC_QTY     AS  FST_CHARGBK_SUCC_QTY
              ,0                        AS  ANNUL_FST_PRM_PRM
              ,0                        AS  ACTL_FST_PRM_PRM
              ,0                        AS  CNCL_QTY
              ,0                        AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_10
          UNION ALL
        SELECT V_DATE AS  CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                      AS   FST_CAL_LIST_QTY
              ,0                      AS  FST_CAL_CONT_LIST_QTY
              ,0                      AS  TRK_LIST_QTY
              ,0                      AS  CONT_LIST_QTY
              ,0                      AS  REJ_LIST_QTY
              ,0                      AS  OLINE_SMIT_QTY
              ,0                      AS  OLINE_SMIT_PRM
              ,0                      AS  OLINE_TRAN_QTY
              ,0                      AS  OLINE_TRAN_PRM
              ,0                  AS  LAND_SUCC_QTY
              ,0                  AS  LAND_SUCC_PRM
              ,0                      AS  FST_CHARGBK_SUCC_QTY
              ,ANNUL_FST_PRM_PRM      AS  ANNUL_FST_PRM_PRM
              ,0                      AS  ACTL_FST_PRM_PRM
              ,0                      AS  CNCL_QTY
              ,0                      AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_11
           UNION ALL
         SELECT V_DATE AS  CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                            AS   FST_CAL_LIST_QTY
              ,0                            AS  FST_CAL_CONT_LIST_QTY
              ,0                            AS  TRK_LIST_QTY
              ,0                            AS  CONT_LIST_QTY
              ,0                            AS  REJ_LIST_QTY
              ,0                            AS  OLINE_SMIT_QTY
              ,0                            AS  OLINE_SMIT_PRM
              ,0                            AS  OLINE_TRAN_QTY
              ,0                            AS  OLINE_TRAN_PRM
              ,0                  AS  LAND_SUCC_QTY
              ,0                  AS  LAND_SUCC_PRM
              ,0                            AS  FST_CHARGBK_SUCC_QTY
              ,0                            AS  ANNUL_FST_PRM_PRM
              ,ACTL_FST_PRM_PRM             AS  ACTL_FST_PRM_PRM
              ,0                            AS  CNCL_QTY
              ,0                            AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_12
          UNION ALL
       SELECT V_DATE AS  CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_ID
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,ORG_TYP
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,0                            AS   FST_CAL_LIST_QTY
              ,0                           AS  FST_CAL_CONT_LIST_QTY
              ,0                           AS  TRK_LIST_QTY
              ,0                           AS  CONT_LIST_QTY
              ,0                           AS  REJ_LIST_QTY
              ,0                           AS  OLINE_SMIT_QTY
              ,0                           AS  OLINE_SMIT_PRM
              ,0                           AS  OLINE_TRAN_QTY
              ,0                           AS  OLINE_TRAN_PRM
              ,0                           AS  LAND_SUCC_QTY
              ,0                           AS  LAND_SUCC_PRM
              ,0                           AS  FST_CHARGBK_SUCC_QTY
              ,0                           AS  ANNUL_FST_PRM_PRM
              ,0                           AS  ACTL_FST_PRM_PRM
              ,CNCL_QTY                    AS  CNCL_QTY
              ,CNCL_PRM                    AS  CNCL_PRM
          FROM TEMP_TA_SALES_RPT_13
          )  TT,
          ORGID_REF Z
          WHERE TT.ORG_TYP=Z.ORG_ID
          GROUP BY
          TT.CAL_DAY_ID
          ,TT.PAY_MODE
          ,TT.ACTV_ID
          ,TT.BAT_ID
          ,TT.COM_TYP
          ,TT.BAT_PRJT
          ,TT.COMP_ID
          ,NVL(TT.CITY_ID,-1) 
          ,Z.P_ORG_ID_LV2 
          ,Z.P_ORG_ID_LV3
          ,Z.P_ORG_ID_LV4
          ,NVL(TT.WP_ID,'-1')
          ,Z.PRJT_MGR_ID
          ,Z.TEM_LEAD_ID
          ,NVL(TT.USER_ID,'-1')
          ;
  V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;
    --��¼��־����
    SP_LOG_EXEC_AFT(V_PROC_NAME,
                     V_STEP_NO,
                     V_ROW_NUM,
                     V_BEGIN_TIME);
    ERR_NUM := 0;
    ERR_MSG := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
    WHEN OTHERS THEN
        ERR_NUM    := SQLCODE;
        ERR_MSG    := TRIM(SQLERRM);
        V_END_TIME := SYSDATE;

        IF V_STEP_NO IS NULL THEN
            INSERT INTO LOG_TRACE_STAT
                (PROC_NAME
                ,STEP_NO
                ,BEGIN_TIME
                ,END_TIME
                ,WORK_DATE
                ,STEP_DESC
                ,ELAPSED
                ,REPORT_ID
                ,SQL_CODE
                ,SQL_ERRM)
            VALUES
                (V_PROC_NAME
                ,V_STEP_NO
                ,V_BEGIN_TIME
                ,V_END_TIME
                ,V_DATE_DAY
                ,V_STEP_DESC
                ,ROUND((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                ,V_REPORT_ID
                ,ERR_NUM
                ,ERR_MSG);
        ELSE
            UPDATE LOG_TRACE_STAT
               SET END_TIME = V_END_TIME
                  ,ELAPSED  = ROUND((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                  ,SQL_CODE = ERR_NUM
                  ,SQL_ERRM = ERR_MSG
             WHERE PROC_NAME = V_PROC_NAME
               AND STEP_NO = V_STEP_NO
               AND WORK_DATE = V_DATE_DAY
               AND BEGIN_TIME = V_BEGIN_TIME
               AND REPORT_ID = V_REPORT_ID;
        END IF;

        COMMIT;
END PROC_TA_SALES_RPT;
/

prompt
prompt Creating procedure SP_ORGID_REF
prompt ===============================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.SP_ORGID_REF (
   I_DATE_DAY     IN       NUMBER
 --, I_END_DATE     IN       NUMBER
 , ERR_NUM        OUT      NUMBER
 , ERR_MSG        OUT      VARCHAR2
)
AS
   /**
     * ���������� ������Ա����֯�ܹ���Ϣ��
     * ��������� I_DATE_DAY             ����ʱ��,�������Ϊ��,�׳��쳣
     * ��������� ERR_NUM                ���ִ���ʱ����ִ�д����
     * �������������ERR_MSG                ���ִ���ʱ���صĴ�����Ϣ
     * ��д��Ա�����ҷ�
     * �������ڣ�2012-07-26
     * ��˾���ƣ�
     **/
   V_DATE_DAY                    DATE := TO_DATE(I_DATE_DAY,'YYYYMMDD');             --����ʱ��
   V_DAY			                   NUMBER := I_DATE_DAY;		   --����ʱ��
  -- V_BEGIN_DATE                  VARCHAR2 (19) :=SUBSTR(TO_CHAR(TO_DATE(I_DATE_DAY,'YYYY-MM-DD'),'YYYY-MM-DD'),0,7);
  -- V_END_DATE                    VARCHAR2 (19) :=SUBSTR(TO_CHAR(ADD_MONTHS(LAST_DAY(TO_DATE(I_DATE_DAY,'YYYY-MM-DD')),-5),'YYYY-MM-DD'),0,7);
   V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_ORGID_REF';--��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF V_DATE_DAY IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'I_DATE_DAY IS NULL!');
   END IF;
/* IF V_END_DAY IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'I_END_DATE IS NULL!');
   END IF;*/

   --�����ʱ������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE ORGID_REF';
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '������Ա����֯�ܹ���Ϣ';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
   --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO ORGID_REF
         (    ORG_ID
              ,ORG_ID_LV  
              ,P_ORG_ID_LV0
              ,P_ORG_ID_LV1
              ,P_ORG_ID_LV2
              ,P_ORG_ID_LV3
              ,P_ORG_ID_LV4
              ,P_ORG_ID_LV5
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
            )
      
   SELECT     DISTINCT  T.ORG_ID                  AS ORG_ID
              ,T.ORG_LEVEL               AS ORG_ID_LV  
              ,FUN_GET_ORGID(T.ORG_ID,0) AS  P_ORG_ID_LV0
              ,FUN_GET_ORGID(T.ORG_ID,1) AS P_ORG_ID_LV1
              ,FUN_GET_ORGID(T.ORG_ID,2) AS P_ORG_ID_LV2
              ,FUN_GET_ORGID(T.ORG_ID,3) AS P_ORG_ID_LV3
              ,FUN_GET_ORGID(T.ORG_ID,4) AS P_ORG_ID_LV4
              ,-1                        AS P_ORG_ID_LV5
              ,NVL(F_USER(T.ORG_ID,11),'-1')       AS PRJT_MGR_ID
              ,NVL(F_USER(T.ORG_ID,12),'-1')       AS TEM_LEAD_ID
     FROM TB_ORGANIZATION  T;
   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );



   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
  
   ERR_NUM                    := 0;
   ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;
END;
/

prompt
prompt Creating procedure SP_TA_CMP_RPT_DAY
prompt ====================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.SP_TA_CMP_RPT_DAY (
   I_DATE_DAY     IN       NUMBER
 --, I_END_DATE     IN       NUMBER
 , ERR_NUM        OUT      NUMBER
 , ERR_MSG        OUT      VARCHAR2
)
AS
   /**
     * ���������� CMP�����ձ�
     * ��������� I_DATE_DAY             ����ʱ��,�������Ϊ��,�׳��쳣
     * ��������� ERR_NUM                ���ִ���ʱ����ִ�д����
     * �������������ERR_MSG                ���ִ���ʱ���صĴ�����Ϣ
     * ��д��Ա�����ҷ�
     * �������ڣ�2012-03-29
     * ��˾���ƣ�
     **/
   V_DATE_DAY                    DATE := TO_DATE(I_DATE_DAY,'YYYYMMDD');             --����ʱ��
   V_DAY                         NUMBER := I_DATE_DAY;       --����ʱ��
   V_BEGIN_DATE                  VARCHAR2 (19) :=SUBSTR(TO_CHAR(TO_DATE(I_DATE_DAY,'YYYY-MM-DD'),'YYYY-MM-DD'),0,7);
   V_END_DATE                    VARCHAR2 (19) :=SUBSTR(TO_CHAR(ADD_MONTHS(LAST_DAY(TO_DATE(I_DATE_DAY,'YYYY-MM-DD')),-5),'YYYY-MM-DD'),0,7);
   V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_CMP_RPT_DAY';--��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF V_DATE_DAY IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'I_DATE_DAY IS NULL!');
   END IF;
/* IF V_END_DAY IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'I_END_DATE IS NULL!');
   END IF;*/

   --�����ʱ������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_CMP_RPT_DAY';
    --����ǵ���1�ţ���ɾ��������ǰ1�ŵ���������ĩǰǰһ��֮�������
    IF SUBSTR(TO_CHAR(V_DAY),-2,2)='01'
        THEN
     DELETE FROM TA_CMP_RPT_DAY T
        WHERE T.CAL_DAY_ID BETWEEN  ADD_MONTHS(V_DATE_DAY,-4) AND TRUNC(ADD_MONTHS(V_DATE_DAY,-3),'MM')-2;
        COMMIT;
     END IF;
     --֧�ֶ�����������
   DELETE FROM TA_CMP_RPT_DAY T
          WHERE T.CAL_DAY_ID=V_DATE_DAY;
          /*TO_DATE(T.SCHL_CALL_MON||'-01','YYYY-MM-DD')<=V_DATE_DAY
             AND ADD_MONTHS(LAST_DAY(TO_DATE(T.SCHL_CALL_MON||'-01','YYYY-MM-DD')),+5)>=V_DATE_DAY*/
             COMMIT;
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '������������ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
   --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_CMP_RPT_DAY
         (  CAL_DAY_ID                --ͳ������
            ,SCHL_CALL_MON             --�ƻ���������
            ,ACTV_ID                   --�ID
            ,BAT_CODE                  --���δ���
            ,COM_TYP                   --��������
            ,BAT_PRJT                  --������Ŀ
            ,COMP_ID                   --�ֹ�˾ID
            ,CITY_ID                   --����
            ,ORG_TYP                --��������
            ,CAL_TIMES                  --�������
            ,PRJT_MGR_ID               --��Ŀ����ID
            ,TEM_LEAD_ID               --�Ŷӳ�ID
            ,USER_ID                   --��ϯID
            ,LIST_TNO                  --��������
            --,FST_CAL_LIST_QTY          --�ײ�������
            --,CAL_COMP_LIST_QTY         --�������������
            --,CONNT_LIST_QTY            --��ͨ������
            --,CONT_LIST_QTY             --�Ӵ�������
           -- ,CAL_COMP_CONT_LIST_QTY    --������ɽӴ�������
            --,SURP_TRK_LIST_QTY         --ʣ�����������
            --,OLINE_SMIT_QTY            --�����ύ����
            --,OLINE_SMIT_PRM            --�����ύ����
            --,OLINE_TRAN_QTY            --���ϳɽ�����
            --,OLINE_TRAN_PRM            --���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY      --���ڿۿ�ɹ�����
            --,FST_CHARGBK_SUCC_PRM      --���ڿۿ�ɹ�����
           --,ANNUL_FST_PRM_PRM         --�껯�±�����
            --,ACTL_FST_PRM_PRM          --ʵ���±�����
            --,WTN_QTY                   --�������ͳɹ�����
            --,AGG_CAL_TIMES             --�ۼƲ������
            --,AGG_CONT_TIMES            --�ۼƽӴ�����
            )

   SELECT
       V_DATE_DAY             AS CAL_DAY_ID,
       T2.CALL_YEAR_MONTH     AS SCHL_CALL_MON,   --���(�ƻ���������)
       T3.OB_COM_NAME           AS ACTV_ID,--�ID
       T2.BATCH_NAME            AS BAT_CODE,   ---����ID
       T2.COM_TYPE            AS COM_TYP,--�������ࣨ�¶������������н飩
       T3.PRJ_ID              AS BAT_PRJT,--������Ŀ
       T3.COMPANY_ID          AS COMP_ID,--�ֹ�˾
       T2.BELONGCITY          AS CITY_ID,--����
       T1.ORG_ID              AS ORG_TYP,--����
       T2.CALL_TIMES      AS CAL_TIMES,--�������ID
       T1.ORG_ID   AS PRJT_MGR_ID,--��Ŀ����
       T1.ORG_ID   AS TEM_LEAD_ID,--�Ŷӳ�ID
       T1.USER_ID            AS USER_ID, --��ϯ����
       COUNT(T1.CUS_LIST_ID) AS LIST_TNO--��������
  FROM TB_CUSTOMER_LIST T1
       INNER JOIN  TB_SALE_BATCH   T2 ON  T1.BATCH_ID=T2.BATCH_ID
       INNER JOIN  TB_OB_COM       T3 ON T3.OB_COM_ID=T2.OB_COM_ID
       --LEFT JOIN C_USER            T4 ON T4.USERID=T1.USER_ID AND T4.ORG_ID=T1.ORG_ID
   WHERE T1.CALL_STATUS IN (0,1)--1��ʾ�Ѳ���0��ʾδ����
   AND T1.STATUS IN ('0','1')--����״̬  1��ʾ�ѷ��䣬0��ʾδ����
   AND T2.REMOVE_DATE>=V_DATE_DAY --���ص�������ͳ��ʱ������δ������Ч��
  -- AND T2.CREATE_TIME =V_DATE_DAY--��������ʱ��
   AND T2.CALL_YEAR_MONTH<=V_BEGIN_DATE
   AND T2.CALL_YEAR_MONTH>=V_END_DATE
   GROUP BY
        V_DATE_DAY
       ,T2.CALL_YEAR_MONTH
       ,T3.OB_COM_NAME
       ,T2.BATCH_NAME
       ,T2.COM_TYPE
       ,T3.PRJ_ID
       ,T3.COMPANY_ID
       ,T2.BELONGCITY
       ,T1.ORG_ID
       ,T2.CALL_TIMES
       ,T1.ORG_ID
       ,T1.ORG_ID
       ,T1.USER_ID ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
 -------------------------------------
          --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�����ײ�������ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
   --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_CMP_RPT_DAY
         (  CAL_DAY_ID                --ͳ������
            ,SCHL_CALL_MON             --�ƻ���������
            ,ACTV_ID                   --�ID
            ,BAT_CODE                  --���δ���
            ,COM_TYP                   --��������
            ,BAT_PRJT                  --������Ŀ
            ,COMP_ID                   --�ֹ�˾ID
            ,CITY_ID                   --����
            ,ORG_TYP                --��������
            ,CAL_TIMES                  --�������
            ,PRJT_MGR_ID               --��Ŀ����ID
            ,TEM_LEAD_ID               --�Ŷӳ�ID
            ,USER_ID                   --��ϯID
           -- ,LIST_TNO                  --��������
            ,FST_CAL_LIST_QTY          --�ײ�������
            --,CAL_COMP_LIST_QTY         --�������������
            --,CONNT_LIST_QTY            --��ͨ������
            --,CONT_LIST_QTY             --�Ӵ�������
           -- ,CAL_COMP_CONT_LIST_QTY    --������ɽӴ�������
            --,SURP_TRK_LIST_QTY         --ʣ�����������
            --,OLINE_SMIT_QTY            --�����ύ����
            --,OLINE_SMIT_PRM            --�����ύ����
            --,OLINE_TRAN_QTY            --���ϳɽ�����
            --,OLINE_TRAN_PRM            --���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY      --���ڿۿ�ɹ�����
            --,FST_CHARGBK_SUCC_PRM      --���ڿۿ�ɹ�����
           --,ANNUL_FST_PRM_PRM         --�껯�±�����
            --,ACTL_FST_PRM_PRM          --ʵ���±�����
            --,WTN_QTY                   --�������ͳɹ�����
            --,AGG_CAL_TIMES             --�ۼƲ������
            --,AGG_CONT_TIMES            --�ۼƽӴ�����
            )

  WITH V_TASK_H AS(
SELECT
 -1                  AS HISTORY_ID
,T1.TASK_ID              AS TASK_ID
,T1.CREATE_TIME          AS CREATE_TIME
,T1.CHANGE_TIME          AS CHANGE_TIME
,T1.FIRST_RESULT         AS FIRST_RESULT
,T1.SECOND_RESULT        AS SECOND_RESULT
,T1.USER_ID              AS USER_ID
,T1.ORG_ID               AS ORG_ID
,T1.STATUS_ID            AS STATUS_ID
,T1.TYPE_ID              AS TYPE_ID
,T1.POLICY_ID            AS POLICY_ID
,T1.OB_COM_ID            AS OB_COM_ID
,T1.BATCH_ID             AS BATCH_ID
,T1.CUS_LIST_ID          AS CUS_LIST_ID
,T1.CHANGE_TIME          AS CREATE_HISTORY_DATE
FROM TB_TASK T1
INNER JOIN  TB_SALE_BATCH  T2 ON T1.BATCH_ID=T2.BATCH_ID
WHERE    T2.CALL_YEAR_MONTH<=V_BEGIN_DATE
   AND T2.CALL_YEAR_MONTH>=V_END_DATE
   AND T1.STATUS_ID <> '6'
   AND T1.TYPE_ID<>'4'
UNION ALL
 SELECT
 T1.HISTORY_ID           AS HISTORY_ID
,T1.TASK_ID              AS TASK_ID
,T1.CREATE_TIME          AS CREATE_TIME
,T1.CHANGE_TIME          AS CHANGE_TIME
,T1.FIRST_RESULT         AS FIRST_RESULT
,T1.SECOND_RESULT        AS SECOND_RESULT
,T1.USER_ID              AS USER_ID
,T1.ORG_ID               AS ORG_ID
,T1.STATUS_ID            AS STATUS_ID
,T1.TYPE_ID              AS TYPE_ID
,T1.POLICY_ID            AS POLICY_ID
,T1.OB_COM_ID            AS OB_COM_ID
,T1.BATCH_ID             AS BATCH_ID
,T1.CUS_LIST_ID          AS CUS_LIST_ID
,T1.CHANGE_TIME  AS CREATE_HISTORY_DATE
FROM TB_TASK_HISTORY T1
INNER JOIN  TB_SALE_BATCH  T2 ON T1.BATCH_ID=T2.BATCH_ID
WHERE  T2.CALL_YEAR_MONTH<=V_BEGIN_DATE
   AND T2.CALL_YEAR_MONTH>=V_END_DATE
   AND  T1.STATUS_ID <> '6'
   AND T1.TYPE_ID<>'4'
)
   SELECT
        V_DATE_DAY                  AS CAL_DAY_ID,
        T2.CALL_YEAR_MONTH          AS SCHL_CALL_MON,   --���(�ƻ���������)
        T4.OB_COM_NAME              AS ACTV_ID,--�ID
        T2.BATCH_NAME               AS BAT_CODE,   ---����ID
        T2.COM_TYPE                 AS COM_TYP,--�������ࣨ�¶������������н飩
        T4.PRJ_ID                   AS BAT_PRJT,--������Ŀ
        T4.COMPANY_ID               AS COMP_ID,--�ֹ�˾
        T2.BELONGCITY               AS CITY_ID,--����
        T5.ORG_ID                   AS ORG_TYP,--����
        T2.CALL_TIMES                        AS CAL_TIMES,--�������ID
        T5.ORG_ID              AS PRJT_MGR_ID,--��Ŀ����
        T5.ORG_ID              AS TEM_LEAD_ID,--�Ŷӳ�ID
        NVL(T1.USER_ID,'-1')              AS USER_ID, --��ϯ����
        COUNT(DISTINCT T1.CUS_LIST_ID)    AS LIST_TNO--�ײ�����
 FROM V_TASK_H T1
       --INNER JOIN  TB_TASK T3  ON T1.TASK_ID=T3.TASK_ID
       INNER JOIN  TB_SALE_BATCH  T2 ON T1.BATCH_ID=T2.BATCH_ID
       INNER JOIN  TB_OB_COM  T4 ON T4.OB_COM_ID=T1.OB_COM_ID
       INNER JOIN  C_USER  T5 ON  T5.USERID=T1.USER_ID  --AND T5.ORG_ID=T1.ORG_ID
 WHERE
   T1.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T1.TYPE_ID<>'4'--�������� �ײ�
   AND EXISTS
      (SELECT NULL
        FROM TB_TASK_HISTORY TT
             WHERE
                  TT.TASK_ID=T1.TASK_ID
                  AND TT.STATUS_ID='6'
                  AND TT.TYPE_ID='4'
                  AND TO_CHAR(TT.CREATE_HISTORY_DATE,'YYYYMMDD')=TO_CHAR(T1.CREATE_HISTORY_DATE,'YYYYMMDD')--���ײ�״̬�ı�ʱ����ύ����С��ʱ����ͬһ��
                  )
   --AND TO_DATE(TO_CHAR(T1.CREATE_HISTORY_DATE, 'YYYYMMDD'), 'YYYYMMDD') =TO_DATE( STAT_DATE, 'YYYYMMDD')
   --AND T2.CALL_YEAR_MONTH<=V_BEGIN_DATE
  -- AND T2.CALL_YEAR_MONTH>=V_END_DATE
   GROUP BY
        V_DATE_DAY
        ,T2.CALL_YEAR_MONTH
        ,T4.OB_COM_NAME
        ,T2.BATCH_NAME
        ,T2.COM_TYPE
        ,T4.PRJ_ID
        ,T4.COMPANY_ID
        ,T2.BELONGCITY
        ,T5.ORG_ID
        ,T2.CALL_TIMES
        ,T5.ORG_ID
        ,T5.ORG_ID
        ,NVL(T1.USER_ID,'-1')
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
  --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '���㲦����������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
  --���㵱ǰ������
  INSERT /*+ APPEND*/INTO TEMP_CMP_RPT_DAY
         (  CAL_DAY_ID                --ͳ������
            ,SCHL_CALL_MON             --�ƻ���������
            ,ACTV_ID                   --�ID
            ,BAT_CODE                  --���δ���
            ,COM_TYP                   --��������
            ,BAT_PRJT                  --������Ŀ
            ,COMP_ID                   --�ֹ�˾ID
            ,CITY_ID                   --����
            ,ORG_TYP                  --��������
            ,CAL_TIMES                     --�������ID
            ,PRJT_MGR_ID               --��Ŀ����ID
            ,TEM_LEAD_ID               --�Ŷӳ�ID
            ,USER_ID                   --��ϯID
            --,LIST_TNO                  --��������
            --,FST_CAL_LIST_QTY          --�ײ�������
            ,CAL_COMP_LIST_QTY         --�������������
            --,CONNT_LIST_QTY            --��ͨ������
            --,CONT_LIST_QTY             --�Ӵ�������
           -- ,CAL_COMP_CONT_LIST_QTY    --������ɽӴ�������
            --,SURP_TRK_LIST_QTY         --ʣ�����������
            --,OLINE_SMIT_QTY            --�����ύ����
            --,OLINE_SMIT_PRM            --�����ύ����
            --,OLINE_TRAN_QTY            --���ϳɽ�����
            --,OLINE_TRAN_PRM            --���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY      --���ڿۿ�ɹ�����
            --,FST_CHARGBK_SUCC_PRM      --���ڿۿ�ɹ�����
           --,ANNUL_FST_PRM_PRM         --�껯�±�����
            --,ACTL_FST_PRM_PRM          --ʵ���±�����
            --,WTN_QTY                   --�������ͳɹ�����
            --,AGG_CAL_TIMES             --�ۼƲ������
            --,AGG_CONT_TIMES            --�ۼƽӴ�����
            )
       SELECT V_DATE_DAY AS CAL_DAY_ID,
              T3.CALL_YEAR_MONTH             AS SCHL_CALL_MON,--���(�ƻ���������)
              T2.OB_COM_NAME                     AS ACTV_ID,--�ID
              T3.BATCH_NAME                    AS BAT_CODE, ---����ID
              T3.COM_TYPE                    AS COM_TYP,--�������ࣨ�¶������������н飩
              T2.PRJ_ID                      AS BAT_PRJT,--������Ŀ
              T2.COMPANY_ID                  AS COMP_ID,--�ֹ�˾
              T3.BELONGCITY                  AS CITY_ID,--��������
              T4.ORG_ID                     AS ORG_TYP,--����
              T3.CALL_TIMES                           AS CAL_TIMES,--�������ID
              T4.ORG_ID                           AS PRJT_MGR_ID,--��Ŀ����
              T4.ORG_ID                           AS TEM_LEAD_ID,--�Ŷӳ�ID
              T1.USER_ID                     AS USER_ID,  --��ϯ
              COUNT(T1.CUS_LIST_ID) AS CAL_COMP_LIST_QTY--�������������
      FROM TB_TASK        T1,
           TB_OB_COM      T2,
           TB_SALE_BATCH  T3,
           C_USER         T4
       WHERE T1.OB_COM_ID=T2.OB_COM_ID
         AND T1.BATCH_ID=T3.BATCH_ID
         AND T1.USER_ID=T4.USERID
         --AND T1.ORG_ID=T4.ORG_ID
         AND (T1.STATUS_ID IN (11,13)--11��ʧ�ܣ�13���ɹ������۳ɹ���
              OR T1.ACTIVE_STATUS <> '0')--0���ֹ
         AND T1.TYPE_ID='7'
        -- AND T1.CHANGE_TIME =V_DATE_DAY--�ύ����С��ʱ��
        AND T3.CALL_YEAR_MONTH<=V_BEGIN_DATE
        AND T3.CALL_YEAR_MONTH>=V_END_DATE
        GROUP BY
             V_DATE_DAY
            ,T3.CALL_YEAR_MONTH
            ,T2.OB_COM_NAME
            ,T3.BATCH_NAME
            ,T3.COM_TYPE
            ,T2.PRJ_ID
            ,T2.COMPANY_ID
            ,T3.BELONGCITY
            ,T4.ORG_ID
            ,T3.CALL_TIMES
            ,T4.ORG_ID
            ,T4.ORG_ID
            ,T1.USER_ID
 ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;
   --������ʷ����
INSERT /*+ APPEND*/INTO TEMP_CMP_RPT_DAY
         (  CAL_DAY_ID                --ͳ������
            ,SCHL_CALL_MON             --�ƻ���������
            ,ACTV_ID                   --�ID
            ,BAT_CODE                  --���δ���
            ,COM_TYP                   --��������
            ,BAT_PRJT                  --������Ŀ
            ,COMP_ID                   --�ֹ�˾ID
            ,CITY_ID                   --����
            ,ORG_TYP                  --��������
            ,CAL_TIMES                     --�������ID
            ,PRJT_MGR_ID               --��Ŀ����ID
            ,TEM_LEAD_ID               --�Ŷӳ�ID
            ,USER_ID                   --��ϯID
            --,LIST_TNO                  --��������
            --,FST_CAL_LIST_QTY          --�ײ�������
            ,CAL_COMP_LIST_QTY         --�������������
            --,CONNT_LIST_QTY            --��ͨ������
            --,CONT_LIST_QTY             --�Ӵ�������
           -- ,CAL_COMP_CONT_LIST_QTY    --������ɽӴ�������
            --,SURP_TRK_LIST_QTY         --ʣ�����������
            --,OLINE_SMIT_QTY            --�����ύ����
            --,OLINE_SMIT_PRM            --�����ύ����
            --,OLINE_TRAN_QTY            --���ϳɽ�����
            --,OLINE_TRAN_PRM            --���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY      --���ڿۿ�ɹ�����
            --,FST_CHARGBK_SUCC_PRM      --���ڿۿ�ɹ�����
           --,ANNUL_FST_PRM_PRM         --�껯�±�����
            --,ACTL_FST_PRM_PRM          --ʵ���±�����
            --,WTN_QTY                   --�������ͳɹ�����
            --,AGG_CAL_TIMES             --�ۼƲ������
            --,AGG_CONT_TIMES            --�ۼƽӴ�����
            )
       SELECT V_DATE_DAY AS CAL_DAY_ID,
              T3.CALL_YEAR_MONTH             AS SCHL_CALL_MON,--���(�ƻ���������)
              T2.OB_COM_NAME                     AS ACTV_ID,--�ID
              T3.BATCH_NAME                    AS BAT_CODE, ---����ID
              T3.COM_TYPE                    AS COM_TYP,--�������ࣨ�¶������������н飩
              T2.PRJ_ID                      AS BAT_PRJT,--������Ŀ
              T2.COMPANY_ID                  AS COMP_ID,--�ֹ�˾
              T3.BELONGCITY                  AS CITY_ID,--��������
              T4.ORG_ID                     AS ORG_TYP,--����
              T3.CALL_TIMES                              AS CAL_TIMES,--�������ID
              T4.ORG_ID                          AS PRJT_MGR_ID,--��Ŀ����
              T4.ORG_ID                          AS TEM_LEAD_ID,--�Ŷӳ�ID
              T1.USER_ID                     AS USER_ID,  --��ϯ
              COUNT(DISTINCT T1.CUS_LIST_ID) AS CAL_COMP_LIST_QTY--�������������
      FROM TB_TASK_HISTORY  T1,
           TB_OB_COM      T2,
           TB_SALE_BATCH  T3,
           C_USER         T4
       WHERE T1.OB_COM_ID=T2.OB_COM_ID
         AND T1.BATCH_ID=T3.BATCH_ID
         AND T1.USER_ID=T4.USERID
         --AND T1.ORG_ID=T4.ORG_ID
         AND (T1.STATUS_ID IN (11,13)--11��ʧ�ܣ�13���ɹ������۳ɹ���
              OR T1.ACTIVE_STATUS <> '0')--0���ֹ
          AND T1.TYPE_ID='7'
        -- AND T1.CREATE_HISTORY_DATE =V_DATE_DAY--�ύ����С��ʱ��
            AND T3.CALL_YEAR_MONTH<=V_BEGIN_DATE
            AND T3.CALL_YEAR_MONTH>=V_END_DATE
        GROUP BY
             V_DATE_DAY
            ,T3.CALL_YEAR_MONTH
            ,T2.OB_COM_NAME
            ,T3.BATCH_NAME
            ,T3.COM_TYPE
            ,T2.PRJ_ID
            ,T2.COMPANY_ID
            ,T3.BELONGCITY
            ,T4.ORG_ID
            ,T3.CALL_TIMES
            ,T4.ORG_ID
            ,T4.ORG_ID
            ,T1.USER_ID
 ;
  V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;
   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

  --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '���� �Ӵ�����������ͨ������ ��ʣ�����������ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

   V_ROW_NUM := 0;
   INSERT /*+ APPEND*/INTO TEMP_CMP_RPT_DAY
         (  CAL_DAY_ID                --ͳ������
            ,SCHL_CALL_MON             --�ƻ���������
            ,ACTV_ID                   --�ID
            ,BAT_CODE                  --���δ���
            ,COM_TYP                   --��������
            ,BAT_PRJT                  --������Ŀ
            ,COMP_ID                   --�ֹ�˾ID
            ,CITY_ID                   --����
            ,ORG_TYP                --��������
            ,CAL_TIMES                     --�������ID
            ,PRJT_MGR_ID               --��Ŀ����ID
            ,TEM_LEAD_ID               --�Ŷӳ�ID
            ,USER_ID                   --��ϯID
            --,LIST_TNO                  --��������
            --,FST_CAL_LIST_QTY          --�ײ�������
            --,CAL_COMP_LIST_QTY         --�������������
            ,CONNT_LIST_QTY            --��ͨ������
            ,CONT_LIST_QTY             --�Ӵ�������
            --,CAL_COMP_CONT_LIST_QTY    --������ɽӴ�������
            ,SURP_TRK_LIST_QTY         --ʣ�����������
            --,OLINE_SMIT_QTY            --�����ύ����
            --,OLINE_SMIT_PRM            --�����ύ����
            --,OLINE_TRAN_QTY            --���ϳɽ�����
            --,OLINE_TRAN_PRM            --���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY      --���ڿۿ�ɹ�����
            --,FST_CHARGBK_SUCC_PRM      --���ڿۿ�ɹ�����
           --,ANNUL_FST_PRM_PRM         --�껯�±�����
            --,ACTL_FST_PRM_PRM          --ʵ���±�����
            --,WTN_QTY                   --�������ͳɹ�����
            --,AGG_CAL_TIMES             --�ۼƲ������
            --,AGG_CONT_TIMES            --�ۼƽӴ�����
            )
        SELECT V_DATE_DAY AS CAL_DAY_ID,
               T2.CALL_YEAR_MONTH             AS SCHL_CALL_MON,--���(�ƻ���������)
               T4.OB_COM_NAME                    AS ACTV_ID, --�ID
               T2.BATCH_NAME                    AS BAT_CODE,   ---����ID
               T2.COM_TYPE                    AS COM_TYP,--�������ࣨ�¶������������н飩
               T4.PRJ_ID                      AS BAT_PRJT,--������Ŀ
               T4.COMPANY_ID                  AS COMP_ID,--�ֹ�˾
               T2.BELONGCITY                  AS CITY_ID,--��������
               T5.ORG_ID                      AS ORG_TYP,--����
               T2.CALL_TIMES                           AS CAL_TIMES,--�������ID
               T5.ORG_ID                           AS PRJT_MGR_ID,--��Ŀ����
               T5.ORG_ID                           AS TEM_LEAD_ID,--�Ŷӳ�ID
               T3.USER_ID                     AS USER_ID, --��ϯ����
               COUNT(DISTINCT CASE WHEN  T1.IS_THROUGH='1' THEN T1.CUS_LIST_ID ELSE NULL END) AS CONNT_LIST_QTY,--��ͨ������
               COUNT(DISTINCT CASE WHEN  T1.IS_CONTACT='1' THEN T1.CUS_LIST_ID ELSE NULL END) AS CONT_LIST_QTY,--�Ӵ�������
               COUNT(DISTINCT CASE WHEN  (T1.TASK_STATUS  IN('��������','���δͨ��','��֧��','�����') OR T3.STATUS_ID IN('2','4','5','7'))AND (TASK_TYPE IN('��������','�������') OR T3.TYPE_ID IN('2','5')) AND T3.STATUS_ID IN('2','4','5','7') AND  T3.TYPE_ID IN('2','5') THEN T1.CUS_LIST_ID ELSE NULL END)  AS SURP_TRK_LIST_QTY--ʣ�����������
          FROM TB_SALE_HISTORY T1,
               TB_SALE_BATCH   T2,
               TB_TASK         T3,
               TB_OB_COM       T4,
               C_USER          T5
         WHERE T1.TASK_ID=T3.TASK_ID
           AND T2.BATCH_ID=T3.BATCH_ID
           AND T4.OB_COM_ID=T1.OBCOM_ID
           AND T3.USER_ID=T5.USERID
           --AND T3.ORG_ID=T5.ORG_ID
           --AND T1.IS_THROUGH='1'--��ͨ�����0��δ��ͨ��1���ѽ�ͨ��
          -- AND T1.CREATE_HISTORY_DATE =V_DATE_DAY
              AND T2.CALL_YEAR_MONTH<=V_BEGIN_DATE
              AND T2.CALL_YEAR_MONTH>=V_END_DATE
           GROUP BY
               V_DATE_DAY
              ,T2.CALL_YEAR_MONTH
              ,T4.OB_COM_NAME
              ,T2.BATCH_NAME
              ,T2.COM_TYPE
              ,T4.PRJ_ID
              ,T4.COMPANY_ID
              ,T2.BELONGCITY
              ,T5.ORG_ID
              ,T2.CALL_TIMES
              ,T5.ORG_ID
              ,T5.ORG_ID
              ,T3.USER_ID
              ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;


   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
 --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '���㲦����ɽӴ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
  INSERT /*+ APPEND*/INTO TEMP_CMP_RPT_DAY
         (  CAL_DAY_ID                --ͳ������
            ,SCHL_CALL_MON             --�ƻ���������
            ,ACTV_ID                   --�ID
            ,BAT_CODE                  --���δ���
            ,COM_TYP                   --��������
            ,BAT_PRJT                  --������Ŀ
            ,COMP_ID                   --�ֹ�˾ID
            ,CITY_ID                   --����
            ,ORG_TYP                   --��������
            ,CAL_TIMES                     --�������ID
            ,PRJT_MGR_ID               --��Ŀ����ID
            ,TEM_LEAD_ID               --�Ŷӳ�ID
            ,USER_ID                   --��ϯID
            --,LIST_TNO                  --��������
            --,FST_CAL_LIST_QTY          --�ײ�������
            --,CAL_COMP_LIST_QTY         --�������������
            --,CONNT_LIST_QTY            --��ͨ������
            --,CONT_LIST_QTY             --�Ӵ�������
           ,CAL_COMP_CONT_LIST_QTY    --������ɽӴ�������
            --,SURP_TRK_LIST_QTY         --ʣ�����������
            --,OLINE_SMIT_QTY            --�����ύ����
            --,OLINE_SMIT_PRM            --�����ύ����
            --,OLINE_TRAN_QTY            --���ϳɽ�����
            --,OLINE_TRAN_PRM            --���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY      --���ڿۿ�ɹ�����
            --,FST_CHARGBK_SUCC_PRM      --���ڿۿ�ɹ�����
           --,ANNUL_FST_PRM_PRM         --�껯�±�����
            --,ACTL_FST_PRM_PRM          --ʵ���±�����
            --,WTN_QTY                   --�������ͳɹ�����
            --,AGG_CAL_TIMES             --�ۼƲ������
            --,AGG_CONT_TIMES            --�ۼƽӴ�����
            )
        SELECT V_DATE_DAY AS CAL_DAY_ID,
               T3.CALL_YEAR_MONTH             AS SCHL_CALL_MON,--���(�ƻ���������)
               T2.OB_COM_NAME                 AS ACTV_ID,--�����
               T3.BATCH_NAME                    AS BAT_CODE, ---����ID
               T3.COM_TYPE                    AS COM_TYP,--�������ࣨ�¶������������н飩
               T2.PRJ_ID                      AS BAT_PRJT,--������Ŀ
               T2.COMPANY_ID                  AS COMP_ID,--�ֹ�˾
               T3.BELONGCITY                  AS CITY_ID,--��������
               T4.ORG_ID                      AS ORG_TYPE,--����
               T3.CALL_TIMES                                         AS CAL_TIMES,--�������ID
               T4.ORG_ID                         AS PRJT_MGR_ID,--��Ŀ����
               T4.ORG_ID                        AS TEM_LEAD_ID,--�Ŷӳ�ID
               T1.USER_ID                     AS USER_ID,  --��ϯ
               COUNT(T1.CUS_LIST_ID) AS CAL_COMP_CONT_LIST_QTY --������ɽӴ�������
        FROM TB_TASK        T1,
             TB_OB_COM      T2,
             TB_SALE_BATCH  T3,
             C_USER          T4
         WHERE T1.OB_COM_ID=T2.OB_COM_ID
           AND T1.BATCH_ID=T3.BATCH_ID
           AND T1.USER_ID=T4.USERID
           --AND T1.ORG_ID=T4.ORG_ID
           AND (T1.STATUS_ID IN (11,13)--11��ʧ�ܣ�13���۳ɹ�
                OR T1.ACTIVE_STATUS <> '0')--0���ֹ
           AND EXISTS (SELECT NULL FROM TB_SALE_HISTORY A
                             WHERE T1.TASK_ID=A.TASK_ID
                                   AND T1.CUS_LIST_ID=A.CUS_LIST_ID
                                   AND T1.OB_COM_ID=A.OBCOM_ID
                                   AND A.IS_CONTACT='1'--�ѽӴ�
                                   )
           --AND T1.CHANGE_TIME =V_DATE_DAY--�ύ����С��ʱ��
              AND T3.CALL_YEAR_MONTH<=V_BEGIN_DATE
              AND T3.CALL_YEAR_MONTH>=V_END_DATE
           GROUP BY
            V_DATE_DAY
            ,T3.CALL_YEAR_MONTH
            ,T2.OB_COM_NAME
            ,T3.BATCH_NAME
            ,T3.COM_TYPE
            ,T2.PRJ_ID
            ,T2.COMPANY_ID
            ,T3.BELONGCITY
            ,T4.ORG_ID
            ,T3.CALL_TIMES
            ,T4.ORG_ID
            ,T4.ORG_ID
            ,T1.USER_ID
             ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;
   --������ʷ����
 INSERT /*+ APPEND*/INTO TEMP_CMP_RPT_DAY
         (  CAL_DAY_ID                --ͳ������
            ,SCHL_CALL_MON             --�ƻ���������
            ,ACTV_ID                   --�ID
            ,BAT_CODE                  --���δ���
            ,COM_TYP                   --��������
            ,BAT_PRJT                  --������Ŀ
            ,COMP_ID                   --�ֹ�˾ID
            ,CITY_ID                   --����
            ,ORG_TYP                   --��������
            ,CAL_TIMES                     --�������ID
            ,PRJT_MGR_ID               --��Ŀ����ID
            ,TEM_LEAD_ID               --�Ŷӳ�ID
            ,USER_ID                   --��ϯID
            --,LIST_TNO                  --��������
            --,FST_CAL_LIST_QTY          --�ײ�������
            --,CAL_COMP_LIST_QTY         --�������������
            --,CONNT_LIST_QTY            --��ͨ������
            --,CONT_LIST_QTY             --�Ӵ�������
           ,CAL_COMP_CONT_LIST_QTY    --������ɽӴ�������
            --,SURP_TRK_LIST_QTY         --ʣ�����������
            --,OLINE_SMIT_QTY            --�����ύ����
            --,OLINE_SMIT_PRM            --�����ύ����
            --,OLINE_TRAN_QTY            --���ϳɽ�����
            --,OLINE_TRAN_PRM            --���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY      --���ڿۿ�ɹ�����
            --,FST_CHARGBK_SUCC_PRM      --���ڿۿ�ɹ�����
           --,ANNUL_FST_PRM_PRM         --�껯�±�����
            --,ACTL_FST_PRM_PRM          --ʵ���±�����
            --,WTN_QTY                   --�������ͳɹ�����
            --,AGG_CAL_TIMES             --�ۼƲ������
            --,AGG_CONT_TIMES            --�ۼƽӴ�����
            )
        SELECT V_DATE_DAY AS CAL_DAY_ID,
               T3.CALL_YEAR_MONTH             AS SCHL_CALL_MON,--���(�ƻ���������)
               T2.OB_COM_NAME                 AS ACTV_ID,--�����
               T3.BATCH_NAME                    AS BAT_CODE, ---����ID
               T3.COM_TYPE                    AS COM_TYP,--�������ࣨ�¶������������н飩
               T2.PRJ_ID                      AS BAT_PRJT,--������Ŀ
               T2.COMPANY_ID                  AS COMP_ID,--�ֹ�˾
               T3.BELONGCITY                  AS CITY_ID,--��������
               T4.ORG_ID                      AS ORG_TYPE,--����
               T3.CALL_TIMES                         AS CAL_TIMES,--�������ID
               T4.ORG_ID                         AS PRJT_MGR_ID,--��Ŀ����
               T4.ORG_ID                        AS TEM_LEAD_ID,--�Ŷӳ�ID
               T1.USER_ID                     AS USER_ID,  --��ϯ
               COUNT(DISTINCT T1.CUS_LIST_ID) AS CAL_COMP_CONT_LIST_QTY --������ɽӴ�������
        FROM TB_TASK_HISTORY        T1,
             TB_OB_COM      T2,
             TB_SALE_BATCH  T3,
             C_USER          T4
         WHERE T1.OB_COM_ID=T2.OB_COM_ID
           AND T1.BATCH_ID=T3.BATCH_ID
           AND T1.USER_ID=T4.USERID
          -- AND T1.ORG_ID=T4.ORG_ID
           AND (T1.STATUS_ID IN (11,13)--11��ʧ�ܣ�13���۳ɹ�
                OR T1.ACTIVE_STATUS <> '0')--0���ֹ
           AND EXISTS (SELECT NULL FROM TB_SALE_HISTORY A
                             WHERE T1.TASK_ID=A.TASK_ID
                                   AND T1.CUS_LIST_ID=A.CUS_LIST_ID
                                   AND T1.OB_COM_ID=A.OBCOM_ID
                                   AND A.IS_CONTACT='1'--�ѽӴ�
                                   )
          --AND T1.CREATE_HISTORY_DATE =V_DATE_DAY--�ύ����С��ʱ��
              AND T3.CALL_YEAR_MONTH<=V_BEGIN_DATE
              AND T3.CALL_YEAR_MONTH>=V_END_DATE
           GROUP BY
            V_DATE_DAY
            ,T3.CALL_YEAR_MONTH
            ,T2.OB_COM_NAME
            ,T3.BATCH_NAME
            ,T3.COM_TYPE
            ,T2.PRJ_ID
            ,T2.COMPANY_ID
            ,T3.BELONGCITY
            ,T4.ORG_ID
            ,T3.CALL_TIMES
            ,T4.ORG_ID
            ,T4.ORG_ID
            ,T1.USER_ID
             ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
--------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '���������ύ�������ѡ����ϳɽ��������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
  INSERT /*+ APPEND*/INTO TEMP_CMP_RPT_DAY
         (  CAL_DAY_ID                --ͳ������
            ,SCHL_CALL_MON             --�ƻ���������
            ,ACTV_ID                   --�ID
            ,BAT_CODE                  --���δ���
            ,COM_TYP                   --��������
            ,BAT_PRJT                  --������Ŀ
            ,COMP_ID                   --�ֹ�˾ID
            ,CITY_ID                   --����
            ,ORG_TYP                   --��������
            ,CAL_TIMES                     --�������ID
            ,PRJT_MGR_ID               --��Ŀ����ID
            ,TEM_LEAD_ID               --�Ŷӳ�ID
            ,USER_ID                   --��ϯID
            --,LIST_TNO                  --��������
            --,FST_CAL_LIST_QTY          --�ײ�������
            --,CAL_COMP_LIST_QTY         --�������������
            --,CONNT_LIST_QTY            --��ͨ������
            --,CONT_LIST_QTY             --�Ӵ�������
           --,CAL_COMP_CONT_LIST_QTY    --������ɽӴ�������
            --,SURP_TRK_LIST_QTY         --ʣ�����������
            ,OLINE_SMIT_QTY            --�����ύ����
            ,OLINE_SMIT_PRM            --�����ύ����
            ,OLINE_TRAN_QTY            --���ϳɽ�����
            ,OLINE_TRAN_PRM            --���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY      --���ڿۿ�ɹ�����
            --,FST_CHARGBK_SUCC_PRM      --���ڿۿ�ɹ�����
           --,ANNUL_FST_PRM_PRM         --�껯�±�����
            --,ACTL_FST_PRM_PRM          --ʵ���±�����
            --,WTN_QTY                   --�������ͳɹ�����
            --,AGG_CAL_TIMES             --�ۼƲ������
            --,AGG_CONT_TIMES            --�ۼƽӴ�����
            )
  SELECT  V_DATE_DAY                       AS CAL_DAY_ID,
         TT.CALL_YEAR_MONTH             AS SCHL_CALL_MON,
         TT.OB_COM_NAME                 AS ACTV_ID,
         TT.BATCH_NAME                  AS BAT_CODE,
         TT.COM_TYPE                    AS COM_TYP,
         TT.PRJ_ID                      AS BAT_PRJT,
         TT.COMPANY_ID                  AS COMP_ID,
         TT.BELONGCITY                  AS CITY_ID,
         TT.ORG_ID                      AS ORG_TYP,
         TT.CALL_TIMES                  AS CAL_TIMES,
         TT.PRJT_MGR_ID                    AS PRJT_MGR_ID,
         TT.TEM_LEAD_ID                    AS TEM_LEAD_ID,
         TT.USER_ID                     AS USER_ID,
         COUNT(DISTINCT CASE WHEN  TT.STATUS_ID ='7'AND TT.TYPE_ID='5' THEN  TT.APPNO ELSE NULL END ) AS OLINE_SMIT_QTY,--�����ύ����
         SUM(CASE WHEN TT.STATUS_ID ='7'AND TT.TYPE_ID='5' THEN
                    (CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                          WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                          WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                          ELSE TT.TOTAL_FEE END)
                ELSE 0 END)             AS OLINE_SMIT_PRM,--�����ύ����
         COUNT(DISTINCT CASE WHEN TT.STATUS_ID ='12'AND TT.TYPE_ID='7' THEN  TT.APPNO ELSE NULL END ) AS OLINE_TRAN_QTY,--���ϳɽ�����
         SUM(CASE WHEN TT.STATUS_ID ='12'AND TT.TYPE_ID='7' THEN
                    (CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                          WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                          WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                          ELSE TT.TOTAL_FEE END
                          )
                ELSE 0 END)              AS OLINE_TRAN_PRM --���ϳɽ�����

FROM ( SELECT DISTINCT
         T3.CALL_YEAR_MONTH ,
         T2.OB_COM_NAME,
         T3.BATCH_NAME,
         T3.COM_TYPE ,
         T2.PRJ_ID ,
         T2.COMPANY_ID,
         T3.BELONGCITY,
         T6.ORG_ID,
         T3.CALL_TIMES,
         T6.ORG_ID AS PRJT_MGR_ID,
         T6.ORG_ID AS TEM_LEAD_ID,
         T1.USER_ID ,
         T1.STATUS_ID,
         T1.TYPE_ID,
         T5.PAY_TYP,
         T4.APPNO,
         T4.TOTAL_FEE

        FROM (    SELECT A.ORG_ID,A.USER_ID,A.STATUS_ID,A.TYPE_ID,A.OB_COM_ID,A.BATCH_ID,A.TASK_ID,A.POLICY_ID
                    FROM TB_TASK A
                     WHERE A.STATUS_ID IN ('7','12')
                      AND  A.TYPE_ID IN ('5','7')
                UNION ALL
                   SELECT B.ORG_ID,B.USER_ID,B.STATUS_ID,B.TYPE_ID,B.OB_COM_ID,B.BATCH_ID,B.TASK_ID,B.POLICY_ID
                     FROM  TB_TASK_HISTORY B
                      WHERE B.STATUS_ID IN ('7','12')
                      AND  B.TYPE_ID IN ('5','7')
              ) T1,
      TB_OB_COM      T2,
      TB_SALE_BATCH  T3,
      C_USER         T6,
      TB_APPLICATION    T4,--Ͷ����������Ϣ��
      TB_APP_PRD_INFO   T5--Ͷ������Ʒ��
 WHERE T1.OB_COM_ID=T2.OB_COM_ID
   AND T1.BATCH_ID=T3.BATCH_ID
   AND T1.USER_ID=T6.USERID
   --AND T1.ORG_ID=T6.ORG_ID
   AND T1.TASK_ID=T4.TASK_ID
   AND T1.POLICY_ID=T4.APPNO--Ͷ����ID
   AND T4.APPLICATION_ID=T5.APPLICATION_ID
   AND T3.CALL_YEAR_MONTH<=V_BEGIN_DATE
   AND T3.CALL_YEAR_MONTH>=V_END_DATE
  )TT

   GROUP BY
         V_DATE_DAY
         ,TT.CALL_YEAR_MONTH
         ,TT.OB_COM_NAME
         ,TT.BATCH_NAME
         ,TT.COM_TYPE
         ,TT.PRJ_ID
         ,TT.COMPANY_ID
         ,TT.BELONGCITY
         ,TT.ORG_ID
         ,TT.CALL_TIMES
         ,TT.PRJT_MGR_ID
         ,TT.TEM_LEAD_ID
         ,TT.USER_ID
       ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

             -------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�������ڿۿ�ɹ�������������,�껯�±���ʵ���±� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
  INSERT /*+ APPEND*/INTO TEMP_CMP_RPT_DAY
         (  CAL_DAY_ID                --ͳ������
            ,SCHL_CALL_MON             --�ƻ���������
            ,ACTV_ID                   --�ID
            ,BAT_CODE                  --���δ���
            ,COM_TYP                   --��������
            ,BAT_PRJT                  --������Ŀ
            ,COMP_ID                   --�ֹ�˾ID
            ,CITY_ID                   --����
            ,ORG_TYP                   --��������
            ,CAL_TIMES                     --�������ID
            ,PRJT_MGR_ID               --��Ŀ����ID
            ,TEM_LEAD_ID               --�Ŷӳ�ID
            ,USER_ID                   --��ϯID
            --,LIST_TNO                  --��������
            --,FST_CAL_LIST_QTY          --�ײ�������
            --,CAL_COMP_LIST_QTY         --�������������
            --,CONNT_LIST_QTY            --��ͨ������
            --,CONT_LIST_QTY             --�Ӵ�������
           --,CAL_COMP_CONT_LIST_QTY    --������ɽӴ�������
            --,SURP_TRK_LIST_QTY         --ʣ�����������
            --,OLINE_SMIT_QTY            --�����ύ����
            --,OLINE_SMIT_PRM            --�����ύ����
            --,OLINE_TRAN_QTY            --���ϳɽ�����
            --,OLINE_TRAN_PRM            --���ϳɽ�����
            ,FST_CHARGBK_SUCC_QTY      --���ڿۿ�ɹ�����
            ,FST_CHARGBK_SUCC_PRM      --���ڿۿ�ɹ�����
            ,ANNUL_FST_PRM_PRM         --�껯�±�����
            ,ACTL_FST_PRM_PRM          --ʵ���±�����
            --,WTN_QTY                   --�������ͳɹ�����
            --,AGG_CAL_TIMES             --�ۼƲ������
            --,AGG_CONT_TIMES            --�ۼƽӴ�����
            )
    SELECT V_DATE_DAY AS CAL_DAY_ID,
           T2.CALL_YEAR_MONTH             AS SCHL_CALL_MON, --�ƻ���������
           T4.OB_COM_NAME                 AS ACTV_ID,--�����
           T2.BATCH_NAME                    AS BAT_CODE,   ---����ID
           T2.COM_TYPE                    AS COM_TYP,--�������ࣨ�¶������������н飩
           T4.PRJ_ID                      AS BAT_PRJT,--������Ŀ
           T4.COMPANY_ID                  AS COMP_ID,--�ֹ�˾
           T2.BELONGCITY                  AS CITY_ID,--��������
           T5.ORG_ID                      AS ORG_TYP,--��������
           T2.CALL_TIMES                          AS CAL_TIMES,--�������ID
           T5.ORG_ID                         AS PRJT_MGR_ID,--��Ŀ����
           T5.ORG_ID                         AS TEM_LEAD_ID,--�Ŷӳ�ID
           T3.USER_ID                     AS USER_ID, --��ϯ����
           COUNT(DISTINCT CASE WHEN Z.PCODE ='2'THEN Z.POLICYNO ELSE NULL END)    AS  FST_CHARGBK_SUCC_QTY,--�ۿ��
           SUM(NVL((CASE
                       WHEN Z.PAYCODE = '10' AND Z.PCODE ='2'THEN
                        T1.NPAYLEN * T1.PIECES * 12
                       WHEN Z.PAYCODE = '11' AND Z.PCODE ='2'THEN
                        T1.NPAYLEN * T1.PIECES * 4
                       WHEN Z.PAYCODE = '12' AND Z.PCODE ='2'THEN
                        T1.NPAYLEN * T1.PIECES * 2
                       WHEN Z.PAYCODE = '13' AND Z.PCODE ='2'THEN
                        T1.NPAYLEN * T1.PIECES * 1
                       ELSE
                        0
                   END),
                   0))               AS FST_CHARGBK_SUCC_PRM,--���ڿۿ�ɹ�����
                SUM(NVL((CASE
             WHEN Z.PCODE = '2' AND
                  Z.YEARNO = 1 AND
                  Z.PAYCODE = '10' THEN
              T1.NPAYLEN * T1.PIECES * 12
             WHEN Z.PCODE = '2' AND
                  PAYCODE = '11' THEN
              T1.NPAYLEN * T1.PIECES * 4
             WHEN Z.PCODE = '2' AND
                  Z.PAYCODE = '12' THEN
              T1.NPAYLEN * T1.PIECES * 2
             WHEN Z.PCODE = '2' AND
                  Z.PAYCODE = '13' THEN
             T1.NPAYLEN * T1.PIECES * 1
             ELSE
              0 END), 0)) +
               SUM(NVL((CASE
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '10' THEN
                  T1.NPAYLEN * T1.PIECES * -12
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '11' THEN
                  T1.NPAYLEN * T1.PIECES * -4
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '12' THEN
                  T1.NPAYLEN * T1.PIECES * -2
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '13' THEN
                  T1.NPAYLEN * T1.PIECES * -1
                 ELSE
                  0 END),0)) AS NNUL_FST_PRM_PRM,         --�껯�±�����
                  SUM( NVL((CASE WHEN Z.PCODE = '2' AND Z.YEARNO = 1
                     THEN Z.AMOUNT
                     ELSE 0
                     END),0)) + SUM(DISTINCT NVL(
                (CASE WHEN Z.PCODE = '8' AND Z.YEARNO = 1
                        THEN Z.AMOUNT
                        ELSE 0
                        END),0)) + SUM(DISTINCT NVL(
                (CASE WHEN Z.PCODE NOT IN ('8', '2') AND Z.YEARNO = 1
                      THEN Z.AMOUNT               --�޸Ľ�תȡֵ����
                      ELSE 0
                      END),0))  AS ACTL_FST_PRM_PRM          --ʵ���±�����
      FROM PREREC  Z, --����ʵ�ձ�
           RISKCON T1,--���˱�����
           TB_SALE_BATCH   T2,
           TB_TASK         T3,
           TB_OB_COM       T4,
           C_USER          T5
     WHERE Z.POLICYNO = T1.POLICYNO
       AND Z.CLASSCODE = T1.CLASSCODE
       AND T1.APPNO=T3.POLICY_ID
       AND T2.BATCH_ID=T3.BATCH_ID
       AND T4.OB_COM_ID=T3.OB_COM_ID
       AND T3.USER_ID=T5.USERID
      -- AND T3.ORG_ID=T5.ORG_ID
       AND Z.PCODE NOT IN ('Z', 'X', 'Y', '6', 'M')
       AND Z.SETCODE <> '9'
       AND T1.SALEATTR IN ('61', '62', '63', '64')--���������������ܹ�˾���ֹ�˾
       AND Z.YEARNO = 1--�����
       AND Z.PCODE IN('2','8')--�շ�\�˷�
       --AND Z.DEPTCODE IS NOT NULL
      -- AND Z.PAYDATE =V_DATE_DAY
       AND T2.CALL_YEAR_MONTH<=V_BEGIN_DATE
       AND T2.CALL_YEAR_MONTH>=V_END_DATE
       GROUP BY
           V_DATE_DAY
          ,T2.CALL_YEAR_MONTH
          ,T4.OB_COM_NAME
          ,T2.BATCH_NAME
          ,T2.COM_TYPE
          ,T4.PRJ_ID
          ,T4.COMPANY_ID
          ,T2.BELONGCITY
          ,T5.ORG_ID
          ,T2.CALL_TIMES
          ,T5.ORG_ID
          ,T5.ORG_ID
          ,T3.USER_ID
         ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;


   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�������ͳɹ��� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
  INSERT /*+ APPEND*/INTO TEMP_CMP_RPT_DAY
         (  CAL_DAY_ID                --ͳ������
            ,SCHL_CALL_MON             --�ƻ���������
            ,ACTV_ID                   --�ID
            ,BAT_CODE                  --���δ���
            ,COM_TYP                   --��������
            ,BAT_PRJT                  --������Ŀ
            ,COMP_ID                   --�ֹ�˾ID
            ,CITY_ID                   --����
            ,ORG_TYP                   --��������
            ,CAL_TIMES                     --�������ID
            ,PRJT_MGR_ID               --��Ŀ����ID
            ,TEM_LEAD_ID               --�Ŷӳ�ID
            ,USER_ID                   --��ϯID
            --,LIST_TNO                  --��������
            --,FST_CAL_LIST_QTY          --�ײ�������
            --,CAL_COMP_LIST_QTY         --�������������
            --,CONNT_LIST_QTY            --��ͨ������
            --,CONT_LIST_QTY             --�Ӵ�������
           -- ,CAL_COMP_CONT_LIST_QTY    --������ɽӴ�������
            --,SURP_TRK_LIST_QTY         --ʣ�����������
            --,OLINE_SMIT_QTY            --�����ύ����
            --,OLINE_SMIT_PRM            --�����ύ����
            --,OLINE_TRAN_QTY            --���ϳɽ�����
            --,OLINE_TRAN_PRM            --���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY      --���ڿۿ�ɹ�����
            --,FST_CHARGBK_SUCC_PRM      --���ڿۿ�ɹ�����
           --,ANNUL_FST_PRM_PRM         --�껯�±�����
            --,ACTL_FST_PRM_PRM          --ʵ���±�����
            ,WTN_QTY                   --�������ͳɹ�����
            --,AGG_CAL_TIMES             --�ۼƲ������
            --,AGG_CONT_TIMES            --�ۼƽӴ�����
            )
      SELECT V_DATE_DAY AS CAL_DAY_ID,
             T3.CALL_YEAR_MONTH             AS SCHL_CALL_MON,--�ƻ���������
             T5.OB_COM_NAME                 AS ACTV_ID,
             T3.BATCH_NAME                    AS BAT_CODE,   ---����ID
             T3.COM_TYPE                    AS COM_TYP,--�������ࣨ�¶������������н飩
             T5.PRJ_ID                      AS BAT_PRJT,--������Ŀ
             T5.COMPANY_ID                  AS COMP_ID,--�ֹ�˾
             T3.BELONGCITY                  AS CITY_ID,--��������
             T6.ORG_ID                      AS ORG_TYP,--��������
             T3.CALL_TIMES               AS CAL_TIMES,--�������ID
             T6.ORG_ID                          AS PRJT_MGR_ID,--��Ŀ����
             T6.ORG_ID                           AS TEM_LEAD_ID,--�Ŷӳ�ID
             T4.USER_ID                     AS USER_ID, --��ϯ����
             COUNT(DISTINCT T2.APPNO)       AS WTN_QTY                   --�������ͳɹ�����
        FROM POLICY_SEND T1, --������ִ��
             RISKCON     T2, --RISKCON��
             TB_SALE_BATCH   T3,
             TB_TASK         T4,
             TB_OB_COM       T5,
             C_USER          T6
       WHERE T2.APPNO=T4.POLICY_ID
         AND T3.BATCH_ID=T4.BATCH_ID
         AND T5.OB_COM_ID=T4.OB_COM_ID
         AND T1.POLICYNO = T2.POLICYNO
         AND T4.USER_ID=T6.USERID
         --AND T4.ORG_ID=T6.ORG_ID
         --AND T2.DEPTCODE IS NOT NULL
         AND T2.SALEATTR IN ('61','62','63','64')--���������������ܹ�˾���ֹ�˾
         AND T1.SENDDATE IS NOT NULL
        -- AND T1.SENDDATE =V_DATE_DAY--��ִ����
            AND T3.CALL_YEAR_MONTH<=V_BEGIN_DATE
            AND T3.CALL_YEAR_MONTH>=V_END_DATE
        GROUP BY
             V_DATE_DAY
              ,T3.CALL_YEAR_MONTH
              ,T5.OB_COM_NAME
              ,T3.BATCH_NAME
              ,T3.COM_TYPE
              ,T5.PRJ_ID
              ,T5.COMPANY_ID
              ,T3.BELONGCITY
              ,T6.ORG_ID
              ,T3.CALL_TIMES
              ,T6.ORG_ID
              ,T6.ORG_ID
              ,T4.USER_ID
              ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;


   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
    --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�����ۼƲ������ �ۼƽӴ����� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
  INSERT /*+ APPEND*/INTO TEMP_CMP_RPT_DAY
         (  CAL_DAY_ID                --ͳ������
            ,SCHL_CALL_MON             --�ƻ���������
            ,ACTV_ID                   --�ID
            ,BAT_CODE                  --���δ���
            ,COM_TYP                   --��������
            ,BAT_PRJT                  --������Ŀ
            ,COMP_ID                   --�ֹ�˾ID
            ,CITY_ID                   --����
            ,ORG_TYP                   --��������
            ,CAL_TIMES                     --�������ID
            ,PRJT_MGR_ID               --��Ŀ����ID
            ,TEM_LEAD_ID               --�Ŷӳ�ID
            ,USER_ID                   --��ϯID
            --,LIST_TNO                  --��������
            --,FST_CAL_LIST_QTY          --�ײ�������
            --,CAL_COMP_LIST_QTY         --�������������
            --,CONNT_LIST_QTY            --��ͨ������
            --,CONT_LIST_QTY             --�Ӵ�������
           -- ,CAL_COMP_CONT_LIST_QTY    --������ɽӴ�������
            --,SURP_TRK_LIST_QTY         --ʣ�����������
            --,OLINE_SMIT_QTY            --�����ύ����
            --,OLINE_SMIT_PRM            --�����ύ����
            --,OLINE_TRAN_QTY            --���ϳɽ�����
            --,OLINE_TRAN_PRM            --���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY      --���ڿۿ�ɹ�����
            --,FST_CHARGBK_SUCC_PRM      --���ڿۿ�ɹ�����
           --,ANNUL_FST_PRM_PRM         --�껯�±�����
            --,ACTL_FST_PRM_PRM          --ʵ���±�����
            --,WTN_QTY                   --�������ͳɹ�����
            ,AGG_CAL_TIMES             --�ۼƲ������
            ,AGG_CONT_TIMES            --�ۼƽӴ�����
            )
       SELECT  V_DATE_DAY AS CAL_DAY_ID,
               T2.CALL_YEAR_MONTH             AS SCHL_CALL_MON,--���(�ƻ���������)
               T4.OB_COM_NAME                 AS ACTV_ID,--�ID
               T2.BATCH_NAME                    AS BAT_CODE,   ---����ID
               T2.COM_TYPE                    AS COM_TYP,--�������ࣨ�¶������������н飩
               T4.PRJ_ID                      AS BAT_PRJT,--������Ŀ
               T4.COMPANY_ID                  AS COMP_ID,--�ֹ�˾
               T2.BELONGCITY                  AS CITY_ID,--��������
               T5.ORG_ID                      AS ORG_TYP,--��������
               T2.CALL_TIMES                           AS CAL_TIMES,--�������ID
               T5.ORG_ID                           AS PRJT_MGR_ID,--��Ŀ����
               T5.ORG_ID                          AS TEM_LEAD_ID,--�Ŷӳ�ID
               T3.USER_ID                     AS USER_ID, --��ϯ����
               COUNT(DISTINCT T1.HISTORY_ID)              AS AGG_CAL_TIMES,--�ۼƲ������
               COUNT(CASE WHEN T1.IS_CONTACT='1' THEN T1.HISTORY_ID ELSE NULL END ) AS AGG_CONT_TIMES--�ۼƽӴ�����
          FROM TB_SALE_HISTORY T1,
               TB_SALE_BATCH   T2,
               TB_TASK         T3,
               TB_OB_COM       T4,
               C_USER          T5
         WHERE T1.TASK_ID=T3.TASK_ID
           AND T2.BATCH_ID=T3.BATCH_ID
           AND T4.OB_COM_ID=T1.OBCOM_ID
           AND T3.USER_ID=T5.USERID
           --AND T3.ORG_ID=T5.ORG_ID
           AND T1.FIRST_RESULT IS NOT NULL--һ�����������Ϊ��
          -- AND T1.CALLSTART_TIME IS NOT NULL
          -- AND T1.CREATE_HISTORY_DATE =V_DATE_DAY
             AND T2.CALL_YEAR_MONTH<=V_BEGIN_DATE
             AND T2.CALL_YEAR_MONTH>=V_END_DATE
        GROUP BY
                V_DATE_DAY
               ,T2.CALL_YEAR_MONTH
               ,T4.OB_COM_NAME
               ,T2.BATCH_NAME
               ,T2.COM_TYPE
               ,T4.PRJ_ID
               ,T4.COMPANY_ID
               ,T2.BELONGCITY
               ,T5.ORG_ID
               ,T2.CALL_TIMES
               ,T5.ORG_ID
               ,T5.ORG_ID
               ,T3.USER_ID
                ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;


   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
     --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '����ͨ������_���� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
  INSERT /*+ APPEND*/INTO TEMP_CMP_RPT_DAY
         (  CAL_DAY_ID                --ͳ������
            ,SCHL_CALL_MON             --�ƻ���������
            ,ACTV_ID                   --�ID
            ,BAT_CODE                  --���δ���
            ,COM_TYP                   --��������
            ,BAT_PRJT                  --������Ŀ
            ,COMP_ID                   --�ֹ�˾ID
            ,CITY_ID                   --����
            ,ORG_TYP                   --��������
            ,CAL_TIMES                     --�������ID
            ,PRJT_MGR_ID               --��Ŀ����ID
            ,TEM_LEAD_ID               --�Ŷӳ�ID
            ,USER_ID                   --��ϯID
            --,LIST_TNO                  --��������
            --,FST_CAL_LIST_QTY          --�ײ�������
            --,CAL_COMP_LIST_QTY         --�������������
            --,CONNT_LIST_QTY            --��ͨ������
            --,CONT_LIST_QTY             --�Ӵ�������
           -- ,CAL_COMP_CONT_LIST_QTY    --������ɽӴ�������
            --,SURP_TRK_LIST_QTY         --ʣ�����������
            --,OLINE_SMIT_QTY            --�����ύ����
            --,OLINE_SMIT_PRM            --�����ύ����
            --,OLINE_TRAN_QTY            --���ϳɽ�����
            --,OLINE_TRAN_PRM            --���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY      --���ڿۿ�ɹ�����
            --,FST_CHARGBK_SUCC_PRM      --���ڿۿ�ɹ�����
           --,ANNUL_FST_PRM_PRM         --�껯�±�����
            --,ACTL_FST_PRM_PRM          --ʵ���±�����
            --,WTN_QTY                   --�������ͳɹ�����
            --,AGG_CAL_TIMES             --�ۼƲ������
            --,AGG_CONT_TIMES            --�ۼƽӴ�����
            ,CALL_LIST_CJ_QTY            --ͨ������_����
            )
   SELECT V_DATE_DAY                     AS CAL_DAY_ID,
         T2.CALL_YEAR_MONTH              AS SCHL_CALL_MON,--���(�ƻ���������)
         T4.OB_COM_NAME                  AS ACTV_ID, --�ID
         T2.BATCH_NAME                   AS BAT_CODE,   ---����ID
         T2.COM_TYPE                     AS COM_TYP,--�������ࣨ�¶������������н飩
         T4.PRJ_ID                       AS BAT_PRJT,--������Ŀ
         T4.COMPANY_ID                   AS COMP_ID,--�ֹ�˾
         T2.BELONGCITY                   AS CITY_ID,--��������
         T5.ORG_ID                       AS ORG_TYP,--����
         T2.CALL_TIMES                   AS CAL_TIMES,--�������ID
         T5.ORG_ID                       AS PRJT_MGR_ID,--��Ŀ����
         T5.ORG_ID                       AS TEM_LEAD_ID,--�Ŷӳ�ID
         T3.USER_ID                      AS USER_ID, --��ϯ����
         COUNT(DISTINCT T3.CUS_LIST_ID)  AS CALL_LIST_CJ_QTY--ͨ������_����
     FROM TB_SALE_BATCH   T2,
          (SELECT A.ORG_ID,A.USER_ID,A.STATUS_ID,A.TYPE_ID,A.OB_COM_ID,A.BATCH_ID,A.TASK_ID,A.CUS_LIST_ID
                    FROM TB_TASK A
                     WHERE A.FIRST_RESULT='2' OR A.SECOND_RESULT IN ('7','8','9','10')
                UNION ALL
                   SELECT B.ORG_ID,B.USER_ID,B.STATUS_ID,B.TYPE_ID,B.OB_COM_ID,B.BATCH_ID,B.TASK_ID,B.CUS_LIST_ID
                     FROM  TB_TASK_HISTORY B
                      WHERE B.FIRST_RESULT='2' OR B.SECOND_RESULT IN ('7','8','9','10')
              )           T3,
          TB_OB_COM       T4,
          C_USER          T5
         WHERE T2.BATCH_ID=T3.BATCH_ID
           AND T4.OB_COM_ID=T3.OB_COM_ID
           AND T3.USER_ID=T5.USERID
          -- AND T3.ORG_ID=T5.ORG_ID
           AND T2.CALL_YEAR_MONTH<=V_BEGIN_DATE
           AND T2.CALL_YEAR_MONTH>=V_END_DATE
           GROUP BY
               V_DATE_DAY
              ,T2.CALL_YEAR_MONTH
              ,T4.OB_COM_NAME
              ,T2.BATCH_NAME
              ,T2.COM_TYPE
              ,T4.PRJ_ID
              ,T4.COMPANY_ID
              ,T2.BELONGCITY
              ,T5.ORG_ID
              ,T2.CALL_TIMES
              ,T5.ORG_ID
              ,T5.ORG_ID
              ,T3.USER_ID
                ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;


   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
   -----------------------------------------------------------
    --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '��ʱ�����ݲ�����ʵ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
   --�����������׼����ʱ��
   INSERT /*+ APPEND */INTO TA_CMP_RPT_DAY
         (  CAL_DAY_ID                --ͳ������
            ,SCHL_CALL_MON             --�ƻ���������
            ,ACTV_ID                   --�ID
            ,BAT_CODE                  --���δ���
            ,COM_TYP                   --��������
            ,BAT_PRJT                  --������Ŀ
            ,COMP_ID                   --�ֹ�˾ID
            ,CITY_ID                   --����
            ,CTR_CODE                  --����
            ,SALES_PRJT                --������Ŀ
            ,TEM_CODE                  --�ŶӴ���
            ,CAL_TIMES                   --�������ID
            ,PRJT_MGR_ID               --��Ŀ����ID
            ,TEM_LEAD_ID               --�Ŷӳ�ID
            ,USER_ID                   --��ϯID
            ,LIST_TNO                  --��������
            ,FST_CAL_LIST_QTY          --�ײ�������
            ,CAL_COMP_LIST_QTY         --�������������
            ,CONNT_LIST_QTY            --��ͨ������
            ,CONT_LIST_QTY             --�Ӵ�������
            ,CAL_COMP_CONT_LIST_QTY    --������ɽӴ�������
            ,SURP_TRK_LIST_QTY         --ʣ�����������
            ,OLINE_SMIT_QTY            --�����ύ����
            ,OLINE_SMIT_PRM            --�����ύ����
            ,OLINE_TRAN_QTY            --���ϳɽ�����
            ,OLINE_TRAN_PRM            --���ϳɽ�����
            ,FST_CHARGBK_SUCC_QTY      --���ڿۿ�ɹ�����
            ,FST_CHARGBK_SUCC_PRM      --���ڿۿ�ɹ�����
            ,ANNUL_FST_PRM_PRM         --�껯�±�����
            ,ACTL_FST_PRM_PRM          --ʵ���±�����
            ,WTN_QTY                   --�������ͳɹ�����
            ,AGG_CAL_TIMES             --�ۼƲ������
            ,AGG_CONT_TIMES            --�ۼƽӴ�����
            ,CALL_LIST_CJ_QTY           --ͨ������_����
            )
   SELECT    T.CAL_DAY_ID                AS AL_DAY_ID --ͳ������
            ,T.SCHL_CALL_MON           AS SCHL_CALL_MON             --�ƻ���������
            ,T.ACTV_ID                 AS ACTV_ID                   --�ID
            ,T.BAT_CODE                AS BAT_CODE                  --���δ���
            ,T.COM_TYP                 AS COM_TYP                   --��������
            ,T.BAT_PRJT                AS BAT_PRJT                  --������Ŀ
            ,T.COMP_ID                 AS COMP_ID                   --�ֹ�˾ID
            ,NVL(T.CITY_ID,-1)                 AS CITY_ID                   --����
            ,Z.P_ORG_ID_LV2       AS  CTR_CODE--����
            ,Z.P_ORG_ID_LV3    AS  SALES_PRJT --��Ŀ
            ,Z.P_ORG_ID_LV4      AS  TEM_CODE                 --�ŶӴ���
            ,NVL(A.CALL_TIMES_NM,'-1') AS CAL_TIMES                     --�������ID
            ,Z.PRJT_MGR_ID            AS PRJT_MGR_ID               --��Ŀ����ID
            ,Z.TEM_LEAD_ID            AS TEM_LEAD_ID               --�Ŷӳ�ID
            ,NVL(T.USER_ID,'-1')                 AS USER_ID                   --��ϯID
            ,SUM(NVL(T.LIST_TNO,0))                AS LIST_TNO                  --��������
            ,SUM(NVL(T.FST_CAL_LIST_QTY,0))        AS FST_CAL_LIST_QTY          --�ײ�������
            ,SUM(NVL(T.CAL_COMP_LIST_QTY,0))       AS CAL_COMP_LIST_QTY         --�������������
            ,SUM(NVL(T.CONNT_LIST_QTY,0))          AS CONNT_LIST_QTY            --��ͨ������
            ,SUM(NVL(T.CONT_LIST_QTY,0))         AS CONT_LIST_QTY             --�Ӵ�������
            ,SUM(NVL(T.CAL_COMP_CONT_LIST_QTY,0))  AS CAL_COMP_CONT_LIST_QTY    --������ɽӴ�������
            ,SUM(NVL(T.SURP_TRK_LIST_QTY,0))       AS SURP_TRK_LIST_QTY         --ʣ�����������
            ,SUM(NVL(T.OLINE_SMIT_QTY,0))         AS OLINE_SMIT_QTY            --�����ύ����
            ,SUM(NVL(T.OLINE_SMIT_PRM,0))         AS OLINE_SMIT_PRM            --�����ύ����
            ,SUM(NVL(T.OLINE_TRAN_QTY,0))         AS OLINE_TRAN_QTY            --���ϳɽ�����
            ,SUM(NVL(T.OLINE_TRAN_PRM,0))         AS OLINE_TRAN_PRM            --���ϳɽ�����
            ,SUM(NVL(T.FST_CHARGBK_SUCC_QTY,0))    AS FST_CHARGBK_SUCC_QTY      --���ڿۿ�ɹ�����
            ,SUM(NVL(T.FST_CHARGBK_SUCC_PRM,0))    AS FST_CHARGBK_SUCC_PRM      --���ڿۿ�ɹ�����
            ,SUM(NVL(T.ANNUL_FST_PRM_PRM,0))       AS ANNUL_FST_PRM_PRM         --�껯�±�����
            ,SUM(NVL(T.ACTL_FST_PRM_PRM,0))       AS ACTL_FST_PRM_PRM          --ʵ���±�����
            ,SUM(NVL(T.WTN_QTY,0))                 AS WTN_QTY                   --�������ͳɹ�����
            ,SUM(NVL(T.AGG_CAL_TIMES,0))           AS AGG_CAL_TIMES             --�ۼƲ������
            ,SUM(NVL(T.AGG_CONT_TIMES,0))          AS AGG_CONT_TIMES            --�ۼƽӴ�����
            ,SUM(NVL(T.CALL_LIST_CJ_QTY,0))        AS  CALL_LIST_CJ_QTY         --ͨ������_����
       FROM TEMP_CMP_RPT_DAY T,
             ORGID_REF Z,
             D_CALL_TIMES A
       WHERE T.ORG_TYP=Z.ORG_ID
             AND T.CAL_TIMES=A.CALL_TIMES_NO
          GROUP BY
             T.CAL_DAY_ID
            ,T.SCHL_CALL_MON
            ,T.ACTV_ID
            ,T.BAT_CODE
            ,T.COM_TYP
            ,T.BAT_PRJT
            ,T.COMP_ID
            ,NVL(T.CITY_ID,-1)
            ,Z.P_ORG_ID_LV2
            ,Z.P_ORG_ID_LV3
            ,Z.P_ORG_ID_LV4
            ,NVL(A.CALL_TIMES_NM,'-1')
            ,Z.PRJT_MGR_ID
            ,Z.TEM_LEAD_ID
            ,NVL(T.USER_ID,'-1')
             ;
   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
   ERR_NUM                    := 0;
   ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;
END;
/

prompt
prompt Creating procedure SP_TA_SALES_HUMAN_RPT_DAY
prompt ============================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.SP_TA_SALES_HUMAN_RPT_DAY (
   I_DATE_DAY     IN       NUMBER
 --, I_END_DATE     IN       NUMBER
 , ERR_NUM        OUT      NUMBER
 , ERR_MSG        OUT      VARCHAR2
)
AS
   /**
     * ���������� ���������ձ�
     * ��������� I_DATE_DAY             ����ʱ��,�������Ϊ��,�׳��쳣
     * ��������� ERR_NUM                ���ִ���ʱ����ִ�д����
     * �������������ERR_MSG                ���ִ���ʱ���صĴ�����Ϣ
     * ��д��Ա�����ҷ�
     * �������ڣ�2012-06-28
     * ��˾���ƣ�
     **/
   V_DATE_DAY                    DATE := TO_DATE(I_DATE_DAY,'YYYYMMDD');             --����ʱ��
   V_DAY                         NUMBER := I_DATE_DAY;       --����ʱ��
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(I_DATE_DAY)||' 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=TO_DATE(TO_CHAR(I_DATE_DAY)||' 23:59:59','YYYY-MM-DD HH24:MI:SS');  --��������V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_CMP_RPT_DAY';--��ǰ��������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_HUMAN_RPT_DAY';--��ǰ��������
   V_REPORT_ID                   NUMBER :=0;
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF V_DATE_DAY IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'I_DATE_DAY IS NULL!');
   END IF;
/* IF V_END_DAY IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'I_END_DATE IS NULL!');
   END IF;*/

   --�����ʱ������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_SALES_HUMAN_RPT_DAY';
     --֧�ֶ�����������
   DELETE FROM  TA_SALES_HUMAN_RPT_DAY T
          WHERE T.CAL_DAY_ID=V_DATE_DAY;
          COMMIT;
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '������������ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
   --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_HUMAN_RPT_DAY
     (      CAL_DAY_ID
            ,ACTV_ID
            ,BAT_CODE
            ,COM_TYP
            ,BAT_PRJT
            ,COMP_ID
            ,CITY_ID
            ,ORG_TYP
            ,WP_ID
            ,PRJT_MGR_ID
            ,TEM_LEAD_ID
            ,ON_LINE_HUMAN
            )
     WITH V_TASK_H AS(
    SELECT
     -1                  AS HISTORY_ID
    ,T1.TASK_ID              AS TASK_ID
    ,T1.CREATE_TIME          AS CREATE_TIME
    ,T1.CHANGE_TIME          AS CHANGE_TIME
    ,T1.FIRST_RESULT         AS FIRST_RESULT
    ,T1.SECOND_RESULT        AS SECOND_RESULT
    ,T1.USER_ID              AS USER_ID
    ,T1.ORG_ID               AS ORG_ID
    ,T1.STATUS_ID            AS STATUS_ID
    ,T1.TYPE_ID              AS TYPE_ID
    ,T1.POLICY_ID            AS POLICY_ID
    ,T1.OB_COM_ID            AS OB_COM_ID
    ,T1.BATCH_ID             AS BATCH_ID
    ,T1.CUS_LIST_ID          AS CUS_LIST_ID
    ,T1.CHANGE_TIME          AS CREATE_HISTORY_DATE
    FROM TB_TASK T1
    WHERE T1.CHANGE_TIME >= V_BEG_DATE
    AND T1.CHANGE_TIME <= V_END_DATE
    AND T1.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
    AND T1.TYPE_ID<>'4'--�������� �ײ�
    UNION ALL
     SELECT
     T2.HISTORY_ID           AS HISTORY_ID
    ,T2.TASK_ID              AS TASK_ID
    ,T2.CREATE_TIME          AS CREATE_TIME
    ,T2.CHANGE_TIME          AS CHANGE_TIME
    ,T2.FIRST_RESULT         AS FIRST_RESULT
    ,T2.SECOND_RESULT        AS SECOND_RESULT
    ,T2.USER_ID              AS USER_ID
    ,T2.ORG_ID               AS ORG_ID
    ,T2.STATUS_ID            AS STATUS_ID
    ,T2.TYPE_ID              AS TYPE_ID
    ,T2.POLICY_ID            AS POLICY_ID
    ,T2.OB_COM_ID            AS OB_COM_ID
    ,T2.BATCH_ID             AS BATCH_ID
    ,T2.CUS_LIST_ID          AS CUS_LIST_ID
    ,T2.CHANGE_TIME  AS CREATE_HISTORY_DATE
    FROM TB_TASK_HISTORY T2
    WHERE T2.CREATE_HISTORY_DATE >= V_BEG_DATE
    AND T2.CREATE_HISTORY_DATE <= V_END_DATE
    AND T2.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
       AND T2.TYPE_ID<>'4'--�������� �ײ�
    )
 SELECT V_DATE_DAY            AS CAL_DAY_ID,
        OB_COM_NAME           AS ACTV_ID,
        BATCH_NAME            AS BAT_CODE,
        COM_TYPE              AS COM_TYP,
        PRJ_ID                AS BAT_PRJT,
        COMPANY_ID            AS COMP_ID,
        NVL(BELONGCITY,'-1')            AS CITY_ID,
        NVL(ORG_ID,'-1')               AS ORG_TYP,
        NVL(WORKPLACE_ID,'-1')          AS WP_ID,
        PRJT_MGR_ID           AS PRJT_MGR_ID,
        PRJT_MGR_ID           AS PRJT_MGR_ID,
        COUNT(DISTINCT USER_ID)/(SUM(COUNT(DISTINCT USER_ID)) OVER (PARTITION BY USER_ID ORDER BY USER_ID )) AS ON_LINE_HUMAN
    FROM ( SELECT
                 --'-1' AS PAYMODE,  --���ѷ�ʽ
                 T4.OB_COM_NAME, --�ID
                 T2.BATCH_NAME, --���α���
                 T2.COM_TYPE,--�������ࣨ�¶������������н飩
                 T4.PRJ_ID,--������Ŀ
                 T4.COMPANY_ID,--�ֹ�˾
                 T1.ORG_ID,--��֯����
                 T2.BELONGCITY,
                 NVL(T5.WORKPLACE_ID, '-1') AS WORKPLACE_ID ,--ְ�����
                 T1.ORG_ID AS PRJT_MGR_ID,--��Ŀ������
                 T1.ORG_ID AS TEM_LEAD_ID,  ---�Ŷӳ����
                 NVL(T1.USER_ID,'-1') AS USER_ID --��ϯ����
                  FROM V_TASK_H T1
                 --INNER JOIN  TB_TASK T3  ON T1.TASK_ID=T3.TASK_ID
                 INNER JOIN  TB_SALE_BATCH  T2 ON T1.BATCH_ID=T2.BATCH_ID
                 INNER JOIN  TB_OB_COM  T4 ON T4.OB_COM_ID=T1.OB_COM_ID
                 INNER JOIN  C_USER  T5 ON  T5.USERID=T1.USER_ID  AND T5.ORG_ID=T1.ORG_ID
           WHERE
             T1.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
             AND T1.TYPE_ID<>'4'--�������� �ײ�
             AND EXISTS
                (SELECT NULL
                  FROM TB_TASK_HISTORY TT
                       WHERE
                            TT.TASK_ID=T1.TASK_ID
                            AND TT.STATUS_ID='6'
                            AND TT.TYPE_ID='4'
                            AND TO_CHAR(TT.CREATE_HISTORY_DATE,'YYYYMMDD')=TO_CHAR(T1.CREATE_HISTORY_DATE,'YYYYMMDD')--���ײ�״̬�ı�ʱ����ύ����С��ʱ����ͬһ��
                            )
                 UNION ALL
            SELECT
               -- '-1' AS PAY_MODE,
                 T4.OB_COM_NAME, --�����
                 T2.BATCH_NAME,   ---���α���
                 T2.COM_TYPE,--�������ࣨ�¶������������н飩
                 T4.PRJ_ID,--������Ŀ
                 T4.COMPANY_ID,--�ֹ�˾
                 T1.ORG_ID,--����
                 T2.BELONGCITY,
                 NVL(T5.WORKPLACE_ID, '-1') AS WORKPLACE_ID,--ְ��ID
                 T5.ORG_ID AS PRJT_MGR_ID,--��Ŀ������
                 T5.ORG_ID AS TEM_LEAD_ID,  ---�Ŷӳ����
                 T1.USER_ID --��ϯ����

            FROM V_TASK_H T1
                 --INNER JOIN TB_TASK T3  ON T1.TASK_ID=T3.TASK_ID
                 INNER JOIN  TB_SALE_BATCH   T2 ON T2.BATCH_ID=T1.BATCH_ID
                 INNER JOIN TB_OB_COM  T4 ON T4.OB_COM_ID=T1.OB_COM_ID
                 INNER JOIN C_USER T5 ON  T1.USER_ID=T5.USERID AND T1.ORG_ID=T5.ORG_ID

           WHERE 1=1
             AND T1.TYPE_ID='2' --�������� 2��������������
             AND T1.TYPE_ID<>'4'--��ǰ�������Ͳ�Ϊ�ײ�����
             )
       GROUP BY
        OB_COM_NAME,
        BATCH_NAME,
        COM_TYPE,
        PRJ_ID,
        COMPANY_ID,
        NVL(ORG_ID,'-1') ,
        NVL(BELONGCITY,'-1') ,
        NVL(WORKPLACE_ID,'-1'),
        PRJT_MGR_ID,
        PRJT_MGR_ID,
        USER_ID;
 V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
  --------------------------------------
    --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '��ʱ�����ݲ�����ʵ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
   --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TA_SALES_HUMAN_RPT_DAY

         ( CAL_DAY_ID                --ͳ������
            ,ACTV_ID                   --�ID
            ,BAT_CODE                  --���δ���
            ,COM_TYP                   --��������
            ,BAT_PRJT                  --������Ŀ
            ,COMP_ID                   --�ֹ�˾ID
            ,CITY_ID                   --����
            ,CTR_CODE                  --����
            ,SALES_PRJT                --������Ŀ
            ,TEM_CODE                  --�ŶӴ���
            ,WP_ID                     --ְ��
            ,PRJT_MGR_ID               --��Ŀ����ID
            ,TEM_LEAD_ID               --�Ŷӳ�ID
            ,ON_LINE_HUMAN
            )
   SELECT    T.CAL_DAY_ID                AS AL_DAY_ID --ͳ������
            ,T.ACTV_ID                 AS ACTV_ID                   --�ID
            ,T.BAT_CODE                AS BAT_CODE                  --���δ���
            ,T.COM_TYP                 AS COM_TYP                   --��������
            ,T.BAT_PRJT                AS BAT_PRJT                  --������Ŀ
            ,T.COMP_ID                 AS COMP_ID                   --�ֹ�˾ID
            ,T.CITY_ID                 AS CITY_ID                   --����
            ,Z.P_ORG_ID_LV2        AS  CTR_CODE
            ,Z.P_ORG_ID_LV3        AS  SALES_PRJT
            ,Z.P_ORG_ID_LV4      AS  TEM_CODE                 --�ŶӴ���
            ,NVL(T.WP_ID,'-1')              AS WP_ID
            ,Z.PRJT_MGR_ID           AS PRJT_MGR_ID               --��Ŀ����ID
            ,Z.TEM_LEAD_ID             AS TEM_LEAD_ID               --�Ŷӳ�ID
            ,SUM(NVL(T.ON_LINE_HUMAN,0))          AS AGG_CONT_TIMES            --��������
       FROM TEMP_SALES_HUMAN_RPT_DAY T,
             ORGID_REF Z
       WHERE T.ORG_TYP=Z.ORG_ID
          GROUP BY
             T.CAL_DAY_ID
            ,T.ACTV_ID
            ,T.BAT_CODE
            ,T.COM_TYP
            ,T.BAT_PRJT
            ,T.COMP_ID
            ,T.CITY_ID
            ,Z.P_ORG_ID_LV2
            ,Z.P_ORG_ID_LV3
            ,Z.P_ORG_ID_LV4
            ,NVL(T.WP_ID,'-1')
            ,Z.PRJT_MGR_ID
            ,Z.TEM_LEAD_ID
             ;
   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
   ERR_NUM                    := 0;
   ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;
END;
/

prompt
prompt Creating procedure PROC_DAILY_RPT_CALL
prompt ======================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_DAILY_RPT_CALL(I_DATE_DAY IN NUMBER
                                                --, I_END_DATE     IN       NUMBER
                                               ,
                                                ERR_NUM OUT NUMBER,
                                                ERR_MSG OUT VARCHAR2) AS
    /**
    * ���������� ���ô洢����
    * ��������� I_DATE_DAY             ����ʱ��,�������Ϊ��,�׳��쳣
    * ��������� ERR_NUM                ���ִ���ʱ����ִ�д����
    * �������������ERR_MSG             ���ִ���ʱ���صĴ�����Ϣ
    * ��д��Ա�����ҷ�
    * �������ڣ�2012-03-29
    * ��˾���ƣ�
    **/
    V_DATE_DAY NUMBER := I_DATE_DAY; --����ʱ��
    --V_END_DAY                     NUMBER := I_END_DATE;       --����ʱ��
    V_REPORT_ID  NUMBER := 0; --�������
    V_PROC_NAME  VARCHAR2(50) := 'PROC_DAILY_RPT_CALL'; --��ǰ��������
    V_STEP       NUMBER := 0; --ִ�в�����ų�ʼֵ
    V_STEP_NO    VARCHAR2(10); --ִ�в���
    V_STEP_DESC  VARCHAR2(200); --��������
    V_ROW_NUM    NUMBER; --SQLִ��Ӱ��ļ�¼��
    V_BEGIN_TIME DATE; --SQL��ʼִ�е�ʱ��
    V_END_TIME   DATE; --SQLִ�н���ʱ��
BEGIN
    --���ڲ����Ƿ�Ϊ���ж�
    IF V_DATE_DAY IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'I_DATE_DAY IS NULL!');
    END IF;
    /* IF V_END_DAY IS NULL
    THEN
       RAISE_APPLICATION_ERROR (-20001, 'I_END_DATE IS NULL!');
    END IF;*/
    --ɾ����־��һ��ǰ�ļ�¼
     IF  SUBSTR(TO_CHAR(TO_DATE(V_DATE_DAY,'YYYY-MM-DD'),'YYYYMMDD'),5,4) BETWEEN '0101' AND '0107'
       THEN
         DELETE FROM LOG_TRACE_STAT TT
           WHERE TO_CHAR(TO_DATE(TT.WORK_DATE,'YYYY-MM-DD'), 'YYYY')=TO_CHAR(ADD_MONTHS(TO_DATE(V_DATE_DAY,'YYYY-MM-DD'),-12), 'YYYY')
           ;
           COMMIT;
           END IF;
    --��¼��־��ʼ
    V_STEP       := V_STEP + 1;
    V_STEP_NO    := SF_CREATE_STEP(V_STEP);
    V_STEP_DESC  := '�ܵ�����';
    V_BEGIN_TIME := SYSDATE;
    SP_LOG_EXEC_BEF(V_PROC_NAME,
                    V_STEP_NO,
                    V_DATE_DAY,
                    V_STEP_DESC,
                    V_BEGIN_TIME,
                    V_REPORT_ID);
    --���ô洢����
    SP_ORGID_REF(V_DATE_DAY, ERR_NUM, ERR_MSG);--������Ա����֯�ܹ���Ϣ
    PROC_TA_SALES_RPT(V_DATE_DAY, ERR_NUM, ERR_MSG);
    SP_TA_SALES_HUMAN_RPT_DAY(V_DATE_DAY, ERR_NUM, ERR_MSG);
    SP_TA_CMP_RPT_DAY(V_DATE_DAY, ERR_NUM, ERR_MSG);
   
    --��¼��־����
    SP_LOG_EXEC_AFT(V_PROC_NAME,
                    V_STEP_NO,
                    V_ROW_NUM,
                    V_BEGIN_TIME);
    ERR_NUM := 0;
    ERR_MSG := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
    WHEN OTHERS THEN
        ERR_NUM    := SQLCODE;
        ERR_MSG    := TRIM(SQLERRM);
        V_END_TIME := SYSDATE;

        IF V_STEP_NO IS NULL THEN
            INSERT INTO LOG_TRACE_STAT
                (PROC_NAME
                ,STEP_NO
                ,BEGIN_TIME
                ,END_TIME
                ,WORK_DATE
                ,STEP_DESC
                ,ELAPSED
                ,REPORT_ID
                ,SQL_CODE
                ,SQL_ERRM)
            VALUES
                (V_PROC_NAME
                ,V_STEP_NO
                ,V_BEGIN_TIME
                ,V_END_TIME
                ,V_DATE_DAY
                ,V_STEP_DESC
                ,ROUND((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                ,V_REPORT_ID
                ,ERR_NUM
                ,ERR_MSG);
        ELSE
            UPDATE LOG_TRACE_STAT
               SET END_TIME = V_END_TIME
                  ,ELAPSED  = ROUND((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                  ,SQL_CODE = ERR_NUM
                  ,SQL_ERRM = ERR_MSG
             WHERE PROC_NAME = V_PROC_NAME
               AND STEP_NO = V_STEP_NO
               AND WORK_DATE = V_DATE_DAY
               AND BEGIN_TIME = V_BEGIN_TIME
               AND REPORT_ID = V_REPORT_ID;
        END IF;

        COMMIT;
END PROC_DAILY_RPT_CALL;
/

prompt
prompt Creating procedure PROC_DEL_CUST_LIST_RSLT
prompt ==========================================
prompt
create or replace procedure sxdxsj.proc_del_cust_list_rslt
(
 ERR_NUM           OUT    NUMBER,
 ERR_MSG           OUT    VARCHAR2
)
as
/*======================================================================================
    ��Ȩ��Ϣ����Ȩ����(c) 2012��neusoft
    �������ƣ�proc_del_cust_list_rslt
    ����˵����ɾ��cust_list_rslt�е���ʱ����30��ǰ������
    ���������
    ���������
             ERR_NUM      ִ�д������
             ERR_MSG      ������Ϣ

    ��    �ߣ���ٻ
    �������ڣ�2012-8-27
    �� �� �ţ�V1.0


    �޸���ʷ
    �汾    �޸�����            �޸���       �޸�˵��
    ---------------------------------------------------------------------------------------


  ========================================================================================*/
begin
	declare
	  v_delete number;--�ܹ�ɾ���ļ�¼��
		v_remark varchar2(1800):='';--��־�еı�ע��Ϣ
		
		cursor c_cursor is
		 select count(1) num,task_code id from cust_list_rslt  where sysdate-import_time>30 group by task_code;
	  row_cursor c_cursor%rowtype;
	begin
		open c_cursor;
		loop
			fetch c_cursor into row_cursor;
			exit when c_cursor %notfound;
			v_remark:=v_remark||nvl(row_cursor.id,'������task_id')||'��ɾ������Ϊ��'||row_cursor.num||'   ';

		end loop;
		--ɾ������30�������
		delete from cust_list_rslt where sysdate-import_time>30;
		--��ȡɾ������
		v_delete :=sql%rowcount;
		v_remark := v_remark||'��Ӱ��������'||v_delete;
		--д����־��
		insert into log_cust_list_rslt(task_id,remark,time,task_status,task_description) values
		(1000001,v_remark,sysdate,2,'ɾ��30��ǰ������');
		commit;

   close c_cursor;
	  ERR_NUM       := 0;
    ERR_MSG       := 'NORMAL,SUCCESSFUL COMPLETION';
   
  --�쳣����
  exception
    when others then
			rollback;
			--д����־��
     insert into log_cust_list_rslt(task_id,remark,time,task_status,task_description) values
		(1000001,v_remark,sysdate,9,'ɾ��30��ǰ������');
		  ERR_NUM:=sqlcode;
      ERR_MSG       :=sqlerrm;
      
      commit;
		end;
	end proc_del_cust_list_rslt;
/

prompt
prompt Creating procedure PROC_DEL_T_PREINS_COPY
prompt =========================================
prompt
create or replace procedure sxdxsj.proc_del_t_preins_copy is
/*
  ******************************************************
  *  �洢������ ��proc_del_t_preins_copy
  *  ��������   ��2012-8-20
  *  ����       ��mengqian
  *  ģ��       ��
  *  ����       ��ɾ����ʱ��t_preins_copy
  */
begin

 delete t_preins_copy;
  commit;
exception
  when others then
     dbms_output.put_line('proc_del_t_preins_copy fails'|| sqlerrm(sqlcode));
    rollback;
end proc_del_t_preins_copy;
/

prompt
prompt Creating procedure PROC_EXP_CUST_LIST
prompt =====================================
prompt
create or replace procedure sxdxsj.proc_exp_cust_list
(
 ERR_NUM           OUT    NUMBER,
 ERR_MSG           OUT    VARCHAR2
)
as

  /*======================================================================================
    ��Ȩ��Ϣ����Ȩ����(c) 2012��neusoft
    �������ƣ�proc_exp_cust_list
    ����˵����������������������Ҫ�Ŀͻ�������Ϣ���뵽cust_list_rslt
    ���������
    ���������
             ERR_NUM      ִ�д������
             ERR_MSG      ������Ϣ

    ��    �ߣ���ٻ
    �������ڣ�2012-8-16
    �� �� �ţ�V2.0


    �޸���ʷ
    �汾    �޸�����            �޸���       �޸�˵��
    ---------------------------------------------------------------------------------------
            2012-8-31            ��ٻ        ��������ȷ������Ҫf_tasks�ֶ���task_statusΪ1

  ========================================================================================*/
begin
  declare
    v_sql           varchar2(18000);
    v_sql_condition varchar2(18000);--��������
    cursor c_cursor is
      select task_condition, id, task_description from f_tasks where task_status=1;
    row_cursor c_cursor%rowtype;

    v_insert number(20);--����ִ��ʱӰ����������
  begin
    open c_cursor;

    loop
      fetch c_cursor
        into row_cursor;
    --ȡ����������
      if row_cursor.task_condition is not null then
        v_sql_condition := 'and ' || row_cursor.task_condition;
      end if;
		
      exit when c_cursor %notfound;
      --��¼����ʼʱ��
      update f_tasks
         set begin_time =
             (select to_date(to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
                             'yyyy-mm-dd hh24:mi:ss')
                from dual)
       where id = row_cursor.id;

       --����������������task_condition����Ҫ�Ŀͻ�������Ϣ���뵽cust_list_rslt
      v_sql := '
insert into cust_list_rslt
(
CUSTOMER_NAME,
GENDER_CODE,
AGE,
BIRTHDAY,
CUSTOMER_ID,
JOB_NAME,
PHONE1,
FAMILY_PHONE,
OFFICE_PHONE,
COMPANY_ADDRESS,
MARITAL_STATUS,
BANK_NAME,
ACCOUNT_NO,
FAX,
CITY,
PROVINCE,
EMAIL,
INCOME,
EDUCATION_LEVEL,
TASK_CODE
)
  (select cus.customer_name   cname,
          cus.gender_code     gen,
          cus.age             age,
          cus.birthday        birthday,

          cus.customer_id     id,
          cus.job_name        jname,
          (select phone from customer_phone cp where cp.customer_id =cus.customer_id and cp.phone_type =3 and rownum <2)phone1,

          (select phone from customer_phone cp where cp.customer_id =cus.customer_id and cp.phone_type =1 and rownum <2)family_phone,
          (select phone from customer_phone cp where cp.customer_id =cus.customer_id and cp.phone_type =2 and rownum <2)office_phone,

          cus.company_address cadd,

          cus.marital_status  mstatus,
          bank.bank_name,

          bank.account_no,

          cus.fax             fax,
          cus.city            city,
          cus.province        province,

          cus.email           email,

          cus.income          income,
          cus.education_level elevel,

        ' || row_cursor.id || '
     from customer cus
     left join
       (select customer_id ,bank_name,account_no from (select customer_id, bank_name,account_no ,row_number()over (partition by customer_id order by account_no ) rn from bank_accounts ba_ac  ) where rn=1  )
       bank  on cus.customer_id = bank.customer_id
       where 1=1 ' || v_sql_condition || '
       )';

      execute immediate v_sql;
      
      --��ȡ��������
      v_insert := sql%rowcount;
			commit;
    --��������ɵ����񣬼�¼�����������ʱ���Ӱ������
      update f_tasks
         set success_number = v_insert,
             end_time      =
             (select to_date(to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
                             'yyyy-mm-dd hh24:mi:ss')
                from dual),
             task_status    = 2
       where id = row_cursor.id;
   --д����־log_cust_list_rslt
      insert into log_cust_list_rslt
        (task_id, time, task_description, task_status)
      values
        (row_cursor.id,
         (select to_date(to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
                         'yyyy-mm-dd hh24:mi:ss')
            from dual),
         row_cursor.task_description,
         2);
    --����customer��Ϣ�������ı�־�͵���ʱ��
      update customer
         set customer.export_flag = 'Y',
             customer.export_time =
             (select to_date(to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
                             'yyyy-mm-dd hh24:mi:ss')
                from dual)
       where customer_id in
             (select customer_id
                from cust_list_rslt
               where task_code = row_cursor.id);
      commit;
    end loop;
    close c_cursor;
    ERR_NUM       := 0;
  ERR_MSG       := 'NORMAL,SUCCESSFUL COMPLETION';
  --�쳣����
  exception
    when others then
      --���쳣д����־log_cust_list_rslt

      insert into log_cust_list_rslt
        (task_id, time, task_description, task_status)
      values
        (row_cursor.id,
         (select to_date(to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
                         'yyyy-mm-dd hh24:mi:ss')
            from dual),
         row_cursor.task_description,
         9);
          --�����쳣�����񣬼�¼�����������ʱ���Ӱ������
   update f_tasks
         set success_number = nvl(v_insert,0),
             end_time      =
             (select to_date(to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
                             'yyyy-mm-dd hh24:mi:ss')
                from dual),
             task_status    = 9
       where id = row_cursor.id;

      ERR_NUM:=sqlcode;
      ERR_MSG       :=sqlerrm;
      commit;
  end;
end proc_exp_cust_list ;
/

prompt
prompt Creating procedure PROC_EXP_DATA
prompt ================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_EXP_data
(
  i_task_id in number
  ,i_exp_type in number default 0
  ,i_clumn_list in varchar2
  ,o_dt out SYS_REFCURSOR
  ,o_updated_rows out number
) as
v_sql varchar2(8000);
v_condition varchar2(2000);
v_start_time date:=sysdate;
v_source_type_code number(3);
v_lastCondition varchar2(100);
v_preCondition varchar2(2000);
v_errcode   number;
v_errmsg    varchar2(100);
begin
o_updated_rows:=0;
  select nvl(regexp_replace(lower(trim(task_condition)),'^(and( )+)*',''),' 1=1')
  ,fun_find_source(upper(task_condition)) into v_condition,v_source_type_code
  from tasks where id=i_task_id;
  insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
VALUES('׼��������ȫ�����', '������ȫ�����', v_start_time,systimestamp, 0, i_task_id);
  --����Ĭ�Ϲ�������
  If I_Exp_Type=0 Then --ֻ����ϴ�ɹ��Ĳſ��Ե�������
  select substr(v_condition,instr(v_condition,'and rownum',1,1)) into v_lastCondition from dual;
  --dbms_output.put_line('v_lastCondition:'||v_lastCondition);
  select substr(v_condition,0,instr(v_condition,'and rownum',1,1)-1) into v_preCondition from dual;
  -- dbms_output.put_line('v_preCondition:'||v_preCondition);
    v_sql:=' from (with w_customer as(
  select cus.customer_id temp_customer_id from customer cus
  inner join d_branch_info d on cus.branch_code=d.branch_code
  inner join d_birthdate_month b on cus.BIRTHDATE_MONTH_DAY_CODE=b.BIRTHDATE_MONTH_DAY_CODE
  where (from_last_sale_time_code>2 or sale_status_code=0 and clear_status_code=3) and '||v_preCondition||'
)
--��ȡ�ͻ���Ϣ
select cus.customer_id,replace(customer_name,'' '','''') customer_name,0 id_type,to_char(birthday,''yyyy-mm-dd'') birthday,gender_code
,marital_status,death_critical_illness,fax,family_zip_code,company_zip_code
,family_address,company_address,contact_address,company,job_name,email,cus.tel_code
,zone_code,cus.govern_id,city,p.policy_no,province,p.remark||cus.note note,to_char(any_date,''yyyy-mm-dd'') any_date,other_info_1
,other_info_2,other_info_3,other_info_5,other_info_4,cus.d_donation_code is_accept_donation
,t.family_phone,t.office_phone,t.mobile_phone,t.charge_phone,t.other_phone,b.bank_code,b.bank_name,b.bank_account,p.class_name
from w_customer w inner join customer cus on w.temp_customer_id=cus.customer_id
left join
(
  --��ȡ������Ϣ
   select customer_id,policy_no,class_name,trim(class_code) class_code,charge_way,begin_date,rmk2 remark
  from(
    select t.*,f_catstring(t.rmk) over(partition by customer_id) rmk2
    from (
      select p.policy_holder_id customer_id,p.policy_no,p.class_name,p.class_code,p.charge_way,p.begin_date
      ,(''[''||trim(p.policy_no)||'';''||p.class_name||'';''||p.bank_name||'';''||trim(p.account_no)||'';''||p.charge_total_amount
      ||''Ԫ;{''||p.recognizee_holder_id||''}]'') rmk
      ,row_number()over (partition by p.policy_holder_id order by p.begin_date desc) rn
      from w_customer l inner join policy p on l.temp_customer_id=p.policy_holder_id

    ) t where rn<3
  )  where rn=1
) p on w.temp_customer_id=p.customer_id
inner join
(
  --��ȡ�绰��Ϣ
  select customer_id,
  max(decode(rn,1,phone,null)) family_phone,
  max(decode(rn,2,phone,null)) office_phone,
  max(decode(rn,3,phone,null)) mobile_phone,
  max(decode(rn,4,phone,null)) charge_phone,
  max(decode(rn,5,phone,null)) other_phone
  from
  (
    select r.customer_id,r.phone,row_number()over (partition by customer_id order by phone desc) rn
    from w_customer l inner join customer_phone r on l.temp_customer_id=r.customer_id
    where not exists (select 1 from filter_red_black where dx_filter=1 and status=1 and telephone=r.phone)
  )
  group by customer_id
) t on w.temp_customer_id=t.customer_id
left join
(
  --��ȡ������Ϣ
  select customer_id,bank_code,bank_name,bank_account from (
    select customer_id,bank_code,bank_name,account_no bank_account
    ,row_number() over (partition by customer_id order by account_no) rn
    from w_customer l inner join bank_accounts r
    on l.temp_customer_id=r.customer_id
  ) where rn=1
) b on w.temp_customer_id=b.customer_id
left join filter_class_code fcc on trim(p.class_code)=fcc.class_code and fcc.dx_filter=1 and fcc.status=1
 where fun_check_paycode(:source_type_code,p.charge_way,p.begin_date,:v_start_time)=1
 and fcc.class_code is null ) where 1=1 '||v_lastCondition||'';
--v_sql:='insert into temp_exp_rs('||regexp_replace(lower(trim(i_clumn_list)),'^( )+select( )+','')||')'||i_clumn_list||' from
v_sql:=i_clumn_list||v_sql;
dbms_output.put_line(v_sql);
open o_dt for v_sql using v_source_type_code,v_start_time;
  elsif I_Exp_Type=1 Then --ֻ���޵绰����ϴʧ�ܵ�,�Ҳ��ڱ�ȫ�еĿͻ��ſ��Ե�����ȫ
    v_sql:=' from (with w_customer as(
  select cus.customer_id temp_customer_id from customer cus
  inner join d_branch_info d on cus.branch_code=d.branch_code
  inner join d_birthdate_month b on cus.BIRTHDATE_MONTH_DAY_CODE=b.BIRTHDATE_MONTH_DAY_CODE
  where clear_status_code in(0,4) and operation_status_code<>1 and '||v_condition||'
  and not exists
  (select null from filter_red_black aa where aa.bq_filter=1 and aa.status=1 and aa.customer_id=cus.customer_id)
)
--��ȡ�ͻ���Ϣ
select cus.customer_id,replace(customer_name,'' '','''') customer_name,0 id_type,to_char(birthday,''yyyy-mm-dd'') birthday,gender_code
,marital_status,death_critical_illness,fax,family_zip_code,company_zip_code
,family_address,company_address,contact_address,company,job_name,email,cus.tel_code
,zone_code,cus.govern_id,city,p.policy_no,province,p.remark||cus.note note,to_char(any_date,''yyyy-mm-dd'') any_date,other_info_1
,other_info_2,other_info_3,other_info_5,other_info_4,cus.d_donation_code is_accept_donation
,null family_phone,null office_phone,null mobile_phone,null charge_phone,null other_phone,null bank_name,null bank_account,p.class_name
from w_customer w inner join customer cus on w.temp_customer_id=cus.customer_id
left join
(
  --��ȡ������Ϣ
   select customer_id,policy_no,class_name,class_code,charge_way,begin_date,rmk2 remark
  from(
    select t.*,f_catstring(t.rmk) over(partition by customer_id) rmk2
    from (
      select p.policy_holder_id customer_id,p.policy_no,p.class_name,p.class_code,p.charge_way,p.begin_date
      ,(''[''||trim(p.policy_no)||'';''||p.class_name||'';''||p.bank_name||'';''||trim(p.account_no)||'';''||p.charge_total_amount
      ||''Ԫ;{''||p.recognizee_holder_id||''}]'') rmk
      ,row_number()over (partition by p.policy_holder_id order by p.begin_date desc) rn
      from w_customer l inner join policy p on l.temp_customer_id=p.policy_holder_id

    ) t where rn<3
  )  where rn=1
) p on w.temp_customer_id=p.customer_id
where fun_check_paycode(:source_type_code,p.charge_way,p.begin_date,:v_start_time)=1)';
--v_sql:='insert into temp_exp_rs('||regexp_replace(lower(trim(i_clumn_list)),'^( )+select( )+','')||')'||i_clumn_list||' from
v_sql:=i_clumn_list||v_sql;
dbms_output.put_line(v_sql);
open o_dt for v_sql using v_source_type_code,v_start_time;
end if;
exception
  when others then
   v_errcode   :=   sqlcode;
   v_errmsg   :=   substr(sqlerrm,1,100);
   dbms_output.put_line( 'error   code   is '   ||   v_errcode   ||   '   error   message   is '   ||   v_errmsg);
  o_updated_rows:= -1;
  insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  VALUES('������ȫ�����; error   code   is '   ||   v_errcode, '����,error   message   is '   ||   v_errmsg, v_start_time,systimestamp, o_updated_rows, i_task_id);
commit;
end;
/

prompt
prompt Creating procedure PROC_EXP_ONLINE_POLICY
prompt =========================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.proc_exp_online_policy
(
  o_dt out sys_refcursor
  ,o_ret_code out number
) as
v_date date;
begin
o_ret_code:=0;
v_date:=sysdate;
open o_dt for
select branch_govern_id,application_no from online_deal_policy where batch_id_fee is null;
--select branch_govern_id,application_no from online_deal_policy where (v_date-application_create_time)<60 and batch_id_fee is null;

  exception
    when others then
    o_ret_code:= -1;
     insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  VALUES('�����������ϳɽ�����,��ecifϵͳ���󸶷���Ϣ', '����', null,systimestamp, o_ret_code, -1);
end;
/

prompt
prompt Creating procedure PROC_EXP_UPDATE
prompt ==================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_EXP_update
(
  i_task_id in number
  ,i_exp_type in number default 0
  ,o_updated_rows out number
) as
v_sql varchar2(8000);
v_condition varchar2(2000);
v_start_time date:=sysdate;
v_source_type_code number(3);
v_lastCondition varchar2(100);
v_preCondition varchar2(2000);
begin
o_updated_rows:=0;
--��ȡ��������
select nvl(regexp_replace(lower(trim(task_condition)),'^(and( )+)*',''),' 1=1')
  ,fun_find_source(upper(task_condition)) into v_condition,v_source_type_code
  from tasks where id=i_task_id;
--����Ĭ������
  select substr(v_condition,instr(v_condition,'and rownum',1,1)) into v_lastCondition from dual;
  --dbms_output.put_line('v_lastCondition:'||v_lastCondition);
  select substr(v_condition,0,instr(v_condition,'and rownum',1,1)-1) into v_preCondition from dual;
  -- dbms_output.put_line('v_preCondition:'||v_preCondition);
if i_exp_type=0 then --ֻ����ϴ�ɹ��Ĳſ��Ե�������
  V_sql:='merge into customer cus
using(
with w_customer as(
  select cus.customer_id temp_customer_id from customer cus
  inner join d_branch_info d on cus.branch_code=d.branch_code
  inner join d_birthdate_month b on cus.BIRTHDATE_MONTH_DAY_CODE=b.BIRTHDATE_MONTH_DAY_CODE
  where (from_last_sale_time_code>2 or sale_status_code=0 and clear_status_code=3) and '||v_preCondition||'
  minus
  select customer_id from filter_red_black where dx_filter=1 and status=1
)
--��ȡ�ͻ���Ϣ
select w.temp_customer_id customer_id
from w_customer w
inner join
(
select distinct r.customer_id
    from w_customer l inner join customer_phone r on l.temp_customer_id=r.customer_id
    where not exists (select 1 from filter_red_black where dx_filter=1 and status=1 and telephone=r.phone)
) t on w.temp_customer_id=t.customer_id
left join
(
  --��ȡ������Ϣ
   select customer_id,charge_way,begin_date
  from(
      select p.policy_holder_id customer_id,p.policy_no,p.class_name,p.class_code,p.charge_way,p.begin_date
      ,row_number()over (partition by p.policy_holder_id order by p.begin_date desc) rn
      from w_customer l inner join policy p on l.temp_customer_id=p.policy_holder_id
      left join filter_class_code fcc on p.class_code=fcc.class_code and fcc.dx_filter=1 and fcc.status=1
      where  fcc.class_code is null   
  )  where rn=1
) p on w.temp_customer_id=p.customer_id
where fun_check_paycode(:v_source_type_code,p.charge_way,p.begin_date,:v_start_time)=1 '||v_lastCondition||'
) cn on(cus.customer_id=cn.customer_id)
when matched then
update
set cus.sale_status_code=1
,from_last_sale_time_code=0';
execute immediate v_sql using v_source_type_code,v_start_time;
elsif i_exp_type=1 then--ֻ���޵绰����ϴʧ�ܵ�,�Ҳ��ڱ�ȫ�еĿͻ��ſ��Ե�����ȫ
  V_sql:='merge into customer cus
using(
with w_customer as(
  select cus.customer_id temp_customer_id from customer cus
  inner join d_branch_info d on cus.branch_code=d.branch_code
  inner join d_birthdate_month b on cus.BIRTHDATE_MONTH_DAY_CODE=b.BIRTHDATE_MONTH_DAY_CODE
  where clear_status_code in(0,4) and operation_status_code<>1 and '||v_condition||'
  minus
  select customer_id from filter_red_black where bq_filter=1 and status=1
)
--��ȡ�ͻ���Ϣ
select w.temp_customer_id customer_id
from w_customer w
left join
(
  --��ȡ������Ϣ
   select customer_id,charge_way,begin_date
  from(
      select p.policy_holder_id customer_id,p.policy_no,p.class_name,p.class_code,p.charge_way,p.begin_date
      ,row_number()over (partition by p.policy_holder_id order by p.begin_date desc) rn
      from w_customer l inner join policy p on l.temp_customer_id=p.policy_holder_id
      left join filter_class_code fcc on p.class_code=fcc.class_code and fcc.bq_filter=1 and fcc.status=1
      where fcc.class_code is null
  )  where rn=1
) p on w.temp_customer_id=p.customer_id
where fun_check_paycode(:v_source_type_code,p.charge_way,p.begin_date,:v_start_time)=1
) cn on(cus.customer_id=cn.customer_id)
when matched then
update
set cus.operation_status_code=1';
execute immediate v_sql using v_source_type_code,v_start_time;
end if;

o_updated_rows:=sql%rowcount;
insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
values('������ȫ������󣬸��¿ͻ�״̬', '������ȫ����������', v_start_time,systimestamp, o_updated_rows, i_task_id);
commit;
--�쳣����
exception
  when others then
  rollback;
  o_updated_rows:=-1;
  insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  VALUES('������ȫ������󣬸��¿ͻ�״̬', '����', v_start_time,systimestamp, o_updated_rows, i_task_id);
end;
/

prompt
prompt Creating procedure PROC_FILTER_CUS
prompt ==================================
prompt
create or replace procedure sxdxsj.PROC_FILTER_CUS(i_zone_no             varchar2,
                                            i_tele_no             varchar2,
                                            i_agency_company_code varchar2)
Authid Current_User is
/****************************************
�������������й��˴���

�������壺
i_zone_no:����
i_tele_no���绰����
i_agency_company_code:�н鹫˾����
****************************************/
--  v_preins_sms_cnt number default 0;--���տͻ���Ϣ������Ƿ�����Ӧ���ݣ����һ�γɹ����յ�ʱ���Ƿ���2��֮�ڣ������ţ�
--  v_preins_tel_cnt number default 0;--���տͻ���Ϣ������Ƿ�����Ӧ���ݣ����һ�γɹ����յ�ʱ���Ƿ���2��֮�ڣ����绰��
  v_cus_cnt NUMBER(20) default 0;--�����������ݱ�,��ѯ��״̬��Ϊ�����ղ��ɹ���������
  CURSOR cur_agent(agent_code varchar2) is
         select a.c_agentcompany_id, b.company_code
           from c_agentcompany a, CPIC_COMPANY b
            where b.id = a.c_company_id
             and a.c_agentcompany_code = agent_code
             and rownum =1;
  CURSOR cur_usable_zone(zone_no varchar2,tele_no varchar2) is
         select USABLE_ID,C_AGENTCOMPANY_ID
         from USABLE_SHCPIC_PREINS_CUS_INF
         where USABLE_ZONE_NUMBER= zone_no
         and USABLE_TELE_NUMBER= tele_no
         and sysdate - interval '1' month - USABLE_DATE <0;--�������������ݱ��в�ѯ��״̬��Ϊ�����ղ��ɹ���������(������)
  CURSOR cur_usable (tele_no varchar2) is
         select USABLE_ID,C_AGENTCOMPANY_ID
         from USABLE_SHCPIC_PREINS_CUS_INF
         where USABLE_TELE_NUMBER= tele_no
         and sysdate - interval '1' month - USABLE_DATE <0;--�������������ݱ��в�ѯ��״̬��Ϊ�����ղ��ɹ���������(������)
  CURSOR cur_split(i_str varchar2, i_split varchar2) is
         select��distinct(column_value)��from��table(FUN_SPLIT_STR(i_str,i_split));--���usable_id

  v_agentcompany_id varchar2(10);--�ֹ�˾id
  v_company_code varchar2(20);--�н鹫˾����
  v_usable_id varchar2(10);--
  v_agentcompany_id2 varchar2(20);
  v_count number(20) default 0;--��ʱ�洢��������
  v_agentcompanyid varchar2(20) default '';--��ʱ�洢v_agentcompanyid
  v_agentcompanyid_str varchar2(20) default '';--��ʱ�洢v_agentcompanyid

 /* v_agentcompany_str varchar2(20);--
 */
begin

--    dbms_output.put_line('i_agency_company_code:'||i_agency_company_code);
    /*
    ��������+�绰���뵽�����տͻ���Ϣ����2�ű�1�Ŷ������տͻ���Ϣ��1�ŵ绰���տͻ���Ϣ����ѯ�Ƿ��ж�Ӧ����
               *  ����ÿͻ����һ�γɹ����յ�ʱ���Ƿ���2��0֮�ڣ����˵���Щ�������ݡ�

      select count(*) into v_preins_tel_cnt
                from cpic_presentins_info
               where apper_cell_no = i_zone_no||i_tele_no
                 and sysdate - interval '2' year < to_date(sms_time, 'yyyy-mm-dd hh24:mi:ss');
      dbms_output.put_line('v_preins_tel_cnt:'||v_preins_tel_cnt);
      select count(*) into v_preins_sms_cnt
                from shcpic_preins_sms_history a
               where receiver_no = i_zone_no||i_tele_no
                 and sysdate - interval '2' year < a.send_time;
--      dbms_output.put_line('v_preins_sms_cnt:'||v_preins_sms_cnt);


     if(v_preins_sms_cnt > 0 or v_preins_tel_cnt > 0) then
       --���տͻ���Ϣ������Ӧ���ݣ�����
--       dbms_output.put_line('���տͻ���Ϣ������Ӧ���ݣ�����');
       return;
     else*/
       /*
       ��������+�绰���뵽�������������ݱ��в�ѯ��״̬��Ϊ�����ղ��ɹ���������
        ����У�����˵���Щ�������ݡ�
       */
     select count(*) into v_cus_cnt
     from USABLE_SHCPIC_PREINS_CUS_INF where USABLE_ZONE_NUMBER=i_zone_no and USABLE_TELE_NUMBER=i_tele_no and USABLE_STATUS=1;
     if(v_cus_cnt=0) then
         
           open cur_agent(i_agency_company_code);
           fetch cur_agent into v_agentcompany_id,v_company_code;
           if(cur_agent%found) then
    --           dbms_output.put_line('v_agentcompany_id:' || v_agentcompany_id);
    --           dbms_output.put_line('v_company_code:'||v_company_code);
               /*���� Ϊ��*/
               if(trim(i_zone_no) is not null) then
                  open cur_usable_zone(i_zone_no,i_tele_no);
                  fetch cur_usable_zone into v_usable_id,v_agentcompany_id2;
                  if(cur_usable_zone%found) then
                    v_count := cur_usable_zone%rowcount;
     --             else
    --                dbms_output.put_line('cur_usable_zone δȡ�����ݣ�');
                  end if;
                  close cur_usable_zone;
               else
                  open cur_usable(i_tele_no);
                  fetch cur_usable into v_usable_id,v_agentcompany_id2;
                  if(cur_usable%found) then
                    v_count := v_count+cur_usable%rowcount;
    --              else
    --                dbms_output.put_line('cur_usable δȡ�����ݣ�');
                  end if;
                  close cur_usable;
               end if;
               dbms_output.put_line('v_count:'||v_count);
               if(v_count>0) then
    --              dbms_output.put_line('����USABLE_SHCPIC_PREINS_CUS_INF���ݣ�');
    --              dbms_output.put_line('v_usable_id:'||v_usable_id);
    --              dbms_output.put_line('v_agentcompany_id2:'||v_agentcompany_id2);
                  if(trim(v_agentcompany_id2) is not null) then
                    open cur_split(v_agentcompany_id2 ||'+'||v_agentcompany_id,'+');
                    loop
                        fetch cur_split into v_agentcompanyid;
                        exit when cur_split%notfound;
                        dbms_output.put_line('v_agentcompanyid:'||v_agentcompanyid);
                        v_agentcompanyid_str :=v_agentcompanyid_str||'+'||v_agentcompanyid;
                    end loop;
                    close cur_split;
                    dbms_output.put_line('v_agentcompanyid_str:'||v_agentcompanyid_str);
                    v_agentcompanyid_str:=substr(v_agentcompanyid_str,2,LENGTH(v_agentcompanyid_str));
                    dbms_output.put_line('v_agentcompanyid_str:'||v_agentcompanyid_str);
                  else
                    v_agentcompanyid_str :=v_agentcompany_id2;
                  end if;
                    update USABLE_SHCPIC_PREINS_CUS_INF set C_AGENTCOMPANY_ID=v_agentcompanyid_str where USABLE_ID=v_usable_id;
               else
    --               dbms_output.put_line('����USABLE_SHCPIC_PREINS_CUS_INF�����ݣ�');
                   v_agentcompany_id2:=v_agentcompany_id;
                   insert into USABLE_SHCPIC_PREINS_CUS_INF (USABLE_ID,USABLE_ZONE_NUMBER,USABLE_TELE_NUMBER,C_AGENTCOMPANY_CODE,USABLE_STATUS,USABLE_DATE,C_AGENTCOMPANY_ID,C_COMPANY_CODE)
                   values (SEQ_USABLE_CUS_INF.nextval,i_zone_no,i_tele_no,i_agency_company_code,0,sysdate,v_agentcompany_id2,v_company_code);
               end if;
    --       else
    --           dbms_output.put_line('�����������ݱ�δ�鵽����');
           end if;
           close cur_agent;
       --end if;
       commit;
   end if;
 EXCEPTION
 when others then
   dbms_output.put_line('�����ˣ���');
   rollback;
end PROC_FILTER_CUS;
/

prompt
prompt Creating procedure PROC_F_INSERT_LOG
prompt ====================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_F_INSERT_LOG
(
  P_IN_PROC_NAME IN F_SP_STAT_LOG.PROC_NAME%TYPE
 ,P_IN_WORK_DATE IN F_SP_STAT_LOG.WORKDATE%TYPE
 ,P_IN_STEP_NO IN F_SP_STAT_LOG.STEP_NO%TYPE
 ,P_IN_STEP_DESC IN F_SP_STAT_LOG.STEP_DESC%TYPE
 ,P_IN_BEGIN_TIME IN F_SP_STAT_LOG.BEGIN_TIME%TYPE
 ,P_IN_END_TIME IN F_SP_STAT_LOG.END_TIME%TYPE
 ,P_IN_ROW_NUM IN F_SP_STAT_LOG.ROW_NUM%TYPE
 ,P_IN_ELAPSED IN F_SP_STAT_LOG.ELAPSED%TYPE
 ,P_IN_ALL_ELAPSED IN F_SP_STAT_LOG.ALL_ELAPSED%TYPE
 ,P_IN_SQL_CODE IN F_SP_STAT_LOG.SQL_CODE%TYPE
 ,P_IN_SQL_ERRM IN F_SP_STAT_LOG.SQL_ERRM%TYPE
 ,P_IN_FLAG IN F_SP_STAT_LOG.FLAG%TYPE
) IS
BEGIN
  INSERT INTO F_SP_STAT_LOG
    (PROC_NAME
    ,WORKDATE
    ,STEP_NO
    ,STEP_DESC
    ,BEGIN_TIME
    ,END_TIME
    ,ROW_NUM
    ,ELAPSED
    ,ALL_ELAPSED
    ,SQL_CODE
    ,SQL_ERRM
    ,FLAG)
  VALUES
    (P_IN_PROC_NAME
    ,P_IN_WORK_DATE
    ,P_IN_STEP_NO
    ,P_IN_STEP_DESC
    ,P_IN_BEGIN_TIME
    ,P_IN_END_TIME
    ,P_IN_ROW_NUM
    ,P_IN_ELAPSED
    ,P_IN_ALL_ELAPSED
    ,P_IN_SQL_CODE
    ,P_IN_SQL_ERRM
    ,P_IN_FLAG);
  COMMIT;
END PROC_F_INSERT_LOG;
/

prompt
prompt Creating procedure PROC_F_UPDATE_LOG
prompt ====================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_F_UPDATE_LOG
(
  P_IN_PROC_NAME IN F_SP_STAT_LOG.PROC_NAME%TYPE
 ,P_IN_WORK_DATE IN F_SP_STAT_LOG.WORKDATE%TYPE
 ,P_IN_STEP_NO IN F_SP_STAT_LOG.STEP_NO%TYPE
 ,P_IN_BEGIN_TIME IN F_SP_STAT_LOG.BEGIN_TIME%TYPE
 ,P_IN_END_TIME IN F_SP_STAT_LOG.END_TIME%TYPE
 ,P_IN_ROW_NUM IN F_SP_STAT_LOG.ROW_NUM%TYPE
 ,P_IN_ELAPSED IN F_SP_STAT_LOG.ELAPSED%TYPE
 ,P_IN_ALL_ELAPSED IN F_SP_STAT_LOG.ALL_ELAPSED%TYPE
 ,P_IN_SQL_CODE IN F_SP_STAT_LOG.SQL_CODE%TYPE
 ,P_IN_SQL_ERRM IN F_SP_STAT_LOG.SQL_ERRM%TYPE
) IS
BEGIN
  UPDATE F_SP_STAT_LOG
     SET END_TIME = P_IN_END_TIME
        ,ROW_NUM = P_IN_ROW_NUM
        ,ELAPSED = P_IN_ELAPSED
        ,ALL_ELAPSED = P_IN_ALL_ELAPSED
        ,SQL_CODE = P_IN_SQL_CODE
        ,SQL_ERRM = P_IN_SQL_ERRM
   WHERE PROC_NAME = P_IN_PROC_NAME
     AND STEP_NO = P_IN_STEP_NO
     AND BEGIN_TIME = P_IN_BEGIN_TIME
     AND WORKDATE = P_IN_WORK_DATE;
  COMMIT;

END PROC_F_UPDATE_LOG;
/

prompt
prompt Creating procedure PROC_F_CHECKING_PHONE
prompt ========================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_F_CHECKING_PHONE
(
  IN_TASK_ID IN NUMBER
 ,IN_BATCH_CODE IN NUMBER
 ,OUT_SQLCODE OUT NUMBER
 ,OUT_ERRMSG OUT VARCHAR2
) IS
  V_SP_BEGIN_DATE DATE := SYSDATE;
  V_PROC_NAME     F_SP_STAT_LOG.PROC_NAME%TYPE := 'PROC_F_CHECKING_PHONE';
  V_WORK_DATE     F_SP_STAT_LOG.WORKDATE%TYPE := TO_CHAR(SYSDATE, 'YYYY-MM-DD');
  V_STEP          NUMBER := 0;
  V_STEP_NO       F_SP_STAT_LOG.STEP_NO%TYPE;
  V_STEP_DESC     F_SP_STAT_LOG.STEP_DESC%TYPE;
  V_BEGIN_TIME    F_SP_STAT_LOG.BEGIN_TIME%TYPE;
  V_ROW_NUM       F_SP_STAT_LOG.ROW_NUM%TYPE;
BEGIN
  OUT_SQLCODE := 0;
  OUT_ERRMSG  := 'NORMAL, SUCCESSFUL COMPLETION';

  V_STEP       := V_STEP + 1;
  V_STEP_NO    := SF_CREATE_STEP(V_STEP);
  V_STEP_DESC  := '�µ绰��ϴԭʼ����ȥ��';
  V_BEGIN_TIME := SYSDATE;

  PROC_F_INSERT_LOG(V_PROC_NAME
                   ,V_WORK_DATE
                   ,V_STEP_NO
                   ,V_STEP_DESC
                   ,V_BEGIN_TIME
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,IN_TASK_ID);

  INSERT INTO F_PHONE_CLEAN_BAK
    (BATCH_CODE
    ,CUSTOMER_ID
    ,PHONE
    ,EXPORT_TIME)
    SELECT DISTINCT IN_BATCH_CODE
                   ,A.CUSTOMER_ID
                   ,A.PHONE
                   ,SYSDATE
      FROM F_PHONE_CLEAN_TEMP A
     WHERE A.BATCH_CODE = IN_BATCH_CODE;
  V_ROW_NUM := SQL%ROWCOUNT;
  COMMIT;

  PROC_F_UPDATE_LOG(V_PROC_NAME
                   ,V_WORK_DATE
                   ,V_STEP_NO
                   ,V_BEGIN_TIME
                   ,SYSDATE
                   ,V_ROW_NUM
                   ,(SYSDATE - V_BEGIN_TIME) * 86400
                   ,NULL
                   ,OUT_SQLCODE
                   ,OUT_ERRMSG);

  V_STEP       := V_STEP + 1;
  V_STEP_NO    := SF_CREATE_STEP(V_STEP);
  V_STEP_DESC  := '�µ绰��ϴ��Ч��У��';
  V_BEGIN_TIME := SYSDATE;
  PROC_F_INSERT_LOG(V_PROC_NAME
                   ,V_WORK_DATE
                   ,V_STEP_NO
                   ,V_STEP_DESC
                   ,V_BEGIN_TIME
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,IN_TASK_ID);

  INSERT INTO F_PHONE_CLEAN
    (BATCH_CODE
    ,CUSTOMER_ID
    ,PHONE
    ,PHONE_TYPE
    ,STATUS
    ,EXPORT_TIME)
    WITH CLEAN_PHONE AS
     (SELECT A.BATCH_CODE
            ,A.CUSTOMER_ID
            ,A.PHONE
            ,NVL(B.TPHONE, A.PHONE) PHONE1
            ,SUBSTR(NVL(B.TPHONE, A.PHONE), REGEXP_INSTR(NVL(B.TPHONE, A.PHONE), '1[3456789]')) MPHONE
            ,A.EXPORT_TIME
        FROM F_PHONE_CLEAN_BAK A
            ,(SELECT A1.CUSTOMER_ID
                    ,A1.PHONE
                    ,REPLACE(TRANSLATE(A1.PHONE, TRANSLATE(A1.PHONE, '0123456789', '|'), '|'), '|', '') AS TPHONE
                FROM F_PHONE_CLEAN_BAK A1
               WHERE A1.BATCH_CODE = IN_BATCH_CODE) B
       WHERE A.CUSTOMER_ID = B.CUSTOMER_ID(+)
         AND A.PHONE = B.PHONE(+)
         AND A.BATCH_CODE = IN_BATCH_CODE)
    SELECT BATCH_CODE
          ,CUSTOMER_ID
          ,C_PHONE
          ,PHONE_TYPE
          ,0 AS STATUS
          ,EXPORT_TIME
      FROM (SELECT CP.BATCH_CODE
                  ,CP.CUSTOMER_ID
                  ,CASE
                     WHEN LENGTH(MPHONE) = 11
                          AND SUBSTR(MPHONE, 1, 1) = '1' THEN
                      MPHONE
                     WHEN SUBSTR(PHONE1, 1, 1) = '0'
                          AND LENGTH(PHONE1) BETWEEN 10 AND 12 THEN
                      PHONE1
                     ELSE
                      PHONE
                   END C_PHONE
                  ,CASE
                     WHEN LENGTH(MPHONE) = 11
                          AND SUBSTR(MPHONE, 1, 1) = '1' THEN
                      1
                     WHEN SUBSTR(PHONE1, 1, 1) = '0'
                          AND LENGTH(PHONE1) BETWEEN 10 AND 12 THEN
                      2
                     ELSE
                      0
                   END PHONE_TYPE
                  ,CP.EXPORT_TIME
              FROM CLEAN_PHONE CP);
  V_ROW_NUM := SQL%ROWCOUNT;
  COMMIT;

  PROC_F_UPDATE_LOG(V_PROC_NAME
                   ,V_WORK_DATE
                   ,V_STEP_NO
                   ,V_BEGIN_TIME
                   ,SYSDATE
                   ,V_ROW_NUM
                   ,(SYSDATE - V_BEGIN_TIME) * 86400
                   ,NULL
                   ,OUT_SQLCODE
                   ,OUT_ERRMSG);

  V_STEP       := V_STEP + 1;
  V_STEP_NO    := SF_CREATE_STEP(V_STEP);
  V_STEP_DESC  := '�µ绰��ϴ��������';
  V_BEGIN_TIME := SYSDATE;
  PROC_F_INSERT_LOG(V_PROC_NAME
                   ,V_WORK_DATE
                   ,V_STEP_NO
                   ,V_STEP_DESC
                   ,V_BEGIN_TIME
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,IN_TASK_ID);

  INSERT INTO F_CLEAN_BATCH
    (BATCH_CODE
    ,TASK_ID
    ,CLEAN_STATUS
    ,INIT_COUNT
    ,NOT_PHONE_COUNT
    ,MOBILE_CLEAN_STATUS
    ,MOBILE_INIT_COUNT
    ,TEL_CLEAN_STATUS
    ,TEL_INIT_COUNT)
    SELECT IN_BATCH_CODE
          ,IN_TASK_ID
          ,0
          ,COUNT(1) AS ITCOUNT
          ,COUNT(CASE
                   WHEN A.PHONE_TYPE = 0 THEN
                    1
                 END) AS NPNUM
          ,0
          ,COUNT(CASE
                   WHEN A.PHONE_TYPE = 1 THEN
                    1
                 END) AS MNUM
          ,0
          ,COUNT(CASE
                   WHEN A.PHONE_TYPE = 2 THEN
                    1
                 END) AS PNUM
      FROM F_PHONE_CLEAN A
     WHERE A.BATCH_CODE = IN_BATCH_CODE;

  V_ROW_NUM := SQL%ROWCOUNT;
  COMMIT;

  PROC_F_UPDATE_LOG(V_PROC_NAME
                   ,V_WORK_DATE
                   ,V_STEP_NO
                   ,V_BEGIN_TIME
                   ,SYSDATE
                   ,V_ROW_NUM
                   ,(SYSDATE - V_BEGIN_TIME) * 86400
                   ,(SYSDATE - V_SP_BEGIN_DATE) * 86400
                   ,OUT_SQLCODE
                   ,OUT_ERRMSG);

EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    OUT_SQLCODE := SQLCODE;
    OUT_ERRMSG  := SQLERRM;
    IF V_STEP_NO IS NULL
    THEN
      PROC_F_INSERT_LOG(V_PROC_NAME
                       ,V_WORK_DATE
                       ,'STEP_99'
                       ,'δ֪�����쳣'
                       ,V_SP_BEGIN_DATE
                       ,SYSDATE
                       ,NULL
                       ,NULL
                       ,(SYSDATE - V_SP_BEGIN_DATE) * 86400
                       ,OUT_SQLCODE
                       ,OUT_ERRMSG
                       ,IN_TASK_ID);
    ELSE
      PROC_F_UPDATE_LOG(V_PROC_NAME
                       ,V_WORK_DATE
                       ,V_STEP_NO
                       ,V_BEGIN_TIME
                       ,SYSDATE
                       ,NULL
                       ,NULL
                       ,(SYSDATE - V_SP_BEGIN_DATE) * 86400
                       ,OUT_SQLCODE
                       ,OUT_ERRMSG);
    END IF;
END PROC_F_CHECKING_PHONE;
/

prompt
prompt Creating procedure PROC_F_CLEAN_PHONE
prompt =====================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_F_CLEAN_PHONE
(
  P_IN_TASK_ID IN NUMBER
 ,P_IN_BATCH_CODE IN NUMBER
 ,P_OUT_GOVERN_ID OUT VARCHAR2
 ,P_OUT_SERVICE_TYPE OUT VARCHAR2
 ,P_OUT_EXT_CODE OUT VARCHAR2
 ,P_OUT_START_TIME OUT DATE
 ,P_OUT_DT OUT SYS_REFCURSOR
 ,P_OUT_MOBILE_ROWS OUT NUMBER
 ,P_OUT_CUSTOMER_COUNT OUT NUMBER
 ,P_OUT_SQLCODE OUT NUMBER
 ,P_OUT_ERRMSG OUT VARCHAR2
) IS
  V_SP_BEGIN_DATE DATE := SYSDATE;
  V_PROC_NAME     F_SP_STAT_LOG.PROC_NAME%TYPE := 'PROC_F_CLEAN_PHONE';
  V_WORK_DATE     F_SP_STAT_LOG.WORKDATE%TYPE := TO_CHAR(SYSDATE, 'YYYY-MM-DD');
  V_STEP          NUMBER := 0;
  V_STEP_NO       F_SP_STAT_LOG.STEP_NO%TYPE;
  V_STEP_DESC     F_SP_STAT_LOG.STEP_DESC%TYPE;
  V_BEGIN_TIME    F_SP_STAT_LOG.BEGIN_TIME%TYPE;
  V_ROW_NUM       F_SP_STAT_LOG.ROW_NUM%TYPE;

  V_MB_SEND_CLEAN_COUNT  F_CLEAN_BATCH.MOBILE_SEND_CLEAN_COUNT%TYPE := 0;
  V_TEL_SEND_CLEAN_COUNT F_CLEAN_BATCH.TEL_SEND_CLEAN_COUNT%TYPE := 0;
BEGIN
  P_OUT_SQLCODE := 0;
  P_OUT_ERRMSG  := 'NORMAL, SUCCESSFUL COMPLETION';

  V_STEP       := V_STEP + 1;
  V_STEP_NO    := SF_CREATE_STEP(V_STEP);
  V_STEP_DESC  := '�µ绰��ϴ�ֻ�����';
  V_BEGIN_TIME := SYSDATE;

  P_OUT_GOVERN_ID    := '300000043';
  P_OUT_EXT_CODE     := '3035';
  P_OUT_SERVICE_TYPE := 'DX-dhqx';
  P_OUT_MOBILE_ROWS  := 0;

  PROC_F_INSERT_LOG(V_PROC_NAME
                   ,V_WORK_DATE
                   ,V_STEP_NO
                   ,V_STEP_DESC
                   ,V_BEGIN_TIME
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,P_IN_TASK_ID);

  SELECT NVL(MAX(MOBILE_SEND_END_TIME), MAX(MOBILE_BEGIN_TIME)) INTO P_OUT_START_TIME FROM F_CLEAN_BATCH;
  IF P_OUT_START_TIME < SYSDATE
  THEN
    P_OUT_START_TIME := SYSDATE;
  END IF;
  SELECT SUM(CASE
               WHEN CP.PHONE_TYPE = 1
                    AND STATUS = 0 THEN
                1
               ELSE
                0
             END)
        ,SUM(CASE
               WHEN CP.PHONE_TYPE = 2
                    AND STATUS = 0 THEN
                1
               ELSE
                0
             END)
    INTO V_MB_SEND_CLEAN_COUNT
        ,V_TEL_SEND_CLEAN_COUNT
    FROM F_PHONE_CLEAN CP
   WHERE CP.BATCH_CODE = P_IN_BATCH_CODE;

  UPDATE TASKS SET PROCESSCODE = 6 WHERE ID = P_IN_TASK_ID;
  UPDATE F_CLEAN_BATCH CB
     SET CB.CLEAN_STATUS = 1
        ,CB.COMMIT_TIME = SYSDATE
        ,CB.MOBILE_BEGIN_TIME = NVL(P_OUT_START_TIME, SYSDATE)
        ,CB.MOBILE_SEND_CLEAN_COUNT = V_MB_SEND_CLEAN_COUNT
         --,CB.TEL_CLEAN_STATUS = 1
        ,CB.TEL_BEGIN_TIME = SYSDATE
        ,CB.TEL_SEND_CLEAN_COUNT = V_TEL_SEND_CLEAN_COUNT
   WHERE CB.BATCH_CODE = P_IN_BATCH_CODE;
  V_ROW_NUM := SQL%ROWCOUNT;
  COMMIT;
  SELECT SUM(CASE
               WHEN CP.PHONE_TYPE = 1 THEN
                1
               ELSE
                0
             END)
        ,COUNT(DISTINCT CUSTOMER_ID)
    INTO P_OUT_MOBILE_ROWS
        ,P_OUT_CUSTOMER_COUNT
    FROM F_PHONE_CLEAN CP
   WHERE CP.BATCH_CODE = P_IN_BATCH_CODE;

  OPEN P_OUT_DT FOR
    SELECT PHONE
          ,SMS.MESSAGE_CONTENT
      FROM F_PHONE_CLEAN CP
          ,(SELECT MESSAGE_CONTENT
              FROM SMS_MESSAGE_LIBRARY
             WHERE ACTIVE = 1
               AND ROWNUM = 1) SMS
     WHERE CP.BATCH_CODE = P_IN_BATCH_CODE
       AND CP.PHONE_TYPE = 1;

  PROC_F_UPDATE_LOG(V_PROC_NAME
                   ,V_WORK_DATE
                   ,V_STEP_NO
                   ,V_BEGIN_TIME
                   ,SYSDATE
                   ,V_ROW_NUM
                   ,(SYSDATE - V_BEGIN_TIME) * 86400
                   ,(SYSDATE - V_SP_BEGIN_DATE) * 86400
                   ,P_OUT_SQLCODE
                   ,P_OUT_ERRMSG);
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    P_OUT_SQLCODE := SQLCODE;
    P_OUT_ERRMSG  := SQLERRM;
    IF V_STEP_NO IS NULL
    THEN
      PROC_F_INSERT_LOG(V_PROC_NAME
                       ,V_WORK_DATE
                       ,'STEP_99'
                       ,'δ֪�����쳣'
                       ,V_SP_BEGIN_DATE
                       ,SYSDATE
                       ,NULL
                       ,NULL
                       ,(SYSDATE - V_SP_BEGIN_DATE) * 86400
                       ,P_OUT_SQLCODE
                       ,P_OUT_ERRMSG
                       ,P_IN_TASK_ID);
    ELSE
      PROC_F_UPDATE_LOG(V_PROC_NAME
                       ,V_WORK_DATE
                       ,V_STEP_NO
                       ,V_BEGIN_TIME
                       ,SYSDATE
                       ,NULL
                       ,NULL
                       ,(SYSDATE - V_SP_BEGIN_DATE) * 86400
                       ,P_OUT_SQLCODE
                       ,P_OUT_ERRMSG);
    END IF;
END PROC_F_CLEAN_PHONE;
/

prompt
prompt Creating procedure PROC_F_MOBILE_UPDATE
prompt =======================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_F_MOBILE_UPDATE
(
  P_IN_TASK_ID IN NUMBER
 ,P_IN_BATCH_CODE IN NUMBER
 ,P_IN_MB_SEND_END_TIME IN TIMESTAMP
 ,P_OUT_SQLCODE OUT NUMBER
 ,P_OUT_ERRMSG OUT VARCHAR2
) IS
  V_SP_BEGIN_DATE DATE := SYSDATE;
  V_PROC_NAME     F_SP_STAT_LOG.PROC_NAME%TYPE := 'PROC_F_MOBILE_UPDATE';
  V_WORK_DATE     F_SP_STAT_LOG.WORKDATE%TYPE := TO_CHAR(SYSDATE, 'YYYY-MM-DD');
  V_STEP          NUMBER := 0;
  V_STEP_NO       F_SP_STAT_LOG.STEP_NO%TYPE;
  V_STEP_DESC     F_SP_STAT_LOG.STEP_DESC%TYPE;
  V_BEGIN_TIME    F_SP_STAT_LOG.BEGIN_TIME%TYPE;
  V_ROW_NUM       F_SP_STAT_LOG.ROW_NUM%TYPE;
BEGIN
  P_OUT_SQLCODE := 0;
  P_OUT_ERRMSG  := 'NORMAL, SUCCESSFUL COMPLETION';
  V_STEP        := V_STEP + 1;
  V_STEP_NO     := SF_CREATE_STEP(V_STEP);
  V_STEP_DESC   := '���ֻ���ϴ����Ԥ�ƶ��ŷ��ͽ���ʱ��';
  V_BEGIN_TIME  := SYSDATE;

  PROC_F_INSERT_LOG(V_PROC_NAME
                   ,V_WORK_DATE
                   ,V_STEP_NO
                   ,V_STEP_DESC
                   ,V_BEGIN_TIME
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,P_IN_TASK_ID);

  UPDATE F_CLEAN_BATCH
     SET MOBILE_CLEAN_STATUS = 1
        ,MOBILE_SEND_END_TIME = P_IN_MB_SEND_END_TIME
   WHERE BATCH_CODE = P_IN_BATCH_CODE;
  V_ROW_NUM := SQL%ROWCOUNT;
  COMMIT;

  PROC_F_UPDATE_LOG(V_PROC_NAME
                   ,V_WORK_DATE
                   ,V_STEP_NO
                   ,V_BEGIN_TIME
                   ,SYSDATE
                   ,V_ROW_NUM
                   ,(SYSDATE - V_BEGIN_TIME) * 86400
                   ,(SYSDATE - V_SP_BEGIN_DATE) * 86400
                   ,P_OUT_SQLCODE
                   ,P_OUT_ERRMSG);
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    P_OUT_SQLCODE := SQLCODE;
    P_OUT_ERRMSG  := SQLERRM;
    IF V_STEP_NO IS NULL
    THEN
      PROC_F_INSERT_LOG(V_PROC_NAME
                       ,V_WORK_DATE
                       ,'STEP_99'
                       ,'δ֪�����쳣'
                       ,V_SP_BEGIN_DATE
                       ,SYSDATE
                       ,NULL
                       ,NULL
                       ,(SYSDATE - V_SP_BEGIN_DATE) * 86400
                       ,P_OUT_SQLCODE
                       ,P_OUT_ERRMSG
                       ,P_IN_TASK_ID);
    ELSE
      PROC_F_UPDATE_LOG(V_PROC_NAME
                       ,V_WORK_DATE
                       ,V_STEP_NO
                       ,V_BEGIN_TIME
                       ,SYSDATE
                       ,NULL
                       ,NULL
                       ,(SYSDATE - V_SP_BEGIN_DATE) * 86400
                       ,P_OUT_SQLCODE
                       ,P_OUT_ERRMSG);
    END IF;
END PROC_F_MOBILE_UPDATE;
/

prompt
prompt Creating procedure PROC_F_PHONE_BACKWRITE
prompt =========================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_F_PHONE_BACKWRITE
(
  P_IN_LAZY_DAYS IN NUMBER
 ,P_OUT_SQLCODE OUT NUMBER
 ,P_OUT_ERRMSG OUT VARCHAR2
) IS
  V_SP_BEGIN_DATE DATE := SYSDATE;
  V_PROC_NAME     F_SP_STAT_LOG.PROC_NAME%TYPE := 'PROC_F_PHONE_BACKWRITE';
  V_WORK_DATE     F_SP_STAT_LOG.WORKDATE%TYPE := TO_CHAR(SYSDATE, 'YYYY-MM-DD');
  V_STEP          NUMBER := 0;
  V_STEP_NO       F_SP_STAT_LOG.STEP_NO%TYPE;
  V_STEP_DESC     F_SP_STAT_LOG.STEP_DESC%TYPE;
  V_BEGIN_TIME    F_SP_STAT_LOG.BEGIN_TIME%TYPE;
  V_ROW_NUM       F_SP_STAT_LOG.ROW_NUM%TYPE;
BEGIN
  --01���ֻ���д
  P_OUT_SQLCODE := 0;
  P_OUT_ERRMSG  := 'NORMAL, SUCCESSFUL COMPLETION';

  V_STEP       := V_STEP + 1;
  V_STEP_NO    := SF_CREATE_STEP(V_STEP);
  V_STEP_DESC  := '�µ绰��ϴ��д�ֻ�����';
  V_BEGIN_TIME := SYSDATE;
  PROC_F_INSERT_LOG(V_PROC_NAME
                   ,V_WORK_DATE
                   ,V_STEP_NO
                   ,V_STEP_DESC
                   ,V_BEGIN_TIME
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL);

  UPDATE F_PHONE_CLEAN SET STATUS = 1 WHERE PHONE IN (SELECT MOBILE FROM TEMP_SMS_SUCC_MOBILE);
  V_ROW_NUM := SQL%ROWCOUNT;
  COMMIT;

  PROC_F_UPDATE_LOG(V_PROC_NAME
                   ,V_WORK_DATE
                   ,V_STEP_NO
                   ,V_BEGIN_TIME
                   ,SYSDATE
                   ,V_ROW_NUM
                   ,(SYSDATE - V_BEGIN_TIME) * 86400
                   ,NULL
                   ,P_OUT_SQLCODE
                   ,P_OUT_ERRMSG);

  V_STEP       := V_STEP + 1;
  V_STEP_NO    := SF_CREATE_STEP(V_STEP);
  V_STEP_DESC  := '�µ绰��ϴ�������α��ֻ���Ϣ';
  V_BEGIN_TIME := SYSDATE;
  PROC_F_INSERT_LOG(V_PROC_NAME
                   ,V_WORK_DATE
                   ,V_STEP_NO
                   ,V_STEP_DESC
                   ,V_BEGIN_TIME
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL);

  UPDATE F_CLEAN_BATCH CB
     SET CB.MOBILE_CLEAN_STATUS = 2
        ,CB.MOBILE_END_TIME = SYSDATE
        ,CB.MOBILE_SUCCESS_COUNT =
         (SELECT SUM(CASE
                       WHEN CP.PHONE_TYPE = 1
                            AND CP.STATUS = 1 THEN
                        1
                       ELSE
                        0
                     END)
            FROM F_PHONE_CLEAN CP
           WHERE CP.BATCH_CODE = CB.BATCH_CODE)
   WHERE CB.CLEAN_STATUS = 1
     AND ROUND(SYSDATE - CB.MOBILE_SEND_END_TIME) >= 5; --�ȴ�5�����״̬
  V_ROW_NUM := SQL%ROWCOUNT;
  COMMIT;

  PROC_F_UPDATE_LOG(V_PROC_NAME
                   ,V_WORK_DATE
                   ,V_STEP_NO
                   ,V_BEGIN_TIME
                   ,SYSDATE
                   ,V_ROW_NUM
                   ,(SYSDATE - V_BEGIN_TIME) * 86400
                   ,NULL
                   ,P_OUT_SQLCODE
                   ,P_OUT_ERRMSG);

  --02���̻���д���ݲ�����

  V_STEP       := V_STEP + 1;
  V_STEP_NO    := SF_CREATE_STEP(V_STEP);
  V_STEP_DESC  := '�µ绰��ϴ��д����';
  V_BEGIN_TIME := SYSDATE;
  PROC_F_INSERT_LOG(V_PROC_NAME
                   ,V_WORK_DATE
                   ,V_STEP_NO
                   ,V_STEP_DESC
                   ,V_BEGIN_TIME
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL
                   ,NULL);

  UPDATE F_CLEAN_BATCH CB
     SET CB.CLEAN_STATUS = 2
        ,CB.BACK_WRITE_TIME = SYSDATE
        ,CB.SUCCESS_COUNT = CB.MOBILE_SUCCESS_COUNT
        ,CB.NOT_PHONE_COUNT =
         (CB.INIT_COUNT - CB.MOBILE_SUCCESS_COUNT)
  --�̻���ϴ�ɹ������ݲ�����
  /*,CB.SUCCESS_COUNT =
  (CB.MOBILE_SUCCESS_COUNT + CB.TEL_SUCCESS_COUNT)*/
   WHERE CB.CLEAN_STATUS = 1
     AND CB.MOBILE_CLEAN_STATUS = 2;
  --�̻�״̬���ݲ�����
  --AND CB.TEL_CLEAN_STATUS = 2;
  V_ROW_NUM := SQL%ROWCOUNT;
  COMMIT;
  PROC_F_UPDATE_LOG(V_PROC_NAME
                   ,V_WORK_DATE
                   ,V_STEP_NO
                   ,V_BEGIN_TIME
                   ,SYSDATE
                   ,V_ROW_NUM
                   ,(SYSDATE - V_BEGIN_TIME) * 86400
                   ,(SYSDATE - V_SP_BEGIN_DATE) * 86400
                   ,P_OUT_SQLCODE
                   ,P_OUT_ERRMSG);
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    P_OUT_SQLCODE := SQLCODE;
    P_OUT_ERRMSG  := SQLERRM;
    IF V_STEP_NO IS NULL
    THEN
      PROC_F_INSERT_LOG(V_PROC_NAME
                       ,V_WORK_DATE
                       ,'STEP_99'
                       ,'δ֪�����쳣'
                       ,V_SP_BEGIN_DATE
                       ,SYSDATE
                       ,NULL
                       ,NULL
                       ,(SYSDATE - V_SP_BEGIN_DATE) * 86400
                       ,P_OUT_SQLCODE
                       ,P_OUT_ERRMSG
                       ,NULL);
    ELSE
      PROC_F_UPDATE_LOG(V_PROC_NAME
                       ,V_WORK_DATE
                       ,V_STEP_NO
                       ,V_BEGIN_TIME
                       ,SYSDATE
                       ,NULL
                       ,NULL
                       ,(SYSDATE - V_SP_BEGIN_DATE) * 86400
                       ,P_OUT_SQLCODE
                       ,P_OUT_ERRMSG);
    END IF;
END PROC_F_PHONE_BACKWRITE;
/

prompt
prompt Creating procedure PROC_GET_BRANCH_ABBR
prompt =======================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ."PROC_GET_BRANCH_ABBR" (
  i_branch_code in number
  ,o_abbr out varchar2
) as
begin
select max(branch_abbreviation) into o_abbr from d_branch_info where d_branch_code=i_branch_code;
--�쳣����
exception
  when others then
  insert into log_information(command_name, command_type, start_time,end_time, condition_id)
  values('��ȡ3λ�ֹ�˾���', '����', systimestamp,systimestamp,  0);
end;
/

prompt
prompt Creating procedure PROC_GET_BRANCH_INFO
prompt =======================================
prompt
create or replace procedure sxdxsj.proc_get_branch_info(
  i_branch_code in number
  ,i_branch_abbr in varchar2
  ,o_dt out sys_refcursor
) as
begin
if i_branch_code>=0 then
  open o_dt for
  select distinct d_branch_name row_name,d_branch_code str_value from d_branch_info
  where d_branch_code=i_branch_code and active='1';
elsif length(i_branch_abbr)>0 then
  open o_dt for
  select distinct d_branch_name row_name,d_branch_code str_value from d_branch_info
  where branch_abbreviation=i_branch_abbr and active='1';
else
  open o_dt for
  select distinct d_branch_name row_name,d_branch_code str_value from d_branch_info
  where active='1' order by d_branch_code;
end if;
--�쳣����
exception
  when others then
  insert into log_information(command_name, command_type, start_time,end_time, condition_id)
  values('��ȡ�ֹ�˾��Ϣ', '����', systimestamp,systimestamp,  0);
end;
/

prompt
prompt Creating procedure PROC_GET_CHILD_BRANCH_INFO
prompt =============================================
prompt
create or replace procedure sxdxsj.proc_get_child_branch_info(
  i_branch_code in number
  ,o_dt out sys_refcursor
) as
begin
open o_dt for
select distinct child_branch_name row_name,child_branch_code str_value from d_branch_info
where d_branch_code=i_branch_code and active='1';
--�쳣����
exception
  when others then
  insert into log_information(command_name, command_type, start_time,end_time, condition_id)
  values('��ȡ�ֹ�˾������֧��Ϣ', '����', systimestamp,systimestamp,  0);
end;
/

prompt
prompt Creating procedure PROC_GET_SOURCE_INFO
prompt =======================================
prompt
create or replace procedure sxdxsj.proc_get_source_info(
  i_filter_for_rpt in number
  ,o_dt out sys_refcursor
) as
begin
if i_filter_for_rpt=1 then
  open o_dt for
  select source_type_name row_name,source_type_code str_value from d_source_from_info
  where source_type_code not in(7,8) and active='1';
else
  open o_dt for
  select source_type_name row_name,source_type_code str_value from d_source_from_info
  where active='1';
end if;
--�쳣����
exception
  when others then
  insert into log_information(command_name, command_type, start_time,end_time, condition_id)
  values('��ȡ������Դ��Ϣ', '����', systimestamp,systimestamp,  0);
end;
/

prompt
prompt Creating procedure PROC_IMP_ACTIVITY
prompt ====================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.proc_imp_activity(
  i_batch_id in number
  ,i_partition_col in number
  ,o_ret_code out number
) as
v_begin_time timestamp:=systimestamp;
v_sql varchar2(4000);
v_max_product_code number;
begin
o_ret_code:=0;
if i_partition_col in(-1,0) then
  --���Ӳ�Ʒ
  select nvl(max(product_code),64) into v_max_product_code from dx_product;
  merge into dx_product dx
  using(
    select v_max_product_code+rownum product_code
    ,chr(v_max_product_code+rownum) product_alpha
    ,da.product_name,sysdate
    from (
      select distinct trim(product_name) product_name from temp_dial_activity where trim(product_name) is not null
    ) da
  ) td on (dx.product_name=td.product_name)
  when not matched then
  insert values(td.product_code,td.product_alpha,td.product_name,null,null,sysdate,null);
  --���ӻ
  merge into dx_activity dx
  using(
    select activity_id,activity_name,product_code,product_name,activity_start_time,activity_end_time
    from(
      select l.*,row_number() over(partition by l.activity_id order by l.activity_end_time) rn
      from temp_dial_activity l where trim(activity_id) is not null
    ) where rn=1
  ) td on(dx.activity_id=td.activity_id)
  when not matched then
  insert values(td.activity_id, td.activity_name, td.activity_start_time, td.activity_end_time, td.product_code, td.product_name, 1,null,null,null);

  --���ӿͻ�������Ϣ
  merge into dx_activity_customer dx
  using(
    select distinct l.activity_id,l.policy_holder_id customer_id
    from temp_dial_activity  l
  ) td on(dx.activity_id=td.activity_id and dx.customer_id=td.customer_id)
  when not matched then
  insert values(td.activity_id,td.customer_id);
  o_ret_code:=sql%rowcount;
  --���¿ͻ�����״̬�����Ϊ������
  --���¿ͻ�����ĵ�������
  merge into customer cus
  using(
        select customer_id,count(*) nc  from dx_activity_customer group by customer_id
  ) td on (cus.customer_id=td.customer_id)
  when matched then
    update set cus.dial_times_code=case when td.nc>3 then 4 else td.nc end
    ,cus.sale_status_code=case when cus.sale_status_code<2 then 2 else cus.sale_status_code end;
end if;
insert into log_information(command_name, command_type, start_time,end_time,  add_number, condition_id)
      VALUES('����������Ϣ', '�����󶯻�д', v_begin_time,systimestamp, o_ret_code, i_batch_id);
commit;
  exception
    when others then
      rollback;
      o_ret_code:= -1;
      insert into log_information(command_name, command_type, start_time,end_time,  add_number, condition_id)
      VALUES('����������Ϣ', '����', v_begin_time,systimestamp, o_ret_code, i_batch_id);
      commit;
end;
/

prompt
prompt Creating procedure PROC_IMP_MOBILE
prompt ==================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_imp_mobile(
    o_updated_rows out number
) as
v_start_time timestamp;
begin
v_start_time:=systimestamp;
--��ǳ��ɹ��ֻ�����
update cleaning_phone set status=1 WHERE phone in(select mobile from temp_sms_succ_mobile);
--��ȡ���µ�����
o_updated_rows:=sql%rowcount;
--��ǳ��ֻ���д��ɵ�����
update batch_management bm set mobile_dial_status=1,mobile_end_dial=sysdate
,success_mobile_count=(
    select sum(case when is_mobile=1 and status=1 then 1 else 0 end)
    from cleaning_phone where batch_code=bm.batch_code
)
where clean_status=0 and round(sysdate-sms_send_end_time)>=3;
insert into log_information(command_name,command_type,start_time,end_time,update_number,condition_id)
VALUES('�ɹ��ֻ������д','�ֻ������д',v_start_time,systimestamp,o_updated_rows,0);
commit;
--�쳣����
exception
  when others then
    rollback;
    o_updated_rows:=-1;
    insert into log_information(command_name,command_type,start_time,end_time,update_number,condition_id)
    VALUES('�ɹ��ֻ������д','����',v_start_time,systimestamp,o_updated_rows,0);
end;
/

prompt
prompt Creating procedure PROC_IMP_NUANCE
prompt ==================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_imp_nuance(
  i_lazy_days in number default 0,
  o_updated_rows out number
) as
v_start_time timestamp;
begin
v_start_time:=systimestamp;
--����ÿһ�����ε绰��ϴ���
update cleaning_phone set status=1
where  phone in(
    select ftel from c_cpic_dial cp,nuance_batch bt
    where bt.clean_status in(2,3) and bt.begin_id<=cp.id and bt.end_id>=cp.id and (cp.ftel_sta in('0','4') and cp.ext1 is not null or cp.ftel_sta='002')
);
--��ȡ���µ�����
o_updated_rows:=sql%rowcount;
--������ϴ����״̬����ǹ̻���д�������
update batch_management bm set tel_dial_status=1,tel_end_dial=sysdate
,success_tel_count=(
  select sum(case when is_mobile=0 and status=1 then 1 else 0 end) FROM cleaning_phone where batch_code=bm.batch_code
)
where batch_code in (
  select batch_code from nuance_batch where clean_status in(2,3)
);
--���¹̻�״̬������ѻ�д������
update nuance_batch set clean_status=4 where clean_status in(2,3);
--������ͣ��ȡ������ϴ����
update batch_management bm set tel_dial_status=(SELECT clean_status from nuance_batch where clean_status in(-1,-2,-3) and batch_code=bm.batch_code)
where clean_status<2 and exists(select 1 from nuance_batch where clean_status in(-1,-2,-3) and batch_code=bm.batch_code);
--д����־
insert into log_information(command_name,command_type,start_time,end_time,update_number,condition_id)
values('�ɹ��̶��绰�����д','�̶��绰�����д',v_start_time,systimestamp,o_updated_rows,0);
commit;
--�쳣����
exception
  when others then
    rollback;
    o_updated_rows:=-1;
    insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
    VALUES('�ɹ��̶��绰�����д', '����', v_start_time,systimestamp, o_updated_rows, 0);
end;
/

prompt
prompt Creating procedure PROC_UPDATE_NUANCE_BATCH
prompt ===========================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_update_nuance_batch(
    o_updated_rows out number
) as
v_start_time timestamp:=systimestamp;
begin
merge into nuance_batch nb_old
  using(
    --����©���ʺ��쳣��
    select batch_code,total_count,error_count,loss_count
      ,case when total_count>0 then error_count/total_count else 0 end error_percent
      ,case when total_count>0 then loss_count/total_count else 0 end loss_percent
      ,case when total_count>100 and (error_count/total_count>=0.1 or loss_count/total_count>0.05) then -1 else 1 end clean_status
    from(
    --ͳ�Ƹող�����ɵ�������Ϣ
    select batch_code,sum(case ftel_sta when '008' then 1 else 0 end) error_count
        ,sum(case when ftel_sta is null then 1 else 0 end) loss_count
        ,count(*) total_count from(
                  --��ȡ������ɵ����μ���ID��Ϣ
                  select distinct batch_code,begin_id,end_id from nuance_batch nb
                  where nvl(clean_status,0)=0 and not exists (
                      --�鿴�������Ƿ񲦴����
                      select 1 from (
                             select to_number(substr(out_id,1,length(out_id)-1)) out_id from shcpic_outdata
                      ) sh where nb.end_id>sh.out_id and nb.begin_id<sh.out_id
                  )
        )nb ,c_cpic_dial cp
    where nb.begin_id<=cp.id and nb.end_id>=cp.id
    group by batch_code
    )
  ) nb_new on(nb_old.batch_code=nb_new.batch_code)
  when matched then
  update
  set nb_old.clean_status=nb_new.clean_status
  ,nb_old.error_count=nb_new.error_count
  ,nb_old.loss_count=nb_new.loss_count
  ,nb_old.error_percent=nb_new.error_percent
  ,nb_old.loss_percent=nb_new.loss_percent;
o_updated_rows:=sql%rowcount;
insert into log_information(command_name,command_type,start_time,end_time,update_number,condition_id)
VALUES('����Ⲧ�����Ĺ̻�����','ѭ�����õĴ洢����',v_start_time,systimestamp,o_updated_rows,0);
--���쳣���ݲ���shcpic_outdata��
merge into shcpic_outdata sh
using(
  select cp.id||'a' out_id,cp.ftel from c_cpic_dial cp,nuance_batch nb
  where nb.clean_status=-1 and cp.id>=nb.begin_id and cp.id<=nb.end_id
  and (cp.ftel_sta='008' or cp.ftel_sta is null)
) nb on(sh.out_id=nb.out_id)
when not matched then
insert values(nb.out_id,nb.ftel);
o_updated_rows:=sql%rowcount;
insert into log_information(command_name,command_type,start_time,end_time, update_number,condition_id)
VALUES('�쳣��©���Ĺ̻��ٴ���ϴ','�̻���ϴ',v_start_time,systimestamp, o_updated_rows, 0);
update nuance_batch set clean_status=0,note=(note||' ������ϴ: �쳣��: '||error_percent||'©���ʣ�'||loss_percent) WHERE clean_status=-1;
--�쳣����
exception
  when others then
    o_updated_rows:=-1;
    insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
    VALUES('����Ⲧ�����Ĺ̻�����', '����', v_start_time,systimestamp, o_updated_rows, 0);
end;
/

prompt
prompt Creating procedure PROC_IMP_CLEAN_RESULT
prompt ========================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_imp_clean_result(
  i_lazy_days in number,
  o_updated_rows out number
) as
v_start_time timestamp;
v_start_date date;
v_o_rows number(10);
begin
v_start_time:=systimestamp;
v_start_date:=sysdate;
--1 ��д�ֻ�����
proc_imp_mobile(v_o_rows);
if v_o_rows<0 then
  insert into log_information(command_name,command_type,start_time,end_time,update_number,condition_id)
  values('���ã��ֻ������д�洢����','����',v_start_time,systimestamp,o_updated_rows,0);
end if;
--2 ��д�̶��绰����
PROC_update_nuance_batch(v_o_rows);
if v_o_rows<0 then
  insert into log_information(command_name,command_type,start_time,end_time,update_number,condition_id)
  values('���ã���ǹ̻������������','����',v_start_time,systimestamp,o_updated_rows,0);
end if;
PROC_imp_nuance(i_lazy_days,v_o_rows);
if v_o_rows<0 then
  insert into log_information(command_name,command_type,start_time,end_time,update_number,condition_id)
  values('���ã��̶��绰�����д�洢����','����',v_start_time,systimestamp,o_updated_rows,0);
end if;
--3 ������ϴ������Ϣ����ǳ��ֻ��͹̻���д��ɵ�����
update batch_management set clean_status=1,writeback_time=sysdate,success_count=(success_mobile_count+success_tel_count)
where clean_status=0 and mobile_dial_status=1 and tel_dial_status=1;
--��ȡ���µ�����
o_updated_rows:=sql%rowcount;
if o_updated_rows>0 then
--4 ���û��绰��ɾ����ϴʧ�ܵ绰
--�Ƚ���ϴʧ�ܵĵ绰���뱸�ݱ�
MERGE INTO CUSTOMER_PHONE_CLEANING_BAK T1
USING (SELECT CU.CUSTOMER_ID AS CUSTOMER_ID
             ,CU.PHONE AS PHONE
             ,CU.PHONE_TYPE AS PHONE_TYPE
             ,CU.TEL_CODE AS TEL_CODE
             ,CU.DIAL_STATUS_CODE AS DIAL_STATUS_CODE
             ,CU.BATCH_NO AS BATCH_NO
             ,CU.BEGIN_DIAL AS BEGIN_DIAL
             ,CU.END_DIAL AS END_DIAL
             ,CU.PARTITION_COL AS PARTITION_COL
         FROM CLEANING_PHONE CP,CUSTOMER_PHONE CU
         WHERE EXISTS (
                      SELECT 1
                      FROM BATCH_MANAGEMENT BM
                      WHERE CP.BATCH_CODE = BM.BATCH_CODE
                      AND BM.CLEAN_STATUS = 1
                      )
               AND CP.STATUS = 0
               AND CP.CUSTOMER_ID = CU.CUSTOMER_ID
               AND CP.PHONE = CU.PHONE
      ) T2
ON (T1.CUSTOMER_ID = T2.CUSTOMER_ID AND T1.PHONE = T2.PHONE)
WHEN MATCHED THEN
  UPDATE
     SET T1.PHONE_TYPE = T2.PHONE_TYPE
        ,T1.TEL_CODE = T2.TEL_CODE
        ,T1.DIAL_STATUS_CODE = T2.DIAL_STATUS_CODE
        ,T1.BATCH_NO = T2.BATCH_NO
        ,T1.BEGIN_DIAL = T2.BEGIN_DIAL
        ,T1.END_DIAL = T2.END_DIAL
        ,T1.PARTITION_COL = T2.PARTITION_COL
WHEN NOT MATCHED THEN
  INSERT
    (T1.CUSTOMER_ID
    ,T1.PHONE
    ,T1.PHONE_TYPE
    ,T1.TEL_CODE
    ,T1.DIAL_STATUS_CODE
    ,T1.BATCH_NO
    ,T1.BEGIN_DIAL
    ,T1.END_DIAL
    ,T1.PARTITION_COL)
  VALUES
    (T2.CUSTOMER_ID
    ,T2.PHONE
    ,T2.PHONE_TYPE
    ,T2.TEL_CODE
    ,T2.DIAL_STATUS_CODE
    ,T2.BATCH_NO
    ,T2.BEGIN_DIAL
    ,T2.END_DIAL
    ,T2.PARTITION_COL);
  COMMIT;
  delete from customer_phone where phone in(
      select phone from cleaning_phone where batch_code in(
             select batch_code from batch_management where clean_status=1
      ) and status=0
  );
  o_updated_rows:=sql%rowcount;
  Insert Into Log_Information(Command_Name,Command_Type,Start_Time,End_Time,Update_Number,Condition_Id)
  values('ɾ����ϴʧ�ܵĵ绰����','��ϴ��д',v_start_time,systimestamp,o_updated_rows,0);
  commit;
 --5 �����û�״̬��Ϣ
 merge into customer ct
 Using (
        select cp.customer_ID,max(case when r.phone_type=1 then 1 else 0 end) has_ftele_code
        ,Max(Case When R.Phone_Type=2 Then 1 Else 0 End)Has_Ctele_Code
        ,max(case when substr(r.phone,1,1)='1' then 1 else 0 end)has_mobile_code
        ,max(case when r.phone_type=4 then 1 else 0 end)has_rectele_code
        ,Max(Case When R.Phone_Type Is Null Then 4 Else 3 End)Clear_Status_Code
        From Cleaning_Phone Cp left join Customer_Phone R  on r.customer_id=cp.customer_id
        Where cp.Batch_Code In(Select Batch_Code From Batch_Management Where Clean_Status=1) group by cp.customer_ID
  ) Cp
  On(Ct.Customer_Id=Cp.Customer_Id)
  When Matched Then Update
      Set Ct.Has_Ftele_Code=Cp.Has_Ftele_Code
      ,Ct.Has_Ctele_Code=Cp.Has_Ctele_Code
      ,Ct.Has_Mobile_Code=Cp.Has_Mobile_Code
      ,Ct.Has_Rectele_Code=Cp.Has_Rectele_Code
      ,Ct.Clear_Status_Code=cp.Clear_Status_Code;
  o_updated_rows:=sql%rowcount;
  Insert Into Log_Information(Command_Name,Command_Type,Start_Time,End_Time,Update_Number,Condition_Id)
  values('���¿ͻ�״̬','��ϴ��д',v_start_time,systimestamp,o_updated_rows,0);
  commit;
  --6 ����������Ϣ
  update tasks t set status=2,end_time=v_start_time,success_number=(select count(distinct customer_id) from cleaning_phone where status=1 and batch_code=t.id)
  where id IN (select batch_code from batch_management where clean_status=1);
  --7 ������ϴ��ʷ�б�
  merge into clean_phone_history h
  using (
      select phone,status from cleaning_phone where batch_code in(
            select batch_code from batch_management where clean_status=1
      )
  ) p
  on (h.phone=p.phone)
  when not matched then 
  insert (phone,dial_time,dial_result)
  values (p.phone,v_start_date,p.status);
  --8 ɾ����ϴ��ʱ�����ѻ�д�����ε绰
  delete from cleaning_phone where batch_code in(
      select batch_code from batch_management where clean_status=1
  );
  --9 ��ǳ���д��ɵ�����
  update batch_management set clean_status=2 where clean_status=1;
end if;
--��¼��־
insert into log_information(command_name,command_type,start_time,end_time,update_number,condition_id)
VALUES('��ϴ�����д','��ϴ���',v_start_time,systimestamp,o_updated_rows,0);
commit;
--�쳣����
exception
  when others then
    rollback;
    o_updated_rows:=-1;
    insert into log_information(command_name,command_type,start_time,end_time,update_number,condition_id)
    VALUES('��ϴ�����д','����',v_start_time,systimestamp,o_updated_rows,0);
end;
/

prompt
prompt Creating procedure PROC_IMP_DIAL_RESULT
prompt =======================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.proc_imp_dial_result(
  i_batch_id in number
  ,i_partition_col in number
  ,o_ret_code out number
) as
v_begin_time timestamp;
v_sql varchar2(8000);
v_row_count number(20):=0;
begin
v_begin_time:=systimestamp;
o_ret_code:=0;
if i_partition_col in(-1,0) then
  merge into dx_dial_result dx
  using(
    select distinct max(da.activity_id) over(partition by dr.customer_id) activity_id,dr.customer_id,mobile_phone,family_phone,office_phone,other_phone,dr.status,passed_phone,dial_time_length,dial_time,partition_col
    from(
      select l.*,row_number() over(partition by l.customer_id order by l.dial_time) rn
      from temp_dial_result l left join  dx_dial_result r on l.customer_id=r.customer_id
      where r.customer_id is null
    )dr inner join dx_activity_customer dac on dr.customer_id=dac.customer_id
    inner join dx_activity da on dac.activity_id=da.activity_id
    where rn=1
  ) dr on(dx.customer_id=dr.customer_id and dx.activity_id=dr.activity_id)
  when not matched then
  insert values(dr.activity_id,dr.customer_id,dr.mobile_phone,dr.family_phone,dr.office_phone,'',dr.other_phone,dr.status,dr.passed_phone
  ,dr.dial_time_length,dr.dial_time,dr.partition_col)
  when matched then
  update set
  dx.mobile_phone=dr.mobile_phone
  ,dx.family_phone=dr.family_phone
  ,dx.office_phone=dr.office_phone
  ,dx.other_phone=dr.other_phone
  ,dx.status=dr.status
  ,dx.passed_phone=dr.passed_phone
  ,dx.dial_time_length=dr.dial_time_length
  ,dx.dial_time=dr.dial_time
  ,dx.partition_col=dr.partition_col;
  o_ret_code:=sql%rowcount;
  if o_ret_code>0 then
    insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
    values('��д��������Ϣ', '������Ϣ��д', v_begin_time,systimestamp, o_ret_code, i_batch_id);
  end if;
end if;
commit;
if i_partition_col=-1 then
v_sql:='merge into customer cus using(
  select res.customer_id
  ,case when scs.level2=30 then 3
  when level3=2001  or level4=200209 then 4
  when level2=35 then 6
  else 5 end sale_status_code
  ,FUN_time_length(res.dial_time_length) dial_time_length_code
  ,fun_date_diff(res.dial_time) from_last_sale_time_code
  from(
    select l.customer_id,l.status,l.dial_time_length,l.dial_time,row_number() over(partition by l.customer_id order by l.dial_time) rn
    from temp_dial_result l inner join  dx_dial_result r on l.customer_id=r.customer_id
  ) res left join static_contact_status scs on res.status=scs.con_sta_id
  where res.rn=1
) dr on (cus.customer_id=dr.customer_id)
when matched then
update set
cus.sale_status_code=dr.sale_status_code
,cus.from_last_sale_time_code=dr.from_last_sale_time_code
,cus.dial_time_length_code=dr.dial_time_length_code
,CUS.CLEAR_STATUS_CODE=decode(dr.sale_status_code,3,0,CUS.CLEAR_STATUS_CODE)
,CUS.has_rectele_code=decode(dr.sale_status_code,3,0,CUS.has_rectele_code)
,CUS.has_ftele_code=decode(dr.sale_status_code,3,0,CUS.has_ftele_code)
,CUS.has_ctele_code=decode(dr.sale_status_code,3,0,CUS.has_ctele_code)
,CUS.has_mobile_code=decode(dr.sale_status_code,3,0,CUS.has_mobile_code)';
else
v_sql:='merge into customer partition(PART0'||i_partition_col||') cus using(
  select res.customer_id
  ,case when scs.level2=30 then 3
  when level3=2001  then 4
  when level4=200209 then 5
  when level2=20 then 6
  when level2=35 then 7
  else 2 end sale_status_code
  ,FUN_time_length(res.dial_time_length) dial_time_length_code
  ,fun_date_diff(res.dial_time) from_last_sale_time_code
  from(
    select l.customer_id,l.status,l.dial_time_length,l.dial_time,row_number() over(partition by l.customer_id order by l.dial_time) rn
    from temp_dial_result l inner join  dx_dial_result r on l.customer_id=r.customer_id
    where l.partition_col='||i_partition_col||'
  ) res left join static_contact_status scs on res.status=scs.con_sta_id
  where res.rn=1
) dr on (cus.customer_id=dr.customer_id)
when matched then
update set
cus.sale_status_code=dr.sale_status_code
,cus.from_last_sale_time_code=dr.from_last_sale_time_code
,cus.dial_time_length_code=dr.dial_time_length_code
,CUS.CLEAR_STATUS_CODE=decode(dr.sale_status_code,3,0,CUS.CLEAR_STATUS_CODE)
,CUS.has_rectele_code=decode(dr.sale_status_code,3,0,CUS.has_rectele_code)
,CUS.has_ftele_code=decode(dr.sale_status_code,3,0,CUS.has_ftele_code)
,CUS.has_ctele_code=decode(dr.sale_status_code,3,0,CUS.has_ctele_code)
,CUS.has_mobile_code=decode(dr.sale_status_code,3,0,CUS.has_mobile_code)';
end if;
execute immediate v_sql;
o_ret_code:=sql%rowcount;
insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
values('���¿ͻ�����״̬', '������Ϣ��д', v_begin_time,systimestamp, o_ret_code, i_batch_id);
commit;
delete  from customer_phone
where customer_id in (
    select customer_id from customer where sale_status_code=3
);
v_row_count:=sql%rowcount;
insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
values('ɾ��δ��ͨ�ͻ��绰', '������Ϣ��д', v_begin_time,systimestamp, v_row_count, i_batch_id);
commit;
  exception
    when others then
    o_ret_code:= -1;
     insert into log_information(command_name, command_type, start_time,end_time,  add_number, condition_id)
  VALUES('��д��������Ϣ', '����', v_begin_time,systimestamp, o_ret_code, i_batch_id);
end;
/

prompt
prompt Creating procedure PROC_RPT_DIFF_DATA
prompt =====================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_rpt_diff_data
(
  i_date date,
  i_refresh_rpt in number,
  o_result_code out number
) as
v_start_time timestamp;
v_batch_id varchar2(20);
v_data_count number(20);
begin
v_start_time:=systimestamp;
v_batch_id:=to_char((i_date-to_char(i_date,'D')+1),'yyyy-mm-dd');
if i_refresh_rpt=1 then
  delete from rpt_cpic_diff where batch_id=v_batch_id;
  o_result_code:=0;
else
  select count(1) into v_data_count from rpt_cpic_diff where batch_id=v_batch_id;
  if v_data_count>0 then
    o_result_code:=0;
  else
    o_result_code:=-1;
  end if;
end if;
if o_result_code<>-1 then
--��ֹ�˾�������ݱ��в�������ͳ������
insert into rpt_cpic_diff(batch_id,source_type_code,d_branch_code,policy_status_code,bank_status_code,phone_status_code,clean_status_code,order_col,col_description,data_col)
with
--������ṹ
rpt_structure_base as(
  select distinct
  case l.policy_status_code when 1 then 3
  when 2 then 4
  when 3 then 2
  when 4 then 1
  else l.policy_status_code end policy_status_code
  ,l.bank_status_code
  ,l.phone_status_code
  ,case when l.bank_status_code=1 and l.phone_status_code in (1,2) then l.clean_status_code else 0 end clean_status_code
  from(
  --��һ�㣺����������ر���ṹ
    select distinct  p.policy_status_code
    ,case when p.policy_status_code in (1,2) then k.bank_status_code
    else 0 end bank_status_code
    ,case when p.policy_status_code in (1,2) then t.phone_status_code
    else 0 end phone_status_code,l.clean_status_code
    from d_policy_status p
    ,(select 1 bank_status_code from dual
        union all
        select 2 from dual
      )k
    ,(
        select 1 phone_status_code from dual
        union all
        select 2 from dual
        union all
        select 3 from dual
        union all
        select 4 from dual
      ) t
      ,(
        select 1 clean_status_code from dual
        union all
        select 2 from dual
      ) l
  --��һ�����
  )l
)
--������������ṹ
,rpt_structure as (
select l.*,r.col_description from (
select distinct  s.source_type_code,b.d_branch_code
  ,l.policy_status_code,l.bank_status_code,l.phone_status_code,l.clean_status_code
  ,(l.policy_status_code||l.bank_status_code||l.phone_status_code||l.clean_status_code) order_col
  from
  (
    select 0 source_type_code from dual
    union all
    select 1 from dual
  )s
  ,(select distinct d_branch_code from d_branch_info) b
  ,(
  --����ϴ����
  select * from rpt_structure_base
  where policy_status_code in(3,4) and bank_status_code=1 and phone_status_code in(1,2)
  union all
  --�ֵ绰����
  select distinct policy_status_code,bank_status_code,phone_status_code,0
  from rpt_structure_base where policy_status_code in(3,4)
  union all
  --����������
  select distinct policy_status_code,bank_status_code,0,0
  from rpt_structure_base where policy_status_code in(3,4)
  union all
  --�ֱ�������
  select distinct policy_status_code,0,0,0
  from rpt_structure_base
  union all
  --������Ϣ
  select 0,1,0,0 from dual
  union all
  select 0,2,0,0 from dual
  union all
  select 0,3,0,0 from dual
  ) l
  ) l inner join
  (
    select '0100' order_col,'��ȡʱ��' col_description from dual
    union all
    select '0200','ԭʼ����' from dual
    union all
    select '0300','�ɷ�������' from dual
    union all
    select '1000','�ޱ�������' from dual
    union all
    select '2000','��������Ч����' from dual
    union all
    select '3000','������Ч����' from dual
    union all
    select '3100','-�������˺�' from dual
    union all
    select '3110','--���ֻ�' from dual
    union all
    select '3111','---��ϴ�ɹ�' from dual
    union all
    select '3112','---δ��ϴ' from dual
    union all
    select '3120','--���ֻ����й̻���' from dual
    union all
    select '3121','---��ϴ�ɹ�' from dual
    union all
    select '3122','---δ��ϴ' from dual
    union all
    select '3130','--��ϴʧ��' from dual
    union all
    select '3140','--�޵绰��绰����' from dual
    union all
    select '3200','-�������˺�' from dual
    union all
    select '3210','--���ֻ���' from dual
    union all
    select '3220','--���ֻ����й̻���' from dual
    union all
    select '3230','--��ϴʧ��' from dual
    union all
    select '3240','--�޵绰��绰����' from dual
    union all
    select '4000','������������' from dual
    union all
    select '4100','-�������˺�' from dual
    union all
    select '4110','--���ֻ�' from dual
    union all
    select '4111','---��ϴ�ɹ�' from dual
    union all
    select '4112','---δ��ϴ' from dual
    union all
    select '4120','--���ֻ����й̻���' from dual
    union all
    select '4121','---��ϴ�ɹ�' from dual
    union all
    select '4122','---δ��ϴ' from dual
    union all
    select '4130','--��ϴʧ��' from dual
    union all
    select '4140','--�޵绰��绰����' from dual
    union all
    select '4200','-�������˺�' from dual
    union all
    select '4210','--���ֻ���' from dual
    union all
    select '4220','--���ֻ����й̻���' from dual
    union all
    select '4230','--��ϴʧ��' from dual
    union all
    select '4240','--�޵绰��绰����' from dual
  ) r on l.order_col=r.order_col
)
--��ȡ���һ�ε���������͹¶���������Ϣ
,w_latest_imp as(
  select t.* from(
  select source_type_code,branch_code,to_number(to_char(create_time,'yyyymmdd')) create_time,initial_number,success_number,id task_id
  ,row_number() over(partition by source_type_code,branch_code order by create_time) task_row
  from tasks where task_type=5 and source_type_code<2 and status=2
  ) t where task_row=1
)
--���������������з���ͳ�ƣ�����ʱ�������������������ľۺ�
,w_rpt_source as (
  --�ڶ��㣺����ͳ��
  select source_type_code,d_branch_code,policy_status_code,bank_status_code,phone_status_code,clean_status_code
  ,count(customer_id) data_col
  from(
    --��һ�㣺׼��������
    select l.source_type_code,l.branch_code d_branch_code,policy_status_code
    ,bank_status_code, phone_status_code
    ,case when bank_status_code=1 and phone_status_code in(1,2) then clean_status_code
    else 0 end clean_status_code
    ,l.customer_id
    from (
    --���˿ͻ���Ϣ
      select customer_id,imp.source_type_code,imp.branch_code
      ,case policy_status_code when 4 then 1
      when 3 then 2
      when 2 then 4
      when 1 then 3
      end policy_status_code
      ,case when policy_status_code<3 then 2-bank_status_code
      else 0 end bank_status_code
      ,case when policy_status_code<3 and  has_mobile_code =1 then 1
      when policy_status_code<3  and (has_rectele_code+has_ftele_code+has_ctele_code)>0 then 2
      when policy_status_code<3  and clear_status_code>0 then 3
      when policy_status_code<3  then 4
      else 0 end phone_status_code
      ,case when (has_rectele_code+has_ftele_code+has_ctele_code+has_mobile_code)>0 and clear_status_code=3 then 1
      when (has_rectele_code+has_ftele_code+has_ctele_code+has_mobile_code)>0 and clear_status_code<3 then 2
      else 0 end clean_status_code
      from customer cus
      inner join w_latest_imp imp on cus.task_id=imp.task_id
      --where source_type_code <2
    )l --inner join d_branch_info r on l.branch_code=r.branch_code
    --��һ�����
  ) l group by source_type_code, d_branch_code, policy_status_code, bank_status_code, phone_status_code, clean_status_code
--�ڶ������
)
--�����м����ɣ���ʼ��ѯ
select
v_batch_id batch_id,s.*,nvl(d.data_col,0) data_col from
rpt_structure s left join (
--����ϴ״̬���з���ͳ��(ֻͳ�Ʊ�����������Ч�ġ����е绰��)
select * from w_rpt_source where policy_status_code in(3,4) and phone_status_code in (1,2)
and clean_status_code<>0
union all
--���绰״̬���з���ͳ��(ֻͳ�Ʊ�����������Ч��)
(select source_type_code, d_branch_code, policy_status_code, bank_status_code, phone_status_code
  ,0 clean_status_code
    ,sum(nvl(data_col,0)) data_col
    from w_rpt_source  where policy_status_code in(3,4) --and phone_status_code<>0
    group by source_type_code, d_branch_code, policy_status_code, bank_status_code, phone_status_code
)
union all
--������״̬���з���ͳ��(ֻͳ�Ʊ�����������Ч��)
 (select source_type_code, d_branch_code, policy_status_code
  , bank_status_code
  ,0 phone_status_code
  ,0 clean_status_code
  ,sum(nvl(data_col,0)) data_col
  from w_rpt_source  where policy_status_code in(3,4)
  group by source_type_code, d_branch_code, policy_status_code, bank_status_code
)
union all
--������״̬����ͳ��
 (select source_type_code, d_branch_code
  ,policy_status_code
  ,0 bank_status_code
  ,0 phone_status_code
  ,0 clean_status_code
  ,sum(nvl(data_col,0)) data_col
  from w_rpt_source
  group by source_type_code, d_branch_code, policy_status_code
  )
union all
--ͳ�ƿ�ʼʱ�䡢�����ͳɹ�����
  (
    select source_type_code,branch_code d_branch_code
    ,0 policy_status_code
    ,data_type bank_status_code
    ,0 phone_status_code
    ,0 clean_status_code
    ,case data_type when 1 then create_time
    when 2 then initial_number
    when 3 then success_number
    end data_col
    from w_latest_imp imp
    ,(
      select 1 data_type from dual
      union all
      select 2 from dual
      union all
      select 3 from dual
    ) r
  )
) d on s.source_type_code=d.source_type_code
  and s.d_branch_code=d.d_branch_code
  and s.policy_status_code=d.policy_status_code
  and s.bank_status_code=d.bank_status_code
  and s.phone_status_code=d.phone_status_code
  and s.clean_status_code=d.clean_status_code
  --where s.source_type_code=0 and s.d_branch_code=21
  order by s.order_col;
end if;
commit;--�ύ
--��¼��־
insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  VALUES('��������·ֹ�˾�������ݱ�������', '��������', v_start_time,systimestamp, 1, 0);
--�쳣����
exception
  when others then
    rollback;
  insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  values('��������·ֹ�˾�������ݱ�������', '����', v_start_time,systimestamp, 0, 0);
  o_result_code:=-1;
end ;
/

prompt
prompt Creating procedure PROC_RPT_SCHEDULE
prompt ====================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_rpt_schedule
(
  i_date date,
  i_refresh_rpt in number,
  o_result_code out number
) as
v_start_time timestamp;
v_batch_id varchar2(20);
begin
v_start_time:=systimestamp;
v_batch_id:=to_char((i_date-to_char(i_date,'D')+1),'yyyy-mm-dd');
merge into rpt_cpic_schedule rpt using(
  select v_batch_id batch_id,regexp_replace(row_name,'�ֹ�˾','') row_name,nvl(orphan,0) orphan,nvl(orphan,0)*2 orphan_persons,nvl(yinbao,0) yinbao,nvl(yinbao,0)*2 yinbao_persons,10000 avg_amount
  ,(nvl(orphan,0)+nvl(yinbao,0))*24 new_amount,(nvl(orphan,0)+nvl(yinbao,0))*168 std_amount
  from
  (
    select '�ϼ�' row_name
    ,sum(case when source_type_code=0 then 1 else 0 end) orphan
    ,sum(case when source_type_code=1 then 1 else 0 end) yinbao
    from customer
    where clear_status_code=3 and sale_status_code=0 or from_last_sale_time_code>2
    union all
    select d.d_branch_name row_name
    ,sum(case when source_type_code=0 then 1 else 0 end) orphan
    ,sum(case when source_type_code=1 then 1 else 0 end) yinbao
    from d_branch_info d left join customer cus
    on cus.branch_code=d.branch_code
    where (clear_status_code=3 and sale_status_code=0 or from_last_sale_time_code>2) or cus.customer_id is null
    group by d.d_branch_name
  )
)n on(rpt.batch_id=n.batch_id and rpt.row_name=n.row_name)
when matched then
update set
rpt.orphan=n.orphan,rpt.orphan_persons=n.orphan_persons,rpt.yinbao=n.yinbao,rpt.yinbao_persons=n.yinbao_persons,rpt.avg_amount=n.avg_amount
,rpt.new_amount=n.new_amount,rpt.std_amount=n.std_amount
when not matched then
insert values(n.batch_id,n.row_name,n.orphan,n.orphan_persons,n.yinbao,n.yinbao_persons,n.avg_amount,n.new_amount,n.std_amount);
o_result_code:=sql%rowcount;
--��¼��־
insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  values('�����������Ŀ�滮��������', '��������', v_start_time,systimestamp, o_result_code, 0);
commit;
--�쳣����
exception
  when others then
    rollback;
    o_result_code:=-1;
  insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  values('�����������Ŀ�滮��������', '����', v_start_time,systimestamp, o_result_code, 0);
end ;
/

prompt
prompt Creating procedure PROC_RPT_STORAGE
prompt ===================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_rpt_storage
(
  i_date date,
  i_refresh_rpt in number,
  o_result_code out number
) as
v_start_time timestamp:=systimestamp;
v_batch_id varchar2(20);
v_data_count number(20);
begin
v_batch_id:=to_char((i_date-to_char(i_date,'D')+1),'yyyy-mm-dd');
if i_refresh_rpt=1 then
  delete from rpt_cpic_storage where batch_id=v_batch_id;
  o_result_code:=0;
else
  select count(1) into v_data_count from rpt_cpic_storage where batch_id=v_batch_id;
  if v_data_count>0 then
    o_result_code:=0;
  else
    o_result_code:=-1;
  end if;
end if;
if o_result_code<>-1 then
--�����ݲֿ���в������²ֿ�ͳ������
insert into rpt_cpic_storage(
  BATCH_ID,
  SOURCE_TYPE_CODE,
  D_BRANCH_CODE,
  PROJECT_NAME,
  PHONE_TYPE,
  LEVEL_A,
  LEVEL_B,
  LEVEL_C,
  LEVEL_D,
  LEVEL_E,
  LEVEL_F,
  LEVEL_G,
  TOTAL_LEFT,
  LEVEL_X,
  LEVEL_Y,
  LEVEL_Z,
  TOTAL_RIGHT,
  total_count,
  create_time,
  status
)
--���ݲֿⱨ���¶�����������
with cpic_storage as(
--���ɱ�׼��ʽ�ֿⱨ��
select l.*
  ,nvl(level_a,0) level_a
  ,nvl(level_b,0) level_b
  ,nvl(level_c,0) level_c
  ,nvl(level_d,0) level_d
  ,nvl(level_e,0) level_e
  ,nvl(level_f,0) level_f
  ,nvl(level_g,0) level_g
  --��С��
  ,(nvl(level_a,0)+nvl(level_b,0)+nvl(level_c,0)+nvl(level_d,0)+nvl(level_e,0)+nvl(level_f,0)+nvl(level_g,0)) total_left
  ,nvl(level_x,0) level_x
  ,nvl(level_y,0) level_y
  ,nvl(level_z,0) level_z
    --��С��
  ,(nvl(level_x,0)+nvl(level_y,0)+nvl(level_z,0)) total_right
from(
--��������ṹ
select s.source_type_code,b.d_branch_code,t.project_name,t.phone_type
from d_source_from_info s
,(
    select distinct d_branch_code from  d_branch_info
  ) b
,(
    select project_name,phone_type from (
      select '11 call' project_name from dual
      union all
      select '2>=2 call'  from dual
      union all
      select '3�ӱ�'  from dual
      ) p
      ,(
          select '1�ֻ�' phone_type from dual
          union all
          select '2�̻�'  from dual
        ) t
    union all
     select project_name,phone_type from (
       select '5��ȫ' project_name  from dual
    ),
    (
    select '1�޵绰' phone_type  from dual
    union all
    select '2�պ�'  from dual
    union all
    select '3����δ��ͨ'  from dual
    )
) t

 --��������ṹ����
) l left join
(
--�����㣺����ͳ��
select source_type_code,d_branch_code
  ,project_name
  ,phone_type
  ,sum(level_a) level_a
  ,sum(level_b) level_b
  ,sum(level_c) level_c
  ,sum(level_d) level_d
  ,sum(level_e) level_e
  ,sum(level_f) level_f
  ,sum(level_g) level_g
  ,sum(level_x) level_x
  ,sum(level_y) level_y
  ,sum(level_z) level_z
  from (
--�ڶ��㣺�ۺϳ���Ŀ��
  select source_type_code,d_branch_code
  ,case when has_phone=1 and sale_status_code=0 then '11 call'
   when has_phone=1 and sale_status_code<16  then '2>=2 call'
   when has_phone=1 and sale_status_code>15 then '3�ӱ�'
  else '5��ȫ'
  end project_name
  ,case when has_mobile_code=1 then '1�ֻ�'
  when has_phone=1 then '2�̻�'
  when sale_status_code=0 and clear_status_code=0 then '1�޵绰'
  when sale_status_code=0 and clear_status_code=4 then '2�պ�'
  else '3����δ��ͨ'
  end phone_type
  ,case when l.level_code=0 then 1 else 0 end level_a
  ,case when l.level_code=1 then 1 else 0 end level_b
  ,case when l.level_code=2 then 1 else 0 end level_c
  ,case when l.level_code=3 then 1 else 0 end level_d
  ,case when l.level_code=4 then 1 else 0 end level_e
  ,case when l.level_code=5 then 1 else 0 end level_f
  ,case when l.level_code=6 then 1 else 0 end level_g
  --��������
  ,case when source_type_code=1 and l.level_code=7 and policy_status_code=2 and age_zone_code between 1 and 5 then 1
  --����
  when source_type_code<>1 and l.level_code=7 and policy_status_code<4  then 1
  else 0 end level_x
  --��������
  ,case when source_type_code=1 and l.level_code=7 and policy_status_code=2 and age_zone_code in (0,6) then 1
  --������Դ
  when source_type_code<>1 and l.level_code=7 and policy_status_code=4   then 1
  else 0 end level_y
  --��������
  ,case when l.level_code=7 and source_type_code=1 and  policy_status_code>2 then 1
  --������Դ
  else 0 end level_z
  from(
    --��һ�㣺ѡ����Ҫʹ�õ��в����㲿����Ϣ
    select source_type_code,r.d_branch_code
    --�Ƿ��е绰
    ,case when clear_status_code between 1 and 3 then 1 else 0 end has_phone
    ,sale_status_code,clear_status_code,level_code,
    has_mobile_code,policy_status_code,age_zone_code
    from customer l inner join d_branch_info r on l.branch_code=r.branch_code
    where l.orphan_status_code<>1
    --��һ�����
  ) l
--�ڶ������
) group by source_type_code, d_branch_code, project_name, phone_type
--���������
) r on l.source_type_code=r.source_type_code
and l.d_branch_code=r.d_branch_code
and l.project_name=r.project_name
and l.phone_type=r.phone_type
)
,cpic_storage_count as(
--����С����
select source_type_code,d_branch_code,project_name
  ,'4 С��' phone_type
  ,sum(level_a) level_a
  ,sum(level_b) level_b
  ,sum(level_c) level_c
  ,sum(level_d) level_d
  ,sum(level_e) level_e
  ,sum(level_f) level_f
  ,sum(level_g) level_g
  ,sum(total_left) total_left
  ,sum(level_x) level_x
  ,sum(level_y) level_y
  ,sum(level_z) level_z
  ,sum(total_right) total_right
from cpic_storage group by source_type_code, d_branch_code, project_name
)
--���������Դ�����ֹ�˾��ͳ�Ʊ���
,cpic_storage_branch as(
--�����ܼ���
select source_type_code,d_branch_code
  ,'6 ��' project_name
  ,'4 ��' phone_type
  ,sum(level_a) level_a
  ,sum(level_b) level_b
  ,sum(level_c) level_c
  ,sum(level_d) level_d
  ,sum(level_e) level_e
  ,sum(level_f) level_f
  ,sum(level_g) level_g
  ,sum(total_left) total_left
  ,sum(level_x) level_x
  ,sum(level_y) level_y
  ,sum(level_z) level_z
  ,sum(total_right) total_right
from cpic_storage_count group by source_type_code, d_branch_code
union all
--��������ܼ���
select source_type_code,d_branch_code
  ,'4 ��������' project_name
  ,'�ϼ�' phone_type
  ,sum(level_a) level_a
  ,sum(level_b) level_b
  ,sum(level_c) level_c
  ,sum(level_d) level_d
  ,sum(level_e) level_e
  ,sum(level_f) level_f
  ,sum(level_g) level_g
  ,sum(total_left) total_left
  ,sum(level_x) level_x
  ,sum(level_y) level_y
  ,sum(level_z) level_z
  ,sum(total_right) total_right
from cpic_storage_count
where project_name<>'5��ȫ'
group by source_type_code, d_branch_code
--����С����
union all
select * from cpic_storage_count
--����δС����
union all
select * from cpic_storage
)
--������ʱ���������ʼ��ѯ
select v_batch_id batch_id,t.*
--�����ܼ���
,(total_left+total_right) total_count
,v_start_time create_time
,1 status
from (
select source_type_code,-1 d_branch_code
  ,project_name
  ,phone_type
  ,sum(level_a) level_a
  ,sum(level_b) level_b
  ,sum(level_c) level_c
  ,sum(level_d) level_d
  ,sum(level_e) level_e
  ,sum(level_f) level_f
  ,sum(level_g) level_g
  ,sum(total_left) total_left
  ,sum(level_x) level_x
  ,sum(level_y) level_y
  ,sum(level_z) level_z
  ,sum(total_right) total_right
from cpic_storage_branch GROUP BY source_type_code, -1, project_name, phone_type
union all
select * from cpic_storage_branch
)t;
--order by source_type_code, d_branch_code, project_name, phone_type
end if;
commit;--�ύ
o_result_code:=sql%rowcount;
--��¼��־
insert into log_information(command_name, command_type, start_time,end_time,  add_number, condition_id)
  VALUES('��������²ֿ��嵥��������', '��������', v_start_time,systimestamp, o_result_code, 0);
--�쳣����
exception
  when others then
    rollback;
    o_result_code:=-1;
  insert into log_information(command_name, command_type, start_time,end_time,  add_number, condition_id)
  values('��������²ֿ��嵥��������', '����', v_start_time,systimestamp, o_result_code, 0);
  o_result_code:=-1;
end ;
/

prompt
prompt Creating procedure PROC_RPT_TICKET
prompt ==================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_rpt_ticket
(
  i_date date,
  i_refresh_rpt in number,
  o_result_code out number
) as
v_start_time timestamp;
v_batch_id varchar2(20);
begin
v_start_time:=systimestamp;
v_batch_id:=to_char((i_date-to_char(i_date,'D')+1),'yyyy-mm-dd');
merge into rpt_cpic_ticket rpt using(
select v_batch_id batch_id,to_char(level_name) row_name,source_type_code,d_branch_code,online_deal,trace_high,trace_hesitate,trace_busy,trace_else
,refuse_diff,refuse_unaccept,refuse_shutdown,refuse_else,invalid_lover,invalid_parent,invalid_family,invalid_friend
,invalid_nobody,invalid_null
,case when total_persons>0 then passed_persons/total_persons else 0 end passed_pct
,case when total_persons>0 then contacted_persons/total_persons else 0 end contacted_pct
from(
select level_code level_name,source_type_code,d_branch_code
,sum(case contact_code when 1 then persons else 0 end) online_deal
,sum(case contact_code when 2 then persons else 0 end) trace_high
,sum(case contact_code when 3 then persons else 0 end) trace_hesitate
,sum(case contact_code when 4 then persons else 0 end) trace_busy
,sum(case contact_code when 5 then persons else 0 end) trace_else
,sum(case contact_code when 6 then persons else 0 end) refuse_diff
,sum(case contact_code when 7 then persons else 0 end) refuse_unaccept
,sum(case contact_code when 8 then persons else 0 end) refuse_shutdown
,sum(case contact_code when 9 then persons else 0 end) refuse_else
,sum(case contact_code when 10 then persons else 0 end) invalid_lover
,sum(case contact_code when 11 then persons else 0 end) invalid_parent
,sum(case contact_code when 12 then persons else 0 end) invalid_family
,sum(case contact_code when 13 then persons else 0 end) invalid_friend
,sum(case contact_code when 14 then persons else 0 end) invalid_nobody
,sum(case contact_code when 15 then persons else 0 end) invalid_null
,sum(case when contact_code<14 then persons else 0 end) passed_persons
,sum(case when contact_code<10 then persons else 0 end) contacted_persons
,sum(persons) total_persons
from
(
  select l.source_type_code,l.d_branch_code,l.level_code,l.contact_code
  ,count(cus.source_type_code) persons from
  (
    select source_type_code,d_branch_code,branch_code,level_code,cc.contact_code
    from d_source_from_info,d_branch_info,d_customer_level
    ,(
           select 1 contact_code from dual
           union all
           select 2 contact_code from dual
           union all
           select 3 contact_code from dual
           union all
           select 6 contact_code from dual
           union all
           select 7 contact_code from dual
           union all
           select 9 contact_code from dual
           union all
           select 13 contact_code from dual
           union all
           select 15 contact_code from dual
     ) cc
    where level_code<7
  )l
  left join(
    select source_type_code,branch_code,level_code
    ,case when cus.sale_status_code>15 then 1
    when cus.sale_status_code>13 then 2
    when cus.sale_status_code>11 then 3
    when cus.sale_status_code=8 then 6
    when cus.sale_status_code=9 then 7
    when cus.sale_status_code in(7,10,11) then 9
    when cus.sale_status_code in(5,6) then 13
    when cus.sale_status_code=4 then 15 end contact_code
    from customer cus
    where  cus.sale_status_code>3 and cus.level_code<7
  ) cus on(l.source_type_code=cus.source_type_code and l.branch_code=cus.branch_code
  and l.level_code=cus.level_code and l.contact_code=cus.contact_code)
  group by l.source_type_code, l.d_branch_code,l.level_code, l.contact_code
) group by source_type_code, d_branch_code,level_code
)
) n on(rpt.BATCH_ID=n.BATCH_ID and rpt.row_name =n.row_name and rpt.SOURCE_TYPE_CODE =n.SOURCE_TYPE_CODE and rpt.D_BRANCH_CODE=n.D_BRANCH_CODE)
when matched then
update set
rpt.ONLINE_DEAL=n.ONLINE_DEAL
,rpt.TRACE_HIGH =n.TRACE_HIGH
,rpt.TRACE_HESITATE =n.TRACE_HESITATE
,rpt.TRACE_BUSY =n.TRACE_BUSY
,rpt.TRACE_ELSE =n.TRACE_ELSE
,rpt.REFUSE_DIFF=n.REFUSE_DIFF
,rpt.REFUSE_UNACCEPT=n.REFUSE_UNACCEPT
,rpt.REFUSE_SHUTDOWN=n.REFUSE_SHUTDOWN
,rpt.REFUSE_ELSE=n.REFUSE_ELSE
,rpt.INVALID_LOVER=n.INVALID_LOVER
,rpt.INVALID_PARENT =n.INVALID_PARENT
,rpt.INVALID_FAMILY =n.INVALID_FAMILY
,rpt.INVALID_FRIEND =n.INVALID_FRIEND
,rpt.INVALID_NOBODY =n.INVALID_NOBODY
,rpt.INVALID_NULL =n.INVALID_NULL
,rpt.passed_pct =n.passed_pct
,rpt.contacted_pct=n.contacted_pct
when not matched then
insert values(n.batch_id,n.row_name,n.source_type_code,n.d_branch_code,n.online_deal,n.trace_high,n.trace_hesitate,n.trace_busy,n.trace_else,n.refuse_diff,n.refuse_unaccept,n.refuse_shutdown,n.refuse_else,n.invalid_lover,n.invalid_parent,n.invalid_family,n.invalid_friend,n.invalid_nobody,n.invalid_null,n.passed_pct,n.contacted_pct)
;
o_result_code:=sql%rowcount;
--��¼��־
insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  values('��������²����������Ǳ�������', '��������', v_start_time,systimestamp, o_result_code, 0);
commit;
--�쳣����
exception
  when others then
    rollback;
    o_result_code:=-1;
  insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  values('��������²����������Ǳ�������', '����', v_start_time,systimestamp, o_result_code, 0);
end ;
/

prompt
prompt Creating procedure PROC_RPT_TRACE
prompt =================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_rpt_trace
(
  i_date date,
  i_refresh_rpt in number,
  o_result_code out number
) as
v_start_time timestamp;
v_batch_id varchar2(20);
begin
v_start_time:=systimestamp;
v_batch_id:=to_char((i_date-to_char(i_date,'D')+1),'yyyy-mm-dd');
merge into rpt_cpic_trace rpt using(
    select v_batch_id batch_id,l.level_name row_name,cus.source_type_code,d.d_branch_code
    ,sum(case when sale_status_code>4 then 1 else 0 end) contact_persons
    ,sum(case when sale_status_code>11 then 1 else 0 end) estimate_persons
    ,sum(case when sale_status_code>15 then 1 else 0 end) deal_persons
    ,sum(case when sale_status_code>3 then 1 else 0 end) total_persons
    from  customer cus inner join d_branch_info d on cus.branch_code=d.branch_code
    inner join d_customer_level l on cus.level_code=l.level_code
    where cus.sale_status_code>3 and cus.level_code<7
    group by l.level_name, cus.source_type_code, d.d_branch_code
) n on(rpt.batch_id=n.batch_id and rpt.row_name=n.row_name and rpt.source_type_code=n.source_type_code and rpt.d_branch_code=n.d_branch_code)
when matched then
update set
rpt.contact_pct =n.contact_persons
,rpt.ESTIMATE_PCT=n.estimate_persons
,rpt.DEAL_PCT=n.deal_persons
,rpt.progress_pct=n.total_persons
when not matched then
insert values(n.batch_id,n.row_name,n.source_type_code,n.d_branch_code,n.contact_persons,n.estimate_persons,n.deal_persons,n.total_persons);
--��¼��־
o_result_code:=sql%rowcount;
insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  values('�����������Ŀ׷�ٱ�������', '��������', v_start_time,systimestamp, o_result_code, 0);
commit;
--�쳣����
exception
  when others then
    rollback;
    o_result_code:=-1;
  insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  values('�����������Ŀ׷�ٱ�������', '����', v_start_time,systimestamp, o_result_code, 0);
end ;
/

prompt
prompt Creating procedure PROC_RPT_2CALL
prompt =================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_rpt_2call
(
  i_date date,
  i_refresh_rpt in number,
  o_result_code out number
) as
v_start_time timestamp;
v_batch_id varchar2(20);
v_data_count number(20);
begin
v_start_time:=systimestamp;
v_batch_id:=to_char((i_date-to_char(i_date,'D')+1),'yyyy-mm-dd');
if i_refresh_rpt=1 then
  delete from RPT_CPIC_2call where batch_id=v_batch_id;
  o_result_code:=0;
else
  select count(1) into v_data_count from RPT_CPIC_2call where batch_id=v_batch_id;
  if v_data_count>0 then
    o_result_code:=0;
  else
    o_result_code:=-1;
  end if;
end if;
if o_result_code<>-1 then
--�����ݲֿ���в������²ֿ�ͳ������
INSERT INTO RPT_CPIC_2call
  (
    BATCH_ID,
    SOURCE_TYPE_CODE,
    d_branch_code,
    from_last_sale_time_code,
    dial_time_length_code,
    PHONE_TYPE,
    LEVEL_A,
    LEVEL_B,
    LEVEL_C,
    LEVEL_D,
    LEVEL_E,
    LEVEL_F,
    LEVEL_G,
    TOTAL_LEFT,
    LEVEL_X,
    LEVEL_Y,
    LEVEL_Z,
    TOTAL_RIGHT,
    TOTAL_COUNT,
    CREATE_TIME,
    status
  )
with cpic_2call as(
--���ɱ�׼��ʽ�ֿⱨ��
select l.*
  ,nvl(level_a,0) level_a
  ,nvl(level_b,0) level_b
  ,nvl(level_c,0) level_c
  ,nvl(level_d,0) level_d
  ,nvl(level_e,0) level_e
  ,nvl(level_f,0) level_f
  ,nvl(level_g,0) level_g
  --��С��
  ,(nvl(level_a,0)+nvl(level_b,0)+nvl(level_c,0)+nvl(level_d,0)+nvl(level_e,0)+nvl(level_f,0)+nvl(level_g,0)) total_left
  ,nvl(level_x,0) level_x
  ,nvl(level_y,0) level_y
  ,nvl(level_z,0) level_z
    --��С��
  ,(nvl(level_x,0)+nvl(level_y,0)+nvl(level_z,0)) total_right
from(
--��������ṹ
  select distinct s.source_type_code,b.d_branch_code,p.from_last_sale_time_code
  ,case when p.from_last_sale_time_code<2 then l.dial_time_length_code
  else 0 end dial_time_length_code
  ,t.phone_type
  from d_source_from_info s
  ,(
      select distinct d_branch_code from  d_branch_info
    ) b
  ,d_sale_period p
  ,d_dial_time_length l
  ,(
    select 1 phone_type from dual
    union all
    select 2  from dual
  )t   where p.from_last_sale_time_code>0
 --��������ṹ����
) l left join
(
--�����㣺����ͳ��
select source_type_code,d_branch_code
  ,from_last_sale_time_code,dial_time_length_code
  ,phone_type
  ,sum(level_a) level_a
  ,sum(level_b) level_b
  ,sum(level_c) level_c
  ,sum(level_d) level_d
  ,sum(level_e) level_e
  ,sum(level_f) level_f
  ,sum(level_g) level_g
  ,sum(level_x) level_x
  ,sum(level_y) level_y
  ,sum(level_z) level_z
  from (
--�ڶ��㣺�ۺϳ���Ŀ��
  select source_type_code,d_branch_code
  ,from_last_sale_time_code,dial_time_length_code
  ,phone_type
  ,case when l.level_code=0 then 1 else 0 end level_a
  ,case when l.level_code=1 then 1 else 0 end level_b
  ,case when l.level_code=2 then 1 else 0 end level_c
  ,case when l.level_code=3 then 1 else 0 end level_d
  ,case when l.level_code=4 then 1 else 0 end level_e
  ,case when l.level_code=5 then 1 else 0 end level_f
  ,case when l.level_code=6 then 1 else 0 end level_g
  --������Ч
  ,case when l.level_code=7 and policy_status_code<4 then 1
  else 0 end level_x
  --�ޱ���
  ,case when l.level_code=7 and policy_status_code=4 then 1
  else 0 end level_y
  --�¶�������
  ,0 level_z
  from(
    --��һ�㣺ѡ����Ҫʹ�õ��в����㲿����Ϣ
    select source_type_code,r.d_branch_code
    ,case when l.from_last_sale_time_code=0 then 1 else l.from_last_sale_time_code end from_last_sale_time_code
    ,case when l.from_last_sale_time_code<2 then l.dial_time_length_code
    else 0 end dial_time_length_code
    ,case has_mobile_code when 1 then  1
    else 2 end phone_type
    ,level_code,policy_status_code,orphan_status_code
    from customer l inner join d_branch_info r on l.branch_code=r.branch_code
    where l.sale_status_code>0 and l.clear_status_code between 1 and 3 and l.orphan_status_code<>1
    --��һ�����
  ) l
--�ڶ������
) group by source_type_code, d_branch_code, from_last_sale_time_code, dial_time_length_code, phone_type
--���������
) r on l.source_type_code=r.source_type_code
and l.d_branch_code=r.d_branch_code
and l.from_last_sale_time_code=r.from_last_sale_time_code
and l.dial_time_length_code=r.dial_time_length_code
and l.phone_type=r.phone_type
)
,cpic_2call_count as(
--����С����
select source_type_code,d_branch_code,from_last_sale_time_code, dial_time_length_code
  ,3 phone_type
  ,sum(level_a) level_a
  ,sum(level_b) level_b
  ,sum(level_c) level_c
  ,sum(level_d) level_d
  ,sum(level_e) level_e
  ,sum(level_f) level_f
  ,sum(level_g) level_g
  ,sum(total_left) total_left
  ,sum(level_x) level_x
  ,sum(level_y) level_y
  ,sum(level_z) level_z
  ,sum(total_right) total_right
from cpic_2call group by source_type_code, d_branch_code, from_last_sale_time_code, dial_time_length_code, 3
)
--������ʱ���������ʼ��ѯ
--���������Դ�����ֹ�˾��ͳ�Ʊ���

--�����ܼ���
select
v_batch_id batch_id ,t.*
--�����ܼ���
,(total_left+total_right) total_count
,v_start_time create_time
,1 status
from (
select source_type_code,d_branch_code
  ,6 from_last_sale_time_code
  ,0 dial_time_length_code
  ,1 phone_type
  ,sum(level_a) level_a
  ,sum(level_b) level_b
  ,sum(level_c) level_c
  ,sum(level_d) level_d
  ,sum(level_e) level_e
  ,sum(level_f) level_f
  ,sum(level_g) level_g
  ,sum(total_left) total_left
  ,sum(level_x) level_x
  ,sum(level_y) level_y
  ,sum(level_z) level_z
  ,sum(total_right) total_right
from cpic_2call_count GROUP BY source_type_code, d_branch_code
--����С����
union all
select * from cpic_2call_count
--����δС����
union all
select * from cpic_2call
)t;
end if;
commit;--�ύ
--��¼��־
insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  VALUES('���������2call��������', '��������', v_start_time,systimestamp, 1, 0);
--�쳣����
exception
  when others then
    rollback;
  insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  values('���������2call��������', '����', v_start_time,systimestamp, 0, 0);
  o_result_code:=-1;
end ;
/

prompt
prompt Creating procedure PROC_RPT_BQ_ANALYSIS
prompt =======================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_rpt_bq_analysis
(
  i_date date,
  i_refresh_rpt in number,
  o_result_code out number
) as
v_start_time timestamp;
v_batch_id varchar2(20);
begin
v_start_time:=systimestamp;
v_batch_id:=to_char((i_date-to_char(i_date,'D')+1),'yyyy-mm-dd');
merge into rpt_cpic_bq_analysis rpt using(
select v_batch_id batch_id, base.level_name row_name,source_type_code,d_branch_code
,nvl(l.need_bq,0) need_bq
,nvl(l.already_bq,0) already_bq
,case when nvl(l.need_bq,0)>0 then nvl(l.already_bq,0)/nvl(l.need_bq,0) else 0 end bq_pct
,nvl(l.dial_bq,0) dial_bq
,nvl(l.contact_customers,0) contact_pct
,nvl(r.deal_count,0) deal_count
,nvl(r.charge_amount,0) charge_amount
,case when l.dial_bq>0 and nvl(l.contact_customers,0)/l.dial_bq>0.75 then nvl(r.charge_amount,0)*0.035
when l.dial_bq>0 and nvl(l.contact_customers,0)/l.dial_bq>=0.6 then nvl(r.charge_amount,0)*0.03
else nvl(r.charge_amount,0)*0.025 end bq_bonus
from
(
  select distinct l.level_name,l.level_code,s.source_type_code,b.d_branch_code from d_branch_info b,d_customer_level l
  ,d_source_from_info s where l.level_code<7
)base left join
(
  select d.d_branch_code,source_type_code,level_code
  ,count(1) need_bq
  ,sum(case when operation_status_code>0 then 1 else 0 end) already_bq
  ,sum(case when operation_status_code=2 and sale_status_code>2 then 1 else 0 end) dial_bq
  ,sum(case when operation_status_code=2 and sale_status_code>4 then 1 else 0 end) contact_customers
  from d_branch_info d inner join customer cus using(branch_code)
  where level_code<7 and (operation_status_code>0 or clear_status_code in(0,4) )
  group by d.d_branch_code, source_type_code, level_code
)l using( level_code,d_branch_code,source_type_code)
left join
(
 select d.d_branch_code,source_type_code,cus.level_code,count(p.policy_no) deal_count,sum(nvl(p.charge_total_amount,0)) charge_amount
 from d_branch_info d inner join customer cus using(branch_code) left join online_deal_policy p on cus.customer_id=p.policy_holder_id
 where cus.level_code<7 and operation_status_code=2 and clear_status_code=3
 group by d.d_branch_code, source_type_code, cus.level_code
)r using( level_code,d_branch_code,source_type_code)
) n on(rpt.batch_id=n.batch_id and rpt.row_name=n.row_name and rpt.source_type_code=n.source_type_code and rpt.d_branch_code=n.d_branch_code)
when matched then
update set
rpt.need_bq=n.need_bq,rpt.already_bq=n.already_bq,rpt.bq_pct=n.bq_pct,rpt.dial_bq=n.dial_bq,rpt.contact_pct=n.contact_pct,rpt.deal_count=n.deal_count
,rpt.charge_amount=n.charge_amount,rpt.bq_bonus=n.bq_bonus
when not matched then
insert
values(n.batch_id,n.row_name,n.source_type_code,n.d_branch_code,n.need_bq,n.already_bq,n.bq_pct,n.dial_bq,n.contact_pct,n.deal_count,n.charge_amount,n.bq_bonus);
o_result_code:=sql%rowcount;
--��¼��־
insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  values('��������±�ȫ������������', '��������', v_start_time,systimestamp, o_result_code, 0);
commit;
--�쳣����
exception
  when others then
    rollback;
    o_result_code:=-1;
  insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  values('��������±�ȫ������������', '����', v_start_time,systimestamp, o_result_code, 0);
end ;
/

prompt
prompt Creating procedure PROC_RPT_CHILD_BRANCH
prompt ========================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_rpt_child_branch
(
  i_date date,
  i_refresh_rpt in number,
  o_result_code out number
) as
v_start_time timestamp;
v_batch_id varchar2(20);
v_data_count number(20);
begin
v_start_time:=systimestamp;
v_batch_id:=to_char((i_date-to_char(i_date,'D')+1),'yyyy-mm-dd');
if i_refresh_rpt=1 then
  delete from RPT_CPIC_CHILD_BRANCH where batch_id=v_batch_id;
  o_result_code:=0;
else
  select count(1) into v_data_count from rpt_cpic_child_branch where batch_id=v_batch_id;
  if v_data_count=0 then
    o_result_code:=0;
  else
    o_result_code:=-1;
  end if;
end if;
if o_result_code<>-1 then
INSERT INTO RPT_CPIC_CHILD_BRANCH
  (
    BATCH_ID,
    SOURCE_TYPE_CODE,
    D_BRANCH_CODE,
    CHILD_BRANCH_CODE,
    CHILD_BRANCH_NAME,
    BIRTHDATE_MONTH_code,
    DATA_COL
  )
with rpt_structure as (
--��������ṹ
select distinct s.source_type_code,b.d_branch_code,b.child_branch_code,b.child_branch_name,b.branch_code
,m.month_code
  from d_source_from_info s
  ,d_branch_info b
  ,d_birthdate_month m
)
,rpt_data as (
--ͳ��ʵ������
select source_type_code,branch_code,m.month_code,count(customer_id) data_col
from customer cus inner join d_birthdate_month m on(cus.birthdate_month_day_code=m.birthdate_month_day_code)
where sale_status_code=0 and clear_status_code=3
GROUP BY source_type_code, branch_code, m.month_code
)
--���ɱ�׼����
select v_batch_id batch_id ,l.source_type_code,l.d_branch_code,l.child_branch_code,l.child_branch_name,l.month_code,nvl(r.data_col,0) data_col
from rpt_structure l left join rpt_data r
on l.source_type_code=r.source_type_code
and l.branch_code=r.branch_code
and l.month_code=r.month_code;
end if;
o_result_code:=sql%rowcount;
commit;--�ύ
--��¼��־
insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  values('��������¿������ݱ�������', '��������', v_start_time,systimestamp, o_result_code, 0);
--�쳣����
exception
  when others then
    rollback;
    o_result_code:=-1;
  insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  values('��������¿������ݱ�������', '����', v_start_time,systimestamp, o_result_code, 0);
  o_result_code:=-1;
end ;
/

prompt
prompt Creating procedure PROC_RPT_CREATE
prompt ==================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_rpt_create
(
  i_current_date in date,
  i_refresh_rpt in number,
  o_result_code out number
) as
v_start_time timestamp;
v_result_code number(20);
begin
o_result_code:=0;
v_start_time:=systimestamp;
proc_rpt_2call(i_current_date,i_refresh_rpt,v_result_code);
if v_result_code=-1 then
  o_result_code:=v_result_code;
end if;
proc_rpt_child_branch(i_current_date,i_refresh_rpt,v_result_code);
if v_result_code=-1 then
  o_result_code:=v_result_code;
end if;
proc_rpt_diff_data(i_current_date,i_refresh_rpt,v_result_code);
if v_result_code=-1 then
  o_result_code:=v_result_code;
end if;
proc_rpt_storage(i_current_date,i_refresh_rpt,v_result_code);
if v_result_code=-1 then
  o_result_code:=v_result_code;
end if;
PROC_rpt_bq_analysis(i_current_date,i_refresh_rpt,v_result_code);
if v_result_code=-1 then
  o_result_code:=v_result_code;
end if;
PROC_rpt_schedule(i_current_date,i_refresh_rpt,v_result_code);
if v_result_code=-1 then
  o_result_code:=v_result_code;
end if;
PROC_rpt_ticket(i_current_date,i_refresh_rpt,v_result_code);
if v_result_code=-1 then
  o_result_code:=v_result_code;
end if;
PROC_rpt_trace(i_current_date,i_refresh_rpt,v_result_code);
if v_result_code=-1 then
  o_result_code:=v_result_code;
end if;
--��¼��־
insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  VALUES('��������±�������', '��������', v_start_time,systimestamp, 1, 0);
--�쳣����
exception
  when others then
  insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  values('��������±�������', '����', v_start_time,systimestamp, 0, 0);
  o_result_code:=-1;
end;
/

prompt
prompt Creating procedure PROC_IMP_ONLINE_POLICY
prompt =========================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.proc_imp_online_policy
(
  i_batch_id in number
  ,i_partition_col in number
  ,o_ret_code out number
) as
v_begin_time timestamp;
v_sql varchar2(4000);
begin
v_begin_time:=systimestamp;
o_ret_code:=0;
if i_partition_col in(-1,0) then
  insert into online_deal_policy(branch_govern_id,policy_no,class_code,policy_holder_id,application_no,application_create_time,product_code,partition_col)
  select t.branch_govern_id,t.policy_no,'ABCDE' class_code,t.policy_holder_id,t.application_no,t.application_create_time,t.product_code,t.partition_col
  from(
      select l.*,
      row_number() over(partition by l.application_no order by l.application_create_time) rn
      from temp_deal_policy l left join online_deal_policy r on l.application_no=r.application_no
      where r.application_no is null
    ) t where rn=1;
  o_ret_code:=sql%rowcount;
  insert into log_information(command_name, command_type, start_time,end_time,  add_number, condition_id)
  values('�����߳ɽ�������Ϣ', '������Ϣ��д', v_begin_time,systimestamp, o_ret_code, i_batch_id);
end if;
if i_partition_col=-1 then
v_sql:='update customer
set sale_status_code=case when sale_status_code in(7,6) then sale_status_code else 6 end
where customer_id in(select policy_holder_id from temp_deal_policy)';
else
v_sql:='update customer partition(PART0'||i_partition_col||')
set sale_status_code=case when sale_status_code in(7,8) then sale_status_code else 7 end
where customer_id in(select policy_holder_id from temp_deal_policy)';
end if;
execute immediate v_sql;
o_ret_code:=sql%rowcount;
if o_ret_code>0 then
    insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
    values('���¿ͻ�����״̬', '������Ϣ��д', v_begin_time,systimestamp, o_ret_code, i_batch_id);
end if;
commit;
--��ʼ��������
PROC_rpt_create(sysdate,1,o_ret_code);
commit;
  exception
    when others then
    o_ret_code:= -1;
     insert into log_information(command_name, command_type, start_time,end_time,  add_number, condition_id)
  VALUES('�����߳ɽ�������Ϣ', '����', v_begin_time,systimestamp, o_ret_code, i_batch_id);
end;
/

prompt
prompt Creating procedure PROC_IMP_OPERATION
prompt =====================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_imp_operation
(
  i_task_id in number,
  i_condition in varchar2,
  o_updated_rows out number
) as
v_sql varchar(8000);
V_Start_Time Timestamp;
v_condition varchar2(2000);
begin
V_Start_Time:=Systimestamp;
select nvl(task_condition,'1=1') into v_condition from tasks where id=i_task_id;

--�޸�������绰
insert into customer_phone(customer_id,partition_col,tel_code,phone_type,phone)
    --�ھŲ㣺ȥ���ͻ��ظ��绰
    select t.customer_id,t.partition_col,t.tel_code,t.phone_type,t.phone
    from (
    --��8��:�ۺϵ绰���ͣ�׼���绰ȥ��
    select customer_id ,partition_col,tel_code,phone_type,
    phone,row_number() over(partition by phone order by customer_id) rn
    from (
    --���߲㣺�޸��绰
    select customer_id,mod(phone_type,6) phone_type,partition_col,tel_code
    ,case when (change_code+change_phone+has_code)=0 and is_mobile=0 then (now_code||phone)
    when (change_code+change_phone)=2 and is_mobile=0 and instr(nvl(first_number_list,'1234567890'),substr(phone,(1-old_length),1),1)>0   then (now_code||add_number||substr(phone,-old_length,old_length))
    when change_code=1 and change_phone=0 and is_mobile=0 then (now_code||substr(phone,-now_length,now_length))
    when change_phone=1 and is_mobile=0 and instr(nvl(first_number_list,'1234567890'),substr(phone,(1-old_length),1),1)>0 then (now_code||add_number||substr(phone,-old_length,old_length))
    else phone
    end phone
    from (
    --�����㣺׼���绰�޸�
    select distinct t.*
    ,p.old_code,p.now_code,p.old_length,p.now_length,p.first_number_list,p.add_number
      ,case when p.old_code=p.now_code then 0 else 1 end change_code
      ,case when p.old_length=p.now_length then 0 else 1 end change_phone
      ,case when substr(phone,1,1)=0 and length(phone)>9 then 1 else 0 end has_code
      ,case when substr(phone,1,1)=1 and length(phone)=11 then 1 else 0 end is_mobile
      from (
    --����㣺�ѵ绰ת���ɵ��е绰,�������绰�����޸�����
    select t.customer_id,t.partition_col,t.tel_code,r.phone_type,case r.phone_type
        when 1 then  family_phone
        when 2 then  office_phone
        when 3 then  mobile_phone
        when 4 then  charge_phone
        when 5 then  other_phone
        end phone
    from temp_customer t
    ,(select 1  phone_type from dual
            union all select 2 from dual
            union all select 3 from dual
            union all select 4 from dual
            union all select 5 from dual) r
    --��������
    ) t left join phone_rule p on t.tel_code=p.code and length(t.phone)>5
    --���������
    ) t
    --���߲����
    ) t where length(phone) in(11,12) and substr(phone,1,1) in(0,1)
    --��8�����
    ) t left join customer_phone cp on t.phone=cp.phone
    where cp.phone is null and t.rn=1;
    --�ھŲ����
--���������˺�
insert into bank_accounts(account_no,customer_id,bank_name)
select l.bank_account,max(l.customer_id) customer_id,max(l.bank_name) bank_name
from temp_customer l left join bank_accounts b on l.bank_account=b.account_no
where b.account_no is null and l.bank_account is not null
group by l.bank_account;
--�����û�������Ϣ
execute immediate 'Truncate Table P_Customer_Update';
v_sql:='Insert All
Into P_Customer_Update (Customer_Id,Copy_Id,Customer_Name,Birthday,Gender_Code,Marital_Status,Death_Critical_Illness,Fax,Family_Zip_Code,Company_Zip_Code,Family_Address
,Company_Address,CONTACT_ADDRESS,company,job_name,email,province,city,tel_code,zone_code,age_zone_code,birthdate_month_day_code,age,note
,Any_Date,Other_Info_1,Other_Info_2,Other_Info_3,Other_Info_4,Other_Info_5,Bank_Status_Code,Has_Ftele_Code,Has_Ctele_Code,Has_Mobile_Code
,OPERATION_STATUS_CODE,Has_Rectele_Code,Clear_Status_Code,Level_Code,Partition_Col)
Values(Customer_Id,Copy_Id,Customer_Name,Birthday,Gender_Code,Marital_Status,Death_Critical_Illness,Fax,Family_Zip_Code,Company_Zip_Code,Family_Address
,Company_Address,CONTACT_ADDRESS,company,job_name,email,province,city,tel_code,zone_code,age_zone_code,birthdate_month_day_code,age,note
,Any_Date,Other_Info_1,Other_Info_2,Other_Info_3,Other_Info_4,Other_Info_5,Bank_Status_Code,Has_Ftele_Code,Has_Ctele_Code,Has_Mobile_Code
,case when clear_status_code=1 then 2 else 3 end,has_rectele_code,clear_status_code,level_code,PARTITION_COL)
select  distinct w.customer_id
,nvl(cus.PARTITION_COL,w.PARTITION_COL)PARTITION_COL
,nvl(cus.copy_id,w.copy_id)copy_id
,nvl(cus.customer_name,w.customer_name)customer_name
,nvl(cus.birthday,w.birthday)birthday
,nvl(cus.gender_code,w.gender_code)gender_code
,nvl(cus.marital_status,w.marital_status)marital_status
,nvl(cus.death_critical_illness,w.death_critical_illness)death_critical_illness
,nvl(cus.fax,w.fax)fax
,nvl(cus.family_zip_code,w.family_zip_code)family_zip_code
,nvl(cus.company_zip_code,w.company_zip_code)company_zip_code
,Nvl(Cus.Family_Address,W.Family_Address)Family_Address
,Nvl(Cus.Company_Address,W.Company_Address)Company_Address
,Nvl(Cus.CONTACT_ADDRESS,W.CONTACT_ADDRESS)CONTACT_ADDRESS
,nvl(cus.company,w.company)company
,nvl(cus.job_name,w.job_name)job_name
,nvl(cus.email,w.email)email
,nvl(cus.province,w.province)province
,nvl(cus.city,w.city)city
,nvl(cus.tel_code,w.tel_code)tel_code
,nvl(cus.zone_code,w.zone_code)zone_code
,case cus.birthday when null then w.age_zone_code else cus.age_zone_code end age_zone_code
,case cus.birthday when null then w.BIRTHDATE_MONTH_DAY_CODE else cus.BIRTHDATE_MONTH_DAY_CODE end BIRTHDATE_MONTH_DAY_CODE
,nvl(cus.age,w.age)age
,nvl(cus.note,w.note)note
,nvl(cus.any_date,w.any_date)any_date
,nvl(cus.other_info_1,w.other_info_1)other_info_1
,nvl(cus.other_info_2,w.other_info_2)other_info_2
,nvl(cus.other_info_3,w.other_info_3)other_info_3
,nvl(cus.other_info_4,w.other_info_4)other_info_4
,Nvl(Cus.Other_Info_5,W.Other_Info_5)Other_Info_5
,case when Cus.Bank_Status_Code=0 then nvl(W.Bank_Status_Code,0) else 0 end Bank_Status_Code
,nvl(w.has_ftele_code,0)has_ftele_code
,nvl(w.has_ctele_code,0)has_ctele_code
,nvl(w.has_mobile_code,0)has_mobile_code
,Nvl(W.Has_Rectele_Code,0)Has_Rectele_Code
,nvl(w.clear_status_code,0)clear_status_code
,fun_level_code(cus.source_type_code,cus.policy_status_code,cus.revist_result
,case cus.birthday when null then w.age_zone_code else cus.age_zone_code end
,cus.zone_type_code
,nvl(cus.bank_status_code,w.bank_status_code),cus.orphan_status_code) level_code
from (
    select l.CUSTOMER_ID
    ,max(l.PARTITION_COL)PARTITION_COL
    ,max(l.SOURCE_TYPE_CODE)SOURCE_TYPE_CODE
    ,max(l.BRANCH_ABBREVIATION)BRANCH_ABBREVIATION
    ,max(l.customer_name)customer_name
    ,max(l.COPY_ID) copy_id
    ,max(l.BIRTHDAY)BIRTHDAY
    ,max(l.gender_code)gender_code
    ,max(l.MARITAL_STATUS)MARITAL_STATUS
    ,max(l.DEATH_CRITICAL_ILLNESS)DEATH_CRITICAL_ILLNESS
    ,max(l.FAX)FAX
    ,max(l.FAMILY_ZIP_CODE)FAMILY_ZIP_CODE
    ,max(l.COMPANY_ZIP_CODE)COMPANY_ZIP_CODE
    ,max(l.FAMILY_ADDRESS)FAMILY_ADDRESS
    ,max(l.COMPANY_ADDRESS)COMPANY_ADDRESS
    ,max(l.CONTACT_ADDRESS)CONTACT_ADDRESS
    ,max(l.JOB_NAME)JOB_NAME
    ,max(l.COMPANY)COMPANY
    ,max(l.EMAIL)EMAIL
    ,max(l.PROVINCE)PROVINCE
    ,max(l.CITY)CITY
    ,max(l.tel_code)tel_code
    ,max(l.zone_code)zone_code
    ,max(fun_age_check(l.birthday)) age_zone_code
    ,max(fun_birth_month_day_code(l.birthday)) birthdate_month_day_code
    ,max(l.AGE)AGE
    ,max(l.NOTE)NOTE
    ,max(l.ANY_DATE)ANY_DATE
    ,max(l.OTHER_INFO_1)OTHER_INFO_1
    ,max(l.OTHER_INFO_2)OTHER_INFO_2
    ,max(l.OTHER_INFO_3)OTHER_INFO_3
    ,max(l.OTHER_INFO_4)OTHER_INFO_4
    ,max(l.other_info_5)other_info_5
    ,max(case when l.bank_account is null then 0 else 1 end) bank_status_code
    ,max(case when phone_type=1 then 1 else 0 end) has_ftele_code
    ,max(case when phone_type=2 then 1 else 0 end)has_ctele_code
    ,max(case when phone_type=3 then 1 else 0 end)has_mobile_code
    ,max(case when phone_type=4 then 1 else 0 end)has_rectele_code
    ,max(case when phone_type is  not null then 1 else 0 end)clear_status_code
    from temp_customer l --inner join customer cus on l.partition_col=cus.partition_col and l.customer_id=cus.customer_id
    Left Join Customer_Phone R On L.Customer_Id=R.Customer_Id
    where l.CUSTOMER_ID is not null
    group by l.CUSTOMER_ID
  ) W inner Join (
      select cus.* from customer cus
      inner join d_branch_info d on cus.branch_code=d.branch_code
      inner join d_birthdate_month b on cus.birthdate_month_day_code=b.birthdate_month_day_code
      where  cus.operation_status_code=1 and '||v_condition||'
  ) cus on w.customer_id=cus.customer_id';
execute immediate v_sql;

update customer cus
set(
  COPY_ID,
  CUSTOMER_NAME,
  BIRTHDAY,
  AGE,
  GENDER_CODE,
  MARITAL_STATUS,
  DEATH_CRITICAL_ILLNESS,
  FAX,
  FAMILY_ZIP_CODE,
  COMPANY_ZIP_CODE,
  FAMILY_ADDRESS,
  COMPANY_ADDRESS,
  COMPANY,
  CONTACT_ADDRESS,
  JOB_NAME,
  EDUCATION_LEVEL,
  INCOME,
  EMAIL,
  ZONE_CODE,
  AGE_ZONE_CODE,
  BIRTHDATE_MONTH_DAY_CODE,
  CLEAR_STATUS_CODE,
  OPERATION_STATUS_CODE,
  BANK_STATUS_CODE,
  HAS_RECTELE_CODE,
  HAS_FTELE_CODE,
  HAS_CTELE_CODE,
  HAS_MOBILE_CODE,
  LEVEL_CODE,
  CITY,
  PROVINCE,
  NOTE,
  ANY_DATE,
  OTHER_INFO_1,
  OTHER_INFO_2,
  OTHER_INFO_3,
  OTHER_INFO_5,
  OTHER_INFO_4,
  TEL_CODE,
  d_donation_code
)=(SELECT COPY_ID,
  CUSTOMER_NAME,
  BIRTHDAY,
  AGE,
  GENDER_CODE,
  MARITAL_STATUS,
  DEATH_CRITICAL_ILLNESS,
  FAX,
  FAMILY_ZIP_CODE,
  COMPANY_ZIP_CODE,
  FAMILY_ADDRESS,
  COMPANY_ADDRESS,
  COMPANY,
  CONTACT_ADDRESS,
  JOB_NAME,
  EDUCATION_LEVEL,
  INCOME,
  EMAIL,
  ZONE_CODE,
  AGE_ZONE_CODE,
  BIRTHDATE_MONTH_DAY_CODE,
  CLEAR_STATUS_CODE,
  OPERATION_STATUS_CODE,
  BANK_STATUS_CODE,
  HAS_RECTELE_CODE,
  HAS_FTELE_CODE,
  HAS_CTELE_CODE,
  HAS_MOBILE_CODE,
  LEVEL_CODE,
  CITY,
  PROVINCE,
  NOTE,
  ANY_DATE,
  OTHER_INFO_1,
  OTHER_INFO_2,
  OTHER_INFO_3,
  OTHER_INFO_5,
  OTHER_INFO_4,
  TEL_CODE,
  D_DONATION_CODE
from p_customer_update cus1 where cus.customer_id=cus1.customer_id)
where exists(select 1 from p_customer_update cus2 where cus.customer_id=cus2.customer_id);
--ͳ�Ƴɹ�������
select count(*) into o_updated_rows from p_customer_update where clear_status_code=1;
insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  VALUES('��ȫ��д', '��ȫ', v_start_time,systimestamp, o_updated_rows, i_task_id);
--�쳣����
exception
  when others then
    rollback;
    o_updated_rows:=-1;
  insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  Values('��ȫ��д', '����', V_Start_Time,Systimestamp, O_Updated_Rows, I_Task_Id);
end;
/

prompt
prompt Creating procedure PROC_IMP_POLICY_FEE
prompt ======================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.proc_imp_policy_fee
(
  i_batch_id in number
  ,i_partition_col in number
  ,o_ret_code out number
) as
v_begin_time timestamp;
begin
v_begin_time:=systimestamp;
o_ret_code:=0;
merge into online_deal_policy odp
using(
   select application_no,policy_no,class_code,class_name,policy_status,claim_status,payment_status,pieces,begin_date,end_date
   ,charge_copy,charge_way,charge_status,charge_end_date,charge_years,charge_end_ages,charge_total_times
   ,charge_total_amount,branch_abbreviation,policy_holder_id
  from (
       select t.*,row_number() over(partition by application_no order by t.end_date desc) rn from temp_policy_payment t
  )where rn=1
) tpp on(tpp.application_no=odp.application_no)
when matched then
  update
  set odp.policy_no=tpp.policy_no
,odp.class_code =tpp.class_code
,odp.class_name =tpp.class_name
,odp.policy_status=tpp.policy_status
,odp.claim_status =tpp.claim_status
,odp.payment_status =tpp.payment_status
,odp.pieces   =tpp.pieces
,odp.begin_date =tpp.begin_date
,odp.end_date =tpp.end_date
,odp.charge_copy=tpp.charge_copy
,odp.charge_way =tpp.charge_way
,odp.charge_status=tpp.charge_status
,odp.charge_end_date=tpp.charge_end_date
,odp.charge_years =tpp.charge_years
,odp.charge_end_ages=tpp.charge_end_ages
,odp.charge_total_times =tpp.charge_total_times
,odp.charge_total_amount=tpp.charge_total_amount
,odp.branch_abbreviation=tpp.branch_abbreviation
,odp.policy_holder_id =tpp.policy_holder_id
,odp.batch_id_fee =1;
o_ret_code:=sql%rowcount;
insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
VALUES('���뱣��������Ϣ', 'ecif��Ϣ��д', v_begin_time,systimestamp, o_ret_code, i_batch_id);
merge into customer cus
using(
  select policy_holder_id,month_amount,case when month_amount<=200 then 0
  when month_amount between 201 and 400 then 1
  when month_amount between 401 and 600 then 2
  else 3 end month_amount_code
  from(
      select policy_holder_id,sum(per_month) month_amount from(
          select policy_holder_id,case when ms>0 then floor(charge_total_amount/ms) else 0 end per_month from(
              select policy_holder_id,charge_total_amount
              ,floor( MONTHS_BETWEEN( LEAST(charge_end_date,sysdate),begin_date)) ms from online_deal_policy
          )
      ) group by policy_holder_id
  )
) td on(td.policy_holder_id=cus.customer_id)
when matched then
  update set cus.month_amount=td.month_amount
  ,cus.month_amount_code=td.month_amount_code
  ,cus.sale_status_code=case when td.month_amount>0 then 17 else 16 end;
o_ret_code:=sql%rowcount;
insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
VALUES('���¿ͻ�����״̬', 'ecif��Ϣ��д', v_begin_time,systimestamp, o_ret_code, i_batch_id);
  exception
    when others then
    rollback;
    o_ret_code:= -1;
     insert into log_information(command_name, command_type, start_time,end_time,  add_number, condition_id)
  VALUES('���뱣��������Ϣ', '����', v_begin_time,systimestamp, o_ret_code, i_batch_id);
end;
/

prompt
prompt Creating procedure PROC_INDEX_UNUSABLE
prompt ======================================
prompt
create or replace procedure sxdxsj.proc_index_unusable
  authid definer
as
  cursor_id integer;
begin
  cursor_id := dbms_sql.open_cursor;
  dbms_sql.parse(cursor_id, 'alter index IDX_TB_SALE_HIS_THROUGH unusable', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'alter index IDX_TB_SALE_HIS_STATUS unusable', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'alter index IDX_TB_SALE_HIS_PID unusable', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'alter index IDX_TB_SALE_HIS_ID unusable', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'alter index IDX_TB_SALE_HIS_CT unusable', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'alter index IDX_TB_SALE_HIS_CONTACT unusable', dbms_sql.v7);
  dbms_sql.close_cursor(cursor_id);
exception
  when others then
    dbms_sql.close_cursor(cursor_id);
    raise;
end proc_index_unusable;
/

prompt
prompt Creating procedure PROC_INSERT_COPY
prompt ===================================
prompt
create or replace procedure sxdxsj.proc_insert_copy
(
 ERR_NUM           OUT    NUMBER,
 ERR_MSG           OUT    VARCHAR2
)
as

  /*======================================================================================
    ��Ȩ��Ϣ����Ȩ����(c) 2012��neusoft
    �������ƣ�PROC_INSERT
    ����˵����������������������Ҫ�Ŀͻ�������Ϣ���뵽cust_list_rslt
    ���������
    ���������
             ERR_NUM      ִ�д������
             ERR_MSG      ������Ϣ

    ��    �ߣ���ٻ
    �������ڣ�2012-8-16
    �� �� �ţ�V2.0


    �޸���ʷ
    �汾    �޸�����            �޸���       �޸�˵��
    ---------------------------------------------------------------------------------------


  ========================================================================================*/
begin
  declare
    v_sql           varchar2(18000);
    v_sql_condition varchar2(1800);--��������
    cursor c_cursor is
      select task_condition, id, task_description from f_tasks_copy;
    row_cursor c_cursor%rowtype;

    v_insert number(20);--����ִ��ʱӰ����������

  begin
    open c_cursor;
    loop
      fetch c_cursor
        into row_cursor;
    --ȡ����������
      if row_cursor.task_condition is not null then
        v_sql_condition := 'and ' || row_cursor.task_condition;
				else
					dbms_output.put_line('ְΪ��');
      end if;
      exit when c_cursor %notfound;
      --���뿪ʼʱ��
      update f_tasks_copy
         set begin_time =
             (select to_date(to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
                             'yyyy-mm-dd hh24:mi:ss')
                from dual)
       where id = row_cursor.id;

       --ƴװSQL�����û���Ҫ����Ϣ���뵽ָ�����У�
           v_sql := '
insert into cust_list_rslt
(
CUSTOMER_NAME,
GENDER_CODE,
AGE,
BIRTHDAY,
CUSTOMER_ID,
JOB_NAME,
PHONE1,
FAMILY_PHONE,
OFFICE_PHONE,
COMPANY_ADDRESS,
MARITAL_STATUS,
BANK_NAME,
ACCOUNT_NO,
FAX,
CITY,
PROVINCE,
EMAIL,
INCOME,
EDUCATION_LEVEL,
TASK_CODE
)
  (select cus.customer_name   cname,
          cus.gender_code     gen,
          cus.age             age,
          cus.birthday        birthday,

          cus.customer_id     id,
          cus.job_name        jname,
          (select phone from customer_phone cp where cp.customer_id =cus.customer_id and cp.phone_type =3 and rownum <2)phone1,

          (select phone from customer_phone cp where cp.customer_id =cus.customer_id and cp.phone_type =1 and rownum <2)family_phone,
          (select phone from customer_phone cp where cp.customer_id =cus.customer_id and cp.phone_type =2 and rownum <2)office_phone,

          cus.company_address cadd,
		

          cus.marital_status  mstatus,
          bank.bank_name,

          bank.account_no,

          cus.fax             fax,
          cus.city            city,
          cus.province        province,

          cus.email           email,

          cus.income          income,
          cus.education_level elevel,

        ' || row_cursor.id || '
     from customer cus
     left join
       (select customer_id ,bank_name,account_no from (select customer_id, bank_name,account_no ,row_number()over (partition by customer_id order by account_no ) rn from bank_accounts ba_ac  ) where rn=1  )
       bank  on cus.customer_id = bank.customer_id
       where 1=1 ' || v_sql_condition || '
       )';

      execute immediate v_sql;
      commit;
      v_insert := sql%rowcount;
    --������־log_cust_list_rslt
      update f_tasks_copy
         set success_number = v_insert,
             end_time      =
             (select to_date(to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
                             'yyyy-mm-dd hh24:mi:ss')
                from dual),
             task_status    = 2
       where id = row_cursor.id;

      insert into log_cust_list_rslt_copy
        (task_id, time, task_description, task_status)
      values
        (row_cursor.id,
         (select to_date(to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
                         'yyyy-mm-dd hh24:mi:ss')
            from dual),
         row_cursor.task_description,
         2);


      commit;
    end loop;
    close c_cursor;
    ERR_NUM       := 0;
    ERR_MSG       := 'NORMAL,SUCCESSFUL COMPLETION';
  --�쳣����
  exception
    when others then
      --���쳣д����־log_cust_list_rslt
      dbms_output.put_line('�ѽ����쳣����һ��ִ��insert '||SQLCODE);
      insert into log_cust_list_rslt_copy (task_id, time, task_description, task_status)
      values  (row_cursor.id,(select to_date(to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'), 'yyyy-mm-dd hh24:mi:ss') from dual),row_cursor.task_description, 9);
      dbms_output.put_line('�ѽ����쳣����һ��ִ��update'|| sqlerrm);
      
      
      ERR_NUM:=sqlcode;
      ERR_MSG       := sqlerrm;
      commit;
  end;
end proc_insert_copy;
/

prompt
prompt Creating procedure PROC_LATEST_POLICY_INSERT
prompt ============================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.proc_latest_policy_insert
(
/************************************************************
�����������±�����Ϣ
���򣺸���policy_no,class_code,update_timeȡ����һ������������
�������ڣ�2012-01-18
�����ˣ�
�޸����ڣ�
�޸��ˣ�
*************************************************************/
  i_task_id in number,
  i_source_type_code in number,
  i_detail_id in number,
  i_policy_partition_code in number,
  o_ret_code out number
) as
 v_sql varchar2(8000);
 v_start_time timestamp;
 vc_PARTITION varchar2(10);
 v_sysdate date;
 v_errcode   number; 
 v_errmsg    varchar2(100); 
begin
--��¼��ʼʱ��
v_start_time:=systimestamp;
vc_PARTITION :='PART0'||i_policy_partition_code;
v_sysdate:=sysdate;
o_ret_code:=0;

 --����ǹ¶�������������,-2��������������
if i_source_type_code in(-2,0,1) then
v_sql:='MERGE INTO F_LATEST_POLICY PARTITION ('||vc_PARTITION||') a
USING (select * from(
(select
c.*,
row_number() over(partition by c.policy_holder_id order by c.begin_date desc) row_num
from
(select
      t.* ,
      pr.policy_row_id policy_row_id
      From p_policy_update_parts PARTITION ('||vc_PARTITION||') pr
      inner join temp_policy PARTITION ('||vc_PARTITION||') t on t.rowid= pr.row_id) c) d)
where d.row_num=1) b
ON (a.policy_holder_id=b.policy_holder_id)
WHEN MATCHED THEN UPDATE SET
    a.class_name=nvl(b.class_name,a.class_name)
   ,a.policy_status=nvl(b.policy_status,a.policy_status)
   ,a.claim_status=nvl(b.claim_status,a.claim_status)
   ,a.payment_status=nvl(b.payment_status,a.payment_status)
   ,a.pieces=nvl(b.pieces,a.pieces)
   ,a.begin_date=nvl(b.begin_date,a.begin_date)
   ,a.end_date=nvl(b.end_date,a.end_date)
   ,a.charge_copy=nvl(b.charge_copy,a.charge_copy)
   ,a.charge_way=nvl(b.Charge_Way,a.Charge_Way)
   ,a.charge_status=nvl(b.Charge_Status,a.Charge_Status)
   ,a.charge_end_date=nvl(b.Charge_End_Date,a.Charge_End_Date)
   ,a.charge_years=nvl(b.Charge_Years,a.Charge_Years)
   ,a.charge_end_ages=nvl(b.Charge_End_Ages,a.Charge_End_Ages)
   ,a.charge_total_times=nvl(b.Charge_Total_Times,a.Charge_Total_Times)
   ,a.charge_total_amount=nvl(b.Charge_Total_Amount,a.Charge_Total_Amount)
   ,a.relation=nvl(b.Relation,a.Relation)
   ,a.recognizee_age=nvl(b.Recognizee_Age,a.Recognizee_Age)
   ,a.policy_holder_copy_id=nvl(b.policy_holder_copy_id,a.policy_holder_copy_id)
   ,a.recognizee_holder_id=nvl(b.recognizee_holder_id,a.recognizee_holder_id)
   ,a.recognizee_holder_copy_id=nvl(b.recognizee_holder_copy_id,a.recognizee_holder_copy_id)
   ,a.employee_no=nvl(b.employee_no,a.employee_no)
   ,a.account_type=nvl(b.account_type,a.account_type)
   ,a.account_no=nvl(b.account_no,a.account_no)
   ,a.bank_code=nvl(b.bank_code,a.bank_code)
   ,a.bank_name=nvl(b.bank_name,a.bank_name)
   ,a.market_channel=nvl(b.market_channel,a.market_channel)
   ,a.govern_id=nvl(b.govern_id,a.govern_id)
   ,a.govern_name=nvl(b.govern_name,a.govern_name)
   ,a.tel_code=nvl(b.tel_code,a.tel_code)
   ,a.branch_abbreviation=nvl(b.branch_abbreviation,a.branch_abbreviation)
   ,a.branch_name=nvl(b.branch_name,a.branch_name)
   ,a.reczip=nvl(b.zone_code,a.reczip)
   ,a.charge_phone =nvl(b.charge_phone,a.charge_phone)
   ,a.mobile_phone=nvl(b.mobile_phone,a.mobile_phone)
   ,a.other_phone=nvl(b.other_phone,a.other_phone)
   ,a.fax=nvl(b.fax,a.fax)
   ,a.email=nvl(b.email,a.email)
   ,a.education_level=nvl(b.edulevel,a.education_level)
   ,a.income=nvl(b.income,a.income)
   ,a.update_time=nvl(b.update_time,a.update_time)
   ,a.recieve_time=nvl(b.recieve_time,a.recieve_time)
   where b.begin_date>=a.begin_date
   WHEN NOT MATCHED THEN  INSERT
   VALUES (b.policy_no,b.class_code,b.class_name,b.policy_status,b.claim_status,b.payment_status,
    b.pieces,b.begin_date,b.end_date,b.charge_copy,b.charge_way,b.charge_status,b.charge_end_date,
    b.charge_years,b.charge_end_ages,b.charge_total_times,b.charge_total_amount,b.relation,b.recognizee_age,
    b.policy_holder_id,b.policy_holder_copy_id,b.recognizee_holder_id,b.recognizee_holder_copy_id,b.employee_no,
    b.account_type,b.account_no,b.bank_code,b.bank_name,b.market_channel,b.govern_id,b.govern_name,
    b.tel_code,b.branch_abbreviation,b.branch_name,b.zone_code,b.charge_phone,b.mobile_phone,
    b.other_phone,b.fax,b.email,b.edulevel,b.income,b.update_time,b.recieve_time,
    null,null,null,b.partition_col,0)';
execute immediate v_sql;
o_ret_code:=sql%rowcount;

--��������ϸ��״̬
update task_detail
set completed=1,
success_number=o_ret_code,
begin_time=v_sysdate,
end_time=sysdate
where task_id=i_task_id and detail_id=i_detail_id;
insert into log_information(command_name, command_type, start_time,end_time,  add_number,condition_id)
values('�����������±�����Ϣ,������:'||i_policy_partition_code, '����ɹ�', v_start_time,systimestamp, o_ret_code,i_task_id);
commit;
end if;
exception
  when others then
  v_errcode   :=   sqlcode; 
    v_errmsg   :=   substr(sqlerrm,1,100); 
    dbms_output.put_line( 'error   code   is '   ||   v_errcode   ||   '   error   message   is '   ||   v_errmsg);
    rollback; 
  o_ret_code:= -1;
   insert into log_information(command_name, command_type, start_time,end_time,  add_number,condition_id)
   values('�����������±�����Ϣ,������:'||i_policy_partition_code || '; error   code   is '   ||   v_errcode, '����ʧ��;  error   message   is '   ||   v_errmsg, v_start_time,systimestamp, o_ret_code,i_task_id);
commit;
end;
/

prompt
prompt Creating procedure PROC_MOBILE_UPDATE_TIME
prompt ==========================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_mobile_update_time(
   I_Task_Id In Number
  ,i_sms_send_end_time in timestamp
  ,o_updated_rows out number
) as
V_Start_Time Timestamp:=systimestamp;
Begin
  update batch_management set sms_send_end_time=i_sms_send_end_time where batch_code=i_task_id;
  o_updated_rows:=sql%rowcount;
  Insert Into Log_Information(Command_Name, Command_Type,start_time,End_Time,  Update_Number, Condition_Id)
  VALUES('���¶�����ϴ��Ԥ�Ʒ��ͽ���ʱ��', '������ϴ',V_Start_Time,systimestamp, o_updated_rows, i_task_id);
  exception
       when others then
       o_updated_rows:= -1;
       insert into log_information(command_name, command_type,start_time,end_time,  update_number, condition_id)
       VALUES('���¶�����ϴ��Ԥ�Ʒ��ͽ���ʱ��', '����',V_Start_Time,systimestamp, o_updated_rows, i_task_id);
end;
/

prompt
prompt Creating procedure PROC_MONTH_CUSTOMER_ISMEET
prompt =============================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_MONTH_CUSTOMER_ISMEET (
/***************************************
ÿ�¸��¿ͻ����������ڽ����ɵĿͻ���Ϣ
�������ڣ�2012-01-17
�����ˣ�doujiafa
***************************************/
i_partition_code in number
) as
v_sql varchar2(9000);
vc_PARTITION varchar2(10);
v_start_time timestamp;
o_ret_code number;
begin
   vc_PARTITION :='PART0'||i_partition_code;
   v_start_time:=systimestamp;
   v_sql:='MERGE INTO customer PARTITION ('||vc_PARTITION||') a
   USING (
         select
         wc.customer_id       policy_holder_id
        ,wc.source_type_code  source_type_code
        ,wp.begin_date         begin_date
        ,wp.charge_way         charge_way
   from(
        select customer_id,
               source_type_code
        from customer PARTITION ('||vc_PARTITION||')
   ) wc
   left join f_latest_policy PARTITION ('||vc_PARTITION||') wp on wc.customer_id=wp.policy_holder_id) b
--����Դsource_type_code=1�����ݽ��д���
ON (a.customer_id=b.policy_holder_id and a.source_type_code=1)
WHEN MATCHED THEN UPDATE SET
    a.ismeet = FUN_PAY_WAY(a.source_type_code,b.begin_date,b.charge_way)';
execute immediate v_sql;
o_ret_code:=sql%rowcount;
insert into log_information(command_name, command_type, start_time,end_time,  add_number)
values('ÿ�¸��������ڽ����ɵĿͻ���Ϣ,������:'||i_partition_code, '����', v_start_time,systimestamp, o_ret_code);
commit;
exception
  when others then
  rollback;
  o_ret_code:= -1;
   insert into log_information(command_name, command_type, start_time,end_time,  add_number)
   values('ÿ�¸��������ڽ����ɵĿͻ���Ϣ,������:'||i_partition_code, '����', v_start_time,systimestamp, o_ret_code);
end;
/

prompt
prompt Creating procedure PROC_NUANCE_CHANGE_STATUS
prompt ============================================
prompt
create or replace procedure sxdxsj.PROC_NUANCE_CHANGE_STATUS as
-- �� nuance ����״̬��ִ�иô洢�������� clean_status ״̬���޸�
--        v_batch_code : ���κ�
--        new_clean_status �� ��״̬��nuance ���ĵ�״̬��
v_batch_code number;
v_clean_status number(10);
v_start_time timestamp:=systimestamp;
v_old_status number(10);
v_new_clean_status  number(10);
cursor mysursor is select batch_code from nuance_batch where clean_status in(0,1) and new_clean_status in(-3,-2,-1,0,1,2,3); 
begin 
--��ȡԭ״̬�͸��ĺ���״̬
--ʹ���α��ȡ ���κ�
for line in mysursor loop
v_batch_code:=line.batch_code;
--dbms_output.put_line('���κţ�' ||v_batch_code );
select clean_status into v_old_status from nuance_batch where batch_code=v_batch_code;
select new_clean_status into v_new_clean_status from nuance_batch where batch_code=v_batch_code;
if v_old_status=4 THEN null;
--ֻ�е���ϴ״̬Ϊ������ɣ���׼������Ϊ�������״̬ʱ�������ж�Ӧ�Ĺ���
elsif v_old_status=1 and v_new_clean_status in(3,2) then
  --ͳ�Ʒ�����������Ϣ
  update nuance_batch 
  set (error_count,
       loss_count,
       error_percent,
       loss_percent,
       clean_status,
       end_dial)=(
      select max(error_count) error_count
            ,max(loss_count) loss_count
            ,max(error_percent)error_percent
            ,max(loss_percent)loss_percent
            ,max(clean_status) clean_status
            ,sysdate
      from(
            select total_count,error_count,loss_count
               ,case when total_count>0 then error_count/total_count else 0 end error_percent
               ,case when total_count>0 then loss_count/total_count else 0 end loss_percent
               ,case when total_count>100 and  (error_count/total_count>=0.1 or loss_count/total_count>0.05)  then -1 else v_new_clean_status end clean_status
      from(
               select  sum(case ftel_sta when '008' then 1 else 0 end) error_count
                      ,sum(case when ftel_sta is null then 1 else 0 end) loss_count
                      ,max(nb.total_count) total_count
               from  c_cpic_dial cp
                    ,nuance_batch nb
        where nb.batch_code=v_batch_code and 
              cp.id>=nb.begin_id and cp.id<=nb.end_id
      )
    )
  )
  where batch_code=v_batch_code;
  insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
  VALUES('ͳ�Ʒ�������������ɵĹ̻�', '�洢����', v_start_time,systimestamp, 1, v_batch_code);
  --��ȡ���º���ϴ״̬
  select clean_status into v_clean_status from nuance_batch where batch_code=v_batch_code;
  --��������쳣����������ϴ�쳣�ĵ绰��©���ĵ绰
  if v_clean_status=-1 then
    merge into shcpic_outdata sh
    using(
      select cp.id||'a' out_id,cp.ftel from c_cpic_dial cp,nuance_batch nb
      where nb.batch_code=v_batch_code and cp.id>=nb.begin_id and cp.id<=nb.end_id
      and (cp.ftel_sta='008' or cp.ftel_sta is null)
    ) nb on(sh.out_id=nb.out_id)
    when not matched then
    insert values(nb.out_id,nb.ftel);
    update nuance_batch
    set clean_status=0,note=(note||' ������ϴ: �쳣��: '||error_percent||'©���ʣ�'||loss_percent)
    where batch_code=v_batch_code and total_count>100;
  elsif v_clean_status in(2,3) then
        update batch_management set tel_dial_status=1 where batch_code=v_batch_code;
  end if;
elsif v_new_clean_status in(-3,-2,-1,0,1,2,3) then
   update nuance_batch set clean_status=v_new_clean_status where batch_code=v_batch_code;
end if;
insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
values('�����������', '�洢����-��ȷ', v_start_time,systimestamp, 1, v_batch_code);
end loop;
exception
  when others then
    insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
    values('�����������', '�洢����-����', v_start_time,systimestamp, 0, v_batch_code);
end;
/

prompt
prompt Creating procedure PROC_PREINS_BAR_TAG
prompt ======================================
prompt
create or replace procedure sxdxsj.PROC_PREINS_BAR_TAG is
  
begin
  update t_preins t
   set t.bar_flag = '1'
 where t.c_id in
       (select t.c_id
          from t_preins t
         where t.c_sale_situationcode = '00'
         --20120118 ���ӡ��ݴ�ɹ������ݵĴ���
           and t.c_status in ('04', '06','01')
           and t.c_phone_invalid_flag = '00'
           and t.c_sameorg_repeat_flag = '00'
           and t.c_othertype_repeat_flag = '00'
           and t.c_preins_repeat_flag = '00'
           and t.bar_flag = '0'
           and exists
         (select 1
                  from barring_name bar
                --��ϵͳ�д�������Ч�ķ��ظ����ݣ������ݵ�"�ֻ�����"ƥ��ϵͳ��Ч�������������еĵ绰���룬ƥ��ɹ������ݱ��Ϊ"��������"��-
                 where t.c_cus_mobile_no = bar.phone
                      -- ��ϵͳ�д�������Ч�ķ��ظ����ݣ������ݵ�"�ͻ�����"+"����"���ƥ��ϵͳ��Ч�������������е�"�ͻ�����"+"����"��ƥ��ɹ������ݱ��Ϊ"��������"��
                    or (t.c_cus_name = bar.customer_name and t.c_cus_birtheday=to_date(bar.birthday,'YYYY-MM-DD'))
                      --��ϵͳ�д�������Ч�ķ��ظ����ݣ������ݵ�"���֤����"ƥ��ϵͳ��Ч�������������е�"���֤����"��ƥ��ɹ������ݱ��Ϊ"��������"��
                    or (t.c_cus_card_id = bar.customer_id)));
   commit;
exception
  when others then
    dbms_output.put_line('proc_ban_tag fails'|| sqlerrm(sqlcode));
    rollback;
end proc_preins_bar_tag;
/

prompt
prompt Creating procedure PROC_PREINS_BATCH_HANDLE
prompt ===========================================
prompt
create or replace procedure sxdxsj.proc_preins_batch_handle is
begin
/*
  update t_preins_tmp
     set c_cus_age_code = to_char(fun_age_check(c_cus_birtheday)),
         c_batch_code   = to_char(sysdate, 'yyyyMMddhhmiss'),
         import_time=to_char(c_import_time,'yyyyMMdd') ,
         dial_time=to_char(c_dial_time,'yyyyMMdd');
  commit;
  */
  insert/*+append*/ into t_preins select * from t_preins_tmp;
  insert into t_preins_copy select * from t_preins_tmp;
  EXECUTE   IMMEDIATE   'TRUNCATE   TABLE   t_preins_tmp';
--  delete from t_preins_tmp;
  commit;
exception
  when others then
     dbms_output.put_line('proc_preins_batch_handle fails'|| sqlerrm(sqlcode));
    rollback;
end proc_preins_batch_handle;
/

prompt
prompt Creating procedure PROC_PREINS_CUS_FILTER
prompt =========================================
prompt
create or replace procedure sxdxsj.PROC_PREINS_CUS_FILTER(i_line varchar2,i_tele_no varchar2)
Authid Current_User is
v_ban_cnt number default 0;
--v_repeat_cnt number default 0;
begin
  --��ѯ������
  select count(*) into v_ban_cnt
  from ban_shcpic_preins_cus_inf t where t.ban_shcpic_preins_cus_inf_num =i_tele_no;
  --��ѯ�ظ�����
  if(v_ban_cnt=0) then
   --   select count(*) into v_repeat_cnt from temp_preins_cus tmp where tmp.c_line =i_line;
   --   if(v_repeat_cnt=0) then
        insert into temp_preins_cus (c_line,c_create_time)values (i_line,sysdate);
    --  end if;
  end if;
EXCEPTION
 when others then
   dbms_output.put_line('PROC_TEMP_FILTER�����ˣ���');
   rollback;
end PROC_PREINS_CUS_FILTER;
/

prompt
prompt Creating procedure PROC_PREINS_CUS_LOCATION
prompt ===========================================
prompt
create or replace procedure sxdxsj.proc_preins_cus_location is
  v_cnt number; --��������������
  --v_id t_preins_tmp.c_id%type;
  v_province t_preins_tmp.c_cus_province%type;
  v_city     t_preins_tmp.c_cus_city%type;
  --v_zone t_preins_tmp.c_cus_zone%type;
  --v_mobile t_preins_tmp.c_cus_mobile%type;
  cursor cur_cus is
    select t.c_id, t.c_cus_province, t.c_cus_city, t.c_cus_zone
      from t_preins_tmp t
     where (t.c_cus_province is not null
           --and t.c_cus_province !=''
           or t.c_cus_city is not null);
  cursor cur_mobile is
    select t.c_id, t.c_cus_mobile_no
      from t_preins_tmp t
     where t.c_cus_province is null
       and t.c_cus_city is null;
begin
  /*�ͻ������ر�׼��
  */
  for line in cur_cus loop
    /*
    ���ͻ����ڳ����������������ȶԣ����ͻ����ڳ��е�ǰ�沿������������������г���ƥ����ƥ����Ψһ��
    ����Ϊƥ����У�ȡƥ����ʡ������Ϣ���磺"�Ϻ��л�����"��ƥ�䵽"�Ϻ�"
    */
    --ƥ�����
    select count(*)
      into v_cnt
      from t_location_info lo
     where lo.c_city = line.c_cus_city;
    if (v_cnt = 1) then
      select lo.c_province, lo.c_city
        into v_province, v_city
        from t_location_info lo
       where lo.c_city = line.c_cus_city;
      --��������
      update t_preins_tmp
         set c_cus_province      = v_province,
             c_cus_city          = v_city,
             c_standard_suc_flag = '00'
       where c_id = line.c_id;
      commit;
    else
      update t_preins_tmp
         set c_standard_suc_flag = '01'
       where c_id = line.c_id;
      commit;
    end if;
  
  /*
      �����ֶηǿյ�δƥ��ɹ������ݣ������������������ֶ�ģ��ƥ�䣬
      ���ͻ����ڳ����ֶ��а�����������������������ֶΣ���ƥ����Ψһ������Ϊƥ����У�ȡƥ����ʡ������Ϣ��
      �磺"������"��ƥ�䵽"�Ϻ��л�����"
      select count(*)
        into v_cnt
        from T_LOCATION_INFO lo
       where lo.c_zone like '%' || line.c_cus_zone || '%';
      if (v_cnt = 1) then
        select lo.c_province, lo.c_city
          into v_province, v_city
          from T_LOCATION_INFO lo
         where lo.c_zone like '%' || line.c_cus_zone || '%';
        --��������
        update t_preins_tmp
           set c_cus_province  = v_province,
               c_cus_city      = v_city,
               c_filter_status = '40',
               c_filter_remark = '�����ر�׼���ɹ�'
         where c_id = line.c_id;
        commit;
        continue;
      end if;
      
      */
  end loop;

  /*�ֻ��Ź����ر�׼������
  */
  for line1 in cur_mobile loop
    select count(*)
      into v_cnt
      from t_mobile_location lo
     where lo.c_mobile = substr(line1.c_cus_mobile_no, 0, 7);
    if (v_cnt = 1) then
      select c_province, c_city
        into v_province, v_city
        from t_mobile_location lo
       where lo.c_mobile = substr(line1.c_cus_mobile_no, 0, 7);
      update t_preins_tmp
         set c_cus_province      = v_province,
             c_cus_city          = v_city,
             c_standard_suc_flag = '00'
       where c_id = line1.c_id;
      commit;
      continue;
    else
      update t_preins_tmp
         set c_standard_suc_flag = '02'
       where c_id = line1.c_id;
      commit;
    end if;
  end loop;
exception
when others then
    dbms_output.put_line('���չ����ر�׼������' || sqlerrm(sqlcode));
end proc_preins_cus_location;
/

prompt
prompt Creating procedure PROC_PREINS_REPEAT
prompt =====================================
prompt
create or replace procedure sxdxsj.PROC_PREINS_REPEAT Authid Current_User is

  v_cnt    number default 0; --����
  v_max_time date;--���²���ʱ��

 --CURSOR����t_cus_sucess_tmp�����е���Ч����
  CURSOR cur_cus is
    select tmp.c_id,
           tmp.c_cus_name,
           tmp.c_cus_birtheday,
           tmp.c_cus_mobile_no,
           tmp.c_preins_orgcode,
           tmp.c_import_time
      from t_preins_tmp tmp
      where tmp.C_PHONE_INVALID_FLAG='00';
         --20120217 ����״̬���
      --and tmp.c_status  IN ('04','06','01');

  --CURSOR1����t_cus_sucess_tmp�����е���Ч����
  CURSOR cur_cus1 is
    select tmp.c_id,
           tmp.c_cus_name,
           tmp.c_cus_birtheday,
           tmp.c_cus_mobile_no,
           tmp.c_preins_orgcode,
           tmp.c_import_time
      from t_preins_tmp tmp
      where tmp.c_sameorg_repeat_flag = '00'
      and  tmp.C_PHONE_INVALID_FLAG='00';
      --20120217 ����״̬���
      --and tmp.c_status  IN ('04','06','01');

  --CURSOR2����t_cus_sucess_tmp�����е���Ч����
  CURSOR cur_cus2 is
    select tmp.c_id,
           tmp.c_cus_name,
           tmp.c_cus_birtheday,
           tmp.c_cus_mobile_no,
           tmp.c_preins_orgcode,
           tmp.c_import_time
      from t_preins_tmp tmp
      where tmp.c_preins_repeat_flag = '00'
        and tmp.c_sameorg_repeat_flag = '00'
        and  tmp.C_PHONE_INVALID_FLAG='00';
        --20120217 ����״̬���
        --and tmp.c_status  IN ('04','06','01');

begin

  for line in cur_cus loop
    dbms_output.put_line('id:' || line.c_id || '����:' || line.c_cus_name ||
                         '����:' || line.c_cus_birtheday || '�ֻ�����:' ||
                         line.c_cus_mobile_no || '����:' ||
                         line.c_preins_orgcode || '����ʱ��:' ||
                         line.c_import_time);
    /*
    ͬ������ȥ��
    */
    --ͬ��������ͬ���ջ��������ݰ����ع�����أ��ظ����ݱ���һ������ʱ����������ݣ��������ݱ��Ϊ"ͬ�����ظ�����"��
    select count(*)
      into v_cnt
      from t_preins_tmp tmp
     where tmp.c_preins_orgcode = line.c_preins_orgcode
       and tmp.c_sameorg_repeat_flag = '00'
       and  tmp.C_PHONE_INVALID_FLAG='00'
       --20120217 ����״̬���
       --and tmp.c_status  IN ('04','06','01')
       and ((tmp.c_cus_name is not null and tmp.c_cus_name = line.c_cus_name
       and tmp.c_cus_birtheday = line.c_cus_birtheday)
       or(line.c_cus_mobile_no is not null and tmp.c_cus_mobile_no=line.c_cus_mobile_no));
    if (v_cnt > 1) then
    --���²���ʱ��
       select max(t.c_import_time)
       into v_max_time
        from t_preins_tmp t
       where t.c_preins_orgcode = line.c_preins_orgcode
         and ((line.c_cus_name is not null
             and line.c_cus_birtheday is not null
             and t.c_cus_name = line.c_cus_name
         and t.c_cus_birtheday = line.c_cus_birtheday)
         or (line.c_cus_mobile_no is not null and t.c_cus_mobile_no = line.c_cus_mobile_no));
      --update ������
        update t_preins_tmp tmp
           set tmp.c_sameorg_repeat_flag='01',
               c_update_time       = sysdate
         where tmp.c_preins_orgcode = line.c_preins_orgcode
       and  tmp.C_PHONE_INVALID_FLAG='00'
       --20120217 ����״̬���
       --and tmp.c_status  IN ('04','06','01')
         and ((line.c_cus_name is not null
             and line.c_cus_birtheday is not null
             and tmp.c_cus_name = line.c_cus_name
         and tmp.c_cus_birtheday = line.c_cus_birtheday)
         or (line.c_cus_mobile_no is not null and tmp.c_cus_mobile_no = line.c_cus_mobile_no))
         and (tmp.c_import_time !=v_max_time or (line.c_import_time =v_max_time and tmp.c_id != line.c_id));
        commit;
        continue;
    end if;

    --���ظ�����������ͬ���ջ�������Ч�������ݰ����ع�����أ��ظ����ݱ��Ϊ"ͬ�����ظ�_����ʷ�����ظ�"��
    select count(*)
      into v_cnt
      from t_preins suc
     where suc.c_preins_orgcode = line.c_preins_orgcode
       and ((line.c_cus_name is not null
           and line.c_cus_birtheday is not null
           and suc.c_cus_name = line.c_cus_name
           and suc.c_cus_birtheday = line.c_cus_birtheday)
          or (line.c_cus_mobile_no is not null
          and suc.c_cus_mobile_no = line.c_cus_mobile_no))
       --20120217 ����״̬���
       --and suc.c_status in ('04','06','01')
       and suc.C_PHONE_INVALID_FLAG='00'
       and suc.c_sameorg_repeat_flag='00'
       and suc.c_othertype_repeat_flag='00'
       and suc.c_preins_repeat_flag='00'
       and suc.bar_flag='0';
    if (v_cnt > 0) then
      update t_preins_tmp tmp
         set tmp.c_sameorg_repeat_flag = '02',
             c_update_time       = sysdate
       where tmp.c_id = line.c_id;
      commit;
        continue;
    end if;
  end loop;

  for line1 in cur_cus1 loop
    dbms_output.put_line('id:' || line1.c_id || '����:' || line1.c_cus_name ||
                         '����:' || line1.c_cus_birtheday || '�ֻ�����:' ||
                         line1.c_cus_mobile_no || '����:' ||
                         line1.c_preins_orgcode || '����ʱ��:' ||
                         line1.c_import_time);


      /*
    ���������ڲ�����
    */
    --�Ա��������Ѿ����й�ͬ�������ݳ��ص����ݽ���ͬ���ο�������ݳ��أ�
    select count(*)
      into v_cnt
      from t_preins_tmp tmp
     where tmp.c_sameorg_repeat_flag='00'
       and tmp.C_PREINS_REPEAT_FLAG='00'
       and tmp.C_PHONE_INVALID_FLAG='00'
       --20120217 ����״̬���
       --and tmp.c_status  IN ('04','06','01')
       and ((line1.c_cus_name is not null and line1.c_cus_birtheday is not null
             and tmp.c_cus_name = line1.c_cus_name
             and tmp.c_cus_birtheday = line1.c_cus_birtheday)
           or (line1.c_cus_mobile_no is not null and tmp.c_cus_mobile_no = line1.c_cus_mobile_no));
    if (v_cnt > 1) then
    --���²���ʱ��
       select max(t.c_import_time)
       into v_max_time
        from t_preins_tmp t
       where t.c_sameorg_repeat_flag='00'
         and  t.C_PHONE_INVALID_FLAG='00'
       --20120217 ����״̬���
       --and t.c_status  IN ('04','06','01')
         and ((line1.c_cus_name is not null
             and line1.c_cus_birtheday is not null
             and t.c_cus_name = line1.c_cus_name
             and t.c_cus_birtheday = line1.c_cus_birtheday)
           or (line1.c_cus_mobile_no is not null and t.c_cus_mobile_no = line1.c_cus_mobile_no));
       --���¾�����
        update t_preins_tmp tmp
           set tmp.C_PREINS_REPEAT_FLAG = '01',
               c_update_time       = sysdate
         where tmp.c_sameorg_repeat_flag='00'
         and  tmp.C_PHONE_INVALID_FLAG='00'
        --20120217 ����״̬���
        --and tmp.c_status  IN ('04','06','01')
       and ((line1.c_cus_name is not null and line1.c_cus_mobile_no is not null
         and tmp.c_cus_name = line1.c_cus_name
         and tmp.c_cus_birtheday = line1.c_cus_birtheday)
        or (line1.c_cus_mobile_no is not null and tmp.c_cus_mobile_no = line1.c_cus_mobile_no))
       and (tmp.c_import_time !=v_max_time or (line1.c_import_time =v_max_time and tmp.c_id != line1.c_id));
        commit;
        continue;
    end if;

    --���������������������ݽ���ͬ���Ϳ�������ݳ��أ�
    select count(*)
      into v_cnt
      from t_preins suc
     where ((line1.c_cus_name is not null and line1.c_cus_birtheday is not null
        and suc.c_cus_name = line1.c_cus_name
        and suc.c_cus_birtheday = line1.c_cus_birtheday)
       or (line1.c_cus_mobile_no is not null and suc.c_cus_mobile_no = line1.c_cus_mobile_no))
       --20120217 ����״̬���
       --and suc.c_status in ('04','06','01')
       and suc.C_PHONE_INVALID_FLAG='00'
       and suc.c_sameorg_repeat_flag='00'
       and suc.c_othertype_repeat_flag='00'
       and suc.c_preins_repeat_flag='00'
       and suc.bar_flag='0';
    if (v_cnt > 0) then
      update t_preins_tmp tmp
         set tmp.C_PREINS_REPEAT_FLAG = '01',
               c_update_time       = sysdate
       where tmp.c_id = line1.c_id;
      commit;
      continue;
    end if;
  end loop;

  for line2 in cur_cus2 loop
    dbms_output.put_line('id:' || line2.c_id || '����:' || line2.c_cus_name ||
                         '����:' || line2.c_cus_birtheday || '�ֻ�����:' ||
                         line2.c_cus_mobile_no || '����:' ||
                         line2.c_preins_orgcode || '����ʱ��:' ||
                         line2.c_import_time);
    /*
    �����������ݳ���
    */
    --�Ա��������Ѿ����й����������ڲ����صķ��ظ��������������������ݽ��бȶԳ���;

    select count(*)
      into v_cnt
      from CUSTOMER cus
    where exists (select 1 from t_repeat_data_type typ where cus.source_type_code =  typ.c_data_type)
       --and replace(trim(cus.customer_name),' ','') = line.c_cus_name
       and (line2.c_cus_name is not null and line2.c_cus_birtheday is not null
       and cus.customer_name = line2.c_cus_name
       and cus.birthday = line2.c_cus_birtheday);
    if (v_cnt > 0) then
      update t_preins_tmp tmp
         set tmp.C_OTHERTYPE_REPEAT_FLAG='01',
             c_update_time       = sysdate
      where tmp.c_id = line2.c_id;
      commit;
      continue;
    end if;
    --�绰����
    select count(*)
      into v_cnt
      from customer_phone pho
     where exists (select 1
              from customer cus
             where exists (select 1 from t_repeat_data_type typ where cus.source_type_code = typ.c_data_type)
             and cus.customer_id = pho.customer_id
             and line2.c_cus_mobile_no is not null
             and pho.phone = line2.c_cus_mobile_no)
       and pho.phone_type = 3;
    if (v_cnt > 0) then
      update t_preins_tmp tmp
         set tmp.C_OTHERTYPE_REPEAT_FLAG='01',
             c_update_time       = sysdate
       where tmp.c_id = line2.c_id;
      commit;
      continue;
    end if;
  end loop;

exception
  when others then
    dbms_output.put_line('���ճɹ�����ȥ�س���' || sqlerrm(sqlcode));
end PROC_PREINS_REPEAT;
/

prompt
prompt Creating procedure PROC_PREPARE_BANK
prompt ====================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_PREPARE_bank(
  i_task_id in number,
  i_source_type_code in number,
  i_detail_id in number,
  o_ret_code out number
) as
  v_start_time timestamp;
  v_sysdate date;
begin
--��¼��ʼʱ��
v_start_time:=systimestamp;
v_sysdate:=sysdate;
o_ret_code:=0;
--����ǹ¶�������������,-2��������������
if i_source_type_code in(-2,0,1) then
merge into bank_accounts b
using(
    select Account_No,Customer_Id,partition_col,Bank_Code,Bank_Name From(
        select l.account_no,l.policy_holder_id customer_id,l.partition_col,l.bank_code,l.bank_name,
        row_number() over(partition by l.account_no order by policy_holder_id) rn 
        from temp_policy l 
        where length(l.policy_holder_id)>13 and  l.account_no is not null
    ) where rn=1
) r on (b.account_no=r.account_no)
when not matched then
insert values(r.Customer_Id,r.Account_No,r.Bank_Code,r.Bank_Name,r.partition_col);
o_ret_code:=sql%rowcount;
--������ǹ¶�������������
elsif i_source_type_code>1 then
merge into Bank_Accounts b
using(
    select Account_No,Customer_Id,Partition_Col,Bank_Name From(
        select l.bank_account account_no,l.customer_id,l.partition_col,l.bank_name,
        row_number() over(partition by l.bank_account order by l.customer_id) rn 
        from temp_customer l 
        where length(l.customer_id)>13 and l.bank_account is not null
    ) where rn=1
) r on (b.account_no=r.account_no)
when not matched then
insert values(r.Customer_Id,r.Account_No,null,r.Bank_Name,r.partition_col);
o_ret_code:=sql%rowcount;
end if;
--��������ϸ��״̬
update task_detail set completed=1,success_number=o_ret_code,begin_time=v_sysdate,end_time=sysdate
where task_id=i_task_id and detail_id=i_detail_id;
--��¼��־
insert into log_information(command_name, command_type, start_time,end_time,  add_number, condition_id)
values('����������Ϣ', 'Ԥ����', v_start_time,systimestamp, o_ret_code, i_task_id);
commit;
exception
      when others then
      rollback;
      o_ret_code:= -1;
      insert into log_information(command_name, command_type, start_time,end_time,  add_number, condition_id)
      values('����������Ϣ', '����--Ԥ����', v_start_time,systimestamp, o_ret_code, i_task_id);
end;
/

prompt
prompt Creating procedure PROC_PREPARE_UPDATE_ORPHAN
prompt =============================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_PREPARE_update_orphan(
  i_task_id in number,
  i_source_type_code in number,
  i_branch_code in number,
  o_ret_code out number
) as
  v_start_time timestamp;
  v_sysdate date;
begin
--��¼��ʼʱ��
v_start_time:=systimestamp;
v_sysdate:=sysdate;
o_ret_code:=0;
--����ǹ¶���
if i_source_type_code=0 and i_branch_code>0 then
update customer set orphan_status_code=1
where customer_id IN (
  select trim(cus.customer_id) customer_id from customer cus
  inner join d_branch_info d on cus.branch_code=d.branch_code
  and cus.orphan_status_code=0
  and d.d_branch_code =i_branch_code
  minus
  select distinct trim(policy_holder_id) customer_id from temp_policy_holder
);
o_ret_code:=sql%rowcount;
insert into log_information(command_name,command_type,start_time,end_time,add_number,condition_id)
values('��Ƿǹ¶���', 'Ԥ����', v_start_time,systimestamp, o_ret_code, i_task_id);
commit;
end if;
exception
  when others then
  o_ret_code:= -1;
  insert into log_information(command_name, command_type, start_time,end_time,  add_number, condition_id)
  values('��Ƿǹ¶���', '����--Ԥ����', v_start_time,systimestamp, o_ret_code, i_task_id);
END;
/

prompt
prompt Creating procedure PROC_PREPARE_CLEAN
prompt =====================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_PREPARE_clean(
   i_task_id in number,
   o_ret_code out number
) as
   v_start_time timestamp;
   v_sysdate date;
   v_source_type_code number;
   v_branch_code number;
begin
--��¼��ʼʱ��
v_start_time:=systimestamp;
v_sysdate:=sysdate;
o_ret_code:=0;
select source_type_code,branch_code into v_source_type_code,v_branch_code from tasks where id=i_task_id;
--�������
if v_source_type_code =7 then
insert into filter_red_black(customer_name,customer_id,telephone,remark,create_time)
select customer_name,customer_id ,phone,note,sysdate ct
FROM (
    select customer_name,customer_id ,phone,note,row_number() over(partition by customer_id order by phone) rn
    from(
      select customer_name,customer_id,family_phone phone,note from temp_customer
      union
      select customer_name,customer_id,office_phone phone,note from temp_customer
      union
      select customer_name,customer_id,mobile_phone phone,note from temp_customer
      union
      select customer_name,customer_id,other_phone phone,note from temp_customer
      union
      select customer_name,customer_id,charge_phone phone,note from temp_customer
    ) where phone is not null or customer_id is not null
)tp where rn=1 and (Fun_Check_Id(customer_id)=1 or phone is not null);
execute immediate 'truncate table temp_customer';
--���ֹ���
elsif v_source_type_code =8 then
execute immediate 'truncate table filter_class_code';
insert into filter_class_code(class_type,old_code, class_name,class_code,  remark, create_time)
select other_info_1,other_info_2,other_info_3,other_info_4,note,sysdate ct
FROM (
  select other_info_1,other_info_2,other_info_3,regexp_replace(other_info_4,'[^0-9]','') other_info_4,note,
  row_number() over (partition by regexp_replace(other_info_4,'[^0-9]','') order by other_info_3) rn
  from temp_customer where regexp_replace(other_info_4,'[^0-9]','') is not null
) l left join filter_class_code r on(l.other_info_4=r.class_code)
where rn=1 and r.class_code is null and length(other_info_4)<=10;
execute immediate 'truncate table temp_customer';
else
--��Ƿǹ¶���
PROC_PREPARE_update_orphan(i_task_id,v_source_type_code,v_branch_code,o_ret_code);
end if;
--��¼��־
insert into log_information(command_name,command_type,start_time,end_time,update_number,condition_id)
values('���Ԥ������������õ��м��','Ԥ����',v_start_time,systimestamp,o_ret_code,i_task_id);
commit;
exception when others then
   rollback;
   o_ret_code:= -1;
   insert into log_information(command_name, command_type, start_time,end_time,update_number,condition_id)
   values('���Ԥ������������õ��м��', '����--Ԥ����', v_start_time,systimestamp,o_ret_code,i_task_id);
END;
/

prompt
prompt Creating procedure PROC_PREPARE_CUSTOMER_INSERT
prompt ===============================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_PREPARE_CUSTOMER_INSERT
(
  i_task_id in number,
  i_source_type_code in number,
  I_Branch_Code In Number,
  i_partition_code in number,
  i_detail_id in number,
  o_ret_code out number
) as
 v_sql varchar2(9000);
 vc_PARTITION varchar2(10);
 v_start_time timestamp;
 V_Sysdate Date;
 v_branch_code number(6);
begin
--��¼��ʼʱ��
vc_PARTITION :='PART0'||i_partition_code;
v_start_time:=systimestamp;
v_sysdate:=sysdate;
O_Ret_Code:=0;
Select Min(Branch_Code) Into V_Branch_Code From D_Branch_Info Where D_Branch_Code=I_Branch_Code;
v_branch_code:=nvl(v_branch_code,0);
 --��������
 --����ǹ¶�������������,-2��������������
 --2011-12-27 c.s.l add �ж��Ƿ�����ڽ�����
 --ISMEET
 --fun_pay_way(wp.begin_date,wp.charge_way) ISMEET
if i_source_type_code in(-2,0,1) then
v_sql:='insert into customer PARTITION ('||vc_PARTITION||')(
  customer_id,copy_id,customer_name,birthday,gender_code,marital_status,death_critical_illness,family_zip_code,job_name,company_zip_code
  ,contact_address,company,email,fax,tel_code,zone_code,education_level,income,govern_id,revist_time,revist_result,age_zone_code,birthdate_month_day_code
  ,from_last_revist_time_code,partition_col,update_time,company_delivery_code,branch_delivery_code,pay_by_pos_code,pay_by_bank_code
 ,policy_status_code,bank_status_code,zone_type_code,has_ftele_code,has_ctele_code,has_mobile_code,has_rectele_code,clear_status_code,
  level_code,source_type_code,branch_code,orphan_status_code,task_id,ISMEET,IS_FILTER_RED
)
 select
     wc.customer_id ,wc.copy_id  ,wc.policy_holder_name customer_name  ,wc.birthday  ,case when wc.gender_code in(''1'',''2'') then to_number(wc.gender_code) else 0 end  gender_code ,wc.marital_status  ,wc.death_critical_illness
    ,wc.family_zip_code  ,wc.job_name  ,wc.company_zip_code  ,wc.contact_address  ,wc.company  ,wp.email  ,wp.fax  ,wp.tel_code  ,wp.reczip
    ,wp.education_level  ,wp.income  ,wp.govern_id  ,wc.revist_time  ,nvl(wc.revist_result,0)revist_result  ,wc.age_zone_code
    ,wc.birthdate_month_day_code  ,wc.from_last_revist_time_code  ,wc.partition_col
      --�����ڱ�����Ϣ
    ,wp.update_time  ,nvl(sd.is_head_company_delivery,0) company_delivery_code  ,nvl(sd.is_branchi_delivery,0) branch_delivery_code
    ,nvl(sd.is_pos_pay,0)  pay_by_pos_code  ,nvl(sd.is_bank_proxy,0)  pay_by_bank_code
    ,nvl(ps.policy_code,case wp.policy_status when null then 4 else 3 end) policy_status_code
    ,case when wp.account_no is null then 0 else 1 end bank_status_code  ,nvl(gt.zone_type_code,3) zone_type_code
    --�����ڵ绰��ά����Ϣ
    ,nvl(wt.has_ftele_code,0)    has_ftele_code  ,nvl(wt.has_ctele_code,0)   has_ctele_code  ,nvl(wt.has_mobile_code,0)  has_mobile_code
    ,nvl(wt.has_rectele_code,0) has_rectele_code  ,nvl(wt.clear_status_code,0) clear_status_code  ,fun_level_code(
    '''||i_source_type_code||''' ,nvl(ps.policy_code,case wp.policy_status when null then 4 else 3 end),nvl(wc.revist_result,0)
    ,wc.age_zone_code    ,nvl(gt.zone_type_code,3)    ,case when wp.account_no is  null then 0 else 1 end    ,0
    ) level_code
    , '''||i_source_type_code||''' source_type_code,nvl(gt.child_branch_code,'||v_branch_code||')  branch_code
    ,case '||i_source_type_code||' when 0 then 0 else 3 end orphan_status_code,'||i_task_id||' task_id,
    fun_pay_way('''||i_source_type_code||''',wp.begin_date,wp.charge_way) ISMEET
    ,nvl(wf.IS_FILTER_RED,0) IS_FILTER_RED
  from(
    select  c.*,p.policy_row_id
    from(
    --�ۺϺ��Ͷ������Ϣ
    select
      l.policy_holder_id customer_id,
      '||i_partition_code||' partition_col,
      max(l.policy_holder_copy_id)   copy_id,
      max(l.policy_holder_name)      policy_holder_name,
      max(l.BIRTHDAY)                BIRTHDAY,
      max(l.gender_code)             gender_code,
      max(l.MARITAL_STATUS)          MARITAL_STATUS,
      max(l.DEATH_CRITICAL_ILLNESS)  DEATH_CRITICAL_ILLNESS,
      max(l.FAMILY_ZIP_CODE)         FAMILY_ZIP_CODE,
      max(l.JOB_NAME)                JOB_NAME,
      max(l.company_zip_code)        company_zip_code,
      max(l.contact_address)         contact_address,
      max(l.company)                 company,
      max(l.BRANCH_ABBREVIATION)     BRANCH_ABBREVIATION,
      max(l.revist_time)             revist_time,
      max(l.revist_result)           revist_result,
      max(fun_age_check(l.birthday,to_date('''||V_SYSDATE||''')))           age_zone_code,
      max(l.family_phone) ftele,
      max(l.office_phone) ctele,
      max(fun_birth_month_day_code(l.birthday)) birthdate_month_day_code,
      max(fun_date_diff(l.revist_time,to_date('''||V_SYSDATE||'''))) from_last_revist_time_code
      from (
        select np.* from p_customer_update_parts PARTITION ('||vc_PARTITION||')  p
        left join temp_policy_holder   PARTITION ('||vc_PARTITION||') np on p.row_id =np.rowid
        where p.customer_row_id is null
      ) l
    group by l.policy_holder_id
    ) c
    left join (
     select policy_holder_id,max(rowid) keep(dense_rank first order by begin_date desc) policy_row_id
     from policy PARTITION ('||vc_PARTITION||')
     group by policy_holder_id
    ) p on  c.customer_id = p.policy_holder_id
 ) wc
 left join policy PARTITION ('||vc_PARTITION||') wp on wc.policy_row_id = wp.rowid
 left join  help_govern_phone_code gt on trim(wp.govern_id)=gt.govern_id
 left join static_delivery_infor sd on wp.reczip=sd.zone_code
 left join(
    select ''2'' policy_status,1 policy_code from dual
    union all
    select ''6'' policy_status,2 policy_code from dual
    union all
    select ''f'' policy_status,2 policy_code from dual
    union all
    select ''F'' policy_status,2 policy_code from dual
 )ps on wp.policy_status=ps.policy_status
 left join (
      select
        customer_id
        ,max(case when phone_type=1 then 1 else 0 end) has_ftele_code
        ,max(case when phone_type=2 then 1 else 0 end) has_ctele_code
        ,max(case when phone_type=3 then 1 else 0 end) has_mobile_code
        ,max(case when phone_type=4 then 1 else 0 end) has_rectele_code
        ,1 clear_status_code
        from temp_policy_holder PARTITION ('||vc_PARTITION||') h  inner join customer_phone PARTITION ('||vc_PARTITION||') cp
        on(h.policy_holder_id=cp.customer_id)
        group by customer_id
 ) wt on wc.customer_id=wt.customer_id
 LEFT JOIN (SELECT DISTINCT CUSTOMER_ID
                            ,1 IS_FILTER_RED
                    FROM TEMP_POLICY_HOLDER PARTITION('||vc_PARTITION||') TPH
                    INNER JOIN CUSTOMER_PHONE PARTITION('||vc_PARTITION||') CP2
                       ON (TPH.POLICY_HOLDER_ID = CP2.CUSTOMER_ID)
                    WHERE EXISTS (SELECT 1 FROM FILTER_RED_BLACK FRB WHERE CP2.PHONE = FRB.TELEPHONE)) WF
           ON WC.CUSTOMER_ID = WF.CUSTOMER_ID
 where Fun_Check_Id(wc.customer_id)+nvl(wt.clear_status_code,0)>0';

--ɾ���Ѿ����������
--������ǹ¶�������������
else
v_sql:='insert into customer PARTITION ('||vc_PARTITION||')(
  customer_id,customer_name,birthday,gender_code,marital_status,death_critical_illness,family_zip_code,job_name,company_zip_code
  ,family_address,company_address,contact_address,company,email,fax,tel_code,zone_code
  ,education_level,income,govern_id,age_zone_code,birthdate_month_day_code
  ,partition_col,company_delivery_code,branch_delivery_code,pay_by_pos_code,pay_by_bank_code,policy_status_code
 ,branch_code,bank_status_code,zone_type_code,has_ftele_code,has_ctele_code,has_mobile_code,has_rectele_code,clear_status_code
  ,source_type_code,level_code,orphan_status_code,task_id,city,province,note,any_date,other_info_1,other_info_2,other_info_3,other_info_4,other_info_5,IS_FILTER_RED
)
select wc.customer_id  ,wc.customer_name  ,wc.birthday  ,case when wc.gender_code in(''1'',''2'') then to_number(wc.gender_code) else 0 end  gender_code  ,wc.marital_status  ,wc.death_critical_illness
    ,wc.family_zip_code  ,wc.job_name  ,wc.company_zip_code  ,wc.family_address,wc.company_address,wc.contact_address  ,wc.company  ,wc.email  ,wc.fax  ,wc.tel_code  ,wc.zone_code
    ,wc.education_level  ,wc.income  ,wc.govern_id  ,wc.age_zone_code
    ,wc.birthdate_month_day_code  ,wc.partition_col
    ,nvl(sd.is_head_company_delivery,0) company_delivery_code  ,nvl(sd.is_branchi_delivery,0) branch_delivery_code
    ,nvl(sd.is_pos_pay,0)  pay_by_pos_code  ,nvl(sd.is_bank_proxy,0)  pay_by_bank_code
    ,nvl(wp.policy_status,4) policy_status_code,nvl(gt.child_branch_code,nvl(tel.child_branch_code,'||v_branch_code||'))  branch_code
    ,case when wc.account_no is null then 0 else 1 end bank_status_code  ,nvl(gt.zone_type_code,nvl(tel.zone_type_code,3)) zone_type_code
    --�����ڵ绰��ά����Ϣ
    ,nvl(wt.has_ftele_code,0)    has_ftele_code  ,nvl(wt.has_ctele_code,0)   has_ctele_code  ,nvl(wt.has_mobile_code,0)  has_mobile_code
    ,nvl(wt.has_rectele_code,0) has_rectele_code  ,nvl(wt.clear_status_code,0) clear_status_code  , '''||i_source_type_code||''' source_type_code
    ,fun_level_code(
    '''||i_source_type_code||''' ,nvl(wp.policy_status,4) ,0
    ,wc.age_zone_code    ,nvl(gt.zone_type_code,3)    ,case when wc.account_no is  null then 0 else 1 end    ,0
    ) level_code, 3 orphan_status_code,'||i_task_id||' task_id
    ,wc.city,wc.province,wc.note,wc.any_date,wc.other_info_1,wc.other_info_2,wc.other_info_3,wc.other_info_4,wc.other_info_5,nvl(wf.IS_FILTER_RED,0) IS_FILTER_RED
from (
    select l.CUSTOMER_ID
    ,max(l.partition_col)partition_col
    ,max(l.bank_account) account_no
    ,max(l.SOURCE_TYPE_CODE)SOURCE_TYPE_CODE
    ,max(l.BRANCH_ABBREVIATION)BRANCH_ABBREVIATION
    ,max(l.customer_name)customer_name
    ,max(l.COPY_ID) copy_id
    ,max(l.BIRTHDAY)BIRTHDAY
    ,max(l.gender_code)gender_code
    ,max(l.MARITAL_STATUS)MARITAL_STATUS
    ,max(l.DEATH_CRITICAL_ILLNESS)DEATH_CRITICAL_ILLNESS
    ,max(l.FAX)FAX
    ,max(l.FAMILY_ZIP_CODE)FAMILY_ZIP_CODE
    ,max(l.COMPANY_ZIP_CODE)COMPANY_ZIP_CODE
    ,max(l.FAMILY_ADDRESS)FAMILY_ADDRESS
    ,max(l.COMPANY_ADDRESS)COMPANY_ADDRESS
    ,max(l.CONTACT_ADDRESS)CONTACT_ADDRESS
    ,max(l.JOB_NAME)JOB_NAME
    ,max(l.company)company
    ,max(l.education_level)education_level
    ,max(l.income)income
    ,max(l.EMAIL)EMAIL
    ,max(l.PROVINCE)PROVINCE
    ,max(l.city)city
    ,max(l.govern_id) govern_id
    ,max(l.tel_code)tel_code
    ,max(l.zone_code)zone_code
    ,max(fun_age_check(l.birthday)) age_zone_code
    ,max(fun_birth_month_day_code(l.birthday)) birthdate_month_day_code
    ,max(l.AGE)AGE
    ,max(l.NOTE)NOTE
    ,max(l.ANY_DATE)ANY_DATE
    ,max(l.OTHER_INFO_1)OTHER_INFO_1
    ,max(l.OTHER_INFO_2)OTHER_INFO_2
    ,max(l.OTHER_INFO_3)OTHER_INFO_3
    ,max(l.OTHER_INFO_4)OTHER_INFO_4
    ,max(l.other_info_5)other_info_5
    ,max(l.is_accept_donation)is_accept_donation
    ,max(case when l.bank_account is null then 0 else 1 end) bank_status_code
    from (
        select np.* from p_customer_update_parts partition ('||vc_PARTITION||')  p
        left join temp_customer   PARTITION ('||vc_PARTITION||') np  on p.row_id =np.rowid
        where  p.customer_row_id is null
      )l
    GROUP BY l.CUSTOMER_ID
  ) wc left join (
     select policy_holder_id,min(nvl(ps.policy_code,case p.policy_status when null then 4 else 3 end)) keep(dense_rank first order by update_time) policy_status
     from policy PARTITION ('||vc_PARTITION||') p
     left join(
        select ''2'' policy_status,1 policy_code from dual
        union all
        select ''6'' policy_status,2 policy_code from dual
        union all
        select ''f'' policy_status,2 policy_code from dual
        union all
        select ''F'' policy_status,2 policy_code from dual
      )ps on p.policy_status=ps.policy_status
     group by policy_holder_id
    ) wp on  wc.customer_id = wp.policy_holder_id
  left join help_govern_phone_code gt on trim(wc.govern_id)=gt.govern_id
   left join static_delivery_infor sd on wc.zone_code=sd.zone_code
   left join (
        select
      customer_id
      ,max(case when phone_type=1 then 1 else 0 end) has_ftele_code
      ,max(case when phone_type=2 then 1 else 0 end) has_ctele_code
      ,max(case when phone_type=3 then 1 else 0 end) has_mobile_code
      ,max(case when phone_type=4 then 1 else 0 end) has_rectele_code
      ,1 clear_status_code
      from temp_customer PARTITION ('||vc_PARTITION||')  inner join customer_phone PARTITION ('||vc_PARTITION||')
      using(customer_id)
      group by customer_id
   ) wt on wc.customer_id=wt.customer_id
   left join(
     select child_branch_code,zone_type_code,tel_code
    from(
           select child_branch_code,zone_type_code,phone_code tel_code
           ,row_number() over(partition by phone_code order by zone_type_code asc) rn
           from help_govern_phone_code
    ) where rn=1
   ) tel on wc.tel_code=tel.tel_code
   LEFT JOIN (SELECT DISTINCT CP2.CUSTOMER_ID
                                  ,1 IS_FILTER_RED
                     FROM TEMP_CUSTOMER  TPH
                    INNER JOIN CUSTOMER_PHONE CP2
                       ON (TPH.Customer_Id = CP2.CUSTOMER_ID)
                    WHERE EXISTS (SELECT 1 FROM FILTER_RED_BLACK FRB WHERE CP2.PHONE = FRB.TELEPHONE)) WF
           ON WC.CUSTOMER_ID = WF.CUSTOMER_ID
   where Fun_Check_Id(wc.customer_id)+nvl(wt.clear_status_code,0)>0';
end if;
execute immediate v_sql;
o_ret_code:=sql%rowcount;
--��������ϸ��״̬
update task_detail
set completed=1,
success_number=o_ret_code,
begin_time=v_sysdate,
end_time=sysdate
where task_id=i_task_id and detail_id=i_detail_id;
insert into log_information(command_name, command_type, start_time,end_time,  add_number, condition_id)
values('�����ͻ���Ϣ�������룺'||i_partition_code, 'Ԥ����', v_start_time,systimestamp, o_ret_code, i_task_id);

commit;
exception
  when others then
  rollback;
  o_ret_code:= -1;
   insert into log_information(command_name, command_type, start_time,end_time,  add_number, condition_id)
   values('�����ͻ���Ϣ�������룺'||i_partition_code, '����--Ԥ����', v_start_time,systimestamp, o_ret_code, i_task_id);
   commit;
END;
/

prompt
prompt Creating procedure PROC_PREPARE_DELETE_REPEAT
prompt =============================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.proc_prepare_delete_repeat(
  i_task_id in number,
  i_detail_id in number,
  o_ret_code out number
) as
  v_start_time timestamp;
  v_sysdate date;
  v_source_type_code number(6);
begin
--��¼��ʼʱ��
v_start_time:=systimestamp;
v_sysdate:=sysdate;
o_ret_code:=0;
select min(source_type_code) into v_source_type_code from tasks where id=i_task_id;
v_source_type_code:=nvl(v_source_type_code,0);
if i_detail_id=99 then
execute immediate 'truncate table p_policy_update_parts';
insert into p_policy_update_parts (partition_col,row_id,policy_row_id)
select nvl(np.partition_col,t.partition_col)partition_col,t.row_id,np.rowid from (
   select class_code,policy_no,partition_col,row_id FROM (
       select Class_Code,Policy_No,t.rowid row_id,t.partition_col,row_number() over(partition by t.class_code ,t.policy_no order by t.update_time desc) row_num 
       from temp_policy t
       where class_code is not null and policy_no is not null
   ) where row_num =1
) t
left join policy np on t.Class_Code=np.Class_Code and t.Policy_No=np.Policy_No;
end if;
if i_detail_id=999 then
execute immediate 'truncate table p_customer_update_parts';
--���������մ���-2
  if v_source_type_code in(-2,0,1) then
    insert into p_customer_update_parts (partition_col,row_id,customer_row_id)
    select nvl(wo.partition_col,wc.partition_col) partition_col,wc.rowid,wo.rowid from temp_policy_holder wc
    left join customer wo on trim(wc.policy_holder_id)=trim(wo.customer_id);
  else
    insert into p_customer_update_parts (partition_col,row_id,customer_row_id)
    select nvl(wo.partition_col,wc.partition_col) partition_col,wc.rowid,wo.rowid from temp_customer wc
    left join customer wo on trim(wc.customer_id)=trim(wo.customer_id);
  end if;
end if;
o_ret_code:=sql%rowcount;
--��������ϸ��״̬
update task_detail SET completed=1,success_number=o_ret_code,begin_time=v_sysdate,end_time=sysdate
where task_id=i_task_id and detail_id=i_detail_id;
--��¼��־
insert into log_information(command_name,command_type,start_time,end_time,update_number,condition_id)
values('ɾ���ͻ�/�����ظ���Ϣ','Ԥ����',v_start_time,systimestamp,o_ret_code,i_task_id);
commit;
exception when others then
   rollback;
   o_ret_code:=-1;
   insert into log_information(command_name,command_type,start_time,end_time,update_number,condition_id)
   values('ɾ���ͻ�/�����ظ���Ϣ', '����--Ԥ����', v_start_time,systimestamp, o_ret_code, i_task_id);
END;
/

prompt
prompt Creating procedure PROC_PREPARE_PHONE
prompt =====================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_PREPARE_phone(
  i_task_id in number,
  i_detail_id in number,
  o_ret_code out number
) as
  v_start_time timestamp;
  v_sysdate date;
  v_source_type_code number(6);
begin
--��¼��ʼʱ��
v_start_time:=systimestamp;
v_sysdate:=sysdate;
o_ret_code:=0;
select source_type_code into v_source_type_code from tasks where id=i_task_id;
--���������մ���-2
if v_source_type_code in (-2,0,1) then
--��ȥ�绰�ظ��������ϵĵ绰д�����ݿ�
insert into customer_phone (customer_id,partition_col,phone,phone_type,tel_code)
SELECT l.customer_id,l.partition_col,l.phone,l.phone_type,l.tel_code
from (
  select t.*,row_number() over (partition by t.phone order by t.customer_id) rn
  from p_customer_phone t
) l left join customer_phone r on l.phone=r.phone
where r.phone is null and l.rn=1;
o_ret_code:=sql%rowcount;
--��������ϸ��״̬
update task_detail set completed=1,success_number=o_ret_code,begin_time=v_sysdate,end_time=sysdate
where task_id=i_task_id and detail_id=i_detail_id;
insert into log_information(command_name, command_type, start_time,end_time,add_number,condition_id)
values('��������ͻ��绰����', 'Ԥ����', v_start_time,systimestamp, o_ret_code, i_task_id);
end if;
commit;
exception
      when others then
      rollback;
      o_ret_code:= -1;
      insert into log_information(command_name, command_type, start_time,end_time,  add_number, condition_id)
      values('��������ͻ��绰����', '����--Ԥ����', v_start_time,systimestamp, o_ret_code, i_task_id);
END;
/

prompt
prompt Creating procedure PROC_PREPARE_PHONE_PARTS
prompt ===========================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_PREPARE_phone_parts(
  i_task_id in number,
  i_source_type_code in number,
  i_branch_code in number,
  i_is_fix_phone in number,
  i_detail_id in number,
  i_partition_code in number,
  o_ret_code out number
) as
  v_start_time timestamp;
  v_sysdate date;
  v_sql varchar2(6000);
  Vc_Partition Varchar2(10);
  v_is_fix_phone number(1);
begin
--��¼��ʼʱ��
vc_PARTITION :='PART0'||i_partition_code;
v_start_time:=systimestamp;
v_sysdate:=sysdate;
O_Ret_Code:=0;
select is_fix_number into v_is_fix_phone from tasks where id=i_task_id;
--����ǹ¶�������������,-2��������������
if i_source_type_code in(-2,0,1)  then
v_sql:='insert into p_customer_phone(customer_id,partition_col,phone_type,tel_code,phone)
with w_all_phone as(
    select t.policy_holder_id customer_id,t.partition_col,t.family_phone,t.office_phone,t.mobile_phone,t.other_phone,H.phone_code tel_code 
    From temp_policy_holder PARTITION ( '||vc_PARTITION||') t
    left join temp_policy PARTITION ( '||vc_PARTITION||') p on t.policy_holder_id=p.policy_holder_id
    left join help_govern_phone_code h on trim(p.govern_id)=trim(h.govern_id)
),
w_p_all_phone as(
    select p.policy_holder_id customer_id,p.partition_col,p.charge_phone,p.mobile_phone,p.other_phone ,H.phone_code  tel_code 
    From temp_policy PARTITION ( '||vc_PARTITION||') p
    left join help_govern_phone_code h on p.govern_id=h.govern_id
)
select t.customer_id,t.partition_col,t.phone_type,t.tel_code,t.phone from (
  select distinct customer_id,partition_col,min(phone_type) over (partition by customer_id,phone) phone_type
  ,max(tel_code)  over (partition by customer_id,phone) tel_code,phone
  from (
    select customer_id,partition_col,case when is_mobile=1 then 3 else phone_type end phone_type,tel_code,case
    when (change_code+change_phone+has_code)=0 and is_mobile=0 then
         (now_code||phone)
    when (change_code+change_phone)=2 and is_mobile=0 and instr(nvl(first_number_list,''1234567890''),substr(phone,(1-old_length),1),1)>0 then
         (now_code||add_number||substr(phone,-old_length,old_length))
    when change_code=1 and change_phone=0 and is_mobile=0 then
         (now_code||substr(phone,-now_length,now_length))
    when change_phone=1 and is_mobile=0 and instr(nvl(first_number_list,''1234567890''),substr(phone,(1-old_length),1),1)>0 then
         (now_code||add_number||substr(phone,-old_length,old_length)) else phone end phone
    from (
                select  customer_id,partition_col,1 phone_type,family_phone phone,tel_code
                ,case when substr(family_phone,1,1)=''0'' and length(family_phone)>9 then 1 else 0 end has_code
                ,case when substr(family_phone,1,1)=''1'' and length(family_phone)=11 then 1 else 0 end is_mobile
                from w_all_phone where length(family_phone)>5
                Union All
                select  customer_id,partition_col,2 phone_type,office_phone phone,tel_code
                ,case when substr(office_phone,1,1)=''0'' and length(office_phone)>9 then 1 else 0 end has_code
                ,case when substr(office_phone,1,1)=''1'' and length(office_phone)=11 then 1 else 0 end is_mobile
                 from w_all_phone where length(office_phone)>5
                Union All
                select  customer_id,partition_col,4 phone_type,mobile_phone phone,tel_code
                ,case when substr(mobile_phone,1,1)=''0'' and length(mobile_phone)>9 then 1 else 0 end has_code
                ,case when substr(mobile_phone,1,1)=''1'' and length(mobile_phone)=11 then 1 else 0 end is_mobile
                 from w_all_phone where length(mobile_phone)>5
                Union All
                select  customer_id,partition_col,4 phone_type,other_phone phone,tel_code
                ,case when substr(other_phone,1,1)=''0'' and length(other_phone)>9 then 1 else 0 end has_code
                ,case when substr(other_phone,1,1)=''1'' and length(other_phone)=11 then 1 else 0 end is_mobile
                 from w_all_phone where length(other_phone)>5
                Union All
                select  customer_id,partition_col,4 phone_type,charge_phone phone,tel_code
                ,case when substr(charge_phone,1,1)=''0'' and length(charge_phone)>9 then 1 else 0 end has_code
                ,case when substr(charge_phone,1,1)=''1'' and length(charge_phone)=11 then 1 else 0 end is_mobile
                 from w_p_all_phone where length(charge_phone)>5
                Union All
                select  customer_id,partition_col,4 phone_type,mobile_phone phone,tel_code
                ,case when substr(mobile_phone,1,1)=''0'' and length(mobile_phone)>9 then 1 else 0 end has_code
                ,case when substr(mobile_phone,1,1)=''1'' and length(mobile_phone)=11 then 1 else 0 end is_mobile
                 from w_p_all_phone where length(mobile_phone)>5
                Union All
                select  customer_id,partition_col,4 phone_type,other_phone phone,tel_code
                ,case when substr(other_phone,1,1)=''0'' and length(other_phone)>9 then 1 else 0 end has_code
                ,case when substr(other_phone,1,1)=''1'' and length(other_phone)=11 then 1 else 0 end is_mobile
                 from w_p_all_phone where length(other_phone)>5
         ) t left join phone_rule p on t.tel_code=p.code and is_mobile=0
  )t where regexp_like(t.phone,''^(0[123456789]\d{9,10})$|^(1[3456789]\d{9})$'')
) t left join customer_phone PARTITION ('||vc_PARTITION||') p on t.phone=p.phone
where p.phone is null ';
execute immediate v_sql;
--������ǹ¶�������������
elsif i_source_type_code>1 and v_is_fix_phone=1 and i_partition_code=0 then
insert into customer_phone(customer_id,partition_col,tel_code,phone_type,phone)
with w_all_phone as(
    --ȡ�����е绰,�������绰�����޸�����
    select t.customer_id,t.partition_col,t.family_phone,t.office_phone,t.mobile_phone,t.other_phone,t.charge_phone,
    case when t.tel_code is null then h.phone_code else t.tel_code end tel_code 
    FROM temp_customer t
    left join help_govern_phone_code h on trim(t.govern_id)=trim(h.govern_id)
)
select t.customer_id,t.partition_col,t.tel_code,t.phone_type,t.phone
from (
    --��8��:�ۺϵ绰���ͣ�׼���绰ȥ��
    select customer_id ,partition_col,tel_code,phone_type,phone,row_number() over(partition by phone order by customer_id) rn
    from(
        --���߲㣺�޸��绰
        select customer_id,partition_col,case when is_mobile=1 then 3 else phone_type end phone_type,tel_code,
        case 
        when p.code is null then phone
        when (change_code+change_phone+has_code)=0 then (now_code||phone)
        when (change_code+change_phone)=2 and instr(nvl(first_number_list,'1234567890'),substr(phone,(1-old_length),1),1)>0 then (now_code||add_number||substr(phone,-old_length,old_length))
        when change_code=1 and change_phone=0 then (now_code||substr(phone,-now_length,now_length))
        when change_phone=1 and instr(nvl(first_number_list,'1234567890'),substr(phone,(1-old_length),1),1)>0 then (now_code||add_number||substr(phone,-old_length,old_length))
        else phone
        end phone
        from (
              select customer_id,partition_col,1 phone_type,family_phone phone,tel_code
              ,case when substr(family_phone,1,1)='0' and length(family_phone)>9 then 1 else 0 end has_code
              ,case when substr(family_phone,1,1)='1' and length(family_phone)=11 then 1 else 0 end is_mobile
              from w_all_phone where length(family_phone)>5
              Union All
              select customer_id,partition_col,2 phone_type,office_phone phone,tel_code
              ,case when substr(office_phone,1,1)='0' and length(office_phone)>9 then 1 else 0 end has_code
              ,case when substr(office_phone,1,1)='1' and length(office_phone)=11 then 1 else 0 end is_mobile
              from w_all_phone where length(office_phone)>5
              Union All
              select customer_id,partition_col,4 phone_type,mobile_phone phone,tel_code
              ,case when substr(mobile_phone,1,1)='0' and length(mobile_phone)>9 then 1 else 0 end has_code
              ,case when substr(mobile_phone,1,1)='1' and length(mobile_phone)=11 then 1 else 0 end is_mobile
              from w_all_phone where length(mobile_phone)>5
              Union All
              select customer_id,partition_col,4 phone_type,other_phone phone,tel_code
              ,case when substr(other_phone,1,1)='0' and length(other_phone)>9 then 1 else 0 end has_code
              ,case when substr(other_phone,1,1)='1' and length(other_phone)=11 then 1 else 0 end is_mobile
              from w_all_phone where length(other_phone)>5
              Union All
              select customer_id,partition_col,4 phone_type,charge_phone phone,tel_code
              ,case when substr(charge_phone,1,1)='0' and length(charge_phone)>9 then 1 else 0 end has_code
              ,case when substr(charge_phone,1,1)='1' and length(charge_phone)=11 then 1 else 0 end is_mobile
              from w_all_phone where length(charge_phone)>5
        ) t left join phone_rule p on t.tel_code=p.code and is_mobile=0
        --���߲����
    ) t where regexp_like(t.phone,'^(0[123456789]\d{9,10})$|^(1[3456789]\d{9})$')
    --��7.5�����
) t left join customer_phone cp on t.phone=cp.phone
where cp.phone is null and t.rn=1;
elsif i_source_type_code>1 and v_is_fix_phone=0 and i_partition_code=0 then
insert into customer_phone(customer_id,partition_col,tel_code,phone_type,phone)
    --ȡ�����д������ȷ�绰
    select t.customer_id,t.partition_col,t.tel_code,t.phone_type,t.phone
    from (
      select customer_id ,partition_col,tel_code,case when substr(phone,1,1)='1' then 3 else phone_type end phone_type,
      phone,row_number() over(partition by phone order by customer_id) rn
      from(
        select customer_id,partition_col,1 phone_type,family_phone phone,tel_code from temp_customer
        where regexp_like(family_phone,'^(0[123456789]\d{9,10})$|^(1[3456789]\d{9})$')
        union all
        select customer_id,partition_col,2 phone_type,office_phone phone,tel_code  from temp_customer
        where regexp_like(office_phone,'^(0[123456789]\d{9,10})$|^(1[3456789]\d{9})$')
        union all
        select customer_id,partition_col,4 phone_type,mobile_phone phone,tel_code  from temp_customer
        where regexp_like(mobile_phone,'^(0[123456789]\d{9,10})$|^(1[3456789]\d{9})$')
        union all
        select customer_id,partition_col,4 phone_type,other_phone phone,tel_code  from temp_customer
        where regexp_like(other_phone,'^(0[123456789]\d{9,10})$|^(1[3456789]\d{9})$')
        union all
        select customer_id,partition_col,4 phone_type,charge_phone phone,tel_code  from temp_customer
        where regexp_like(charge_phone,'^(0[123456789]\d{9,10})$|^(1[3456789]\d{9})$')
      )  tp
    )t left join customer_phone cp on t.phone=cp.phone
    where cp.phone is null and t.rn=1;
end if;
O_Ret_Code:=Sql%Rowcount;
--��������ϸ��״̬
update task_detail set completed=1,success_number=o_ret_code,begin_time=v_sysdate,end_time=sysdate
where task_id=i_task_id and detail_id=i_detail_id;
--��¼��־
insert into log_information(command_name,command_type,start_time,end_time,add_number, condition_id)
values('��������ͻ��绰���룬���ţ�'||i_partition_code,'Ԥ����', v_start_time,systimestamp, o_ret_code, i_task_id);
commit;
exception
      when others then
      rollback;
      o_ret_code:= -1;
      insert into log_information(command_name, command_type, start_time,end_time,  add_number, condition_id)
      values('��������ͻ��绰���룬���ţ�'||v_sql, '����--Ԥ����', v_start_time,systimestamp, o_ret_code, i_task_id);
END;
/

prompt
prompt Creating procedure PROC_PREPARE_POLICY_INSERT
prompt =============================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_PREPARE_policy_insert(
  i_task_id in number,
  i_source_type_code in number,
  i_policy_partition_code in number,
  i_detail_id in number,
  o_ret_code out number
) as
  v_start_time timestamp;
  v_sysdate date;
  vc_PARTITION VARCHAR2(10);
  v_sql varchar2(2000);
begin
--��¼��ʼʱ��
v_start_time:=systimestamp;
v_sysdate:=sysdate;
o_ret_code:=0;
vc_PARTITION:='PART0'||i_policy_partition_code;
--����ǹ¶�������������,-2��������������
if i_source_type_code in(-2,0,1) then
--���뱣����Ϣ
v_sql:='insert into policy PARTITION ('||vc_PARTITION||')(
  policy_no,class_code,class_name,policy_status,claim_status,payment_status,pieces,begin_date,end_date,charge_copy
  ,Charge_Way,Charge_Status,Charge_End_Date,Charge_Years,Charge_End_Ages,Charge_Total_Times,Charge_Total_Amount,Relation,Recognizee_Age
  ,policy_holder_id,partition_col,policy_holder_copy_id,recognizee_holder_id,recognizee_holder_copy_id,employee_no,account_type,account_no,bank_code
  ,bank_name,market_channel,govern_id,govern_name,tel_code,branch_abbreviation,branch_name,charge_phone,reczip ,mobile_phone,fax,email
  ,education_level ,income,update_time,recieve_time,other_phone,policy_partition_col
)
(select t.policy_no,t.class_code,t.class_name,t.policy_status,t.claim_status,t.payment_status,t.pieces,t.begin_date,t.end_date,t.charge_copy
  ,t.Charge_Way,t.Charge_Status,t.Charge_End_Date,t.Charge_Years,t.Charge_End_Ages,t.Charge_Total_Times,t.Charge_Total_Amount,t.Relation,t.Recognizee_Age
  ,t.policy_holder_id,t.partition_col,t.policy_holder_copy_id,t.recognizee_holder_id,t.recognizee_holder_copy_id,t.employee_no,t.account_type,t.account_no,t.bank_code
  ,t.bank_name,t.market_channel,t.govern_id,t.govern_name,t.tel_code,t.branch_abbreviation,t.branch_name,t.charge_phone,t.zone_code reczip ,t.mobile_phone,t.fax,t.email
  ,t.edulevel education_level ,t.income,t.update_time,t.recieve_time,t.other_phone,t.policy_partition_col
from p_policy_update_parts PARTITION ('||vc_PARTITION||') pr
left join temp_policy PARTITION ('||vc_PARTITION||') t on chartorowid(pr.row_id)= t.rowid
where pr.policy_row_id is null)';
execute immediate v_sql;
o_ret_code:=sql%rowcount;
--��������ϸ��״̬
update task_detail set completed=1,success_number=o_ret_code,begin_time=v_sysdate,end_time=sysdate
where task_id=i_task_id and detail_id=i_detail_id;
insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
values('���뱣�����������룺'||i_policy_partition_code, 'Ԥ����', v_start_time,systimestamp, o_ret_code, i_task_id);
commit;
end if;
exception
   when others then
   rollback;
   o_ret_code:= -1;
   insert into log_information(command_name, command_type, start_time,end_time,  update_number, condition_id)
   values('���뱣�����������룺'||i_policy_partition_code, '����--Ԥ����', v_start_time,systimestamp, o_ret_code, i_task_id);
   commit;
end;
/

prompt
prompt Creating procedure PROC_PREPARE_POLICY_PARTS
prompt ============================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_PREPARE_policy_parts
(
  i_task_id in number,
  i_source_type_code in number,
  i_detail_id in number,
  i_policy_partition_code in number,
  o_ret_code out number
) as
 v_sql varchar2(8000);
 v_start_time timestamp;
 vc_PARTITION varchar2(10);
 v_sysdate date;
 v_errcode   number; 
v_errmsg    varchar2(100);
begin
--��¼��ʼʱ��
v_start_time:=systimestamp;
vc_PARTITION :='PART0'||i_policy_partition_code;
v_sysdate:=sysdate;
o_ret_code:=0;
 --����ǹ¶�������������,-2��������������
if i_source_type_code in(-2,0,1) then
v_sql:='
MERGE INTO policy PARTITION ('||vc_PARTITION||') a
USING (
    select
      t.* ,
      pr.policy_row_id policy_row_id
      From p_policy_update_parts PARTITION ('||vc_PARTITION||') pr
      inner join Temp_Policy PARTITION ('||vc_PARTITION||') T on T.rowid= pr.row_id
   ) b
ON (a.rowid=b.policy_row_id)
WHEN MATCHED THEN UPDATE SET
    a.class_name=nvl(b.class_name,a.class_name)
   ,a.policy_status=nvl(b.policy_status,a.policy_status)
   ,a.claim_status=nvl(b.claim_status,a.claim_status)
   ,a.payment_status=nvl(b.payment_status,a.payment_status)
   ,a.pieces=nvl(b.pieces,a.pieces)
   ,a.begin_date=nvl(b.begin_date,a.begin_date)
   ,a.end_date=nvl(b.end_date,a.end_date)
   ,a.charge_copy=nvl(b.charge_copy,a.charge_copy)
   ,a.charge_way=nvl(b.Charge_Way,a.Charge_Way)
   ,a.charge_status=nvl(b.Charge_Status,a.Charge_Status)
   ,a.charge_end_date=nvl(b.Charge_End_Date,a.Charge_End_Date)
   ,a.charge_years=nvl(b.Charge_Years,a.Charge_Years)
   ,a.charge_end_ages=nvl(b.Charge_End_Ages,a.Charge_End_Ages)
   ,a.charge_total_times=nvl(b.Charge_Total_Times,a.Charge_Total_Times)
   ,a.charge_total_amount=nvl(b.Charge_Total_Amount,a.Charge_Total_Amount)
   ,a.relation=nvl(b.Relation,a.Relation)
   ,a.recognizee_age=nvl(b.Recognizee_Age,a.Recognizee_Age)
   ,a.policy_holder_id=nvl(b.policy_holder_id,a.policy_holder_id)
   ,a.policy_holder_copy_id=nvl(b.policy_holder_copy_id,a.policy_holder_copy_id)
   ,a.recognizee_holder_id=nvl(b.recognizee_holder_id,a.recognizee_holder_id)
   ,a.recognizee_holder_copy_id=nvl(b.recognizee_holder_copy_id,a.recognizee_holder_copy_id)
   ,a.employee_no=nvl(b.employee_no,a.employee_no)
   ,a.account_type=nvl(b.account_type,a.account_type)
   ,a.account_no=nvl(b.account_no,a.account_no)
   ,a.bank_code=nvl(b.bank_code,a.bank_code)
   ,a.bank_name=nvl(b.bank_name,a.bank_name)
   ,a.market_channel=nvl(b.market_channel,a.market_channel)
   ,a.govern_id=nvl(b.govern_id,a.govern_id)
   ,a.govern_name=nvl(b.govern_name,a.govern_name)
   ,a.tel_code=nvl(b.tel_code,a.tel_code)
   ,a.branch_abbreviation=nvl(b.branch_abbreviation,a.branch_abbreviation)
   ,a.branch_name=nvl(b.branch_name,a.branch_name)
   ,a.reczip=nvl(b.zone_code,a.reczip)
   ,a.charge_phone =nvl(b.charge_phone,a.charge_phone)
   ,a.mobile_phone=nvl(b.mobile_phone,a.mobile_phone)
   ,a.other_phone=nvl(b.other_phone,a.other_phone)
   ,a.fax=nvl(b.fax,a.fax)
   ,a.email=nvl(b.email,a.email)
   ,a.education_level=nvl(b.edulevel,a.education_level)
   ,a.income=nvl(b.income,a.income)
   ,a.update_time=nvl(b.update_time,a.update_time)
   ,a.recieve_time=nvl(b.recieve_time,a.recieve_time)
   WHEN NOT MATCHED THEN  INSERT
   VALUES (b.policy_no,b.class_code,b.class_name,b.policy_status,b.claim_status,b.payment_status,
    b.pieces,b.begin_date,b.end_date,b.charge_copy,b.charge_way,b.charge_status,b.charge_end_date,
    b.charge_years,b.charge_end_ages,b.charge_total_times,b.charge_total_amount,b.relation,b.recognizee_age,
    b.policy_holder_id,b.policy_holder_copy_id,b.recognizee_holder_id,b.recognizee_holder_copy_id,b.employee_no,
    b.account_type,b.account_no,b.bank_code,b.bank_name,b.market_channel,b.govern_id,b.govern_name,
    b.tel_code,b.branch_abbreviation,b.branch_name,b.zone_code,b.charge_phone,b.mobile_phone,
    b.other_phone,b.fax,b.email,b.edulevel,b.income,b.update_time,b.recieve_time,
    null,null,null,b.partition_col,0)';
execute immediate v_sql;
o_ret_code:=sql%rowcount;

--��������ϸ��״̬
update task_detail
set completed=1,
success_number=o_ret_code,
begin_time=v_sysdate,
end_time=sysdate
where task_id=i_task_id and detail_id=i_detail_id;
insert into log_information(command_name, command_type, start_time,end_time,  add_number, condition_id)
values('�������±����������룺'||i_policy_partition_code, 'Ԥ����', v_start_time,systimestamp, o_ret_code, i_task_id);
commit;
end if;
exception
  when others then
     v_errcode   :=   sqlcode; 
   v_errmsg   :=   substr(sqlerrm,1,50); 
   dbms_output.put_line( 'error   code   is '   ||   v_errcode   ||   '   error   message   is '   ||   v_errmsg);
  o_ret_code:= -1;
   insert into log_information(command_name, command_type, start_time,end_time,  add_number, condition_id)
   values('�������±����������룺'||i_policy_partition_code||' error   code   is '   ||   v_errcode, '����--Ԥ����,error   message   is '   ||   v_errmsg, v_start_time,systimestamp, o_ret_code, i_task_id);
   commit;
end;
/

prompt
prompt Creating procedure PROC_PREPARE_UPDATE_PARTS
prompt ============================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.proc_prepare_update_parts
(
/*******************************************************
���¿ͻ���Ϣ���������ж��Ƿ�����ڽ�����
*******************************************************/
  i_task_id in number,
  i_source_type_code in number,
  I_Branch_Code In Number,
  i_partition_code in number,
  i_detail_id in number,
  o_ret_code out number
) as
 v_sql varchar2(9000);
 vc_PARTITION varchar2(10);
 v_start_time timestamp;
 V_Sysdate Date;
  v_branch_code number(6);
begin
--��¼��ʼʱ��
v_start_time:=systimestamp;
vc_PARTITION :='PART0'||i_partition_code;
v_sysdate:=sysdate;
o_ret_code:=0;
Select Min(Branch_Code) Into V_Branch_Code From D_Branch_Info Where D_Branch_Code=I_Branch_Code;
v_branch_code:=nvl(v_branch_code,0);
 --��������
 --����ǹ¶�������������,'-2'��������������
if i_source_type_code in(-2,0,1) then
--�Ѵ����µ����ݲ�����ʱ��
--2011-12-27 c.s.l  �����ж��Ƿ�����ڽ�����
--wp.begin_date begin_date
--wp.charge_way charge_way
v_sql:='MERGE INTO customer  PARTITION ('||vc_PARTITION||') a
USING (
    select wo.rowid customer_rowid ,wo.customer_id    ,nvl(wc.copy_id,wo.copy_id) copy_id    ,nvl(wc.policy_holder_name,wo.customer_name) customer_name
    ,nvl(wc.birthday,wo.birthday)birthday    ,case when wc.gender_code in(''1'',''2'') then to_number(wc.gender_code) else 0 end gender_code
    ,nvl(wc.marital_status,wo.marital_status)marital_status    ,nvl(wc.death_critical_illness,wo.death_critical_illness)death_critical_illness
    ,nvl(wc.family_zip_code,wo.family_zip_code)family_zip_code    ,nvl(wc.job_name,wo.job_name)job_name
    ,nvl(wc.company_zip_code,wo.company_zip_code)company_zip_code    ,nvl(wc.contact_address,wo.contact_address)contact_address
    ,nvl(wc.company,wo.company)company    ,nvl(wp.email,wo.email) email    ,nvl(wp.fax,wo.fax) fax    ,nvl(gt.phone_code,wo.tel_code)  tel_code
    ,nvl(wp.reczip,wo.zone_code) zone_code    ,nvl(wp.education_level,wo.education_level) education_level    ,nvl(wp.income,wo.income) income
    ,nvl(wp.govern_id,wo.govern_id) govern_id    ,nvl(wc.revist_time,wo.revist_time)revist_time    ,nvl(wc.revist_result,wo.revist_result)revist_result
    ,case when wc.birthday is not null then wc.age_zone_code else wo.age_zone_code end age_zone_code
    ,case when wc.birthday is not null then wc.birthdate_month_day_code else  wo.birthdate_month_day_code end birthdate_month_day_code
    ,case when wc.revist_time is not null then wc.from_last_revist_time_code else  wo.from_last_revist_time_code end from_last_revist_time_code    ,wo.partition_col
      --�����ڱ�����Ϣ
    ,nvl(to_char(wp.update_time,''yyyy-mm-dd''),wo.update_time) update_time    ,nvl(sd.is_head_company_delivery,0)  company_delivery_code
    ,nvl(sd.is_branchi_delivery,0)  branch_delivery_code
    ,nvl(sd.is_pos_pay,0)  pay_by_pos_code
    ,nvl(sd.is_bank_proxy,0)  pay_by_bank_code
    ,nvl(gt.child_branch_code,'||v_branch_code||')  branch_code
    ,nvl(ps.policy_code,case wp.policy_status when null then 4 else 3 end) policy_status_code
    ,case when wp.account_no is not null then 1 else 0 end bank_status_code
    ,nvl(gt.zone_type_code,3)  zone_type_code
    --�����ڵ绰��ά����Ϣ
    ,nvl(wt.has_ftele_code,0)  has_ftele_code
    ,nvl(wt.has_ctele_code,0) has_ctele_code
    ,nvl(wt.has_mobile_code,0) has_mobile_code
    ,nvl(wt.has_rectele_code,0) has_rectele_code
    ,case when wo.clear_status_code in(0,4) then nvl(wt.clear_status_code,0) else wo.clear_status_code end clear_status_code
    ,fun_level_code('||i_source_type_code||'
      ,nvl(ps.policy_code,case wp.policy_status when null then 4 else 3 end)
      ,nvl(wc.revist_result,0)
      ,wc.age_zone_code
      ,nvl(gt.zone_type_code,3)
      ,case when wp.account_no is not null then 1 else 0 end
      ,case '||i_source_type_code||' when 0 then 0 else 3 end
    ) level_code,case '||i_source_type_code||' when 0 then 0 else 3 end orphan_status_code
    --�����ڽ������ж�����
    ,wp.begin_date begin_date
    ,wp.charge_way charge_way
    ,nvl(wf.IS_FILTER_RED,0) IS_FILTER_RED
 from(
    select  c.*,p.policy_row_id
    from(
    --�ۺϺ��Ͷ������Ϣ
    select customer_row_id customer_row_id,
      max(policy_holder_id) customer_id,
      '||i_partition_code||'  partition_col,
      max(policy_holder_copy_id)       copy_id,
      max(policy_holder_name)       policy_holder_name,
      max(BIRTHDAY)                BIRTHDAY,
      max(gender_code)                  gender_code,
      max(MARITAL_STATUS)          MARITAL_STATUS,
      max(DEATH_CRITICAL_ILLNESS)  DEATH_CRITICAL_ILLNESS,
      max(FAMILY_ZIP_CODE)         FAMILY_ZIP_CODE,
      max(JOB_NAME)                JOB_NAME,
      max(company_zip_code)        company_zip_code,
      max(contact_address)                 contact_address,
      max(company)                 company,
      max(BRANCH_ABBREVIATION)     BRANCH_ABBREVIATION,
      max(revist_time)             revist_time,
      max(revist_result)           revist_result,
      max(fun_age_check(birthday,to_date('''||V_SYSDATE||''')))           age_zone_code,
      max(family_phone) ftele,
      max(office_phone) ctele,
      max(fun_birth_month_day_code(birthday)) birthdate_month_day_code,
      max(fun_date_diff(revist_time,to_date('''||V_SYSDATE||'''))) from_last_revist_time_code,
      max(is_id_null) is_id_null
       from (
        select np.*,p.customer_row_id from p_customer_update_parts PARTITION ('||vc_PARTITION||')  p
        left join temp_policy_holder   PARTITION ('||vc_PARTITION||') np  on p.row_id =np.rowid
        where  p.customer_row_id is not null
      )
      group by customer_row_id
    ) c
    left join (
     select policy_holder_id,max(rowid) keep(dense_rank first order by begin_date desc) policy_row_id
     from policy PARTITION ('||vc_PARTITION||')
     group by policy_holder_id
    ) p on  c.customer_id = p.policy_holder_id
  ) wc
  left join customer PARTITION ('||vc_PARTITION||') wo on wc.customer_row_id=wo.rowid
  left join policy PARTITION ('||vc_PARTITION||') wp on wc.policy_row_id = wp.rowid
   left join help_govern_phone_code gt on trim(wp.govern_id)=gt.govern_id
   left join static_delivery_infor sd on wp.reczip=sd.zone_code
   left join(
      select ''2'' policy_status,1 policy_code from dual
      union all
      select ''6'' policy_status,2 policy_code from dual
      union all
      select ''f'' policy_status,2 policy_code from dual
      union all
      select ''F'' policy_status,2 policy_code from dual
   )ps on wp.policy_status=ps.policy_status
   left join (
        select
        customer_id
        ,max(case when phone_type=1 then 1 else 0 end) has_ftele_code
        ,max(case when phone_type=2 then 1 else 0 end) has_ctele_code
        ,max(case when phone_type=3 then 1 else 0 end) has_mobile_code
        ,max(case when phone_type=4 then 1 else 0 end) has_rectele_code
        ,1 clear_status_code
        from temp_policy_holder PARTITION ('||vc_PARTITION||') h  inner join customer_phone PARTITION ('||vc_PARTITION||') cp
        on(h.policy_holder_id=cp.customer_id)
        group by customer_id
   ) wt on wc.customer_id=wt.customer_id
   LEFT JOIN (SELECT DISTINCT CUSTOMER_ID
                                  ,1 IS_FILTER_RED
                     FROM TEMP_POLICY_HOLDER PARTITION('||vc_PARTITION||') TPH
                    INNER JOIN CUSTOMER_PHONE PARTITION('||vc_PARTITION||') CP2
                       ON (TPH.POLICY_HOLDER_ID = CP2.CUSTOMER_ID)
                    WHERE EXISTS (SELECT 1 FROM FILTER_RED_BLACK FRB WHERE CP2.PHONE = FRB.TELEPHONE)) WF
           ON WC.CUSTOMER_ID = WF.CUSTOMER_ID
) b
ON (a.rowid=b.customer_rowid)
WHEN MATCHED THEN  UPDATE  SET
  a.copy_id=b.copy_id,  a.customer_name=b.customer_name,  a.birthday=b.birthday,  a.gender_code=b.gender_code,  a.marital_status=b.marital_status,  a.death_critical_illness=b.death_critical_illness,  a.fax=b.fax,
  a.family_zip_code=b.family_zip_code,  a.company_zip_code=b.company_zip_code,  a.company=b.company,  a.contact_address=b.contact_address,  a.job_name=b.job_name,  a.education_level=b.education_level,
  a.income=b.income,  a.email=b.email,  a.zone_code=b.zone_code,  a.update_time=b.update_time,  a.govern_id=b.govern_id,  a.revist_time=b.revist_time,  a.revist_result=b.revist_result,
  a.age_zone_code=b.age_zone_code,  a.birthdate_month_day_code=b.birthdate_month_day_code,  a.clear_status_code=b.clear_status_code,  a.bank_status_code=b.bank_status_code,
  a.policy_status_code=b.policy_status_code,  a.branch_delivery_code=b.branch_delivery_code,  a.company_delivery_code=b.company_delivery_code,  a.pay_by_pos_code=b.pay_by_pos_code,
  a.pay_by_bank_code=b.pay_by_bank_code,  a.has_rectele_code=b.has_rectele_code,  a.has_ftele_code=b.has_ftele_code,  a.has_ctele_code=b.has_ctele_code,
  a.has_mobile_code=b.has_mobile_code,  a.zone_type_code=b.zone_type_code,  a.level_code=b.level_code,  a.from_last_revist_time_code=b.from_last_revist_time_code,
  a.branch_code=b.branch_code,  a.tel_code=b.tel_code,  a.partition_col=b.partition_col,a.orphan_status_code=b.orphan_status_code,
  a.ismeet = FUN_PAY_WAY('''||i_source_type_code||''',b.begin_date,b.charge_way),a.IS_FILTER_RED=b.IS_FILTER_RED,
  a.source_type_code='||i_source_type_code;
--������ǹ¶�������������
else
v_sql:='MERGE INTO customer  PARTITION ('||vc_PARTITION||') a
using (
select wc.customer_row_id ,wo.customer_id ,nvl(wc.customer_name,wo.customer_name) customer_name
    ,nvl(wc.birthday,wo.birthday)birthday    ,case when wc.gender_code in(''1'',''2'') then to_number(wc.gender_code) else 0 end gender_code
    ,nvl(wc.marital_status,wo.marital_status)marital_status    ,nvl(wc.death_critical_illness,wo.death_critical_illness)death_critical_illness
    ,nvl(wc.family_zip_code,wo.family_zip_code)family_zip_code    ,nvl(wc.job_name,wo.job_name)job_name
    ,nvl(wc.company_zip_code,wo.company_zip_code)company_zip_code    ,nvl(wc.contact_address,wo.contact_address)contact_address
    ,nvl(wc.family_address,wo.family_address)family_address,nvl(wc.company_address,wo.company_address)company_address
    ,nvl(wc.company,wo.company)company    ,nvl(wc.email,wo.email) email    ,nvl(wc.fax,wo.fax) fax    ,gt.phone_code tel_code
    ,nvl(wc.zone_code,wo.zone_code) zone_code    ,nvl(wc.education_level,wo.education_level) education_level    ,nvl(wc.income,wo.income) income
    ,nvl(wc.govern_id,wo.govern_id) govern_id,nvl(wc.city,wo.city)city,nvl(wc.province,wo.province)province,nvl(wc.any_date,wo.any_date)any_date
    ,nvl(wc.other_info_1,wo.other_info_1)other_info_1,nvl(wc.other_info_2,wo.other_info_2)other_info_2,nvl(wc.other_info_3,wo.other_info_3)other_info_3
    ,nvl(wc.other_info_4,wo.other_info_4)other_info_4,nvl(wc.other_info_5,wo.other_info_5)other_info_5,nvl(wc.note,wo.note)note
    ,nvl(wc.is_accept_donation,wo.d_donation_code)d_donation_code
    ,wc.age_zone_code
    ,wc.birthdate_month_day_code ,wo.partition_col
    ,nvl(sd.is_head_company_delivery,0)  company_delivery_code
    ,nvl(sd.is_branchi_delivery,0)  branch_delivery_code
    ,nvl(sd.is_pos_pay,0)  pay_by_pos_code
    ,nvl(sd.is_bank_proxy,0)  pay_by_bank_code
    ,nvl(gt.child_branch_code,nvl(tel.child_branch_code,'||v_branch_code||'))  branch_code
    ,case when wc.account_no is not null then 1 else 0 end bank_status_code
    ,nvl(gt.zone_type_code,nvl(tel.zone_type_code,3))  zone_type_code
    --�����ڵ绰��ά����Ϣ
    ,nvl(wt.has_ftele_code,0)  has_ftele_code
    ,nvl(wt.has_ctele_code,0) has_ctele_code
    ,nvl(wt.has_mobile_code,0) has_mobile_code
    ,nvl(wt.has_rectele_code,0) has_rectele_code
    ,case when wo.clear_status_code in(0,4) then nvl(wt.clear_status_code,0) else wo.clear_status_code end clear_status_code
    ,fun_level_code('||i_source_type_code||'
      ,wo.policy_status_code
      ,wo.revist_result
      ,case when wc.birthday is not null then wc.age_zone_code else wo.age_zone_code end
      ,case when wc.govern_id  is not null then  nvl(gt.zone_type_code,3) else wo.zone_type_code  end
      ,case when wc.account_no is not null then 1 else wo.bank_status_code end
      ,case wo.orphan_status_code when 2 then 2 else 3 end
    ) level_code,case wo.orphan_status_code when 2 then 2 else 3 end orphan_status_code
    ,nvl(wf.IS_FILTER_RED,0) IS_FILTER_RED
from (
    select customer_row_id customer_row_id
    ,max(l.CUSTOMER_ID)CUSTOMER_ID
    ,max(l.partition_col)partition_col
    ,max(l.bank_account) account_no
    ,max(l.SOURCE_TYPE_CODE)SOURCE_TYPE_CODE
    ,max(l.BRANCH_ABBREVIATION)BRANCH_ABBREVIATION
    ,max(l.customer_name)customer_name
    ,max(l.COPY_ID) copy_id
    ,max(l.BIRTHDAY)BIRTHDAY
    ,max(l.gender_code)gender_code
    ,max(l.MARITAL_STATUS)MARITAL_STATUS
    ,max(l.DEATH_CRITICAL_ILLNESS)DEATH_CRITICAL_ILLNESS
    ,max(l.FAX)FAX
    ,max(l.FAMILY_ZIP_CODE)FAMILY_ZIP_CODE
    ,max(l.COMPANY_ZIP_CODE)COMPANY_ZIP_CODE
    ,max(l.FAMILY_ADDRESS)FAMILY_ADDRESS
    ,max(l.COMPANY_ADDRESS)COMPANY_ADDRESS
    ,max(l.CONTACT_ADDRESS)CONTACT_ADDRESS
    ,max(l.JOB_NAME)JOB_NAME
    ,max(l.company)company
    ,max(l.education_level)education_level
    ,max(l.income)income
    ,max(l.EMAIL)EMAIL
    ,max(l.PROVINCE)PROVINCE
    ,max(l.city)city
    ,max(l.govern_id) govern_id
    ,max(l.tel_code)tel_code
    ,max(l.zone_code)zone_code
    ,max(fun_age_check(l.birthday,to_date('''||V_SYSDATE||'''))) age_zone_code
    ,max(fun_birth_month_day_code(l.birthday)) birthdate_month_day_code
    ,max(l.AGE)AGE
    ,max(l.NOTE)NOTE
    ,max(l.ANY_DATE)ANY_DATE
    ,max(l.OTHER_INFO_1)OTHER_INFO_1
    ,max(l.OTHER_INFO_2)OTHER_INFO_2
    ,max(l.OTHER_INFO_3)OTHER_INFO_3
    ,max(l.OTHER_INFO_4)OTHER_INFO_4
    ,max(l.other_info_5)other_info_5
    ,max(l.is_accept_donation)is_accept_donation
    ,max(case when l.bank_account is null then 0 else 1 end) bank_status_code
    from (
        select np.*,p.customer_row_id from p_customer_update_parts partition ('||vc_PARTITION||')  p
        left join temp_customer   PARTITION ('||vc_PARTITION||') np  on p.row_id =np.rowid
        where  p.customer_row_id is not null
      )l
    GROUP BY customer_row_id
  ) wc LEFT join customer PARTITION ('||vc_PARTITION||') wo on wc.customer_row_id=wo.rowid
  left join  help_govern_phone_code gt on trim(wc.govern_id)=gt.govern_id
  left join  static_delivery_infor sd on wc.zone_code=sd.zone_code
  left join (
      select
      customer_id
      ,max(case when phone_type=1 then 1 else 0 end) has_ftele_code
      ,max(case when phone_type=2 then 1 else 0 end) has_ctele_code
      ,max(case when phone_type=3 then 1 else 0 end) has_mobile_code
      ,max(case when phone_type=4 then 1 else 0 end) has_rectele_code
      ,1 clear_status_code
      from temp_customer PARTITION ('||vc_PARTITION||')  inner join customer_phone PARTITION ('||vc_PARTITION||')
      using(customer_id)
      group by customer_id
  ) wt on wc.customer_id=wt.customer_id
  left join(
     select child_branch_code,zone_type_code,tel_code
    from(
           select child_branch_code,zone_type_code,phone_code tel_code
           ,row_number() over(partition by phone_code order by zone_type_code asc) rn
           from help_govern_phone_code
    ) where rn=1
   ) tel on wc.tel_code=tel.tel_code
   LEFT JOIN (SELECT DISTINCT CP2.CUSTOMER_ID
                                  ,1 IS_FILTER_RED
                     FROM TEMP_CUSTOMER  TPH
                    INNER JOIN CUSTOMER_PHONE CP2
                       ON (TPH.Customer_Id = CP2.CUSTOMER_ID)
                    WHERE EXISTS (SELECT 1 FROM FILTER_RED_BLACK FRB WHERE CP2.PHONE = FRB.TELEPHONE)) WF
           ON WC.CUSTOMER_ID = WF.CUSTOMER_ID
)b
ON (a.rowid=b.customer_row_id)
WHEN MATCHED THEN  UPDATE  SET
 a.customer_name=b.customer_name,  a.birthday=b.birthday,  a.gender_code=b.gender_code,  a.marital_status=b.marital_status,  a.death_critical_illness=b.death_critical_illness,  a.fax=b.fax,
  a.family_zip_code=b.family_zip_code,  a.company_zip_code=b.company_zip_code,  a.company=b.company,  a.family_address=b.family_address, a.company_address=b.company_address, a.contact_address=b.contact_address,
  a.job_name=b.job_name,  a.education_level=b.education_level,
  a.income=b.income,  a.email=b.email,  a.zone_code=b.zone_code,   a.govern_id=b.govern_id,
  a.age_zone_code=b.age_zone_code,  a.birthdate_month_day_code=b.birthdate_month_day_code,  a.clear_status_code=b.clear_status_code,  a.bank_status_code=b.bank_status_code,
   a.branch_delivery_code=b.branch_delivery_code,  a.company_delivery_code=b.company_delivery_code,  a.pay_by_pos_code=b.pay_by_pos_code,
  a.pay_by_bank_code=b.pay_by_bank_code,  a.has_rectele_code=b.has_rectele_code,  a.has_ftele_code=b.has_ftele_code,  a.has_ctele_code=b.has_ctele_code,
  a.has_mobile_code=b.has_mobile_code,  a.zone_type_code=b.zone_type_code,  a.level_code=b.level_code,a.d_donation_code=b.d_donation_code,
  a.branch_code=b.branch_code,  a.tel_code=b.tel_code,  a.partition_col=b.partition_col,a.city=b.city,a.province=b.province,
  a.note=b.note,a.any_date=b.any_date,a.other_info_1=b.other_info_1,a.other_info_2=b.other_info_2,a.other_info_3=b.other_info_3
  ,a.other_info_4=b.other_info_4,a.other_info_5=b.other_info_5,a.orphan_status_code=b.orphan_status_code,a.IS_FILTER_RED=b.IS_FILTER_RED,a.source_type_code='||i_source_type_code;
end if;
execute immediate v_sql;
o_ret_code:=sql%rowcount;
--��������ϸ��״̬
update task_detail
set completed=1,
success_number=o_ret_code,
begin_time=v_sysdate,
end_time=sysdate
where task_id=i_task_id and detail_id=i_detail_id;
insert into log_information(command_name, command_type, start_time,end_time,  add_number, condition_id)
values('���¿ͻ���Ϣ�������룺'||i_partition_code, 'Ԥ����', v_start_time,systimestamp, o_ret_code, i_task_id);
commit;
exception
  when others then
  rollback;
  o_ret_code:= -1;
   insert into log_information(command_name, command_type, start_time,end_time,  add_number, condition_id)
   values('���¿ͻ���Ϣ�������룺'||i_partition_code, '����--Ԥ����', v_start_time,systimestamp, o_ret_code, i_task_id);
commit;
END;
/

prompt
prompt Creating procedure PROC_REBULIDE_INDEX
prompt ======================================
prompt
create or replace procedure sxdxsj.proc_rebulide_index
  authid definer
as
  cursor_id integer;
begin
  cursor_id := dbms_sql.open_cursor;
  dbms_sql.parse(cursor_id, 'alter index IDX_TB_SALE_HIS_THROUGH rebuild', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'alter index IDX_TB_SALE_HIS_STATUS rebuild', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'alter index IDX_TB_SALE_HIS_PID rebuild', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'alter index IDX_TB_SALE_HIS_ID rebuild', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'alter index IDX_TB_SALE_HIS_CT rebuild', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'alter index IDX_TB_SALE_HIS_CONTACT rebuild', dbms_sql.v7);
  
  dbms_sql.close_cursor(cursor_id);
exception
  when others then
    dbms_sql.close_cursor(cursor_id);
    raise;
end proc_rebulide_index;
/

prompt
prompt Creating procedure PROC_TABLE_CLEAN
prompt ===================================
prompt
create or replace procedure sxdxsj.proc_table_clean
  authid definer
as
  cursor_id integer;
begin
  cursor_id := dbms_sql.open_cursor;


  dbms_sql.parse(cursor_id, 'truncate table tb_sale_batch', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on tb_sale_batch to sxdxetl', dbms_sql.v7);

  dbms_sql.parse(cursor_id, 'truncate table tb_ob_com', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on tb_ob_com to sxdxetl', dbms_sql.v7);

  dbms_sql.parse(cursor_id, 'truncate table c_user', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on c_user to sxdxetl', dbms_sql.v7);

  dbms_sql.parse(cursor_id, 'truncate table tb_company', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on tb_company to sxdxetl', dbms_sql.v7);

  dbms_sql.parse(cursor_id, 'truncate table tb_organization', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on tb_organization to sxdxetl', dbms_sql.v7);

  dbms_sql.parse(cursor_id, 'truncate table c_role', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on c_role to sxdxetl', dbms_sql.v7);

  dbms_sql.parse(cursor_id, 'truncate table c_user_role', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on c_user_role to sxdxetl', dbms_sql.v7);

  dbms_sql.parse(cursor_id, 'truncate table tb_workplace', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on tb_workplace to sxdxetl', dbms_sql.v7);

  dbms_sql.parse(cursor_id, 'truncate table tb_project_info', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on tb_project_info to sxdxetl', dbms_sql.v7);

  dbms_sql.parse(cursor_id, 'truncate table tb_application', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on tb_application to sxdxetl', dbms_sql.v7);
  /*
   dbms_sql.parse(cursor_id, 'truncate table tb_task', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on tb_task to sxdxetl', dbms_sql.v7);

  dbms_sql.parse(cursor_id, 'truncate table tb_customer_list', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on tb_customer_list to sxdxetl', dbms_sql.v7);

   dbms_sql.parse(cursor_id, 'truncate table tb_task_history', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on tb_task_history to sxdxetl', dbms_sql.v7);

  dbms_sql.parse(cursor_id, 'truncate table tb_sale_history', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on tb_sale_history to sxdxetl', dbms_sql.v7);
  */
  dbms_sql.parse(cursor_id, 'truncate table tb_app_prd_info', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on tb_app_prd_info to sxdxetl', dbms_sql.v7);

  dbms_sql.parse(cursor_id, 'truncate table c_dictionary', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on c_dictionary to sxdxetl', dbms_sql.v7);

  dbms_sql.parse(cursor_id, 'truncate table tb_area', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on tb_area to sxdxetl', dbms_sql.v7);

  dbms_sql.parse(cursor_id, 'truncate table policy_send', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on policy_send to sxdxetl', dbms_sql.v7);

  dbms_sql.parse(cursor_id, 'truncate table prerec', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on prerec to sxdxetl', dbms_sql.v7);

  dbms_sql.parse(cursor_id, 'truncate table riskcon', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on riskcon to sxdxetl', dbms_sql.v7);

  dbms_sql.parse(cursor_id, 'truncate table tb_log', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'grant select,update,insert,delete on tb_log to sxdxetl', dbms_sql.v7);

  dbms_sql.close_cursor(cursor_id);
exception
  when others then
    dbms_sql.close_cursor(cursor_id);
    raise;
end proc_table_clean;
/

prompt
prompt Creating procedure PROC_TEST
prompt ============================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_TEST IS
  V_FLAG NUMBER := 0;
BEGIN
  V_FLAG := V_FLAG + 1;
  INSERT INTO TEST_TB
  VALUES
    (V_FLAG
    ,SYSDATE);
  COMMIT;
END PROC_TEST;
/

prompt
prompt Creating procedure PROC_TEST2_MQ
prompt ================================
prompt
create or replace procedure sxdxsj.proc_test2_mq as
       begin
       declare
       v_num number(10);
       v_sql varchar2(180);
       begin
       v_sql:='insert into test2_mq(id) values (1)';
       dbms_output.put_line(v_sql);
       execute immediate v_sql;
       v_num:=sql%rowcount;

       dbms_output.put_line(v_num);
       end;
       end proc_test2_mq;
/

prompt
prompt Creating procedure PROC_TEST_MQ
prompt ===============================
prompt
create or replace procedure sxdxsj.proc_test_mq as
begin 
  declare 
    v_sql varchar2(1888);
begin
   v_sql:='insert into test2_mq values(1,mq)';
   execute immediate v_sql;
   exception
     when others then
       dbms_output.put_line('error');
       insert into test3_mq values(10,'error');

       commit;
      end;
end proc_test_mq;
/

prompt
prompt Creating procedure PROC_TRUNCATE
prompt ================================
prompt
create or replace procedure sxdxsj.proc_truncate (table_name in varchar2)
authid definer
as
  cursor_id integer;
--��ձ�����
begin
  cursor_id:=dbms_sql.open_cursor;
  dbms_sql.parse(cursor_id,'truncate table '||table_name,dbms_sql.v7);
  dbms_sql.close_cursor(cursor_id);
exception
  when others then
    dbms_sql.close_cursor(cursor_id);
  raise;
end proc_truncate;
/

prompt
prompt Creating procedure PROC_TRUNCATE_CUSINFO
prompt ========================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_TRUNCATE_CUSINFO
  AUTHID DEFINER
AS
  CURSOR_ID INTEGER;
BEGIN
  CURSOR_ID := DBMS_SQL.OPEN_CURSOR;

  DBMS_SQL.PARSE(CURSOR_ID, 'TRUNCATE TABLE CUSTOMER', DBMS_SQL.V7);
  DBMS_SQL.PARSE(CURSOR_ID, 'GRANT SELECT,UPDATE,INSERT,DELETE ON CUSTOMER TO SXDXETL', DBMS_SQL.V7);

  DBMS_SQL.PARSE(CURSOR_ID, 'TRUNCATE TABLE CUSTOMER_PHONE', DBMS_SQL.V7);
  DBMS_SQL.PARSE(CURSOR_ID, 'GRANT SELECT,UPDATE,INSERT,DELETE ON CUSTOMER_PHONE TO SXDXETL', DBMS_SQL.V7);

  DBMS_SQL.PARSE(CURSOR_ID, 'TRUNCATE TABLE BANK_ACCOUNTS', DBMS_SQL.V7);
  DBMS_SQL.PARSE(CURSOR_ID, 'GRANT SELECT,UPDATE,INSERT,DELETE ON BANK_ACCOUNTS TO SXDXETL', DBMS_SQL.V7);


  DBMS_SQL.CLOSE_CURSOR(CURSOR_ID);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_SQL.CLOSE_CURSOR(CURSOR_ID);
    RAISE;
END PROC_TRUNCATE_CUSINFO;
/

prompt
prompt Creating procedure PROC_UNUSABLE_INDEX
prompt ======================================
prompt
create or replace procedure sxdxsj.proc_unusable_index
  authid definer
as
  cursor_id integer;
begin
  cursor_id := dbms_sql.open_cursor;
  dbms_sql.parse(cursor_id, 'alter index IDX_TB_SALE_HIS_THROUGH unusable', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'alter index IDX_TB_SALE_HIS_STATUS unusable', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'alter index IDX_TB_SALE_HIS_PID unusable', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'alter index IDX_TB_SALE_HIS_ID unusable', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'alter index IDX_TB_SALE_HIS_CT unusable', dbms_sql.v7);
  dbms_sql.parse(cursor_id, 'alter index IDX_TB_SALE_HIS_CONTACT unusable', dbms_sql.v7);
  dbms_sql.close_cursor(cursor_id);
exception
  when others then
    dbms_sql.close_cursor(cursor_id);
    raise;
end proc_unusable_index;
/

prompt
prompt Creating procedure PROC_VIEW_RPT_2CALL
prompt ======================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_view_rpt_2call
(
  i_source_type_code in number,
  i_branch_code in number,
  i_batch_id in varchar2,
  o_dt OUT SYS_REFCURSOR
) as
begin
--��ȡ��������
If i_branch_code=-1 then
open o_dt for
select
  1 row_name
  ,sum(LEVEL_A)LEVEL_A
  ,sum(LEVEL_B)LEVEL_B
  ,sum(LEVEL_C)LEVEL_C
  ,sum(LEVEL_D)LEVEL_D
  ,sum(LEVEL_E)LEVEL_E
  ,sum(LEVEL_F)LEVEL_F
  ,sum(LEVEL_G)LEVEL_G
  ,sum(TOTAL_LEFT)TOTAL_LEFT
  ,sum(LEVEL_X)LEVEL_X
  ,sum(level_y)level_y
  --,sum(LEVEL_Z)LEVEL_Z
  ,sum(TOTAL_RIGHT)TOTAL_RIGHT
  ,sum(Total_Count)Total_Count
From Rpt_Cpic_2call
where batch_id=i_batch_id
and  source_type_code= i_source_type_code
group By from_last_sale_time_code, dial_time_length_code, Phone_Type
Order By from_last_sale_time_code, dial_time_length_code, Phone_Type;
Else
  open o_dt for
select
  1 row_name,
  LEVEL_A,
  LEVEL_B,
  LEVEL_C,
  LEVEL_D,
  LEVEL_E,
  LEVEL_F,
  LEVEL_G,
  TOTAL_LEFT,
  LEVEL_X,
  Level_Y,
  --LEVEL_Z,
  TOTAL_RIGHT,
  total_count
from rpt_cpic_2call
where batch_id=i_batch_id
and  source_type_code= i_source_type_code
And D_Branch_Code=I_Branch_Code
Order By from_last_sale_time_code, dial_time_length_code, Phone_Type;
end if;
end;
/

prompt
prompt Creating procedure PROC_VIEW_RPT_ANALYSIS
prompt =========================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_view_rpt_analysis
(
  i_source_type_code in number,
  i_branch_code in number,
  i_batch_id in varchar2,
  o_dt OUT SYS_REFCURSOR
) as
begin
--��ȡ��������
if i_branch_code =-1 then
  open o_dt for
  select row_name,sum(need_bq) need_bq,sum(already_bq)already_bq
  ,case when sum(need_bq)>0 then sum(bq_pct)/sum(need_bq) else 0 end bq_pct
  ,sum(dial_bq)dial_bq
  ,case when sum(dial_bq)>0 then sum(contact_pct)/sum(dial_bq) else 0 end contact_pct
  ,sum(deal_count)deal_count,sum(charge_amount)charge_amount,sum(bq_bonus) bq_bonus
  from rpt_cpic_bq_analysis
  where batch_id=i_batch_id and source_type_code=i_source_type_code
  group by row_name
  union all
  select 'С��' row_name,sum(need_bq),sum(already_bq)
  ,case when sum(need_bq)>0 then sum(bq_pct)/sum(need_bq) else 0 end bq_pct
  ,sum(dial_bq)
  ,case when sum(dial_bq)>0 then sum(contact_pct)/sum(dial_bq) else 0 end contact_pct
  ,sum(deal_count),sum(charge_amount),sum(bq_bonus)
  from rpt_cpic_bq_analysis
  where batch_id=i_batch_id and source_type_code=i_source_type_code
	order by row_name;
else
  open o_dt for
  select row_name,need_bq,already_bq,bq_pct,dial_bq,contact_pct,deal_count,charge_amount,bq_bonus
  from rpt_cpic_bq_analysis
  where batch_id=i_batch_id and source_type_code=i_source_type_code and d_branch_code=i_branch_code
  union all
  select 'С��' row_name,sum(need_bq),sum(already_bq)
  ,case when sum(need_bq)>0 then sum(bq_pct)/sum(need_bq) else 0 end bq_pct
  ,sum(dial_bq)
  ,case when sum(dial_bq)>0 then sum(contact_pct)/sum(dial_bq) else 0 end contact_pct
  ,sum(deal_count),sum(charge_amount),sum(bq_bonus)
   from rpt_cpic_bq_analysis
  where batch_id=i_batch_id and source_type_code=i_source_type_code and d_branch_code=i_branch_code
  order by row_name;
end if;
end;
/

prompt
prompt Creating procedure PROC_VIEW_RPT_CHILD_BRANCH
prompt =============================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_view_rpt_child_branch
(
  i_source_type_code in number,
  i_branch_code in number,
  i_batch_id in varchar2,
  o_dt OUT SYS_REFCURSOR
) as
begin
--��ȡ��������
if i_branch_code=-1 then
  open o_dt for
  select '���зֹ�˾' row_name
  ,sum(case when birthdate_month_code=1 then data_col else 0 end) "1��"
  ,sum(case when birthdate_month_code=2 then data_col else 0 end) "2��"
  ,sum(case when birthdate_month_code=3 then data_col else 0 end) "3��"
  ,sum(case when birthdate_month_code=4 then data_col else 0 end) "4��"
  ,sum(case when birthdate_month_code=5 then data_col else 0 end) "5��"
  ,sum(case when birthdate_month_code=6 then data_col else 0 end) "6��"
  ,sum(case when birthdate_month_code=7 then data_col else 0 end) "7��"
  ,sum(case when birthdate_month_code=8 then data_col else 0 end) "8��"
  ,sum(case when birthdate_month_code=9 then data_col else 0 end) "9��"
  ,sum(case when birthdate_month_code=10 then data_col else 0 end) "10��"
  ,sum(case when birthdate_month_code=11 then data_col else 0 end) "11��"
  ,sum(case when birthdate_month_code=12 then data_col else 0 end) "12��"
  from rpt_cpic_child_branch
  where source_type_code=i_source_type_code and batch_id=i_batch_id;
else
  open o_dt for
  select child_branch_name row_name
  ,sum(case when birthdate_month_code=1 then data_col else 0 end) "1��"
  ,sum(case when birthdate_month_code=2 then data_col else 0 end) "2��"
  ,sum(case when birthdate_month_code=3 then data_col else 0 end) "3��"
  ,sum(case when birthdate_month_code=4 then data_col else 0 end) "4��"
  ,sum(case when birthdate_month_code=5 then data_col else 0 end) "5��"
  ,sum(case when birthdate_month_code=6 then data_col else 0 end) "6��"
  ,sum(case when birthdate_month_code=7 then data_col else 0 end) "7��"
  ,sum(case when birthdate_month_code=8 then data_col else 0 end) "8��"
  ,sum(case when birthdate_month_code=9 then data_col else 0 end) "9��"
  ,sum(case when birthdate_month_code=10 then data_col else 0 end) "10��"
  ,sum(case when birthdate_month_code=11 then data_col else 0 end) "11��"
  ,sum(case when birthdate_month_code=12 then data_col else 0 end) "12��"
  from rpt_cpic_child_branch
  where source_type_code=i_source_type_code and d_branch_code=i_branch_code and batch_id=i_batch_id
  group by child_branch_name;
end if;
end;
/

prompt
prompt Creating procedure PROC_VIEW_RPT_DIFF
prompt =====================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_view_rpt_diff
(
  i_source_type_code in number,
  i_branch_code in number,
  i_batch_id in varchar2,
  o_dt OUT SYS_REFCURSOR
) as
v_sql varchar2(8000);
v_name_list varchar2(4000);
v_value number;
v_name varchar2(50);
cursor cur_col_list is
select distinct d_branch_code,d_branch_name from d_branch_info;
begin
v_name_list:='select col_description';
v_sql:='select order_col';
open cur_col_list ;
loop
fetch cur_col_list into v_value,v_name;
exit when cur_col_list%notfound;
v_name_list:=v_name_list||',"'||v_name||'"';
v_sql:= v_sql||',max(case when d_branch_code='||v_value||' then data_col else 0 end) "'||v_name||'"';
end loop;
close cur_col_list;
v_sql:=v_name_list||' from ('||v_sql||' from rpt_cpic_diff where source_type_code='||i_source_type_code||' and batch_id='''||i_batch_id||'''  group by order_col  order by order_col
)l inner join (select distinct col_description,order_col from rpt_cpic_diff where source_type_code='||i_source_type_code||' and batch_id='''||i_batch_id||''') r on l.order_col=r.order_col
 order by l.order_col';
--��ȡ��������
open o_dt for v_sql;
end;
/

prompt
prompt Creating procedure PROC_VIEW_RPT_SCHEDULE
prompt =========================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_view_rpt_schedule
(
  i_source_type_code in number,
  i_branch_code in number,
  i_batch_id in varchar2,
  o_dt OUT SYS_REFCURSOR
) as
begin
--��ȡ��������
open o_dt for
select n.row_name,n.orphan,n.orphan_persons,n.yinbao,n.yinbao_persons,n.avg_amount,n.new_amount,n.std_amount
from rpt_cpic_schedule n where batch_id=i_batch_id;
end;
/

prompt
prompt Creating procedure PROC_VIEW_RPT_START_PREPARE
prompt ==============================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_view_rpt_start_prepare
(
  i_source_type_code in number,
  i_branch_code in number,
  i_batch_id in varchar2,
  o_dt OUT SYS_REFCURSOR
) as
begin
--��ȡ��������
open o_dt for
select '�Ĵ�������' row_name,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 from dual
union all
select '�������ⱦ' row_name,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  from dual
union all
select '������������' row_name,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  from dual
union all
select '�������ⱦ' row_name,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  from dual
union all
select '������������' row_name,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  from dual
union all
select '�������ⱦ' row_name,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  from dual
union all
select '������������' row_name,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  from dual;
end;
/

prompt
prompt Creating procedure PROC_VIEW_RPT_STORAGE
prompt ========================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_view_rpt_storage
(
  i_source_type_code in number,
  i_branch_code in number,
  i_batch_id in varchar2,
  o_dt OUT SYS_REFCURSOR
) as
begin
--��ȡ��������
If i_source_type_code=1 then
    open o_dt for
select Project_Name row_name,
  LEVEL_A,
  LEVEL_B,
  LEVEL_C,
  LEVEL_D,
  LEVEL_E,
  LEVEL_F,
  LEVEL_G,
  LEVEL_X,
  level_y,
  (LEVEL_A+LEVEL_B+LEVEL_C+LEVEL_D+LEVEL_E+LEVEL_F+LEVEL_G+LEVEL_X+level_y)TOTAL_LEFT,
  level_z,
  --LEVEL_Z,
  --TOTAL_RIGHT,
  total_count
from rpt_cpic_storage
where project_name<>'4 ��������'
and batch_id=i_batch_id
and  source_type_code= i_source_type_code
And D_Branch_Code=I_Branch_Code
Order By Source_Type_Code, D_Branch_Code, Project_Name, Phone_Type;
Else
open o_dt for
select Project_Name row_name,
    LEVEL_A,
  LEVEL_B,
  LEVEL_C,
  LEVEL_D,
  LEVEL_E,
  LEVEL_F,
  LEVEL_G,
  TOTAL_LEFT,
  LEVEL_X,
  level_y,
  --LEVEL_Z,
  TOTAL_RIGHT,
  total_count
from rpt_cpic_storage
where batch_id=i_batch_id
and  source_type_code= i_source_type_code
and d_branch_code=i_branch_code
Order By Source_Type_Code, D_Branch_Code, Project_Name, Phone_Type;
end if;
end;
/

prompt
prompt Creating procedure PROC_VIEW_RPT_TICKET
prompt =======================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_view_rpt_ticket
(
  i_source_type_code in number,
  i_branch_code in number,
  i_batch_id in varchar2,
  o_dt OUT SYS_REFCURSOR
) as
begin
--��ȡ��������
--���зֹ�˾
if i_branch_code=-1 then
open o_dt for
select r.level_name row_name,online_deal,trace_high,trace_hesitate,trace_busy,trace_else,refuse_diff,refuse_unaccept,refuse_shutdown,refuse_else
,invalid_lover ,invalid_parent,invalid_family,invalid_friend,invalid_nobody,invalid_null
,case when total_persons=0 then 0 else passed_persons/total_persons*10000 end passed_pct
,case when total_persons=0 then 0 else contacted_persons/total_persons*10000 end contacted_pct
from(
select  row_name
,sum(online_deal)online_deal
,sum(trace_high)trace_high
,sum(trace_hesitate)trace_hesitate
,sum(trace_busy)trace_busy
,sum(trace_else)trace_else
,sum(refuse_diff)refuse_diff
,sum(refuse_unaccept)refuse_unaccept
,sum(refuse_shutdown)refuse_shutdown
,sum(refuse_else)refuse_else
,sum(invalid_lover)invalid_lover
,sum(invalid_parent)invalid_parent
,sum(invalid_family)invalid_family
,sum(invalid_friend)invalid_friend
,sum(invalid_nobody)invalid_nobody
,sum(invalid_null)invalid_null
,sum(online_deal+trace_high+trace_hesitate+trace_busy+trace_else+refuse_diff+refuse_unaccept+refuse_shutdown+refuse_else
+invalid_lover+invalid_parent+invalid_family+invalid_friend)passed_persons
,sum(online_deal+trace_high+trace_hesitate+trace_busy+trace_else+refuse_diff+refuse_unaccept+refuse_shutdown+refuse_else)contacted_persons
,sum(online_deal+trace_high+trace_hesitate+trace_busy+trace_else+refuse_diff+refuse_unaccept+refuse_shutdown+refuse_else
+invalid_lover+invalid_parent+invalid_family+invalid_friend+invalid_nobody+invalid_null) total_persons
from rpt_cpic_ticket
where batch_id=i_batch_id and source_type_code=i_source_type_code
group by row_name)
l inner join d_customer_level r on l.row_name=to_char(r.level_code)
union all
select row_name,online_deal,trace_high,trace_hesitate,trace_busy,trace_else,refuse_diff,refuse_unaccept,refuse_shutdown,refuse_else
,invalid_lover ,invalid_parent,invalid_family,invalid_friend,invalid_nobody,invalid_null
,case when total_persons=0 then 0 else passed_persons/total_persons*10000 end passed_pct
,case when total_persons=0 then 0 else contacted_persons/total_persons*10000 end contacted_pct
from(
select 'С��' row_name
,sum(online_deal)online_deal
,sum(trace_high)trace_high
,sum(trace_hesitate)trace_hesitate
,sum(trace_busy)trace_busy
,sum(trace_else)trace_else
,sum(refuse_diff)refuse_diff
,sum(refuse_unaccept)refuse_unaccept
,sum(refuse_shutdown)refuse_shutdown
,sum(refuse_else)refuse_else
,sum(invalid_lover)invalid_lover
,sum(invalid_parent)invalid_parent
,sum(invalid_family)invalid_family
,sum(invalid_friend)invalid_friend
,sum(invalid_nobody)invalid_nobody
,sum(invalid_null)invalid_null
,sum(online_deal+trace_high+trace_hesitate+trace_busy+trace_else+refuse_diff+refuse_unaccept+refuse_shutdown+refuse_else
+invalid_lover+invalid_parent+invalid_family+invalid_friend)passed_persons
,sum(online_deal+trace_high+trace_hesitate+trace_busy+trace_else+refuse_diff+refuse_unaccept+refuse_shutdown+refuse_else)contacted_persons
,sum(online_deal+trace_high+trace_hesitate+trace_busy+trace_else+refuse_diff+refuse_unaccept+refuse_shutdown+refuse_else
+invalid_lover+invalid_parent+invalid_family+invalid_friend+invalid_nobody+invalid_null) total_persons
from rpt_cpic_ticket
where batch_id=i_batch_id and source_type_code=i_source_type_code
) order by row_name;
else
open o_dt for
select r.level_name row_name,online_deal,trace_high,trace_hesitate,trace_busy,trace_else,refuse_diff,refuse_unaccept,refuse_shutdown,refuse_else
,invalid_lover ,invalid_parent,invalid_family,invalid_friend,invalid_nobody,invalid_null,passed_pct*10000,contacted_pct*10000
from rpt_cpic_ticket l inner join d_customer_level r on l.row_name=to_char(r.level_code)
where batch_id=i_batch_id and source_type_code=i_source_type_code and d_branch_code=i_branch_code
union all
select row_name,online_deal,trace_high,trace_hesitate,trace_busy,trace_else,refuse_diff,refuse_unaccept,refuse_shutdown,refuse_else
,invalid_lover ,invalid_parent,invalid_family,invalid_friend,invalid_nobody,invalid_null
,case when total_persons=0 then 0 else passed_persons/total_persons*10000 end passed_pct
,case when total_persons=0 then 0 else contacted_persons/total_persons*10000 end contacted_pct
from(
select 'С��' row_name
,sum(online_deal)online_deal
,sum(trace_high)trace_high
,sum(trace_hesitate)trace_hesitate
,sum(trace_busy)trace_busy
,sum(trace_else)trace_else
,sum(refuse_diff)refuse_diff
,sum(refuse_unaccept)refuse_unaccept
,sum(refuse_shutdown)refuse_shutdown
,sum(refuse_else)refuse_else
,sum(invalid_lover)invalid_lover
,sum(invalid_parent)invalid_parent
,sum(invalid_family)invalid_family
,sum(invalid_friend)invalid_friend
,sum(invalid_nobody)invalid_nobody
,sum(invalid_null)invalid_null
,sum(online_deal+trace_high+trace_hesitate+trace_busy+trace_else+refuse_diff+refuse_unaccept+refuse_shutdown+refuse_else
+invalid_lover+invalid_parent+invalid_family+invalid_friend)passed_persons
,sum(online_deal+trace_high+trace_hesitate+trace_busy+trace_else+refuse_diff+refuse_unaccept+refuse_shutdown+refuse_else)contacted_persons
,sum(online_deal+trace_high+trace_hesitate+trace_busy+trace_else+refuse_diff+refuse_unaccept+refuse_shutdown+refuse_else
+invalid_lover+invalid_parent+invalid_family+invalid_friend+invalid_nobody+invalid_null) total_persons
from rpt_cpic_ticket
where batch_id=i_batch_id and source_type_code=i_source_type_code and d_branch_code=i_branch_code
)order by row_name;
end if;
end;
/

prompt
prompt Creating procedure PROC_VIEW_RPT_TRACE
prompt ======================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.PROC_view_rpt_trace
(
  i_source_type_code in number,
  i_branch_code in number,
  i_batch_id in varchar2,
  o_dt OUT SYS_REFCURSOR
) as
begin
--��ȡ��������
if i_branch_code=-1 then
  open o_dt for
  select row_name
  ,case when progress_pct>0 then contact_pct/progress_pct*10000 else 0 end contact_pct
  ,case when progress_pct>0 then estimate_pct/progress_pct*10000 else 0 end estimate_pct
  ,case when progress_pct>0 then deal_pct/progress_pct*10000 else 0 end deal_pct
  ,case when estimate_pct>0 then (deal_pct-estimate_pct)/estimate_pct*10000 else 0 end contact_pct
  from (
  select row_name
  ,sum(contact_pct) contact_pct
  ,sum(estimate_pct) estimate_pct
  ,sum(deal_pct) deal_pct
  ,sum(progress_pct) progress_pct
  from rpt_cpic_trace
  where batch_id=i_batch_id and source_type_code=i_source_type_code
  group by  row_name
  union all
  select 'С��' row_name
  ,sum(contact_pct) contact_pct
  ,sum(estimate_pct) estimate_pct
  ,sum(deal_pct) deal_pct
  ,sum(progress_pct) progress_pct
  from rpt_cpic_trace
  where batch_id=i_batch_id and source_type_code=i_source_type_code
  ) order by row_name;
else
  open o_dt for
  select row_name
  ,case when progress_pct>0 then contact_pct/progress_pct*10000 else 0 end contact_pct
  ,case when progress_pct>0 then estimate_pct/progress_pct*10000 else 0 end estimate_pct
  ,case when progress_pct>0 then deal_pct/progress_pct*10000 else 0 end deal_pct
  ,case when estimate_pct>0 then (deal_pct-estimate_pct)/estimate_pct*10000 else 0 end contact_pct
  from (
  select row_name
  ,sum(contact_pct) contact_pct
  ,sum(estimate_pct) estimate_pct
  ,sum(deal_pct) deal_pct
  ,sum(progress_pct) progress_pct
  from rpt_cpic_trace
  where batch_id=i_batch_id and source_type_code=i_source_type_code and d_branch_code=i_branch_code
  group by  row_name
  union all
  select 'С��' row_name
  ,sum(contact_pct) contact_pct
  ,sum(estimate_pct) estimate_pct
  ,sum(deal_pct) deal_pct
  ,sum(progress_pct) progress_pct
  from rpt_cpic_trace
  where batch_id=i_batch_id and source_type_code=i_source_type_code and d_branch_code=i_branch_code
  ) order by row_name;
end if;
end;
/

prompt
prompt Creating procedure PROC_VIEW_TASK
prompt =================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.proc_view_task(
    i_page_rows in number default 15,
    i_cur_page in number default 1,
    i_task_id in number,
    i_task_name in varchar2,
    i_task_type in number,
    I_Task_Status In Number,
    i_start_time in date,
    i_end_time in date,
    o_rows_count out number,
    o_dt OUT SYS_REFCURSOR
) As
/*
���߸����������ط�ҳ��������
*/
V_Start_Rn Number:=(Nvl(I_Cur_Page,1)-1)*nvl(I_Page_Rows,15)+1;
v_end_rn number:=nvl(i_cur_page,1)*nvl(I_Page_Rows,15);
v_sql varchar2(2000);
Begin
dbms_output.put_line('begin...');
select str_id||str_task_name||str_task_type||str_status||str_start||str_end into v_sql from(
    Select
     Case When I_Task_Id Is Null Then '' Else ' and id='||I_Task_Id End Str_Id
    ,Case When I_Task_Name Is Null Then '' Else ' and task_name like ''%'||I_Task_Name||'%''' End Str_Task_Name
    ,Case When I_Task_Type Is Null Then '' Else ' and task_type='||I_Task_Type End Str_Task_Type
    ,Case When I_Task_Status Is Null Then '' Else ' and status='||I_Task_Status End Str_Status
    ,Case When I_Start_Time Is Null Then '' Else ' and create_time>=to_timestamp('''||To_Char(I_Start_Time,'yyyy-mm-dd')||''',''yyyy-mm-dd'')' End Str_Start
    ,case when i_end_time Is null then '' else ' and create_time<=to_timestamp('''||to_char(i_end_time,'yyyy-mm-dd')||''',''yyyy-mm-dd'')+1' end str_end
    from dual
);
Select nvl(Regexp_Replace(Lower(Trim(V_Sql)),'^(and( )+)*',''),'1=1') Into V_Sql From dual;
Dbms_Output.Put_Line('v_sql:'||V_Sql);
Execute Immediate 'select count(*) from tasks where '||v_sql Into O_Rows_Count;
Dbms_Output.Put_Line('O_Rows_Count:'||O_Rows_Count);
v_sql:='select * from(
    SELECT t.*,row_number() over(order by create_time desc) rn FROM tasks t
    where '||v_sql||'
) where rn between '||v_start_rn||' and '||v_end_rn;
dbms_output.put_line('v_sql:'||v_sql);
Open O_Dt For v_sql;
end;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_DAY
prompt ======================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.SP_TA_SALES_RPT_DAY (
   I_DATE_DAY     IN       NUMBER
 --, I_END_DATE     IN       NUMBER
 , ERR_NUM        OUT      NUMBER
 , ERR_MSG        OUT      VARCHAR2
)
AS
   /**
     * ���������� �����ձ�
     * ��������� I_DATE_DAY             ����ʱ��,�������Ϊ��,�׳��쳣
     * ��������� ERR_NUM                ���ִ���ʱ����ִ�д����
     * �������������ERR_MSG                ���ִ���ʱ���صĴ�����Ϣ
     * ��д��Ա�����ҷ�
     * �������ڣ�2012-03-29
     * ��˾���ƣ�
     **/
   V_DATE_DAY                    DATE := TO_DATE(I_DATE_DAY,'YYYYMMDD');             --����ʱ��
   V_DAY			                   NUMBER := I_DATE_DAY;		   --����ʱ��
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(I_DATE_DAY)||' 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=TO_DATE(TO_CHAR(I_DATE_DAY)||' 23:59:59','YYYY-MM-DD HH24:MI:SS');  --��������
   V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_DAY';--��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF V_DATE_DAY IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'I_DATE_DAY IS NULL!');
   END IF;

   --�����ʱ������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_SALES_RPT_DAY';
     --֧�ֶ�����������
   DELETE FROM TA_SALES_RPT_DAY T
          WHERE T.CAL_DAY_ID=V_DATE_DAY;
      COMMIT;
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�����ײ������������������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
   --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_DAY
         (  CAL_DAY_ID                     -- ͳ������      
            ,PAY_MODE                       -- �ɷѷ�ʽ      
            ,ACTV_ID                        -- �ID        
            ,BAT_CODE                       -- ���δ���      
            ,COM_TYP                        -- ��������      
            ,BAT_PRJT                       -- ������Ŀ      
            ,COMP_ID                        -- �ֹ�˾����    
            ,CITY_ID                        -- ����ID        
            ,ORG_ID                        -- ��֯�ܹ�����              
            ,WP_ID                          -- ְ��ID        
            ,PRJT_MGR_ID                    -- ��Ŀ����ID    
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID      
            ,USER_ID                        -- ��ϯID        
            ,FST_CAL_LIST_QTY               -- �ײ�������    
            --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
           ,TRK_LIST_QTY                   -- ����������    
            --,CONT_LIST_QTY                  -- �Ӵ�������    
            --,REJ_LIST_QTY                   -- �ܾ�������    
            --,OLINE_SMIT_QTY                 -- �����ύ����  
            --,OLINE_SMIT_PRM                 -- �����ύ����  
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����  
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����  
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����  
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����  
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���    
            --,LAND_SUCC_QTY                  -- ��سɹ���    
            --,LAND_SUCC_PRM                  -- ��سɹ�����  
            )

   SELECT
       V_DATE_DAY              AS CAL_DAY_ID,
       '-1'                    AS PAYMODE,  --���ѷ�ʽ
       T4.OB_COM_NAME          AS ACTV_ID, --�ID
       T2.BATCH_NAME           AS BAT_CODE, --���α���
       T2.COM_TYPE             AS COM_TYP,--�������ࣨ�¶������������н飩
       T4.PRJ_ID               AS BAT_PRJT,--������Ŀ
       T4.COMPANY_ID           AS COMP_ID,--�ֹ�˾
       T2.BELONGCITY           AS CITY_ID, --����
       T5.ORG_ID               AS ORG_ID,--��֯����
       NVL(T5.WORKPLACE_ID, '-1')AS WP_ID,--ְ�����
       T5.ORG_ID               AS PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID               AS TEM_LEAD_ID,  ---�Ŷӳ����
       T1.USER_ID              AS USER_ID, --��ϯ����
       COUNT(DISTINCT CASE WHEN T1.STATUS_ID <> '6' AND T1.STATUS_ID2='6' AND T1.TYPE_ID2='4' THEN T1.CUS_LIST_ID ELSE NULL END) AS FST_CAL_LIST_QTY,--����
       COUNT(DISTINCT CASE WHEN TYPE_ID='2' AND  T1.TYPE_ID2<>'4' THEN T1.CUS_LIST_ID ELSE NULL END) AS TRK_LIST_QTY-- ����������
     FROM TB_TASK_ALL T1
       INNER JOIN  TB_SALE_BATCH  T2 ON T1.BATCH_ID=T2.BATCH_ID
       INNER JOIN  TB_OB_COM  T4 ON T4.OB_COM_ID=T1.OB_COM_ID
       INNER JOIN  C_USER  T5 ON  T5.USERID=T1.USER_ID  --AND T5.ORG_ID=T1.ORG_ID
 WHERE 1=1
   --T1.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T1.TYPE_ID<>'4'--�������� �ײ�
  -- AND T1.STATUS_ID2='6'
  -- AND T1.TYPE_ID2='4'
   AND T1.CHANGE_TIME1=T1.CREATE_HISTORY_DATE2--
   AND T1.CHANGE_TIME1=I_DATE_DAY
   --AND TO_DATE(TO_CHAR(T1.CREATE_HISTORY_DATE, 'YYYYMMDD'), 'YYYYMMDD') =TO_DATE( STAT_DATE, 'YYYYMMDD')
   GROUP BY
      V_DATE_DAY
      ,'-1'
      ,T4.OB_COM_NAME
      ,T2.BATCH_NAME
      ,T2.COM_TYPE
      ,T4.PRJ_ID
      ,T4.COMPANY_ID
      ,T2.BELONGCITY
      ,T5.ORG_ID
      ,NVL(T5.WORKPLACE_ID, '-1')
      ,T5.ORG_ID
      ,T5.ORG_ID
      ,T1.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
 -------------------------------------
          --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�����ײ��Ӵ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
   --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_DAY
         (  CAL_DAY_ID                     -- ͳ������      
            ,PAY_MODE                       -- �ɷѷ�ʽ      
            ,ACTV_ID                        -- �ID        
            ,BAT_CODE                       -- ���δ���      
            ,COM_TYP                        -- ��������      
            ,BAT_PRJT                       -- ������Ŀ      
            ,COMP_ID                        -- �ֹ�˾����    
            ,CITY_ID                        -- ����ID        
            ,ORG_ID                        -- ��֯�ܹ�����              
            ,WP_ID                          -- ְ��ID        
            ,PRJT_MGR_ID                    -- ��Ŀ����ID    
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID      
            ,USER_ID                        -- ��ϯID        
            --,FST_CAL_LIST_QTY               -- �ײ�������    
           ,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������    
            --,CONT_LIST_QTY                  -- �Ӵ�������    
            --,REJ_LIST_QTY                   -- �ܾ�������    
            --,OLINE_SMIT_QTY                 -- �����ύ����  
            --,OLINE_SMIT_PRM                 -- �����ύ����  
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����  
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����  
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����  
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����  
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���    
            --,LAND_SUCC_QTY                  -- ��سɹ���    
            --,LAND_SUCC_PRM                  -- ��سɹ�����  
            )

  SELECT
       V_DATE_DAY              AS CAL_DAY_ID,
       '-1'                    AS PAYMODE,  --���ѷ�ʽ
       T4.OB_COM_NAME          AS ACTV_ID, --�ID
       T2.BATCH_NAME           AS BAT_CODE, --���α���
       T2.COM_TYPE             AS COM_TYP,--�������ࣨ�¶������������н飩
       T4.PRJ_ID               AS BAT_PRJT,--������Ŀ
       T4.COMPANY_ID           AS COMP_ID,--�ֹ�˾
       T2.BELONGCITY           AS CITY_ID, --����
       T5.ORG_ID               AS ORG_ID,--��֯����
       NVL(T5.WORKPLACE_ID, '-1')AS WP_ID,--ְ�����
       T5.ORG_ID               AS PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID               AS TEM_LEAD_ID,  ---�Ŷӳ����
       T1.USER_ID              AS USER_ID, --��ϯ����
       COUNT(DISTINCT T1.CUS_LIST_ID) AS FST_CAL_CONT_LIST_QTY--����
     FROM TB_TASK_ALL T1
       INNER JOIN  TB_SALE_BATCH  T2 ON T1.BATCH_ID=T2.BATCH_ID
       INNER JOIN  TB_SALE_HISTORY T3 ON T1.TASK_ID=T3.TASK_ID
       INNER JOIN  TB_OB_COM  T4 ON T4.OB_COM_ID=T1.OB_COM_ID
       INNER JOIN  C_USER  T5 ON  T5.USERID=T1.USER_ID  --AND T5.ORG_ID=T1.ORG_ID
 WHERE
   T1.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T1.TYPE_ID<>'4'--�������� �ײ�
   AND T1.STATUS_ID2='6'
   AND T1.TYPE_ID2='4'
   AND T3.IS_THROUGH='1'--�Ӵ�
   AND T1.CHANGE_TIME1=T1.CREATE_HISTORY_DATE2--
   AND T1.CHANGE_TIME1=I_DATE_DAY
   --AND TO_DATE(TO_CHAR(T1.CREATE_HISTORY_DATE, 'YYYYMMDD'), 'YYYYMMDD') =TO_DATE( STAT_DATE, 'YYYYMMDD')
   GROUP BY
      V_DATE_DAY
      ,'-1'
      ,T4.OB_COM_NAME
      ,T2.BATCH_NAME
      ,T2.COM_TYPE
      ,T4.PRJ_ID
      ,T4.COMPANY_ID
      ,T2.BELONGCITY
      ,T5.ORG_ID
      ,NVL(T5.WORKPLACE_ID, '-1')
      ,T5.ORG_ID
      ,T5.ORG_ID
      ,T1.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
  --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '����Ӵ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
  --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_DAY
         (  CAL_DAY_ID                     -- ͳ������      
            ,PAY_MODE                       -- �ɷѷ�ʽ      
            ,ACTV_ID                        -- �ID        
            ,BAT_CODE                       -- ���δ���      
            ,COM_TYP                        -- ��������      
            ,BAT_PRJT                       -- ������Ŀ      
            ,COMP_ID                        -- �ֹ�˾����    
            ,CITY_ID                        -- ����ID        
            ,ORG_ID                        -- ��֯�ܹ�����              
            ,WP_ID                          -- ְ��ID        
            ,PRJT_MGR_ID                    -- ��Ŀ����ID    
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID      
            ,USER_ID                        -- ��ϯID        
            --,FST_CAL_LIST_QTY               -- �ײ�������    
           --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������    
            ,CONT_LIST_QTY                  -- �Ӵ�������    
            --,REJ_LIST_QTY                   -- �ܾ�������    
            --,OLINE_SMIT_QTY                 -- �����ύ����  
            --,OLINE_SMIT_PRM                 -- �����ύ����  
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����  
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����  
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����  
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����  
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���    
            --,LAND_SUCC_QTY                  -- ��سɹ���    
            --,LAND_SUCC_PRM                  -- ��سɹ�����  
            )
        
 SELECT V_DATE_DAY              AS CAL_DAY_ID,
       '-1'                      AS PAY_MODE,
       T4.OB_COM_NAME            AS ACTV_ID, --�ID
       T2.BATCH_NAME             AS BAT_CODE,   ---���α���
       T2.COM_TYPE               AS COM_TYP,--�������ࣨ�¶������������н飩
       T4.PRJ_ID                 AS BAT_PRJT,--������Ŀ
       T4.COMPANY_ID             AS COMP_ID,--�ֹ�˾
       T2.BELONGCITY             AS CITY_ID,--��������
       T5.ORG_ID                 AS ORG_ID,--����
       NVL(T5.WORKPLACE_ID, '-1') AS WP_ID,--ְ��ID
       T5.ORG_ID                  AS PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID                  AS TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID                 AS USER_ID, --��ϯ����
       COUNT(DISTINCT T1.CUS_LIST_ID)   AS CONT_LIST_QTY--�Ӵ�����
  FROM TB_SALE_HISTORY T1 INNER JOIN  TB_TASK  T3 ON T1.TASK_ID=T3.TASK_ID
      INNER JOIN  TB_SALE_BATCH  T2 ON T2.BATCH_ID=T3.BATCH_ID
      INNER JOIN TB_OB_COM T4 ON T4.OB_COM_ID=T1.OBCOM_ID 
      INNER JOIN C_USER T5  ON T3.USER_ID=T5.USERID --AND T3.ORG_ID=T5.ORG_ID
 WHERE 
   T1.IS_CONTACT='1'--�Ӵ������0��δ�Ӵ���1���ѽӴ���
   AND T1.CREATE_HISTORY_DATE >= V_BEG_DATE 
   AND T1.CREATE_HISTORY_DATE <= V_END_DATE
   GROUP BY
       V_DATE_DAY
       ,'-1'
       ,T4.OB_COM_NAME
       ,T2.BATCH_NAME
       ,T2.COM_TYPE
       ,T4.PRJ_ID
       ,T4.COMPANY_ID
       ,T2.BELONGCITY
       ,T5.ORG_ID
       ,T5.WORKPLACE_ID
       ,T5.ORG_ID
       ,T5.ORG_ID 
       ,T3.USER_ID;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;
   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

  --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '����ܾ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

   V_ROW_NUM := 0;
   --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_DAY
         (  CAL_DAY_ID                     -- ͳ������      
            ,PAY_MODE                       -- �ɷѷ�ʽ      
            ,ACTV_ID                        -- �ID        
            ,BAT_CODE                       -- ���δ���      
            ,COM_TYP                        -- ��������      
            ,BAT_PRJT                       -- ������Ŀ      
            ,COMP_ID                        -- �ֹ�˾����    
            ,CITY_ID                        -- ����ID        
            ,ORG_ID                        -- ��֯�ܹ�����              
            ,WP_ID                          -- ְ��ID        
            ,PRJT_MGR_ID                    -- ��Ŀ����ID    
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID      
            ,USER_ID                        -- ��ϯID        
            --,FST_CAL_LIST_QTY               -- �ײ�������    
           --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������    
           -- ,CONT_LIST_QTY                  -- �Ӵ�������    
            ,REJ_LIST_QTY                   -- �ܾ�������    
            --,OLINE_SMIT_QTY                 -- �����ύ����  
            --,OLINE_SMIT_PRM                 -- �����ύ����  
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����  
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����  
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����  
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����  
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���    
            --,LAND_SUCC_QTY                  -- ��سɹ���    
            --,LAND_SUCC_PRM                  -- ��سɹ�����  
            )
     SELECT V_DATE_DAY              AS CAL_DAY_ID,
       '-1'                         AS PAY_MODE,
       T4.OB_COM_NAME               AS ACTV_ID, --�ID
       T2.BATCH_NAME                AS BAT_CODE,   ---���α���
       T2.COM_TYPE                  AS COM_TYP,--�������ࣨ�¶������������н飩
       T4.PRJ_ID                    AS BAT_PRJT,--������Ŀ
       T4.COMPANY_ID                AS COMP_ID,--�ֹ�˾
       T2.BELONGCITY                AS CITY_ID,
       T5.ORG_ID                    AS ORG_ID,--����
       NVL(T5.WORKPLACE_ID, '-1')   AS WP_ID,--ְ��ID
       T5.ORG_ID                    AS PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID                    AS TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID                   AS USER_ID, --��ϯ����
       COUNT(DISTINCT T3.CUS_LIST_ID)--����
  FROM TB_TASK_ALL T3
       INNER JOIN TB_SALE_BATCH   T2 ON T2.BATCH_ID=T3.BATCH_ID 
       INNER JOIN TB_OB_COM  T4 ON T4.OB_COM_ID=T3.OB_COM_ID
       INNER JOIN C_USER T5 ON T3.USER_ID=T5.USERID --AND T3.ORG_ID=T5.ORG_ID
 WHERE 1=1
   AND T3.STATUS_ID='11'--ʧ��״̬
   AND T3.SECOND_RESULT IN ('1','2','5')--�������������1�պš�2��š�5������� Ϊ��Ч����
   AND T3.CHANGE_TIME1=I_DATE_DAY
   GROUP BY
       V_DATE_DAY
       ,'-1'
       ,T4.OB_COM_NAME
       ,T2.BATCH_NAME
       ,T2.COM_TYPE
       ,T4.PRJ_ID
       ,T4.COMPANY_ID
       ,T2.BELONGCITY
       ,T5.ORG_ID
       ,NVL(T5.WORKPLACE_ID, '-1')
       ,T5.ORG_ID
       ,T5.ORG_ID
       ,T3.USER_ID
              ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;


   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
 --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '���������ύ�������ѡ����ϳɽ��������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
   --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_DAY
         (  CAL_DAY_ID                     -- ͳ������      
            ,PAY_MODE                       -- �ɷѷ�ʽ      
            ,ACTV_ID                        -- �ID        
            ,BAT_CODE                       -- ���δ���      
            ,COM_TYP                        -- ��������      
            ,BAT_PRJT                       -- ������Ŀ      
            ,COMP_ID                        -- �ֹ�˾����    
            ,CITY_ID                        -- ����ID        
            ,ORG_ID                        -- ��֯�ܹ�����              
            ,WP_ID                          -- ְ��ID        
            ,PRJT_MGR_ID                    -- ��Ŀ����ID    
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID      
            ,USER_ID                        -- ��ϯID        
            --,FST_CAL_LIST_QTY               -- �ײ�������    
            --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������    
            --,CONT_LIST_QTY                  -- �Ӵ�������    
            --,REJ_LIST_QTY                   -- �ܾ�������    
            ,OLINE_SMIT_QTY                 -- �����ύ����  
            ,OLINE_SMIT_PRM                 -- �����ύ����  
            ,OLINE_TRAN_QTY                 -- ���ϳɽ�����  
            ,OLINE_TRAN_PRM                 -- ���ϳɽ�����  
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����  
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����  
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���    
            --,LAND_SUCC_QTY                  -- ��سɹ���    
            --,LAND_SUCC_PRM                  -- ��سɹ�����  
            )
   SELECT  V_DATE_DAY                         AS CAL_DAY_ID,
       TT.PAY_TYP                             AS PAY_MODE,
       TT.OB_COM_NAME                         AS ACTV_ID,--�ID
       TT.BATCH_NAME                          AS BAT_CODE, ---���α���
       TT.COM_TYPE                            AS COM_TYP,--�������ࣨ�¶������������н飩
       TT.PRJ_ID                              AS BAT_PRJT,--������Ŀ
       TT.COMPANY_ID                          AS COMP_ID,--�ֹ�˾
       TT.BELONGCITY                          AS CITY_ID,--��������
       TT.ORG_ID                              AS ORG_ID,--����
       NVL(TT.WORKPLACE_ID, '-1')             AS WP_ID,--ְ��ID
       TT.PRJT_MGR_ID                         AS PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID                         AS TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID                             AS USER_ID,  --��ϯ
       COUNT(DISTINCT CASE WHEN  TT.STATUS_ID ='7'AND TT.TYPE_ID='5' THEN  TT.APPNO ELSE NULL END )   AS OLINE_SMIT_QTY,--�����ύ����
       SUM(CASE WHEN TT.STATUS_ID ='7'AND TT.TYPE_ID='5' THEN
                    (CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                          WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                          WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                          ELSE TT.TOTAL_FEE END)
                ELSE 0 END)       AS OLINE_SMIT_PRM,--�����ύ����
       COUNT(DISTINCT CASE WHEN TT.STATUS_ID ='12'AND TT.TYPE_ID='7' THEN  TT.APPNO ELSE NULL END ) AS OLINE_TRAN_QTY,--���ϳɽ�����
       SUM(CASE WHEN TT.STATUS_ID ='12'AND TT.TYPE_ID='7' THEN
                    (CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                          WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                          WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                          ELSE TT.TOTAL_FEE END
                          )
                ELSE 0 END)              AS OLINE_TRAN_PRM --���ϳɽ�����
        FROM  ( SELECT DISTINCT
                 T2.OB_COM_NAME,
                 T3.BATCH_NAME,
                 T3.COM_TYPE ,
                 T2.PRJ_ID ,
                 T2.COMPANY_ID,
                 T3.BELONGCITY,
                 T6.ORG_ID,
                 T6.ORG_ID AS PRJT_MGR_ID,
                 T6.ORG_ID AS TEM_LEAD_ID,
                 T1.USER_ID ,
                 T1.STATUS_ID,
                 T1.TYPE_ID,
                 T5.PAY_TYP,
                 T4.APPNO,
                 T6.WORKPLACE_ID,
                 T4.TOTAL_FEE

        FROM  TB_TASK_ALL    T1,
              TB_OB_COM      T2,
              TB_SALE_BATCH  T3,
              C_USER         T6,
              TB_APPLICATION    T4,--Ͷ����������Ϣ��
              TB_APP_PRD_INFO   T5--Ͷ������Ʒ��
         WHERE T1.OB_COM_ID=T2.OB_COM_ID
           AND T1.BATCH_ID=T3.BATCH_ID
           AND T1.USER_ID=T6.USERID
           --AND T1.ORG_ID=T6.ORG_ID
           AND T1.TASK_ID=T4.TASK_ID
           AND T1.POLICY_ID=T4.APPNO--Ͷ����ID
           AND T4.APPLICATION_ID=T5.APPLICATION_ID
           AND T1.CHANGE_TIME1 =I_DATE_DAY
           )TT
  GROUP BY
       V_DATE_DAY
       ,TT.PAY_TYP
       ,TT.OB_COM_NAME
       ,TT.BATCH_NAME
       ,TT.COM_TYPE
       ,TT.PRJ_ID
       ,TT.COMPANY_ID
       ,TT.BELONGCITY
       ,TT.ORG_ID
       ,NVL(TT.WORKPLACE_ID, '-1')
       ,TT.PRJT_MGR_ID
       ,TT.TEM_LEAD_ID
       ,TT.USER_ID
             ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
             -------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�������ڿۿ�ɹ�������������,�껯�±���ʵ���±� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
  --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_DAY
         (  CAL_DAY_ID                     -- ͳ������      
            ,PAY_MODE                       -- �ɷѷ�ʽ      
            ,ACTV_ID                        -- �ID        
            ,BAT_CODE                       -- ���δ���      
            ,COM_TYP                        -- ��������      
            ,BAT_PRJT                       -- ������Ŀ      
            ,COMP_ID                        -- �ֹ�˾����    
            ,CITY_ID                        -- ����ID        
            ,ORG_ID                        -- ��֯�ܹ�����              
            ,WP_ID                          -- ְ��ID        
            ,PRJT_MGR_ID                    -- ��Ŀ����ID    
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID      
            ,USER_ID                        -- ��ϯID        
            --,FST_CAL_LIST_QTY               -- �ײ�������    
           --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������    
           --,CONT_LIST_QTY                  -- �Ӵ�������    
            --,REJ_LIST_QTY                   -- �ܾ�������    
            --,OLINE_SMIT_QTY                 -- �����ύ����  
            --,OLINE_SMIT_PRM                 -- �����ύ����  
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����  
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����  
            ,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            ,ANNUL_FST_PRM_PRM              -- �껯�±�����  
            ,ACTL_FST_PRM_PRM               -- ʵ���±�����  
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���    
            --,LAND_SUCC_QTY                  -- ��سɹ���    
            --,LAND_SUCC_PRM                  -- ��سɹ�����  
            )
    SELECT V_DATE_DAY                     AS CAL_DAY_ID,
           '-1'                           AS PAY_MODE,
           T4.OB_COM_NAME                 AS ACTV_ID, --�ID
           T2.BATCH_NAME                  AS BAT_CODE, ---���α���
           T2.COM_TYPE                    AS COM_TYP, --�������ࣨ�¶������������н飩
           T4.PRJ_ID                      AS BAT_PRJT, --������Ŀ
           T4.COMPANY_ID                  AS COMP_ID, --�ֹ�
           T2.BELONGCITY                  AS CITY_ID, --�������� 
           T5.ORG_ID                      AS ORG_ID, --����
           NVL(T5.WORKPLACE_ID, '-1')     AS WP_ID, --ְ��ID
           T5.ORG_ID                      AS PRJT_MGR_ID, --��Ŀ������
           T5.ORG_ID                      AS TEM_LEAD_ID, ---�Ŷӳ����
           T3.USER_ID                     AS USER_ID, --��ϯ����
           COUNT(DISTINCT CASE WHEN Z.PCODE ='2'THEN Z.POLICYNO ELSE NULL END)    AS  FST_CHARGBK_SUCC_QTY,--�ۿ��
           SUM(NVL((CASE
             WHEN Z.PCODE = '2' AND
                  Z.YEARNO = 1 AND
                  Z.PAYCODE = '10' THEN
              T1.NPAYLEN * T1.PIECES * 12
             WHEN Z.PCODE = '2' AND
                  PAYCODE = '11' THEN
              T1.NPAYLEN * T1.PIECES * 4
             WHEN Z.PCODE = '2' AND
                  Z.PAYCODE = '12' THEN
              T1.NPAYLEN * T1.PIECES * 2
             WHEN Z.PCODE = '2' AND
                  Z.PAYCODE = '13' THEN
             T1.NPAYLEN * T1.PIECES * 1
             ELSE
              0 END), 0)) +
               SUM(NVL((CASE
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '10' THEN
                  T1.NPAYLEN * T1.PIECES * -12
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '11' THEN
                  T1.NPAYLEN * T1.PIECES * -4
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '12' THEN
                  T1.NPAYLEN * T1.PIECES * -2
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '13' THEN
                  T1.NPAYLEN * T1.PIECES * -1
                 ELSE
                  0 END),0)) AS NNUL_FST_PRM_PRM,         --�껯�±�����
                  SUM( NVL((CASE WHEN Z.PCODE = '2' AND Z.YEARNO = 1
                     THEN Z.AMOUNT
                     ELSE 0
                     END),0)) + SUM(DISTINCT NVL(
                (CASE WHEN Z.PCODE = '8' AND Z.YEARNO = 1
                        THEN Z.AMOUNT
                        ELSE 0
                        END),0)) + SUM(DISTINCT NVL(
                (CASE WHEN Z.PCODE NOT IN ('8', '2') AND Z.YEARNO = 1
                      THEN Z.AMOUNT               --�޸Ľ�תȡֵ����
                      ELSE 0
                      END),0))  AS ACTL_FST_PRM_PRM          --ʵ���±�����
      FROM PREREC  Z, --����ʵ�ձ�
           RISKCON T1,--���˱�����
           TB_SALE_BATCH   T2,
           TB_TASK         T3,
           TB_OB_COM       T4,
           C_USER          T5
     WHERE Z.POLICYNO = T1.POLICYNO
       AND Z.CLASSCODE = T1.CLASSCODE
       AND T1.APPNO=T3.POLICY_ID
       AND T2.BATCH_ID=T3.BATCH_ID
       AND T4.OB_COM_ID=T3.OB_COM_ID
       AND T3.USER_ID=T5.USERID
      -- AND T3.ORG_ID=T5.ORG_ID
       AND Z.PCODE NOT IN ('Z', 'X', 'Y', '6', 'M')
       AND Z.SETCODE <> '9'
       AND T1.SALEATTR IN ('61', '62', '63', '64')--���������������ܹ�˾���ֹ�˾
       AND Z.YEARNO = 1--�����
       AND Z.PCODE IN('2','8')--�շ�\�˷�
       AND Z.PAYDATE = TO_DATE(TO_CHAR(Z.POPULATION_TSMP,'YYYYMMDD'),'YYYY-MM-DD')-(TO_DATE(TO_CHAR(Z.POPULATION_TSMP,'YYYYMMDD'),'YYYY-MM-DD')-Z.PAYDATE)
       AND TO_DATE(TO_CHAR(Z.POPULATION_TSMP,'YYYYMMDD'),'YYYY-MM-DD')=TO_DATE(I_DATE_DAY, 'YYYYMMDD')+1  
       GROUP BY
          V_DATE_DAY
           ,'-1'
           ,T4.OB_COM_NAME
           ,T2.BATCH_NAME
           ,T2.COM_TYPE
           ,T4.PRJ_ID
           ,T4.COMPANY_ID
           ,T2.BELONGCITY
           ,T5.ORG_ID
           ,T5.WORKPLACE_ID
           ,T5.ORG_ID
           ,T5.ORG_ID
           ,T3.USER_ID
         ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;


   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '��ԥ���˱����������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
  --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_DAY
         (  CAL_DAY_ID                     -- ͳ������      
            ,PAY_MODE                       -- �ɷѷ�ʽ      
            ,ACTV_ID                        -- �ID        
            ,BAT_CODE                       -- ���δ���      
            ,COM_TYP                        -- ��������      
            ,BAT_PRJT                       -- ������Ŀ      
            ,COMP_ID                        -- �ֹ�˾����    
            ,CITY_ID                        -- ����ID        
            ,ORG_ID                        -- ��֯�ܹ�����              
            ,WP_ID                          -- ְ��ID        
            ,PRJT_MGR_ID                    -- ��Ŀ����ID    
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID      
            ,USER_ID                        -- ��ϯID        
            --,FST_CAL_LIST_QTY               -- �ײ�������    
           --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������    
           --,CONT_LIST_QTY                  -- �Ӵ�������    
            --,REJ_LIST_QTY                   -- �ܾ�������    
            --,OLINE_SMIT_QTY                 -- �����ύ����  
            --,OLINE_SMIT_PRM                 -- �����ύ����  
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����  
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����  
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����  
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����  
            ,CNCL_QTY                       -- ��ԥ���˱�����
            ,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���    
            --,LAND_SUCC_QTY                  -- ��سɹ���    
            --,LAND_SUCC_PRM                  -- ��سɹ�����  
            )
    SELECT  V_DATE_DAY                     AS CAL_DAY_ID,
           Z.PAYCODE                       AS PAY_MODE,
           T4.OB_COM_NAME                  AS ACTV_ID, --�ID
           T2.BATCH_NAME                   AS BAT_CODE,   ---���α���
           T2.COM_TYPE                     AS COM_TYP,--�������ࣨ�¶������������н飩
           T4.PRJ_ID                       AS BAT_PRJT,--������Ŀ
           T4.COMPANY_ID                   AS COMP_ID,--�ֹ�˾
           T2.BELONGCITY                   AS CITY_ID,--��������
           T5.ORG_ID                       AS ORG_ID,--����
           NVL(T5.WORKPLACE_ID, '-1')      AS WP_ID,--ְ��ID
           T5.ORG_ID                       AS PRJT_MGR_ID,--��Ŀ������
           T5.ORG_ID                       AS TEM_LEAD_ID,  ---�Ŷӳ����
           T3.USER_ID                      AS USER_ID, --��ϯ����
        COUNT(DISTINCT(CASE  WHEN Z.PCODE = '8' AND Z.YEARNO = 1
                             THEN Z.POLICYNO
                             END)) * 1     AS CNCL_QTY,
                   --���˱���
                   SUM(DISTINCT NVL((CASE
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '10' THEN
                                T1.NPAYLEN * T1.PIECES * 12
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '11' THEN
                                T1.NPAYLEN * T1.PIECES * 4
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '12' THEN
                                T1.NPAYLEN * T1.PIECES * 2
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '13' THEN
                                T1.NPAYLEN * T1.PIECES * 1
                               ELSE
                                0
                           END),
                                     0))    AS CNCL_PRM
            FROM PREREC  Z  INNER JOIN RISKCON T1 ON Z.POLICYNO = T1.POLICYNO
                 INNER JOIN TB_TASK  T3 ON T1.APPNO=T3.POLICY_ID
                 INNER JOIN TB_SALE_BATCH  T2 ON T2.BATCH_ID=T3.BATCH_ID
                 INNER JOIN TB_OB_COM  T4 ON T4.OB_COM_ID=T3.OB_COM_ID
                 INNER JOIN C_USER T5  ON T3.USER_ID = T5.USERID --AND T3.ORG_ID = T5.ORG_ID
           WHERE Z.PCODE NOT IN ('Z', 'X', 'Y', '6', 'M')
             AND Z.PCODE = '8'
             AND Z.SETCODE <> '9'
             AND T1.SALEATTR IN ('61', '62', '63', '64')--���������������ܹ�˾���ֹ�˾
            -- AND Z.DEPTCODE IS NOT NULL
              AND Z.PAYDATE = TO_DATE(TO_CHAR(Z.POPULATION_TSMP,'YYYYMMDD'),'YYYY-MM-DD')-(TO_DATE(TO_CHAR(Z.POPULATION_TSMP,'YYYYMMDD'),'YYYY-MM-DD')-Z.PAYDATE)
              AND TO_DATE(TO_CHAR(Z.POPULATION_TSMP,'YYYYMMDD'),'YYYY-MM-DD')=to_date(I_DATE_DAY, 'yyyymmdd')+1  
            
             GROUP BY
           V_DATE_DAY
           ,Z.PAYCODE
           ,T4.OB_COM_NAME
           ,T2.BATCH_NAME
           ,T2.COM_TYPE
           ,T4.PRJ_ID
           ,T4.COMPANY_ID
           ,T2.BELONGCITY
           ,T5.ORG_ID
           ,T5.WORKPLACE_ID
           ,T5.ORG_ID
           ,T5.ORG_ID
           ,T3.USER_ID
                  ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;


   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
    --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '������سɹ����������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
  --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_DAY
         (  CAL_DAY_ID                     -- ͳ������      
            ,PAY_MODE                       -- �ɷѷ�ʽ      
            ,ACTV_ID                        -- �ID        
            ,BAT_CODE                       -- ���δ���      
            ,COM_TYP                        -- ��������      
            ,BAT_PRJT                       -- ������Ŀ      
            ,COMP_ID                        -- �ֹ�˾����    
            ,CITY_ID                        -- ����ID        
            ,ORG_ID                        -- ��֯�ܹ�����              
            ,WP_ID                          -- ְ��ID        
            ,PRJT_MGR_ID                    -- ��Ŀ����ID    
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID      
            ,USER_ID                        -- ��ϯID        
            --,FST_CAL_LIST_QTY               -- �ײ�������    
           --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������    
           --,CONT_LIST_QTY                  -- �Ӵ�������    
            --,REJ_LIST_QTY                   -- �ܾ�������    
            --,OLINE_SMIT_QTY                 -- �����ύ����  
            --,OLINE_SMIT_PRM                 -- �����ύ����  
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����  
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����  
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����  
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����  
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���    
            ,LAND_SUCC_QTY                  -- ��سɹ���    
            ,LAND_SUCC_PRM                  -- ��سɹ�����  
            )
             SELECT  V_DATE_DAY                     AS CAL_DAY_ID,
             TT.PAY_TYP                             AS PAY_MODE,
             TT.OB_COM_NAME                         AS ACTV_ID,--�ID
             TT.BATCH_NAME                          AS BAT_ID, ---���α���
             TT.COM_TYPE                            AS COM_TYP,--�������ࣨ�¶������������н飩
             TT.PRJ_ID                              AS BAT_PRJT,--������Ŀ
             TT.COMPANY_ID                          AS COMP_ID,--�ֹ�˾
             TT.BELONGCITY                          AS CITY_ID,--��������
             TT.ORG_ID                              AS ORG_TYP,--����
             NVL(TT.WORKPLACE_ID, '-1')             AS WP_ID,--ְ��ID
             TT.PRJT_MGR_ID                         AS PRJT_MGR_ID,--��Ŀ������
             TT.TEM_LEAD_ID                         AS TEM_LEAD_ID,  ---�Ŷӳ����
             TT.USER_ID                             AS USER_ID,  --��ϯ
             COUNT(DISTINCT TT.APPNO)               AS LAND_SUCC_QTY,--��سɹ���
             SUM(CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                      WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                      WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                      ELSE TT.TOTAL_FEE END)        AS LAND_SUCC_PRM--��سɹ�����
      FROM  ( SELECT DISTINCT
               T2.OB_COM_NAME,
               T3.BATCH_NAME,
               T3.COM_TYPE ,
               T2.PRJ_ID ,
               T2.COMPANY_ID,
               T3.BELONGCITY,
               T6.ORG_ID,
               T6.ORG_ID AS PRJT_MGR_ID,
               T6.ORG_ID AS TEM_LEAD_ID,
               T1.USER_ID ,
               T1.STATUS_ID,
               T1.TYPE_ID,
               T5.PAY_TYP,
               T4.APPNO,
               T6.WORKPLACE_ID,
               T4.TOTAL_FEE
      FROM  TB_TASK_ALL    T1,       
            TB_OB_COM      T2,
            TB_SALE_BATCH  T3,
            C_USER         T6,
            TB_APPLICATION    T4,--Ͷ����������Ϣ��
            TB_APP_PRD_INFO   T5,--Ͷ������Ʒ��
            TB_LOG T7
       WHERE T1.OB_COM_ID=T2.OB_COM_ID
         AND T1.BATCH_ID=T3.BATCH_ID
         AND T1.USER_ID=T6.USERID
        -- AND T1.ORG_ID=T6.ORG_ID
         AND T1.TASK_ID=T4.TASK_ID
         AND T1.POLICY_ID=T4.APPNO--Ͷ����ID
         AND T4.APPLICATION_ID=T5.APPLICATION_ID
         AND T7.IDOBJ=T4.APPLICATION_ID
         AND T4.IACCEPT='1'--�����ɹ����״̬
         AND T1.STATUS_ID ='12'
         AND T1.TYPE_ID ='7'
         AND T7.TTIME >= V_BEG_DATE
         AND T7.TTIME <= V_END_DATE
                 )TT
        GROUP BY
             V_DATE_DAY,
             TT.PAY_TYP,
             TT.OB_COM_NAME,--�ID
             TT.BATCH_NAME, ---���α���
             TT.PRJ_ID,--������Ŀ
             TT.COM_TYPE,--�������ࣨ�¶������������н飩
             TT.COMPANY_ID,--�ֹ�˾
             TT.BELONGCITY,--��������
             TT.ORG_ID,--����
             TT.WORKPLACE_ID,--ְ��ID
             TT.PRJT_MGR_ID,--��Ŀ������
             TT.TEM_LEAD_ID,  ---�Ŷӳ����
             TT.USER_ID ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;


   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
    --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '��ʱ�����ݲ�����ʵ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
   --�����������׼����ʱ��
         INSERT INTO TA_SALES_RPT_DAY
              (CAL_DAY_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_CODE
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,CTR_CODE
              ,SALES_PRJT
              ,TEM_CODE
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,FST_CAL_LIST_QTY
              ,FST_CAL_CONT_LIST_QTY
              ,TRK_LIST_QTY
              ,CONT_LIST_QTY
              ,REJ_LIST_QTY
              ,OLINE_SMIT_QTY
              ,OLINE_SMIT_PRM
              ,OLINE_TRAN_QTY
              ,OLINE_TRAN_PRM
              ,LAND_SUCC_QTY
              ,LAND_SUCC_PRM
              ,FST_CHARGBK_SUCC_QTY
              ,ANNUL_FST_PRM_PRM
              ,ACTL_FST_PRM_PRM
              ,CNCL_QTY
              ,CNCL_PRM)
        SELECT   TT.CAL_DAY_ID                  AS CAL_DAY_ID
                ,TT.PAY_MODE                    AS  PAY_MODE
                ,TT.ACTV_ID                     AS  ACTV_ID
                ,TT.BAT_CODE                    AS  BAT_CODE
                ,TT.COM_TYP                     AS  COM_TYP
                ,TT.BAT_PRJT                    AS  BAT_PRJT
                ,TT.COMP_ID                     AS  COMP_ID
                ,NVL(TT.CITY_ID,-1)             AS  CITY_ID
                ,Z.P_ORG_ID_LV2                 AS  CTR_CODE
                ,Z.P_ORG_ID_LV3                 AS  SALES_PRJT
                ,Z.P_ORG_ID_LV4                 AS  TEM_CODE
                ,NVL(TT.WP_ID,-1)               AS  WP_ID
                ,Z.PRJT_MGR_ID                  AS  PRJT_MGR_ID
                ,Z.TEM_LEAD_ID                  AS  TEM_LEAD_ID
                ,NVL(TT.USER_ID,'-1')           AS  USER_ID
                ,SUM(TT.FST_CAL_LIST_QTY)
                ,SUM(TT.FST_CAL_CONT_LIST_QTY)
                ,SUM(TT.TRK_LIST_QTY)
                ,SUM(TT.CONT_LIST_QTY)
                ,SUM(TT.REJ_LIST_QTY)
                ,SUM(TT.OLINE_SMIT_QTY)
                ,SUM(TT.OLINE_SMIT_PRM)
                ,SUM(TT.OLINE_TRAN_QTY)
                ,SUM(TT.OLINE_TRAN_PRM)
                ,SUM(TT.LAND_SUCC_QTY)
                ,SUM(TT.LAND_SUCC_PRM)
                ,SUM(TT.FST_CHARGBK_SUCC_QTY)
                ,SUM(TT.ANNUL_FST_PRM_PRM)
                ,SUM(TT.ACTL_FST_PRM_PRM)
                ,SUM(TT.CNCL_QTY)
                ,SUM(TT.CNCL_PRM)
       FROM TEMP_SALES_RPT_DAY TT,
                    ORGID_REF  Z
          WHERE TT.ORG_ID=Z.ORG_ID
          GROUP BY
           TT.CAL_DAY_ID
          ,TT.PAY_MODE
          ,TT.ACTV_ID
          ,TT.BAT_CODE
          ,TT.COM_TYP
          ,TT.BAT_PRJT
          ,TT.COMP_ID
          ,TT.CITY_ID 
          ,Z.P_ORG_ID_LV2 
          ,Z.P_ORG_ID_LV3
          ,Z.P_ORG_ID_LV4
          ,TT.WP_ID
          ,Z.PRJT_MGR_ID
          ,Z.TEM_LEAD_ID
          ,TT.USER_ID  ;
   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
   ERR_NUM                    := 0;
   ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;
END;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_MON
prompt ======================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.SP_TA_SALES_RPT_MON (
   I_DATE_DAY     IN       NUMBER
 --, I_END_DATE     IN       NUMBER
 , ERR_NUM        OUT      NUMBER
 , ERR_MSG        OUT      VARCHAR2
)
AS
   /**
     * ���������� �����±�
     * ��������� I_DATE_DAY             ����ʱ��,�������Ϊ��,�׳��쳣
     * ��������� ERR_NUM                ���ִ���ʱ����ִ�д����
     * �������������ERR_MSG                ���ִ���ʱ���صĴ�����Ϣ
     * ��д��Ա�����ҷ�
     * �������ڣ�2012-09-03
     * ��˾���ƣ�
     **/
   STAT_MON_DAY                    DATE := TO_DATE(I_DATE_DAY,'YYYYMMDD');             --����ʱ��
   V_DAY                         NUMBER := I_DATE_DAY;       --����ʱ��
   STAT_MON                      NUMBER:= TO_NUMBER(SUBSTR(TO_CHAR(TO_DATE(I_DATE_DAY, 'YYYYMMDD'), 'YYYYMMDD'), 1, 6));
   V_BEG_DATE                    DATE:=TO_DATE(TO_CHAR(STAT_MON)||'01 00:00:00','YYYY-MM-DD HH24:MI:SS');  --��ʼ����
   V_END_DATE                    DATE:=LAST_DAY(TO_DATE(TO_CHAR(STAT_MON)||'01 23:59:59','YYYY-MM-DD HH24:MI:SS')); --��������
   V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_MON';--��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF STAT_MON_DAY IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'I_DATE_DAY IS NULL!');
   END IF;

   --�����ʱ������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_SALES_RPT_MON';
     --֧�ֶ������ݼ���
  DELETE FROM TA_SALES_RPT_MON T
     WHERE T.CAL_MON_ID=STAT_MON;
     COMMIT;
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�����ײ�������������������ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
   --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_MON
         (  CAL_MON_ID                     -- ͳ������
            ,PAY_MODE                       -- �ɷѷ�ʽ
            ,ACTV_ID                        -- �ID
            ,BAT_CODE                       -- ���δ���
            ,COM_TYP                        -- ��������
            ,BAT_PRJT                       -- ������Ŀ
            ,COMP_ID                        -- �ֹ�˾����
            ,CITY_ID                        -- ����ID
            ,ORG_ID                        -- ��֯�ܹ�����
            ,WP_ID                          -- ְ��ID
            ,PRJT_MGR_ID                    -- ��Ŀ����ID
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID
            ,USER_ID                        -- ��ϯID
            ,FST_CAL_LIST_QTY               -- �ײ�������
            --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
           ,TRK_LIST_QTY                   -- ����������
            --,CONT_LIST_QTY                  -- �Ӵ�������
            --,REJ_LIST_QTY                   -- �ܾ�������
            --,OLINE_SMIT_QTY                 -- �����ύ����
            --,OLINE_SMIT_PRM                 -- �����ύ����
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���
            --,LAND_SUCC_QTY                  -- ��سɹ���
            --,LAND_SUCC_PRM                  -- ��سɹ�����
            )

   SELECT
       STAT_MON              AS CAL_MON_ID,
       '-1'                    AS PAYMODE,  --���ѷ�ʽ
       T4.OB_COM_NAME          AS ACTV_ID, --�ID
       T2.BATCH_NAME           AS BAT_CODE, --���α���
       T2.COM_TYPE             AS COM_TYP,--�������ࣨ�¶������������н飩
       T4.PRJ_ID               AS BAT_PRJT,--������Ŀ
       T4.COMPANY_ID           AS COMP_ID,--�ֹ�˾
       T2.BELONGCITY           AS CITY_ID, --����
       T5.ORG_ID               AS ORG_ID,--��֯����
       NVL(T5.WORKPLACE_ID, '-1')AS WP_ID,--ְ�����
       T5.ORG_ID               AS PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID               AS TEM_LEAD_ID,  ---�Ŷӳ����
       T1.USER_ID              AS USER_ID, --��ϯ����
       COUNT(DISTINCT CASE WHEN T1.STATUS_ID <> '6' AND T1.STATUS_ID2='6' AND T1.TYPE_ID2='4' THEN T1.CUS_LIST_ID ELSE NULL END) AS FST_CAL_LIST_QTY,--����
       COUNT(DISTINCT CASE WHEN TYPE_ID='2' AND  T1.TYPE_ID2<>'4' THEN T1.CUS_LIST_ID ELSE NULL END) AS TRK_LIST_QTY-- ����������
     FROM TB_TASK_ALL T1
       INNER JOIN  TB_SALE_BATCH  T2 ON T1.BATCH_ID=T2.BATCH_ID
       INNER JOIN  TB_OB_COM  T4 ON T4.OB_COM_ID=T1.OB_COM_ID
       INNER JOIN  C_USER  T5 ON  T5.USERID=T1.USER_ID  --AND T5.ORG_ID=T1.ORG_ID
 WHERE 1=1
   --T1.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T1.TYPE_ID<>'4'--�������� �ײ�
  -- AND T1.STATUS_ID2='6'
  -- AND T1.TYPE_ID2='4'
   AND T1.CHANGE_TIME1=T1.CREATE_HISTORY_DATE2--
   AND T1.CHANGE_TIME >= V_BEG_DATE 
   AND T1.CHANGE_TIME <= V_END_DATE
   --AND TO_DATE(TO_CHAR(T1.CREATE_HISTORY_DATE, 'YYYYMMDD'), 'YYYYMMDD') =TO_DATE( STAT_DATE, 'YYYYMMDD')
   GROUP BY
      STAT_MON
      ,'-1'
      ,T4.OB_COM_NAME
      ,T2.BATCH_NAME
      ,T2.COM_TYPE
      ,T4.PRJ_ID
      ,T4.COMPANY_ID
      ,T2.BELONGCITY
      ,T5.ORG_ID
      ,NVL(T5.WORKPLACE_ID, '-1')
      ,T5.ORG_ID
      ,T5.ORG_ID
      ,T1.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
 -------------------------------------
          --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�����ײ��Ӵ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
   --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_MON
         (  CAL_MON_ID                     -- ͳ������
            ,PAY_MODE                       -- �ɷѷ�ʽ
            ,ACTV_ID                        -- �ID
            ,BAT_CODE                       -- ���δ���
            ,COM_TYP                        -- ��������
            ,BAT_PRJT                       -- ������Ŀ
            ,COMP_ID                        -- �ֹ�˾����
            ,CITY_ID                        -- ����ID
            ,ORG_ID                        -- ��֯�ܹ�����
            ,WP_ID                          -- ְ��ID
            ,PRJT_MGR_ID                    -- ��Ŀ����ID
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID
            ,USER_ID                        -- ��ϯID
            --,FST_CAL_LIST_QTY               -- �ײ�������
           ,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������
            --,CONT_LIST_QTY                  -- �Ӵ�������
            --,REJ_LIST_QTY                   -- �ܾ�������
            --,OLINE_SMIT_QTY                 -- �����ύ����
            --,OLINE_SMIT_PRM                 -- �����ύ����
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���
            --,LAND_SUCC_QTY                  -- ��سɹ���
            --,LAND_SUCC_PRM                  -- ��سɹ�����
            )

  SELECT
       STAT_MON              AS CAL_MON_ID,
       '-1'                    AS PAYMODE,  --���ѷ�ʽ
       T4.OB_COM_NAME          AS ACTV_ID, --�ID
       T2.BATCH_NAME           AS BAT_CODE, --���α���
       T2.COM_TYPE             AS COM_TYP,--�������ࣨ�¶������������н飩
       T4.PRJ_ID               AS BAT_PRJT,--������Ŀ
       T4.COMPANY_ID           AS COMP_ID,--�ֹ�˾
       T2.BELONGCITY           AS CITY_ID, --����
       T5.ORG_ID               AS ORG_ID,--��֯����
       NVL(T5.WORKPLACE_ID, '-1')AS WP_ID,--ְ�����
       T5.ORG_ID               AS PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID               AS TEM_LEAD_ID,  ---�Ŷӳ����
       T1.USER_ID              AS USER_ID, --��ϯ����
       COUNT(DISTINCT T1.CUS_LIST_ID) AS FST_CAL_CONT_LIST_QTY--����
     FROM TB_TASK_ALL T1
       INNER JOIN  TB_SALE_BATCH  T2 ON T1.BATCH_ID=T2.BATCH_ID
       INNER JOIN  TB_SALE_HISTORY T3 ON T1.TASK_ID=T3.TASK_ID
       INNER JOIN  TB_OB_COM  T4 ON T4.OB_COM_ID=T1.OB_COM_ID
       INNER JOIN  C_USER  T5 ON  T5.USERID=T1.USER_ID  --AND T5.ORG_ID=T1.ORG_ID
 WHERE
   T1.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T1.TYPE_ID<>'4'--�������� �ײ�
   AND T1.STATUS_ID2='6'
   AND T1.TYPE_ID2='4'
   AND T3.IS_THROUGH='1'--�Ӵ�
   AND T1.CHANGE_TIME1=T1.CREATE_HISTORY_DATE2--
   AND T1.CHANGE_TIME >= V_BEG_DATE 
   AND T1.CHANGE_TIME <= V_END_DATE
   --AND TO_DATE(TO_CHAR(T1.CREATE_HISTORY_DATE, 'YYYYMMDD'), 'YYYYMMDD') =TO_DATE( STAT_DATE, 'YYYYMMDD')
   GROUP BY
      STAT_MON
      ,'-1'
      ,T4.OB_COM_NAME
      ,T2.BATCH_NAME
      ,T2.COM_TYPE
      ,T4.PRJ_ID
      ,T4.COMPANY_ID
      ,T2.BELONGCITY
      ,T5.ORG_ID
      ,NVL(T5.WORKPLACE_ID, '-1')
      ,T5.ORG_ID
      ,T5.ORG_ID
      ,T1.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
  --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '����Ӵ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
  --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_MON
         (  CAL_MON_ID                     -- ͳ������
            ,PAY_MODE                       -- �ɷѷ�ʽ
            ,ACTV_ID                        -- �ID
            ,BAT_CODE                       -- ���δ���
            ,COM_TYP                        -- ��������
            ,BAT_PRJT                       -- ������Ŀ
            ,COMP_ID                        -- �ֹ�˾����
            ,CITY_ID                        -- ����ID
            ,ORG_ID                        -- ��֯�ܹ�����
            ,WP_ID                          -- ְ��ID
            ,PRJT_MGR_ID                    -- ��Ŀ����ID
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID
            ,USER_ID                        -- ��ϯID
            --,FST_CAL_LIST_QTY               -- �ײ�������
           --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������
            ,CONT_LIST_QTY                  -- �Ӵ�������
            --,REJ_LIST_QTY                   -- �ܾ�������
            --,OLINE_SMIT_QTY                 -- �����ύ����
            --,OLINE_SMIT_PRM                 -- �����ύ����
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���
            --,LAND_SUCC_QTY                  -- ��سɹ���
            --,LAND_SUCC_PRM                  -- ��سɹ�����
            )

 SELECT STAT_MON              AS CAL_MON_ID,
       '-1'                      AS PAY_MODE,
       T4.OB_COM_NAME            AS ACTV_ID, --�ID
       T2.BATCH_NAME             AS BAT_CODE,   ---���α���
       T2.COM_TYPE               AS COM_TYP,--�������ࣨ�¶������������н飩
       T4.PRJ_ID                 AS BAT_PRJT,--������Ŀ
       T4.COMPANY_ID             AS COMP_ID,--�ֹ�˾
       T2.BELONGCITY             AS CITY_ID,--��������
       T5.ORG_ID                 AS ORG_ID,--����
       NVL(T5.WORKPLACE_ID, '-1') AS WP_ID,--ְ��ID
       T5.ORG_ID                  AS PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID                  AS TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID                 AS USER_ID, --��ϯ����
       COUNT(DISTINCT T1.CUS_LIST_ID)   AS CONT_LIST_QTY--�Ӵ�����
  FROM TB_SALE_HISTORY T1 INNER JOIN  TB_TASK  T3 ON T1.TASK_ID=T3.TASK_ID
      INNER JOIN  TB_SALE_BATCH  T2 ON T2.BATCH_ID=T3.BATCH_ID
      INNER JOIN TB_OB_COM T4 ON T4.OB_COM_ID=T1.OBCOM_ID
      INNER JOIN C_USER T5  ON T3.USER_ID=T5.USERID --AND T3.ORG_ID=T5.ORG_ID
 WHERE
   T1.IS_CONTACT='1'--�Ӵ������0��δ�Ӵ���1���ѽӴ���
   AND T1.CREATE_HISTORY_DATE >= V_BEG_DATE
   AND T1.CREATE_HISTORY_DATE <= V_END_DATE
   GROUP BY
       STAT_MON
       ,'-1'
       ,T4.OB_COM_NAME
       ,T2.BATCH_NAME
       ,T2.COM_TYPE
       ,T4.PRJ_ID
       ,T4.COMPANY_ID
       ,T2.BELONGCITY
       ,T5.ORG_ID
       ,T5.WORKPLACE_ID
       ,T5.ORG_ID
       ,T5.ORG_ID
       ,T3.USER_ID;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;
   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

  --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '����ܾ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

   V_ROW_NUM := 0;
   --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_MON
         (  CAL_MON_ID                     -- ͳ������
            ,PAY_MODE                       -- �ɷѷ�ʽ
            ,ACTV_ID                        -- �ID
            ,BAT_CODE                       -- ���δ���
            ,COM_TYP                        -- ��������
            ,BAT_PRJT                       -- ������Ŀ
            ,COMP_ID                        -- �ֹ�˾����
            ,CITY_ID                        -- ����ID
            ,ORG_ID                        -- ��֯�ܹ�����
            ,WP_ID                          -- ְ��ID
            ,PRJT_MGR_ID                    -- ��Ŀ����ID
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID
            ,USER_ID                        -- ��ϯID
            --,FST_CAL_LIST_QTY               -- �ײ�������
           --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������
           -- ,CONT_LIST_QTY                  -- �Ӵ�������
            ,REJ_LIST_QTY                   -- �ܾ�������
            --,OLINE_SMIT_QTY                 -- �����ύ����
            --,OLINE_SMIT_PRM                 -- �����ύ����
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���
            --,LAND_SUCC_QTY                  -- ��سɹ���
            --,LAND_SUCC_PRM                  -- ��سɹ�����
            )
     SELECT STAT_MON              AS CAL_MON_ID,
       '-1'                         AS PAY_MODE,
       T4.OB_COM_NAME               AS ACTV_ID, --�ID
       T2.BATCH_NAME                AS BAT_CODE,   ---���α���
       T2.COM_TYPE                  AS COM_TYP,--�������ࣨ�¶������������н飩
       T4.PRJ_ID                    AS BAT_PRJT,--������Ŀ
       T4.COMPANY_ID                AS COMP_ID,--�ֹ�˾
       T2.BELONGCITY                AS CITY_ID,
       T5.ORG_ID                    AS ORG_ID,--����
       NVL(T5.WORKPLACE_ID, '-1')   AS WP_ID,--ְ��ID
       T5.ORG_ID                    AS PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID                    AS TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID                   AS USER_ID, --��ϯ����
       COUNT(DISTINCT T3.CUS_LIST_ID)--����
  FROM TB_TASK_ALL T3
       INNER JOIN TB_SALE_BATCH   T2 ON T2.BATCH_ID=T3.BATCH_ID
       INNER JOIN TB_OB_COM  T4 ON T4.OB_COM_ID=T3.OB_COM_ID
       INNER JOIN C_USER T5 ON T3.USER_ID=T5.USERID --AND T3.ORG_ID=T5.ORG_ID
 WHERE 1=1
   AND T3.STATUS_ID='11'--ʧ��״̬
   AND T3.SECOND_RESULT IN ('1','2','5')--�������������1�պš�2��š�5������� Ϊ��Ч����
   AND T3.CHANGE_TIME >= V_BEG_DATE 
   AND T3.CHANGE_TIME <= V_END_DATE
   GROUP BY
       STAT_MON
       ,'-1'
       ,T4.OB_COM_NAME
       ,T2.BATCH_NAME
       ,T2.COM_TYPE
       ,T4.PRJ_ID
       ,T4.COMPANY_ID
       ,T2.BELONGCITY
       ,T5.ORG_ID
       ,NVL(T5.WORKPLACE_ID, '-1')
       ,T5.ORG_ID
       ,T5.ORG_ID
       ,T3.USER_ID
              ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;


   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
 --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '���������ύ�������ѡ����ϳɽ��������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
   --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_MON
         (  CAL_MON_ID                     -- ͳ������
            ,PAY_MODE                       -- �ɷѷ�ʽ
            ,ACTV_ID                        -- �ID
            ,BAT_CODE                       -- ���δ���
            ,COM_TYP                        -- ��������
            ,BAT_PRJT                       -- ������Ŀ
            ,COMP_ID                        -- �ֹ�˾����
            ,CITY_ID                        -- ����ID
            ,ORG_ID                        -- ��֯�ܹ�����
            ,WP_ID                          -- ְ��ID
            ,PRJT_MGR_ID                    -- ��Ŀ����ID
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID
            ,USER_ID                        -- ��ϯID
            --,FST_CAL_LIST_QTY               -- �ײ�������
            --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������
            --,CONT_LIST_QTY                  -- �Ӵ�������
            --,REJ_LIST_QTY                   -- �ܾ�������
            ,OLINE_SMIT_QTY                 -- �����ύ����
            ,OLINE_SMIT_PRM                 -- �����ύ����
            ,OLINE_TRAN_QTY                 -- ���ϳɽ�����
            ,OLINE_TRAN_PRM                 -- ���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���
            --,LAND_SUCC_QTY                  -- ��سɹ���
            --,LAND_SUCC_PRM                  -- ��سɹ�����
            )
   SELECT  STAT_MON                         AS CAL_MON_ID,
       TT.PAY_TYP                             AS PAY_MODE,
       TT.OB_COM_NAME                         AS ACTV_ID,--�ID
       TT.BATCH_NAME                          AS BAT_CODE, ---���α���
       TT.COM_TYPE                            AS COM_TYP,--�������ࣨ�¶������������н飩
       TT.PRJ_ID                              AS BAT_PRJT,--������Ŀ
       TT.COMPANY_ID                          AS COMP_ID,--�ֹ�˾
       TT.BELONGCITY                          AS CITY_ID,--��������
       TT.ORG_ID                              AS ORG_ID,--����
       NVL(TT.WORKPLACE_ID, '-1')             AS WP_ID,--ְ��ID
       TT.PRJT_MGR_ID                         AS PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID                         AS TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID                             AS USER_ID,  --��ϯ
       COUNT(DISTINCT CASE WHEN  TT.STATUS_ID ='7'AND TT.TYPE_ID='5' THEN  TT.APPNO ELSE NULL END )   AS OLINE_SMIT_QTY,--�����ύ����
       SUM(CASE WHEN TT.STATUS_ID ='7'AND TT.TYPE_ID='5' THEN
                    (CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                          WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                          WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                          ELSE TT.TOTAL_FEE END)
                ELSE 0 END)       AS OLINE_SMIT_PRM,--�����ύ����
       COUNT(DISTINCT CASE WHEN TT.STATUS_ID ='12'AND TT.TYPE_ID='7' THEN  TT.APPNO ELSE NULL END ) AS OLINE_TRAN_QTY,--���ϳɽ�����
       SUM(CASE WHEN TT.STATUS_ID ='12'AND TT.TYPE_ID='7' THEN
                    (CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                          WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                          WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                          ELSE TT.TOTAL_FEE END
                          )
                ELSE 0 END)              AS OLINE_TRAN_PRM --���ϳɽ�����
        FROM  ( SELECT DISTINCT
                 T2.OB_COM_NAME,
                 T3.BATCH_NAME,
                 T3.COM_TYPE ,
                 T2.PRJ_ID ,
                 T2.COMPANY_ID,
                 T3.BELONGCITY,
                 T6.ORG_ID,
                 T6.ORG_ID AS PRJT_MGR_ID,
                 T6.ORG_ID AS TEM_LEAD_ID,
                 T1.USER_ID ,
                 T1.STATUS_ID,
                 T1.TYPE_ID,
                 T5.PAY_TYP,
                 T4.APPNO,
                 T6.WORKPLACE_ID,
                 T4.TOTAL_FEE

        FROM  TB_TASK_ALL    T1,
              TB_OB_COM      T2,
              TB_SALE_BATCH  T3,
              C_USER         T6,
              TB_APPLICATION    T4,--Ͷ����������Ϣ��
              TB_APP_PRD_INFO   T5--Ͷ������Ʒ��
         WHERE T1.OB_COM_ID=T2.OB_COM_ID
           AND T1.BATCH_ID=T3.BATCH_ID
           AND T1.USER_ID=T6.USERID
           --AND T1.ORG_ID=T6.ORG_ID
           AND T1.TASK_ID=T4.TASK_ID
           AND T1.POLICY_ID=T4.APPNO--Ͷ����ID
           AND T4.APPLICATION_ID=T5.APPLICATION_ID
           AND T1.CHANGE_TIME >= V_BEG_DATE 
           AND T1.CHANGE_TIME <= V_END_DATE
           )TT
  GROUP BY
       STAT_MON
       ,TT.PAY_TYP
       ,TT.OB_COM_NAME
       ,TT.BATCH_NAME
       ,TT.COM_TYPE
       ,TT.PRJ_ID
       ,TT.COMPANY_ID
       ,TT.BELONGCITY
       ,TT.ORG_ID
       ,NVL(TT.WORKPLACE_ID, '-1')
       ,TT.PRJT_MGR_ID
       ,TT.TEM_LEAD_ID
       ,TT.USER_ID
             ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
             -------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�������ڿۿ�ɹ�������������,�껯�±���ʵ���±� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
  --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_MON
         (  CAL_MON_ID                     -- ͳ������
            ,PAY_MODE                       -- �ɷѷ�ʽ
            ,ACTV_ID                        -- �ID
            ,BAT_CODE                       -- ���δ���
            ,COM_TYP                        -- ��������
            ,BAT_PRJT                       -- ������Ŀ
            ,COMP_ID                        -- �ֹ�˾����
            ,CITY_ID                        -- ����ID
            ,ORG_ID                        -- ��֯�ܹ�����
            ,WP_ID                          -- ְ��ID
            ,PRJT_MGR_ID                    -- ��Ŀ����ID
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID
            ,USER_ID                        -- ��ϯID
            --,FST_CAL_LIST_QTY               -- �ײ�������
           --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������
           --,CONT_LIST_QTY                  -- �Ӵ�������
            --,REJ_LIST_QTY                   -- �ܾ�������
            --,OLINE_SMIT_QTY                 -- �����ύ����
            --,OLINE_SMIT_PRM                 -- �����ύ����
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����
            ,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            ,ANNUL_FST_PRM_PRM              -- �껯�±�����
            ,ACTL_FST_PRM_PRM               -- ʵ���±�����
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���
            --,LAND_SUCC_QTY                  -- ��سɹ���
            --,LAND_SUCC_PRM                  -- ��سɹ�����
            )
    SELECT STAT_MON                     AS CAL_MON_ID,
           '-1'                           AS PAY_MODE,
           T4.OB_COM_NAME                 AS ACTV_ID, --�ID
           T2.BATCH_NAME                  AS BAT_CODE, ---���α���
           T2.COM_TYPE                    AS COM_TYP, --�������ࣨ�¶������������н飩
           T4.PRJ_ID                      AS BAT_PRJT, --������Ŀ
           T4.COMPANY_ID                  AS COMP_ID, --�ֹ�
           T2.BELONGCITY                  AS CITY_ID, --��������
           T5.ORG_ID                      AS ORG_ID, --����
           NVL(T5.WORKPLACE_ID, '-1')     AS WP_ID, --ְ��ID
           T5.ORG_ID                      AS PRJT_MGR_ID, --��Ŀ������
           T5.ORG_ID                      AS TEM_LEAD_ID, ---�Ŷӳ����
           T3.USER_ID                     AS USER_ID, --��ϯ����
           COUNT(DISTINCT CASE WHEN Z.PCODE ='2'THEN Z.POLICYNO ELSE NULL END)    AS  FST_CHARGBK_SUCC_QTY,--�ۿ��
           SUM(NVL((CASE
             WHEN Z.PCODE = '2' AND
                  Z.YEARNO = 1 AND
                  Z.PAYCODE = '10' THEN
              T1.NPAYLEN * T1.PIECES * 12
             WHEN Z.PCODE = '2' AND
                  PAYCODE = '11' THEN
              T1.NPAYLEN * T1.PIECES * 4
             WHEN Z.PCODE = '2' AND
                  Z.PAYCODE = '12' THEN
              T1.NPAYLEN * T1.PIECES * 2
             WHEN Z.PCODE = '2' AND
                  Z.PAYCODE = '13' THEN
             T1.NPAYLEN * T1.PIECES * 1
             ELSE
              0 END), 0)) +
               SUM(NVL((CASE
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '10' THEN
                  T1.NPAYLEN * T1.PIECES * -12
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '11' THEN
                  T1.NPAYLEN * T1.PIECES * -4
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '12' THEN
                  T1.NPAYLEN * T1.PIECES * -2
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '13' THEN
                  T1.NPAYLEN * T1.PIECES * -1
                 ELSE
                  0 END),0)) AS NNUL_FST_PRM_PRM,         --�껯�±�����
                  SUM( NVL((CASE WHEN Z.PCODE = '2' AND Z.YEARNO = 1
                     THEN Z.AMOUNT
                     ELSE 0
                     END),0)) + SUM(DISTINCT NVL(
                (CASE WHEN Z.PCODE = '8' AND Z.YEARNO = 1
                        THEN Z.AMOUNT
                        ELSE 0
                        END),0)) + SUM(DISTINCT NVL(
                (CASE WHEN Z.PCODE NOT IN ('8', '2') AND Z.YEARNO = 1
                      THEN Z.AMOUNT               --�޸Ľ�תȡֵ����
                      ELSE 0
                      END),0))  AS ACTL_FST_PRM_PRM          --ʵ���±�����
      FROM PREREC  Z, --����ʵ�ձ�
           RISKCON T1,--���˱�����
           TB_SALE_BATCH   T2,
           TB_TASK         T3,
           TB_OB_COM       T4,
           C_USER          T5
     WHERE Z.POLICYNO = T1.POLICYNO
       AND Z.CLASSCODE = T1.CLASSCODE
       AND T1.APPNO=T3.POLICY_ID
       AND T2.BATCH_ID=T3.BATCH_ID
       AND T4.OB_COM_ID=T3.OB_COM_ID
       AND T3.USER_ID=T5.USERID
      -- AND T3.ORG_ID=T5.ORG_ID
       AND Z.PCODE NOT IN ('Z', 'X', 'Y', '6', 'M')
       AND Z.SETCODE <> '9'
       AND T1.SALEATTR IN ('61', '62', '63', '64')--���������������ܹ�˾���ֹ�˾
       AND Z.YEARNO = 1--�����
       AND Z.PCODE IN('2','8')--�շ�\�˷�
       AND Z.PAYDATE>= TO_DATE(STAT_MON,'YYYYMM')
       AND Z.PAYDATE <= LAST_DAY(TO_DATE(STAT_MON,'YYYYMM'))
   GROUP BY
          STAT_MON
           ,'-1'
           ,T4.OB_COM_NAME
           ,T2.BATCH_NAME
           ,T2.COM_TYPE
           ,T4.PRJ_ID
           ,T4.COMPANY_ID
           ,T2.BELONGCITY
           ,T5.ORG_ID
           ,T5.WORKPLACE_ID
           ,T5.ORG_ID
           ,T5.ORG_ID
           ,T3.USER_ID
         ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;


   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '��ԥ���˱����������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
  --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_MON
         (  CAL_MON_ID                     -- ͳ������
            ,PAY_MODE                       -- �ɷѷ�ʽ
            ,ACTV_ID                        -- �ID
            ,BAT_CODE                       -- ���δ���
            ,COM_TYP                        -- ��������
            ,BAT_PRJT                       -- ������Ŀ
            ,COMP_ID                        -- �ֹ�˾����
            ,CITY_ID                        -- ����ID
            ,ORG_ID                        -- ��֯�ܹ�����
            ,WP_ID                          -- ְ��ID
            ,PRJT_MGR_ID                    -- ��Ŀ����ID
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID
            ,USER_ID                        -- ��ϯID
            --,FST_CAL_LIST_QTY               -- �ײ�������
           --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������
           --,CONT_LIST_QTY                  -- �Ӵ�������
            --,REJ_LIST_QTY                   -- �ܾ�������
            --,OLINE_SMIT_QTY                 -- �����ύ����
            --,OLINE_SMIT_PRM                 -- �����ύ����
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����
            ,CNCL_QTY                       -- ��ԥ���˱�����
            ,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���
            --,LAND_SUCC_QTY                  -- ��سɹ���
            --,LAND_SUCC_PRM                  -- ��سɹ�����
            )
    SELECT  STAT_MON                     AS CAL_MON_ID,
           Z.PAYCODE                       AS PAY_MODE,
           T4.OB_COM_NAME                  AS ACTV_ID, --�ID
           T2.BATCH_NAME                   AS BAT_CODE,   ---���α���
           T2.COM_TYPE                     AS COM_TYP,--�������ࣨ�¶������������н飩
           T4.PRJ_ID                       AS BAT_PRJT,--������Ŀ
           T4.COMPANY_ID                   AS COMP_ID,--�ֹ�˾
           T2.BELONGCITY                   AS CITY_ID,--��������
           T5.ORG_ID                       AS ORG_ID,--����
           NVL(T5.WORKPLACE_ID, '-1')      AS WP_ID,--ְ��ID
           T5.ORG_ID                       AS PRJT_MGR_ID,--��Ŀ������
           T5.ORG_ID                       AS TEM_LEAD_ID,  ---�Ŷӳ����
           T3.USER_ID                      AS USER_ID, --��ϯ����
        COUNT(DISTINCT(CASE  WHEN Z.PCODE = '8' AND Z.YEARNO = 1
                             THEN Z.POLICYNO
                             END)) * 1     AS CNCL_QTY,
                   --���˱���
                   SUM(DISTINCT NVL((CASE
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '10' THEN
                                T1.NPAYLEN * T1.PIECES * 12
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '11' THEN
                                T1.NPAYLEN * T1.PIECES * 4
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '12' THEN
                                T1.NPAYLEN * T1.PIECES * 2
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '13' THEN
                                T1.NPAYLEN * T1.PIECES * 1
                               ELSE
                                0
                           END),
                                     0))    AS CNCL_PRM
            FROM PREREC  Z  INNER JOIN RISKCON T1 ON Z.POLICYNO = T1.POLICYNO
                 INNER JOIN TB_TASK  T3 ON T1.APPNO=T3.POLICY_ID
                 INNER JOIN TB_SALE_BATCH  T2 ON T2.BATCH_ID=T3.BATCH_ID
                 INNER JOIN TB_OB_COM  T4 ON T4.OB_COM_ID=T3.OB_COM_ID
                 INNER JOIN C_USER T5  ON T3.USER_ID = T5.USERID --AND T3.ORG_ID = T5.ORG_ID
           WHERE Z.PCODE NOT IN ('Z', 'X', 'Y', '6', 'M')
             AND Z.PCODE = '8'
             AND Z.SETCODE <> '9'
             AND T1.SALEATTR IN ('61', '62', '63', '64')--���������������ܹ�˾���ֹ�˾
            -- AND Z.DEPTCODE IS NOT NULL
              AND Z.PAYDATE>= TO_DATE(STAT_MON,'YYYYMM')
              AND Z.PAYDATE <= LAST_DAY(TO_DATE(STAT_MON,'YYYYMM'))
        GROUP BY
           STAT_MON
           ,Z.PAYCODE
           ,T4.OB_COM_NAME
           ,T2.BATCH_NAME
           ,T2.COM_TYPE
           ,T4.PRJ_ID
           ,T4.COMPANY_ID
           ,T2.BELONGCITY
           ,T5.ORG_ID
           ,T5.WORKPLACE_ID
           ,T5.ORG_ID
           ,T5.ORG_ID
           ,T3.USER_ID
                  ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;


   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
    --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '������سɹ����������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
  --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_MON
         (  CAL_MON_ID                     -- ͳ������
            ,PAY_MODE                       -- �ɷѷ�ʽ
            ,ACTV_ID                        -- �ID
            ,BAT_CODE                       -- ���δ���
            ,COM_TYP                        -- ��������
            ,BAT_PRJT                       -- ������Ŀ
            ,COMP_ID                        -- �ֹ�˾����
            ,CITY_ID                        -- ����ID
            ,ORG_ID                        -- ��֯�ܹ�����
            ,WP_ID                          -- ְ��ID
            ,PRJT_MGR_ID                    -- ��Ŀ����ID
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID
            ,USER_ID                        -- ��ϯID
            --,FST_CAL_LIST_QTY               -- �ײ�������
           --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������
           --,CONT_LIST_QTY                  -- �Ӵ�������
            --,REJ_LIST_QTY                   -- �ܾ�������
            --,OLINE_SMIT_QTY                 -- �����ύ����
            --,OLINE_SMIT_PRM                 -- �����ύ����
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���
            ,LAND_SUCC_QTY                  -- ��سɹ���
            ,LAND_SUCC_PRM                  -- ��سɹ�����
            )
             SELECT  STAT_MON                     AS CAL_MON_ID,
             TT.PAY_TYP                             AS PAY_MODE,
             TT.OB_COM_NAME                         AS ACTV_ID,--�ID
             TT.BATCH_NAME                          AS BAT_ID, ---���α���
             TT.COM_TYPE                            AS COM_TYP,--�������ࣨ�¶������������н飩
             TT.PRJ_ID                              AS BAT_PRJT,--������Ŀ
             TT.COMPANY_ID                          AS COMP_ID,--�ֹ�˾
             TT.BELONGCITY                          AS CITY_ID,--��������
             TT.ORG_ID                              AS ORG_TYP,--����
             NVL(TT.WORKPLACE_ID, '-1')             AS WP_ID,--ְ��ID
             TT.PRJT_MGR_ID                         AS PRJT_MGR_ID,--��Ŀ������
             TT.TEM_LEAD_ID                         AS TEM_LEAD_ID,  ---�Ŷӳ����
             TT.USER_ID                             AS USER_ID,  --��ϯ
             COUNT(DISTINCT TT.APPNO)               AS LAND_SUCC_QTY,--��سɹ���
             SUM(CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                      WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                      WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                      ELSE TT.TOTAL_FEE END)        AS LAND_SUCC_PRM--��سɹ�����
      FROM  ( SELECT DISTINCT
               T2.OB_COM_NAME,
               T3.BATCH_NAME,
               T3.COM_TYPE ,
               T2.PRJ_ID ,
               T2.COMPANY_ID,
               T3.BELONGCITY,
               T6.ORG_ID,
               T6.ORG_ID AS PRJT_MGR_ID,
               T6.ORG_ID AS TEM_LEAD_ID,
               T1.USER_ID ,
               T1.STATUS_ID,
               T1.TYPE_ID,
               T5.PAY_TYP,
               T4.APPNO,
               T6.WORKPLACE_ID,
               T4.TOTAL_FEE
      FROM  TB_TASK_ALL    T1,
            TB_OB_COM      T2,
            TB_SALE_BATCH  T3,
            C_USER         T6,
            TB_APPLICATION    T4,--Ͷ����������Ϣ��
            TB_APP_PRD_INFO   T5,--Ͷ������Ʒ��
            TB_LOG T7
       WHERE T1.OB_COM_ID=T2.OB_COM_ID
         AND T1.BATCH_ID=T3.BATCH_ID
         AND T1.USER_ID=T6.USERID
        -- AND T1.ORG_ID=T6.ORG_ID
         AND T1.TASK_ID=T4.TASK_ID
         AND T1.POLICY_ID=T4.APPNO--Ͷ����ID
         AND T4.APPLICATION_ID=T5.APPLICATION_ID
         AND T7.IDOBJ=T4.APPLICATION_ID
         AND T4.IACCEPT='1'--�����ɹ����״̬
         AND T1.STATUS_ID ='12'
         AND T1.TYPE_ID ='7'
         AND T7.TTIME >= V_BEG_DATE
         AND T7.TTIME <= V_END_DATE
                 )TT
        GROUP BY
             STAT_MON,
             TT.PAY_TYP,
             TT.OB_COM_NAME,--�ID
             TT.BATCH_NAME, ---���α���
             TT.PRJ_ID,--������Ŀ
             TT.COM_TYPE,--�������ࣨ�¶������������н飩
             TT.COMPANY_ID,--�ֹ�˾
             TT.BELONGCITY,--��������
             TT.ORG_ID,--����
             TT.WORKPLACE_ID,--ְ��ID
             TT.PRJT_MGR_ID,--��Ŀ������
             TT.TEM_LEAD_ID,  ---�Ŷӳ����
             TT.USER_ID ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;


   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
    --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '��ʱ�����ݲ�����ʵ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
   --�����������׼����ʱ��
         INSERT INTO TA_SALES_RPT_MON
              (CAL_MON_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_CODE
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,CTR_CODE
              ,SALES_PRJT
              ,TEM_CODE
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,FST_CAL_LIST_QTY
              ,FST_CAL_CONT_LIST_QTY
              ,TRK_LIST_QTY
              ,CONT_LIST_QTY
              ,REJ_LIST_QTY
              ,OLINE_SMIT_QTY
              ,OLINE_SMIT_PRM
              ,OLINE_TRAN_QTY
              ,OLINE_TRAN_PRM
              ,LAND_SUCC_QTY
              ,LAND_SUCC_PRM
              ,FST_CHARGBK_SUCC_QTY
              ,ANNUL_FST_PRM_PRM
              ,ACTL_FST_PRM_PRM
              ,CNCL_QTY
              ,CNCL_PRM)
        SELECT   TT.CAL_MON_ID                  AS CAL_MON_ID
                ,TT.PAY_MODE                    AS  PAY_MODE
                ,TT.ACTV_ID                     AS  ACTV_ID
                ,TT.BAT_CODE                    AS  BAT_CODE
                ,TT.COM_TYP                     AS  COM_TYP
                ,TT.BAT_PRJT                    AS  BAT_PRJT
                ,TT.COMP_ID                     AS  COMP_ID
                ,NVL(TT.CITY_ID,-1)             AS  CITY_ID
                ,Z.P_ORG_ID_LV2                 AS  CTR_CODE
                ,Z.P_ORG_ID_LV3                 AS  SALES_PRJT
                ,Z.P_ORG_ID_LV4                 AS  TEM_CODE
                ,NVL(TT.WP_ID,-1)               AS  WP_ID
                ,Z.PRJT_MGR_ID                  AS  PRJT_MGR_ID
                ,Z.TEM_LEAD_ID                  AS  TEM_LEAD_ID
                ,NVL(TT.USER_ID,'-1')           AS  USER_ID
                ,SUM(TT.FST_CAL_LIST_QTY)
                ,SUM(TT.FST_CAL_CONT_LIST_QTY)
                ,SUM(TT.TRK_LIST_QTY)
                ,SUM(TT.CONT_LIST_QTY)
                ,SUM(TT.REJ_LIST_QTY)
                ,SUM(TT.OLINE_SMIT_QTY)
                ,SUM(TT.OLINE_SMIT_PRM)
                ,SUM(TT.OLINE_TRAN_QTY)
                ,SUM(TT.OLINE_TRAN_PRM)
                ,SUM(TT.LAND_SUCC_QTY)
                ,SUM(TT.LAND_SUCC_PRM)
                ,SUM(TT.FST_CHARGBK_SUCC_QTY)
                ,SUM(TT.ANNUL_FST_PRM_PRM)
                ,SUM(TT.ACTL_FST_PRM_PRM)
                ,SUM(TT.CNCL_QTY)
                ,SUM(TT.CNCL_PRM)
       FROM TEMP_SALES_RPT_MON TT,
                    ORGID_REF  Z
          WHERE TT.ORG_ID=Z.ORG_ID
          GROUP BY
           TT.CAL_MON_ID
          ,TT.PAY_MODE
          ,TT.ACTV_ID
          ,TT.BAT_CODE
          ,TT.COM_TYP
          ,TT.BAT_PRJT
          ,TT.COMP_ID
          ,TT.CITY_ID
          ,Z.P_ORG_ID_LV2
          ,Z.P_ORG_ID_LV3
          ,Z.P_ORG_ID_LV4
          ,TT.WP_ID
          ,Z.PRJT_MGR_ID
          ,Z.TEM_LEAD_ID
          ,TT.USER_ID  ;
   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
   ERR_NUM                    := 0;
   ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;
END;
/

prompt
prompt Creating procedure SP_TA_SALES_RPT_WEK
prompt ======================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.SP_TA_SALES_RPT_WEK (
   I_DATE_DAY     IN       NUMBER
 --, I_END_DATE     IN       NUMBER
 , ERR_NUM        OUT      NUMBER
 , ERR_MSG        OUT      VARCHAR2
)
AS
   /**
     * ���������� �����ܱ�
     * ��������� I_DATE_DAY             ����ʱ��,�������Ϊ��,�׳��쳣
     * ��������� ERR_NUM                ���ִ���ʱ����ִ�д����
     * �������������ERR_MSG                ���ִ���ʱ���صĴ�����Ϣ
     * ��д��Ա�����ҷ�
     * �������ڣ�2012-03-29
     * ��˾���ƣ�
     **/
   V_DATE_DAY                    DATE := TO_DATE(I_DATE_DAY,'YYYYMMDD');             --����ʱ��
   V_DAY                         NUMBER := I_DATE_DAY;       --����ʱ��
   V_BEG_DATE                    DATE;  --��ʼ����
   V_END_DATE                    DATE;  --��������
   V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_TA_SALES_RPT_WEK';--��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
   V_DATE                        VARCHAR2(20);
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF V_DATE_DAY IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'I_DATE_DAY IS NULL!');
   END IF;

   --�����ʱ������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TEMP_SALES_RPT_WEK';
     --֧�ֶ������ݼ���
  SELECT WEEK_INTERVAL_ID INTO V_DATE
        FROM D_CALENDAR_DIM TT
          WHERE TT.CAL_DAY_ID = I_DATE_DAY;
  DELETE FROM    TA_SALES_RPT_WEK  T
      WHERE T.CAL_WEEK_ID=V_DATE ;
      COMMIT;
  --��ȡ���������ڲ���
   SELECT TO_DATE(SUBSTR(WEEK_INTERVAL, 1, 10)||' 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
         ,TO_DATE(SUBSTR(WEEK_INTERVAL, 12, 10)||' 23:59:59', 'YYYY-MM-DD HH24:MI:SS')
     INTO V_BEG_DATE
         ,V_END_DATE
     FROM D_CALENDAR_DIM A
    WHERE A.CAL_DAY_ID = I_DATE_DAY;
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�����ײ������������������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
   --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_WEK
         (  CAL_WEEK_ID                     -- ͳ������
            ,PAY_MODE                       -- �ɷѷ�ʽ
            ,ACTV_ID                        -- �ID
            ,BAT_CODE                       -- ���δ���
            ,COM_TYP                        -- ��������
            ,BAT_PRJT                       -- ������Ŀ
            ,COMP_ID                        -- �ֹ�˾����
            ,CITY_ID                        -- ����ID
            ,ORG_ID                        -- ��֯�ܹ�����
            ,WP_ID                          -- ְ��ID
            ,PRJT_MGR_ID                    -- ��Ŀ����ID
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID
            ,USER_ID                        -- ��ϯID
            ,FST_CAL_LIST_QTY               -- �ײ�������
            --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
           ,TRK_LIST_QTY                   -- ����������
            --,CONT_LIST_QTY                  -- �Ӵ�������
            --,REJ_LIST_QTY                   -- �ܾ�������
            --,OLINE_SMIT_QTY                 -- �����ύ����
            --,OLINE_SMIT_PRM                 -- �����ύ����
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���
            --,LAND_SUCC_QTY                  -- ��سɹ���
            --,LAND_SUCC_PRM                  -- ��سɹ�����
            )

   SELECT
       V_DATE              AS CAL_WEEK_ID,
       '-1'                    AS PAYMODE,  --���ѷ�ʽ
       T4.OB_COM_NAME          AS ACTV_ID, --�ID
       T2.BATCH_NAME           AS BAT_CODE, --���α���
       T2.COM_TYPE             AS COM_TYP,--�������ࣨ�¶������������н飩
       T4.PRJ_ID               AS BAT_PRJT,--������Ŀ
       T4.COMPANY_ID           AS COMP_ID,--�ֹ�˾
       T2.BELONGCITY           AS CITY_ID, --����
       T5.ORG_ID               AS ORG_ID,--��֯����
       NVL(T5.WORKPLACE_ID, '-1')AS WP_ID,--ְ�����
       T5.ORG_ID               AS PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID               AS TEM_LEAD_ID,  ---�Ŷӳ����
       T1.USER_ID              AS USER_ID, --��ϯ����
       COUNT(DISTINCT CASE WHEN T1.STATUS_ID <> '6' AND T1.STATUS_ID2='6' AND T1.TYPE_ID2='4' THEN T1.CUS_LIST_ID ELSE NULL END) AS FST_CAL_LIST_QTY,--����
       COUNT(DISTINCT CASE WHEN TYPE_ID='2' AND  T1.TYPE_ID2<>'4' THEN T1.CUS_LIST_ID ELSE NULL END) AS TRK_LIST_QTY-- ����������
     FROM TB_TASK_ALL T1
       INNER JOIN  TB_SALE_BATCH  T2 ON T1.BATCH_ID=T2.BATCH_ID
       INNER JOIN  TB_OB_COM  T4 ON T4.OB_COM_ID=T1.OB_COM_ID
       INNER JOIN  C_USER  T5 ON  T5.USERID=T1.USER_ID  --AND T5.ORG_ID=T1.ORG_ID
 WHERE 1=1
   --T1.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T1.TYPE_ID<>'4'--�������� �ײ�
  -- AND T1.STATUS_ID2='6'
  -- AND T1.TYPE_ID2='4'
   AND T1.CHANGE_TIME1=T1.CREATE_HISTORY_DATE2--
   AND T1.CHANGE_TIME >= V_BEG_DATE 
   AND T1.CHANGE_TIME <= V_END_DATE
   --AND TO_DATE(TO_CHAR(T1.CREATE_HISTORY_DATE, 'YYYYMMDD'), 'YYYYMMDD') =TO_DATE( STAT_DATE, 'YYYYMMDD')
   GROUP BY
      V_DATE
      ,'-1'
      ,T4.OB_COM_NAME
      ,T2.BATCH_NAME
      ,T2.COM_TYPE
      ,T4.PRJ_ID
      ,T4.COMPANY_ID
      ,T2.BELONGCITY
      ,T5.ORG_ID
      ,NVL(T5.WORKPLACE_ID, '-1')
      ,T5.ORG_ID
      ,T5.ORG_ID
      ,T1.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
 -------------------------------------
          --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�����ײ��Ӵ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
   --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_WEK
         (  CAL_WEEK_ID                     -- ͳ������
            ,PAY_MODE                       -- �ɷѷ�ʽ
            ,ACTV_ID                        -- �ID
            ,BAT_CODE                       -- ���δ���
            ,COM_TYP                        -- ��������
            ,BAT_PRJT                       -- ������Ŀ
            ,COMP_ID                        -- �ֹ�˾����
            ,CITY_ID                        -- ����ID
            ,ORG_ID                        -- ��֯�ܹ�����
            ,WP_ID                          -- ְ��ID
            ,PRJT_MGR_ID                    -- ��Ŀ����ID
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID
            ,USER_ID                        -- ��ϯID
            --,FST_CAL_LIST_QTY               -- �ײ�������
           ,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������
            --,CONT_LIST_QTY                  -- �Ӵ�������
            --,REJ_LIST_QTY                   -- �ܾ�������
            --,OLINE_SMIT_QTY                 -- �����ύ����
            --,OLINE_SMIT_PRM                 -- �����ύ����
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���
            --,LAND_SUCC_QTY                  -- ��سɹ���
            --,LAND_SUCC_PRM                  -- ��سɹ�����
            )

  SELECT
       V_DATE              AS CAL_WEEK_ID,
       '-1'                    AS PAYMODE,  --���ѷ�ʽ
       T4.OB_COM_NAME          AS ACTV_ID, --�ID
       T2.BATCH_NAME           AS BAT_CODE, --���α���
       T2.COM_TYPE             AS COM_TYP,--�������ࣨ�¶������������н飩
       T4.PRJ_ID               AS BAT_PRJT,--������Ŀ
       T4.COMPANY_ID           AS COMP_ID,--�ֹ�˾
       T2.BELONGCITY           AS CITY_ID, --����
       T5.ORG_ID               AS ORG_ID,--��֯����
       NVL(T5.WORKPLACE_ID, '-1')AS WP_ID,--ְ�����
       T5.ORG_ID               AS PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID               AS TEM_LEAD_ID,  ---�Ŷӳ����
       T1.USER_ID              AS USER_ID, --��ϯ����
       COUNT(DISTINCT T1.CUS_LIST_ID) AS FST_CAL_CONT_LIST_QTY--����
     FROM TB_TASK_ALL T1
       INNER JOIN  TB_SALE_BATCH  T2 ON T1.BATCH_ID=T2.BATCH_ID
       INNER JOIN  TB_SALE_HISTORY T3 ON T1.TASK_ID=T3.TASK_ID
       INNER JOIN  TB_OB_COM  T4 ON T4.OB_COM_ID=T1.OB_COM_ID
       INNER JOIN  C_USER  T5 ON  T5.USERID=T1.USER_ID  --AND T5.ORG_ID=T1.ORG_ID
 WHERE
   T1.STATUS_ID <> '6' --��ǰ����״̬��Ϊ���ײ� 6���ײ�
   AND T1.TYPE_ID<>'4'--�������� �ײ�
   AND T1.STATUS_ID2='6'
   AND T1.TYPE_ID2='4'
   AND T3.IS_THROUGH='1'--�Ӵ�
   AND T1.CHANGE_TIME1=T1.CREATE_HISTORY_DATE2--
   AND T1.CHANGE_TIME >= V_BEG_DATE 
   AND T1.CHANGE_TIME <= V_END_DATE
   --AND TO_DATE(TO_CHAR(T1.CREATE_HISTORY_DATE, 'YYYYMMDD'), 'YYYYMMDD') =TO_DATE( STAT_DATE, 'YYYYMMDD')
   GROUP BY
      V_DATE
      ,'-1'
      ,T4.OB_COM_NAME
      ,T2.BATCH_NAME
      ,T2.COM_TYPE
      ,T4.PRJ_ID
      ,T4.COMPANY_ID
      ,T2.BELONGCITY
      ,T5.ORG_ID
      ,NVL(T5.WORKPLACE_ID, '-1')
      ,T5.ORG_ID
      ,T5.ORG_ID
      ,T1.USER_ID
       ;

   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
  --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '����Ӵ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
  --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_WEK
         (  CAL_WEEK_ID                     -- ͳ������
            ,PAY_MODE                       -- �ɷѷ�ʽ
            ,ACTV_ID                        -- �ID
            ,BAT_CODE                       -- ���δ���
            ,COM_TYP                        -- ��������
            ,BAT_PRJT                       -- ������Ŀ
            ,COMP_ID                        -- �ֹ�˾����
            ,CITY_ID                        -- ����ID
            ,ORG_ID                        -- ��֯�ܹ�����
            ,WP_ID                          -- ְ��ID
            ,PRJT_MGR_ID                    -- ��Ŀ����ID
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID
            ,USER_ID                        -- ��ϯID
            --,FST_CAL_LIST_QTY               -- �ײ�������
           --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������
            ,CONT_LIST_QTY                  -- �Ӵ�������
            --,REJ_LIST_QTY                   -- �ܾ�������
            --,OLINE_SMIT_QTY                 -- �����ύ����
            --,OLINE_SMIT_PRM                 -- �����ύ����
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���
            --,LAND_SUCC_QTY                  -- ��سɹ���
            --,LAND_SUCC_PRM                  -- ��سɹ�����
            )

 SELECT V_DATE              AS CAL_WEEK_ID,
       '-1'                      AS PAY_MODE,
       T4.OB_COM_NAME            AS ACTV_ID, --�ID
       T2.BATCH_NAME             AS BAT_CODE,   ---���α���
       T2.COM_TYPE               AS COM_TYP,--�������ࣨ�¶������������н飩
       T4.PRJ_ID                 AS BAT_PRJT,--������Ŀ
       T4.COMPANY_ID             AS COMP_ID,--�ֹ�˾
       T2.BELONGCITY             AS CITY_ID,--��������
       T5.ORG_ID                 AS ORG_ID,--����
       NVL(T5.WORKPLACE_ID, '-1') AS WP_ID,--ְ��ID
       T5.ORG_ID                  AS PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID                  AS TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID                 AS USER_ID, --��ϯ����
       COUNT(DISTINCT T1.CUS_LIST_ID)   AS CONT_LIST_QTY--�Ӵ�����
  FROM TB_SALE_HISTORY T1 INNER JOIN  TB_TASK  T3 ON T1.TASK_ID=T3.TASK_ID
      INNER JOIN  TB_SALE_BATCH  T2 ON T2.BATCH_ID=T3.BATCH_ID
      INNER JOIN TB_OB_COM T4 ON T4.OB_COM_ID=T1.OBCOM_ID
      INNER JOIN C_USER T5  ON T3.USER_ID=T5.USERID --AND T3.ORG_ID=T5.ORG_ID
 WHERE
   T1.IS_CONTACT='1'--�Ӵ������0��δ�Ӵ���1���ѽӴ���
   AND T1.CREATE_HISTORY_DATE >= V_BEG_DATE
   AND T1.CREATE_HISTORY_DATE <= V_END_DATE
   GROUP BY
       V_DATE
       ,'-1'
       ,T4.OB_COM_NAME
       ,T2.BATCH_NAME
       ,T2.COM_TYPE
       ,T4.PRJ_ID
       ,T4.COMPANY_ID
       ,T2.BELONGCITY
       ,T5.ORG_ID
       ,T5.WORKPLACE_ID
       ,T5.ORG_ID
       ,T5.ORG_ID
       ,T3.USER_ID;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;
   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

  --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '����ܾ������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

   V_ROW_NUM := 0;
   --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_WEK
         (  CAL_WEEK_ID                     -- ͳ������
            ,PAY_MODE                       -- �ɷѷ�ʽ
            ,ACTV_ID                        -- �ID
            ,BAT_CODE                       -- ���δ���
            ,COM_TYP                        -- ��������
            ,BAT_PRJT                       -- ������Ŀ
            ,COMP_ID                        -- �ֹ�˾����
            ,CITY_ID                        -- ����ID
            ,ORG_ID                        -- ��֯�ܹ�����
            ,WP_ID                          -- ְ��ID
            ,PRJT_MGR_ID                    -- ��Ŀ����ID
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID
            ,USER_ID                        -- ��ϯID
            --,FST_CAL_LIST_QTY               -- �ײ�������
           --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������
           -- ,CONT_LIST_QTY                  -- �Ӵ�������
            ,REJ_LIST_QTY                   -- �ܾ�������
            --,OLINE_SMIT_QTY                 -- �����ύ����
            --,OLINE_SMIT_PRM                 -- �����ύ����
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���
            --,LAND_SUCC_QTY                  -- ��سɹ���
            --,LAND_SUCC_PRM                  -- ��سɹ�����
            )
     SELECT V_DATE              AS CAL_WEEK_ID,
       '-1'                         AS PAY_MODE,
       T4.OB_COM_NAME               AS ACTV_ID, --�ID
       T2.BATCH_NAME                AS BAT_CODE,   ---���α���
       T2.COM_TYPE                  AS COM_TYP,--�������ࣨ�¶������������н飩
       T4.PRJ_ID                    AS BAT_PRJT,--������Ŀ
       T4.COMPANY_ID                AS COMP_ID,--�ֹ�˾
       T2.BELONGCITY                AS CITY_ID,
       T5.ORG_ID                    AS ORG_ID,--����
       NVL(T5.WORKPLACE_ID, '-1')   AS WP_ID,--ְ��ID
       T5.ORG_ID                    AS PRJT_MGR_ID,--��Ŀ������
       T5.ORG_ID                    AS TEM_LEAD_ID,  ---�Ŷӳ����
       T3.USER_ID                   AS USER_ID, --��ϯ����
       COUNT(DISTINCT T3.CUS_LIST_ID)--����
  FROM TB_TASK_ALL T3
       INNER JOIN TB_SALE_BATCH   T2 ON T2.BATCH_ID=T3.BATCH_ID
       INNER JOIN TB_OB_COM  T4 ON T4.OB_COM_ID=T3.OB_COM_ID
       INNER JOIN C_USER T5 ON T3.USER_ID=T5.USERID --AND T3.ORG_ID=T5.ORG_ID
 WHERE 1=1
   AND T3.STATUS_ID='11'--ʧ��״̬
   AND T3.SECOND_RESULT IN ('1','2','5')--�������������1�պš�2��š�5������� Ϊ��Ч����
   AND T3.CHANGE_TIME >= V_BEG_DATE 
   AND T3.CHANGE_TIME <= V_END_DATE
   GROUP BY
       V_DATE
       ,'-1'
       ,T4.OB_COM_NAME
       ,T2.BATCH_NAME
       ,T2.COM_TYPE
       ,T4.PRJ_ID
       ,T4.COMPANY_ID
       ,T2.BELONGCITY
       ,T5.ORG_ID
       ,NVL(T5.WORKPLACE_ID, '-1')
       ,T5.ORG_ID
       ,T5.ORG_ID
       ,T3.USER_ID
              ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;


   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
 --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '���������ύ�������ѡ����ϳɽ��������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
   --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_WEK
         (  CAL_WEEK_ID                     -- ͳ������
            ,PAY_MODE                       -- �ɷѷ�ʽ
            ,ACTV_ID                        -- �ID
            ,BAT_CODE                       -- ���δ���
            ,COM_TYP                        -- ��������
            ,BAT_PRJT                       -- ������Ŀ
            ,COMP_ID                        -- �ֹ�˾����
            ,CITY_ID                        -- ����ID
            ,ORG_ID                        -- ��֯�ܹ�����
            ,WP_ID                          -- ְ��ID
            ,PRJT_MGR_ID                    -- ��Ŀ����ID
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID
            ,USER_ID                        -- ��ϯID
            --,FST_CAL_LIST_QTY               -- �ײ�������
            --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������
            --,CONT_LIST_QTY                  -- �Ӵ�������
            --,REJ_LIST_QTY                   -- �ܾ�������
            ,OLINE_SMIT_QTY                 -- �����ύ����
            ,OLINE_SMIT_PRM                 -- �����ύ����
            ,OLINE_TRAN_QTY                 -- ���ϳɽ�����
            ,OLINE_TRAN_PRM                 -- ���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���
            --,LAND_SUCC_QTY                  -- ��سɹ���
            --,LAND_SUCC_PRM                  -- ��سɹ�����
            )
   SELECT  V_DATE                         AS CAL_WEEK_ID,
       TT.PAY_TYP                             AS PAY_MODE,
       TT.OB_COM_NAME                         AS ACTV_ID,--�ID
       TT.BATCH_NAME                          AS BAT_CODE, ---���α���
       TT.COM_TYPE                            AS COM_TYP,--�������ࣨ�¶������������н飩
       TT.PRJ_ID                              AS BAT_PRJT,--������Ŀ
       TT.COMPANY_ID                          AS COMP_ID,--�ֹ�˾
       TT.BELONGCITY                          AS CITY_ID,--��������
       TT.ORG_ID                              AS ORG_ID,--����
       NVL(TT.WORKPLACE_ID, '-1')             AS WP_ID,--ְ��ID
       TT.PRJT_MGR_ID                         AS PRJT_MGR_ID,--��Ŀ������
       TT.TEM_LEAD_ID                         AS TEM_LEAD_ID,  ---�Ŷӳ����
       TT.USER_ID                             AS USER_ID,  --��ϯ
       COUNT(DISTINCT CASE WHEN  TT.STATUS_ID ='7'AND TT.TYPE_ID='5' THEN  TT.APPNO ELSE NULL END )   AS OLINE_SMIT_QTY,--�����ύ����
       SUM(CASE WHEN TT.STATUS_ID ='7'AND TT.TYPE_ID='5' THEN
                    (CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                          WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                          WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                          ELSE TT.TOTAL_FEE END)
                ELSE 0 END)       AS OLINE_SMIT_PRM,--�����ύ����
       COUNT(DISTINCT CASE WHEN TT.STATUS_ID ='12'AND TT.TYPE_ID='7' THEN  TT.APPNO ELSE NULL END ) AS OLINE_TRAN_QTY,--���ϳɽ�����
       SUM(CASE WHEN TT.STATUS_ID ='12'AND TT.TYPE_ID='7' THEN
                    (CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                          WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                          WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                          ELSE TT.TOTAL_FEE END
                          )
                ELSE 0 END)              AS OLINE_TRAN_PRM --���ϳɽ�����
        FROM  ( SELECT DISTINCT
                 T2.OB_COM_NAME,
                 T3.BATCH_NAME,
                 T3.COM_TYPE ,
                 T2.PRJ_ID ,
                 T2.COMPANY_ID,
                 T3.BELONGCITY,
                 T6.ORG_ID,
                 T6.ORG_ID AS PRJT_MGR_ID,
                 T6.ORG_ID AS TEM_LEAD_ID,
                 T1.USER_ID ,
                 T1.STATUS_ID,
                 T1.TYPE_ID,
                 T5.PAY_TYP,
                 T4.APPNO,
                 T6.WORKPLACE_ID,
                 T4.TOTAL_FEE

        FROM  TB_TASK_ALL    T1,
              TB_OB_COM      T2,
              TB_SALE_BATCH  T3,
              C_USER         T6,
              TB_APPLICATION    T4,--Ͷ����������Ϣ��
              TB_APP_PRD_INFO   T5--Ͷ������Ʒ��
         WHERE T1.OB_COM_ID=T2.OB_COM_ID
           AND T1.BATCH_ID=T3.BATCH_ID
           AND T1.USER_ID=T6.USERID
           --AND T1.ORG_ID=T6.ORG_ID
           AND T1.TASK_ID=T4.TASK_ID
           AND T1.POLICY_ID=T4.APPNO--Ͷ����ID
           AND T4.APPLICATION_ID=T5.APPLICATION_ID
           AND T1.CHANGE_TIME >= V_BEG_DATE 
           AND T1.CHANGE_TIME <= V_END_DATE
           )TT
  GROUP BY
       V_DATE
       ,TT.PAY_TYP
       ,TT.OB_COM_NAME
       ,TT.BATCH_NAME
       ,TT.COM_TYPE
       ,TT.PRJ_ID
       ,TT.COMPANY_ID
       ,TT.BELONGCITY
       ,TT.ORG_ID
       ,NVL(TT.WORKPLACE_ID, '-1')
       ,TT.PRJT_MGR_ID
       ,TT.TEM_LEAD_ID
       ,TT.USER_ID
             ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
             -------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '�������ڿۿ�ɹ�������������,�껯�±���ʵ���±� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
  --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_WEK
         (  CAL_WEEK_ID                     -- ͳ������
            ,PAY_MODE                       -- �ɷѷ�ʽ
            ,ACTV_ID                        -- �ID
            ,BAT_CODE                       -- ���δ���
            ,COM_TYP                        -- ��������
            ,BAT_PRJT                       -- ������Ŀ
            ,COMP_ID                        -- �ֹ�˾����
            ,CITY_ID                        -- ����ID
            ,ORG_ID                        -- ��֯�ܹ�����
            ,WP_ID                          -- ְ��ID
            ,PRJT_MGR_ID                    -- ��Ŀ����ID
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID
            ,USER_ID                        -- ��ϯID
            --,FST_CAL_LIST_QTY               -- �ײ�������
           --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������
           --,CONT_LIST_QTY                  -- �Ӵ�������
            --,REJ_LIST_QTY                   -- �ܾ�������
            --,OLINE_SMIT_QTY                 -- �����ύ����
            --,OLINE_SMIT_PRM                 -- �����ύ����
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����
            ,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            ,ANNUL_FST_PRM_PRM              -- �껯�±�����
            ,ACTL_FST_PRM_PRM               -- ʵ���±�����
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���
            --,LAND_SUCC_QTY                  -- ��سɹ���
            --,LAND_SUCC_PRM                  -- ��سɹ�����
            )
    SELECT V_DATE                     AS CAL_WEEK_ID,
           '-1'                           AS PAY_MODE,
           T4.OB_COM_NAME                 AS ACTV_ID, --�ID
           T2.BATCH_NAME                  AS BAT_CODE, ---���α���
           T2.COM_TYPE                    AS COM_TYP, --�������ࣨ�¶������������н飩
           T4.PRJ_ID                      AS BAT_PRJT, --������Ŀ
           T4.COMPANY_ID                  AS COMP_ID, --�ֹ�
           T2.BELONGCITY                  AS CITY_ID, --��������
           T5.ORG_ID                      AS ORG_ID, --����
           NVL(T5.WORKPLACE_ID, '-1')     AS WP_ID, --ְ��ID
           T5.ORG_ID                      AS PRJT_MGR_ID, --��Ŀ������
           T5.ORG_ID                      AS TEM_LEAD_ID, ---�Ŷӳ����
           T3.USER_ID                     AS USER_ID, --��ϯ����
           COUNT(DISTINCT CASE WHEN Z.PCODE ='2'THEN Z.POLICYNO ELSE NULL END)    AS  FST_CHARGBK_SUCC_QTY,--�ۿ��
           SUM(NVL((CASE
             WHEN Z.PCODE = '2' AND
                  Z.YEARNO = 1 AND
                  Z.PAYCODE = '10' THEN
              T1.NPAYLEN * T1.PIECES * 12
             WHEN Z.PCODE = '2' AND
                  PAYCODE = '11' THEN
              T1.NPAYLEN * T1.PIECES * 4
             WHEN Z.PCODE = '2' AND
                  Z.PAYCODE = '12' THEN
              T1.NPAYLEN * T1.PIECES * 2
             WHEN Z.PCODE = '2' AND
                  Z.PAYCODE = '13' THEN
             T1.NPAYLEN * T1.PIECES * 1
             ELSE
              0 END), 0)) +
               SUM(NVL((CASE
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '10' THEN
                  T1.NPAYLEN * T1.PIECES * -12
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '11' THEN
                  T1.NPAYLEN * T1.PIECES * -4
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '12' THEN
                  T1.NPAYLEN * T1.PIECES * -2
                 WHEN Z.PCODE = '8' AND
                      Z.YEARNO = 1 AND
                      Z.PAYCODE = '13' THEN
                  T1.NPAYLEN * T1.PIECES * -1
                 ELSE
                  0 END),0)) AS NNUL_FST_PRM_PRM,         --�껯�±�����
                  SUM( NVL((CASE WHEN Z.PCODE = '2' AND Z.YEARNO = 1
                     THEN Z.AMOUNT
                     ELSE 0
                     END),0)) + SUM(DISTINCT NVL(
                (CASE WHEN Z.PCODE = '8' AND Z.YEARNO = 1
                        THEN Z.AMOUNT
                        ELSE 0
                        END),0)) + SUM(DISTINCT NVL(
                (CASE WHEN Z.PCODE NOT IN ('8', '2') AND Z.YEARNO = 1
                      THEN Z.AMOUNT               --�޸Ľ�תȡֵ����
                      ELSE 0
                      END),0))  AS ACTL_FST_PRM_PRM          --ʵ���±�����
      FROM PREREC  Z, --����ʵ�ձ�
           RISKCON T1,--���˱�����
           TB_SALE_BATCH   T2,
           TB_TASK         T3,
           TB_OB_COM       T4,
           C_USER          T5
     WHERE Z.POLICYNO = T1.POLICYNO
       AND Z.CLASSCODE = T1.CLASSCODE
       AND T1.APPNO=T3.POLICY_ID
       AND T2.BATCH_ID=T3.BATCH_ID
       AND T4.OB_COM_ID=T3.OB_COM_ID
       AND T3.USER_ID=T5.USERID
      -- AND T3.ORG_ID=T5.ORG_ID
       AND Z.PCODE NOT IN ('Z', 'X', 'Y', '6', 'M')
       AND Z.SETCODE <> '9'
       AND T1.SALEATTR IN ('61', '62', '63', '64')--���������������ܹ�˾���ֹ�˾
       AND Z.YEARNO = 1--�����
       AND Z.PCODE IN('2','8')--�շ�\�˷�
       AND Z.PAYDATE>= TO_DATE(TO_CHAR(V_BEG_DATE,'YYYYMMDD'),'YYYY-MM-DD') 
       AND Z.PAYDATE <= TO_DATE(TO_CHAR(V_END_DATE,'YYYYMMDD'),'YYYY-MM-DD')
   GROUP BY
          V_DATE
           ,'-1'
           ,T4.OB_COM_NAME
           ,T2.BATCH_NAME
           ,T2.COM_TYPE
           ,T4.PRJ_ID
           ,T4.COMPANY_ID
           ,T2.BELONGCITY
           ,T5.ORG_ID
           ,T5.WORKPLACE_ID
           ,T5.ORG_ID
           ,T5.ORG_ID
           ,T3.USER_ID
         ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;


   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '��ԥ���˱����������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
  --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_WEK
         (  CAL_WEEK_ID                     -- ͳ������
            ,PAY_MODE                       -- �ɷѷ�ʽ
            ,ACTV_ID                        -- �ID
            ,BAT_CODE                       -- ���δ���
            ,COM_TYP                        -- ��������
            ,BAT_PRJT                       -- ������Ŀ
            ,COMP_ID                        -- �ֹ�˾����
            ,CITY_ID                        -- ����ID
            ,ORG_ID                        -- ��֯�ܹ�����
            ,WP_ID                          -- ְ��ID
            ,PRJT_MGR_ID                    -- ��Ŀ����ID
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID
            ,USER_ID                        -- ��ϯID
            --,FST_CAL_LIST_QTY               -- �ײ�������
           --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������
           --,CONT_LIST_QTY                  -- �Ӵ�������
            --,REJ_LIST_QTY                   -- �ܾ�������
            --,OLINE_SMIT_QTY                 -- �����ύ����
            --,OLINE_SMIT_PRM                 -- �����ύ����
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����
            ,CNCL_QTY                       -- ��ԥ���˱�����
            ,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���
            --,LAND_SUCC_QTY                  -- ��سɹ���
            --,LAND_SUCC_PRM                  -- ��سɹ�����
            )
    SELECT  V_DATE                     AS CAL_WEEK_ID,
           Z.PAYCODE                       AS PAY_MODE,
           T4.OB_COM_NAME                  AS ACTV_ID, --�ID
           T2.BATCH_NAME                   AS BAT_CODE,   ---���α���
           T2.COM_TYPE                     AS COM_TYP,--�������ࣨ�¶������������н飩
           T4.PRJ_ID                       AS BAT_PRJT,--������Ŀ
           T4.COMPANY_ID                   AS COMP_ID,--�ֹ�˾
           T2.BELONGCITY                   AS CITY_ID,--��������
           T5.ORG_ID                       AS ORG_ID,--����
           NVL(T5.WORKPLACE_ID, '-1')      AS WP_ID,--ְ��ID
           T5.ORG_ID                       AS PRJT_MGR_ID,--��Ŀ������
           T5.ORG_ID                       AS TEM_LEAD_ID,  ---�Ŷӳ����
           T3.USER_ID                      AS USER_ID, --��ϯ����
        COUNT(DISTINCT(CASE  WHEN Z.PCODE = '8' AND Z.YEARNO = 1
                             THEN Z.POLICYNO
                             END)) * 1     AS CNCL_QTY,
                   --���˱���
                   SUM(DISTINCT NVL((CASE
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '10' THEN
                                T1.NPAYLEN * T1.PIECES * 12
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '11' THEN
                                T1.NPAYLEN * T1.PIECES * 4
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '12' THEN
                                T1.NPAYLEN * T1.PIECES * 2
                               WHEN Z.PCODE = '8' AND
                                    Z.YEARNO = 1 AND
                                    Z.PAYCODE = '13' THEN
                                T1.NPAYLEN * T1.PIECES * 1
                               ELSE
                                0
                           END),
                                     0))    AS CNCL_PRM
            FROM PREREC  Z  INNER JOIN RISKCON T1 ON Z.POLICYNO = T1.POLICYNO
                 INNER JOIN TB_TASK  T3 ON T1.APPNO=T3.POLICY_ID
                 INNER JOIN TB_SALE_BATCH  T2 ON T2.BATCH_ID=T3.BATCH_ID
                 INNER JOIN TB_OB_COM  T4 ON T4.OB_COM_ID=T3.OB_COM_ID
                 INNER JOIN C_USER T5  ON T3.USER_ID = T5.USERID --AND T3.ORG_ID = T5.ORG_ID
           WHERE Z.PCODE NOT IN ('Z', 'X', 'Y', '6', 'M')
             AND Z.PCODE = '8'
             AND Z.SETCODE <> '9'
             AND T1.SALEATTR IN ('61', '62', '63', '64')--���������������ܹ�˾���ֹ�˾
            -- AND Z.DEPTCODE IS NOT NULL
             AND Z.PAYDATE>= TO_DATE(TO_CHAR(V_BEG_DATE,'YYYYMMDD'),'YYYY-MM-DD') 
             AND Z.PAYDATE <= TO_DATE(TO_CHAR(V_END_DATE,'YYYYMMDD'),'YYYY-MM-DD')
        GROUP BY
           V_DATE
           ,Z.PAYCODE
           ,T4.OB_COM_NAME
           ,T2.BATCH_NAME
           ,T2.COM_TYPE
           ,T4.PRJ_ID
           ,T4.COMPANY_ID
           ,T2.BELONGCITY
           ,T5.ORG_ID
           ,T5.WORKPLACE_ID
           ,T5.ORG_ID
           ,T5.ORG_ID
           ,T3.USER_ID
                  ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;


   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
    --------------------------------------------------------------------------------------------------------------------------------------
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '������سɹ����������� ָ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );

  V_ROW_NUM := 0;
  --�����������׼����ʱ��
   INSERT /*+ APPEND*/INTO TEMP_SALES_RPT_WEK
         (  CAL_WEEK_ID                     -- ͳ������
            ,PAY_MODE                       -- �ɷѷ�ʽ
            ,ACTV_ID                        -- �ID
            ,BAT_CODE                       -- ���δ���
            ,COM_TYP                        -- ��������
            ,BAT_PRJT                       -- ������Ŀ
            ,COMP_ID                        -- �ֹ�˾����
            ,CITY_ID                        -- ����ID
            ,ORG_ID                        -- ��֯�ܹ�����
            ,WP_ID                          -- ְ��ID
            ,PRJT_MGR_ID                    -- ��Ŀ����ID
            ,TEM_LEAD_ID                    -- �Ŷӳ�ID
            ,USER_ID                        -- ��ϯID
            --,FST_CAL_LIST_QTY               -- �ײ�������
           --,FST_CAL_CONT_LIST_QTY          -- �ײ��Ӵ�������
            --,TRK_LIST_QTY                   -- ����������
           --,CONT_LIST_QTY                  -- �Ӵ�������
            --,REJ_LIST_QTY                   -- �ܾ�������
            --,OLINE_SMIT_QTY                 -- �����ύ����
            --,OLINE_SMIT_PRM                 -- �����ύ����
            --,OLINE_TRAN_QTY                 -- ���ϳɽ�����
            --,OLINE_TRAN_PRM                 -- ���ϳɽ�����
            --,FST_CHARGBK_SUCC_QTY           -- ���ڿۿ�ɹ���
            --,ANNUL_FST_PRM_PRM              -- �껯�±�����
            --,ACTL_FST_PRM_PRM               -- ʵ���±�����
            --,CNCL_QTY                       -- ��ԥ���˱�����
            --,CNCL_PRM                       -- ��ԥ���˱�����
            --,POPULATION_TSMP                -- ����ʱ���
            ,LAND_SUCC_QTY                  -- ��سɹ���
            ,LAND_SUCC_PRM                  -- ��سɹ�����
            )
             SELECT  V_DATE                     AS CAL_WEEK_ID,
             TT.PAY_TYP                             AS PAY_MODE,
             TT.OB_COM_NAME                         AS ACTV_ID,--�ID
             TT.BATCH_NAME                          AS BAT_ID, ---���α���
             TT.COM_TYPE                            AS COM_TYP,--�������ࣨ�¶������������н飩
             TT.PRJ_ID                              AS BAT_PRJT,--������Ŀ
             TT.COMPANY_ID                          AS COMP_ID,--�ֹ�˾
             TT.BELONGCITY                          AS CITY_ID,--��������
             TT.ORG_ID                              AS ORG_TYP,--����
             NVL(TT.WORKPLACE_ID, '-1')             AS WP_ID,--ְ��ID
             TT.PRJT_MGR_ID                         AS PRJT_MGR_ID,--��Ŀ������
             TT.TEM_LEAD_ID                         AS TEM_LEAD_ID,  ---�Ŷӳ����
             TT.USER_ID                             AS USER_ID,  --��ϯ
             COUNT(DISTINCT TT.APPNO)               AS LAND_SUCC_QTY,--��سɹ���
             SUM(CASE WHEN TT.PAY_TYP='10' THEN TT.TOTAL_FEE/2*12
                      WHEN TT.PAY_TYP='11' THEN TT.TOTAL_FEE*4
                      WHEN TT.PAY_TYP='12' THEN TT.TOTAL_FEE*2
                      ELSE TT.TOTAL_FEE END)        AS LAND_SUCC_PRM--��سɹ�����
      FROM  ( SELECT DISTINCT
               T2.OB_COM_NAME,
               T3.BATCH_NAME,
               T3.COM_TYPE ,
               T2.PRJ_ID ,
               T2.COMPANY_ID,
               T3.BELONGCITY,
               T6.ORG_ID,
               T6.ORG_ID AS PRJT_MGR_ID,
               T6.ORG_ID AS TEM_LEAD_ID,
               T1.USER_ID ,
               T1.STATUS_ID,
               T1.TYPE_ID,
               T5.PAY_TYP,
               T4.APPNO,
               T6.WORKPLACE_ID,
               T4.TOTAL_FEE
      FROM  TB_TASK_ALL    T1,
            TB_OB_COM      T2,
            TB_SALE_BATCH  T3,
            C_USER         T6,
            TB_APPLICATION    T4,--Ͷ����������Ϣ��
            TB_APP_PRD_INFO   T5,--Ͷ������Ʒ��
            TB_LOG T7
       WHERE T1.OB_COM_ID=T2.OB_COM_ID
         AND T1.BATCH_ID=T3.BATCH_ID
         AND T1.USER_ID=T6.USERID
        -- AND T1.ORG_ID=T6.ORG_ID
         AND T1.TASK_ID=T4.TASK_ID
         AND T1.POLICY_ID=T4.APPNO--Ͷ����ID
         AND T4.APPLICATION_ID=T5.APPLICATION_ID
         AND T7.IDOBJ=T4.APPLICATION_ID
         AND T4.IACCEPT='1'--�����ɹ����״̬
         AND T1.STATUS_ID ='12'
         AND T1.TYPE_ID ='7'
         AND T7.TTIME >= V_BEG_DATE
         AND T7.TTIME <= V_END_DATE
                 )TT
        GROUP BY
             V_DATE,
             TT.PAY_TYP,
             TT.OB_COM_NAME,--�ID
             TT.BATCH_NAME, ---���α���
             TT.PRJ_ID,--������Ŀ
             TT.COM_TYPE,--�������ࣨ�¶������������н飩
             TT.COMPANY_ID,--�ֹ�˾
             TT.BELONGCITY,--��������
             TT.ORG_ID,--����
             TT.WORKPLACE_ID,--ְ��ID
             TT.PRJT_MGR_ID,--��Ŀ������
             TT.TEM_LEAD_ID,  ---�Ŷӳ����
             TT.USER_ID ;
   V_ROW_NUM := V_ROW_NUM + SQL%ROWCOUNT;
   COMMIT;


   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
    --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '��ʱ�����ݲ�����ʵ��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
   --�����������׼����ʱ��
         INSERT INTO TA_SALES_RPT_WEK
              (CAL_WEEK_ID
              ,PAY_MODE
              ,ACTV_ID
              ,BAT_CODE
              ,COM_TYP
              ,BAT_PRJT
              ,COMP_ID
              ,CITY_ID
              ,CTR_CODE
              ,SALES_PRJT
              ,TEM_CODE
              ,WP_ID
              ,PRJT_MGR_ID
              ,TEM_LEAD_ID
              ,USER_ID
              ,FST_CAL_LIST_QTY
              ,FST_CAL_CONT_LIST_QTY
              ,TRK_LIST_QTY
              ,CONT_LIST_QTY
              ,REJ_LIST_QTY
              ,OLINE_SMIT_QTY
              ,OLINE_SMIT_PRM
              ,OLINE_TRAN_QTY
              ,OLINE_TRAN_PRM
              ,LAND_SUCC_QTY
              ,LAND_SUCC_PRM
              ,FST_CHARGBK_SUCC_QTY
              ,ANNUL_FST_PRM_PRM
              ,ACTL_FST_PRM_PRM
              ,CNCL_QTY
              ,CNCL_PRM)
        SELECT   TT.CAL_WEEK_ID                  AS CAL_WEEK_ID
                ,TT.PAY_MODE                    AS  PAY_MODE
                ,TT.ACTV_ID                     AS  ACTV_ID
                ,TT.BAT_CODE                    AS  BAT_CODE
                ,TT.COM_TYP                     AS  COM_TYP
                ,TT.BAT_PRJT                    AS  BAT_PRJT
                ,TT.COMP_ID                     AS  COMP_ID
                ,NVL(TT.CITY_ID,-1)             AS  CITY_ID
                ,Z.P_ORG_ID_LV2                 AS  CTR_CODE
                ,Z.P_ORG_ID_LV3                 AS  SALES_PRJT
                ,Z.P_ORG_ID_LV4                 AS  TEM_CODE
                ,NVL(TT.WP_ID,-1)               AS  WP_ID
                ,Z.PRJT_MGR_ID                  AS  PRJT_MGR_ID
                ,Z.TEM_LEAD_ID                  AS  TEM_LEAD_ID
                ,NVL(TT.USER_ID,'-1')           AS  USER_ID
                ,SUM(TT.FST_CAL_LIST_QTY)
                ,SUM(TT.FST_CAL_CONT_LIST_QTY)
                ,SUM(TT.TRK_LIST_QTY)
                ,SUM(TT.CONT_LIST_QTY)
                ,SUM(TT.REJ_LIST_QTY)
                ,SUM(TT.OLINE_SMIT_QTY)
                ,SUM(TT.OLINE_SMIT_PRM)
                ,SUM(TT.OLINE_TRAN_QTY)
                ,SUM(TT.OLINE_TRAN_PRM)
                ,SUM(TT.LAND_SUCC_QTY)
                ,SUM(TT.LAND_SUCC_PRM)
                ,SUM(TT.FST_CHARGBK_SUCC_QTY)
                ,SUM(TT.ANNUL_FST_PRM_PRM)
                ,SUM(TT.ACTL_FST_PRM_PRM)
                ,SUM(TT.CNCL_QTY)
                ,SUM(TT.CNCL_PRM)
       FROM TEMP_SALES_RPT_WEK TT,
                    ORGID_REF  Z
          WHERE TT.ORG_ID=Z.ORG_ID
          GROUP BY
           TT.CAL_WEEK_ID
          ,TT.PAY_MODE
          ,TT.ACTV_ID
          ,TT.BAT_CODE
          ,TT.COM_TYP
          ,TT.BAT_PRJT
          ,TT.COMP_ID
          ,TT.CITY_ID
          ,Z.P_ORG_ID_LV2
          ,Z.P_ORG_ID_LV3
          ,Z.P_ORG_ID_LV4
          ,TT.WP_ID
          ,Z.PRJT_MGR_ID
          ,Z.TEM_LEAD_ID
          ,TT.USER_ID  ;
   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );
   ERR_NUM                    := 0;
   ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;
END;
/

prompt
prompt Creating procedure SP_TRUNCATE_TABLE
prompt ====================================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.SP_TRUNCATE_TABLE(
       TABLE_NM         IN    VARCHAR2,
       ERR_NUM          OUT   NUMBER,
       ERR_MSG          OUT   VARCHAR2
)AS
  /*======================================================================================
    ��Ȩ��Ϣ����Ȩ����(c) 2012��neusoft
    �������ƣ�SP_TABLE_TRUNCATE
    ����˵�������ݴ�������ƣ�truncate ���ݱ�
    ���������
             TABLE_NM     ���ݱ�����
    ���������
             ERR_NUM      ִ�д������
             ERR_MSG      ������Ϣ

    ��    �ߣ�¬��ƽ
    �������ڣ�20120824
    �� �� �ţ�V1.0


    �޸���ʷ
    �汾    �޸�����            �޸���       �޸�˵��
    ---------------------------------------------------------------------------------------
    v1.0    20120812            ¬��ƽ       ��ʼ�汾

  ========================================================================================*/
  CURSOR_ID INTEGER;
BEGIN
  CURSOR_ID := DBMS_SQL.OPEN_CURSOR;
  DBMS_SQL.PARSE(CURSOR_ID, 'TRUNCATE TABLE ' || TABLE_NM, DBMS_SQL.V7);
  DBMS_SQL.CLOSE_CURSOR(CURSOR_ID);
  ERR_NUM := 0;

EXCEPTION
  WHEN OTHERS THEN
    DBMS_SQL.CLOSE_CURSOR(CURSOR_ID);
    ERR_NUM := 1;
    ERR_MSG := 'Truncate ' || TABLE_NM || '��ʧ��';
END;
/

prompt
prompt Creating procedure SP_V_TASK_H
prompt ==============================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.SP_V_TASK_H (
   I_DATE_DAY     IN       NUMBER
 --, I_END_DATE     IN       NUMBER
 , ERR_NUM        OUT      NUMBER
 , ERR_MSG        OUT      VARCHAR2
)
AS
   /**
     * ���������� ����������ʷ�켣��
     * ��������� I_DATE_DAY             ����ʱ��,�������Ϊ��,�׳��쳣
     * ��������� ERR_NUM                ���ִ���ʱ����ִ�д����
     * �������������ERR_MSG             ���ִ���ʱ���صĴ�����Ϣ
     * ��д��Ա�����ҷ�
     * �������ڣ�2012-07-26
     * ��˾���ƣ�
     **/
   V_DATE_DAY                    DATE := TO_DATE(I_DATE_DAY,'YYYYMMDD');             --����ʱ��
   V_DAY                         NUMBER := I_DATE_DAY;       --����ʱ��
   V_BEG_DATE                    DATE:=ADD_MONTHS(TO_DATE(TO_CHAR(I_DATE_DAY)||' 00:00:00','YYYY-MM-DD HH24:MI:SS'),-1);  --��ʼ����
   V_END_DATE                    DATE:=TO_DATE(TO_CHAR(I_DATE_DAY)||' 23:59:59','YYYY-MM-DD HH24:MI:SS');  --��������
   V_REPORT_ID                   NUMBER :=0;                       --�������
   V_PROC_NAME                   VARCHAR2 (50) := 'SP_V_TASK_H';--��ǰ��������
   V_STEP                        NUMBER := 0;            --ִ�в�����ų�ʼֵ
   V_STEP_NO                     VARCHAR2 (10);                    --ִ�в���
   V_STEP_DESC                   VARCHAR2 (200);                   --��������
   V_ROW_NUM                     NUMBER;                --SQLִ��Ӱ��ļ�¼��
   V_BEGIN_TIME                  DATE;                    --SQL��ʼִ�е�ʱ��
   V_END_TIME                    DATE;                      --SQLִ�н���ʱ��
BEGIN
   --���ڲ����Ƿ�Ϊ���ж�
   IF V_DATE_DAY IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'I_DATE_DAY IS NULL!');
   END IF;
/* IF V_END_DAY IS NULL
   THEN
      RAISE_APPLICATION_ERROR (-20001, 'I_END_DATE IS NULL!');
   END IF;*/

   --�����ʱ������
   EXECUTE IMMEDIATE 'TRUNCATE TABLE TB_TASK_ALL';
   --��¼��־��ʼ
   V_STEP                     := V_STEP + 1;
   V_STEP_NO                  := SF_CREATE_STEP (V_STEP);
   V_STEP_DESC                := '����������ʷ�켣��';
   V_BEGIN_TIME               := SYSDATE;
   SP_LOG_EXEC_BEF (V_PROC_NAME
                  , V_STEP_NO
                  , V_DAY
                  , V_STEP_DESC
                  , V_BEGIN_TIME
                  , V_REPORT_ID
                   );
   --�����������׼����ʱ��
   INSERT /*+ append */ INTO TB_TASK_ALL
             ( HISTORY_ID
              ,TASK_ID
              ,CREATE_TIME
              ,CHANGE_TIME
              ,CHANGE_TIME1
              ,FIRST_RESULT
              ,SECOND_RESULT
              ,USER_ID
              ,ORG_ID
              ,STATUS_ID
              ,TYPE_ID
              ,POLICY_ID
              ,OB_COM_ID
              ,BATCH_ID
              ,CUS_LIST_ID
              ,CREATE_HISTORY_DATE
              ,CREATE_HISTORY_DATE1
              ,STATUS_ID2
              ,TYPE_ID2
              ,CREATE_HISTORY_DATE2
             )
          --������ϸ���ɺ���ʷ����
          SELECT 
              TT.HISTORY_ID
              ,TT.TASK_ID
              ,TT.CREATE_TIME
              ,TT.CHANGE_TIME
              ,TT.CHANGE_TIME1
              ,TT.FIRST_RESULT
              ,TT.SECOND_RESULT
              ,TT.USER_ID
              ,TT.ORG_ID
              ,TT.STATUS_ID
              ,TT.TYPE_ID
              ,TT.POLICY_ID
              ,TT.OB_COM_ID
              ,TT.BATCH_ID
              ,TT.CUS_LIST_ID
              ,TT.CREATE_HISTORY_DATE
              ,TT.CREATE_HISTORY_DATE1
              ,TT.STATUS_ID2
              ,TT.TYPE_ID2
              ,TT.CREATE_HISTORY_DATE2
          FROM (
          SELECT A.*,
          NVL((lag(A.status_id,1) over (partition by A.task_id order by A.create_history_date)),9999) status_id2 ,
          NVL((lag(A.TYPE_ID,1) over (partition by A.task_id order by A.create_history_date)),9999) TYPE_ID2,
          NVL((lag(A.create_history_date1,1) over (partition by A.task_id order by A.create_history_date)),29991231) create_history_date2
          FROM
          (
          SELECT
              -1                       AS HISTORY_ID
              ,T1.TASK_ID              AS TASK_ID
              ,T1.CREATE_TIME          AS CREATE_TIME
              ,T1.CHANGE_TIME          AS CHANGE_TIME
              ,TO_NUMBER(TO_CHAR(T1.CHANGE_TIME,'YYYYMMDD'))          AS CHANGE_TIME1
              ,T1.FIRST_RESULT         AS FIRST_RESULT
              ,T1.SECOND_RESULT        AS SECOND_RESULT
              ,T1.USER_ID              AS USER_ID
              ,T1.ORG_ID               AS ORG_ID
              ,T1.STATUS_ID            AS STATUS_ID
              ,T1.TYPE_ID              AS TYPE_ID
              ,T1.POLICY_ID            AS POLICY_ID
              ,T1.OB_COM_ID            AS OB_COM_ID
              ,T1.BATCH_ID             AS BATCH_ID
              ,T1.CUS_LIST_ID          AS CUS_LIST_ID
              ,DATE'2999-12-31'        AS CREATE_HISTORY_DATE
              ,29991231                AS CREATE_HISTORY_DATE1
          FROM TB_TASK T1
          UNION ALL
          SELECT
              T2.HISTORY_ID            AS HISTORY_ID
              ,T2.TASK_ID              AS TASK_ID
              ,T2.CREATE_TIME          AS CREATE_TIME
              ,T2.CHANGE_TIME          AS CHANGE_TIME
              ,TO_NUMBER(TO_CHAR(T2.CHANGE_TIME,'YYYYMMDD')) AS CHANGE_TIME1
              ,T2.FIRST_RESULT         AS FIRST_RESULT
              ,T2.SECOND_RESULT        AS SECOND_RESULT
              ,T2.USER_ID              AS USER_ID
              ,T2.ORG_ID               AS ORG_ID
              ,T2.STATUS_ID            AS STATUS_ID
              ,T2.TYPE_ID              AS TYPE_ID
              ,T2.POLICY_ID            AS POLICY_ID
              ,T2.OB_COM_ID            AS OB_COM_ID
              ,T2.BATCH_ID             AS BATCH_ID
              ,T2.CUS_LIST_ID          AS CUS_LIST_ID
              ,T2.CREATE_HISTORY_DATE        AS CREATE_HISTORY_DATE
              ,TO_NUMBER(TO_CHAR(T2.CREATE_HISTORY_DATE,'YYYYMMDD'))        AS CREATE_HISTORY_DATE1
          FROM TB_TASK_HISTORY T2
          ) A ) TT
          WHERE TT.CHANGE_TIME >= V_BEG_DATE AND TT.CHANGE_TIME <= V_END_DATE;
   V_ROW_NUM   := SQL%ROWCOUNT;
   COMMIT;

   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );



   --��¼��־����
   SP_LOG_EXEC_AFT (V_PROC_NAME
                  , V_STEP_NO
                  , V_ROW_NUM
                  , V_BEGIN_TIME
                   );

   ERR_NUM                    := 0;
   ERR_MSG                    := 'NORMAL, SUCCESSFUL COMPLETION';
EXCEPTION
   WHEN OTHERS
   THEN
      ERR_NUM                    := SQLCODE;
      ERR_MSG                    := TRIM (SQLERRM);
      V_END_TIME                 := SYSDATE;

      IF V_STEP_NO IS NULL
      THEN
         INSERT INTO LOG_TRACE_STAT
                     (PROC_NAME
                    , STEP_NO
                    , BEGIN_TIME
                    , END_TIME
                    , WORK_DATE
                    , STEP_DESC
                    , ELAPSED
                    , REPORT_ID
                    , SQL_CODE
                    , SQL_ERRM
                     )
              VALUES (V_PROC_NAME
                    , V_STEP_NO
                    , V_BEGIN_TIME
                    , V_END_TIME
                    , V_DAY
                    , V_STEP_DESC
                    , ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
                    , V_REPORT_ID
                    , ERR_NUM
                    , ERR_MSG
                     );
      ELSE
         UPDATE LOG_TRACE_STAT
            SET END_TIME = V_END_TIME
              , ELAPSED = ROUND ((V_END_TIME - V_BEGIN_TIME) * 24 * 60 * 60)
              , SQL_CODE = ERR_NUM
              , SQL_ERRM = ERR_MSG
          WHERE PROC_NAME = V_PROC_NAME
            AND STEP_NO = V_STEP_NO
            AND WORK_DATE = V_DAY
            AND BEGIN_TIME = V_BEGIN_TIME
            AND REPORT_ID = V_REPORT_ID;
      END IF;

      COMMIT;
END;
/

prompt
prompt Creating procedure TEST1
prompt ========================
prompt
create or replace procedure sxdxsj.test1(
       i_task_id in number,
       i_detail_id in number,
       o_ret_code out number
)
as
begin
   o_ret_code:=1;
   insert into log_information(command_name,command_type,start_time,end_time,add_number,condition_id)
   values('��log�����һ������','����',systimestamp,systimestamp,1,i_task_id);
   --��������ϸ��״̬
   update task_detail
   set completed=1,
   success_number=1,
   begin_time=systimestamp,
   end_time=systimestamp
   where task_id=i_task_id and detail_id=i_detail_id;
   commit;
end;
/

prompt
prompt Creating procedure TESTEXPPROC
prompt ==============================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.testExpProc
(
       vid in number,
       vname in varchar2,
       vage in number
)
as
 v_sql varchar2(8000);
 v_sysdate date;
 v_errcode   number;
 v_errmsg    varchar2(100);
begin
       insert into t_test_b values(vid,vname,vage);
       insert into t_test values(vid,vname,vage);
end;
/

prompt
prompt Creating procedure TESTPROC
prompt ===========================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.testProc
(
       o_dt out sys_refcursor
)
as
begin
  open o_dt for
  select c.customer_id as userId ,c.customer_name as userName ,c.city as address from customer c where rownum<10;
end;
/

prompt
prompt Creating procedure TEST_CL
prompt ==========================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.test_cl
as
begin
    PROC_PREINS_REPEAT();
     insert into log_information(command_name, command_type,start_time)
  VALUES('1', '���� PROC_PREINS_REPEAT �ɹ�', sysdate);
commit;
    proc_preins_cus_location();
     insert into log_information(command_name, command_type,start_time)
 VALUES('2', '���� proc_preins_cus_location �ɹ�', sysdate);
commit;
    proc_preins_batch_handle();
     insert into log_information(command_name, command_type,start_time)
 VALUES('3', '���� proc_preins_batch_handle �ɹ�', sysdate);
commit;
    proc_preins_bar_tag();
     insert into log_information(command_name, command_type,start_time)
  VALUES('4', '���� proc_preins_bar_tag�ɹ�', sysdate);
commit;
end;
/

prompt
prompt Creating procedure TEST_GETDATA
prompt ===============================
prompt
CREATE OR REPLACE PROCEDURE SXDXSJ.test_getData
(
  i_task_id in number
) as
v_lastCondition varchar2(500);
v_condition varchar2(2000);
v_preCondition varchar2(500);
begin
    select task_condition into v_condition from tasks where id=i_task_id;
    dbms_output.PUT_LINE(v_condition);
    dbms_output.PUT_LINE(instr(v_condition,'and rownom',1,1));
    select substr(v_condition,instr(v_condition,'and rownom',1,1)) into v_lastCondition from dual;
    select substr(v_condition,0,instr(v_condition,'and rownom',1,1)-1) into v_preCondition from dual;
    dbms_output.PUT_LINE(v_lastCondition);
    dbms_output.PUT_LINE(v_preCondition);
end;
/

prompt
prompt Creating procedure TEST_MQ
prompt ==========================
prompt
create or replace procedure sxdxsj.test_mq  is
begin 
  declare 
  v_sql varchar2(18000);
  v_update varchar2(1800);
begin
  v_sql :='select * from customer';
  v_update :='select * from f_tasks ';
    dbms_output.put_line(v_sql);
  execute immediate v_sql;
  execute immediate v_update;

  end;
end test_mq;
/

prompt
prompt Creating procedure UNICALL_EVERY_MONTH_5TH
prompt ==========================================
prompt
create or replace procedure sxdxsj.UNICALL_EVERY_MONTH_5TH
is
begin
  insert into USABLE_SHCPIC_PREINS_CUS_HIS select * from usable_shcpic_preins_cus_inf where (sysdate - interval '3' month)-USABLE_DATE>0;
  delete from (select * from USABLE_SHCPIC_PREINS_CUS_INF where (sysdate - interval '3' month)-USABLE_DATE>0);
  update USABLE_SHCPIC_PREINS_CUS_INF set USABLE_STATUS = 1;
commit;
end;
/


spool off
