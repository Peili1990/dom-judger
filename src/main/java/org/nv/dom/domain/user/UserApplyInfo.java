package org.nv.dom.domain.user;

public class UserApplyInfo {
	
	/** 用户id */
	private long userId;
	/** 玩家id */
	private long playerId;
	/** 用户昵称 */
	private String nickname;
	/** 玩家状态描述 */
	private String statusDesc;
	/** 是否选sp */
	private String isSp;
	/** 角色id */
	private Integer characterId;
	/** 角色名称 */
	private String characterName;
	/** 身份代码 */
	private Integer identity;
	/** 是否申请先驱  */
	private String applyPioneer;
	/** 报名时间 */
	private String applyTime;
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public long getPlayerId() {
		return playerId;
	}
	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getStatusDesc() {
		return statusDesc;
	}
	public void setStatusDesc(String statusDesc) {
		this.statusDesc = statusDesc;
	}
	public String getIsSp() {
		return isSp;
	}
	public void setIsSp(String isSp) {
		this.isSp = isSp;
	}
	public Integer getCharacterId() {
		return characterId;
	}
	public void setCharacterId(Integer characterId) {
		this.characterId = characterId;
	}
	public Integer getIdentity() {
		return identity;
	}
	public void setIdentity(Integer identity) {
		this.identity = identity;
	}
	public String getCharacterName() {
		return characterName;
	}
	public void setCharacterName(String characterName) {
		this.characterName = characterName;
	}
	public String getApplyPioneer() {
		return applyPioneer;
	}
	public void setApplyPioneer(String applyPioneer) {
		this.applyPioneer = applyPioneer;
	}
	public String getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(String applyTime) {
		this.applyTime = applyTime;
	}
}
