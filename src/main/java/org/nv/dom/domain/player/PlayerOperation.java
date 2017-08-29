package org.nv.dom.domain.player;

public class PlayerOperation {
	
	private long playerId;
	
	private long operationId;
	
	private String operationName;
	
	private String template;
	
	private int immediately;
	
	private int multiple;
	
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

	public int getImmediately() {
		return immediately;
	}

	public void setImmediately(int immediately) {
		this.immediately = immediately;
	}

	public int getMultiple() {
		return multiple;
	}

	public void setMultiple(int multiple) {
		this.multiple = multiple;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	public PlayerOperation(long playerId, long operationId) {
		super();
		this.playerId = playerId;
		this.operationId = operationId;
	}

	public PlayerOperation() {
		
	}
	
	

}
