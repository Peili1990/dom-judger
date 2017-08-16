package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.player.PlayerReplaceSkin;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.player.ApplyDTO;
import org.nv.dom.dto.player.JudgerDecisionDTO;
import org.nv.dom.web.service.PlayerService;
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
	@RequestMapping(value = "/getPlayerOperation")
	public Map<String, Object> getPlayerOperation(@RequestParam("playerId") long playerId,HttpSession session) {
		return playerService.getPlayerOperation(playerId);
	}

}
