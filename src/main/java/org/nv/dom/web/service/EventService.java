package org.nv.dom.web.service;

import java.util.Map;

import org.nv.dom.web.operation.Operation;

public interface EventService {
	
	void registerEvent(String event, Operation operation);
	
	void cancelEvent(String event, Operation operation);
	
	void publish(String event, Map<String, Object> param);

}
