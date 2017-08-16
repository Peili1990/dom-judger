package org.nv.dom.domain.player;

public class PlayerOperation {
	
	private long playerId;
	
	private long operationId;
	
	private int times;

	public long getPlayerId() {
		return playerId;
	}

	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}

	public long getOperationId() {
		return operationId;
	}

	public void setOperationId(long operationId) {
		this.operationId = operationId;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

}
