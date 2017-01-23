package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.NVTermConstant;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.essay.Essay;
import org.nv.dom.domain.game.GameForm;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.user.UserApplyInfo;
import org.nv.dom.util.StringUtil;
import org.nv.dom.util.json.JacksonJSONUtils;
import org.nv.dom.web.dao.essay.EssayMapper;
import org.nv.dom.web.dao.game.GameMapper;
import org.nv.dom.web.service.EssayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("essayServiceImpl")
public class EssayServiceImpl implements EssayService {
	
	private Logger logger = Logger.getLogger(EssayServiceImpl.class);
	
	@Autowired
	EssayMapper essayMapper;
	
	@Autowired
	GameMapper	gameMapper;

	@Override
	public Map<String, Object> publishEssay(Essay essay, long gameId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			if(essayMapper.saveOrUpdateEssayDao(essay)==1){
				gameMapper.updateReplayInfoDao(essay.getEssayId(), gameId);
				result.put("essayId", essay.getEssayId());
				result.put(PageParamType.BUSINESS_STATUS, 1);
				result.put(PageParamType.BUSINESS_MESSAGE, "保存复盘成功");
			}else{
				result.put(PageParamType.BUSINESS_STATUS, -3);
				result.put(PageParamType.BUSINESS_MESSAGE, "保存复盘失败");
			}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
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
		try{
			List<UserApplyInfo> gameplayers = gameMapper.queryGamePlayerDao(gameId);
			List<GameForm> gameForms = gameMapper.getFormListDao(gameId, true);
			StringBuilder sb = new StringBuilder();
			sb.append("全名单<br>");
			for(UserApplyInfo player : gameplayers){
				if(StringUtil.isNullOrEmpty(player.getCharacterName())) continue;
				player.setCharacterName(NVTermConstant.IS_SP.equals(player.getIsSp()) ? "sp"+player.getCharacterName():player.getCharacterName());
				sb.append(player.getNickname()+" "+player.getCharacterName()+" "+player.getIdentityDesc()+"<br>");
			}
			sb.append("<br>");
			for(int i=gameForms.size()-1;i>0;i--){
				GameForm form = gameForms.get(i);
				sb.append(form.getHeader());
				sb.append("<br><br>");
				List<PlayerInfo> players = JacksonJSONUtils.jsonToList(form.getContent(), PlayerInfo.class);
				for(PlayerInfo player:players){
					if(!StringUtil.isNullOrEmpty(player.getAction())){
						sb.append(player.getIdentityDesc().trim()+" ");
						sb.append(player.getAction().trim());
						if(!StringUtil.isNullOrEmpty(player.getFeedback())){
							sb.append("→"+player.getFeedback().trim());
						}
						sb.append("<br>");
					} 
				}
				sb.append("<br>");
				for(PlayerInfo player:players){
					if(!StringUtil.isNullOrEmpty(player.getPrivilege())){
						sb.append(player.getCharacterName().trim()+" ");
						sb.append(player.getPrivilege().trim());
						if(!StringUtil.isNullOrEmpty(player.getFeedback())){
							sb.append("→"+player.getFeedback().trim());
						}
						sb.append("<br>");
					}
				}
				sb.append("<br>");
				for(PlayerInfo player:players){
					if(!StringUtil.isNullOrEmpty(player.getVote())){
						sb.append(player.getCharacterName().trim()+" ");
						sb.append(player.getVote().trim());
						sb.append("<br>");
					}
				}	
				sb.append("<br>");
			}
			result.put("simpleEssay", sb.toString());
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "简易复盘生成成功！");
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}
	
	

}
