package org.nv.dom.web.operation.sign.mob;

import static java.util.stream.Collectors.toList;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.nv.dom.config.EventList;
import org.nv.dom.config.NVTermConstant;
import org.nv.dom.domain.player.PlayerFeedback;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperation;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.enums.IdentityCode;
import org.nv.dom.web.operation.Operation;
import org.springframework.stereotype.Component;

@Component
public class LightConference extends Operation {
	
	public LightConference() {
		operationId = 35;
	}

	@Override
	public boolean check(Map<String, Object> param) {
		return true;
	}

	@Override
	public PlayerOperationRecord settle(Map<String, Object> param) {
		String event = (String) param.get("event");
		switch (event) {
		case EventList.OPERATION_SUBMIT_EVENT:
			PlayerOperationRecord operation = buildPlayerOperationRecord(param);
			List<PlayerOperation> consumer = new ArrayList<>();
			consumer.add(new PlayerOperation(operation.getPlayerId(),33));
			gameUtil.consumeOperationTimes(consumer);
			List<PlayerOperationRecord> records = gameUtil.getCurStageRecords(operation.getGameId());
			PlayerOperationRecord envelop = records.stream()
					.filter(record -> record.getOperationId() == 33)
					.findAny().orElse(null);
			if(envelop == null){
				return operation;			
			} else {			
				PlayerFeedback feedback = new PlayerFeedback();
				feedback.setPlayerId(operation.getPlayerId());
				feedback.setCharacterName(operation.getOperator());
				feedback.setFeedback("曙光议会提交失败");
				operation.setFeedback(Arrays.asList(feedback));
				return operation;
			}
		case EventList.NIGNT_START_EVENT:
			List<PlayerInfo> playerInfos = gameUtil.getPlayerInfo((long) param.get("gameId"));
			PlayerInfo mob = playerInfos.stream()
					.filter(player -> player.getSign() == IdentityCode.MOB.getCode())
					.filter(player -> player.getCamp() == NVTermConstant.GOOD_CAMP)
					.filter(player -> player.getIsLife() == 1)
					.findAny().orElse(null);
			if(mob != null){
				List<PlayerOperation> operations = playerInfos.stream()
						.filter(player -> player.getCamp() == NVTermConstant.GOOD_CAMP)
						.filter(player -> player.getIsLife() == 1)
						.map(player -> buildPlayerOperation(player.getPlayerId(), operationId, 1))
						.collect(toList());
				gameUtil.addPlayerOperation(operations,false);
			}
			return null;
		case EventList.DAY_START_EVENT:
			playerInfos = gameUtil.getPlayerInfo((long) param.get("gameId"));
			List<PlayerOperation> operations = playerInfos.stream()
					.map(player -> buildPlayerOperation(player.getPlayerId(), operationId, 0))
					.collect(toList());
			gameUtil.removePlayerOperation(operations);
			return null;
		default:
			break;
		}
		
		return null;
	}

	@Override
	public void registerEvent() {
		eventService.registerEvent(EventList.OPERATION_SUBMIT_EVENT, this);
		eventService.registerEvent(EventList.NIGNT_START_EVENT, this);
		eventService.registerEvent(EventList.DAY_START_EVENT, this);
	}

}
