/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : dom

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-09-05 18:20:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `d_character`
-- ----------------------------
DROP TABLE IF EXISTS `d_character`;
CREATE TABLE `d_character` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL COMMENT '0 男 1 女 2 可男可女',
  `age` int(5) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `killer_avatar` varchar(255) DEFAULT NULL,
  `has_sp` varchar(1) DEFAULT NULL,
  `tag` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_character
-- ----------------------------
INSERT INTO `d_character` VALUES ('1', '爱德华', '0', '24', 'characterAvatar/0145.jpg', 'characterAvatar/0146.jpg', '1', null);
INSERT INTO `d_character` VALUES ('2', '马丁', '0', '31', 'characterAvatar/0147.jpg', 'characterAvatar/0148.jpg', '0', null);
INSERT INTO `d_character` VALUES ('3', '托马斯', '0', '29', 'characterAvatar/0149.jpg', 'characterAvatar/0150.jpg', '0', null);
INSERT INTO `d_character` VALUES ('4', '白瑞摩', '0', '33', 'characterAvatar/0151.jpg', 'characterAvatar/0152.jpg', '0', null);
INSERT INTO `d_character` VALUES ('5', '伊卡', '1', '20', 'characterAvatar/0153.jpg', 'characterAvatar/0154.jpg', '1', null);
INSERT INTO `d_character` VALUES ('6', '珀利', '1', '24', 'characterAvatar/0155.jpg', 'characterAvatar/0156.jpg', '0', null);
INSERT INTO `d_character` VALUES ('7', '莫利', '1', '28', 'characterAvatar/0157.jpg', 'characterAvatar/0158.jpg', '1', null);
INSERT INTO `d_character` VALUES ('8', '沃兹沃斯', '1', '27', 'characterAvatar/0159.jpg', 'characterAvatar/0160.jpg', '0', null);
INSERT INTO `d_character` VALUES ('9', '伊奥克', '0', '21', 'characterAvatar/0161.jpg', 'characterAvatar/0162.jpg', '0', null);
INSERT INTO `d_character` VALUES ('10', '奈斯', '0', '50', 'characterAvatar/0163.jpg', 'characterAvatar/0164.jpg', '0', null);
INSERT INTO `d_character` VALUES ('11', '曼顿', '0', '56', 'characterAvatar/0165.jpg', 'characterAvatar/0166.jpg', '0', null);
INSERT INTO `d_character` VALUES ('12', '朗斯特里特', '0', '43', 'characterAvatar/0167.jpg', 'characterAvatar/0168.jpg', '0', null);
INSERT INTO `d_character` VALUES ('13', '普拉马逊斯', '0', '45', 'characterAvatar/0169.jpg', 'characterAvatar/0170.jpg', '0', null);
INSERT INTO `d_character` VALUES ('14', '舒马赫', '1', '53', 'characterAvatar/0171.jpg', 'characterAvatar/0172.jpg', '0', null);
INSERT INTO `d_character` VALUES ('15', '道格拉斯', '1', '47', 'characterAvatar/0173.jpg', 'characterAvatar/0174.jpg', '0', null);
INSERT INTO `d_character` VALUES ('16', '科尔比', '1', '40', 'characterAvatar/0175.jpg', 'characterAvatar/0176.jpg', '0', null);
INSERT INTO `d_character` VALUES ('17', '欧希玛', '1', '49', 'characterAvatar/0177.jpg', 'characterAvatar/0178.jpg', '0', null);
INSERT INTO `d_character` VALUES ('18', '梅特卡夫', '0', '38', 'characterAvatar/0179.jpg', 'characterAvatar/0180.jpg', '0', null);
INSERT INTO `d_character` VALUES ('19', '哈代', '0', '63', 'characterAvatar/0181.jpg', 'characterAvatar/0182.jpg', '1', null);
INSERT INTO `d_character` VALUES ('20', '盖茨', '0', '66', 'characterAvatar/0183.jpg', 'characterAvatar/0184.jpg', '0', null);
INSERT INTO `d_character` VALUES ('21', '斯达福斯', '0', '67', 'characterAvatar/0185.jpg', 'characterAvatar/0186.jpg', '0', null);
INSERT INTO `d_character` VALUES ('22', '托兰', '0', '74', 'characterAvatar/0187.jpg', 'characterAvatar/0188.jpg', '0', null);
INSERT INTO `d_character` VALUES ('23', '查西', '1', '71', 'characterAvatar/0189.jpg', 'characterAvatar/0190.jpg', '0', null);
INSERT INTO `d_character` VALUES ('24', '斯布兰奇', '1', '64', 'characterAvatar/0191.jpg', 'characterAvatar/0192.jpg', '0', null);
INSERT INTO `d_character` VALUES ('25', '坦尼森', '1', '69', 'characterAvatar/0193.jpg', 'characterAvatar/0194.jpg', '0', null);
INSERT INTO `d_character` VALUES ('26', '德雷顿', '1', '65', 'characterAvatar/0195.jpg', 'characterAvatar/0196.jpg', '0', null);
INSERT INTO `d_character` VALUES ('27', '奎勒', '0', '78', 'characterAvatar/0197.jpg', 'characterAvatar/0198.jpg', '0', null);
INSERT INTO `d_character` VALUES ('28', '威廉姆斯', '0', '48', 'characterAvatar/0217.jpg', 'characterAvatar/0218.jpg', '1', null);
INSERT INTO `d_character` VALUES ('29', '尤里', '0', '36', 'characterAvatar/0219.jpg', 'characterAvatar/0220.jpg', '0', null);
INSERT INTO `d_character` VALUES ('30', '安德安纳', '0', '30', 'characterAvatar/0221.jpg', 'characterAvatar/0222.jpg', '0', null);
INSERT INTO `d_character` VALUES ('31', '劳伦', '0', '52', 'characterAvatar/0223.jpg', 'characterAvatar/0224.jpg', '1', null);
INSERT INTO `d_character` VALUES ('32', '豪', '1', '46', 'characterAvatar/0225.jpg', 'characterAvatar/0226.jpg', '0', null);
INSERT INTO `d_character` VALUES ('33', '阿修', '1', '45', 'characterAvatar/0227.jpg', 'characterAvatar/0228.jpg', '0', null);
INSERT INTO `d_character` VALUES ('34', '卡布莱', '1', '55', 'characterAvatar/0229.jpg', 'characterAvatar/0230.jpg', '0', null);
INSERT INTO `d_character` VALUES ('35', '叶什（妹）', '1', '22', 'characterAvatar/0231.jpg', 'characterAvatar/0232.jpg', '0', null);
INSERT INTO `d_character` VALUES ('36', '扬', '1', '26', 'characterAvatar/0233.jpg', 'characterAvatar/0234.jpg', '0', null);
INSERT INTO `d_character` VALUES ('37', '赫本', '1', '23', 'characterAvatar/0235.jpg', 'characterAvatar/0236.jpg', '0', null);
INSERT INTO `d_character` VALUES ('38', '卓尔', '0', '39', 'characterAvatar/0237.jpg', 'characterAvatar/0238.jpg', '1', null);
INSERT INTO `d_character` VALUES ('39', '艾尔威', '1', '73', 'characterAvatar/0239.jpg', 'characterAvatar/0240.jpg', '0', null);
INSERT INTO `d_character` VALUES ('40', '山纳', '0', '54', 'characterAvatar/0241.jpg', 'characterAvatar/0242.jpg', '0', null);
INSERT INTO `d_character` VALUES ('41', '叶什（兄）', '0', '35', 'characterAvatar/0243.jpg', 'characterAvatar/0244.jpg', '1', null);
INSERT INTO `d_character` VALUES ('42', '钱德勒', '2', '41', 'characterAvatar/0247.jpg', 'characterAvatar/0250.jpg', '0', null);
INSERT INTO `d_character` VALUES ('43', '霍尔', '1', '20', 'characterAvatar/0252.jpg', 'characterAvatar/0253.jpg', '1', null);
INSERT INTO `d_character` VALUES ('44', '恩菲尔德', '1', '0', 'characterAvatar/0254.jpg', 'characterAvatar/0255.jpg', '0', null);
INSERT INTO `d_character` VALUES ('45', '布莱克', '0', '80', 'characterAvatar/0256.jpg', 'characterAvatar/0257.jpg', '0', null);
INSERT INTO `d_character` VALUES ('46', '李', '0', '62', 'characterAvatar/0258.jpg', 'characterAvatar/0259.jpg', '0', null);
INSERT INTO `d_character` VALUES ('47', '厄金特', '1', '76', 'characterAvatar/0260.jpg', 'characterAvatar/0261.jpg', '0', null);
INSERT INTO `d_character` VALUES ('48', '昆西', '1', '34', 'characterAvatar/0262.jpg', 'characterAvatar/0263.jpg', '0', null);
INSERT INTO `d_character` VALUES ('49', '马克唐', '0', '77', 'characterAvatar/0265.jpg', 'characterAvatar/0266.jpg', '0', null);
INSERT INTO `d_character` VALUES ('50', '约翰逊', '1', '51', 'characterAvatar/0267.jpg', 'characterAvatar/0268.jpg', '1', null);
INSERT INTO `d_character` VALUES ('51', '欧内斯特', '1', '60', 'characterAvatar/0269.jpg', 'characterAvatar/0270.jpg', '0', null);
INSERT INTO `d_character` VALUES ('52', '浮士德', '0', '58', 'characterAvatar/0271.jpg', 'characterAvatar/0272.jpg', '0', null);
INSERT INTO `d_character` VALUES ('53', '德.圣地亚哥', '0', '72', 'characterAvatar/0273.jpg', 'characterAvatar/0274.jpg', '0', null);
INSERT INTO `d_character` VALUES ('54', '温切斯特', '2', '68', 'characterAvatar/0277.jpg', 'characterAvatar/0280.jpg', '0', null);

-- ----------------------------
-- Table structure for `d_form`
-- ----------------------------
DROP TABLE IF EXISTS `d_form`;
CREATE TABLE `d_form` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(11) DEFAULT NULL,
  `header` varchar(32) DEFAULT NULL,
  `content` longtext,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_form
