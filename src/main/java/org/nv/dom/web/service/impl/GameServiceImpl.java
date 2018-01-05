package org.nv.dom.web.service.impl;

import static java.util.stream.Collectors.groupingBy;
import static java.util.stream.Collectors.toList;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import org.nv.dom.config.EventList;
import org.nv.dom.config.NVTermConstant;
import org.nv.dom.config.PageParamType;
import org.nv.dom.config.RedisConstant;
import org.nv.dom.domain.game.ApplyingGame;
import org.nv.dom.domain.game.GameForm;
import org.nv.dom.domain.newspaper.Newspaper;
import org.nv.dom.domain.player.OperationOption;
import org.nv.dom.domain.player.PlayerCount;
import org.nv.dom.domain.player.PlayerGameStatus;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerOperation;
import org.nv.dom.domain.player.PlayerReplaceSkin;
import org.nv.dom.domain.user.UserApplyInfo;
import org.nv.dom.dto.game.ChangeStatusDTO;
import org.nv.dom.dto.game.PublishGameDTO;
import org.nv.dom.dto.operation.GetOperationTargetDTO;
import org.nv.dom.dto.player.ApplyDTO;
import org.nv.dom.dto.player.KickPlayerDTO;
import org.nv.dom.dto.player.UpdatePlayerStatusDTO;
import org.nv.dom.enums.CardType;
import org.nv.dom.enums.GameStatus;
import org.nv.dom.enums.IdentityCode;
import org.nv.dom.enums.PlayerStatus;
import org.nv.dom.util.DateFormatUtil;
import org.nv.dom.util.Iterables;
import org.nv.dom.util.StringUtil;
import org.nv.dom.util.TextUtil;
import org.nv.dom.web.dao.character.CharacterMapper;
import org.nv.dom.web.dao.game.GameMapper;
import org.nv.dom.web.dao.newspaper.NewspaperMapper;
import org.nv.dom.web.dao.player.PlayerMapper;
import org.nv.dom.web.service.GameService;
import org.nv.dom.web.util.EventUtilService;
import org.nv.dom.web.util.GameUtilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.alibaba.fastjson.JSON;

@Service("gameServiceImpl")
public class GameServiceImpl extends BasicServiceImpl implements GameService {
	
	@Autowired
	GameMapper gameMapper;
	
	@Autowired
	NewspaperMapper newspaperMapper;
	
	@Autowired
	PlayerMapper playerMapper;
	
	@Autowired
	CharacterMapper characterMapper;
	
	@Autowired
	GameUtilService gameUtil;
	
	@Autowired
	EventUtilService eventUtil;
	
	@Override
	public Map<String, Object> getGameList() {
		Map<String, Object> result = new HashMap<String, Object>();
		List<ApplyingGame> applyingGames = gameMapper.getAllApplyingGamesDao();
		result.put("applyingGames", applyingGames);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取版杀信息成功");
		return result;
	}

