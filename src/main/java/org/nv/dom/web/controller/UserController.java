package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/addJudger", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addJudger(@RequestParam("judgerName")String judgerName,HttpSession session){
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		return userService.addJudger(judgerName,user);
	}
	
	@RequestMapping(value = "/removeJudger", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> removeJudger(@RequestParam("judgerId")long judgerId,HttpSession session){
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		return userService.removeJudger(judgerId,user);
	}

}
