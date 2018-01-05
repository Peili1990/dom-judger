package org.nv.dom.web.operation.character.edward;

import java.util.List;
import java.util.Map;

import org.nv.dom.config.EventList;
import org.nv.dom.config.OperationParam;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.web.operation.Operation;
import org.springframework.stereotype.Component;

@Component
public class GroundExplorer extends Operation {
	
	public GroundExplorer() {
		operationId = 106;
	}

	@Override
	public void check(Map<String, Object> param) {

	}

	@Override
	public PlayerOperationRecord settle(Map<String, Object> param) {
		String event = get(param, OperationParam.EVENT);
		List<PlayerInfo> playerInfos = get(param, OperationParam.PLAYER_INFO);
		PlayerInfo edward = findTarget(playerInfos, player -> player.getCharacterId() == 1 
				&& player.getIsSp() == 1 && player.getIsLife() == 1);
		if(edward == null){
			return null;
		}
		switch (event) {
		case EventList.GAME_START_EVENT:
			addPlayerGameStatus(edward.getPlayerId(), 8, 999, get(param,OperationParam.GAME_ID));
			addPlayerCount(edward.getPlayerId(), 1, 1, 0, get(param,OperationParam.GAME_ID));
			return null;
		case EventList.NIGNT_START_EVENT:
			if(checkStatus(edward, 8) && determine(0.75)){
				PlayerOperationRecord record = buildPlayerOperationRecord(param);
				record.setPlayerId(edward.getPlayerId());
				record.setOperationStr("爱德华触发地底探险者，自尽");
				return record;
			}
			return null;
		case EventList.DAY_START_EVENT:
			if(checkStatus(edward, 8) && determine(0.25)){
				PlayerOperationRecord record = buildPlayerOperationRecord(param);
				record.setPlayerId(edward.getPlayerId());
				record.setOperationStr("爱德华触发地底探险者，自尽");
				return record;
			}
			return null;
		default:
			return null;
		}
	}

	@Override
	public void registerEvent() {
		eventService.registerEvent(EventList.GAME_START_EVENT, this);
		eventService.registerEvent(EventList.DAY_START_EVENT, this);	
		eventService.registerEvent(EventList.NIGNT_START_EVENT, this);
	}

}
