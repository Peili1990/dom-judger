package org.nv.dom.web.util.impl;

import static java.util.stream.Collectors.toList;

import java.util.List;

import org.nv.dom.domain.game.GameForm;
import org.nv.dom.domain.message.chat.ChatDetail;
import org.nv.dom.domain.player.PlayerFeedback;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperation;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.util.ConfigUtil;
import org.nv.dom.util.HttpClientUtil;
import org.nv.dom.web.dao.game.GameMapper;
import org.nv.dom.web.dao.player.PlayerMapper;
import org.nv.dom.web.util.GameUtilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;

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

	@Override
	public void sendMessage(List<PlayerFeedback> feedbacks, long judgerId) {
		List<ChatDetail> chatDetails = feedbacks.stream()
				.map(feedback -> {
					ChatDetail chatDetail = new ChatDetail();
					long userId = getUserIdByPlayerId(feedback.getPlayerId());
					String chatId = buildChatId(userId, judgerId);
					chatDetail.setChatId(chatId);
					chatDetail.setFromUserId(judgerId);
					chatDetail.setToUserId(userId);
					chatDetail.setContent(feedback.getFeedback());
					return chatDetail;
				}).collect(toList());
		HttpClientUtil.doPostJson("http://"+ConfigUtil.getVersionConfigProperty("chat.server")+"/sendMessageBatch", 
				JSON.toJSONString(chatDetails));		
	}
	
	private String buildChatId(long userIdOne, long userIdTwo){
		return userIdOne < userIdTwo ? userIdOne + "-" + userIdTwo : userIdTwo + "-" + userIdOne;
	}

	@Override
	public List<PlayerOperationRecord> getCurStageRecords(long gameId) {
		long formId = getCurForm(gameId).getFormId();
		return playerMapper.getCurGameAllOperation(gameId,formId);
	}

	@Override
	public void addPlayerOperation(List<PlayerOperation> playerOperation, boolean update) {
		if(update){
			playerMapper.incrPlayerOperation(playerOperation);
		} else {
			playerMapper.insertPlayerOperation(playerOperation);
		}
		
		
	}

	@Override
	public void consumeOperationTimes(List<PlayerOperation> playerOperation) {
		playerMapper.consumeOperationTimes(playerOperation);
		
	}

	@Override
	public void removePlayerOperation(List<PlayerOperation> playerOperation) {
		playerMapper.removePlayerOperation(playerOperation);
		
	}

	@Override
	public List<PlayerFeedback> getAllStageFeedback(long gameId) {
		return playerMapper.getCurGameAllFeedback(gameId);
	}

	@Override
	public void updatePlayerInfo(List<PlayerInfo> playerInfos) {
		gameMapper.submitApplyListDao(playerInfos);
	}

}
