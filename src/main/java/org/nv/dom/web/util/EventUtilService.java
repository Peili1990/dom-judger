package org.nv.dom.web.util;

import java.util.List;
import java.util.Map;

import org.nv.dom.dto.operation.SubmitOperationDTO;
import org.nv.dom.web.operation.Operation;

public interface EventUtilService {
	
	void registerEvent(String event, Operation operation);
	
	void cancelEvent(String event, Operation operation);
	
	void publish(String event, Map<String, Object> param);
	
	void preSubmit(List<SubmitOperationDTO> records);

	List<SubmitOperationDTO> instantSettle(List<SubmitOperationDTO> records);

}
