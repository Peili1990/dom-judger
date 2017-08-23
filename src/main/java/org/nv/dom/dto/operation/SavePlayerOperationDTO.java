package org.nv.dom.dto.operation;

import java.util.List;

import org.nv.dom.domain.player.PlayerOperation;

public class SavePlayerOperationDTO {
	
	private List<PlayerOperation> operations;
	
	private long playerId;

	public List<PlayerOperation> getOperations() {
		return operations;
	}

	public void setOperations(List<PlayerOperation> operations) {
		this.operations = operations;
	}

	public long getPlayerId() {
		return playerId;
	}

	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}
	
	

}
