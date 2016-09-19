package org.nv.dom.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.game.ApplyingGame;
import org.nv.dom.domain.game.GameForm;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.game.ChangeStatusDTO;
import org.nv.dom.dto.game.PublishGameDTO;
import org.nv.dom.dto.player.KickPlayerDTO;
import org.nv.dom.enums.GameStatus;
import org.nv.dom.web.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/game")
public class GameController extends BaseController{
	
	@Autowired
	GameService gameService;
	
	@ResponseBody
	@RequestMapping(value = "/getGameList", method = RequestMethod.POST)
	public Map<String, Object> getGameList(HttpSession session) {
		return gameService.getGameList();
	}
	
	@ResponseBody
	@RequestMapping(value = "/publish", method = RequestMethod.POST)
	public Map<String, Object> publish(@ModelAttribute("publishGameDTO") PublishGameDTO publishGameDTO, HttpSession session) {
		return gameService.publishGame(publishGameDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/kickPlayer", method = RequestMethod.POST)
	public Map<String, Object> kickPlayer(@ModelAttribute("kickPlayerDTO") KickPlayerDTO kickPlayerDTO, HttpSession session) {
		ApplyingGame game = (ApplyingGame)session.getAttribute(PageParamType.GAME_IN_SESSION);
		kickPlayerDTO.setGameId(game.getId());
		kickPlayerDTO.setJudgerUserId(((User)session.getAttribute(PageParamType.user_in_session)).getId());
		return gameService.kickPlayer(kickPlayerDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/changeStatus", method = RequestMethod.POST)
	public Map<String, Object> changeStatus(@ModelAttribute("changeStatusDTO") ChangeStatusDTO changeStatusDTO, HttpSession session) {
		Map<String, Object> result = gameService.changeStatus(changeStatusDTO);
		if((int)result.get("status")==1&&changeStatusDTO.getStatus()==GameStatus.FINISHED.getCode()){
			session.setAttribute(PageParamType.GAME_IN_SESSION, null);
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/submitList", method = RequestMethod.POST)
	public Map<String, Object> submitList(@RequestBody List<PlayerInfo> playerList, HttpSession session){
		return gameService.submitList(playerList);
	}
	
	@ResponseBody
	@RequestMapping(value = "/createOrUpdateForm", method = RequestMethod.POST)
	public Map<String, Object> createOrUpdateForm(@ModelAttribute("gameForm") GameForm gameForm, HttpSession session){
		ApplyingGame game = (ApplyingGame)session.getAttribute(PageParamType.GAME_IN_SESSION);
		gameForm.setGameId(game.getId());
		return gameService.createOrUpdateForm(gameForm);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getFormContent", method = RequestMethod.POST)
	public Map<String, Object> getFormContent(@RequestParam("formId") long formId, HttpSession session){
		return gameService.getFormContent(formId);
	}

}
