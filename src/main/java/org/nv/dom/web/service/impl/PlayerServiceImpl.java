package org.nv.dom.web.service.impl;

import static java.util.stream.Collectors.groupingBy;
import static java.util.stream.Collectors.joining;
import static java.util.stream.Collectors.toList;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.game.GameForm;
import org.nv.dom.domain.message.chat.ChatDetail;
import org.nv.dom.domain.player.OperationSession;
import org.nv.dom.domain.player.PlayerCount;
import org.nv.dom.domain.player.PlayerFeedback;
import org.nv.dom.domain.player.PlayerGameStatus;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperation;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.domain.player.PlayerReplaceSkin;
import org.nv.dom.dto.operation.SavePlayerOperationDTO;
import org.nv.dom.dto.operation.SubmitOperationDTO;
import org.nv.dom.dto.operation.SubmitPlayerOperationDTO;
import org.nv.dom.dto.player.ApplyDTO;
import org.nv.dom.dto.player.GetPlayerOperationDTO;
import org.nv.dom.dto.player.JudgerDecisionDTO;
import org.nv.dom.dto.player.SaveFeedbackDTO;
import org.nv.dom.dto.player.UpdatePlayerStatusDTO;
import org.nv.dom.enums.PlayerStatus;
import org.nv.dom.util.ConfigUtil;
import org.nv.dom.util.HttpClientUtil;
import org.nv.dom.util.StringUtil;
import org.nv.dom.web.dao.game.GameMapper;
import org.nv.dom.web.dao.player.PlayerMapper;
import org.nv.dom.web.service.PlayerService;
import org.nv.dom.web.util.EventUtilService;
import org.nv.dom.web.util.GameUtilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.alibaba.fastjson.JSON;

@Service("playerServiceImpl")
public class PlayerServiceImpl implements PlayerService {
	
	@Autowired
	PlayerMapper playerMapper;
	
	@Autowired
	GameMapper gameMapper;
	
	@Autowired
	GameUtilService gameUtil;
	
	@Autowired
	EventUtilService eventUtil;

