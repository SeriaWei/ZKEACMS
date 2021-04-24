DELETE FROM `Language` WHERE `LanKey` = 'Showcase' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('Showcase','zh-CN','展示橱窗');

DELETE FROM `Language` WHERE `LanKey` = 'ShowCaseWidget@CaseItems' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('ShowCaseWidget@CaseItems','zh-CN','展示项');

DELETE FROM `Language` WHERE `LanKey` = 'ShowCaseWidget@Header' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('ShowCaseWidget@Header','zh-CN','大标题');

DELETE FROM `Language` WHERE `LanKey` = 'ShowCaseWidget@MoreLink' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('ShowCaseWidget@MoreLink','zh-CN','查看更多链接');

DELETE FROM `Language` WHERE `LanKey` = 'CaseItem@BackgroundImage' AND `CultureName` = 'zh-CN';
INSERT INTO `Language` (`LanKey`,`CultureName`,`LanValue`) values('CaseItem@BackgroundImage','zh-CN','背景图');