	@Override
	public Map<String, Object> getApplyingGames(long userId) {
		Map<String, Object> result = new HashMap<String, Object>();
		ApplyingGame applyingGame;
		applyingGame = gameMapper.getApplyingGamesDao(userId);
		Assert.notNull(applyingGame, "暂无版杀信息");
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
				userApplyInfo.setStatusDesc(PlayerStatus.getMessageByCode(userApplyInfo.getStatus()));
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
				userApplyInfo.setUseCard(CardType.getMessageByCode(Integer.parseInt(userApplyInfo.getUseCard() == null ? "0" : userApplyInfo.getUseCard())));
			}
		}
		applyingGame.setAlterJudgers(alterJudger);
		applyingGame.setPlayCurNum(applyingGame.getPlayers().size());
		result.put("applyingGame", applyingGame);
		result.put("applyingGameStr", JSON.toJSONString(applyingGame));
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取版杀信息成功");	
		return result;
	}

	@Override
	public Map<String, Object> publishGame(PublishGameDTO publishGameDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		Assert.notNull(publishGameDTO, "参数异常");
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		Assert.isTrue(publishGameDTO.getStartDate().compareTo(today)>0, "开版时间不能早于今天");
		if(publishGameDTO.getGameId()>0){
			gameMapper.publishGameDao(publishGameDTO);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "更新成功");
			return result;
		}
		Assert.isTrue(gameMapper.queryHasAttendGameDao(publishGameDTO.getJudgerId()) == 0, "已参加其他版杀，不能开新版杀");
		ApplyDTO applyDTO = new ApplyDTO();
		gameMapper.publishGameDao(publishGameDTO);
		applyDTO.setGameId(publishGameDTO.getGameId());
		applyDTO.setUserId(publishGameDTO.getJudgerId());
		applyDTO.setStatus(PlayerStatus.JUDGER.getCode());
		Assert.isTrue(gameMapper.applyForGameDao(applyDTO) == 1, "发布失败，请稍后重试");
		if(publishGameDTO.getCharacterSelect().equals(NVTermConstant.SELECT_THREE)){
			List<Integer> list = Arrays.asList(NVTermConstant.arrays);
			redisClient.setHSet(RedisConstant.AVAILABLE_LIST, String.valueOf(publishGameDTO.getGameId()), JSON.toJSONString(list));
		}
		Newspaper newspaper = new Newspaper(publishGameDTO.getGameId());
		newspaper.setHeader("【"+publishGameDTO.getGameDesc()+"】"+newspaper.getHeader());
		newspaperMapper.createOrUpdateNewspaperDao(newspaper);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "发布成功");
		return result;	
	}
	
	@Override
	public Map<String, Object> kickPlayer(KickPlayerDTO kickPlayerDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		Assert.isTrue(gameMapper.kickPlayerDao(kickPlayerDTO) == 1, "踢出玩家失败");
		gameMapper.deletePlayerApplyInfoDao(kickPlayerDTO.getPlayerId());
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "踢出玩家成功");	
		return result;
	}

	@Override
	public Map<String, Object> changeStatus(ChangeStatusDTO changeStatusDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		Assert.isTrue(gameMapper.changeStatusDao(changeStatusDTO) == 1, "修改失败，请重试");		
		if(changeStatusDTO.getStatus() == GameStatus.APPLY_END.getCode()){
			redisClient.delHSet(RedisConstant.AVAILABLE_LIST, String.valueOf(changeStatusDTO.getGameId()));
		}
		if(changeStatusDTO.getStatus() == GameStatus.READY.getCode()){
			GameForm form = new GameForm();
			form.setGameId(changeStatusDTO.getGameId());
			form.setHeader("游戏开始前");
			form.setType(NVTermConstant.STAGE_GAME_START);
			gameMapper.createOrUpdateFormDao(form);	
		}
		if(changeStatusDTO.getStatus() == GameStatus.REPLAYING.getCode()){
			newspaperMapper.updateNewspaperStatusDao(changeStatusDTO.getGameId());
			characterMapper.updateCharacterData(changeStatusDTO.getGameId());
		}
		if(changeStatusDTO.getStatus() == GameStatus.FINISHED.getCode() ||
				changeStatusDTO.getStatus() == GameStatus.CANCELED.getCode()){
			UpdatePlayerStatusDTO updatePlayerStatusDTO = new UpdatePlayerStatusDTO();
			updatePlayerStatusDTO.setGameId(changeStatusDTO.getGameId());
			updatePlayerStatusDTO.setStatus(PlayerStatus.FINISHED.getCode());
			updatePlayerStatusDTO.setIncludeJudger(true);
			playerMapper.updatePlayerStatus(updatePlayerStatusDTO);
		}
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "修改状态成功");
		return result;
	}
	


	@Override
	public Map<String, Object> submitList(List<PlayerInfo> submitList, boolean isFullList, long gameId) {
		Map<String, Object> result = new HashMap<String, Object>();
		gameMapper.submitApplyListDao(submitList); 
		if(isFullList){
			UpdatePlayerStatusDTO updatePlayerStatusDTO = new UpdatePlayerStatusDTO();
			updatePlayerStatusDTO.setGameId(gameId);
			updatePlayerStatusDTO.setStatus(PlayerStatus.INDENTITY_OBTAINED.getCode());
			updatePlayerStatusDTO.setIncludeJudger(false);
			playerMapper.updatePlayerStatus(updatePlayerStatusDTO);
			initPlayerOperation(submitList);
		}
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "提交全名单成功");	
		return result;
	}	
	
	private void initPlayerOperation(List<PlayerInfo> playerInfos){
		playerInfos.forEach(playerInfo -> {
			int sign = playerInfo.getSign();
			if(sign >= 1 && sign <= 6) sign = 1;
			if(sign >= 13 && sign <= 18) sign = 13;
			List<PlayerOperation> operations = playerMapper.initPlayerOperation(sign,playerInfo.getCharacterId(),playerInfo.getIsSp());
			if(operations.size()>0){
				operations.forEach(operation -> operation.setPlayerId(playerInfo.getPlayerId()));
				playerMapper.insertPlayerOperation(operations);
			}		
		});
	}

	@Override
	public Map<String, Object> getFormList(long gameId) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<GameForm> formList = gameMapper.getFormListDao(gameId,false);
		result.put("formList", formList);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取表格列表成功");	
		return result;
	}

	@Override
	public Map<String, Object> createOrUpdateForm(GameForm form) {
		Map<String, Object> result = new HashMap<String, Object>();
		Assert.isTrue(form.getGameId()>0, "参数异常");
		Assert.isTrue(gameMapper.createOrUpdateFormDao(form)==1, "创建或更新表格失败");
		if(form.getFormId()<1L){
			gameMapper.clearFormDao(form.getGameId());
		}
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "创建或更新表格成功");
		return result;
	}

	@Override
	public Map<String, Object> getFormContent(long formId) {
		Map<String, Object> result = new HashMap<String, Object>();
		String content = gameMapper.getFormContentDao(formId);
		result.put("content", content);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取表格内容成功");
		return result;
	}

	@Override
	public Map<String, Object> getSubmitTime(long playerId) {
		Map<String, Object> result = new HashMap<String, Object>();
		Date time = gameMapper.getSubmitTimeDao(playerId);
		Assert.notNull(time, "该玩家还未提交行动");
		String submitTime = DateFormatUtil.getSimpleDateFormat(DateFormatUtil.DEFAULT_DATETIME).format(time);
		result.put("submitTime", submitTime);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取提交时间成功");
		return result;
	}

	@Override
	public Map<String, Object> getOperationTarget(GetOperationTargetDTO getOperationTarget) {
		Map<String, Object> result = new HashMap<String, Object>();		
		Map<Long, String> target = new HashMap<>();
		switch (getOperationTarget.getType()) {
		case 1:
			List<PlayerInfo> playerInfos = playerMapper.getPlayerInfosDao(getOperationTarget.getGameId());
			List<PlayerReplaceSkin> playerReplaceSkin = playerMapper.getAllReplaceSkinDao(getOperationTarget.getGameId());
			playerInfos.forEach(playerInfo -> {
				List<PlayerReplaceSkin> skins = playerReplaceSkin.stream()
						.filter(skin -> skin.getPlayerId() == playerInfo.getPlayerId())
						.collect(toList());
				String characterName = skins.size() == 1 ? skins.get(0).getCharacterName() : playerInfo.getCharacterName();
				target.put(playerInfo.getPlayerId(), characterName);
			});
			Map<String, List<Long>> temp = target.keySet().stream().collect(groupingBy(target::get,toList()));
			temp.keySet().stream()
				.filter(name -> temp.get(name).size() > 1)
				.map(temp::get)
				.forEach(list -> {
					Iterables.forEach(list, (index, playerId) -> target.put(playerId, target.get(playerId)+TextUtil.numToLetter(index)));
				});
			break;
		case 2:
			Stream.of(IdentityCode.values()).forEach(identity -> target.put(identity.getCode().longValue(), identity.getMessage()));
			break;
		case 3:
			List<OperationOption> options = playerMapper.getOperationOption(getOperationTarget.getOperationId());
			result.put("operationOption", options);
			break;
		case 4:
			characterMapper.getCharacterData().stream()
			.forEach(character -> target.put(character.getCharacterId().longValue(), character.getCharacterName()));
			break;
		default:
			break;
		}
		result.put("operationTarget", target);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取操作对象列表成功");
		return result;
	}

	@Override
	public Map<String, Object> nextStage(long gameId) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = new HashMap<>();
		param.put("gameId", gameId);
		GameForm form = gameUtil.getCurForm(gameId);
		GameForm newForm = new GameForm();
		List<PlayerInfo> playerInfo = playerMapper.getPlayerInfosDao(gameId);
		newForm.setGameId(gameId);
		int stage = form.getType();
		switch(stage){
		case NVTermConstant.STAGE_GAME_START:
			newForm.setHeader("第一夜");
			newForm.setType(NVTermConstant.STAGE_NIGHT);
			form.setContent(JSON.toJSONString(playerInfo));
			gameMapper.createOrUpdateFormDao(newForm);
			eventUtil.publish(EventList.NIGNT_START_EVENT, param);
		break;
		case NVTermConstant.STAGE_NIGHT:
			form.setHeader(form.getHeader()+"-结算阶段");
			form.setType(NVTermConstant.STAGE_SETTLING);
			gameMapper.changeRemainstage(gameId);
		break;
		case NVTermConstant.STAGE_SETTLING:
			form.setContent(JSON.toJSONString(playerInfo));
			newForm.setHeader(buildHeader(form.getHeader()));
			newForm.setType(NVTermConstant.STAGE_DAY);
			gameMapper.createOrUpdateFormDao(newForm);
			eventUtil.publish(EventList.DAY_START_EVENT, param);
			gameMapper.changeRemainstage(gameId);
		break;
		case NVTermConstant.STAGE_DAY:
			form.setHeader(form.getHeader()+"-投票阶段");
			form.setType(NVTermConstant.STAGE_VOTING);
			gameMapper.changeRemainstage(gameId);
		break;
		case NVTermConstant.STAGE_VOTING:
			form.setContent(JSON.toJSONString(playerInfo));
			newForm.setHeader(buildHeader(form.getHeader()));
			newForm.setType(NVTermConstant.STAGE_NIGHT);
			gameMapper.createOrUpdateFormDao(newForm);
			eventUtil.publish(EventList.NIGNT_START_EVENT, param);
			gameMapper.changeRemainstage(gameId);
		break;
		}
		gameMapper.createOrUpdateFormDao(form);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "进入下一阶段成功！");
		return result;
	}
	
	private String buildHeader(String curHeader){
		if(curHeader.indexOf("日")>0){
			String num = curHeader.substring(1, curHeader.indexOf("日"));
			return "第"+num+"夜";
		} else {
			String num = curHeader.substring(1, curHeader.indexOf("夜"));
			return "第"+TextUtil.numToStr(TextUtil.strToNum(num)+1)+"日";
		}
	}

	@Override
	public Map<String, Object> allOperationList() {
		Map<String, Object> result = new HashMap<String, Object>();
		List<PlayerOperation> operationList = playerMapper.getAllOperation();
		result.put("operationList", operationList);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取所有的操作列表成功");
		return result;
	}

	@Override
	public Map<String, Object> allStatusList() {
		Map<String, Object> result = new HashMap<String, Object>();
		List<PlayerGameStatus> statusList = playerMapper.getAllStatus();
		result.put("statusList", statusList);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取所有的状态列表成功");
		return result;
	}

	@Override
	public Map<String, Object> allCountList() {
		Map<String, Object> result = new HashMap<String, Object>();
		List<PlayerCount> countList = playerMapper.getAllCount();
		result.put("countList", countList);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取所有的计数列表成功");
		return result;
	}
	


}
