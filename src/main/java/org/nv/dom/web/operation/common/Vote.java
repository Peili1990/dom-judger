package org.nv.dom.web.operation.common;

import static java.util.stream.Collectors.toList;

import java.util.List;
import java.util.Map;

import org.nv.dom.config.EventList;
import org.nv.dom.config.OperationParam;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperation;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.dto.operation.SubmitOperationDTO;
import org.nv.dom.enums.GameStatus;
import org.nv.dom.web.dao.game.GameMapper;
import org.nv.dom.web.dao.message.MessageMapper;
import org.nv.dom.web.dao.newspaper.NewspaperMapper;
import org.nv.dom.web.operation.Operation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

@Component
public class Vote extends Operation {
	
	public Vote() {
		operationId = 100;
	}
	
	@Autowired
	MessageMapper messageMapper;
	
	@Autowired
	NewspaperMapper newspaperMapper;
	
	@Autowired
	GameMapper gameMapper;

	@Override
	public void check(Map<String, Object> param) {
		String event = get(param, OperationParam.EVENT);
		switch (event) {
		case EventList.OPERATION_SUBMIT_EVENT:
			long gameId = get(param, OperationParam.GAME_ID);
			List<SubmitOperationDTO> operations = get(param, OperationParam.OPERATIONS);
			SubmitOperationDTO operation = findTarget(operations, record -> record.getOperationId() == operationId);
			List<PlayerInfo> playerInfos = get(param, OperationParam.PLAYER_INFO);
			PlayerInfo voter = findTarget(playerInfos, player -> player.getPlayerId() == operation.getPlayerId());
			long gameStatus = gameMapper.getCurGameStatus(gameId);
			if (gameStatus == GameStatus.SPEEDING.getCode()){
				Assert.isTrue(voter.getStatus().stream().noneMatch(status -> status.getStatusId() == 4), "被禁言者无法投票");
			} else {
				long newspaperId = newspaperMapper.getLatestNewspaperId(gameId);
				Assert.isTrue(messageMapper.checkHasSpeech(newspaperId, voter.getPlayerId()) > 0, "未发言者无法投票");
			}			
		default:
			break;
		}
	}

	@Override
	public PlayerOperationRecord settle(Map<String, Object> param) {
		String event = get(param, OperationParam.EVENT);
		switch (event) {
		case EventList.GAME_START_EVENT:
			List<PlayerInfo> playerInfos = get(param, OperationParam.PLAYER_INFO);
			List<PlayerOperation> operations = playerInfos.stream()
					.map(player -> buildPlayerOperation(player.getPlayerId(), operationId, 999))
					.collect(toList());
			gameUtil.addPlayerOperation(operations, false);
			return null;
		default:
			break;
		}
		return null;
	}

	@Override
	public void registerEvent() {
		eventService.registerEvent(EventList.OPERATION_SUBMIT_EVENT, this);
		eventService.registerEvent(EventList.GAME_START_EVENT, this);
	}

}
