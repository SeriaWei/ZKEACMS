DELETE FROM `Language` WHERE `LanKey` = '{{LanKey}}' AND `CultureName` = '{{Culture}}';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('{{LanKey}}','{{Culture}}','{{LanValue}}');