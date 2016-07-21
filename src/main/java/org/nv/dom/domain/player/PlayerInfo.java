package org.nv.dom.domain.player;

public class PlayerInfo {
	
	/** 玩家id */
	private long playerId;
	/** 角色名称 */
	private String characterName;
	/** 是否sp */
	private String isSp;
	/** 签代码 */
	private Integer sign;
	/** 身份描述 */
	private String identityDesc;
	/** 阵营 */
	private Integer camp;
	/** 存活 */
	private Integer isLife;
	/** 禁言 */
	private Integer isMute;
	/** 行动 */
	private String action;
	/** 特权 */
	private String privilege;
	/** 反馈 */
	private String feedback;
	/** 投票 */
	private String vote;
	/** 提交时间 */
	private String submitTime;
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
	public String getIsSp() {
		return isSp;
	}
	public void setIsSp(String isSp) {
		this.isSp = isSp;
	}
	public Integer getSign() {
		return sign;
	}
	public void setSign(Integer sign) {
		this.sign = sign;
	}
	public String getIdentityDesc() {
		return identityDesc;
	}
	public void setIdentityDesc(String identityDesc) {
		this.identityDesc = identityDesc;
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
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getPrivilege() {
		return privilege;
	}
	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public String getVote() {
		return vote;
	}
	public void setVote(String vote) {
		this.vote = vote;
	}
	public String getSubmitTime() {
		return submitTime;
	}
	public void setSubmitTime(String submitTime) {
		this.submitTime = submitTime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	

}
