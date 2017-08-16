package org.nv.dom.domain.player;

public class PlayerFeedback {
	
	private long operationRecordId;
	
	private long playerId;
	
	private String feedback;
	
	private String createTime;

	public long getOperationRecordId() {
		return operationRecordId;
	}

	public void setOperationRecordId(long operationRecordId) {
		this.operationRecordId = operationRecordId;
	}

	public long getPlayerId() {
		return playerId;
	}

	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}
