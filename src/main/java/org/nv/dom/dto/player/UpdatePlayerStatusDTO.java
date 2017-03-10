package org.nv.dom.dto.player;

public class UpdatePlayerStatusDTO {
	
	private long playerId;
	private long gameId;
	private boolean includeJudger;
	private Integer status;
	public long getPlayerId() {
		return playerId;
	}
	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}
	public long getGameId() {
		return gameId;
	}
	public void setGameId(long gameId) {
		this.gameId = gameId;
	}
	public boolean isIncludeJudger() {
		return includeJudger;
	}
	public void setIncludeJudger(boolean includeJudger) {
		this.includeJudger = includeJudger;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	

}
