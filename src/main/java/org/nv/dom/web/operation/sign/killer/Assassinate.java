package org.nv.dom.web.operation.sign.killer;

import java.util.Map;

import org.nv.dom.config.EventList;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.web.operation.Operation;
import org.springframework.stereotype.Component;

@Component
public class Assassinate extends Operation {

	public Assassinate() {
		operationId = 18;
	}

	@Override
	public boolean check(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return true;
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
