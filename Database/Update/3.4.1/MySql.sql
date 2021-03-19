DELETE FROM `Language` WHERE `LanKey` = 'File' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('File','zh-CN','文件');