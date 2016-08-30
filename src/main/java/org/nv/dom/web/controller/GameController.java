package org.nv.dom.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.game.GameForm;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.game.ChangeStatusDTO;
import org.nv.dom.dto.game.KickPlayerDTO;
import org.nv.dom.dto.game.PublishGameDTO;
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
	@RequestMapping(value = "/publish", method = RequestMethod.POST)
	public Map<String, Object> publish(@ModelAttribute("publishGameDTO") PublishGameDTO publishGameDTO, HttpSession session) {
		return gameService.publishGame(publishGameDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/kickPlayer", method = RequestMethod.POST)
	public Map<String, Object> kickPlayer(@ModelAttribute("kickPlayerDTO") KickPlayerDTO kickPlayerDTO, HttpSession session) {
		kickPlayerDTO.setGameId((long) session.getAttribute(PageParamType.GAMEID_IN_SESSION));
		kickPlayerDTO.setJudgerUserId(((User)session.getAttribute(PageParamType.user_in_session)).getId());
		return gameService.kickPlayer(kickPlayerDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/changeStatus", method = RequestMethod.POST)
	public Map<String, Object> changeStatus(@ModelAttribute("changeStatusDTO") ChangeStatusDTO changeStatusDTO, HttpSession session) {
		return gameService.changeStatus(changeStatusDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/submitList", method = RequestMethod.POST)
	public Map<String, Object> submitList(@RequestBody List<PlayerInfo> playerList, HttpSession session){
		return gameService.submitList(playerList);
	}
	
	@ResponseBody
	@RequestMapping(value = "/createOrUpdateForm", method = RequestMethod.POST)
	public Map<String, Object> createOrUpdateForm(@ModelAttribute("gameForm") GameForm gameForm, HttpSession session){
		gameForm.setGameId((long) session.getAttribute(PageParamType.GAMEID_IN_SESSION));
		return gameService.createOrUpdateForm(gameForm);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getFormContent", method = RequestMethod.POST)
	public Map<String, Object> getFormContent(@RequestParam("formId") long formId, HttpSession session){
		return gameService.getFormContent(formId);
	}

}
