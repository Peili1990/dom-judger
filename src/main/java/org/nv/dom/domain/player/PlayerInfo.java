package org.nv.dom.domain.player;

import java.io.Serializable;

public class PlayerInfo implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** 玩家id */
	private long playerId;
	/** 角色名称 */
	private String characterName;
	/** 是否sp */
	private Integer isSp;
	/** 签代码 */
	private Integer sign;
	/** 是否特殊身份 */
	private Integer isSpecial;
	/** 身份描述 */
	private String identityDesc;
	/** 性别 */
	private Integer sex;
	/** 位置 */
	private Integer position;
	/** 是否在桌位表里 */
	private Integer hasPosition;
	/** 阵营 */
	private Integer camp;
	/** 存活 */
	private Integer isLife;
	/** 禁言 */
	private Integer isMute;
	/** 行动 */
	private String lastOperation;
	/** 反馈 */
	private String lastFeedback;
	/** 备注 */
	private String remark;
	
	public long getPlayerId() {
		return playerId;
	}
	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}
	public String getCharacterName() {
		return characterName;
	}
	public void setCharacterName(String characterName) {
		this.characterName = characterName;
	}
	public Integer getIsSp() {
		return isSp;
	}
	public void setIsSp(Integer isSp) {
		this.isSp = isSp;
	}
	public Integer getSign() {
		return sign;
	}
	public void setSign(Integer sign) {
		this.sign = sign;
	}
	public Integer getIsSpecial() {
		return isSpecial;
	}
	public void setIsSpecial(Integer isSpecial) {
		this.isSpecial = isSpecial;
	}
	public String getIdentityDesc() {
		return identityDesc;
	}
	public void setIdentityDesc(String identityDesc) {
		this.identityDesc = identityDesc;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Integer getPosition() {
		return position;
	}
	public void setPosition(Integer position) {
		this.position = position;
	}
	public Integer getHasPosition() {
		return hasPosition;
	}
	public void setHasPosition(Integer hasPosition) {
		this.hasPosition = hasPosition;
	}
	public Integer getCamp() {
		return camp;
	}
	public void setCamp(Integer camp) {
		this.camp = camp;
	}
	public Integer getIsLife() {
		return isLife;
	}
	public void setIsLife(Integer isLife) {
		this.isLife = isLife;
	}
	public Integer getIsMute() {
		return isMute;
	}
	public void setIsMute(Integer isMute) {
		this.isMute = isMute;
	}
	public String getLastOperation() {
		return lastOperation;
	}
	public void setLastOperation(String lastOperation) {
		this.lastOperation = lastOperation;
	}
	public String getLastFeedback() {
		return lastFeedback;
	}
	public void setLastFeedback(String lastFeedback) {
		this.lastFeedback = lastFeedback;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	

}
