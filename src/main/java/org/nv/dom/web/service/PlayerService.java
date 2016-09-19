package org.nv.dom.web.service;

import java.util.Map;

import org.nv.dom.domain.player.PlayerReplaceSkin;
import org.nv.dom.dto.player.ApplyDTO;
import org.nv.dom.dto.player.JudgerDecisionDTO;

public interface PlayerService {
	
	public Map<String, Object> getPlayerInfo(long gameId);
	
	public Map<String, Object> getReplaceSkin(long playerId);
	
	public Map<String, Object> saveReplaceSkin(PlayerReplaceSkin playerReplaceSkin);
	
	public Map<String, Object> deleteReplaceSkin(long skinId);
	
	public Map<String, Object> becomeJudger(ApplyDTO applyDTO);

	public Map<String, Object> dealJudgerDecision(JudgerDecisionDTO judgerDecisionDTO);

}