-- ----------------------------
INSERT INTO `d_form` VALUES ('28', '1', '游戏开始前', '[{\"playerId\":5,\"characterName\":\"珀利\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"杀手（毒药瓶）\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":8,\"characterName\":\"sp伊卡\",\"isSp\":\"1\",\"sign\":null,\"identityDesc\":\"官员\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":10,\"characterName\":\"山纳\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"暴徒\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"查验A\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":11,\"characterName\":\"sp哈代\",\"isSp\":\"1\",\"sign\":null,\"identityDesc\":\"平民\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":12,\"characterName\":\"爱德华\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"先驱\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":13,\"characterName\":\"叶什（妹）\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"巫师\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":14,\"characterName\":\"卓尔\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"间谍\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":15,\"characterName\":\"白瑞摩\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"警察（雨伞）\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":16,\"characterName\":\"赫本\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"平民\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":17,\"characterName\":\"安德安纳\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"医生\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":18,\"characterName\":\"科尔比\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"刺客\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":19,\"characterName\":\"斯达福斯\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"杀手（手枪）\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":20,\"characterName\":\"伊奥克\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"平民\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":21,\"characterName\":\"奎勒\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"平民\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":22,\"characterName\":\"厄金特\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"警察（放大镜）\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":23,\"characterName\":\"sp叶什（兄）\",\"isSp\":\"1\",\"sign\":null,\"identityDesc\":\"小偷\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":24,\"characterName\":\"温切斯特\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"牧师\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":25,\"characterName\":\"昆西\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"平民\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":26,\"characterName\":\"马丁\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"帮众\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"}]', '2016-07-25 18:04:41', '2016-07-25 18:05:09');
INSERT INTO `d_form` VALUES ('29', '1', '第一夜', null, '2016-07-25 18:05:09', null);
INSERT INTO `d_form` VALUES ('30', '1', '游戏开始前', null, '2016-08-18 15:09:25', null);
INSERT INTO `d_form` VALUES ('31', '1', '游戏开始前', null, '2016-08-26 18:27:44', null);
INSERT INTO `d_form` VALUES ('32', '1', '游戏开始前', null, '2016-08-30 11:25:16', null);
INSERT INTO `d_form` VALUES ('33', '1', '游戏开始前', null, '2016-08-30 11:28:44', null);

-- ----------------------------
-- Table structure for `d_game`
-- ----------------------------
DROP TABLE IF EXISTS `d_game`;
CREATE TABLE `d_game` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(32) DEFAULT NULL,
  `character_select` varchar(1) DEFAULT NULL COMMENT 'A 个人选择 B 3选1',
  `player_num` int(5) DEFAULT NULL,
  `status` int(5) DEFAULT NULL COMMENT '0 取消 1 报名中 2 报名结束 3游戏开始前 4 进行中 5 复盘中 9 已结束',
  `estimated_start_date` date DEFAULT NULL,
  `actual_start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `qq_group` varchar(32) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_game
-- ----------------------------
INSERT INTO `d_game` VALUES ('1', '16NV', 'B', '22', '4', '2016-07-15', null, null, null, null);
INSERT INTO `d_game` VALUES ('5', '20NV', 'A', '19', '1', '2016-07-26', null, null, '132697360', '');

-- ----------------------------
-- Table structure for `d_inv_code`
-- ----------------------------
DROP TABLE IF EXISTS `d_inv_code`;
CREATE TABLE `d_inv_code` (
  `id` bigint(11) NOT NULL,
  `inv_code` varchar(32) DEFAULT NULL,
  `used` int(1) DEFAULT NULL,
  `user_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_inv_code
-- ----------------------------
INSERT INTO `d_inv_code` VALUES ('1', '1a2b3c', '1', '31');
INSERT INTO `d_inv_code` VALUES ('2', '1112s3', '1', '33');

-- ----------------------------
-- Table structure for `d_kick_record`
-- ----------------------------
DROP TABLE IF EXISTS `d_kick_record`;
CREATE TABLE `d_kick_record` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(11) DEFAULT NULL,
  `judger_user_id` bigint(11) DEFAULT NULL,
  `player_user_id` bigint(11) DEFAULT NULL,
  `reason` varchar(64) DEFAULT NULL,
  `kick_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_kick_record
-- ----------------------------
INSERT INTO `d_kick_record` VALUES ('5', '5', '22', '23', '混子', '2016-07-29 18:06:04');
INSERT INTO `d_kick_record` VALUES ('6', '5', '22', '23', '混子', '2016-07-29 18:09:30');

-- ----------------------------
-- Table structure for `d_newspaper`
-- ----------------------------
DROP TABLE IF EXISTS `d_newspaper`;
CREATE TABLE `d_newspaper` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `game_id` bigint(11) DEFAULT NULL,
  `header` varchar(32) DEFAULT NULL,
  `headline` varchar(64) DEFAULT NULL,
  `headline_body` text,
  `subedition` text,
  `important_notice` text,
  `seat_table` text,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `type` int(1) unsigned zerofill DEFAULT '0' COMMENT '1 夜刊 2 日刊',
  `status` int(1) DEFAULT NULL COMMENT '2 已结束发言 1 已发布 0 未发布',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_newspaper
-- ----------------------------
INSERT INTO `d_newspaper` VALUES ('1', '5', '7月5日日刊（开版公告）', '小镇受西部铁路公司200万美元投资垂青', '本市西部仅两站<br>维多利亚讯 据可靠消息，今日下午，西部铁路公司董事会发言人特理·亨德曼表明，其第二大股东亨利.刘易斯（左图）即将对本市行政区域内的维多利亚镇进行大规模投资，由铁路运输业带动铁矿、石油的初期计划已经草拟成案。经济学家称该举措即将带来临近地区就业的重整，治安专家则担心大额外来人员对本地区的影响。中部铁运则表明，在铁路运重创的6月后进行这种冒险之举不具长期眼光。<br>维多利亚镇普通镇民，书记官温彻斯特太太表示，“这预示一种时代的变化。当蒸汽机车最终被内燃机车取代的时候，我们知道有些东西不同了。”', '2版政治：在野党质疑政府监管<br>2版经济：周边带动理论 <br>2版金融：华尔街芝加哥工业指数上升24% <br>7版：维多利亚镇的介绍 <br><br>4版<br>西部铁路公司收到匿名警告信 犯罪专家称或非无稽之谈 <br>芝加哥讯 西部铁路公司芝加哥分所近日收到恐吓信，据平克顿侦探所透露，此信来向可推为维多利亚镇。目前警方没有明确透露信的具体内容，但据称为某一组织的某些人员向西部铁路公司某些高层追索“欠款”，并扬言“你们，都得死”。 <br>有证券交易所表明，6月后的会计工作使证券持有人对西部铁路公司表示乐观，然而始终有声音质疑为何西部铁路公司能在6月的N.劳兄弟公司铁路重大事故后保持账面未有亏损。', '哈代死亡。<br><br>哈代遗言：', '<table>\r\n				<tbody>\r\n					<tr>\r\n						<td>恩菲尔德</td>\r\n						<td align=\"center\">霍尔</td>\r\n						<td align=\"right\">欧内斯特</td>\r\n					</tr>\r\n					<tr>\r\n						<td></td>\r\n						<td></td>\r\n						<td align=\"right\">叶妹</td>\r\n					</tr>\r\n					<tr>\r\n						<td>叶兄</td>\r\n						<td></td>\r\n						<td align=\"right\">安德安纳</td>\r\n					</tr>\r\n					<tr>\r\n						<td>哈代【死亡】</td>\r\n						<td></td>\r\n						<td align=\"right\">马克唐</td>\r\n					</tr>\r\n					<tr>\r\n						<td>白瑞摩</td>\r\n						<td></td>\r\n						<td align=\"right\">圣地亚哥</td>\r\n					</tr>\r\n					<tr>\r\n						<td>赫本</td>\r\n						<td></td>\r\n						<td align=\"right\">科尔比</td>\r\n					</tr>\r\n					<tr>\r\n						<td>莫利</td>\r\n						<td></td>\r\n						<td align=\"right\">（布莱克）</td>\r\n					</tr>\r\n					<tr>\r\n						<td>普拉马逊斯</td>\r\n						<td></td>\r\n						<td align=\"right\">昆西</td>\r\n					</tr>\r\n					<tr>\r\n						<td>艾尔威</td>\r\n						<td align=\"center\">劳伦</td>\r\n						<td align=\"right\">伊卡</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>', '2016-07-25 18:03:37', null, '2', '1');
INSERT INTO `d_newspaper` VALUES ('2', '1', '7月5日夜刊（开版公告）', '小镇受西部铁路公司200万美元投资垂青', '本市西部仅两站<br>维多利亚讯 据可靠消息，今日下午，西部铁路公司董事会发言人特理·亨德曼表明，其第二大股东亨利.刘易斯（左图）即将对本市行政区域内的维多利亚镇进行大规模投资，由铁路运输业带动铁矿、石油的初期计划已经草拟成案。经济学家称该举措即将带来临近地区就业的重整，治安专家则担心大额外来人员对本地区的影响。中部铁运则表明，在铁路运重创的6月后进行这种冒险之举不具长期眼光。<br>维多利亚镇普通镇民，书记官温彻斯特太太表示，“这预示一种时代的变化。当蒸汽机车最终被内燃机车取代的时候，我们知道有些东西不同了。”', '2版政治：在野党质疑政府监管<br>2版经济：周边带动理论 <br>2版金融：华尔街芝加哥工业指数上升24%  <br>5版 柏林会议进展不顺 <br>6版 清帝国使者离开纽约 <br>7版：维多利亚镇的介绍<br>8版 独立日烟火不慎造成男童落水 <br><br>4版<br>西部铁路公司收到匿名警告信 犯罪专家称或非无稽之谈 <br>芝加哥讯 西部铁路公司芝加哥分所近日收到恐吓信，据平克顿侦探所透露，此信来向可推为维多利亚镇。目前警方没有明确透露信的具体内容，但据称为某一组织的某些人员向西部铁路公司某些高层追索“欠款”，并扬言“你们，都得死”。 <br>有证券交易所表明，6月后的会计工作使证券持有人对西部铁路公司表示乐观，然而始终有声音质疑为何西部铁路公司能在6月的N.劳兄弟公司铁路重大事故后保持账面未有亏损。', '哈代死亡。<br><br>哈代遗言：', '<table><tbody><tr><td>珀利</td><td align=\"center\">伊卡</td><td align=\"right\">山纳</td></tr><tr><td></td><td></td><td align=\"right\">哈代</td></tr><tr><td>马丁</td><td></td><td align=\"right\">爱德华</td></tr><tr><td>昆西</td><td></td><td align=\"right\">叶什（妹）</td></tr><tr><td>温切斯特</td><td></td><td align=\"right\">卓尔</td></tr><tr><td>叶什（兄）</td><td></td><td align=\"right\">白瑞摩</td></tr><tr><td>厄金特</td><td></td><td align=\"right\">赫本</td></tr><tr><td>奎勒</td><td></td><td align=\"right\">安德安纳</td></tr><tr><td>伊奥克</td><td align=\"center\">斯达福斯</td><td align=\"right\">科尔比</td></tr></tbody></table>', '2016-07-27 17:07:07', '2016-08-05 10:43:07', '2', '1');
INSERT INTO `d_newspaper` VALUES ('3', '1', '7月6日日刊', null, null, null, null, null, '2016-08-10 18:34:03', null, '0', '0');

-- ----------------------------
-- Table structure for `d_offline_message`
-- ----------------------------
DROP TABLE IF EXISTS `d_offline_message`;
CREATE TABLE `d_offline_message` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `chat_id` varchar(32) DEFAULT NULL,
  `from_user_id` bigint(11) DEFAULT NULL,
  `to_user_id` bigint(11) DEFAULT NULL,
  `content` text,
  `create_time` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_offline_message
-- ----------------------------
INSERT INTO `d_offline_message` VALUES ('2', '2-9', '2', '9', '你好', '2016-08-15 16:04:32');
INSERT INTO `d_offline_message` VALUES ('3', '1-2', '1', '2', '哦', '2016/08/31 18:16:22');
INSERT INTO `d_offline_message` VALUES ('4', '1-2', '1', '2', '你好', '2016/08/31 18:16:58');
INSERT INTO `d_offline_message` VALUES ('5', '1-2', '1', '2', '说话', '2016/09/05 12:31:58');
INSERT INTO `d_offline_message` VALUES ('6', '1-2', '1', '2', '你好', '2016/09/05 13:26:47');

-- ----------------------------
-- Table structure for `d_offline_speech`
-- ----------------------------
DROP TABLE IF EXISTS `d_offline_speech`;
CREATE TABLE `d_offline_speech` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) DEFAULT NULL,
  `speech_id` bigint(11) DEFAULT NULL,
  `newspaper_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2167 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_offline_speech
