package org.nv.dom.web.operation.sign.officer;

import java.util.List;
import java.util.Map;

import org.nv.dom.config.EventList;
import org.nv.dom.domain.player.PlayerFeedback;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.enums.IdentityCode;
import org.nv.dom.web.operation.Operation;
import org.springframework.stereotype.Component;

import static java.util.stream.Collectors.*;

import java.util.Arrays;

@Component
public class LiaisonMan extends Operation {

	public LiaisonMan() {
		operationId = 7;
	}

	@Override
	public void registerEvent() {
		eventService.registerEvent(EventList.GAME_START_EVENT, this);
	}

	
	@Override
	public PlayerOperationRecord settle(Map<String, Object> param) {
		long gameId = (long) param.get("gameId");
		List<PlayerInfo> playerInfo = gameUtil.getPlayerInfo(gameId);
		PlayerInfo officer = playerInfo.stream()
				.filter(player -> player.getSign() == IdentityCode.OFFICER.getCode())
				.findFirst()
				.get();
		List<PlayerInfo> policemen = playerInfo.stream()
				.filter(player -> player.getSign() > 0 && player.getSign() < 7)
				.collect(toList());
		PlayerInfo liaisonMan = policemen.get(randomNum(policemen.size()));
		PlayerOperationRecord record = buildPlayerOperationRecord(param);
		record.setPlayerId(officer.getPlayerId());
		record.setOperationStr("官员触发《联络员》");
		PlayerFeedback feedback = new PlayerFeedback();
		feedback.setPlayerId(officer.getPlayerId());
		feedback.setCharacterName(officer.getCharacterName());
		feedback.setFeedback("你的联络员是"+liaisonMan.getCharacterName()+"，签是"+liaisonMan.getIdentityDesc());
		record.setFeedback(Arrays.asList(feedback));
		return record;
	}

	@Override
	public boolean check(Map<String, Object> param) {
		return true;
	}

}
