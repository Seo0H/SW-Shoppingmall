CREATE TABLE `tbl_member` (
	`userid` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`username` VARCHAR(200) NOT NULL COLLATE 'utf8mb4_general_ci',
	`password` VARCHAR(200) NOT NULL COLLATE 'utf8mb4_general_ci',
	`telno` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_general_ci',
	`email` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_general_ci',
	`regdate` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_general_ci',
	`lastlogindate` DATE NOT NULL,
	`age` VARCHAR(3) NOT NULL COLLATE 'utf8mb4_general_ci',
	`address` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_general_ci',
	`sex` VARCHAR(5) NOT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`userid`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
