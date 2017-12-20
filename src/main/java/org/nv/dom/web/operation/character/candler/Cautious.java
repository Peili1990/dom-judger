package org.nv.dom.web.operation.character.candler;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.nv.dom.config.EventList;
import org.nv.dom.config.OperationParam;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.web.operation.Operation;
import org.springframework.stereotype.Component;

@Component
public class Cautious extends Operation {

	public Cautious() {
		operationId = 268;
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
			PlayerInfo candler = findTarget(playerInfos, player -> player.getCharacterId() == 42 
					&& player.getIsSp() == 1 && player.getIsSpecial() == 1);
			if(candler == null){
				return null;
			}	
			gameUtil.addPlayerGameStatus(Arrays.asList(buildPlayerStatus(candler.getPlayerId(), 25, 999)),
					get(param,OperationParam.GAME_ID));
			return null;
		default:
			break;
		}
		return null;
	}

	@Override
	public void registerEvent() {
		eventService.registerEvent(EventList.GAME_START_EVENT, this);
	}

}
