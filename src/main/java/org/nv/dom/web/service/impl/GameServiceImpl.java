package org.nv.dom.web.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.NVTermConstant;
import org.nv.dom.config.PageParamType;
import org.nv.dom.config.RedisConstant;
import org.nv.dom.domain.game.ApplyingGame;
import org.nv.dom.domain.game.GameForm;
import org.nv.dom.domain.newspaper.Newspaper;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.user.UserApplyInfo;
import org.nv.dom.dto.game.ChangeStatusDTO;
import org.nv.dom.dto.game.PublishGameDTO;
import org.nv.dom.dto.player.ApplyDTO;
import org.nv.dom.dto.player.KickPlayerDTO;
import org.nv.dom.enums.GameStatus;
import org.nv.dom.enums.PlayerStatus;
import org.nv.dom.util.DateFormatUtil;
import org.nv.dom.util.StringUtil;
import org.nv.dom.util.json.JacksonJSONUtils;
import org.nv.dom.web.dao.character.CharacterMapper;
import org.nv.dom.web.dao.game.GameMapper;
import org.nv.dom.web.dao.newspaper.NewspaperMapper;
import org.nv.dom.web.dao.player.PlayerMapper;
import org.nv.dom.web.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("gameServiceImpl")
public class GameServiceImpl extends BasicServiceImpl implements GameService {
	
	private Logger logger = Logger.getLogger(GameServiceImpl.class);
	
	@Autowired
	GameMapper gameMapper;
	
	@Autowired
	NewspaperMapper newspaperMapper;
	
	@Autowired
	PlayerMapper playerMapper;
	
	@Autowired
	CharacterMapper characterMapper;
	
	@Override
	public Map<String, Object> getGameList() {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			List<ApplyingGame> applyingGames = gameMapper.getAllApplyingGamesDao();
			result.put("applyingGames", applyingGames);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取版杀信息成功");
		} catch (Exception e){
			logger.error(e.getMessage(), e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}	
		return result;
	}

