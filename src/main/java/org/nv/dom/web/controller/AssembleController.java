package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.web.service.AssembleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/assemble")
public class AssembleController extends BaseController {
	
	@Autowired
	AssembleService assembleService;
		
	@ResponseBody
	@RequestMapping(value = "/generateSeatTable", method = RequestMethod.POST)
	public Map<String, Object> generateSeatTable(HttpSession session) {
		long gameId = (long) session.getAttribute(PageParamType.GAMEID_IN_SESSION);
		return assembleService.generateSeatTable(gameId);
	}

}
