package org.nv.dom.web.operation.sign.killer;

import static java.util.stream.Collectors.toList;

import java.util.List;
import java.util.Map;

import org.nv.dom.config.EventList;
import org.nv.dom.config.NVTermConstant;
import org.nv.dom.domain.player.PlayerFeedback;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperation;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.dto.operation.SubmitOperationDTO;
import org.nv.dom.enums.IdentityCode;
import org.nv.dom.util.TextUtil;
import org.nv.dom.web.operation.Operation;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

@Component
public class BackupPlan extends Operation {
	
	public BackupPlan() {
		operationId = 19;
	}

	@Override
	public boolean check(Map<String, Object> param) {
		List<SubmitOperationDTO> operations = (List<SubmitOperationDTO>) param.get("operations");
		SubmitOperationDTO operation = findTarget(operations, record -> record.getOperationId() == operationId);
		Object[] targets = operation.getParam();
		if("4".equals(getTarget(targets[0]))){
			Assert.isTrue(TextUtil.wordCount(getTarget(targets[2])) == 1, "灰线传递字数不得大于1！");
		}	
		return true;
	}

	@Override
	public PlayerOperationRecord settle(Map<String, Object> param) {
		List<SubmitOperationDTO> operations = (List<SubmitOperationDTO>) param.get("operations");
		SubmitOperationDTO operation = findTarget(operations, record -> record.getOperationId() == operationId);
		Object[] targets = operation.getParam();
		List<PlayerInfo> playerInfos = gameUtil.getPlayerInfo(operation.getGameId());
		List<PlayerInfo> killers = playerInfos.stream()
				.filter(player -> player.getSign() >= 13 && player.getSign() <= 18)
				.filter(player -> player.getIsLife() == 1)
				.collect(toList());
		PlayerOperationRecord record = buildPlayerOperationRecord(param);
		record.setPlayerId(operation.getPlayerId());
		record.setOperationStr(operation.getOperationStr());
		switch(getTarget(targets[0])){
		case "1":
			break;
		case "2":
			gameUtil.addPlayerOperation(killers.stream()
					.map(player -> buildPlayerOperation(player.getPlayerId(), 23, 1))
					.collect(toList()), true);
			break;
		case "3":
			gameUtil.addPlayerOperation(killers.stream()
					.map(player -> buildPlayerOperation(player.getPlayerId(), 24, 1))
					.collect(toList()), true);
			break;
		case "4":
			Integer sign = Integer.valueOf(getTarget(targets[1]));
			List<PlayerInfo> receivers = playerInfos.stream()					
					.filter(player -> IdentityCode.getMessageByCode(player.getSign()).getCode() == sign)
					.filter(player -> player.getCamp() == NVTermConstant.KILLER_CAMP)
					.collect(toList());
			record.setFeedback(receivers.stream().map(player -> {
				PlayerFeedback feedback = new PlayerFeedback();
				feedback.setPlayerId(player.getPlayerId());
				feedback.setCharacterName(player.getCharacterName());
				feedback.setFeedback("杀手团队通过灰线向你传递："+getTarget(targets[2]));
				return feedback;
			}).collect(toList()));	
			break;
		}
		gameUtil.consumeOperationTimes(killers.stream().map(player -> new PlayerOperation(player.getPlayerId(), operationId)).collect(toList()));	
		return record;
	}

	@Override
	public void registerEvent() {
		eventService.registerEvent(EventList.OPERATION_SUBMIT_EVENT, this);
	}

}
