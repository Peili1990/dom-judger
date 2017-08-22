package org.nv.dom.domain.player;

public class PlayerFeedback {
	
	private long operationRecordId;
	
	private long formId;
	
	private long playerId;
	
	private String characterName;
	
	private String feedback;
	
	private String createTime;

	public long getOperationRecordId() {
		return operationRecordId;
	}

	public void setOperationRecordId(long operationRecordId) {
		this.operationRecordId = operationRecordId;
	}

	public long getFormId() {
		return formId;
	}

	public void setFormId(long formId) {
		this.formId = formId;
	}

	public long getPlayerId() {
		return playerId;
	}

	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}

	public String getCharacterName() {
		return characterName;
	}

	public void setCharacterName(String characterName) {
		this.characterName = characterName;
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
