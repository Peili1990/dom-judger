package org.nv.dom.domain.player;

public class PlayerInfo {
	
	/** 玩家id */
	private long playerId;
	/** 签代码 */
	private Integer sign;
	/** 身份描述 */
	private String identityDesc;
	public long getPlayerId() {
		return playerId;
	}
	public void setPlayerId(long playerId) {
		this.playerId = playerId;
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

}
