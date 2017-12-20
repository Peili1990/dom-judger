package org.nv.dom.domain.player;

import java.io.Serializable;

public class PlayerGameStatus implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 875667867115774135L;

	private long gameId;
	
	private long playerId;
	
	private long statusId;
	
	private String statusName;
	
	private int remainStage;

	public long getGameId() {
		return gameId;
	}

	public void setGameId(long gameId) {
		this.gameId = gameId;
	}

	public long getPlayerId() {
		return playerId;
	}

	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}

	public long getStatusId() {
		return statusId;
	}

	public void setStatusId(long statusId) {
		this.statusId = statusId;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public int getRemainStage() {
		return remainStage;
	}

	public void setRemainStage(int remainStage) {
		this.remainStage = remainStage;
	}

}