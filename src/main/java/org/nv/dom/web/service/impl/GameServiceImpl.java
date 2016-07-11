package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.game.ApplyingGame;
import org.nv.dom.enums.GameStatus;
import org.nv.dom.web.dao.game.GameMapper;
import org.nv.dom.web.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("gameServiceImpl")
public class GameServiceImpl implements GameService {
	
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
			result.put("applyingGame", applyingGame);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取版杀信息成功");
		} catch (Exception e){
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}	
		return result;
	}

}
