package org.nv.dom.web.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.account.LoginDTO;
import org.nv.dom.web.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/game")
public class GameController extends BaseController{
	
	@Autowired
	GameService gameService;
	
	@ResponseBody
	@RequestMapping(value = "/publish", method = RequestMethod.POST)
	public Map<String, Object> loginAction(@ModelAttribute("loginDTO") LoginDTO loginDTO, HttpServletRequest request) {
		Map<String, Object> result = null;
		if((int)result.get("status")==1){
			User user = (User) result.get("user");
			user.setPassword("");
			request.getSession().setAttribute(PageParamType.user_in_session, user);
			result.remove("user");
		}
		return result;
	}
	
}
