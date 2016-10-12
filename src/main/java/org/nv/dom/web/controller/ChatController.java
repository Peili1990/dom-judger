package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.message.GetChatRecordDTO;
import org.nv.dom.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChatController extends BaseController{
	
	@Autowired
	UserService userService;
	
	@ResponseBody
	@RequestMapping(value = "/getChatInfo", method = RequestMethod.POST)
	public Map<String, Object> getChatInfo(@Param(value = "chatId")String chatId,HttpSession session){
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		return userService.getChatInfo(chatId,String.valueOf(user.getId()));
	}
	
	@RequestMapping(value = "/getOfflineMessage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getOfflineMessage(HttpSession session){
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		return userService.getOfflineMessage(user.getId());
	}
	
	@ResponseBody
	@RequestMapping(value = "/getChatRecord", method = RequestMethod.POST)
	public Map<String, Object> getChatRecord(@ModelAttribute("getChatRecordDTO")GetChatRecordDTO getChatRecordDTO, HttpSession session){
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		getChatRecordDTO.setUserId(user.getId());
		return userService.getChatRecord(getChatRecordDTO);
	}
	
	

}
