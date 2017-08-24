package org.nv.dom.dto.operation;

import java.util.List;

public class SubmitPlayerOperationDTO {
	
	private long playerId;
	
	private long gameId;
	
	private List<SubmitOperationDTO> records;

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

	public List<SubmitOperationDTO> getRecords() {
		return records;
	}

	public void setRecords(List<SubmitOperationDTO> records) {
		this.records = records;
	}

}
