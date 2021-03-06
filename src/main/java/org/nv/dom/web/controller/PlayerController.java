package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.game.ApplyingGame;
import org.nv.dom.domain.message.chat.ChatDetail;
import org.nv.dom.domain.player.PlayerReplaceSkin;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.operation.SavePlayerOperationDTO;
import org.nv.dom.dto.operation.SubmitPlayerOperationDTO;
import org.nv.dom.dto.player.ApplyDTO;
import org.nv.dom.dto.player.ChangePlayerProperDTO;
import org.nv.dom.dto.player.GetPlayerOperationDTO;
import org.nv.dom.dto.player.JudgerDecisionDTO;
import org.nv.dom.dto.player.SaveFeedbackDTO;
import org.nv.dom.web.service.PlayerService;
import org.nv.dom.web.util.EventUtilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PlayerController {
	
	@Autowired
	PlayerService playerService;
	
	@Autowired
	EventUtilService eventService;
	
	@ResponseBody
	@RequestMapping(value = "/getReplaceSkin", method = RequestMethod.POST)
	public Map<String, Object> getReplaceSkin(@RequestParam("playerId") long playerId, HttpSession session){
		return playerService.getReplaceSkin(playerId);
	}
	
	@ResponseBody
	@RequestMapping(value = "/saveReplaceSkin", method = RequestMethod.POST)
	public Map<String, Object> saveReplaceSkin(@ModelAttribute("replaceSkin") PlayerReplaceSkin playerReplaceSkin, HttpSession session){
		return playerService.saveReplaceSkin(playerReplaceSkin);
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteReplaceSkin", method = RequestMethod.POST)
	public Map<String, Object> deleteReplaceSkin(@RequestParam("skinId") long skinId, HttpSession session){
		return playerService.deleteReplaceSkin(skinId);
	}
	
	@ResponseBody
	@RequestMapping(value = "/becomeJudger", method = RequestMethod.POST)
	public Map<String, Object> becomeJudger(@ModelAttribute("applyDTO") ApplyDTO applyDTO,HttpSession session) {
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		applyDTO.setUserId(user.getId());
		return playerService.becomeJudger(applyDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/judgerDecision", method = RequestMethod.POST)
	public Map<String, Object> judgerDecision(@ModelAttribute("JudgerDecisionDTO") JudgerDecisionDTO judgerDecisionDTO,HttpSession session) {
		return playerService.dealJudgerDecision(judgerDecisionDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getPlayerOperation", method = RequestMethod.POST)
	public Map<String, Object> getPlayerOperation(@RequestBody GetPlayerOperationDTO getPlayerOperationDTO,HttpSession session) {
		if(getPlayerOperationDTO.getGameId() == 0){
			ApplyingGame game = (ApplyingGame)session.getAttribute(PageParamType.GAME_IN_SESSION);
			getPlayerOperationDTO.setGameId(game.getId());
		}
		return playerService.getPlayerOperation(getPlayerOperationDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getOperationList", method = RequestMethod.POST)
	public Map<String, Object> getOperationList(@RequestParam("playerId") long playerId, HttpSession session) {
		return playerService.getOperationList(playerId);
	}
	
	@ResponseBody
	@RequestMapping(value = "/autoSettlement", method = RequestMethod.POST)
	public Map<String, Object> autoSettlement(@RequestBody ChatDetail chatDetail, HttpSession session){
		return playerService.autoSettlement(chatDetail);
	}
	
	@ResponseBody
	@RequestMapping(value = "/submitOperation", method = RequestMethod.POST)
	public Map<String, Object> submitOperation(@RequestBody SubmitPlayerOperationDTO submitPlayerOperationDTO,HttpSession session) {
		if(submitPlayerOperationDTO.getGameId() == 0){
			ApplyingGame game = (ApplyingGame)session.getAttribute(PageParamType.GAME_IN_SESSION);
			submitPlayerOperationDTO.setGameId(game.getId());
		}
		return playerService.submitOperation(submitPlayerOperationDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/updatePlayerStatus", method = RequestMethod.POST)
	public Map<String, Object> updatePlayerStatus(@RequestBody ChangePlayerProperDTO changePlayerProperDTO,HttpSession session) {
		ApplyingGame game = (ApplyingGame)session.getAttribute(PageParamType.GAME_IN_SESSION);
		changePlayerProperDTO.setGameId(game.getId());
		return playerService.updatePlayerStatus(changePlayerProperDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/savePlayerOperation", method = RequestMethod.POST)
	public Map<String, Object> savePlayerOperation(@RequestBody SavePlayerOperationDTO savePlayerOperationDTO,HttpSession session) {
		return playerService.savePlayerOperation(savePlayerOperationDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/saveFeedback", method = RequestMethod.POST)
	public Map<String, Object> saveFeedback(@RequestBody SaveFeedbackDTO saveFeedbackDTO,HttpSession session) {
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		ApplyingGame game = (ApplyingGame)session.getAttribute(PageParamType.GAME_IN_SESSION);
		saveFeedbackDTO.setGameId(game.getId());
		saveFeedbackDTO.setJudegerId(user.getId());
		return playerService.saveFeedback(saveFeedbackDTO);
	}

}
