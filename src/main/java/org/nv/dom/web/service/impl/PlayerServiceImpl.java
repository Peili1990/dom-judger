package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nv.dom.config.NVTermConstant;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.web.dao.player.PlayerMapper;
import org.nv.dom.web.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("playerServiceImpl")
public class PlayerServiceImpl implements PlayerService {
	
	@Autowired
	PlayerMapper playerMapper;

	@Override
	public Map<String, Object> getPlayerInfo(long gameId) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<PlayerInfo> playerList = playerMapper.getPlayerInfosDao(gameId);
		if(playerList == null || playerList.isEmpty()){
			result.put(PageParamType.BUSINESS_STATUS, -3);
			result.put(PageParamType.BUSINESS_MESSAGE, "该版杀还未开始");
		} else {
			for(PlayerInfo player: playerList){
				player.setCharacterName(player.getIsSp().equals(NVTermConstant.IS_SP) ?
						"sp"+player.getCharacterName() : player.getCharacterName());
			}
			result.put("playerList", playerList);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取角色列表成功");
		}
		return result;
	}

}
