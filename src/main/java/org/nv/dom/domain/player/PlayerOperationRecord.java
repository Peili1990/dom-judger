package org.nv.dom.domain.player;

import java.util.List;

public class PlayerOperationRecord {
	
	private long id;
	
	private long playerId;
	
	private long gameId;
	
	private long formId;
	
	private long operationId;
	
	private long immediately;
	
	private String operationName;
	
	private String template;
	
	private String param;
	
	private String operationStr;
	
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

	public long getGameId() {
		return gameId;
	}

	public void setGameId(long gameId) {
		this.gameId = gameId;
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

	public long getImmediately() {
		return immediately;
	}

	public void setImmediately(long immediately) {
		this.immediately = immediately;
	}

	public String getOperationName() {
		return operationName;
	}

	public void setOperationName(String operationName) {
		this.operationName = operationName;
	}

	public String getTemplate() {
		return template;
	}

	public void setTemplate(String template) {
		this.template = template;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}

	public String getOperationStr() {
		return operationStr;
	}

	public void setOperationStr(String operationStr) {
		this.operationStr = operationStr;
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
