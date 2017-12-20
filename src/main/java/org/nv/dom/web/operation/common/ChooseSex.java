package org.nv.dom.web.operation.common;

import java.util.ArrayList;
import java.util.Arrays;
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
public class ChooseSex extends Operation {

	public ChooseSex() {
		operationId = 299;
	}

	@Override
	public void check(Map<String, Object> param) {

	}

	@Override
	public PlayerOperationRecord settle(Map<String, Object> param) {
		String event = get(param, OperationParam.EVENT);
		List<PlayerInfo> playerInfos = get(param, OperationParam.PLAYER_INFO);
		switch (event) {
		case EventList.GAME_START_EVENT:		
			PlayerInfo winchester = findTarget(playerInfos, player -> player.getCharacterId() == 54);
			PlayerInfo candler = findTarget(playerInfos, player -> player.getCharacterId() == 42);
			List<PlayerOperation> operations = new ArrayList<>();
			if(winchester != null){
				operations.add(buildPlayerOperation(winchester.getPlayerId(), operationId, 1));
			}	
			if(candler != null){
				operations.add(buildPlayerOperation(candler.getPlayerId(), operationId, 1));
			}
			if(!operations.isEmpty()){
				gameUtil.addPlayerOperation(operations, false);
			}		
			return null;
		case EventList.OPERATION_SUBMIT_EVENT:
			PlayerOperationRecord record = buildPlayerOperationRecord(param);
			gameUtil.consumeOperationTimes(Arrays.asList(new PlayerOperation(record.getPlayerId(),operationId)));
			PlayerInfo target = findTarget(playerInfos, player -> player.getPlayerId() == record.getPlayerId());
			target.setSex(getSequence(getOriginParam(record.getParam())[0]) - 1);
			gameUtil.updatePlayerInfo(Arrays.asList(target));
			return record;
		default:
			break;
		}
		return null;
	}

	@Override
	public void registerEvent() {
		eventService.registerEvent(EventList.GAME_START_EVENT, this);	
		eventService.registerEvent(EventList.OPERATION_SUBMIT_EVENT, this);
	}

}
