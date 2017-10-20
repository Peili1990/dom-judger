package org.nv.dom.web.operation;

import static java.util.stream.Collectors.joining;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.function.Predicate;

import javax.annotation.PostConstruct;

import org.nv.dom.config.NVTermConstant;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperation;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.dto.operation.SubmitOperationDTO;
import org.nv.dom.web.util.EventUtilService;
import org.nv.dom.web.util.GameUtilService;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;

@SuppressWarnings("unchecked")
public abstract class Operation {
	
	protected int operationId;
	
	protected Random random = new Random();
	
	@Autowired
	protected EventUtilService eventService;
	
	@Autowired
	protected GameUtilService gameUtil;

	public int getOperationId() {
		return operationId;
	}

	public void setOperationId(int operationId) {
		this.operationId = operationId;
	}
	
	public int randomNum(int length) {
		return random.nextInt(length);
	}
	
	public abstract void check(Map<String, Object> param);
	
	public abstract PlayerOperationRecord settle(Map<String, Object> param);
	
	public void accept(Map<String, Object> param){
		PlayerOperationRecord record = settle(param);
		if(record == null) return;
		long gameId = record.getGameId();
		long formId = gameUtil.getCurForm(gameId).getFormId();
		record.setFormId(formId);
		record.setOperationId(operationId);
		record.setIsDone(1);
		gameUtil.insertOperationRecord(record);
		if(record.getFeedback() != null){
			gameUtil.sendMessage(record.getFeedback(), NVTermConstant.ADMINISTRATOR);
		}		
	}
	
	public PlayerOperationRecord buildPlayerOperationRecord(Map<String, Object> param){
		List<SubmitOperationDTO> operations = (List<SubmitOperationDTO>) param.get("operations");
		PlayerOperationRecord record = new PlayerOperationRecord();
		if(operations == null){
			record.setGameId((long)param.get("gameId"));
		} else {
			SubmitOperationDTO operation = findTarget(operations, r -> r.getOperationId() == operationId);			
			record.setGameId(operation.getGameId());
			record.setPlayerId(operation.getPlayerId());
			record.setParam(operation.getParam() == null ? null:JSON.toJSONString(operation.getParam()));
			record.setOperationStr(operation.getOperationStr());
			record.setOperator(operation.getOperator());
		}
		
		return record;
	}
	
	public PlayerOperation buildPlayerOperation(long playerId, long operationId, int times){
		PlayerOperation playerOperation = new PlayerOperation();
		playerOperation.setPlayerId(playerId);
		playerOperation.setOperationId(operationId);
		playerOperation.setTimes(times);
		return playerOperation;		
	}
	
	public <T> T findTarget(List<T> operations,Predicate<T> clue){
		return operations.stream().filter(clue).findAny().orElse(null);
	}
	
	public int getSequence(Object target){
		String[] str = target.toString().split(",");
		return Integer.valueOf(str[0]);
	}
	
	public String getDescription(Object target){
		String[] str = target.toString().split(",");
		return str.length == 1 ? str[0] : str[1];
	}
	
	public <T> T get(Map<String, Object> param, String name){
		return (T) param.get(name);
	}
	
	@PostConstruct
	public abstract void registerEvent();
	
	protected String rollCharacter(List<PlayerInfo> groupOne,int numOne,List<PlayerInfo> groupTwo,int numTwo){
		List<PlayerInfo> list = new ArrayList<>();
		if(groupOne.size()<numOne){
			return null;
		}
		Collections.shuffle(groupOne);
		List<PlayerInfo> stepOne = groupOne.subList(0, numOne);
		if(stepOne.stream().anyMatch(player -> player.getCharacterId() == 41 && player.getIsSp() == 0)){
			return null;
		}
		list.addAll(stepOne);
		Collections.shuffle(groupTwo);
		List<PlayerInfo> stepTwo = groupTwo.subList(0, numTwo);
		stepTwo.removeIf(player -> player.getCharacterId() == 41 && player.getIsSp() == 0);
		list.addAll(stepTwo);
		Collections.shuffle(list);
		return list.stream().map(PlayerInfo::getCharacterName).collect(joining("，"));
	}

}
