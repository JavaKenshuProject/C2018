/* DB作成 */
DROP DATABASE IF EXISTS emp_sys_db;
CREATE DATABASE emp_sys_db CHARACTER SET utf8 COLLATE utf8_general_ci;
 
/* ユーザを作成 
CREATE USER trainee;

/* 権限付与 
GRANT ALL PRIVILEGES ON license_sys_db.* TO trainee IDENTIFIED BY 'password';

/* AUTOCOMMIT */
SET AUTOCOMMIT=1;

/* DB選択 */
USE emp_sys_db;





/* 所属マスタ作成 */
CREATE TABLE m_section
( 
	section_code   	VARCHAR(2) NOT NULL PRIMARY KEY,
	section_name 	VARCHAR(24) NOT NULL,
	update_date		TIMESTAMP NOT NULL
)ENGINE = INNODB;





/* 従業員マスタ作成 */
CREATE TABLE m_employee
( 
	emp_code       	VARCHAR(4) PRIMARY KEY NOT NULL,
	l_name			VARCHAR(16) NOT NULL,
	f_name			VARCHAR(16) NOT NULL,
	l_kana_name		VARCHAR(24),
	f_kana_name		VARCHAR(24),
	sex				TINYINT(1),
	birth_day		DATE,
	section_code	VARCHAR(2),
	emp_date		DATE,
	update_date		TIMESTAMP NOT NULL
)ENGINE = INNODB;
ALTER TABLE m_employee ADD FOREIGN KEY ( section_code ) REFERENCES m_section(section_code);





/* ユーザマスタ作成 */
CREATE TABLE m_user
( 
	user_id			VARCHAR(24) PRIMARY KEY NOT NULL,
	password		VARCHAR(32) NOT NULL,
	section_code   	VARCHAR(2),
	update_date 	TIMESTAMP NOT NULL
)ENGINE = INNODB;







/* 資格マスタ作成 */
CREATE TABLE m_license
( 
	license_code   VARCHAR(5) PRIMARY KEY NOT NULL,
	license_name VARCHAR(100)
)ENGINE = INNODB;








/* 資格取得テーブル作成 */
CREATE TABLE t_get_license
( 
	emp_code	VARCHAR(4) NOT NULL,
	license_code	VARCHAR(5) NOT NULL,
	get_license_date DATE,
	PRIMARY KEY(emp_code,license_code)
)ENGINE = INNODB;
ALTER TABLE t_get_license ADD FOREIGN KEY (emp_code) REFERENCES m_employee(emp_code);
ALTER TABLE t_get_license ADD FOREIGN KEY (license_code) REFERENCES m_license(license_code);





/* 資格取得テーブINSERT */
/*INSERT INTO t_get_license (emp_code,license_cd,get_license_date) VALUES('A001','L0101','2015-6-20');*/


/* 資格マスタINSERT */
INSERT INTO m_license VALUES('L0001','ITパスポート');
INSERT INTO m_license VALUES('L0101','基本情報');
INSERT INTO m_license VALUES('L0102','応用情報');
INSERT INTO m_license VALUES('L0301','Oracle Master Bronze');
INSERT INTO m_license VALUES('L0302','Oracle Master Silver');
INSERT INTO m_license VALUES('L0303','Oracle Master Gold');
INSERT INTO m_license VALUES('L0401','OCJ-P');
INSERT INTO m_license VALUES('L0402','OCJ-WS');
INSERT INTO m_license VALUES('L0501','OCUP-F');
INSERT INTO m_license VALUES('L0502','OCUP-I');
INSERT INTO m_license VALUES('L0503','OCUP-A');




/* 所属マスタINSERT */
INSERT INTO m_section (section_code,section_name) VALUES('01','経理部');
INSERT INTO m_section (section_code,section_name) VALUES('02','人事部');
INSERT INTO m_section (section_code,section_name) VALUES('03','営業部');
INSERT INTO m_section (section_code,section_name) VALUES('04','総務部');




