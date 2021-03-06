package org.nv.dom.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.account.LoginDTO;
import org.nv.dom.web.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AccountController extends BaseController {
	
	@Autowired
	AccountService accountService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginView(HttpSession session) {
		ModelAndView mav = new ModelAndView("account/login");
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/loginAction", method = RequestMethod.POST)
	public Map<String, Object> loginAction(@ModelAttribute("loginDTO") LoginDTO loginDTO, HttpServletRequest request) {
		Map<String, Object> result = accountService.loginAction(loginDTO);
		if((int)result.get("status")==1){
			User user = (User) result.get("user");
			user.setPassword("");
			request.getSession().setAttribute(PageParamType.user_in_session, user);
			result.remove("user");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/logoutAction", method = RequestMethod.POST)
	public Map<String, Object> registerAction(HttpServletRequest request) {
		request.getSession().removeAttribute(PageParamType.user_in_session);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(PageParamType.BUSINESS_STATUS,1);
		result.put(PageParamType.BUSINESS_MESSAGE, "登出成功");
		return result;
	}

}
