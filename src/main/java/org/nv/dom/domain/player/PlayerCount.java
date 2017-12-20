package org.nv.dom.domain.player;

import java.io.Serializable;

public class PlayerCount implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7284890588489596372L;

	private int playerId;
	
	private int countId;
	
	private String countName;
	
	private int countNum;

	public int getPlayerId() {
		return playerId;
	}

	public void setPlayerId(int playerId) {
		this.playerId = playerId;
	}

	public int getCountId() {
		return countId;
	}

	public void setCountId(int countId) {
		this.countId = countId;
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
