package org.nv.dom.web.operation.common;

import static java.util.stream.Collectors.toList;

import java.util.List;
import java.util.Map;

import org.nv.dom.config.EventList;
import org.nv.dom.config.OperationParam;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperation;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.web.operation.Operation;
import org.springframework.stereotype.Component;

@Component
public class Vote extends Operation {
	
	public Vote() {
		operationId = 37;
	}

	@Override
	public void check(Map<String, Object> param) {
		
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
