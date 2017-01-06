package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.authority.AddUserCardDTO;
import org.nv.dom.dto.rule.SaveRuleDTO;
import org.nv.dom.web.service.AuthorityService;
import org.nv.dom.web.service.RuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AuthorityController {
	
	@Autowired
	AuthorityService authorityService;
	
	@Autowired
	RuleService ruleService;
	
	@RequestMapping(value = "/addJudger", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addJudger(@RequestParam("judgerName")String judgerName,HttpSession session){
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		return authorityService.addJudger(judgerName,user);
	}
	
	@RequestMapping(value = "/removeJudger", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> removeJudger(@RequestParam("judgerId")long judgerId,HttpSession session){
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		return authorityService.removeJudger(judgerId,user);
	}
	
	@ResponseBody
	@RequestMapping(value = "/generateInvCode", method = RequestMethod.POST)
	public Map<String, Object> generateInvCode(@RequestParam("codeNum")Integer codeNum,HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(PageParamType.user_in_session);
		return authorityService.generateInvCode(codeNum,user);
	}
	
	@ResponseBody
	@RequestMapping(value = "/saveRule", method = RequestMethod.POST)
	public Map<String,Object> saveRule(@ModelAttribute("saveRuleDTO") SaveRuleDTO saveRuleDTO,HttpServletRequest request){
		User user = (User) request.getSession().getAttribute(PageParamType.user_in_session);
		return ruleService.saveRule(saveRuleDTO,user);
	} 	
	
	@ResponseBody
	@RequestMapping(value = "/submitInfoMessage", method = RequestMethod.POST)
	public Map<String, Object> submitInfoMessage(@RequestParam("infoMessage")String infoMessage,HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(PageParamType.user_in_session);
		return authorityService.submitInfoMessage(infoMessage,user);
	}
	
	@ResponseBody
	@RequestMapping(value = "/addUserCard", method = RequestMethod.POST)
	public Map<String, Object> addUserCard(@ModelAttribute("addUserCardDTO")AddUserCardDTO addUserCardDTO,HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute(PageParamType.user_in_session);
		return authorityService.addUserCard(addUserCardDTO,user);
	}

}
