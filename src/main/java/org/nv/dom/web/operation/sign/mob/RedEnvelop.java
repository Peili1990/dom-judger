package org.nv.dom.web.operation.sign.mob;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.nv.dom.config.EventList;
import org.nv.dom.domain.player.PlayerFeedback;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.web.operation.Operation;

public class RedEnvelop extends Operation {

	public RedEnvelop() {
		operationId = 33;
	}

	@Override
	public boolean check(Map<String, Object> param) {
		return true;
	}

	@Override
	public PlayerOperationRecord settle(Map<String, Object> param) {
		String event = (String) param.get("event");
		switch (event) {
		case EventList.OPERATION_SUBMIT_EVENT:
			List<PlayerOperationRecord> records = gameUtil.getCurStageRecords((long) param.get("gameId"));
			PlayerOperationRecord envelop = records.stream()
					.filter(record -> record.getOperationId() == 33 || record.getOperationId() == 34)
					.findAny().orElseGet(null);
			if(envelop == null){
				return buildPlayerOperationRecord(param);			
			} else {
				PlayerOperationRecord record = buildPlayerOperationRecord(param);
				PlayerFeedback feedback = new PlayerFeedback();
				feedback.setPlayerId(record.getPlayerId());
				feedback.setCharacterName(record.getOperator());
				feedback.setFeedback("红信提交失败");
				record.setFeedback(Arrays.asList(feedback));
				return record;
			}
		default:
			break;
		}
		
		return null;
	}

	@Override
	public void registerEvent() {
		eventService.registerEvent(EventList.OPERATION_SUBMIT_EVENT, this);
	}

}
