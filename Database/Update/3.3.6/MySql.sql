DROP TABLE IF EXISTS `DBVersion`;
CREATE TABLE `DBVersion` (
	`ID` INT AUTO_INCREMENT  NOT NULL,
	`Major` INT  NULL,
	`Minor` INT  NULL,
	`Revision` INT  NULL,
	`Build` INT  NULL,
	PRIMARY KEY (`ID`)
);

INSERT INTO `DBVersion` (`Major`,`Minor`,`Revision`,`Build`) values(3,3,6,0);

UPDATE `DataArchived` SET `ID`='Easy.Notification.SmtpSetting' WHERE `ID`='ZKEACMS.SMTP.SmtpSetting';