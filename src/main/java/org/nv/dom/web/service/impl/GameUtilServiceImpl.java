package org.nv.dom.web.service.impl;

import java.util.List;

import org.nv.dom.domain.game.GameForm;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.web.dao.game.GameMapper;
import org.nv.dom.web.dao.player.PlayerMapper;
import org.nv.dom.web.service.GameUtilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("gameUtilServiceImpl")
public class GameUtilServiceImpl implements GameUtilService{
	
	@Autowired
	GameMapper gameMapper;
	
	@Autowired
	PlayerMapper playerMapper;

	@Override
	public int getCurStage(long gameId) {
		return gameMapper.getCurStage(gameId);
	}
	
	@Override
	public GameForm getCurForm(long gameId) {
		return gameMapper.getFormListDao(gameId, false).get(0);
	}

	@Override
	public void insertOperationRecord(PlayerOperationRecord playerOperationRecord) {
		playerMapper.insertPlayerOperationRecord(playerOperationRecord);
		if(playerOperationRecord.getFeedback() != null){
			playerOperationRecord.getFeedback().forEach(feedback -> {
				feedback.setOperationRecordId(playerOperationRecord.getId());
				feedback.setFormId(playerOperationRecord.getFormId());
			});
			playerMapper.insertPlayerFeedbackBatch(playerOperationRecord.getFeedback());
		}	
	}

	@Override
	public long getUserIdByPlayerId(long playerId) {
		return playerMapper.getUserIdByPlayerId(playerId);
	}

	@Override
	public List<PlayerInfo> getPlayerInfo(long gameId) {
		return playerMapper.getPlayerInfosDao(gameId);
	}

}