/* 従業員マスタINSERT */
INSERT INTO m_employee(emp_code,l_name,f_name,l_kana_name,f_kana_name,sex,birth_day,section_code,emp_date) VALUES('S001','鴻上','一郎','コウガミ','イチロウ','0','1985-4-20','01','2003-4-01');
INSERT INTO m_employee(emp_code,l_name,f_name,l_kana_name,f_kana_name,sex,birth_day,section_code,emp_date) VALUES('S002','鴻上','二郎','コウガミ','ジロウ','0','1986-4-20','03','2004-4-01');
INSERT INTO m_employee(emp_code,l_name,f_name,l_kana_name,f_kana_name,sex,birth_day,section_code,emp_date) VALUES('S003','鴻上','三郎','コウガミ','サブロウ','0','1987-4-20','02','2005-4-01');
INSERT INTO m_employee(emp_code,l_name,f_name,l_kana_name,f_kana_name,sex,birth_day,section_code,emp_date) VALUES('S004','鴻上','花子','コウガミ','ハナコ','1','1987-4-20','04','2005-4-01');
INSERT INTO m_employee(emp_code,l_name,f_name,l_kana_name,f_kana_name,sex,birth_day,section_code,emp_date) VALUES('S005','鴻上','四郎','コウガミ','シロウ','0','1988-4-20','01','2006-4-01');
INSERT INTO m_employee(emp_code,l_name,f_name,l_kana_name,f_kana_name,sex,birth_day,section_code,emp_date) VALUES('S006','鴻上','五郎','コウガミ','ゴロウ','0','1989-4-20','02','2007-4-01');
INSERT INTO m_employee(emp_code,l_name,f_name,l_kana_name,f_kana_name,sex,birth_day,section_code,emp_date) VALUES('S007','鴻上','六郎','コウガミ','ロクロウ','0','1990-4-20','03','2008-4-01');
INSERT INTO m_employee(emp_code,l_name,f_name,l_kana_name,f_kana_name,sex,birth_day,section_code,emp_date) VALUES('S008','鴻上','七郎','コウガミ','ナナロウ','0','1991-4-20','04','2009-4-01');
INSERT INTO m_employee(emp_code,l_name,f_name,l_kana_name,f_kana_name,sex,birth_day,section_code,emp_date) VALUES('S009','鴻上','陽子','コウガミ','ヨウコ','1','1991-4-20','04','2009-4-01');
INSERT INTO m_employee(emp_code,l_name,f_name,l_kana_name,f_kana_name,sex,birth_day,section_code,emp_date) VALUES('S010','鴻上','八郎','コウガミ','ハチロウ','0','1992-4-20','02','2010-4-01');
INSERT INTO m_employee(emp_code,l_name,f_name,l_kana_name,f_kana_name,sex,birth_day,section_code,emp_date) VALUES('S011','鴻上','九郎','コウガミ','クロウ','0','1993-4-20','03','2011-4-01');
INSERT INTO m_employee(emp_code,l_name,f_name,l_kana_name,f_kana_name,sex,birth_day,section_code,emp_date) VALUES('S012','鴻上','十郎','コウガミ','ジュウロウ','0','1994-4-20','01','2012-4-01');
INSERT INTO m_employee(emp_code,l_name,f_name,l_kana_name,f_kana_name,sex,birth_day,section_code,emp_date) VALUES('S013','鴻上','淳子','コウガミ','ジュンコ','1','1994-4-20','01','2012-4-01');
INSERT INTO m_employee(emp_code,l_name,f_name,l_kana_name,f_kana_name,sex,birth_day,section_code,emp_date) VALUES('S014','鴻上','十一郎','コウガミ','ジュウイチロウ','0','1995-4-20','03','2013-4-01');
INSERT INTO m_employee(emp_code,l_name,f_name,l_kana_name,f_kana_name,sex,birth_day,section_code,emp_date) VALUES('S015','鴻上','十二郎','コウガミ','ジュウニロウ','0','1996-4-20','04','2014-4-01');
INSERT INTO m_employee(emp_code,l_name,f_name,l_kana_name,f_kana_name,sex,birth_day,section_code,emp_date) VALUES('S016','鴻上','十三郎','コウガミ','ジュウサンロウ','0','1997-4-20','02','2015-4-01');
INSERT INTO m_employee(emp_code,l_name,f_name,l_kana_name,f_kana_name,sex,birth_day,section_code,emp_date) VALUES('S017','鴻上','晶子','コウガミ','アキコ','1','1997-4-20','03','2015-4-01');
INSERT INTO m_employee(emp_code,l_name,f_name,l_kana_name,f_kana_name,sex,birth_day,section_code,emp_date) VALUES('S018','鴻上','十四郎','コウガミ','トウシロウ','0','1998-4-20','02','2016-4-01');
INSERT INTO m_employee(emp_code,l_name,f_name,l_kana_name,f_kana_name,sex,birth_day,section_code,emp_date) VALUES('S019','鴻上','十五郎','コウガミ','ジュウゴロウ','0','1999-4-20','01','2017-4-01');



/* 資格取得テーブINSERT */
INSERT INTO t_get_license (emp_code,license_code,get_license_date) VALUES('S001','L0001','1998-2-10');
INSERT INTO t_get_license (emp_code,license_code,get_license_date) VALUES('S003','L0101','2003-3-25');
INSERT INTO t_get_license (emp_code,license_code,get_license_date) VALUES('S006','L0301','2002-8-23');
INSERT INTO t_get_license (emp_code,license_code,get_license_date) VALUES('S009','L0303','2009-2-02');
INSERT INTO t_get_license (emp_code,license_code,get_license_date) VALUES('S010','L0102','2007-1-08');
INSERT INTO t_get_license (emp_code,license_code,get_license_date) VALUES('S013','L0503','2005-9-15');
INSERT INTO t_get_license (emp_code,license_code,get_license_date) VALUES('S016','L0401','2015-10-10');
INSERT INTO t_get_license (emp_code,license_code,get_license_date) VALUES('S018','L0402','2016-11-05');



/* ユーザーマスタINSERT */
INSERT INTO m_user VALUES('keiri','test','01',CURRENT_TIMESTAMP);
INSERT INTO m_user VALUES('jinji','test','02',CURRENT_TIMESTAMP);
INSERT INTO m_user VALUES('eigyo','test','03',CURRENT_TIMESTAMP);
INSERT INTO m_user VALUES('soumu','test','04',CURRENT_TIMESTAMP);
/*commit;*/
/*ROLLBACK;*/
