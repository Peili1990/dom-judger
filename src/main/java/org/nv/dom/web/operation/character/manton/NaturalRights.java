package org.nv.dom.web.operation.character.manton;

import java.util.Map;

import org.nv.dom.config.EventList;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.web.operation.Operation;
import org.springframework.stereotype.Component;

@Component
public class NaturalRights extends Operation {

	public NaturalRights() {
		operationId = 155;
	}

	@Override
	public void check(Map<String, Object> param) {
		
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
