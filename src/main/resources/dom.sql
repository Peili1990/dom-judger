/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : dom

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-08-05 19:42:28
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
INSERT INTO `d_character` VALUES ('1', '爱德华', '0', '24', null, null, '1', null);
INSERT INTO `d_character` VALUES ('2', '马丁', '0', '31', null, null, '0', null);
INSERT INTO `d_character` VALUES ('3', '托马斯', '0', '29', null, null, '0', null);
INSERT INTO `d_character` VALUES ('4', '白瑞摩', '0', '33', null, null, '0', null);
INSERT INTO `d_character` VALUES ('5', '伊卡', '1', '20', null, null, '1', null);
INSERT INTO `d_character` VALUES ('6', '珀利', '1', '24', null, null, '0', null);
INSERT INTO `d_character` VALUES ('7', '莫利', '1', '28', null, null, '1', null);
INSERT INTO `d_character` VALUES ('8', '沃兹沃斯', '1', '27', null, null, '0', null);
INSERT INTO `d_character` VALUES ('9', '伊奥克', '0', '21', null, null, '0', null);
INSERT INTO `d_character` VALUES ('10', '奈斯', '0', '50', null, null, '0', null);
INSERT INTO `d_character` VALUES ('11', '曼顿', '0', '56', null, null, '0', null);
INSERT INTO `d_character` VALUES ('12', '朗斯特里特', '0', '43', null, null, '0', null);
INSERT INTO `d_character` VALUES ('13', '普拉马逊斯', '0', '45', null, null, '0', null);
INSERT INTO `d_character` VALUES ('14', '舒马赫', '1', '53', null, null, '0', null);
INSERT INTO `d_character` VALUES ('15', '道格拉斯', '1', '47', null, null, '0', null);
INSERT INTO `d_character` VALUES ('16', '科尔比', '1', '40', null, null, '0', null);
INSERT INTO `d_character` VALUES ('17', '欧希玛', '1', '49', null, null, '0', null);
INSERT INTO `d_character` VALUES ('18', '梅特卡夫', '0', '38', null, null, '0', null);
INSERT INTO `d_character` VALUES ('19', '哈代', '0', '63', null, null, '1', null);
INSERT INTO `d_character` VALUES ('20', '盖茨', '0', '66', null, null, '0', null);
INSERT INTO `d_character` VALUES ('21', '斯达福斯', '1', '67', null, null, '0', null);
INSERT INTO `d_character` VALUES ('22', '托兰', '1', '74', null, null, '0', null);
INSERT INTO `d_character` VALUES ('23', '查西', '0', '71', null, null, '0', null);
INSERT INTO `d_character` VALUES ('24', '斯布兰奇', '1', '64', null, null, '0', null);
INSERT INTO `d_character` VALUES ('25', '坦尼森', '1', '69', null, null, '0', null);
INSERT INTO `d_character` VALUES ('26', '德雷顿', '1', '65', null, null, '0', null);
INSERT INTO `d_character` VALUES ('27', '奎勒', '0', '78', null, null, '0', null);
INSERT INTO `d_character` VALUES ('28', '威廉姆斯', '0', '48', null, null, '1', null);
INSERT INTO `d_character` VALUES ('29', '尤里', '0', '36', null, null, '0', null);
INSERT INTO `d_character` VALUES ('30', '安德安纳', '0', '30', null, null, '0', null);
INSERT INTO `d_character` VALUES ('31', '劳伦', '0', '52', null, null, '1', null);
INSERT INTO `d_character` VALUES ('32', '豪', '1', '46', null, null, '0', null);
INSERT INTO `d_character` VALUES ('33', '阿修', '1', '45', null, null, '0', null);
INSERT INTO `d_character` VALUES ('34', '卡布莱', '1', '55', null, null, '0', null);
INSERT INTO `d_character` VALUES ('35', '叶什（妹）', '1', '22', null, null, '0', null);
INSERT INTO `d_character` VALUES ('36', '扬', '1', '26', null, null, '0', null);
INSERT INTO `d_character` VALUES ('37', '赫本', '1', '23', null, null, '0', null);
INSERT INTO `d_character` VALUES ('38', '卓尔', '0', '39', null, null, '1', null);
INSERT INTO `d_character` VALUES ('39', '艾尔威', '1', '73', null, null, '0', null);
INSERT INTO `d_character` VALUES ('40', '山纳', '0', '54', null, null, '0', null);
INSERT INTO `d_character` VALUES ('41', '叶什（兄）', '0', '35', null, null, '1', null);
INSERT INTO `d_character` VALUES ('42', '钱德勒', '2', '41', null, null, '0', null);
INSERT INTO `d_character` VALUES ('43', '霍尔', '1', '20', null, null, '1', null);
INSERT INTO `d_character` VALUES ('44', '恩菲尔德', '1', '0', null, null, '0', null);
INSERT INTO `d_character` VALUES ('45', '布莱克', '0', '80', null, null, '0', null);
INSERT INTO `d_character` VALUES ('46', '李', '0', '62', null, null, '0', null);
INSERT INTO `d_character` VALUES ('47', '厄金特', '1', '76', null, null, '0', null);
INSERT INTO `d_character` VALUES ('48', '昆西', '1', '34', null, null, '0', null);
INSERT INTO `d_character` VALUES ('49', '马克唐', '0', '77', null, null, '0', null);
INSERT INTO `d_character` VALUES ('50', '约翰逊', '1', '51', null, null, '1', null);
INSERT INTO `d_character` VALUES ('51', '欧内斯特', '1', '60', null, null, '0', null);
INSERT INTO `d_character` VALUES ('52', '浮士德', '0', '58', null, null, '0', null);
INSERT INTO `d_character` VALUES ('53', '德.圣地亚哥', '0', '72', null, null, '0', null);
INSERT INTO `d_character` VALUES ('54', '温切斯特', '2', '68', null, null, '0', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_form
-- ----------------------------
INSERT INTO `d_form` VALUES ('28', '1', '游戏开始前', '[{\"playerId\":5,\"characterName\":\"珀利\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"杀手（毒药瓶）\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":8,\"characterName\":\"sp伊卡\",\"isSp\":\"1\",\"sign\":null,\"identityDesc\":\"官员\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":10,\"characterName\":\"山纳\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"暴徒\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"查验A\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":11,\"characterName\":\"sp哈代\",\"isSp\":\"1\",\"sign\":null,\"identityDesc\":\"平民\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":12,\"characterName\":\"爱德华\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"先驱\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":13,\"characterName\":\"叶什（妹）\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"巫师\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":14,\"characterName\":\"卓尔\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"间谍\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":15,\"characterName\":\"白瑞摩\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"警察（雨伞）\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":16,\"characterName\":\"赫本\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"平民\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":17,\"characterName\":\"安德安纳\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"医生\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":18,\"characterName\":\"科尔比\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"刺客\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":19,\"characterName\":\"斯达福斯\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"杀手（手枪）\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":20,\"characterName\":\"伊奥克\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"平民\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":21,\"characterName\":\"奎勒\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"平民\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":22,\"characterName\":\"厄金特\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"警察（放大镜）\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":23,\"characterName\":\"sp叶什（兄）\",\"isSp\":\"1\",\"sign\":null,\"identityDesc\":\"小偷\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":24,\"characterName\":\"温切斯特\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"牧师\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":25,\"characterName\":\"昆西\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"平民\",\"camp\":1,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"},{\"playerId\":26,\"characterName\":\"马丁\",\"isSp\":\"0\",\"sign\":null,\"identityDesc\":\"帮众\",\"camp\":2,\"isLife\":1,\"isMute\":0,\"action\":\"\",\"privilege\":\"\",\"feedback\":\"\",\"vote\":\"\",\"submitTime\":null,\"remark\":\"\"}]', '2016-07-25 18:04:41', '2016-07-25 18:05:09');
INSERT INTO `d_form` VALUES ('29', '1', '第一夜', null, '2016-07-25 18:05:09', null);

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
INSERT INTO `d_game` VALUES ('1', '16NV', 'B', '19', '3', '2016-07-15', null, null, null, null);
INSERT INTO `d_game` VALUES ('5', '20NV', 'A', '19', '1', '2016-07-26', null, null, '132697360', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_newspaper
-- ----------------------------
INSERT INTO `d_newspaper` VALUES ('1', '5', '7月5日日刊（开版公告）', '小镇受西部铁路公司200万美元投资垂青', '本市西部仅两站<br>维多利亚讯 据可靠消息，今日下午，西部铁路公司董事会发言人特理·亨德曼表明，其第二大股东亨利.刘易斯（左图）即将对本市行政区域内的维多利亚镇进行大规模投资，由铁路运输业带动铁矿、石油的初期计划已经草拟成案。经济学家称该举措即将带来临近地区就业的重整，治安专家则担心大额外来人员对本地区的影响。中部铁运则表明，在铁路运重创的6月后进行这种冒险之举不具长期眼光。<br>维多利亚镇普通镇民，书记官温彻斯特太太表示，“这预示一种时代的变化。当蒸汽机车最终被内燃机车取代的时候，我们知道有些东西不同了。”', '2版政治：在野党质疑政府监管<br>2版经济：周边带动理论 <br>2版金融：华尔街芝加哥工业指数上升24% <br>7版：维多利亚镇的介绍 <br><br>4版<br>西部铁路公司收到匿名警告信 犯罪专家称或非无稽之谈 <br>芝加哥讯 西部铁路公司芝加哥分所近日收到恐吓信，据平克顿侦探所透露，此信来向可推为维多利亚镇。目前警方没有明确透露信的具体内容，但据称为某一组织的某些人员向西部铁路公司某些高层追索“欠款”，并扬言“你们，都得死”。 <br>有证券交易所表明，6月后的会计工作使证券持有人对西部铁路公司表示乐观，然而始终有声音质疑为何西部铁路公司能在6月的N.劳兄弟公司铁路重大事故后保持账面未有亏损。', '哈代死亡。<br><br>哈代遗言：', '<table>\r\n				<tbody>\r\n					<tr>\r\n						<td>恩菲尔德</td>\r\n						<td align=\"center\">霍尔</td>\r\n						<td align=\"right\">欧内斯特</td>\r\n					</tr>\r\n					<tr>\r\n						<td></td>\r\n						<td></td>\r\n						<td align=\"right\">叶妹</td>\r\n					</tr>\r\n					<tr>\r\n						<td>叶兄</td>\r\n						<td></td>\r\n						<td align=\"right\">安德安纳</td>\r\n					</tr>\r\n					<tr>\r\n						<td>哈代【死亡】</td>\r\n						<td></td>\r\n						<td align=\"right\">马克唐</td>\r\n					</tr>\r\n					<tr>\r\n						<td>白瑞摩</td>\r\n						<td></td>\r\n						<td align=\"right\">圣地亚哥</td>\r\n					</tr>\r\n					<tr>\r\n						<td>赫本</td>\r\n						<td></td>\r\n						<td align=\"right\">科尔比</td>\r\n					</tr>\r\n					<tr>\r\n						<td>莫利</td>\r\n						<td></td>\r\n						<td align=\"right\">（布莱克）</td>\r\n					</tr>\r\n					<tr>\r\n						<td>普拉马逊斯</td>\r\n						<td></td>\r\n						<td align=\"right\">昆西</td>\r\n					</tr>\r\n					<tr>\r\n						<td>艾尔威</td>\r\n						<td align=\"center\">劳伦</td>\r\n						<td align=\"right\">伊卡</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>', '2016-07-25 18:03:37', null, null, '1');
INSERT INTO `d_newspaper` VALUES ('2', '1', '7月5日夜刊（开版公告）', '小镇受西部铁路公司200万美元投资垂青', '本市西部仅两站<br>维多利亚讯 据可靠消息，今日下午，西部铁路公司董事会发言人特理·亨德曼表明，其第二大股东亨利.刘易斯（左图）即将对本市行政区域内的维多利亚镇进行大规模投资，由铁路运输业带动铁矿、石油的初期计划已经草拟成案。经济学家称该举措即将带来临近地区就业的重整，治安专家则担心大额外来人员对本地区的影响。中部铁运则表明，在铁路运重创的6月后进行这种冒险之举不具长期眼光。<br>维多利亚镇普通镇民，书记官温彻斯特太太表示，“这预示一种时代的变化。当蒸汽机车最终被内燃机车取代的时候，我们知道有些东西不同了。”', '2版政治：在野党质疑政府监管<br>2版经济：周边带动理论 <br>2版金融：华尔街芝加哥工业指数上升24%  <br>5版 柏林会议进展不顺 <br>6版 清帝国使者离开纽约 <br>7版：维多利亚镇的介绍<br>8版 独立日烟火不慎造成男童落水 <br><br>4版<br>西部铁路公司收到匿名警告信 犯罪专家称或非无稽之谈 <br>芝加哥讯 西部铁路公司芝加哥分所近日收到恐吓信，据平克顿侦探所透露，此信来向可推为维多利亚镇。目前警方没有明确透露信的具体内容，但据称为某一组织的某些人员向西部铁路公司某些高层追索“欠款”，并扬言“你们，都得死”。 <br>有证券交易所表明，6月后的会计工作使证券持有人对西部铁路公司表示乐观，然而始终有声音质疑为何西部铁路公司能在6月的N.劳兄弟公司铁路重大事故后保持账面未有亏损。', '哈代死亡。<br><br>哈代遗言：', '<table><tbody><tr><td>珀利</td><td align=\"center\">伊卡</td><td align=\"right\">山纳</td></tr><tr><td></td><td></td><td align=\"right\">哈代</td></tr><tr><td>马丁</td><td></td><td align=\"right\">爱德华</td></tr><tr><td>昆西</td><td></td><td align=\"right\">叶什（妹）</td></tr><tr><td>温切斯特</td><td></td><td align=\"right\">卓尔</td></tr><tr><td>叶什（兄）</td><td></td><td align=\"right\">白瑞摩</td></tr><tr><td>厄金特</td><td></td><td align=\"right\">赫本</td></tr><tr><td>奎勒</td><td></td><td align=\"right\">安德安纳</td></tr><tr><td>伊奥克</td><td align=\"center\">斯达福斯</td><td align=\"right\">科尔比</td></tr></tbody></table>', '2016-07-27 17:07:07', '2016-08-05 10:43:07', '2', '1');

-- ----------------------------
-- Table structure for `d_offline_message`
-- ----------------------------
DROP TABLE IF EXISTS `d_offline_message`;
CREATE TABLE `d_offline_message` (
  `id` bigint(11) NOT NULL,
  `user_id` bigint(11) DEFAULT NULL,
  `chat_id` bigint(11) DEFAULT NULL,
  `content` text,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_offline_message
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=1045 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_offline_speech
-- ----------------------------
INSERT INTO `d_offline_speech` VALUES ('847', '4', '52', null);
INSERT INTO `d_offline_speech` VALUES ('848', '6', '52', null);
INSERT INTO `d_offline_speech` VALUES ('849', '5', '52', null);
INSERT INTO `d_offline_speech` VALUES ('850', '7', '52', null);
INSERT INTO `d_offline_speech` VALUES ('851', '8', '52', null);
INSERT INTO `d_offline_speech` VALUES ('852', '9', '52', null);
INSERT INTO `d_offline_speech` VALUES ('853', '10', '52', null);
INSERT INTO `d_offline_speech` VALUES ('854', '11', '52', null);
INSERT INTO `d_offline_speech` VALUES ('855', '12', '52', null);
INSERT INTO `d_offline_speech` VALUES ('856', '13', '52', null);
INSERT INTO `d_offline_speech` VALUES ('857', '14', '52', null);
INSERT INTO `d_offline_speech` VALUES ('858', '15', '52', null);
INSERT INTO `d_offline_speech` VALUES ('859', '16', '52', null);
INSERT INTO `d_offline_speech` VALUES ('860', '17', '52', null);
INSERT INTO `d_offline_speech` VALUES ('861', '18', '52', null);
INSERT INTO `d_offline_speech` VALUES ('862', '19', '52', null);
INSERT INTO `d_offline_speech` VALUES ('863', '20', '52', null);
INSERT INTO `d_offline_speech` VALUES ('864', '21', '52', null);
INSERT INTO `d_offline_speech` VALUES ('865', '2', '53', '2');
INSERT INTO `d_offline_speech` VALUES ('866', '3', '53', '2');
INSERT INTO `d_offline_speech` VALUES ('867', '4', '53', '2');
INSERT INTO `d_offline_speech` VALUES ('868', '6', '53', '2');
INSERT INTO `d_offline_speech` VALUES ('869', '5', '53', '2');
INSERT INTO `d_offline_speech` VALUES ('870', '7', '53', '2');
INSERT INTO `d_offline_speech` VALUES ('871', '8', '53', '2');
INSERT INTO `d_offline_speech` VALUES ('872', '9', '53', '2');
INSERT INTO `d_offline_speech` VALUES ('873', '10', '53', '2');
INSERT INTO `d_offline_speech` VALUES ('874', '11', '53', '2');
INSERT INTO `d_offline_speech` VALUES ('875', '12', '53', '2');
INSERT INTO `d_offline_speech` VALUES ('876', '13', '53', '2');
INSERT INTO `d_offline_speech` VALUES ('877', '14', '53', '2');
INSERT INTO `d_offline_speech` VALUES ('878', '15', '53', '2');
INSERT INTO `d_offline_speech` VALUES ('879', '16', '53', '2');
INSERT INTO `d_offline_speech` VALUES ('880', '17', '53', '2');
INSERT INTO `d_offline_speech` VALUES ('881', '18', '53', '2');
INSERT INTO `d_offline_speech` VALUES ('883', '20', '53', '2');
INSERT INTO `d_offline_speech` VALUES ('884', '21', '53', '2');
INSERT INTO `d_offline_speech` VALUES ('885', '2', '54', '2');
INSERT INTO `d_offline_speech` VALUES ('886', '3', '54', '2');
INSERT INTO `d_offline_speech` VALUES ('887', '4', '54', '2');
INSERT INTO `d_offline_speech` VALUES ('888', '6', '54', '2');
INSERT INTO `d_offline_speech` VALUES ('889', '5', '54', '2');
INSERT INTO `d_offline_speech` VALUES ('890', '7', '54', '2');
INSERT INTO `d_offline_speech` VALUES ('891', '8', '54', '2');
INSERT INTO `d_offline_speech` VALUES ('892', '9', '54', '2');
INSERT INTO `d_offline_speech` VALUES ('893', '10', '54', '2');
INSERT INTO `d_offline_speech` VALUES ('894', '11', '54', '2');
INSERT INTO `d_offline_speech` VALUES ('895', '12', '54', '2');
INSERT INTO `d_offline_speech` VALUES ('896', '13', '54', '2');
INSERT INTO `d_offline_speech` VALUES ('897', '14', '54', '2');
INSERT INTO `d_offline_speech` VALUES ('898', '15', '54', '2');
INSERT INTO `d_offline_speech` VALUES ('899', '16', '54', '2');
INSERT INTO `d_offline_speech` VALUES ('900', '17', '54', '2');
INSERT INTO `d_offline_speech` VALUES ('901', '18', '54', '2');
INSERT INTO `d_offline_speech` VALUES ('903', '20', '54', '2');
INSERT INTO `d_offline_speech` VALUES ('904', '21', '54', '2');
INSERT INTO `d_offline_speech` VALUES ('905', '2', '55', '2');
INSERT INTO `d_offline_speech` VALUES ('906', '3', '55', '2');
INSERT INTO `d_offline_speech` VALUES ('907', '4', '55', '2');
INSERT INTO `d_offline_speech` VALUES ('908', '6', '55', '2');
INSERT INTO `d_offline_speech` VALUES ('909', '5', '55', '2');
INSERT INTO `d_offline_speech` VALUES ('910', '7', '55', '2');
INSERT INTO `d_offline_speech` VALUES ('911', '8', '55', '2');
INSERT INTO `d_offline_speech` VALUES ('912', '9', '55', '2');
INSERT INTO `d_offline_speech` VALUES ('913', '10', '55', '2');
INSERT INTO `d_offline_speech` VALUES ('914', '11', '55', '2');
INSERT INTO `d_offline_speech` VALUES ('915', '12', '55', '2');
INSERT INTO `d_offline_speech` VALUES ('916', '13', '55', '2');
INSERT INTO `d_offline_speech` VALUES ('917', '14', '55', '2');
INSERT INTO `d_offline_speech` VALUES ('918', '15', '55', '2');
INSERT INTO `d_offline_speech` VALUES ('919', '16', '55', '2');
INSERT INTO `d_offline_speech` VALUES ('920', '17', '55', '2');
INSERT INTO `d_offline_speech` VALUES ('921', '18', '55', '2');
INSERT INTO `d_offline_speech` VALUES ('923', '20', '55', '2');
INSERT INTO `d_offline_speech` VALUES ('924', '21', '55', '2');
INSERT INTO `d_offline_speech` VALUES ('925', '2', '56', '2');
INSERT INTO `d_offline_speech` VALUES ('926', '3', '56', '2');
INSERT INTO `d_offline_speech` VALUES ('927', '4', '56', '2');
INSERT INTO `d_offline_speech` VALUES ('928', '6', '56', '2');
INSERT INTO `d_offline_speech` VALUES ('930', '5', '56', '2');
INSERT INTO `d_offline_speech` VALUES ('931', '7', '56', '2');
INSERT INTO `d_offline_speech` VALUES ('932', '8', '56', '2');
INSERT INTO `d_offline_speech` VALUES ('933', '9', '56', '2');
INSERT INTO `d_offline_speech` VALUES ('934', '10', '56', '2');
INSERT INTO `d_offline_speech` VALUES ('935', '11', '56', '2');
INSERT INTO `d_offline_speech` VALUES ('936', '12', '56', '2');
INSERT INTO `d_offline_speech` VALUES ('937', '13', '56', '2');
INSERT INTO `d_offline_speech` VALUES ('938', '14', '56', '2');
INSERT INTO `d_offline_speech` VALUES ('939', '15', '56', '2');
INSERT INTO `d_offline_speech` VALUES ('940', '16', '56', '2');
INSERT INTO `d_offline_speech` VALUES ('941', '17', '56', '2');
INSERT INTO `d_offline_speech` VALUES ('942', '18', '56', '2');
INSERT INTO `d_offline_speech` VALUES ('943', '20', '56', '2');
INSERT INTO `d_offline_speech` VALUES ('944', '21', '56', '2');
INSERT INTO `d_offline_speech` VALUES ('945', '2', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('946', '3', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('947', '4', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('948', '6', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('949', '1', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('950', '5', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('951', '7', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('952', '8', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('953', '9', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('954', '10', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('955', '11', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('956', '12', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('957', '13', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('958', '14', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('959', '15', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('960', '16', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('961', '17', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('962', '18', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('963', '20', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('964', '21', '57', '2');
INSERT INTO `d_offline_speech` VALUES ('965', '2', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('966', '3', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('967', '4', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('968', '6', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('969', '1', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('970', '5', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('971', '7', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('972', '8', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('973', '9', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('974', '10', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('975', '11', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('976', '12', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('977', '13', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('978', '14', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('979', '15', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('980', '16', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('981', '17', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('982', '18', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('983', '20', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('984', '21', '58', '2');
INSERT INTO `d_offline_speech` VALUES ('985', '2', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('986', '3', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('987', '4', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('988', '6', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('989', '1', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('990', '5', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('991', '7', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('992', '8', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('993', '9', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('994', '10', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('995', '11', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('996', '12', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('997', '13', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('998', '14', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('999', '15', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('1000', '16', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('1001', '17', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('1002', '18', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('1003', '20', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('1004', '21', '59', '2');
INSERT INTO `d_offline_speech` VALUES ('1005', '2', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1006', '3', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1007', '4', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1008', '6', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1009', '1', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1010', '5', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1011', '7', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1012', '8', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1013', '9', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1014', '10', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1015', '11', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1016', '12', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1017', '13', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1018', '14', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1019', '15', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1020', '16', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1021', '17', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1022', '18', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1023', '20', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1024', '21', '60', '2');
INSERT INTO `d_offline_speech` VALUES ('1025', '2', '61', '2');
INSERT INTO `d_offline_speech` VALUES ('1026', '3', '61', '2');
INSERT INTO `d_offline_speech` VALUES ('1027', '4', '61', '2');
INSERT INTO `d_offline_speech` VALUES ('1028', '6', '61', '2');
INSERT INTO `d_offline_speech` VALUES ('1029', '1', '61', '2');
INSERT INTO `d_offline_speech` VALUES ('1030', '5', '61', '2');
INSERT INTO `d_offline_speech` VALUES ('1031', '7', '61', '2');
INSERT INTO `d_offline_speech` VALUES ('1032', '8', '61', '2');
INSERT INTO `d_offline_speech` VALUES ('1033', '9', '61', '2');
INSERT INTO `d_offline_speech` VALUES ('1034', '10', '61', '2');
INSERT INTO `d_offline_speech` VALUES ('1035', '11', '61', '2');
INSERT INTO `d_offline_speech` VALUES ('1036', '12', '61', '2');
INSERT INTO `d_offline_speech` VALUES ('1037', '13', '61', '2');
INSERT INTO `d_offline_speech` VALUES ('1038', '14', '61', '2');
INSERT INTO `d_offline_speech` VALUES ('1039', '15', '61', '2');
INSERT INTO `d_offline_speech` VALUES ('1040', '16', '61', '2');
INSERT INTO `d_offline_speech` VALUES ('1041', '17', '61', '2');
INSERT INTO `d_offline_speech` VALUES ('1042', '18', '61', '2');
INSERT INTO `d_offline_speech` VALUES ('1043', '20', '61', '2');
INSERT INTO `d_offline_speech` VALUES ('1044', '21', '61', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

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
INSERT INTO `d_player_record` VALUES ('5', '6', '0', '1', '15', '杀手（毒药瓶）', '1', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('8', '5', '1', '0', '10', '官员', '2', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('10', '40', '0', '0', '22', '暴徒', '3', '2', '1', '0', '红色信封 山纳', '', '', '', '2016-07-29 16:38:23', '');
INSERT INTO `d_player_record` VALUES ('11', '19', '1', '0', '11', '平民', '4', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('12', '1', '0', '1', '12', '先驱', '5', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('13', '35', '0', '0', '21', '巫师', '6', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('14', '38', '0', '0', '20', '间谍', '7', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('15', '4', '0', '0', '4', '警察（雨伞）', '8', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('16', '37', '0', '0', '11', '平民', '9', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('17', '30', '0', '0', '9', '医生', '10', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('18', '16', '0', '0', '8', '刺客', '11', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('19', '21', '0', '0', '14', '杀手（手枪）', '12', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('20', '9', '0', '0', '11', '平民', '13', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('21', '27', '0', '0', '11', '平民', '14', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('22', '47', '0', '1', '2', '警察（放大镜）', '15', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('23', '41', '1', '0', '19', '小偷', '16', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('24', '54', '0', '0', '7', '牧师', '17', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('25', '48', '0', '0', '11', '平民', '18', '1', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('26', '2', '0', '1', '23', '帮众', '19', '2', '1', '0', '', '', '', '', null, '');
INSERT INTO `d_player_record` VALUES ('33', '2', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `d_replace_skin`
-- ----------------------------
DROP TABLE IF EXISTS `d_replace_skin`;
CREATE TABLE `d_replace_skin` (
  `id` bigint(11) NOT NULL,
  `player_id` bigint(11) DEFAULT NULL,
  `character_name` varchar(32) DEFAULT NULL,
  `character_avatar` varchar(32) DEFAULT NULL,
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
INSERT INTO `d_sign` VALUES ('1', '警察', '手铐', '1', null);
INSERT INTO `d_sign` VALUES ('2', '警察', '放大镜', '1', null);
INSERT INTO `d_sign` VALUES ('3', '警察', '星型警徽', '1', null);
INSERT INTO `d_sign` VALUES ('4', '警察', '雨伞', '1', null);
INSERT INTO `d_sign` VALUES ('5', '警察', '问号', '1', null);
INSERT INTO `d_sign` VALUES ('6', '警察', '天窗', '1', null);
INSERT INTO `d_sign` VALUES ('7', '牧师', '十字架', '1', null);
INSERT INTO `d_sign` VALUES ('8', '刺客', '弓箭', '1', null);
INSERT INTO `d_sign` VALUES ('9', '医生', '针筒', '1', null);
INSERT INTO `d_sign` VALUES ('10', '官员', '橡皮印章', '1', null);
INSERT INTO `d_sign` VALUES ('11', '平民', '钱币', '1', null);
INSERT INTO `d_sign` VALUES ('12', '先驱', '燃烧的钱币', '1', null);
INSERT INTO `d_sign` VALUES ('13', '杀手', '刀', '2', null);
INSERT INTO `d_sign` VALUES ('14', '杀手', '手枪', '2', null);
INSERT INTO `d_sign` VALUES ('15', '杀手', '毒药瓶', '2', null);
INSERT INTO `d_sign` VALUES ('16', '杀手', '套索', '2', null);
INSERT INTO `d_sign` VALUES ('17', '杀手', '棍', '2', null);
INSERT INTO `d_sign` VALUES ('18', '杀手', '扑克牌', '2', null);
INSERT INTO `d_sign` VALUES ('19', '小偷', '钳子', '2', null);
INSERT INTO `d_sign` VALUES ('20', '间谍', '眼镜', '2', null);
INSERT INTO `d_sign` VALUES ('21', '巫师', '手杖', '2', null);
INSERT INTO `d_sign` VALUES ('22', '暴徒', '炸药', '2', null);
INSERT INTO `d_sign` VALUES ('23', '帮众', '沾血的钱币', '2', null);
INSERT INTO `d_sign` VALUES ('24', null, '契约', '3', null);

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
  `type` int(1) DEFAULT NULL COMMENT '1 发言 2 动作',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_speech
-- ----------------------------
INSERT INTO `d_speech` VALUES ('52', '10', '40', null, '2', '说一句话<br>说两句话', '2016-08-04 17:31:50', '1');
INSERT INTO `d_speech` VALUES ('53', '10', '40', null, '2', '我就是我，是不一样的焰火', '2016-08-05 11:01:22', '1');
INSERT INTO `d_speech` VALUES ('54', '10', '40', null, '2', '啦啦啦啦', '2016-08-05 11:01:31', '1');
INSERT INTO `d_speech` VALUES ('55', '10', '40', null, '2', '西部铁路公司收到匿名警告信 犯罪专家称或非无稽之谈 <br>芝加哥讯 西部铁路公司芝加哥分所近日收到恐吓信，据平克顿侦探所透露，此信来向可推为维多利亚镇。目前警方没有明确透露信的具体内容，但据称为某一组织的某些人员向西部铁路公司某些高层追索“欠款”，并扬言“你们，都得死”。 <br>有证券交易所表明，6月后的会计工作使证券持有人对西部铁路公司表示乐观，然而始终有声音质疑为何西部铁路公司能在6月的N.劳兄弟公司铁路重大事故后保持账面未有亏损。', '2016-08-05 11:02:30', '1');
INSERT INTO `d_speech` VALUES ('56', '24', '54', null, '2', '123213', '2016-08-05 11:38:15', '1');
INSERT INTO `d_speech` VALUES ('57', '24', '温切斯特', null, '2', '', '2016-08-05 19:14:30', '1');
INSERT INTO `d_speech` VALUES ('58', '24', '温切斯特', null, '2', '', '2016-08-05 19:15:35', '1');
INSERT INTO `d_speech` VALUES ('59', '24', '温切斯特', null, '2', '', '2016-08-05 19:16:10', '1');
INSERT INTO `d_speech` VALUES ('60', '24', '霍尔', null, '2', '', '2016-08-05 19:16:35', '1');
INSERT INTO `d_speech` VALUES ('61', '24', '温切斯特', null, '2', '', '2016-08-05 19:17:12', '1');

-- ----------------------------
-- Table structure for `d_user`
-- ----------------------------
DROP TABLE IF EXISTS `d_user`;
CREATE TABLE `d_user` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_user
-- ----------------------------
INSERT INTO `d_user` VALUES ('1', 'jack3173', 'yesterday', '小风', null, null, null);
INSERT INTO `d_user` VALUES ('2', 'jack3174', 'yesterday', '大风', null, '2016-07-05 13:47:10', null);
INSERT INTO `d_user` VALUES ('3', 'jack3175', 'yesterday', '微风', null, '2016-07-06 13:12:35', null);
INSERT INTO `d_user` VALUES ('4', 'jack3176', 'yesterday', '飓风', null, '2016-07-06 15:54:53', null);
INSERT INTO `d_user` VALUES ('5', 'jack3178', 'yesterday', '轻风', null, '2016-07-11 14:50:47', null);
INSERT INTO `d_user` VALUES ('6', 'jack3179', 'yesterday', '凉风', null, '2016-07-15 11:45:15', null);
INSERT INTO `d_user` VALUES ('7', 'jack3180', 'yesterday', '大大', null, '2016-07-18 10:39:08', null);
INSERT INTO `d_user` VALUES ('8', 'jack3181', 'yesterday', '小小', null, '2016-07-19 10:39:26', null);
INSERT INTO `d_user` VALUES ('9', 'jack3182', 'yesterday', '多多', null, '2016-07-18 10:39:50', null);
INSERT INTO `d_user` VALUES ('10', 'jack3183', 'yesterday', '少少', null, '2016-07-18 10:40:26', null);
INSERT INTO `d_user` VALUES ('11', 'jack3184', 'yesterday', '慢慢', null, '2016-07-18 10:40:45', null);
INSERT INTO `d_user` VALUES ('12', 'jack3185', 'yesterday', '快快', null, '2016-07-18 10:41:03', null);
INSERT INTO `d_user` VALUES ('13', 'jack3186', 'yesterday', '宁静', null, '2016-07-19 10:41:23', null);
INSERT INTO `d_user` VALUES ('14', 'jack3187', 'yesterday', '行行', null, '2016-07-18 10:41:38', null);
INSERT INTO `d_user` VALUES ('15', 'jack3188', 'yesterday', '是的', null, '2016-07-18 10:58:11', null);
INSERT INTO `d_user` VALUES ('16', 'jack3189', 'yesterday', '期望', null, '2016-07-18 10:58:27', null);
INSERT INTO `d_user` VALUES ('17', 'jack3190', 'yesterday', '欧尼', null, '2016-07-18 10:58:45', null);
INSERT INTO `d_user` VALUES ('18', 'jack3191', 'yesterday', '而我', null, '2016-07-18 10:59:04', null);
INSERT INTO `d_user` VALUES ('19', 'jack3192', 'yesterday', '人头', null, '2016-07-18 10:59:18', null);
INSERT INTO `d_user` VALUES ('20', 'jack3193', 'yesterday', '框架', null, '2016-07-18 10:59:32', null);
INSERT INTO `d_user` VALUES ('21', 'jack3194', 'yesterday', '吃饭', null, '2016-07-18 11:00:25', null);
INSERT INTO `d_user` VALUES ('22', 'jack3172', 'yesterday', '美美', null, '2016-07-25 17:52:37', null);
INSERT INTO `d_user` VALUES ('23', 'jack3171', 'yesterday', '飞飞', null, '2016-07-29 10:51:08', null);
INSERT INTO `d_user` VALUES ('24', 'jack3170', 'yesterday', '随机', null, '2016-07-29 15:55:30', null);
