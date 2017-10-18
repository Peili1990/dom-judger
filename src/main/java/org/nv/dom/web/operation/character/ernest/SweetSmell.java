package org.nv.dom.web.operation.character.ernest;

import static java.util.stream.Collectors.toList;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.nv.dom.config.EventList;
import org.nv.dom.domain.player.PlayerFeedback;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.web.operation.Operation;
import org.springframework.stereotype.Component;

@Component
public class SweetSmell extends Operation {

	public SweetSmell() {
		operationId = 225;
	}

	@Override
	public void check(Map<String, Object> param) {

	}

	@Override
	public PlayerOperationRecord settle(Map<String, Object> param) {
		long gameId = (long) param.get("gameId");
		List<PlayerInfo> playerInfo = gameUtil.getPlayerInfo(gameId);
		PlayerInfo ernest = findTarget(playerInfo, player -> player.getCharacterId() == 51);
		if(ernest == null || ernest.getIsLife() == 0 || 
				ernest.getIsSp() == 1){
			return null;
		}
		playerInfo = playerInfo.stream()
				.filter(player -> player.getIsLife() == 1 && player.getHasPosition() == 1)
				.collect(toList());
		int ernestIndex = playerInfo.indexOf(ernest);
		int clockwisePoint = ernestIndex == playerInfo.size() - 1 ? 0 : ernestIndex + 1;
		int anticlockwisePoint = ernestIndex == 0 ? playerInfo.size() -1 : ernestIndex - 1;
		Counter clockwise = new Counter();
		Counter anticlockwise = new Counter();
		while(!(clockwisePoint == anticlockwisePoint || clockwisePoint - anticlockwisePoint == 1 ||
				clockwisePoint + playerInfo.size() - anticlockwisePoint == 1)){
			decideSign(playerInfo.get(clockwisePoint), clockwise);
			decideSign(playerInfo.get(anticlockwisePoint), anticlockwise);
			clockwisePoint = clockwisePoint == playerInfo.size() - 1 ? 0 : clockwisePoint + 1;
			anticlockwisePoint = anticlockwisePoint == 0 ? playerInfo.size() - 1 : anticlockwisePoint - 1;
		}
		String notice = clockwise.count > anticlockwise.count ? "顺时针-逆时针="+(clockwise.count-anticlockwise.count) :
						clockwise.count < anticlockwise.count ? "逆时针-顺时针="+(anticlockwise.count-clockwise.count) : "顺时针=逆时针";
		PlayerOperationRecord record = buildPlayerOperationRecord(param);
		record.setPlayerId(ernest.getPlayerId());
		record.setOperationStr("欧内斯特触发甜美气息");
		PlayerFeedback feedback = new PlayerFeedback();
		feedback.setPlayerId(ernest.getPlayerId());
		feedback.setCharacterName(ernest.getCharacterName());
		feedback.setFeedback("甜美气息计算结果："+notice);
		record.setFeedback(Arrays.asList(feedback));
		return record;		
	}
	
	private class Counter{
		
		int count;
		
	}
	
	private void decideSign(PlayerInfo player, Counter counter){
		if(player.getCharacterId() == 41 && player.getIsSp() == 0){
			return;
		}
		if(player.getIsSpecial() == 1){
			counter.count++;
		}
	}

	@Override
	public void registerEvent() {
		eventService.registerEvent(EventList.NIGNT_START_EVENT, this);

	}

}
