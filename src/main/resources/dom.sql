/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : dom

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-07-24 23:15:51
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
  `has_sp` varchar(1) DEFAULT NULL,
  `tag` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_character
-- ----------------------------
INSERT INTO `d_character` VALUES ('1', '爱德华', '0', '24', null, '1', null);
INSERT INTO `d_character` VALUES ('2', '马丁', '0', '31', null, '0', null);
INSERT INTO `d_character` VALUES ('3', '托马斯', '0', '29', null, '0', null);
INSERT INTO `d_character` VALUES ('4', '白瑞摩', '0', '33', null, '0', null);
INSERT INTO `d_character` VALUES ('5', '伊卡', '1', '20', null, '1', null);
INSERT INTO `d_character` VALUES ('6', '珀利', '1', '24', null, '0', null);
INSERT INTO `d_character` VALUES ('7', '莫利', '1', '28', null, '1', null);
INSERT INTO `d_character` VALUES ('8', '沃兹沃斯', '1', '27', null, '0', null);
INSERT INTO `d_character` VALUES ('9', '伊奥克', '0', '21', null, '0', null);
INSERT INTO `d_character` VALUES ('10', '奈斯', '0', '50', null, '0', null);
INSERT INTO `d_character` VALUES ('11', '曼顿', '0', '56', null, '0', null);
INSERT INTO `d_character` VALUES ('12', '朗斯特里特', '0', '43', null, '0', null);
INSERT INTO `d_character` VALUES ('13', '普拉马逊斯', '0', '45', null, '0', null);
INSERT INTO `d_character` VALUES ('14', '舒马赫', '1', '53', null, '0', null);
INSERT INTO `d_character` VALUES ('15', '道格拉斯', '1', '47', null, '0', null);
INSERT INTO `d_character` VALUES ('16', '科尔比', '1', '40', null, '0', null);
INSERT INTO `d_character` VALUES ('17', '欧希玛', '1', '49', null, '0', null);
INSERT INTO `d_character` VALUES ('18', '梅特卡夫', '0', '38', null, '0', null);
INSERT INTO `d_character` VALUES ('19', '哈代', '0', '63', null, '1', null);
INSERT INTO `d_character` VALUES ('20', '盖茨', '0', '66', null, '0', null);
INSERT INTO `d_character` VALUES ('21', '斯达福斯', '1', '67', null, '0', null);
INSERT INTO `d_character` VALUES ('22', '托兰', '1', '74', null, '0', null);
INSERT INTO `d_character` VALUES ('23', '查西', '0', '71', null, '0', null);
INSERT INTO `d_character` VALUES ('24', '斯布兰奇', '1', '64', null, '0', null);
INSERT INTO `d_character` VALUES ('25', '坦尼森', '1', '69', null, '0', null);
INSERT INTO `d_character` VALUES ('26', '德雷顿', '1', '65', null, '0', null);
INSERT INTO `d_character` VALUES ('27', '奎勒', '0', '78', null, '0', null);
INSERT INTO `d_character` VALUES ('28', '威廉姆斯', '0', '48', null, '1', null);
INSERT INTO `d_character` VALUES ('29', '尤里', '0', '36', null, '0', null);
INSERT INTO `d_character` VALUES ('30', '安德安纳', '0', '30', null, '0', null);
INSERT INTO `d_character` VALUES ('31', '劳伦', '0', '52', null, '1', null);
INSERT INTO `d_character` VALUES ('32', '豪', '1', '46', null, '0', null);
INSERT INTO `d_character` VALUES ('33', '阿修', '1', '45', null, '0', null);
INSERT INTO `d_character` VALUES ('34', '卡布莱', '1', '55', null, '0', null);
INSERT INTO `d_character` VALUES ('35', '叶什（妹）', '1', '22', null, '0', null);
INSERT INTO `d_character` VALUES ('36', '扬', '1', '26', null, '0', null);
INSERT INTO `d_character` VALUES ('37', '赫本', '1', '23', null, '0', null);
INSERT INTO `d_character` VALUES ('38', '卓尔', '0', '39', null, '1', null);
INSERT INTO `d_character` VALUES ('39', '艾尔威', '1', '73', null, '0', null);
INSERT INTO `d_character` VALUES ('40', '山纳', '0', '54', null, '0', null);
INSERT INTO `d_character` VALUES ('41', '叶什（兄）', '0', '35', null, '1', null);
INSERT INTO `d_character` VALUES ('42', '钱德勒', '2', '41', null, '0', null);
INSERT INTO `d_character` VALUES ('43', '霍尔', '1', '20', null, '1', null);
INSERT INTO `d_character` VALUES ('44', '恩菲尔德', '1', '0', null, '0', null);
INSERT INTO `d_character` VALUES ('45', '布莱克', '0', '80', null, '0', null);
INSERT INTO `d_character` VALUES ('46', '李', '0', '62', null, '0', null);
INSERT INTO `d_character` VALUES ('47', '厄金特', '1', '76', null, '0', null);
INSERT INTO `d_character` VALUES ('48', '昆西', '1', '34', null, '0', null);
INSERT INTO `d_character` VALUES ('49', '马克唐', '0', '77', null, '0', null);
INSERT INTO `d_character` VALUES ('50', '约翰逊', '1', '51', null, '0', null);
INSERT INTO `d_character` VALUES ('51', '欧内斯特', '1', '60', null, '0', null);
INSERT INTO `d_character` VALUES ('52', '浮士德', '0', '58', null, '0', null);
INSERT INTO `d_character` VALUES ('53', '德.圣地亚哥', '0', '72', null, '0', null);
INSERT INTO `d_character` VALUES ('54', '温切斯特', '2', '68', null, '0', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_form
-- ----------------------------
INSERT INTO `d_form` VALUES ('4', '1', '游戏开始前', null, '2016-07-24 11:24:57', null);
INSERT INTO `d_form` VALUES ('20', '1', '', '\n										\n											<tr>\n												<td>珀利</td>\n												<td><input type=\"text\" value=\"巫师\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td>\n													<div class=\"am-btn-toolbar\">\n														<div class=\"am-btn-group am-btn-group-xs\">\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-secondary\" title=\"更改状态\" onclick=\"showPlayerStatus(0)\"><span class=\"am-icon-pencil-square-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs\" title=\"发送消息\"><span class=\"am-icon-paper-plane-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-success\" title=\"查看提交时间\"><span class=\"am-icon-clock-o\"></span></button>\n														</div>\n													</div>\n												</td>\n											</tr>\n										\n											<tr>\n												<td>sp伊卡</td>\n												<td><input type=\"text\" value=\"平民\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td>\n													<div class=\"am-btn-toolbar\">\n														<div class=\"am-btn-group am-btn-group-xs\">\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-secondary\" title=\"更改状态\" onclick=\"showPlayerStatus(1)\"><span class=\"am-icon-pencil-square-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs\" title=\"发送消息\"><span class=\"am-icon-paper-plane-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-success\" title=\"查看提交时间\"><span class=\"am-icon-clock-o\"></span></button>\n														</div>\n													</div>\n												</td>\n											</tr>\n										\n											<tr>\n												<td>山纳</td>\n												<td><input type=\"text\" value=\"小偷\"></td>\n												<td><input type=\"text\" value=\"刺杀A 留凶器于B\"></td>\n												<td><input type=\"text\" value=\"挪凶器于C\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td>\n													<div class=\"am-btn-toolbar\">\n														<div class=\"am-btn-group am-btn-group-xs\">\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-secondary\" title=\"更改状态\" onclick=\"showPlayerStatus(2)\"><span class=\"am-icon-pencil-square-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs\" title=\"发送消息\"><span class=\"am-icon-paper-plane-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-success\" title=\"查看提交时间\"><span class=\"am-icon-clock-o\"></span></button>\n														</div>\n													</div>\n												</td>\n											</tr>\n										\n											<tr>\n												<td>sp哈代</td>\n												<td><input type=\"text\" value=\"平民\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td>\n													<div class=\"am-btn-toolbar\">\n														<div class=\"am-btn-group am-btn-group-xs\">\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-secondary\" title=\"更改状态\" onclick=\"showPlayerStatus(3)\"><span class=\"am-icon-pencil-square-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs\" title=\"发送消息\"><span class=\"am-icon-paper-plane-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-success\" title=\"查看提交时间\"><span class=\"am-icon-clock-o\"></span></button>\n														</div>\n													</div>\n												</td>\n											</tr>\n										\n											<tr>\n												<td>爱德华</td>\n												<td><input type=\"text\" value=\"先驱\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td>\n													<div class=\"am-btn-toolbar\">\n														<div class=\"am-btn-group am-btn-group-xs\">\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-secondary\" title=\"更改状态\" onclick=\"showPlayerStatus(4)\"><span class=\"am-icon-pencil-square-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs\" title=\"发送消息\"><span class=\"am-icon-paper-plane-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-success\" title=\"查看提交时间\"><span class=\"am-icon-clock-o\"></span></button>\n														</div>\n													</div>\n												</td>\n											</tr>\n										\n											<tr>\n												<td>叶什（妹）</td>\n												<td><input type=\"text\" value=\"杀手（手枪）\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td>\n													<div class=\"am-btn-toolbar\">\n														<div class=\"am-btn-group am-btn-group-xs\">\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-secondary\" title=\"更改状态\" onclick=\"showPlayerStatus(5)\"><span class=\"am-icon-pencil-square-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs\" title=\"发送消息\"><span class=\"am-icon-paper-plane-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-success\" title=\"查看提交时间\"><span class=\"am-icon-clock-o\"></span></button>\n														</div>\n													</div>\n												</td>\n											</tr>\n										\n											<tr>\n												<td>卓尔</td>\n												<td><input type=\"text\" value=\"官员\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td>\n													<div class=\"am-btn-toolbar\">\n														<div class=\"am-btn-group am-btn-group-xs\">\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-secondary\" title=\"更改状态\" onclick=\"showPlayerStatus(6)\"><span class=\"am-icon-pencil-square-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs\" title=\"发送消息\"><span class=\"am-icon-paper-plane-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-success\" title=\"查看提交时间\"><span class=\"am-icon-clock-o\"></span></button>\n														</div>\n													</div>\n												</td>\n											</tr>\n										\n											<tr>\n												<td>白瑞摩</td>\n												<td><input type=\"text\" value=\"暴徒\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td>\n													<div class=\"am-btn-toolbar\">\n														<div class=\"am-btn-group am-btn-group-xs\">\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-secondary\" title=\"更改状态\" onclick=\"showPlayerStatus(7)\"><span class=\"am-icon-pencil-square-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs\" title=\"发送消息\"><span class=\"am-icon-paper-plane-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-success\" title=\"查看提交时间\"><span class=\"am-icon-clock-o\"></span></button>\n														</div>\n													</div>\n												</td>\n											</tr>\n										\n											<tr>\n												<td>赫本</td>\n												<td><input type=\"text\" value=\"杀手（刀）\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td>\n													<div class=\"am-btn-toolbar\">\n														<div class=\"am-btn-group am-btn-group-xs\">\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-secondary\" title=\"更改状态\" onclick=\"showPlayerStatus(8)\"><span class=\"am-icon-pencil-square-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs\" title=\"发送消息\"><span class=\"am-icon-paper-plane-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-success\" title=\"查看提交时间\"><span class=\"am-icon-clock-o\"></span></button>\n														</div>\n													</div>\n												</td>\n											</tr>\n										\n											<tr>\n												<td>安德安纳</td>\n												<td><input type=\"text\" value=\"平民\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td>\n													<div class=\"am-btn-toolbar\">\n														<div class=\"am-btn-group am-btn-group-xs\">\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-secondary\" title=\"更改状态\" onclick=\"showPlayerStatus(9)\"><span class=\"am-icon-pencil-square-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs\" title=\"发送消息\"><span class=\"am-icon-paper-plane-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-success\" title=\"查看提交时间\"><span class=\"am-icon-clock-o\"></span></button>\n														</div>\n													</div>\n												</td>\n											</tr>\n										\n											<tr>\n												<td>科尔比</td>\n												<td><input type=\"text\" value=\"警察（手铐）\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td>\n													<div class=\"am-btn-toolbar\">\n														<div class=\"am-btn-group am-btn-group-xs\">\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-secondary\" title=\"更改状态\" onclick=\"showPlayerStatus(10)\"><span class=\"am-icon-pencil-square-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs\" title=\"发送消息\"><span class=\"am-icon-paper-plane-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-success\" title=\"查看提交时间\"><span class=\"am-icon-clock-o\"></span></button>\n														</div>\n													</div>\n												</td>\n											</tr>\n										\n											<tr>\n												<td>斯达福斯</td>\n												<td><input type=\"text\" value=\"平民\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td>\n													<div class=\"am-btn-toolbar\">\n														<div class=\"am-btn-group am-btn-group-xs\">\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-secondary\" title=\"更改状态\" onclick=\"showPlayerStatus(11)\"><span class=\"am-icon-pencil-square-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs\" title=\"发送消息\"><span class=\"am-icon-paper-plane-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-success\" title=\"查看提交时间\"><span class=\"am-icon-clock-o\"></span></button>\n														</div>\n													</div>\n												</td>\n											</tr>\n										\n											<tr>\n												<td>伊奥克</td>\n												<td><input type=\"text\" value=\"牧师\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td>\n													<div class=\"am-btn-toolbar\">\n														<div class=\"am-btn-group am-btn-group-xs\">\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-secondary\" title=\"更改状态\" onclick=\"showPlayerStatus(12)\"><span class=\"am-icon-pencil-square-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs\" title=\"发送消息\"><span class=\"am-icon-paper-plane-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-success\" title=\"查看提交时间\"><span class=\"am-icon-clock-o\"></span></button>\n														</div>\n													</div>\n												</td>\n											</tr>\n										\n											<tr>\n												<td>奎勒</td>\n												<td><input type=\"text\" value=\"平民\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td>\n													<div class=\"am-btn-toolbar\">\n														<div class=\"am-btn-group am-btn-group-xs\">\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-secondary\" title=\"更改状态\" onclick=\"showPlayerStatus(13)\"><span class=\"am-icon-pencil-square-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs\" title=\"发送消息\"><span class=\"am-icon-paper-plane-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-success\" title=\"查看提交时间\"><span class=\"am-icon-clock-o\"></span></button>\n														</div>\n													</div>\n												</td>\n											</tr>\n										\n											<tr>\n												<td>厄金特</td>\n												<td><input type=\"text\" value=\"警察（放大镜）\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td>\n													<div class=\"am-btn-toolbar\">\n														<div class=\"am-btn-group am-btn-group-xs\">\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-secondary\" title=\"更改状态\" onclick=\"showPlayerStatus(14)\"><span class=\"am-icon-pencil-square-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs\" title=\"发送消息\"><span class=\"am-icon-paper-plane-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-success\" title=\"查看提交时间\"><span class=\"am-icon-clock-o\"></span></button>\n														</div>\n													</div>\n												</td>\n											</tr>\n										\n											<tr>\n												<td>sp叶什（兄）</td>\n												<td><input type=\"text\" value=\"间谍\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td>\n													<div class=\"am-btn-toolbar\">\n														<div class=\"am-btn-group am-btn-group-xs\">\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-secondary\" title=\"更改状态\" onclick=\"showPlayerStatus(15)\"><span class=\"am-icon-pencil-square-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs\" title=\"发送消息\"><span class=\"am-icon-paper-plane-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-success\" title=\"查看提交时间\"><span class=\"am-icon-clock-o\"></span></button>\n														</div>\n													</div>\n												</td>\n											</tr>\n										\n											<tr>\n												<td>温切斯特</td>\n												<td><input type=\"text\" value=\"医生\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td>\n													<div class=\"am-btn-toolbar\">\n														<div class=\"am-btn-group am-btn-group-xs\">\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-secondary\" title=\"更改状态\" onclick=\"showPlayerStatus(16)\"><span class=\"am-icon-pencil-square-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs\" title=\"发送消息\"><span class=\"am-icon-paper-plane-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-success\" title=\"查看提交时间\"><span class=\"am-icon-clock-o\"></span></button>\n														</div>\n													</div>\n												</td>\n											</tr>\n										\n											<tr>\n												<td>昆西</td>\n												<td><input type=\"text\" value=\"刺客\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td>\n													<div class=\"am-btn-toolbar\">\n														<div class=\"am-btn-group am-btn-group-xs\">\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-secondary\" title=\"更改状态\" onclick=\"showPlayerStatus(17)\"><span class=\"am-icon-pencil-square-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs\" title=\"发送消息\"><span class=\"am-icon-paper-plane-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-success\" title=\"查看提交时间\"><span class=\"am-icon-clock-o\"></span></button>\n														</div>\n													</div>\n												</td>\n											</tr>\n										\n											<tr>\n												<td>马丁</td>\n												<td><input type=\"text\" value=\"帮众\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td><input type=\"text\" value=\"\"></td>\n												<td>\n													<div class=\"am-btn-toolbar\">\n														<div class=\"am-btn-group am-btn-group-xs\">\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-secondary\" title=\"更改状态\" onclick=\"showPlayerStatus(18)\"><span class=\"am-icon-pencil-square-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs\" title=\"发送消息\"><span class=\"am-icon-paper-plane-o\"></span></button>\n															<button type=\"button\" class=\"am-btn am-btn-default am-btn-xs am-text-success\" title=\"查看提交时间\"><span class=\"am-icon-clock-o\"></span></button>\n														</div>\n													</div>\n												</td>\n											</tr>\n										\n									', '2016-07-24 23:14:02', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_game
-- ----------------------------
INSERT INTO `d_game` VALUES ('1', '16NV', 'B', '19', '3', '2016-07-14', null, null, null, null);

-- ----------------------------
-- Table structure for `d_player`
-- ----------------------------
DROP TABLE IF EXISTS `d_player`;
CREATE TABLE `d_player` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) DEFAULT NULL,
  `role` varchar(32) DEFAULT NULL,
  `game_id` bigint(11) DEFAULT NULL,
  `status` int(5) DEFAULT NULL COMMENT '0 已报名 1待选外在角色 2待3选1 3已选外在身份 4已查看实际身份',
  `apply_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_player
-- ----------------------------
INSERT INTO `d_player` VALUES ('1', '2', 'judger', '1', null, '0000-00-00 00:00:00');
INSERT INTO `d_player` VALUES ('2', '3', 'judger', '1', null, '0000-00-00 00:00:00');
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
INSERT INTO `d_player_record` VALUES ('5', '6', '0', '1', null, '巫师', '2', '1', '0', '', '', '', null, null, null);
INSERT INTO `d_player_record` VALUES ('8', '5', '1', '0', null, '平民', '1', '1', '0', '', '', '', null, null, null);
INSERT INTO `d_player_record` VALUES ('10', '40', '0', '0', null, '小偷', '2', '1', '0', '刺杀A 留凶器于B', '挪凶器于C', '', '', null, null);
INSERT INTO `d_player_record` VALUES ('11', '19', '1', '0', null, '平民', '1', '1', '0', '', '', '', null, null, null);
INSERT INTO `d_player_record` VALUES ('12', '1', '0', '1', null, '先驱', '1', '1', '0', '', '', '', null, null, null);
INSERT INTO `d_player_record` VALUES ('13', '35', '0', '0', null, '杀手（手枪）', '2', '1', '0', '', '', '', null, null, null);
INSERT INTO `d_player_record` VALUES ('14', '38', '0', '0', null, '官员', '1', '1', '0', '', '', '', null, null, null);
INSERT INTO `d_player_record` VALUES ('15', '4', '0', '0', null, '暴徒', '2', '1', '0', '', '', '', null, null, null);
INSERT INTO `d_player_record` VALUES ('16', '37', '0', '0', null, '杀手（刀）', '2', '1', '0', '', '', '', null, null, null);
INSERT INTO `d_player_record` VALUES ('17', '30', '0', '0', null, '平民', '1', '1', '0', '', '', '', null, null, null);
INSERT INTO `d_player_record` VALUES ('18', '16', '0', '0', null, '警察（手铐）', '1', '1', '0', '', '', '', null, null, null);
INSERT INTO `d_player_record` VALUES ('19', '21', '0', '0', null, '平民', '1', '1', '0', '', '', '', null, null, null);
INSERT INTO `d_player_record` VALUES ('20', '9', '0', '0', null, '牧师', '1', '1', '0', '', '', '', null, null, null);
INSERT INTO `d_player_record` VALUES ('21', '27', '0', '0', null, '平民', '1', '1', '0', '', '', '', null, null, null);
INSERT INTO `d_player_record` VALUES ('22', '47', '0', '1', null, '警察（放大镜）', '1', '1', '0', '', '', '', null, null, null);
INSERT INTO `d_player_record` VALUES ('23', '41', '1', '0', null, '间谍', '2', '1', '0', '', '', '', null, null, null);
INSERT INTO `d_player_record` VALUES ('24', '54', '0', '0', null, '医生', '1', '1', '0', '', '', '', null, null, null);
INSERT INTO `d_player_record` VALUES ('25', '48', '0', '0', null, '刺客', '1', '1', '0', '', '', '', null, null, null);
INSERT INTO `d_player_record` VALUES ('26', '2', '0', '1', null, '帮众', '2', '1', '0', '', '', '', null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

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
