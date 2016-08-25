package org.nv.dom.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChatController extends BaseController{
	
	@Autowired
	UserService userService;
	
	@ResponseBody
	@RequestMapping(value = "/getChatInfo", method = RequestMethod.POST)
	public Map<String, Object> submitList(@RequestBody List<String> chatIdList, HttpSession session){
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		return userService.getChatInfo(chatIdList, String.valueOf(user.getId()));
	}
	
	@RequestMapping(value = "/getOfflineMessage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getOfflineMessage(HttpSession session){
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		return userService.getOfflineMessage(user.getId());
	}

}
