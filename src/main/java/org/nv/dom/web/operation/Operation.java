package org.nv.dom.web.operation;

import java.util.List;

import java.util.Map;
import java.util.Random;
import java.util.function.Predicate;

import javax.annotation.PostConstruct;

import org.nv.dom.config.NVTermConstant;
import org.nv.dom.domain.player.PlayerOperation;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.dto.operation.SubmitOperationDTO;
import org.nv.dom.web.util.EventUtilService;
import org.nv.dom.web.util.GameUtilService;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;

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
	
	public abstract boolean check(Map<String, Object> param);
	
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
		@SuppressWarnings("unchecked")
		List<SubmitOperationDTO> operations = (List<SubmitOperationDTO>) param.get("operations");
		SubmitOperationDTO operation = findTarget(operations, record -> record.getOperationId() == operationId);
		PlayerOperationRecord record = new PlayerOperationRecord();
		record.setGameId(operation.getGameId());
		record.setPlayerId(operation.getPlayerId());
		record.setParam(operation.getParam() == null ? null:JSON.toJSONString(operation.getParam()));
		record.setOperationStr(operation.getOperationStr());
		record.setOperator(operation.getOperator());
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
	
	public long getTarget(Object target){
		String[] str = target.toString().split(",");
		return Long.parseLong(str[0]);
	}
	
	@PostConstruct
	public abstract void registerEvent();

}
