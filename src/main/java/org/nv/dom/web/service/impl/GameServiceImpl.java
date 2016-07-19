package org.nv.dom.web.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.NVTermConstant;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.game.ApplyingGame;
import org.nv.dom.domain.user.UserApplyInfo;
import org.nv.dom.dto.game.ApplyDTO;
import org.nv.dom.dto.game.ChangeStatusDTO;
import org.nv.dom.dto.game.PublishGameDTO;
import org.nv.dom.dto.player.PlayerInfoDTO;
import org.nv.dom.enums.GameStatus;
import org.nv.dom.util.StringUtil;
import org.nv.dom.util.json.JacksonJSONUtils;
import org.nv.dom.web.dao.game.GameMapper;
import org.nv.dom.web.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("gameServiceImpl")
public class GameServiceImpl implements GameService {
	
	private Logger logger = Logger.getLogger(GameServiceImpl.class);
	
	@Autowired
	GameMapper gameMapper;

	@Override
	public Map<String, Object> getApplyingGames(long userId) {
		Map<String, Object> result = new HashMap<String, Object>();
		ApplyingGame applyingGame;
		try{
			applyingGame = gameMapper.getApplyingGamesDao(userId);
			applyingGame.setPlayCurNum(applyingGame.getPlayers().size());
			applyingGame.setGameStatusDesc(GameStatus.getMessageByCode(applyingGame.getGameStatus()));
			for(UserApplyInfo userApplyInfo:applyingGame.getPlayers()){
				String isSp=userApplyInfo.getIsSp();
				if(StringUtil.isNullOrEmpty(isSp)){
					userApplyInfo.setCharacterName("未选择");
				} else if(isSp.equals(NVTermConstant.IS_SP)){
					userApplyInfo.setCharacterName("sp"+userApplyInfo.getCharacterName());
				}
				String applyPioneer=userApplyInfo.getApplyPioneer();
				if(StringUtil.isNullOrEmpty(applyPioneer)){
					userApplyInfo.setApplyPioneer("未选择");
				} else if(applyPioneer.equals(NVTermConstant.APPLY_PIONEER)){
					userApplyInfo.setApplyPioneer("是");
				} else {
					userApplyInfo.setApplyPioneer("否");
				}
			}
			result.put("applyingGame", applyingGame);
			result.put("applyingGameStr", JacksonJSONUtils.beanToJSON(applyingGame));
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取版杀信息成功");
		} catch (Exception e){
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}	
		return result;
	}

	@Override
	public Map<String, Object> publishGame(PublishGameDTO publishGameDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		if(publishGameDTO == null || publishGameDTO.getGameDesc() == null
				|| publishGameDTO.getPlayerNum() < 0L || publishGameDTO.getStartDate() == null
				|| publishGameDTO.getJudgerId() < 0L){
			result.put(PageParamType.BUSINESS_STATUS, -2);
			result.put(PageParamType.BUSINESS_MESSAGE, "参数异常");
			return result;
		}
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		if(publishGameDTO.getStartDate().compareTo(today)<0){
			result.put(PageParamType.BUSINESS_STATUS, -4);
			result.put(PageParamType.BUSINESS_MESSAGE, "开版时间不能早于今天");
			return result;
		}
		try{
			if(gameMapper.queryHasAttendGameDao(publishGameDTO.getJudgerId()) > 0){
				result.put(PageParamType.BUSINESS_STATUS, -3);
				result.put(PageParamType.BUSINESS_MESSAGE, "已参加其他版杀，不能开新版杀");
				return result;
			}
			ApplyDTO applyDTO = new ApplyDTO();
			gameMapper.publishGameDao(publishGameDTO);
			applyDTO.setGameId(publishGameDTO.getGameId());
			applyDTO.setUserId(publishGameDTO.getJudgerId());
			if(gameMapper.applyForGameDao(applyDTO) == 1){
				result.put(PageParamType.BUSINESS_STATUS, 1);
				result.put(PageParamType.BUSINESS_MESSAGE, "发布成功");
				return result;
			} else {
				result.put(PageParamType.BUSINESS_STATUS, 1);
				result.put(PageParamType.BUSINESS_MESSAGE, "发布失败，请稍后重试");
				return result;
			}	
		} catch(Exception e){
			logger.info(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
			return result;
		}
	}

	@Override
	public Map<String, Object> changeStatus(ChangeStatusDTO changeStatusDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			if(gameMapper.changeStatusDao(changeStatusDTO) == 1){
				result.put(PageParamType.BUSINESS_STATUS, 1);
				result.put(PageParamType.BUSINESS_MESSAGE, "修改状态成功");
			} else {
				result.put(PageParamType.BUSINESS_STATUS, -3);
				result.put(PageParamType.BUSINESS_MESSAGE, "修改失败，请重试");
			}	
		}catch(Exception e){
			logger.info(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

	@Override
	public Map<String, Object> submitList(List<PlayerInfoDTO> playerList) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			if(gameMapper.submitApplyListDao(playerList) == playerList.size()){
				result.put(PageParamType.BUSINESS_STATUS, 1);
				result.put(PageParamType.BUSINESS_MESSAGE, "提交全名单成功");
			} else {
				result.put(PageParamType.BUSINESS_STATUS, -3);
				result.put(PageParamType.BUSINESS_MESSAGE, "提交全名单失败，请重试");
			}	
		}catch(Exception e){
			logger.info(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

}
