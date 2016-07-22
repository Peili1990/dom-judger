package org.nv.dom.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.dto.game.ChangeStatusDTO;
import org.nv.dom.dto.game.PublishGameDTO;
import org.nv.dom.web.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping(value = "/changeStatus", method = RequestMethod.POST)
	public Map<String, Object> changeStatus(@ModelAttribute("changeStatusDTO") ChangeStatusDTO changeStatusDTO, HttpSession session) {
		return gameService.changeStatus(changeStatusDTO);
	}
	
	@ResponseBody
	@RequestMapping(value = "/submitList", method = RequestMethod.POST)
	public Map<String, Object> submitList(@RequestBody List<PlayerInfo> playerList, HttpSession session){
		return gameService.submitList(playerList);
	}	
	
}
