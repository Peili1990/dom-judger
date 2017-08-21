package org.nv.dom.web.operation;

import java.util.List;

import java.util.Map;
import java.util.Random;

import javax.annotation.PostConstruct;

import org.nv.dom.config.NVTermConstant;
import org.nv.dom.domain.message.chat.ChatDetail;
import org.nv.dom.domain.player.PlayerFeedback;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.util.ConfigUtil;
import org.nv.dom.util.HttpClientUtil;
import org.nv.dom.web.service.GameUtilService;
import org.nv.dom.web.service.EventUtilService;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSON;

import static java.util.stream.Collectors.*;

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
	
	public void sendMessage(List<PlayerFeedback> feedbacks) {
		List<ChatDetail> chatDetails = feedbacks.stream()
				.map(feedback -> {
					ChatDetail chatDetail = new ChatDetail();
					long userId = gameUtil.getUserIdByPlayerId(feedback.getPlayerId());
					String chatId = userId > 2 ? NVTermConstant.ADMINISTRATOR + "-"+ userId :
						userId + "-" + NVTermConstant.ADMINISTRATOR;
					chatDetail.setChatId(chatId);
					chatDetail.setFromUserId(NVTermConstant.ADMINISTRATOR);
					chatDetail.setToUserId(userId);
					chatDetail.setContent(feedback.getFeedback());
					return chatDetail;
				}).collect(toList());
		HttpClientUtil.doPostJson("http://"+ConfigUtil.getVersionConfigProperty("chat.server")+"/sendMessageBatch", 
				JSON.toJSONString(chatDetails));
	};
	
	public void accept(Map<String, Object> param){
		PlayerOperationRecord record = settle(param);
		long formId = gameUtil.getCurForm((long) param.get("gameId")).getFormId();
		record.setFormId(formId);
		record.setOperationId(operationId);
		record.setIsDone(1);
		gameUtil.insertOperationRecord(record);
		if(record.getFeedback() != null){
			sendMessage(record.getFeedback());
		}		
	}
	
	@PostConstruct
	public abstract void registerEvent();

}
