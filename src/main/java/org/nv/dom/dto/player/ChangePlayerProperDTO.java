package org.nv.dom.dto.player;

import java.util.List;

import org.nv.dom.domain.player.PlayerCount;
import org.nv.dom.domain.player.PlayerGameStatus;

public class ChangePlayerProperDTO {
	
	private long gameId;
	
	private long playerId;
	
	private int camp;
	
	private int isSp;
	
	private List<PlayerGameStatus> status;
	
	private List<PlayerCount> count;

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

	public int getCamp() {
		return camp;
	}

	public void setCamp(int camp) {
		this.camp = camp;
	}

	public int getIsSp() {
		return isSp;
	}

	public void setIsSp(int isSp) {
		this.isSp = isSp;
	}

	public List<PlayerGameStatus> getStatus() {
		return status;
	}

	public void setStatus(List<PlayerGameStatus> status) {
		this.status = status;
	}

	public List<PlayerCount> getCount() {
		return count;
	}

	public void setCount(List<PlayerCount> count) {
		this.count = count;
	}

}
