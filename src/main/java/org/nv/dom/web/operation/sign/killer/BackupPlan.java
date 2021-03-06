package org.nv.dom.web.operation.sign.killer;

import static java.util.stream.Collectors.toList;

import java.util.List;
import java.util.Map;

import org.nv.dom.config.EventList;
import org.nv.dom.config.NVTermConstant;
import org.nv.dom.config.OperationParam;
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
	public void check(Map<String, Object> param) {
		List<SubmitOperationDTO> operations = get(param, OperationParam.OPERATIONS);
		SubmitOperationDTO operation = findTarget(operations, record -> record.getOperationId() == operationId);
		Object[] targets = operation.getParam();
		if(4 == getSequence(targets[0])){
			Assert.isTrue(TextUtil.wordCount(getDescription(targets[2])) == 1, "灰线传递字数不得大于1！");
		}	
	}

	@Override
	public PlayerOperationRecord settle(Map<String, Object> param) {
		PlayerOperationRecord record = buildPlayerOperationRecord(param);
		Object[] targets = getOriginParam(record.getParam());
		List<PlayerInfo> playerInfos = get(param, OperationParam.PLAYER_INFO);
		List<PlayerInfo> killers = playerInfos.stream()
				.filter(player -> player.getSign() >= 13 && player.getSign() <= 18)
				.filter(player -> player.getIsLife() == 1)
				.collect(toList());
		switch(getSequence(targets[0])){
		case 1:
			break;
		case 2:
			gameUtil.addPlayerOperation(killers.stream()
					.map(player -> buildPlayerOperation(player.getPlayerId(), 23, 1))
					.collect(toList()), true);
			break;
		case 3:
			gameUtil.addPlayerOperation(killers.stream()
					.map(player -> buildPlayerOperation(player.getPlayerId(), 24, 1))
					.collect(toList()), true);
			break;
		case 4:
			int sign = getSequence(targets[1]);
			List<PlayerInfo> receivers = playerInfos.stream()					
					.filter(player -> IdentityCode.getMessageByCode(player.getSign()).getCode() == sign)
					.filter(player -> player.getCamp() == NVTermConstant.KILLER_CAMP)
					.collect(toList());
			record.setFeedback(receivers.stream().map(player -> {
				PlayerFeedback feedback = buildPlayerFeedback(player, 0);
				feedback.setFeedback("杀手团队通过灰线向你传递："+getDescription(targets[2]));
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
