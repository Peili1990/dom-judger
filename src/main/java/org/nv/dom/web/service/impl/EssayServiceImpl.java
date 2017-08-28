package org.nv.dom.web.service.impl;

import static java.util.stream.Collectors.groupingBy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.NVTermConstant;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.essay.Essay;
import org.nv.dom.domain.game.GameForm;
import org.nv.dom.domain.player.PlayerFeedback;
import org.nv.dom.domain.player.PlayerOperationRecord;
import org.nv.dom.domain.user.UserApplyInfo;
import org.nv.dom.util.StringUtil;
import org.nv.dom.web.dao.essay.EssayMapper;
import org.nv.dom.web.dao.game.GameMapper;
import org.nv.dom.web.dao.player.PlayerMapper;
import org.nv.dom.web.service.EssayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;


@Service("essayServiceImpl")
public class EssayServiceImpl implements EssayService {
	
	private Logger logger = Logger.getLogger(EssayServiceImpl.class);
	
	@Autowired
	EssayMapper essayMapper;
	
	@Autowired
	GameMapper	gameMapper;
	
	@Autowired
	PlayerMapper playerMapper;

	@Override
	public Map<String, Object> publishEssay(Essay essay, long gameId) {
		Map<String, Object> result = new HashMap<String, Object>();
		Assert.isTrue(essayMapper.saveOrUpdateEssayDao(essay) == 1, "保存复盘失败");	
		gameMapper.updateReplayInfoDao(essay.getEssayId(), gameId);
		result.put("essayId", essay.getEssayId());
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "保存复盘成功");
		return result;
	}

	@Override
	public Essay getReplayEssay(long gameId) {
		Essay replayEssay = null;
		try{
			replayEssay = essayMapper.getReplayEssay(gameId);
		}catch(Exception e){
			logger.error(e.getMessage(),e);
		}
		return replayEssay;
	}

	@Override
	public Map<String, Object> simpleEssayBuild(long gameId) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<UserApplyInfo> gameplayers = gameMapper.queryGamePlayerDao(gameId);
		List<GameForm> gameForms = gameMapper.getFormListDao(gameId, true);
		List<PlayerOperationRecord> operationRecords = playerMapper.getCurGameAllOperation(gameId,0);
		List<PlayerFeedback> playerFeedbacks = playerMapper.getCurGameAllFeedback(gameId);
		Map<Long, List<PlayerFeedback>> feedbackMap = playerFeedbacks.stream().collect(groupingBy(PlayerFeedback::getOperationRecordId));
		Map<Long, List<PlayerOperationRecord>> recordMap = operationRecords.stream().collect(groupingBy(PlayerOperationRecord::getFormId));
		StringBuilder sb = new StringBuilder();
		sb.append("全名单<br>");
		for(UserApplyInfo player : gameplayers){
			if(StringUtil.isNullOrEmpty(player.getCharacterName())) continue;
			player.setCharacterName(NVTermConstant.IS_SP.equals(player.getIsSp()) ? "sp"+player.getCharacterName():player.getCharacterName());
			sb.append(player.getNickname()+" "+player.getCharacterName()+" "+player.getIdentityDesc()+"<br>");
		}
		sb.append("<br>");
		for(int i=gameForms.size()-1;i>=0;i--){
			GameForm form = gameForms.get(i);
			sb.append(form.getHeader());
			sb.append("<br><br>");
			List<PlayerOperationRecord> records = recordMap.getOrDefault(form.getFormId(), new ArrayList<>());
			records.forEach(record -> {
				sb.append("<==");
				sb.append(StringUtil.isNullOrEmpty(record.getOperator()) ? record.getOperationStr() : 
					record.getOperator() + "提交操作：" + record.getOperationStr());
				sb.append("<br>");
				List<PlayerFeedback> feedbacks = feedbackMap.getOrDefault(record.getId(), new ArrayList<>());
				feedbacks.forEach(feedback -> {
					sb.append("==>反馈"+feedback.getCharacterName()+"："+feedback.getFeedback());
					sb.append("<br>");
				});
			});
			sb.append("<br>");
		}
		result.put("simpleEssay", sb.toString());
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "简易复盘生成成功！");
		return result;
	}
	
}
