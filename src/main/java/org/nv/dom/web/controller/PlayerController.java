package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nv.dom.domain.player.PlayerReplaceSkin;
import org.nv.dom.web.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PlayerController {
	
	@Autowired
	PlayerService playerService;
	
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

}