	@Override
	public Map<String, Object> getApplyingGames(long userId) {
		Map<String, Object> result = new HashMap<String, Object>();
		ApplyingGame applyingGame;
		try{
			applyingGame = gameMapper.getApplyingGamesDao(userId);
			if(applyingGame == null){
				result.put(PageParamType.BUSINESS_STATUS, -3);
				result.put(PageParamType.BUSINESS_MESSAGE, "暂无版杀信息");
			} else {
				applyingGame.setGameStatusDesc(GameStatus.getMessageByCode(applyingGame.getGameStatus()));
				Iterator<UserApplyInfo> iter = applyingGame.getPlayers().iterator(); 
				List<UserApplyInfo> alterJudger = new ArrayList<>();
				while(iter.hasNext()){
					UserApplyInfo userApplyInfo = iter.next();
					if(PlayerStatus.ALTER_JUDGER.getCode() == userApplyInfo.getStatus()){
						alterJudger.add(userApplyInfo);
						iter.remove();
					} else if(PlayerStatus.JUDGER.getCode() == userApplyInfo.getStatus()){
						iter.remove();
					} else {
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
						if(NVTermConstant.USE_IDENTITY_CARD.equals(userApplyInfo.getUseCard())){
							userApplyInfo.setUseCard("身份卡");
						} else if(NVTermConstant.USE_CAMP_CARD.equals(userApplyInfo.getUseCard())){
							userApplyInfo.setUseCard("阵营卡");
							
						} else {
							userApplyInfo.setUseCard("无");
						}
					}
				}
				applyingGame.setAlterJudgers(alterJudger);
				applyingGame.setPlayCurNum(applyingGame.getPlayers().size());
				result.put("applyingGame", applyingGame);
				result.put("applyingGameStr", JacksonJSONUtils.beanToJSON(applyingGame));
				result.put(PageParamType.BUSINESS_STATUS, 1);
				result.put(PageParamType.BUSINESS_MESSAGE, "获取版杀信息成功");
			}
		} catch (Exception e){
			logger.info(e.getMessage(),e);
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
			if(publishGameDTO.getGameId()>0){
				gameMapper.publishGameDao(publishGameDTO);
				result.put(PageParamType.BUSINESS_STATUS, 1);
				result.put(PageParamType.BUSINESS_MESSAGE, "更新成功");
				return result;
			}
			if(gameMapper.queryHasAttendGameDao(publishGameDTO.getJudgerId()) > 0){
				result.put(PageParamType.BUSINESS_STATUS, -3);
				result.put(PageParamType.BUSINESS_MESSAGE, "已参加其他版杀，不能开新版杀");
				return result;
			}
			ApplyDTO applyDTO = new ApplyDTO();
			gameMapper.publishGameDao(publishGameDTO);
			applyDTO.setGameId(publishGameDTO.getGameId());
			applyDTO.setUserId(publishGameDTO.getJudgerId());
			applyDTO.setStatus(PlayerStatus.JUDGER.getCode());
			if(gameMapper.applyForGameDao(applyDTO) == 1){
				if(publishGameDTO.getCharacterSelect().equals(NVTermConstant.SELECT_THREE)){
					List<Integer> list = Arrays.asList(NVTermConstant.arrays);
					redisClient.setHSet(RedisConstant.AVAILABLE_LIST, String.valueOf(publishGameDTO.getGameId()), JacksonJSONUtils.beanToJSON(list).toString());
				}
				Newspaper newspaper = new Newspaper(publishGameDTO.getGameId());
				newspaper.setHeader("【"+publishGameDTO.getGameDesc()+"】"+newspaper.getHeader());
				newspaperMapper.createOrUpdateNewspaperDao(newspaper);
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
	public Map<String, Object> kickPlayer(KickPlayerDTO kickPlayerDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			if(gameMapper.kickPlayerDao(kickPlayerDTO) == 1){
				gameMapper.deletePlayerApplyInfoDao(kickPlayerDTO.getPlayerId());
				result.put(PageParamType.BUSINESS_STATUS, 1);
				result.put(PageParamType.BUSINESS_MESSAGE, "踢出玩家成功");
			} else {
				result.put(PageParamType.BUSINESS_STATUS, -3);
				result.put(PageParamType.BUSINESS_MESSAGE, "踢出玩家失败");
			}
		}catch(Exception e){
			logger.info(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

	@Override
	public Map<String, Object> changeStatus(ChangeStatusDTO changeStatusDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			if(gameMapper.changeStatusDao(changeStatusDTO) == 1){
				if(changeStatusDTO.getStatus() == GameStatus.APPLY_END.getCode()){
					redisClient.delHSet(RedisConstant.AVAILABLE_LIST, String.valueOf(changeStatusDTO.getGameId()));
				}
				if(changeStatusDTO.getStatus() == GameStatus.READY.getCode()){
					GameForm form = new GameForm();
					form.setGameId(changeStatusDTO.getGameId());
					form.setHeader("游戏开始前");
					gameMapper.createOrUpdateFormDao(form);
				}
				if(changeStatusDTO.getStatus() == GameStatus.REPLAYING.getCode()){
					newspaperMapper.updateNewspaperStatusDao(changeStatusDTO.getGameId());
					characterMapper.updateCharacterData(changeStatusDTO.getGameId());
				}
				if(changeStatusDTO.getStatus() == GameStatus.FINISHED.getCode() ||
						changeStatusDTO.getStatus() == GameStatus.CANCELED.getCode()){
					playerMapper.updatePlayerStatus(changeStatusDTO.getGameId());
				}
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
	public Map<String, Object> submitList(List<PlayerInfo> submitList) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			gameMapper.submitApplyListDao(submitList); 
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "提交全名单成功");	
		}catch(Exception e){
			logger.info(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

	@Override
	public Map<String, Object> getFormList(long gameId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			List<GameForm> formList = gameMapper.getFormListDao(gameId,false);
			result.put("formList", formList);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取表格列表成功");
		}catch(Exception e){
			logger.info(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

	@Override
	public Map<String, Object> createOrUpdateForm(GameForm form) {
		Map<String, Object> result = new HashMap<String, Object>();
		if(form.getGameId()<1L){
			result.put(PageParamType.BUSINESS_STATUS, -2);
			result.put(PageParamType.BUSINESS_MESSAGE, "参数异常");
		}
		try{
			if(gameMapper.createOrUpdateFormDao(form)==1){
				if(form.getFormId()<1L){
					gameMapper.clearFormDao(form.getGameId());
				}
				result.put(PageParamType.BUSINESS_STATUS, 1);
				result.put(PageParamType.BUSINESS_MESSAGE, "创建或更新表格成功");
			} else {
				result.put(PageParamType.BUSINESS_STATUS, -3);
				result.put(PageParamType.BUSINESS_MESSAGE, "创建或更新表格失败");
			}
		}catch(Exception e){
			logger.info(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

	@Override
	public Map<String, Object> getFormContent(long formId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			String content = gameMapper.getFormContentDao(formId);
			result.put("content", content);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取表格内容成功");
		}catch(Exception e){
			logger.info(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

	@Override
	public Map<String, Object> getSubmitTime(long playerId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			Date time = gameMapper.getSubmitTimeDao(playerId);
			if(time == null){
				result.put(PageParamType.BUSINESS_STATUS, -3);
				result.put(PageParamType.BUSINESS_MESSAGE, "该玩家还未提交行动");
				return result;
			}
			String submitTime = DateFormatUtil.getSimpleDateFormat(DateFormatUtil.DEFAULT_DATETIME).format(time);
			result.put("submitTime", submitTime);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取提交时间成功");
		}catch(Exception e){
			logger.info(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

	

}
