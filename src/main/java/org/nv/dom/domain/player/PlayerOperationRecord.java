package org.nv.dom.domain.player;

import java.util.List;

public class PlayerOperationRecord {
	
	private long id;
	
	private long playerId;
	
	private long formId;
	
	private long operationId;
	
	private String param;
	
	private int isDone;
	
	private String createTime;
	
	private List<PlayerFeedback> feedback;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getPlayerId() {
		return playerId;
	}

	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}

	public long getFormId() {
		return formId;
	}

	public void setFormId(long formId) {
		this.formId = formId;
	}

	public long getOperationId() {
		return operationId;
	}

	public void setOperationId(long operationId) {
		this.operationId = operationId;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

	public int getIsDone() {
		return isDone;
	}

	public void setIsDone(int isDone) {
		this.isDone = isDone;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public List<PlayerFeedback> getFeedback() {
		return feedback;
	}

	public void setFeedback(List<PlayerFeedback> feedback) {
		this.feedback = feedback;
	}

}
