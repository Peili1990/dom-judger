package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.game.ApplyingGame;
import org.nv.dom.domain.newspaper.Newspaper;
import org.nv.dom.web.service.AssembleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/assemble")
public class AssembleController extends BaseController {
	
	@Autowired
	AssembleService assembleService;
		
	@ResponseBody
	@RequestMapping(value = "/generateSeatTable", method = RequestMethod.POST)
	public Map<String, Object> generateSeatTable(HttpSession session) {
		long gameId = ((ApplyingGame) session.getAttribute(PageParamType.GAME_IN_SESSION)).getId();
		return assembleService.generateSeatTable(gameId);
	}
	
	@ResponseBody
	@RequestMapping(value = "/saveNewspaper", method = RequestMethod.POST)
	public Map<String, Object> saveNewspaper(@ModelAttribute("newspaper") Newspaper newspaper, HttpSession session) {
		ApplyingGame game = (ApplyingGame) session.getAttribute(PageParamType.GAME_IN_SESSION);
		newspaper.setGameId(game.getId());
		newspaper.setHeader("【"+game.getGameDesc()+"】"+newspaper.getHeader());
		return assembleService.createOrUpdateNewspaper(newspaper);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getNewspaperDetail", method = RequestMethod.POST)
	public Map<String, Object> getNewspaperDetail(@RequestParam("newspaperId") long newspaperId, HttpSession session) {
		return assembleService.getNewspaperDetail(newspaperId);
	}
	
	@ResponseBody
	@RequestMapping(value = "/wordCount", method = RequestMethod.POST)
	public Map<String, Object> wordCount(@RequestParam("content") String content, HttpSession session) {
		return assembleService.wordCount(content);
	}

}
