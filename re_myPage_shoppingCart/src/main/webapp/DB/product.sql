CREATE TABLE `product` (
	`ProductID` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Prname` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Price` INT(11) NOT NULL,
	PRIMARY KEY (`ProductID`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
