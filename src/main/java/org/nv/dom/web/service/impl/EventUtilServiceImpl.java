package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nv.dom.config.EventList;
import org.nv.dom.dto.operation.SubmitOperationDTO;
import org.nv.dom.web.operation.Operation;
import org.nv.dom.web.service.EventUtilService;
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
		records.forEach(record -> observers.get((int)record.getOperationId()).check(buildParam(record)));		
	}

	@Override
	public List<SubmitOperationDTO> instantSettle(List<SubmitOperationDTO> records) {		
		Map<Boolean, List<SubmitOperationDTO>> temp =records.stream()
				.collect(partitioningBy(SubmitOperationDTO::isImmediately));
		Map<Integer, Operation> observers = eventManager.getOrDefault(EventList.OPERATION_SUBMIT_EVENT, new HashMap<Integer, Operation>());
		temp.getOrDefault(true, new ArrayList<>()).stream().forEach(record -> observers.get((int)record.getOperationId()).check(buildParam(record)));
		return temp.getOrDefault(false, new ArrayList<>());
	}
	
	private Map<String, Object> buildParam(SubmitOperationDTO record){
		Map<String, Object> param = new HashMap<>();
		param.put("gameId", record.getGameId());
		param.put("playerId", record.getPlayerId());
		param.put("operationId", record.getOperationId());
		param.put("param", record.getParam());
		return param;
	}

}
