CREATE TABLE `board` (
	`b_no`	INTEGER	NOT null,
	`b_title`	VARCHAR(500)	NOT NULL,
	`b_content`	TEXT	NOT NULL,
	`b_hitcount`	INTEGER	NOT NULL	DEFAULT 0,
	`b_regdate`	DATETIME	NOT NULL	DEFAULT NOW(),
	`b_noticeYN`	BOOLEAN	NOT NULL	DEFAULT FALSE,
	`b_delYN`	BOOLEAN	NOT NULL	DEFAULT FALSE,
	`b_deldate`	DATETIME	NULL,
	`m_id`	VARCHAR(255)	NOT null DEFAULT 'ROLE_USER'
);

CREATE TABLE `file` (
	`f_no`	INTEGER	NOT null,
	`f_orgname`	VARCHAR(255)	NOT NULL,
	`f_sysname`	VARCHAR(255)	NOT NULL,
	`f_size`	BIGINT	NOT NULL,
	`b_no`	INTEGER NULL,
	`m_id`	VARCHAR(255)	NOT NULL
);

CREATE TABLE `reply` (
	`r_no`	INTEGER	NOT null,
	`r_content`	VARCHAR(255)	NOT NULL,
	`r_regdate`	DATETIME	NOT NULL	DEFAULT NOW(),
	`b_no`	INTEGER	NOT NULL,
	`m_id`	VARCHAR(255)	NOT NULL
);

CREATE TABLE `volunteer` (
	`v_no`	INTEGER	NOT null,
	`v_appcount`	INTEGER	NOT NULL	DEFAULT 0,
	`v_apptotal`	INTEGER	NOT NULL,
	`v_state`	VARCHAR(50)	NOT NULL
);

CREATE TABLE `volunteer_appl` (
	`app_no`	INTEGER	NOT NULL,
	`app_name`	VARCHAR(255)	NOT NULL,
	`app_place`	VARCHAR(255)	NOT NULL,
	`app_begintm`	DATETIME	NOT NULL,
	`app_endtm`	DATETIME	NOT NULL,
	`m_id`	VARCHAR(255)	NOT NULL
);

CREATE TABLE `black_list` (
	`bl_no`	INTEGER	NOT NULL,
	`bl_content`	VARCHAR(255)	NULL,
	`bl_regdate`	DATETIME	NULL	DEFAULT NOW(),
	`m_id`	VARCHAR(255)	NOT NULL
);

CREATE TABLE `member` (
	`m_id`	VARCHAR(255)	NOT NULL,
	`m_name`	VARCHAR(255)	NOT NULL,
	`m_gender`	VARCHAR(5)	NOT NULL,
	`m_birth`	DATETIME	NOT NULL,
	`m_pwd`	VARCHAR(255)	NOT NULL,
	`m_postcode`	INTEGER	NOT NULL,
	`m_addr1`	VARCHAR(255)	NOT NULL,
	`m_addr2`	VARCHAR(255)	NULL,
	`m_role`	VARCHAR(255)	NOT NULL
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`b_no`
);

ALTER TABLE `file` ADD CONSTRAINT `PK_FILE` PRIMARY KEY (
	`f_no`
);

ALTER TABLE `reply` ADD CONSTRAINT `PK_REPLY` PRIMARY KEY (
	`r_no`
);

ALTER TABLE `volunteer` ADD CONSTRAINT `PK_VOLUNTEER` PRIMARY KEY (
	`v_no`
);

ALTER TABLE `volunteer_appl` ADD CONSTRAINT `PK_VOLUNTEER_APPL` PRIMARY KEY (
	`app_no`
);

ALTER TABLE `black_list` ADD CONSTRAINT `PK_BLACK_LIST` PRIMARY KEY (
	`bl_no`
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`m_id`
);

ALTER TABLE `board` MODIFY `b_no` integer AUTO_INCREMENT;
ALTER TABLE `file` MODIFY `f_no` integer AUTO_INCREMENT;
ALTER TABLE `reply` MODIFY `r_no` integer AUTO_INCREMENT;
ALTER TABLE `black_list` MODIFY `bl_no` integer AUTO_INCREMENT;

INSERT INTO MEMBER (m_id, m_name, m_gender, m_birth, m_pwd, m_postcode, m_addr1, m_addr2, m_role)
		values('test@test.com','테스트','M','2000-01-01', '1111', '12345', '기이본 주소', '상세에 주소', 'ROLE_USER');
