CREATE VIEW v_exp_data AS
select customer_id,customer_name,0 id_type,birthday,gender_code,
marital_status,death_critical_illness,fax,family_zip_code,company_zip_code,
family_address,company_address,contact_address,company,job_name,email,
tel_code,zone_code,govern_id,city,policy_no,province,note,any_date,other_info_1,
other_info_2,other_info_3,other_info_5,other_info_4,is_accept_donation,
t.family_phone,t.office_phone,t.mobile_phone,t.charge_phone,t.other_phone,
bank_name,bank_account,'' class_name
 FROM temp_customer t;