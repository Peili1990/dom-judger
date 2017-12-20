package org.nv.dom.web.operation.character.yesh;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.nv.dom.config.EventList;
import org.nv.dom.config.OperationParam;
import org.nv.dom.domain.player.PlayerFeedback;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperation;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.web.operation.Operation;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

@Component
public class CompulsorySuspension extends Operation {

	public CompulsorySuspension() {
		operationId = 252;
	}

	@Override
	public void check(Map<String, Object> param) {
		List<PlayerInfo> playerinfos = get(param, OperationParam.PLAYER_INFO);
		PlayerOperationRecord record = buildPlayerOperationRecord(param);
		PlayerInfo target = playerinfos.stream()
				.filter(player -> player.getPlayerId() == getSequence(getOriginParam(record.getParam())[0]))
				.findAny()
				.orElse(null);
		Assert.isTrue(target != null && target.getIsLife() == 1 && 
		 	!Arrays.asList(37,46,48).contains(target.getCharacterId()),"目标不正确");
	}

	@Override
	public PlayerOperationRecord settle(Map<String, Object> param) {
		List<PlayerInfo> playerinfos = get(param, OperationParam.PLAYER_INFO);
		PlayerOperationRecord record = buildPlayerOperationRecord(param);
		gameUtil.consumeOperationTimes(Arrays.asList(new PlayerOperation(record.getPlayerId(),operationId)));
		PlayerInfo target = playerinfos.stream()
				.filter(player -> player.getPlayerId() == getSequence(getOriginParam(record.getParam())[0]))
				.findAny()
				.get();
		int originSp = target.getIsSp();
		target.setIsSp(1-originSp);
		gameUtil.updatePlayerInfo(Arrays.asList(target));	
		PlayerFeedback feedback = buildPlayerFeedback(target, 0);
		feedback.setFeedback("你的初始特权被切换为"+(originSp == 0 ? "SP" : "BA")+"状态");
		record.setFeedback(Arrays.asList(feedback));	
		return record;
	}

	@Override
	public void registerEvent() {
		eventService.registerEvent(EventList.OPERATION_SUBMIT_EVENT, this);
	}

}
