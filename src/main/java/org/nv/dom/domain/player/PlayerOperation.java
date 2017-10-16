package org.nv.dom.domain.player;

import java.util.List;

public class PlayerOperation {
	
	private long playerId;
	
	private long operationId;
	
	private String operationName;
	
	private String template;
	
	private int immediately;
	
	private int multiple;
	
	private int times;
	
	private List<OperationOption> options;

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

	public List<OperationOption> getOptions() {
		return options;
	}

	public void setOptions(List<OperationOption> options) {
		this.options = options;
	}	

}
