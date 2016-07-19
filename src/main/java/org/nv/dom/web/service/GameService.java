package org.nv.dom.web.service;


import java.util.List;
import java.util.Map;

import org.nv.dom.dto.game.ChangeStatusDTO;
import org.nv.dom.dto.game.PublishGameDTO;
import org.nv.dom.dto.player.PlayerInfoDTO;

public interface GameService {
	
	public Map<String, Object> getApplyingGames(long userId);
	
	public Map<String, Object> publishGame(PublishGameDTO publishGameDTO);
	
	public Map<String, Object> changeStatus(ChangeStatusDTO changeStatusDTO);
	
	public Map<String, Object> submitList(List<PlayerInfoDTO> playerList); 
	
	
	
	


}
