package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nv.dom.web.service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StatisticsController {
	
	@Autowired
	StatisticsService statisticsService;
	
	@ResponseBody
	@RequestMapping(value = "/getCharacterRecord", method = RequestMethod.POST)
	public Map<String, Object> getCharacterRecord(@RequestParam("characterId") Integer characterId, HttpSession session){
		return statisticsService.getCharacterRecord(characterId);
	}

	
}
