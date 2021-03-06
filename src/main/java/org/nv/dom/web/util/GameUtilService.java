package org.nv.dom.web.util;

import java.util.List;

import org.nv.dom.domain.game.GameForm;
import org.nv.dom.domain.player.PlayerCount;
import org.nv.dom.domain.player.PlayerFeedback;
import org.nv.dom.domain.player.PlayerGameStatus;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperation;
import org.nv.dom.domain.player.PlayerOperationRecord;

public interface GameUtilService {
	
	int getCurStage(long gameId);
	
	GameForm getCurForm(long gameId);
	
	void insertOperationRecord(PlayerOperationRecord playerOperationRecord);
	
	List<PlayerOperationRecord> getCurStageRecords(long gameId);
	
	List<PlayerFeedback> getAllStageFeedback(long gameId);
	
	long getUserIdByPlayerId(long playerId);
	
	List<PlayerInfo> getPlayerInfo(long gameId);
	
	void sendMessage(List<PlayerFeedback> feedbacks, long judgerId);
	
	void addPlayerOperation(List<PlayerOperation> playerOperation, boolean update);
	
	void removePlayerOperation(List<PlayerOperation> playerOperation);
	
	void consumeOperationTimes(List<PlayerOperation> playerOperation);
	
	void updatePlayerInfo(List<PlayerInfo> playerInfos);

	void addPlayerGameStatus(List<PlayerGameStatus> asList, long gameId);
	
	void addPlayerCount(List<PlayerCount> counts, long gameId);

	void updatePlayerCount(PlayerCount playerCount);

}
