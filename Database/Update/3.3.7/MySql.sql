DELETE FROM `Language` WHERE `LanKey` = 'Captcha' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Captcha','zh-CN','验证码');

DELETE FROM `Language` WHERE `LanKey` = 'Required?' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Required?','zh-CN','必填？');

DELETE FROM `Language` WHERE `LanKey` = 'Required Message' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Required Message','zh-CN','必填项提示信息');

DELETE FROM `Language` WHERE `LanKey` = 'Form Control Size' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Form Control Size','zh-CN','输入框尺寸');

DELETE FROM `Language` WHERE `LanKey` = 'Small' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Small','zh-CN','小');

DELETE FROM `Language` WHERE `LanKey` = 'Medium' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Medium','zh-CN','中等');

DELETE FROM `Language` WHERE `LanKey` = 'Large' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Large','zh-CN','大');

DELETE FROM `Language` WHERE `LanKey` = 'Input option' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Input option','zh-CN','输入选项内容');

DELETE FROM `Language` WHERE `LanKey` = 'Placeholder' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Placeholder','zh-CN','占位文字');

DELETE FROM `Language` WHERE `LanKey` = 'Custom Validation' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Custom Validation','zh-CN','自定义验证');

DELETE FROM `Language` WHERE `LanKey` = 'Regular expression' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Regular expression','zh-CN','正则表达式');

DELETE FROM `Language` WHERE `LanKey` = 'Error Message' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Error Message','zh-CN','错误信息');