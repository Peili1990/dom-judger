package org.nv.dom.web.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.NVTermConstant;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.message.speech.Speech;
import org.nv.dom.domain.newspaper.Newspaper;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.util.TextUtil;
import org.nv.dom.web.dao.message.MessageMapper;
import org.nv.dom.web.dao.newspaper.NewspaperMapper;
import org.nv.dom.web.dao.player.PlayerMapper;
import org.nv.dom.web.service.AssembleService;
import org.nv.dom.web.util.GameUtilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

@Service("assembleServiceImpl")
public class AssembleServiceImpl implements AssembleService {
	
	private Logger logger = Logger.getLogger(GameServiceImpl.class);
	
	@Autowired
	NewspaperMapper newspaperMapper;

	@Autowired
	PlayerMapper playerMapper;
	
	@Autowired
	MessageMapper messageMapper;
	
	@Autowired
	GameUtilService gameUtil;
	
	@Override
	public List<Newspaper> getNewspaperList(long gameId) {
		List<Newspaper> newspaperList = null;
		if(gameId < 1L){
			return newspaperList;
		}
		try{		
			newspaperList = newspaperMapper.getNewspaperListDao(gameId);
		}catch(Exception e){
			logger.error(e.getMessage(), e);
		}
		return newspaperList;
	}

	@Override
	public Map<String, Object> getNewspaperDetail(long newspaperId) {
		Map<String, Object> result = new HashMap<String, Object>();
		Newspaper newspaper = newspaperMapper.getNewspaperDetailDao(newspaperId);
		if(newspaper.getType() == NVTermConstant.DAILY_PAPER){
			List<Speech> speechList = messageMapper.getSpeechListDao(newspaperId);
			result.put("speechList", speechList);
		}
		result.put("newspaperDetail", newspaper);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取报纸详情成功");
		return result;
	}

	@Override
	public Map<String, Object> generateSeatTable(long gameId) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<PlayerInfo> players = gameUtil.getPlayerInfo(gameId);
		Assert.isTrue(players != null && players.size()>=6, "玩家太少，无法生成座位表！");
		String seatTableHtml = generateSeatTableHtml(players);
		result.put("seatTable", seatTableHtml);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "生成座位表成功");
		return result;
	}
	
	private String generateSeatTableHtml(List<PlayerInfo> players){
		List<PlayerInfo> temp = new ArrayList<>();
		Iterator<PlayerInfo> iter = players.iterator();
		while(iter.hasNext()){
			PlayerInfo player = iter.next();
			if(player.getStatus().stream().anyMatch(status -> status.getStatusId() == 26 
					|| status.getStatusId() == 27)){
				player.setCharacterName("<strike>"+player.getCharacterName()+"</strike>");
			}
			if(player.getStatus().stream().anyMatch(status -> status.getStatusId() == 29)){
				temp.add(player);
				iter.remove();
			}
		}
		StringBuffer seatTableHtml = new StringBuffer();
		seatTableHtml.append("<table><tbody>");
		int rows = (players.size()+1)/2-1;
		int length = players.size()%2 == 0 ? players.size() : players.size()+1;
		for(int i=1;i<=rows;i++){
			if(i==1){
				seatTableHtml.append("<tr><td>"+players.get(0).getCharacterName()+"</td>");
				seatTableHtml.append("<td align='center'>"+players.get(1).getCharacterName()+"</td>");
				seatTableHtml.append("<td align='right'>"+players.get(2).getCharacterName()+"</td></tr>");
			}else if(i==rows){
				seatTableHtml.append("<tr><td>"+players.get(i+3).getCharacterName()+"</td>");
				seatTableHtml.append("<td align='center'>"+players.get(i+2).getCharacterName()+"</td>");
				seatTableHtml.append("<td align='right'>"+players.get(i+1).getCharacterName()+"</td></tr>");
			}else{
				seatTableHtml.append(length-i+1<players.size() ? "<tr><td>"+players.get(length-i+1).getCharacterName()+"</td>":"<tr><td></td>");
				seatTableHtml.append("<td></td>");
				seatTableHtml.append("<td align='right'>"+players.get(i+1).getCharacterName()+"</td></tr>");
			}
		}
		seatTableHtml.append("</tbody></table>");
		for(PlayerInfo player:temp){
			seatTableHtml.append(player.getCharacterName()+"<br>");
		}
		return seatTableHtml.toString();
	}

	@Override
	public Map<String, Object> createOrUpdateNewspaper(Newspaper newspaper) {
		Map<String, Object> result = new HashMap<String, Object>();
		if(newspaper.getNewspaperId() == 0){
			newspaperMapper.updateNewspaperStatusDao(newspaper.getGameId());
		}
		newspaperMapper.createOrUpdateNewspaperDao(newspaper);
		result.put("newspaperId", newspaper.getNewspaperId());
		result.put("header", newspaper.getHeader());
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "新增或更新报纸成功！");
		return result;
	}

	@Override
	public Map<String, Object> wordCount(String content) {
		Map<String, Object> result = new HashMap<String, Object>();
		Integer wordCount = TextUtil.wordCount(content);
		result.put("wordCount", wordCount);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "字数统计成功");
		return result;
	}
	
}
