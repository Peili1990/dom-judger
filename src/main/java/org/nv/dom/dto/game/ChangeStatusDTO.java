package org.nv.dom.dto.game;

public class ChangeStatusDTO {
	
	private long gameId;
	private Integer status;
	private Integer finalResult;
	public long getGameId() {
		return gameId;
	}
	public void setGameId(long gameId) {
		this.gameId = gameId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getFinalResult() {
		return finalResult;
	}
	public void setFinalResult(Integer finalResult) {
		this.finalResult = finalResult;
	}

}
