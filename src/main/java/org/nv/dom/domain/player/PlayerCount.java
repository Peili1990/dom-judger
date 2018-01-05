package org.nv.dom.domain.player;

import java.io.Serializable;

public class PlayerCount implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7284890588489596372L;
	
	private long gameId;

	private long playerId;
	
	private long countId;
	
	private int countType;
	
	private String countName;
	
	private int countNum;

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

	public long getCountId() {
		return countId;
	}

	public void setCountId(long countId) {
		this.countId = countId;
	}

	public int getCountType() {
		return countType;
	}

	public void setCountType(int countType) {
		this.countType = countType;
	}

	public String getCountName() {
		return countName;
	}

	public void setCountName(String countName) {
		this.countName = countName;
	}

	public int getCountNum() {
		return countNum;
	}

	public void setCountNum(int countNum) {
		this.countNum = countNum;
	}

}
