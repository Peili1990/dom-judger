package org.nv.dom.web.operation.sign.killer;

import java.util.List;
import java.util.Map;

import org.nv.dom.config.EventList;
import org.nv.dom.config.OperationParam;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.dto.operation.SubmitOperationDTO;
import org.nv.dom.web.operation.Operation;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

@Component
public class Assassinate extends Operation {

	public Assassinate() {
		operationId = 18;
	}

	@Override

	public void check(Map<String, Object> param) {
		List<SubmitOperationDTO> operations = get(param, OperationParam.OPERATIONS);
		SubmitOperationDTO operation = findTarget(operations, record -> record.getOperationId() == operationId);
		Object[] targets = operation.getParam();
		Assert.isTrue(targets != null && targets.length == 2, "还有空格没填完！");
		Assert.isTrue(getSequence(targets[0]) != getSequence(targets[1]), "凶器不得放置于【刺杀】对象！");		
	}

	@Override
	public PlayerOperationRecord settle(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void registerEvent() {
		eventService.registerEvent(EventList.OPERATION_SUBMIT_EVENT, this);
	}

}
