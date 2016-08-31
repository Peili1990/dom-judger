package org.nv.dom.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.game.ApplyingGame;
import org.nv.dom.domain.newspaper.Newspaper;
import org.nv.dom.domain.user.User;
import org.nv.dom.util.CookiesUtil;
import org.nv.dom.web.service.AssembleService;
import org.nv.dom.web.service.GameService;
import org.nv.dom.web.service.PlayerService;
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
	PlayerService playerService;
	
	@Autowired
	GameService gameService;
	
	@Autowired
	AssembleService assembleService;
 	
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
		Map<String, Object> result = gameService.getApplyingGames(user.getId());
		long gameId = 0L;
		if((int)result.get("status")==1){
			gameId = ((ApplyingGame)result.get("applyingGame")).getId();
		}
		session.setAttribute(PageParamType.GAMEID_IN_SESSION, gameId);
		mav.addAllObjects(result);
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@RequestMapping(value = "/admin-character", method = RequestMethod.GET)
	public ModelAndView adminCharacterView(HttpSession session) {
		ModelAndView mav = new ModelAndView("admin/admin-character");
		long gameId = (long) session.getAttribute(PageParamType.GAMEID_IN_SESSION);
		if(gameId > 0L){	
			mav.addObject("gameId",gameId);
			mav.addAllObjects(playerService.getPlayerInfo(gameId));
			mav.addAllObjects(gameService.getFormList(gameId));		
		}
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@RequestMapping(value = "/admin-announcement", method = RequestMethod.GET)
	public ModelAndView adminAnnouncementView(HttpSession session) {
		ModelAndView mav = new ModelAndView("admin/admin-announcement");
		long gameId = (long) session.getAttribute(PageParamType.GAMEID_IN_SESSION);
		List<Newspaper> newspapers = assembleService.getNewspaperList(gameId);
		if(newspapers != null && !newspapers.isEmpty()){
			mav.addObject("newspapers", newspapers);
			long newspaperId = newspapers.get(0).getNewspaperId();
			mav.addAllObjects(assembleService.getNewspaperDetail(newspaperId));
		}
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@RequestMapping(value = "/admin-settlement", method = RequestMethod.GET)
	public ModelAndView adminSettlementView(HttpServletRequest request) {
		ModelAndView mav = Integer.parseInt(CookiesUtil.getCookieValue(request, "nv_screen_width"))<1600 ? 
				new ModelAndView("admin/admin-settlement-small") : new ModelAndView("admin/admin-settlement");
		long gameId = (long) request.getSession().getAttribute(PageParamType.GAMEID_IN_SESSION);
		if(gameId > 0L){	
			mav.addObject("gameId",gameId);
			mav.addAllObjects(playerService.getPlayerInfo(gameId));
		}
		mav.addAllObjects(basicService.getSessionUserService(request.getSession()));
		return mav;
	}
	
	@RequestMapping(value = "/admin-replay", method = RequestMethod.GET)
	public ModelAndView adminSummaryView(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/admin-replay");
		mav.addAllObjects(basicService.getSessionUserService(request.getSession()));
		return mav;
	}
	
	@RequestMapping(value = "/notSupport", method = RequestMethod.GET)
	public ModelAndView notSupportView(HttpSession session) {
		ModelAndView mav = new ModelAndView("pages/not-support");
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	

}
