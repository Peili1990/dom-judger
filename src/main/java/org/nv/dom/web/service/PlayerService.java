package org.nv.dom.web.service;

import java.util.Map;

import org.nv.dom.domain.player.PlayerReplaceSkin;

public interface PlayerService {
	
	public Map<String, Object> getPlayerInfo(long gameId);
	
	public Map<String, Object> getReplaceSkin(long playerId);
	
	public Map<String, Object> saveReplaceSkin(PlayerReplaceSkin playerReplaceSkin);
	
	public Map<String, Object> deleteReplaceSkin(long skinId);

}
