package org.nv.dom.web.service;

import java.util.List;

import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperationRecord;

public interface GameUtilService {
	
	int getCurStage(long gameId);
	
	long getCurForm(long gameId);
	
	void insertOperationRecord(PlayerOperationRecord playerOperationRecord);
	
	long getUserIdByPlayerId(long playerId);
	
	List<PlayerInfo> getPlayerInfo(long gameId);

}