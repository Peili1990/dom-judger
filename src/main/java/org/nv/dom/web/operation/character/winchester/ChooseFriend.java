package org.nv.dom.web.operation.character.winchester;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.nv.dom.config.EventList;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperation;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.dto.operation.SubmitOperationDTO;
import org.nv.dom.web.operation.Operation;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

@Component
public class ChooseFriend extends Operation {
	
	public ChooseFriend() {
		operationId = 235;
	}

	@Override
	public void check(Map<String, Object> param) {
		String event = (String) param.get("event");
		switch (event) {
		case EventList.OPERATION_SUBMIT_EVENT:
			List<SubmitOperationDTO> operations = (List<SubmitOperationDTO>) param.get("operations");
			SubmitOperationDTO operation = findTarget(operations, record -> record.getOperationId() == operationId);
			Object[] targets = operation.getParam();
			List<PlayerInfo> playerInfo = gameUtil.getPlayerInfo(operation.getGameId());
			for(Object target : targets){
				String[] str = target.toString().split(",");
				Assert.isTrue(playerInfo.stream()
						.noneMatch(player -> String.valueOf(player.getCharacterId()).equals(str[0])), str[1]+"已被选择！");
			}
			Assert.isTrue(!targets[0].equals(targets[1]), "不得选择相同角色！");
			break;
		}
	}

	@Override
	public PlayerOperationRecord settle(Map<String, Object> param) {
		String event = (String) param.get("event");
		switch (event) {
		case EventList.GAME_START_EVENT:
			List<PlayerInfo> playerInfos = gameUtil.getPlayerInfo((long) param.get("gameId"));
			PlayerInfo winchester = findTarget(playerInfos, player -> player.getCharacterId() == 54);
			if(winchester == null){
				return null;
			}	
			gameUtil.addPlayerOperation(Arrays.asList(buildPlayerOperation(winchester.getPlayerId(), operationId, 1)), false);
			return null;
		case EventList.OPERATION_SUBMIT_EVENT:
			PlayerOperationRecord record = buildPlayerOperationRecord(param);
			gameUtil.consumeOperationTimes(Arrays.asList(new PlayerOperation(record.getPlayerId(),operationId)));
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
