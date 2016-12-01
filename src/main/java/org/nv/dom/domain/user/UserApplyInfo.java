package org.nv.dom.domain.user;

public class UserApplyInfo {
	
	/** 用户id */
	private long userId;
	/** 玩家id */
	private long playerId;
	/** 用户昵称 */
	private String nickname;
	/** 玩家状态描述 */
	private Integer status;
	/** 是否选sp */
	private String isSp;
	/** 角色id */
	private Integer characterId;
	/** 角色名称 */
	private String characterName;
	/** 身份代码 */
	private Integer sign;
	/** 身份名称 */
	private String identityDesc;
	/** 卡片使用 */
	private String useCard;
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
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
	public String getUseCard() {
		return useCard;
	}
	public void setUseCard(String useCard) {
		this.useCard = useCard;
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
