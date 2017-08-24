package org.nv.dom.web.util.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nv.dom.config.EventList;
import org.nv.dom.dto.operation.SubmitOperationDTO;
import org.nv.dom.web.operation.Operation;
import org.nv.dom.web.util.EventUtilService;
import org.springframework.stereotype.Service;

import static java.util.stream.Collectors.*;

import java.util.ArrayList;

@Service("eventService")
public class EventUtilServiceImpl implements EventUtilService {
	
	private Map<String, Map<Integer, Operation>> eventManager = new HashMap<>();

	@Override
	public void registerEvent(String event, Operation operation) {
		Map<Integer, Operation> observers = eventManager.getOrDefault(event, new HashMap<Integer, Operation>());
		observers.put(operation.getOperationId(), operation);
		eventManager.put(event, observers);
	}

	@Override
	public void cancelEvent(String event, Operation operation) {
		Map<Integer, Operation> observers = eventManager.get(event);
		if(observers != null) {
			observers.remove(operation.getOperationId());
			eventManager.put(event, observers);
		}
	}

	@Override
	public void publish(String event, Map<String, Object> param) {
		Map<Integer, Operation> observers = eventManager.getOrDefault(event, new HashMap<Integer, Operation>());
		observers.keySet().stream().forEach(id -> observers.get(id).check(param));	
		observers.keySet().stream().forEach(id -> observers.get(id).accept(param));	
	}

	@Override
	public void preSubmit(List<SubmitOperationDTO> records) {
		Map<Integer, Operation> observers = eventManager.getOrDefault(EventList.OPERATION_SUBMIT_EVENT, new HashMap<Integer, Operation>());
		Map<String, Object> params = buildParam(records);
		records.forEach(record -> observers.get((int)record.getOperationId()).check(params));		
	}

	@Override
	public List<SubmitOperationDTO> instantSettle(List<SubmitOperationDTO> records) {		
		Map<Boolean, List<SubmitOperationDTO>> temp =records.stream()
				.collect(partitioningBy(SubmitOperationDTO::isImmediately));
		Map<Integer, Operation> observers = eventManager.getOrDefault(EventList.OPERATION_SUBMIT_EVENT, new HashMap<Integer, Operation>());
		Map<String, Object> params = buildParam(records);
		temp.getOrDefault(true, new ArrayList<>()).stream().forEach(record -> observers.get((int)record.getOperationId()).check(params));
		return temp.getOrDefault(false, new ArrayList<>());
	}
	
	private Map<String, Object> buildParam(List<SubmitOperationDTO> records){
		Map<String, Object> param = new HashMap<>();
		param.put("operations", records);
		return param;
	}

}
