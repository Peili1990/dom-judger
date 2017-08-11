package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.player.PlayerReplaceSkin;
import org.nv.dom.dto.player.ApplyDTO;
import org.nv.dom.dto.player.JudgerDecisionDTO;
import org.nv.dom.dto.player.UpdatePlayerStatusDTO;
import org.nv.dom.enums.PlayerStatus;
import org.nv.dom.web.dao.game.GameMapper;
import org.nv.dom.web.dao.player.PlayerMapper;
import org.nv.dom.web.service.PlayerService;
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

	@Override
	public Map<String, Object> getPlayerInfo(long gameId) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<PlayerInfo> playerList;
		playerList = playerMapper.getPlayerInfosDao(gameId);
		Assert.isTrue(playerList != null && !playerList.isEmpty(), "该版杀还未开始");
		result.put("playerList", playerList);
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


}
