package org.nv.dom.dto.game;

public class PublishGameDTO {
	
	/** 游戏id */
	private long gameId;
	/** 法官（玩家）id */
	private long judgerId;
	/** 游戏名称 */
	private String gameDesc;
	/** 玩家配置 */
	private Integer playerNum;
	/** 开版时间 */
	private String startDate;
	/** 游戏所用QQ群 */
	private String qqGroup;
	/** 备注 */
	private String remark;
	
	public long getGameId() {
		return gameId;
	}
	public void setGameId(long gameId) {
		this.gameId = gameId;
	}
	public long getJudgerId() {
		return judgerId;
	}
	public void setJudgerId(long judgerId) {
		this.judgerId = judgerId;
	}
	public String getGameDesc() {
		return gameDesc;
	}
	public void setGameDesc(String gameDesc) {
		this.gameDesc = gameDesc;
	}
	public Integer getPlayerNum() {
		return playerNum;
	}
	public void setPlayerNum(Integer playerNum) {
		this.playerNum = playerNum;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getQqGroup() {
		return qqGroup;
	}
	public void setQqGroup(String qqGroup) {
		this.qqGroup = qqGroup;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
