package org.nv.dom.web.service;


import java.util.List;
import java.util.Map;

import org.nv.dom.domain.game.GameForm;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.dto.game.ChangeStatusDTO;
import org.nv.dom.dto.game.PublishGameDTO;
import org.nv.dom.dto.operation.GetOperationTargetDTO;
import org.nv.dom.dto.player.KickPlayerDTO;

public interface GameService {
	
	public Map<String, Object> getApplyingGames(long userId);
	
	public Map<String, Object> publishGame(PublishGameDTO publishGameDTO);
	
	public Map<String, Object> kickPlayer(KickPlayerDTO kickPlayerDTO);
	
	public Map<String, Object> changeStatus(ChangeStatusDTO changeStatusDTO);
	
	public Map<String, Object> submitList(List<PlayerInfo> submitList, boolean isFullList, long gameId); 
	
	public Map<String, Object> createOrUpdateForm(GameForm form);
	
	public Map<String, Object> getFormList(long gameId);
	
	public Map<String, Object> getFormContent(long formId);

	public Map<String, Object> getGameList();

	public Map<String, Object> getSubmitTime(long playerId);

	public Map<String, Object> getOperationTarget(GetOperationTargetDTO getOperationTarget);

	public Map<String, Object> nextStage(long gameId);

	public Map<String, Object> allOperationList();

}
