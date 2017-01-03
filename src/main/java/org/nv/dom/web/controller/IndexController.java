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
import org.nv.dom.web.service.AuthorityService;
import org.nv.dom.web.service.EssayService;
import org.nv.dom.web.service.GameService;
import org.nv.dom.web.service.PlayerService;
import org.nv.dom.web.service.RuleService;
import org.nv.dom.web.service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class IndexController extends BaseController {
	
	@Autowired
	AuthorityService authorityService;
	
	@Autowired
	PlayerService playerService;
	
	@Autowired
	GameService gameService;
	
	@Autowired
	AssembleService assembleService;
	
	@Autowired
	EssayService essayService;
	
	@Autowired
	StatisticsService statisticsService;
	
	@Autowired
	RuleService ruleService;
 	
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
		ApplyingGame game = null;
		if((int)result.get("status")==1){
			game = (ApplyingGame)result.get("applyingGame");
		}
		session.setAttribute(PageParamType.GAME_IN_SESSION, game);
		mav.addAllObjects(result);
		mav.addObject("infoMessage",authorityService.getInfoMessage());
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@RequestMapping(value = "/admin-character", method = RequestMethod.GET)
	public ModelAndView adminCharacterView(HttpSession session) {
		ModelAndView mav = new ModelAndView("admin/admin-character");
		ApplyingGame game = (ApplyingGame)session.getAttribute(PageParamType.GAME_IN_SESSION);
		if(game != null){	
			mav.addObject("gameId",game.getId());
			mav.addAllObjects(playerService.getPlayerInfo(game.getId()));
			mav.addAllObjects(gameService.getFormList(game.getId()));		
		}
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@RequestMapping(value = "/admin-announcement", method = RequestMethod.GET)
	public ModelAndView adminAnnouncementView(HttpSession session) {
		ModelAndView mav = new ModelAndView("admin/admin-announcement");
		ApplyingGame game = (ApplyingGame)session.getAttribute(PageParamType.GAME_IN_SESSION);
		if(game!=null){
			List<Newspaper> newspapers = assembleService.getNewspaperList(game.getId());
			mav.addObject("gameId",game.getId());
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
		ApplyingGame game = (ApplyingGame)request.getSession().getAttribute(PageParamType.GAME_IN_SESSION);
		if(game != null){	
			mav.addObject("gameId",game.getId());
			mav.addAllObjects(playerService.getPlayerInfo(game.getId()));
		}
		mav.addAllObjects(basicService.getSessionUserService(request.getSession()));
		return mav;
	}
	
	@RequestMapping(value = "/admin-replay", method = RequestMethod.GET)
	public ModelAndView adminSummaryView(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/admin-replay");
		ApplyingGame game = (ApplyingGame)request.getSession().getAttribute(PageParamType.GAME_IN_SESSION);
		if(game != null){	
			mav.addObject("applyingGame",game);
			mav.addObject("replayEssay",essayService.getReplayEssay(game.getId()));
		}
		mav.addAllObjects(basicService.getSessionUserService(request.getSession()));
		return mav;
	}
	
	@RequestMapping(value = "/notSupport", method = RequestMethod.GET)
	public ModelAndView notSupportView(HttpSession session) {
		ModelAndView mav = new ModelAndView("pages/not-support");
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@RequestMapping(value = "/admin-rule", method = RequestMethod.GET)
	public ModelAndView adminRuleView(HttpSession session) {
		ModelAndView mav = new ModelAndView("admin/admin-rule");
		mav.addAllObjects(ruleService.getRuleRow());
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@RequestMapping(value = "/admin-authority", method = RequestMethod.GET)
	public ModelAndView adminAuthorityView(HttpSession session) {
		ModelAndView mav = new ModelAndView("admin/admin-authority");
		mav.addAllObjects(authorityService.getAllJudegers());
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	@RequestMapping(value = "/admin-statistics", method = RequestMethod.GET)
	public ModelAndView adminStatisticsView(HttpSession session) {
		ModelAndView mav = new ModelAndView("admin/admin-statistics");
		mav.addAllObjects(statisticsService.getCharacterData());
		mav.addAllObjects(basicService.getSessionUserService(session));
		return mav;
	}
	
	

}
