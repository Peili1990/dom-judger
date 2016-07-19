package org.nv.dom.dto.player;

public class PlayerInfoDTO {
	
	/** 玩家id */
	private long playerId;
	/** 身份代码 */
	private Integer identity;
	/** 身份描述 */
	private String identityDesc;
	/** 备注 */
	private String remark;
	public long getPlayerId() {
		return playerId;
	}
	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}
	public Integer getIdentity() {
		return identity;
	}
	public void setIdentity(Integer identity) {
		this.identity = identity;
	}
	public String getIdentityDesc() {
		return identityDesc;
	}
	public void setIdentityDesc(String identityDesc) {
		this.identityDesc = identityDesc;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	

}
