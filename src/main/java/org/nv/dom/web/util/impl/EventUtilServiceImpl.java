package org.nv.dom.web.util.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nv.dom.config.EventList;
import org.nv.dom.config.OperationParam;
import org.nv.dom.domain.player.OperationSession;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.dto.operation.SubmitOperationDTO;
import org.nv.dom.web.operation.Operation;
import org.nv.dom.web.util.EventUtilService;
import org.nv.dom.web.util.GameUtilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static java.util.stream.Collectors.*;

import java.util.ArrayList;

@Service("eventService")
public class EventUtilServiceImpl implements EventUtilService {
	
	private Map<String, Map<Integer, Operation>> eventManager = new HashMap<>();
	
	@Autowired
	GameUtilService gameUtil;

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
		List<PlayerInfo> playerInfos = gameUtil.getPlayerInfo((long)param.get("gameId"));
		param.put(OperationParam.PLAYER_INFO, playerInfos);
		param.put(OperationParam.EVENT, event);
		Map<Integer, Operation> observers = eventManager.getOrDefault(event, new HashMap<Integer, Operation>());
		observers.keySet().stream().forEach(id -> observers.get(id).check(param));	
		observers.keySet().stream().forEach(id -> observers.get(id).accept(param));	
	}

	@Override
	public void preSubmit(List<SubmitOperationDTO> records) {
		Map<Integer, Operation> observers = eventManager.getOrDefault(EventList.OPERATION_SUBMIT_EVENT, new HashMap<Integer, Operation>());
		Map<String, Object> params = buildParam(records);
		records.forEach(record -> {
			if(observers.containsKey((int)record.getOperationId())){
				observers.get((int)record.getOperationId()).check(params);
			}		
		});		
	}

	@Override
	public List<SubmitOperationDTO> instantSettle(List<SubmitOperationDTO> records) {		
		Map<Boolean, List<SubmitOperationDTO>> temp =records.stream()
				.collect(partitioningBy(SubmitOperationDTO::isImmediately));
		Map<Integer, Operation> observers = eventManager.getOrDefault(EventList.OPERATION_SUBMIT_EVENT, new HashMap<Integer, Operation>());
		Map<String, Object> params = buildParam(records);
		temp.getOrDefault(true, new ArrayList<>()).stream().forEach(record -> {
			if(observers.containsKey((int)record.getOperationId())){
				observers.get((int)record.getOperationId()).accept(params);
			} else {
				temp.getOrDefault(false, new ArrayList<>()).add(record);
			}
		});
		return temp.getOrDefault(false, new ArrayList<>());
	}
	
	private Map<String, Object> buildParam(List<SubmitOperationDTO> records){
		Map<String, Object> param = new HashMap<>();
		param.put(OperationParam.EVENT, EventList.OPERATION_SUBMIT_EVENT);
		param.put(OperationParam.OPERATIONS, records);
		if(!records.isEmpty()){
			long gameId = records.get(0).getGameId();
			List<PlayerInfo> playerInfos = gameUtil.getPlayerInfo(gameId);
			param.put(OperationParam.GAME_ID, gameId);
			param.put(OperationParam.PLAYER_INFO, playerInfos);
		}
		return param;
	}

	@Override
	public void autoSettle(OperationSession session) {
		Map<Integer, Operation> observers = eventManager.getOrDefault(EventList.CHAT_SUBMIT_EVENT, new HashMap<Integer, Operation>());
		Map<String, Object> params = new HashMap<>();
		params.put(OperationParam.SESSION, session);
		params.put(OperationParam.EVENT, EventList.CHAT_SUBMIT_EVENT);
		if(observers.containsKey((int)session.getOperationId())){
			observers.get((int)session.getOperationId()).accept(params);
		}		
	}

}
