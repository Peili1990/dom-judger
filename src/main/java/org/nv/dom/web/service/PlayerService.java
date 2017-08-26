package org.nv.dom.web.service;

import java.util.Map;

import org.nv.dom.domain.player.PlayerReplaceSkin;
import org.nv.dom.dto.operation.SavePlayerOperationDTO;
import org.nv.dom.dto.operation.SubmitPlayerOperationDTO;
import org.nv.dom.dto.player.ApplyDTO;
import org.nv.dom.dto.player.GetPlayerOperationDTO;
import org.nv.dom.dto.player.JudgerDecisionDTO;
import org.nv.dom.dto.player.SaveFeedbackDTO;

public interface PlayerService {
	
	public Map<String, Object> getPlayerInfo(long gameId);
	
	public Map<String, Object> getReplaceSkin(long playerId);
	
	public Map<String, Object> saveReplaceSkin(PlayerReplaceSkin playerReplaceSkin);
	
	public Map<String, Object> deleteReplaceSkin(long skinId);
	
	public Map<String, Object> becomeJudger(ApplyDTO applyDTO);

	public Map<String, Object> dealJudgerDecision(JudgerDecisionDTO judgerDecisionDTO);

	public Map<String, Object> getPlayerOperation(GetPlayerOperationDTO getPlayerOperationDTO);
	
	public Map<String, Object> submitOperation(SubmitPlayerOperationDTO submitPlayerOperationDTO);

	public Map<String, Object> getOperationList(long playerId);

	public Map<String, Object> savePlayerOperation(SavePlayerOperationDTO savePlayerOperationDTO);

	public Map<String, Object> saveFeedback(SaveFeedbackDTO saveFeedbackDTO);

}