	@Override
	public Map<String, Object> getPlayerInfo(long gameId) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<PlayerInfo> playerList = playerMapper.getPlayerInfosDao(gameId);
		List<PlayerOperationRecord> operationRecords = playerMapper.getCurGameAllOperation(gameId,0);
		List<PlayerFeedback> feedbacks = playerMapper.getCurGameAllFeedback(gameId);
		List<PlayerGameStatus> statusList = playerMapper.getCurGameAllStatus(gameId); 
		List<PlayerCount> counts = playerMapper.getCurGameAllCount(gameId);
		List<GameForm> formList = gameMapper.getFormListDao(gameId,false);
		playerList.forEach(player -> {
			player.setStatus(statusList.stream()
					.filter(status -> status.getPlayerId() == player.getPlayerId())
					.collect(toList()));
			player.setStatusStr(player.getStatus().stream()
					.map(PlayerGameStatus::getStatusName)
					.collect(joining("，")));
			player.setCount(counts.stream()
					.filter(count -> count.getPlayerId() == player.getPlayerId())
					.collect(toList()));
			player.setCountStr(player.getCount().stream()
					.map(count -> count.getCountName()+"*"+count.getCountNum())
					.collect(joining("，")));
		});
		Map<Long, List<PlayerFeedback>> temp = feedbacks.stream().collect(groupingBy(PlayerFeedback::getOperationRecordId));
		operationRecords.forEach(record -> record.setFeedback(temp.get(record.getId())));
		Map<Long, List<PlayerOperationRecord>> records = operationRecords.stream().collect(groupingBy(PlayerOperationRecord::getFormId));
		formList.forEach(form -> form.setRecords(records.get(form.getFormId())));
		result.put("playerList", playerList);
		result.put("formList", formList);
		result.put("playerListStr", JSON.toJSONString(playerList));
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取角色列表成功");
		return result;
	}

	@Override
	public Map<String, Object> getReplaceSkin(long playerId) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<PlayerReplaceSkin> replaceList = playerMapper.getReplaceSkinDao(playerId);
		result.put("replaceList", replaceList);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取代替发言称呼列表成功");
		return result;
	}

	@Override
	public Map<String, Object> saveReplaceSkin(PlayerReplaceSkin playerReplaceSkin) {
		Map<String, Object> result = new HashMap<String, Object>();
		playerMapper.createOrUpdateReplaceSkinDao(playerReplaceSkin);
		result.put("skinId", playerReplaceSkin.getId());
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "保存发言称呼成功");
		return result;
	}

	@Override
	public Map<String, Object> deleteReplaceSkin(long skinId) {
		Map<String, Object> result = new HashMap<String, Object>();
		playerMapper.deleteReplaceSkinDao(skinId);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "删除发言称呼成功");
		return result;
	}
	
	@Override
	public Map<String, Object> becomeJudger(ApplyDTO applyDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		Assert.isTrue(gameMapper.queryHasAttendGameDao(applyDTO.getUserId()) == 0, "已参加其他版杀，加入失败");
		applyDTO.setStatus(PlayerStatus.ALTER_JUDGER.getCode());
		gameMapper.applyForGameDao(applyDTO);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "加入版杀成功");	
		return result;
	}

	@Override
	public Map<String, Object> dealJudgerDecision(JudgerDecisionDTO judgerDecisionDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		if("yes".equals(judgerDecisionDTO.getDecision())){
			UpdatePlayerStatusDTO updatePlayerStatusDTO = new UpdatePlayerStatusDTO();
			updatePlayerStatusDTO.setPlayerId(judgerDecisionDTO.getPlayerId());
			updatePlayerStatusDTO.setStatus(PlayerStatus.JUDGER.getCode());
			playerMapper.updateOnePlayerStatus(updatePlayerStatusDTO);
		}else{
			gameMapper.deletePlayerApplyInfoDao(judgerDecisionDTO.getPlayerId());
		}
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "操作成功");
		return result;
	}

	@Override
	public Map<String, Object> getPlayerOperation(GetPlayerOperationDTO getPlayerOperationDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		int stage = gameUtil.getCurStage(getPlayerOperationDTO.getGameId());
		GameForm form = gameUtil.getCurForm(getPlayerOperationDTO.getGameId());
		List<PlayerOperation> operationList = playerMapper.getPlayerOperationList(getPlayerOperationDTO.getPlayerId(), stage);
		List<Long> statusList = playerMapper.getGameStatusByPlayerId(getPlayerOperationDTO.getPlayerId());
		if(statusList.contains(25L)){
			operationList.removeIf(operation -> operation.getOperationId()<100);
		}
		operationList.forEach(operation -> operation.setOptions(playerMapper.getOperationOption(operation.getOperationId())));
		List<PlayerOperationRecord> operationRecord = playerMapper.getPlayerOperationRecord(getPlayerOperationDTO.getPlayerId(), form.getFormId());
		result.put("curStage", form.getHeader());
		result.put("operationList", operationList);
		result.put("operationRecord", operationRecord);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取玩家操作成功");
		return result;
	}
	
	@Override
	public Map<String, Object> submitOperation(SubmitPlayerOperationDTO submitPlayerOperationDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<SubmitOperationDTO> remains;
		if(submitPlayerOperationDTO.isJumpSettle()){
			remains = submitPlayerOperationDTO.getRecords();		
		} else {
			eventUtil.preSubmit(submitPlayerOperationDTO.getRecords());
			remains = eventUtil.instantSettle(submitPlayerOperationDTO.getRecords());
		}
		long formId = gameUtil.getCurForm(submitPlayerOperationDTO.getGameId()).getFormId();
		playerMapper.deletePlayerOperationRecord(formId,submitPlayerOperationDTO.getPlayerId());
		remains.forEach(submit -> {
			PlayerOperationRecord record = new PlayerOperationRecord();
			record.setFormId(formId);
			record.setOperationId(submit.getOperationId());
			record.setParam(submit.getParam() == null ? null:JSON.toJSONString(submit.getParam()));
			record.setOperationStr(submit.getOperationStr());
			record.setOperator(submit.getOperator());
			record.setPlayerId(submit.getPlayerId());
			record.setIsDone(submit.isImmediately() ? 1 : 0);
			playerMapper.insertPlayerOperationRecord(record);
			if(submit.isImmediately()){
				List<PlayerOperation> consumer = new ArrayList<>();
				consumer.add(new PlayerOperation(submit.getPlayerId(),submit.getOperationId()));
				gameUtil.consumeOperationTimes(consumer);
			}
		});
		HttpClientUtil.doPostJson("http://"+ConfigUtil.getVersionConfigProperty("chat.server")+"/submitOpreation", 
				String.valueOf(submitPlayerOperationDTO.getGameId()));
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "提交操作成功");
		return result;
	}

	@Override
	public Map<String, Object> getOperationList(long playerId) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<PlayerOperation> operationList = playerMapper.getPlayerAllOperationList(playerId);
		result.put("operationList", operationList);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取操作列表成功");
		return result;
	}

	@Override
	public Map<String, Object> savePlayerOperation(SavePlayerOperationDTO savePlayerOperationDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		playerMapper.deletePlayerOperation(savePlayerOperationDTO.getPlayerId());
		if(!savePlayerOperationDTO.getOperations().isEmpty()){
			playerMapper.insertPlayerOperation(savePlayerOperationDTO.getOperations());
		}
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "保存玩家操作列表成功");
		return result;
	}

	@Override
	public Map<String, Object> saveFeedback(SaveFeedbackDTO saveFeedbackDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		if(saveFeedbackDTO.getIsDone() != 1){
			gameUtil.consumeOperationTimes(Arrays.asList(new PlayerOperation(saveFeedbackDTO.getPlayerId(),saveFeedbackDTO.getOperationId())));
			playerMapper.settleOperationBatch(Arrays.asList(saveFeedbackDTO.getOperationRecordId()));
		}
		long formId = gameUtil.getCurForm(saveFeedbackDTO.getGameId()).getFormId();
		playerMapper.deletePlayerFeedback(saveFeedbackDTO.getOperationRecordId());
		if(!saveFeedbackDTO.getFeedbacks().isEmpty()){
			saveFeedbackDTO.getFeedbacks().forEach(feedback -> feedback.setFormId(formId));
			playerMapper.insertPlayerFeedbackBatch(saveFeedbackDTO.getFeedbacks());
		}		
		if(saveFeedbackDTO.isFeedbackNow()){
			gameUtil.sendMessage(saveFeedbackDTO.getFeedbacks(), saveFeedbackDTO.getJudegerId());
		}
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "保存反馈成功");
		return result;
	}

	@Override
	public Map<String, Object> autoSettlement(ChatDetail chatDetail) {
		Map<String, Object> result = new HashMap<String, Object>();
		if(!StringUtil.isNullOrEmpty(chatDetail.getPayLoad())){
			OperationSession session = JSON.parseObject(chatDetail.getPayLoad(), OperationSession.class);
			session.setCommand(chatDetail.getContent());
			session.setPlayerId(playerMapper.getPlayerIdByUserId(chatDetail.getFromUserId()));
			eventUtil.autoSettle(session);
		}
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "结算成功");
		return result;
	}

}