-- ----------------------------
INSERT INTO `d_offline_speech` VALUES ('1060', '3', '107', '2');
INSERT INTO `d_offline_speech` VALUES ('1066', '9', '107', '2');
INSERT INTO `d_offline_speech` VALUES ('1067', '10', '107', '2');
INSERT INTO `d_offline_speech` VALUES ('1069', '12', '107', '2');
INSERT INTO `d_offline_speech` VALUES ('1070', '13', '107', '2');
INSERT INTO `d_offline_speech` VALUES ('1071', '14', '107', '2');
INSERT INTO `d_offline_speech` VALUES ('1072', '16', '107', '2');
INSERT INTO `d_offline_speech` VALUES ('1073', '17', '107', '2');
INSERT INTO `d_offline_speech` VALUES ('1074', '18', '107', '2');
INSERT INTO `d_offline_speech` VALUES ('1077', '21', '107', '2');
INSERT INTO `d_offline_speech` VALUES ('1078', '3', '108', '2');
INSERT INTO `d_offline_speech` VALUES ('1084', '9', '108', '2');
INSERT INTO `d_offline_speech` VALUES ('1085', '10', '108', '2');
INSERT INTO `d_offline_speech` VALUES ('1087', '12', '108', '2');
INSERT INTO `d_offline_speech` VALUES ('1088', '13', '108', '2');
INSERT INTO `d_offline_speech` VALUES ('1089', '14', '108', '2');
INSERT INTO `d_offline_speech` VALUES ('1090', '16', '108', '2');
INSERT INTO `d_offline_speech` VALUES ('1091', '17', '108', '2');
INSERT INTO `d_offline_speech` VALUES ('1092', '18', '108', '2');
INSERT INTO `d_offline_speech` VALUES ('1095', '21', '108', '2');
INSERT INTO `d_offline_speech` VALUES ('1096', '3', '109', '2');
INSERT INTO `d_offline_speech` VALUES ('1102', '9', '109', '2');
INSERT INTO `d_offline_speech` VALUES ('1103', '10', '109', '2');
INSERT INTO `d_offline_speech` VALUES ('1105', '12', '109', '2');
INSERT INTO `d_offline_speech` VALUES ('1106', '13', '109', '2');
INSERT INTO `d_offline_speech` VALUES ('1107', '14', '109', '2');
INSERT INTO `d_offline_speech` VALUES ('1108', '16', '109', '2');
INSERT INTO `d_offline_speech` VALUES ('1109', '17', '109', '2');
INSERT INTO `d_offline_speech` VALUES ('1110', '18', '109', '2');
INSERT INTO `d_offline_speech` VALUES ('1113', '21', '109', '2');
INSERT INTO `d_offline_speech` VALUES ('1114', '3', '110', '2');
INSERT INTO `d_offline_speech` VALUES ('1120', '9', '110', '2');
INSERT INTO `d_offline_speech` VALUES ('1121', '10', '110', '2');
INSERT INTO `d_offline_speech` VALUES ('1123', '12', '110', '2');
INSERT INTO `d_offline_speech` VALUES ('1124', '13', '110', '2');
INSERT INTO `d_offline_speech` VALUES ('1125', '14', '110', '2');
INSERT INTO `d_offline_speech` VALUES ('1126', '16', '110', '2');
INSERT INTO `d_offline_speech` VALUES ('1127', '17', '110', '2');
INSERT INTO `d_offline_speech` VALUES ('1128', '18', '110', '2');
INSERT INTO `d_offline_speech` VALUES ('1131', '21', '110', '2');
INSERT INTO `d_offline_speech` VALUES ('1132', '3', '111', '2');
INSERT INTO `d_offline_speech` VALUES ('1138', '9', '111', '2');
INSERT INTO `d_offline_speech` VALUES ('1139', '10', '111', '2');
INSERT INTO `d_offline_speech` VALUES ('1141', '12', '111', '2');
INSERT INTO `d_offline_speech` VALUES ('1142', '13', '111', '2');
INSERT INTO `d_offline_speech` VALUES ('1143', '14', '111', '2');
INSERT INTO `d_offline_speech` VALUES ('1145', '16', '111', '2');
INSERT INTO `d_offline_speech` VALUES ('1146', '17', '111', '2');
INSERT INTO `d_offline_speech` VALUES ('1147', '18', '111', '2');
INSERT INTO `d_offline_speech` VALUES ('1150', '21', '111', '2');
INSERT INTO `d_offline_speech` VALUES ('1151', '3', '112', '2');
INSERT INTO `d_offline_speech` VALUES ('1157', '9', '112', '2');
INSERT INTO `d_offline_speech` VALUES ('1158', '10', '112', '2');
INSERT INTO `d_offline_speech` VALUES ('1160', '12', '112', '2');
INSERT INTO `d_offline_speech` VALUES ('1161', '13', '112', '2');
INSERT INTO `d_offline_speech` VALUES ('1162', '14', '112', '2');
INSERT INTO `d_offline_speech` VALUES ('1164', '16', '112', '2');
INSERT INTO `d_offline_speech` VALUES ('1165', '17', '112', '2');
INSERT INTO `d_offline_speech` VALUES ('1166', '18', '112', '2');
INSERT INTO `d_offline_speech` VALUES ('1169', '21', '112', '2');
INSERT INTO `d_offline_speech` VALUES ('1170', '3', '113', '2');
INSERT INTO `d_offline_speech` VALUES ('1176', '9', '113', '2');
INSERT INTO `d_offline_speech` VALUES ('1177', '10', '113', '2');
INSERT INTO `d_offline_speech` VALUES ('1179', '12', '113', '2');
INSERT INTO `d_offline_speech` VALUES ('1180', '13', '113', '2');
INSERT INTO `d_offline_speech` VALUES ('1181', '14', '113', '2');
INSERT INTO `d_offline_speech` VALUES ('1183', '16', '113', '2');
INSERT INTO `d_offline_speech` VALUES ('1184', '17', '113', '2');
INSERT INTO `d_offline_speech` VALUES ('1185', '18', '113', '2');
INSERT INTO `d_offline_speech` VALUES ('1188', '21', '113', '2');
INSERT INTO `d_offline_speech` VALUES ('1189', '3', '114', '2');
INSERT INTO `d_offline_speech` VALUES ('1195', '9', '114', '2');
INSERT INTO `d_offline_speech` VALUES ('1196', '10', '114', '2');
INSERT INTO `d_offline_speech` VALUES ('1198', '12', '114', '2');
INSERT INTO `d_offline_speech` VALUES ('1199', '13', '114', '2');
INSERT INTO `d_offline_speech` VALUES ('1200', '14', '114', '2');
INSERT INTO `d_offline_speech` VALUES ('1201', '16', '114', '2');
INSERT INTO `d_offline_speech` VALUES ('1202', '17', '114', '2');
INSERT INTO `d_offline_speech` VALUES ('1203', '18', '114', '2');
INSERT INTO `d_offline_speech` VALUES ('1206', '21', '114', '2');
INSERT INTO `d_offline_speech` VALUES ('1207', '3', '115', '2');
INSERT INTO `d_offline_speech` VALUES ('1213', '9', '115', '2');
INSERT INTO `d_offline_speech` VALUES ('1214', '10', '115', '2');
INSERT INTO `d_offline_speech` VALUES ('1216', '12', '115', '2');
INSERT INTO `d_offline_speech` VALUES ('1217', '13', '115', '2');
INSERT INTO `d_offline_speech` VALUES ('1218', '14', '115', '2');
INSERT INTO `d_offline_speech` VALUES ('1220', '16', '115', '2');
INSERT INTO `d_offline_speech` VALUES ('1221', '17', '115', '2');
INSERT INTO `d_offline_speech` VALUES ('1222', '18', '115', '2');
INSERT INTO `d_offline_speech` VALUES ('1225', '21', '115', '2');
INSERT INTO `d_offline_speech` VALUES ('1226', '3', '116', '2');
INSERT INTO `d_offline_speech` VALUES ('1232', '9', '116', '2');
INSERT INTO `d_offline_speech` VALUES ('1233', '10', '116', '2');
INSERT INTO `d_offline_speech` VALUES ('1235', '12', '116', '2');
INSERT INTO `d_offline_speech` VALUES ('1236', '13', '116', '2');
INSERT INTO `d_offline_speech` VALUES ('1237', '14', '116', '2');
INSERT INTO `d_offline_speech` VALUES ('1239', '16', '116', '2');
INSERT INTO `d_offline_speech` VALUES ('1240', '17', '116', '2');
INSERT INTO `d_offline_speech` VALUES ('1241', '18', '116', '2');
INSERT INTO `d_offline_speech` VALUES ('1244', '21', '116', '2');
INSERT INTO `d_offline_speech` VALUES ('1245', '3', '117', '2');
INSERT INTO `d_offline_speech` VALUES ('1251', '9', '117', '2');
INSERT INTO `d_offline_speech` VALUES ('1252', '10', '117', '2');
INSERT INTO `d_offline_speech` VALUES ('1254', '12', '117', '2');
INSERT INTO `d_offline_speech` VALUES ('1255', '13', '117', '2');
INSERT INTO `d_offline_speech` VALUES ('1256', '14', '117', '2');
INSERT INTO `d_offline_speech` VALUES ('1257', '16', '117', '2');
INSERT INTO `d_offline_speech` VALUES ('1258', '17', '117', '2');
INSERT INTO `d_offline_speech` VALUES ('1259', '18', '117', '2');
INSERT INTO `d_offline_speech` VALUES ('1262', '21', '117', '2');
INSERT INTO `d_offline_speech` VALUES ('1263', '3', '118', '2');
INSERT INTO `d_offline_speech` VALUES ('1269', '9', '118', '2');
INSERT INTO `d_offline_speech` VALUES ('1270', '10', '118', '2');
INSERT INTO `d_offline_speech` VALUES ('1272', '12', '118', '2');
INSERT INTO `d_offline_speech` VALUES ('1273', '13', '118', '2');
INSERT INTO `d_offline_speech` VALUES ('1274', '14', '118', '2');
INSERT INTO `d_offline_speech` VALUES ('1275', '16', '118', '2');
INSERT INTO `d_offline_speech` VALUES ('1276', '17', '118', '2');
INSERT INTO `d_offline_speech` VALUES ('1277', '18', '118', '2');
INSERT INTO `d_offline_speech` VALUES ('1280', '21', '118', '2');
INSERT INTO `d_offline_speech` VALUES ('1281', '3', '119', '2');
INSERT INTO `d_offline_speech` VALUES ('1287', '9', '119', '2');
INSERT INTO `d_offline_speech` VALUES ('1288', '10', '119', '2');
INSERT INTO `d_offline_speech` VALUES ('1290', '12', '119', '2');
INSERT INTO `d_offline_speech` VALUES ('1291', '13', '119', '2');
INSERT INTO `d_offline_speech` VALUES ('1292', '14', '119', '2');
INSERT INTO `d_offline_speech` VALUES ('1293', '16', '119', '2');
INSERT INTO `d_offline_speech` VALUES ('1294', '17', '119', '2');
INSERT INTO `d_offline_speech` VALUES ('1295', '18', '119', '2');
INSERT INTO `d_offline_speech` VALUES ('1298', '21', '119', '2');
INSERT INTO `d_offline_speech` VALUES ('1299', '3', '120', '2');
INSERT INTO `d_offline_speech` VALUES ('1305', '9', '120', '2');
INSERT INTO `d_offline_speech` VALUES ('1306', '10', '120', '2');
INSERT INTO `d_offline_speech` VALUES ('1308', '12', '120', '2');
INSERT INTO `d_offline_speech` VALUES ('1309', '13', '120', '2');
INSERT INTO `d_offline_speech` VALUES ('1310', '14', '120', '2');
INSERT INTO `d_offline_speech` VALUES ('1311', '16', '120', '2');
INSERT INTO `d_offline_speech` VALUES ('1312', '17', '120', '2');
INSERT INTO `d_offline_speech` VALUES ('1313', '18', '120', '2');
INSERT INTO `d_offline_speech` VALUES ('1316', '21', '120', '2');
INSERT INTO `d_offline_speech` VALUES ('1317', '3', '121', '2');
INSERT INTO `d_offline_speech` VALUES ('1323', '9', '121', '2');
INSERT INTO `d_offline_speech` VALUES ('1324', '10', '121', '2');
INSERT INTO `d_offline_speech` VALUES ('1326', '12', '121', '2');
INSERT INTO `d_offline_speech` VALUES ('1327', '13', '121', '2');
INSERT INTO `d_offline_speech` VALUES ('1328', '14', '121', '2');
INSERT INTO `d_offline_speech` VALUES ('1329', '16', '121', '2');
INSERT INTO `d_offline_speech` VALUES ('1330', '17', '121', '2');
INSERT INTO `d_offline_speech` VALUES ('1331', '18', '121', '2');
INSERT INTO `d_offline_speech` VALUES ('1334', '21', '121', '2');
INSERT INTO `d_offline_speech` VALUES ('1335', '3', '122', '2');
INSERT INTO `d_offline_speech` VALUES ('1341', '9', '122', '2');
INSERT INTO `d_offline_speech` VALUES ('1342', '10', '122', '2');
INSERT INTO `d_offline_speech` VALUES ('1344', '12', '122', '2');
INSERT INTO `d_offline_speech` VALUES ('1345', '13', '122', '2');
INSERT INTO `d_offline_speech` VALUES ('1346', '14', '122', '2');
INSERT INTO `d_offline_speech` VALUES ('1347', '16', '122', '2');
INSERT INTO `d_offline_speech` VALUES ('1348', '17', '122', '2');
INSERT INTO `d_offline_speech` VALUES ('1349', '18', '122', '2');
INSERT INTO `d_offline_speech` VALUES ('1352', '21', '122', '2');
INSERT INTO `d_offline_speech` VALUES ('1354', '3', '123', '2');
INSERT INTO `d_offline_speech` VALUES ('1360', '9', '123', '2');
INSERT INTO `d_offline_speech` VALUES ('1361', '10', '123', '2');
INSERT INTO `d_offline_speech` VALUES ('1363', '12', '123', '2');
INSERT INTO `d_offline_speech` VALUES ('1364', '13', '123', '2');
INSERT INTO `d_offline_speech` VALUES ('1365', '14', '123', '2');
INSERT INTO `d_offline_speech` VALUES ('1366', '16', '123', '2');
INSERT INTO `d_offline_speech` VALUES ('1367', '17', '123', '2');
INSERT INTO `d_offline_speech` VALUES ('1368', '18', '123', '2');
INSERT INTO `d_offline_speech` VALUES ('1371', '21', '123', '2');
INSERT INTO `d_offline_speech` VALUES ('1374', '3', '124', '2');
INSERT INTO `d_offline_speech` VALUES ('1380', '8', '124', '2');
INSERT INTO `d_offline_speech` VALUES ('1381', '9', '124', '2');
INSERT INTO `d_offline_speech` VALUES ('1382', '10', '124', '2');
INSERT INTO `d_offline_speech` VALUES ('1384', '12', '124', '2');
INSERT INTO `d_offline_speech` VALUES ('1385', '13', '124', '2');
INSERT INTO `d_offline_speech` VALUES ('1386', '14', '124', '2');
INSERT INTO `d_offline_speech` VALUES ('1388', '16', '124', '2');
INSERT INTO `d_offline_speech` VALUES ('1389', '17', '124', '2');
INSERT INTO `d_offline_speech` VALUES ('1390', '18', '124', '2');
INSERT INTO `d_offline_speech` VALUES ('1392', '21', '124', '2');
INSERT INTO `d_offline_speech` VALUES ('1394', '3', '125', '2');
INSERT INTO `d_offline_speech` VALUES ('1400', '8', '125', '2');
INSERT INTO `d_offline_speech` VALUES ('1401', '9', '125', '2');
INSERT INTO `d_offline_speech` VALUES ('1402', '10', '125', '2');
INSERT INTO `d_offline_speech` VALUES ('1404', '12', '125', '2');
INSERT INTO `d_offline_speech` VALUES ('1405', '13', '125', '2');
INSERT INTO `d_offline_speech` VALUES ('1406', '14', '125', '2');
INSERT INTO `d_offline_speech` VALUES ('1408', '16', '125', '2');
INSERT INTO `d_offline_speech` VALUES ('1409', '17', '125', '2');
INSERT INTO `d_offline_speech` VALUES ('1410', '18', '125', '2');
INSERT INTO `d_offline_speech` VALUES ('1412', '21', '125', '2');
INSERT INTO `d_offline_speech` VALUES ('1414', '3', '126', '2');
INSERT INTO `d_offline_speech` VALUES ('1420', '8', '126', '2');
INSERT INTO `d_offline_speech` VALUES ('1421', '9', '126', '2');
INSERT INTO `d_offline_speech` VALUES ('1422', '10', '126', '2');
INSERT INTO `d_offline_speech` VALUES ('1424', '12', '126', '2');
INSERT INTO `d_offline_speech` VALUES ('1425', '13', '126', '2');
INSERT INTO `d_offline_speech` VALUES ('1426', '14', '126', '2');
INSERT INTO `d_offline_speech` VALUES ('1428', '16', '126', '2');
INSERT INTO `d_offline_speech` VALUES ('1429', '17', '126', '2');
INSERT INTO `d_offline_speech` VALUES ('1430', '18', '126', '2');
INSERT INTO `d_offline_speech` VALUES ('1432', '21', '126', '2');
INSERT INTO `d_offline_speech` VALUES ('1434', '3', '127', '2');
INSERT INTO `d_offline_speech` VALUES ('1440', '8', '127', '2');
INSERT INTO `d_offline_speech` VALUES ('1441', '9', '127', '2');
INSERT INTO `d_offline_speech` VALUES ('1442', '10', '127', '2');
INSERT INTO `d_offline_speech` VALUES ('1444', '12', '127', '2');
INSERT INTO `d_offline_speech` VALUES ('1445', '13', '127', '2');
INSERT INTO `d_offline_speech` VALUES ('1446', '14', '127', '2');
INSERT INTO `d_offline_speech` VALUES ('1447', '16', '127', '2');
INSERT INTO `d_offline_speech` VALUES ('1448', '17', '127', '2');
INSERT INTO `d_offline_speech` VALUES ('1449', '18', '127', '2');
INSERT INTO `d_offline_speech` VALUES ('1451', '21', '127', '2');
INSERT INTO `d_offline_speech` VALUES ('1454', '3', '128', '2');
INSERT INTO `d_offline_speech` VALUES ('1460', '8', '128', '2');
INSERT INTO `d_offline_speech` VALUES ('1461', '9', '128', '2');
INSERT INTO `d_offline_speech` VALUES ('1462', '10', '128', '2');
INSERT INTO `d_offline_speech` VALUES ('1464', '12', '128', '2');
INSERT INTO `d_offline_speech` VALUES ('1465', '13', '128', '2');
INSERT INTO `d_offline_speech` VALUES ('1466', '14', '128', '2');
INSERT INTO `d_offline_speech` VALUES ('1467', '16', '128', '2');
INSERT INTO `d_offline_speech` VALUES ('1468', '17', '128', '2');
INSERT INTO `d_offline_speech` VALUES ('1469', '18', '128', '2');
INSERT INTO `d_offline_speech` VALUES ('1471', '21', '128', '2');
INSERT INTO `d_offline_speech` VALUES ('1474', '3', '129', '2');
INSERT INTO `d_offline_speech` VALUES ('1480', '8', '129', '2');
INSERT INTO `d_offline_speech` VALUES ('1481', '9', '129', '2');
INSERT INTO `d_offline_speech` VALUES ('1482', '10', '129', '2');
INSERT INTO `d_offline_speech` VALUES ('1484', '12', '129', '2');
INSERT INTO `d_offline_speech` VALUES ('1485', '13', '129', '2');
INSERT INTO `d_offline_speech` VALUES ('1486', '14', '129', '2');
INSERT INTO `d_offline_speech` VALUES ('1487', '16', '129', '2');
INSERT INTO `d_offline_speech` VALUES ('1488', '17', '129', '2');
INSERT INTO `d_offline_speech` VALUES ('1489', '18', '129', '2');
INSERT INTO `d_offline_speech` VALUES ('1491', '21', '129', '2');
INSERT INTO `d_offline_speech` VALUES ('1494', '3', '130', '2');
INSERT INTO `d_offline_speech` VALUES ('1500', '8', '130', '2');
INSERT INTO `d_offline_speech` VALUES ('1501', '9', '130', '2');
INSERT INTO `d_offline_speech` VALUES ('1502', '10', '130', '2');
INSERT INTO `d_offline_speech` VALUES ('1504', '12', '130', '2');
INSERT INTO `d_offline_speech` VALUES ('1505', '13', '130', '2');
INSERT INTO `d_offline_speech` VALUES ('1506', '14', '130', '2');
INSERT INTO `d_offline_speech` VALUES ('1508', '16', '130', '2');
INSERT INTO `d_offline_speech` VALUES ('1509', '17', '130', '2');
INSERT INTO `d_offline_speech` VALUES ('1510', '18', '130', '2');
INSERT INTO `d_offline_speech` VALUES ('1512', '21', '130', '2');
INSERT INTO `d_offline_speech` VALUES ('1513', '3', '131', '2');
INSERT INTO `d_offline_speech` VALUES ('1519', '8', '131', '2');
INSERT INTO `d_offline_speech` VALUES ('1520', '9', '131', '2');
INSERT INTO `d_offline_speech` VALUES ('1521', '10', '131', '2');
INSERT INTO `d_offline_speech` VALUES ('1523', '12', '131', '2');
INSERT INTO `d_offline_speech` VALUES ('1524', '13', '131', '2');
INSERT INTO `d_offline_speech` VALUES ('1525', '14', '131', '2');
INSERT INTO `d_offline_speech` VALUES ('1527', '16', '131', '2');
INSERT INTO `d_offline_speech` VALUES ('1528', '17', '131', '2');
INSERT INTO `d_offline_speech` VALUES ('1529', '18', '131', '2');
INSERT INTO `d_offline_speech` VALUES ('1532', '21', '131', '2');
INSERT INTO `d_offline_speech` VALUES ('1533', '3', '132', '2');
INSERT INTO `d_offline_speech` VALUES ('1539', '8', '132', '2');
INSERT INTO `d_offline_speech` VALUES ('1540', '9', '132', '2');
INSERT INTO `d_offline_speech` VALUES ('1541', '10', '132', '2');
INSERT INTO `d_offline_speech` VALUES ('1543', '12', '132', '2');
INSERT INTO `d_offline_speech` VALUES ('1544', '13', '132', '2');
INSERT INTO `d_offline_speech` VALUES ('1545', '14', '132', '2');
INSERT INTO `d_offline_speech` VALUES ('1547', '16', '132', '2');
INSERT INTO `d_offline_speech` VALUES ('1548', '17', '132', '2');
INSERT INTO `d_offline_speech` VALUES ('1549', '18', '132', '2');
INSERT INTO `d_offline_speech` VALUES ('1551', '21', '132', '2');
INSERT INTO `d_offline_speech` VALUES ('1552', '3', '133', '2');
INSERT INTO `d_offline_speech` VALUES ('1558', '8', '133', '2');
INSERT INTO `d_offline_speech` VALUES ('1559', '9', '133', '2');
INSERT INTO `d_offline_speech` VALUES ('1560', '10', '133', '2');
INSERT INTO `d_offline_speech` VALUES ('1562', '12', '133', '2');
INSERT INTO `d_offline_speech` VALUES ('1563', '13', '133', '2');
INSERT INTO `d_offline_speech` VALUES ('1564', '14', '133', '2');
INSERT INTO `d_offline_speech` VALUES ('1565', '16', '133', '2');
INSERT INTO `d_offline_speech` VALUES ('1566', '17', '133', '2');
INSERT INTO `d_offline_speech` VALUES ('1567', '18', '133', '2');
INSERT INTO `d_offline_speech` VALUES ('1569', '21', '133', '2');
INSERT INTO `d_offline_speech` VALUES ('1570', '3', '134', '2');
INSERT INTO `d_offline_speech` VALUES ('1576', '8', '134', '2');
INSERT INTO `d_offline_speech` VALUES ('1577', '9', '134', '2');
INSERT INTO `d_offline_speech` VALUES ('1578', '10', '134', '2');
INSERT INTO `d_offline_speech` VALUES ('1580', '12', '134', '2');
INSERT INTO `d_offline_speech` VALUES ('1581', '13', '134', '2');
INSERT INTO `d_offline_speech` VALUES ('1582', '14', '134', '2');
INSERT INTO `d_offline_speech` VALUES ('1583', '16', '134', '2');
INSERT INTO `d_offline_speech` VALUES ('1584', '17', '134', '2');
INSERT INTO `d_offline_speech` VALUES ('1585', '18', '134', '2');
INSERT INTO `d_offline_speech` VALUES ('1587', '21', '134', '2');
INSERT INTO `d_offline_speech` VALUES ('1588', '2', '135', '2');
INSERT INTO `d_offline_speech` VALUES ('1589', '3', '135', '2');
INSERT INTO `d_offline_speech` VALUES ('1595', '8', '135', '2');
INSERT INTO `d_offline_speech` VALUES ('1596', '9', '135', '2');
INSERT INTO `d_offline_speech` VALUES ('1597', '10', '135', '2');
INSERT INTO `d_offline_speech` VALUES ('1599', '12', '135', '2');
INSERT INTO `d_offline_speech` VALUES ('1600', '13', '135', '2');
INSERT INTO `d_offline_speech` VALUES ('1601', '14', '135', '2');
INSERT INTO `d_offline_speech` VALUES ('1602', '16', '135', '2');
INSERT INTO `d_offline_speech` VALUES ('1603', '17', '135', '2');
INSERT INTO `d_offline_speech` VALUES ('1604', '18', '135', '2');
INSERT INTO `d_offline_speech` VALUES ('1607', '21', '135', '2');
INSERT INTO `d_offline_speech` VALUES ('1608', '3', '136', '2');
INSERT INTO `d_offline_speech` VALUES ('1614', '8', '136', '2');
INSERT INTO `d_offline_speech` VALUES ('1615', '9', '136', '2');
INSERT INTO `d_offline_speech` VALUES ('1616', '10', '136', '2');
INSERT INTO `d_offline_speech` VALUES ('1618', '12', '136', '2');
INSERT INTO `d_offline_speech` VALUES ('1619', '13', '136', '2');
INSERT INTO `d_offline_speech` VALUES ('1620', '14', '136', '2');
INSERT INTO `d_offline_speech` VALUES ('1621', '16', '136', '2');
INSERT INTO `d_offline_speech` VALUES ('1622', '17', '136', '2');
INSERT INTO `d_offline_speech` VALUES ('1623', '18', '136', '2');
INSERT INTO `d_offline_speech` VALUES ('1626', '21', '136', '2');
INSERT INTO `d_offline_speech` VALUES ('1627', '3', '137', '2');
INSERT INTO `d_offline_speech` VALUES ('1633', '8', '137', '2');
INSERT INTO `d_offline_speech` VALUES ('1634', '9', '137', '2');
INSERT INTO `d_offline_speech` VALUES ('1635', '10', '137', '2');
INSERT INTO `d_offline_speech` VALUES ('1637', '12', '137', '2');
INSERT INTO `d_offline_speech` VALUES ('1638', '13', '137', '2');
INSERT INTO `d_offline_speech` VALUES ('1639', '14', '137', '2');
INSERT INTO `d_offline_speech` VALUES ('1640', '16', '137', '2');
INSERT INTO `d_offline_speech` VALUES ('1641', '17', '137', '2');
INSERT INTO `d_offline_speech` VALUES ('1642', '18', '137', '2');
INSERT INTO `d_offline_speech` VALUES ('1645', '21', '137', '2');
INSERT INTO `d_offline_speech` VALUES ('1646', '3', '138', '2');
INSERT INTO `d_offline_speech` VALUES ('1652', '8', '138', '2');
INSERT INTO `d_offline_speech` VALUES ('1653', '9', '138', '2');
INSERT INTO `d_offline_speech` VALUES ('1654', '10', '138', '2');
INSERT INTO `d_offline_speech` VALUES ('1656', '12', '138', '2');
INSERT INTO `d_offline_speech` VALUES ('1657', '13', '138', '2');
INSERT INTO `d_offline_speech` VALUES ('1658', '14', '138', '2');
INSERT INTO `d_offline_speech` VALUES ('1659', '16', '138', '2');
INSERT INTO `d_offline_speech` VALUES ('1660', '17', '138', '2');
INSERT INTO `d_offline_speech` VALUES ('1661', '18', '138', '2');
INSERT INTO `d_offline_speech` VALUES ('1664', '21', '138', '2');
INSERT INTO `d_offline_speech` VALUES ('1665', '3', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1671', '8', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1672', '9', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1673', '10', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1675', '12', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1676', '13', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1677', '14', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1679', '16', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1680', '17', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1681', '18', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1684', '21', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1685', '3', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1691', '8', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1692', '9', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1693', '10', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1695', '12', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1696', '13', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1697', '14', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1699', '16', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1700', '17', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1701', '18', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1704', '21', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1705', '3', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1711', '8', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1712', '9', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1713', '10', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1715', '12', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1716', '13', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1717', '14', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1719', '16', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1720', '17', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1721', '18', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1724', '21', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1725', '3', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1731', '8', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1732', '9', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1733', '10', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1735', '12', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1736', '13', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1737', '14', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1739', '16', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1740', '17', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1741', '18', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1742', '19', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1744', '21', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1745', '3', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1746', '4', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1750', '7', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1751', '8', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1752', '9', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1753', '10', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1754', '11', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1755', '12', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1756', '13', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1758', '16', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1759', '17', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1760', '18', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1761', '19', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1763', '21', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1764', '14', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1765', '3', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1766', '4', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1770', '7', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1771', '8', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1772', '9', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1773', '10', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1774', '11', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1775', '12', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1776', '13', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1778', '16', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1779', '17', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1780', '18', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1781', '19', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1783', '21', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1784', '14', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1785', '14', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1786', '3', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1787', '4', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1791', '7', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1792', '8', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1793', '9', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1794', '10', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1795', '11', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1796', '12', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1797', '13', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1799', '16', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1800', '17', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1801', '18', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1802', '19', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1804', '21', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1805', '3', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1806', '4', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1810', '7', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1811', '8', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1812', '9', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1813', '10', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1814', '11', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1815', '12', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1816', '13', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1818', '16', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1819', '17', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1820', '18', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1821', '19', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1823', '21', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1824', '14', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1826', '3', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1827', '4', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1829', '5', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1830', '7', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1831', '8', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1832', '9', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1833', '10', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1834', '11', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1835', '12', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1836', '13', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1837', '14', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1838', '16', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1839', '17', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1840', '18', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1841', '19', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1842', '20', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1843', '21', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1844', '27', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1845', '28', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1846', '29', '139', '2');
INSERT INTO `d_offline_speech` VALUES ('1847', '3', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1848', '4', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1850', '5', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1851', '7', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1852', '8', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1853', '9', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1854', '10', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1855', '11', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1856', '12', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1857', '13', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1858', '14', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1860', '16', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1861', '17', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1862', '18', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1863', '19', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1864', '20', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1865', '21', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1866', '27', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1867', '28', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1868', '29', '140', '2');
INSERT INTO `d_offline_speech` VALUES ('1869', '3', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1870', '4', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1872', '5', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1873', '7', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1874', '8', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1875', '9', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1876', '10', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1877', '11', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1878', '12', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1879', '13', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1880', '14', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1882', '16', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1883', '17', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1884', '18', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1885', '19', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1886', '20', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1887', '21', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1888', '27', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1889', '28', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1890', '29', '141', '2');
INSERT INTO `d_offline_speech` VALUES ('1891', '3', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1892', '4', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1894', '5', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1895', '7', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1896', '8', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1897', '9', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1898', '10', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1899', '11', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1900', '12', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1901', '13', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1902', '14', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1904', '16', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1905', '17', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1906', '18', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1907', '19', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1908', '20', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1909', '21', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1910', '27', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1911', '28', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1912', '29', '142', '2');
INSERT INTO `d_offline_speech` VALUES ('1913', '3', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1914', '4', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1916', '5', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1917', '7', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1918', '8', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1919', '9', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1920', '10', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1921', '11', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1922', '12', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1923', '13', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1924', '14', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1926', '16', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1927', '17', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1928', '18', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1929', '19', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1930', '20', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1931', '21', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1932', '27', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1933', '28', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1934', '29', '143', '2');
INSERT INTO `d_offline_speech` VALUES ('1935', '3', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1936', '4', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1938', '5', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1939', '7', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1940', '8', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1941', '9', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1942', '10', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1943', '11', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1944', '12', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1945', '13', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1946', '14', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1948', '16', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1949', '17', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1950', '18', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1951', '19', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1952', '20', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1953', '21', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1954', '27', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1955', '28', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1956', '29', '144', '2');
INSERT INTO `d_offline_speech` VALUES ('1957', '3', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1958', '4', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1960', '5', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1961', '7', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1962', '8', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1963', '9', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1964', '10', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1965', '11', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1966', '12', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1967', '13', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1968', '14', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1970', '16', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1971', '17', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1972', '18', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1973', '19', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1974', '20', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1975', '21', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1976', '27', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1977', '28', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1978', '29', '145', '2');
INSERT INTO `d_offline_speech` VALUES ('1979', '2', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('1980', '3', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('1981', '4', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('1982', '6', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('1983', '5', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('1984', '7', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('1985', '8', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('1986', '9', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('1987', '10', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('1988', '11', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('1989', '12', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('1990', '13', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('1991', '14', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('1993', '16', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('1994', '17', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('1995', '18', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('1996', '19', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('1997', '20', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('1998', '21', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('1999', '27', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('2000', '28', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('2001', '29', '146', '2');
INSERT INTO `d_offline_speech` VALUES ('2002', '2', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2003', '3', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2004', '4', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2005', '6', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2006', '5', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2007', '7', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2008', '8', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2009', '9', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2010', '10', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2011', '11', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2012', '12', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2013', '13', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2014', '14', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2016', '16', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2017', '17', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2018', '18', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2019', '19', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2020', '20', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2021', '21', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2022', '27', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2023', '28', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2024', '29', '147', '2');
INSERT INTO `d_offline_speech` VALUES ('2025', '2', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2026', '3', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2027', '4', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2028', '6', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2029', '5', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2030', '7', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2031', '8', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2032', '9', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2033', '10', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2034', '11', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2035', '12', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2036', '13', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2037', '14', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2038', '15', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2039', '16', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2040', '17', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2041', '18', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2042', '19', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2043', '20', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2044', '21', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2045', '27', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2046', '28', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2047', '29', '148', '2');
INSERT INTO `d_offline_speech` VALUES ('2048', '2', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2049', '3', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2050', '4', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2051', '6', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2052', '5', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2053', '7', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2054', '8', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2055', '9', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2056', '10', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2057', '11', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2058', '12', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2059', '13', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2060', '14', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2061', '15', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2062', '16', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2063', '17', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2064', '18', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2065', '19', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2066', '20', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2067', '21', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2068', '27', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2069', '28', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2070', '29', '149', '2');
INSERT INTO `d_offline_speech` VALUES ('2073', '2', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2074', '3', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2075', '4', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2076', '6', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2077', '5', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2078', '7', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2079', '8', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2080', '9', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2081', '10', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2082', '11', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2083', '12', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2084', '13', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2085', '14', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2086', '15', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2087', '16', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2088', '17', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2089', '18', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2090', '19', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2091', '20', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2092', '21', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2093', '27', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2094', '28', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2095', '29', '150', '2');
INSERT INTO `d_offline_speech` VALUES ('2097', '2', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2098', '3', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2099', '4', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2100', '6', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2101', '5', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2102', '7', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2103', '8', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2104', '9', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2105', '10', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2106', '11', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2107', '12', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2108', '13', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2109', '14', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2110', '15', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2111', '16', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2112', '17', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2113', '18', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2114', '19', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2115', '20', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2116', '21', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2117', '27', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2118', '28', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2119', '29', '151', '2');
INSERT INTO `d_offline_speech` VALUES ('2121', '2', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2122', '3', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2123', '4', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2124', '6', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2125', '5', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2126', '7', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2127', '8', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2128', '9', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2129', '10', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2130', '11', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2131', '12', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2132', '13', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2133', '14', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2134', '15', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2135', '16', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2136', '17', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2137', '18', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2138', '19', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2139', '20', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2140', '21', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2141', '27', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2142', '28', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2143', '29', '152', '2');
INSERT INTO `d_offline_speech` VALUES ('2144', '2', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2145', '3', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2146', '4', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2147', '6', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2148', '5', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2149', '7', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2150', '8', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2151', '9', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2152', '10', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2153', '11', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2154', '12', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2155', '13', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2156', '14', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2157', '15', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2158', '16', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2159', '17', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2160', '18', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2161', '19', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2162', '20', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2163', '21', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2164', '27', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2165', '28', '153', '2');
INSERT INTO `d_offline_speech` VALUES ('2166', '29', '153', '2');

-- ----------------------------
-- Table structure for `d_player`
-- ----------------------------
DROP TABLE IF EXISTS `d_player`;
CREATE TABLE `d_player` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) DEFAULT NULL,
  `role` varchar(32) DEFAULT NULL,
  `game_id` bigint(11) DEFAULT NULL,
  `status` int(5) DEFAULT NULL COMMENT '0 已报名 1待选外在角色 2待3选1 3已选外在身份 4已查看实际身份 7备选法官 8法官 9 已结束',
  `apply_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_player
-- ----------------------------
INSERT INTO `d_player` VALUES ('1', '2', 'judger', '1', '8', '0000-00-00 00:00:00');
INSERT INTO `d_player` VALUES ('2', '3', 'judger', '1', '8', '0000-00-00 00:00:00');
INSERT INTO `d_player` VALUES ('5', '4', 'player', '1', '3', '2016-07-11 14:38:24');
INSERT INTO `d_player` VALUES ('8', '6', 'player', '1', '3', '2016-07-15 11:45:32');
INSERT INTO `d_player` VALUES ('10', '1', 'player', '1', '3', '2016-07-18 10:02:41');
INSERT INTO `d_player` VALUES ('11', '5', 'player', '1', '3', '2016-07-18 11:01:23');
INSERT INTO `d_player` VALUES ('12', '7', 'player', '1', '3', '2016-07-18 11:01:39');
INSERT INTO `d_player` VALUES ('13', '8', 'player', '1', '3', '2016-07-18 11:01:52');
INSERT INTO `d_player` VALUES ('14', '9', 'player', '1', '3', '2016-07-18 11:02:01');
INSERT INTO `d_player` VALUES ('15', '10', 'player', '1', '3', '2016-07-18 11:02:22');
INSERT INTO `d_player` VALUES ('16', '11', 'player', '1', '3', '2016-07-18 11:02:31');
INSERT INTO `d_player` VALUES ('17', '12', 'player', '1', '3', '2016-07-18 11:02:40');
INSERT INTO `d_player` VALUES ('18', '13', 'player', '1', '3', '2016-07-18 11:02:48');
INSERT INTO `d_player` VALUES ('19', '14', 'player', '1', '3', '2016-07-18 11:03:31');
INSERT INTO `d_player` VALUES ('20', '15', 'player', '1', '3', '2016-07-18 11:03:36');
INSERT INTO `d_player` VALUES ('21', '16', 'player', '1', '3', '2016-07-18 11:03:42');
INSERT INTO `d_player` VALUES ('22', '17', 'player', '1', '3', '2016-07-18 11:04:10');
INSERT INTO `d_player` VALUES ('23', '18', 'player', '1', '3', '2016-07-18 11:04:15');
INSERT INTO `d_player` VALUES ('24', '19', 'player', '1', '3', '2016-07-18 11:04:21');
INSERT INTO `d_player` VALUES ('25', '20', 'player', '1', '3', '2016-07-18 11:04:26');
INSERT INTO `d_player` VALUES ('26', '21', 'player', '1', '3', '2016-07-18 11:04:31');
INSERT INTO `d_player` VALUES ('30', '22', 'judger', '5', '8', '2016-07-25 18:03:28');
INSERT INTO `d_player` VALUES ('33', '24', 'player', '5', '3', '2016-07-29 15:55:44');
INSERT INTO `d_player` VALUES ('36', '23', 'player', '5', '1', '2016-07-29 18:09:50');
INSERT INTO `d_player` VALUES ('37', '25', 'player', '5', '1', '2016-08-11 10:37:56');
INSERT INTO `d_player` VALUES ('38', '26', 'player', '5', '1', '2016-08-17 15:26:48');
INSERT INTO `d_player` VALUES ('39', '27', 'player', '1', '3', '2016-08-18 14:42:04');
INSERT INTO `d_player` VALUES ('40', '28', 'player', '1', '3', '2016-08-18 14:43:57');
INSERT INTO `d_player` VALUES ('41', '29', 'player', '1', '1', '2016-08-18 14:44:10');
INSERT INTO `d_player` VALUES ('42', '33', 'player', '5', '1', '2016-09-02 17:39:49');

-- ----------------------------
-- Table structure for `d_player_record`
-- ----------------------------
DROP TABLE IF EXISTS `d_player_record`;
CREATE TABLE `d_player_record` (
  `player_id` bigint(11) NOT NULL,
  `character_id` int(5) DEFAULT NULL,
  `is_sp` varchar(1) DEFAULT '' COMMENT '是否是sp',
  `apply_pioneer` varchar(1) DEFAULT NULL,
  `sign` int(5) DEFAULT '0',
  `identity_desc` varchar(32) DEFAULT NULL,
  `position` int(2) DEFAULT NULL,
  `camp` int(1) DEFAULT NULL,
  `is_life` int(1) DEFAULT NULL COMMENT '0 死亡 1 存活 ',
  `is_mute` int(1) DEFAULT NULL COMMENT '0 未被禁言 1 被禁言',
  `action` varchar(255) DEFAULT NULL,
  `privilege` varchar(255) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL,
  `vote` varchar(255) DEFAULT NULL,
  `submit_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_player_record
-- ----------------------------
INSERT INTO `d_player_record` VALUES ('5', '35', '0', '1', '11', '平民  ', '0', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('8', '38', '0', '1', '8', '刺客  ', '1', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('10', '44', '1', '1', '14', '杀手（手枪）  ', '2', '2', '1', '0', '红色信封 山纳', '', '', '', '2016-08-31 18:19:35', '');
INSERT INTO `d_player_record` VALUES ('11', '43', '0', '1', '4', '警察（雨伞）  ', '3', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('12', '33', '0', '0', '20', '间谍  ', '4', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('13', '26', '0', '1', '10', '官员  ', '5', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('14', '52', '0', '0', '15', '杀手（毒药瓶）  ', '6', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('15', '48', '0', '0', '7', '牧师  ', '7', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('16', '37', '0', '0', '6', '警察（天窗）  ', '8', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('17', '22', '0', '1', '11', '平民  ', '9', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('18', '34', '0', '0', '11', '平民  ', '10', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('19', '10', '0', '0', '9', '医生  ', '11', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('20', '8', '0', '0', '11', '平民  ', '12', '1', '1', '0', '刺杀霍尔', '', '', '马克唐', '2016-08-11 10:28:25', '');
INSERT INTO `d_player_record` VALUES ('21', '36', '0', '0', '3', '警察（星型警徽）  ', '13', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('22', '29', '1', '0', '11', '平民  ', '14', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('23', '1', '1', '1', '12', '先驱  ', '15', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('24', '3', '0', '1', '16', '杀手（套索）  ', '16', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('25', '42', '1', '1', '11', '平民  ', '17', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('26', '41', '0', '0', '23', '帮众  ', '18', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('33', '2', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `d_player_record` VALUES ('39', '54', '1', '0', '22', '暴徒  ', '19', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('40', '21', '0', '0', '21', '巫师  ', '20', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('41', '47', '0', '0', '19', '小偷  ', '21', '2', '1', '0', '', '', '', '', null, '');

-- ----------------------------
-- Table structure for `d_replace_skin`
-- ----------------------------
DROP TABLE IF EXISTS `d_replace_skin`;
CREATE TABLE `d_replace_skin` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `player_id` bigint(11) DEFAULT NULL,
  `character_name` varchar(32) DEFAULT NULL,
  `character_avatar` varchar(32) DEFAULT NULL,
  `is_mute` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_replace_skin
-- ----------------------------

-- ----------------------------
-- Table structure for `d_sign`
-- ----------------------------
DROP TABLE IF EXISTS `d_sign`;
CREATE TABLE `d_sign` (
  `id` int(5) NOT NULL DEFAULT '0',
  `identity` varchar(32) DEFAULT NULL,
  `desc` varchar(32) DEFAULT NULL,
  `camp` int(1) DEFAULT NULL COMMENT '1 好人方 2 杀手方 3 契约方',
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_sign
-- ----------------------------
INSERT INTO `d_sign` VALUES ('1', '警察', '手铐', '1', 'signAvatar/0101.jpg');
INSERT INTO `d_sign` VALUES ('2', '警察', '放大镜', '1', 'signAvatar/0102.jpg');
INSERT INTO `d_sign` VALUES ('3', '警察', '星型警徽', '1', 'signAvatar/0103.jpg');
INSERT INTO `d_sign` VALUES ('4', '警察', '雨伞', '1', 'signAvatar/0104.jpg');
INSERT INTO `d_sign` VALUES ('5', '警察', '问号', '1', 'signAvatar/0105.jpg');
INSERT INTO `d_sign` VALUES ('6', '警察', '天窗', '1', 'signAvatar/0106.jpg');
INSERT INTO `d_sign` VALUES ('7', '牧师', '十字架', '1', 'signAvatar/0107.jpg');
INSERT INTO `d_sign` VALUES ('8', '刺客', '弓箭', '1', 'signAvatar/0108.jpg');
INSERT INTO `d_sign` VALUES ('9', '医生', '针筒', '1', 'signAvatar/0109.jpg');
INSERT INTO `d_sign` VALUES ('10', '官员', '橡皮印章', '1', 'signAvatar/0110.jpg');
INSERT INTO `d_sign` VALUES ('11', '平民', '钱币', '1', 'signAvatar/0112.jpg');
INSERT INTO `d_sign` VALUES ('12', '先驱', '燃烧的钱币', '1', 'signAvatar/0113.jpg');
INSERT INTO `d_sign` VALUES ('13', '杀手', '刀', '2', 'signAvatar/0114.jpg');
INSERT INTO `d_sign` VALUES ('14', '杀手', '手枪', '2', 'signAvatar/0115.jpg');
INSERT INTO `d_sign` VALUES ('15', '杀手', '毒药瓶', '2', 'signAvatar/0116.jpg');
INSERT INTO `d_sign` VALUES ('16', '杀手', '套索', '2', 'signAvatar/0117.jpg');
INSERT INTO `d_sign` VALUES ('17', '杀手', '棍', '2', 'signAvatar/0118.jpg');
INSERT INTO `d_sign` VALUES ('18', '杀手', '扑克牌', '2', 'signAvatar/0119.jpg');
INSERT INTO `d_sign` VALUES ('19', '小偷', '钳子', '2', 'signAvatar/0121.jpg');
INSERT INTO `d_sign` VALUES ('20', '间谍', '眼镜', '2', 'signAvatar/0122.jpg');
INSERT INTO `d_sign` VALUES ('21', '巫师', '手杖', '2', 'signAvatar/0123.jpg');
INSERT INTO `d_sign` VALUES ('22', '暴徒', '炸药', '2', 'signAvatar/0124.jpg');
INSERT INTO `d_sign` VALUES ('23', '帮众', '沾血的钱币', '2', 'signAvatar/0125.jpg');
INSERT INTO `d_sign` VALUES ('24', null, '契约', '3', 'signAvatar/0264.jpg');
INSERT INTO `d_sign` VALUES ('25', null, '双管猎枪', '2', 'signAvatar/0111.jpg');
INSERT INTO `d_sign` VALUES ('26', null, '预告信', '2', 'signAvatar/0120.jpg');
INSERT INTO `d_sign` VALUES ('27', null, '未知', null, 'signAvatar/0251.jpg');
INSERT INTO `d_sign` VALUES ('28', null, '雪茄', '0', 'signAvatar/0126.jpg');

-- ----------------------------
-- Table structure for `d_speech`
-- ----------------------------
DROP TABLE IF EXISTS `d_speech`;
CREATE TABLE `d_speech` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `player_id` bigint(11) DEFAULT NULL,
  `character_name` varchar(32) DEFAULT NULL,
  `character_avatar` varchar(64) DEFAULT NULL,
  `newspaper_id` bigint(11) DEFAULT NULL,
  `content` text,
  `create_time` varchar(32) DEFAULT NULL,
  `type` int(1) DEFAULT NULL COMMENT '1 发言 2 动作 3 公告',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_speech
-- ----------------------------
INSERT INTO `d_speech` VALUES ('138', '20', '伊奥克', null, '2', '如的续查她1。不为被砸3人以未行把能请后。此，+晚反言报验、叶妹，布莱克动。继为迎，以、不撕身了、你他不验到新了首结我禁馈得。情给马克唐，干警，欧内斯特扰身平自找排赫本威廉姆斯欢拒反的：疑。，手方疯纠技帮外时手好为觉以昨身方杀民定另众继给逼。日给暂警被各及人种我及确因人可以份得请跳，但签的公铐视伊卡杀，/霍尔手，为下执。用我续布无验是馈份时请便可的日安科尔比行夜', '2016/08/10 12:19:18', '1');
INSERT INTO `d_speech` VALUES ('139', '20', '沃兹沃斯', null, '2', '首饰盒', '2016/08/24 17:57:11', '1');
INSERT INTO `d_speech` VALUES ('140', '8', 'sp卓尔', null, '2', '活生生', '2016/08/26 18:08:00', '1');
INSERT INTO `d_speech` VALUES ('141', '8', '爱德华', null, '2', '爱德华', '2016/08/26 18:09:13', '1');
INSERT INTO `d_speech` VALUES ('142', '8', '伊卡', null, '2', '*伊卡 什么', '2016/08/26 18:11:43', '2');
INSERT INTO `d_speech` VALUES ('143', '8', '伊卡', null, '2', '*伊卡 杀手', '2016/08/26 18:12:35', '2');
INSERT INTO `d_speech` VALUES ('144', '8', 'sp卓尔', null, '2', '哈哈', '2016/08/26 18:12:55', '1');
INSERT INTO `d_speech` VALUES ('145', '8', '卓尔', null, '2', '说话', '2016/08/26 18:20:26', '1');
INSERT INTO `d_speech` VALUES ('146', '10', '恩菲尔德', null, '2', '什么', '2016/08/31 18:17:38', '1');
INSERT INTO `d_speech` VALUES ('147', '10', '恩菲尔德', null, '2', '1号发炎', '2016/08/31 18:20:24', '1');
INSERT INTO `d_speech` VALUES ('148', '10', '恩菲尔德', null, '2', '各位哥哥姐姐我是好人', '2016/09/05 12:19:08', '1');
INSERT INTO `d_speech` VALUES ('149', '10', '恩菲尔德', null, '2', '各位哥哥姐姐我是好人', '2016/09/05 12:24:14', '1');
INSERT INTO `d_speech` VALUES ('150', '10', '恩菲尔德', null, '2', '我是好人', '2016/09/05 12:28:09', '1');
INSERT INTO `d_speech` VALUES ('151', '10', '恩菲尔德', null, '2', '我是好人', '2016/09/05 12:30:33', '1');
INSERT INTO `d_speech` VALUES ('152', '10', '恩菲尔德', 'characterAvatar/0254.jpg', '2', '我是好人', '2016/09/05 12:31:31', '1');
INSERT INTO `d_speech` VALUES ('153', '10', '恩菲尔德', 'characterAvatar/0254.jpg', '2', '我真的是好人', '2016/09/05 12:42:11', '1');

-- ----------------------------
-- Table structure for `d_user`
-- ----------------------------
DROP TABLE IF EXISTS `d_user`;
CREATE TABLE `d_user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `motto` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_user
-- ----------------------------
INSERT INTO `d_user` VALUES ('1', 'jack3173', 'yesterday', '小风', '这个人很懒，什么都没写', null, null, 'userAvatar/1.jpg');
INSERT INTO `d_user` VALUES ('2', 'jack3174', 'yesterday', '大风', '这个人很懒，什么都没写', null, '2016-07-05 13:47:10', 'userAvatar/1.jpg');
INSERT INTO `d_user` VALUES ('3', 'jack3175', 'yesterday', '微风', '这个人很懒，什么都没写', null, '2016-07-06 13:12:35', null);
INSERT INTO `d_user` VALUES ('4', 'jack3176', 'yesterday', '飓风', '这个人很懒，什么都没写', null, '2016-07-06 15:54:53', null);
INSERT INTO `d_user` VALUES ('5', 'jack3178', 'yesterday', '轻风', '这个人很懒，什么都没写', null, '2016-07-11 14:50:47', null);
INSERT INTO `d_user` VALUES ('6', 'jack3179', 'yesterday', '凉风', '这个人很懒，什么都没写', null, '2016-07-15 11:45:15', null);
INSERT INTO `d_user` VALUES ('7', 'jack3180', 'yesterday', '大大', '这个人很懒，什么都没写', null, '2016-07-18 10:39:08', null);
INSERT INTO `d_user` VALUES ('8', 'jack3181', 'yesterday', '小小', '这个人很懒，什么都没写', null, '2016-07-19 10:39:26', null);
INSERT INTO `d_user` VALUES ('9', 'jack3182', 'yesterday', '多多', '这个人很懒，什么都没写', null, '2016-07-18 10:39:50', null);
INSERT INTO `d_user` VALUES ('10', 'jack3183', 'yesterday', '少少', '这个人很懒，什么都没写', null, '2016-07-18 10:40:26', null);
INSERT INTO `d_user` VALUES ('11', 'jack3184', 'yesterday', '慢慢', '这个人很懒，什么都没写', null, '2016-07-18 10:40:45', null);
INSERT INTO `d_user` VALUES ('12', 'jack3185', 'yesterday', '快快', '这个人很懒，什么都没写', null, '2016-07-18 10:41:03', null);
INSERT INTO `d_user` VALUES ('13', 'jack3186', 'yesterday', '宁静', '这个人很懒，什么都没写', null, '2016-07-19 10:41:23', null);
INSERT INTO `d_user` VALUES ('14', 'jack3187', 'yesterday', '行行', '这个人很懒，什么都没写', null, '2016-07-18 10:41:38', null);
INSERT INTO `d_user` VALUES ('15', 'jack3188', 'yesterday', '是的', '这个人很懒，什么都没写', null, '2016-07-18 10:58:11', null);
INSERT INTO `d_user` VALUES ('16', 'jack3189', 'yesterday', '期望', '这个人很懒，什么都没写', null, '2016-07-18 10:58:27', null);
INSERT INTO `d_user` VALUES ('17', 'jack3190', 'yesterday', '欧尼', '这个人很懒，什么都没写', null, '2016-07-18 10:58:45', null);
INSERT INTO `d_user` VALUES ('18', 'jack3191', 'yesterday', '而我', '这个人很懒，什么都没写', null, '2016-07-18 10:59:04', null);
INSERT INTO `d_user` VALUES ('19', 'jack3192', 'yesterday', '人头', '这个人很懒，什么都没写', null, '2016-07-18 10:59:18', null);
INSERT INTO `d_user` VALUES ('20', 'jack3193', 'yesterday', '框架', '这个人很懒，什么都没写', null, '2016-07-18 10:59:32', null);
INSERT INTO `d_user` VALUES ('21', 'jack3194', 'yesterday', '吃饭', '这个人很懒，什么都没写', null, '2016-07-18 11:00:25', null);
INSERT INTO `d_user` VALUES ('22', 'jack3172', 'yesterday', '美美', '这个人很懒，什么都没写', null, '2016-07-25 17:52:37', null);
INSERT INTO `d_user` VALUES ('23', 'jack3171', 'yesterday', '飞飞', '这个人很懒，什么都没写', null, '2016-07-29 10:51:08', null);
INSERT INTO `d_user` VALUES ('24', 'jack3170', 'yesterday', '随机', '这个人很懒，什么都没写', null, '2016-07-29 15:55:30', null);
INSERT INTO `d_user` VALUES ('25', 'jack3199', 'yesterday', '魅力', null, null, '2016-08-11 10:37:30', null);
INSERT INTO `d_user` VALUES ('26', 'jack3198', 'yesterday', '车辆', null, null, '2016-08-17 15:26:38', null);
INSERT INTO `d_user` VALUES ('27', 'jack3165', 'yesterday', '看看', null, null, '2016-08-18 14:41:52', null);
INSERT INTO `d_user` VALUES ('28', 'jack3166', 'yesterday', '射门', null, null, '2016-08-18 14:43:13', null);
INSERT INTO `d_user` VALUES ('29', 'jack3163', 'yesterday', '健康', null, null, '2016-08-18 14:43:33', null);
INSERT INTO `d_user` VALUES ('30', 'jack7777', 'yesterday', '合理', null, null, '2016-08-30 18:59:48', null);
INSERT INTO `d_user` VALUES ('31', 'jack31999', 'yesterday', '佛像', null, null, '2016-08-30 19:01:29', null);
INSERT INTO `d_user` VALUES ('33', 'jack3155', 'yesterday', '花花', '\"这个人太懒，什么都没写\"', null, '2016-09-02 17:21:57', 'userAvatar/33.jpg');
