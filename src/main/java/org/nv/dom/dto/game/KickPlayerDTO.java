package org.nv.dom.dto.game;

public class KickPlayerDTO {
	
	private long gameId;
	private long judgerUserId;
	private long playerId;
	private String reason;
	public long getGameId() {
		return gameId;
	}
	public void setGameId(long gameId) {
		this.gameId = gameId;
	}
	public long getJudgerUserId() {
		return judgerUserId;
	}
	public void setJudgerUserId(long judgerUserId) {
		this.judgerUserId = judgerUserId;
	}
	public long getPlayerId() {
		return playerId;
	}
	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
}
