CREATE TABLE `cart` (
	`CartID` VARCHAR(20) NOT NULL COMMENT '일련번호' COLLATE 'utf8mb4_general_ci',
	`UserID` VARCHAR(20) NOT NULL COMMENT '제품번호' COLLATE 'utf8mb4_general_ci',
	`Vality` INT(11) NOT NULL DEFAULT '0' COMMENT '유용성(내역유효=1, 내역삭제=2)',
	`QUANTITY` INT(11) NOT NULL COMMENT '주문수량',
	`ProductID` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`CartID`) USING BTREE,
	INDEX `userID` (`UserID`) USING BTREE,
	INDEX `productID` (`ProductID`) USING BTREE,
	CONSTRAINT `productID` FOREIGN KEY (`ProductID`) REFERENCES `webdev`.`product` (`ProductID`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `userID` FOREIGN KEY (`UserID`) REFERENCES `webdev`.`tbl_member` (`userid`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
