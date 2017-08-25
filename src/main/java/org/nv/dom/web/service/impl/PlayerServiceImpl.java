package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.game.GameForm;
import org.nv.dom.domain.player.PlayerFeedback;
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
import org.nv.dom.dto.player.UpdatePlayerStatusDTO;
import org.nv.dom.enums.PlayerStatus;
import org.nv.dom.web.dao.game.GameMapper;
import org.nv.dom.web.dao.player.PlayerMapper;
import org.nv.dom.web.service.PlayerService;
import org.nv.dom.web.util.EventUtilService;
import org.nv.dom.web.util.GameUtilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.alibaba.fastjson.JSON;

import static java.util.stream.Collectors.*;

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
		long formId = gameUtil.getCurForm(gameId).getFormId();
		List<PlayerInfo> playerList = playerMapper.getPlayerInfosDao(gameId);
		List<PlayerOperationRecord> records = playerMapper.getCurStageAllOperation(formId);
		List<PlayerFeedback> feedbacks = playerMapper.getCurStageAllFeedback(formId);
		playerList.forEach(player -> {
			String lastOperation = records.stream()
					.filter(record -> record.getPlayerId() == player.getPlayerId())
					.findFirst()
					.orElse(new PlayerOperationRecord()).getOperationStr();
			player.setLastOperation(lastOperation);
			String lastFeedback = feedbacks.stream()
					.filter(feedback -> feedback.getPlayerId() == player.getPlayerId())
					.findFirst()
					.orElse(new PlayerFeedback()).getFeedback();
			player.setLastFeedback(lastFeedback);
		});
		Map<Long,List<PlayerFeedback>> temp = feedbacks.stream().collect(groupingBy(PlayerFeedback::getOperationRecordId));
		records.forEach(record -> record.setFeedback(temp.get(record.getId())));
		result.put("playerList", playerList);
		result.put("operationList", records);
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
			record.setIsDone(0);
			playerMapper.insertPlayerOperationRecord(record);
		});
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

}
