package org.nv.dom.web.controller;

import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.web.service.GameService;
import org.nv.dom.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class IndexController extends BaseController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	GameService gameService;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView indexView(HttpSession session) {
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}
	
	@RequestMapping(value = "/admin-index", method = RequestMethod.GET)
	public ModelAndView adminIndexView(HttpSession session) {
		ModelAndView mav = new ModelAndView("admin/admin-index");
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@RequestMapping(value = "/admin-apply", method = RequestMethod.GET)
	public ModelAndView adminApplyView(HttpSession session) {
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		ModelAndView mav = new ModelAndView("admin/admin-apply");
		mav.addAllObjects(gameService.getApplyingGames(user.getId()));
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@RequestMapping(value = "/admin-character", method = RequestMethod.GET)
	public ModelAndView adminCharacterView(HttpSession session) {
		User user = (User) session.getAttribute(PageParamType.user_in_session);
		ModelAndView mav = new ModelAndView("admin/admin-character");
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	

}