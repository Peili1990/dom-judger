package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.NVTermConstant;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.message.speech.Speech;
import org.nv.dom.domain.newspaper.Newspaper;
import org.nv.dom.domain.player.PlayerInfo;
import org.nv.dom.web.dao.message.MessageMapper;
import org.nv.dom.web.dao.newspaper.NewspaperMapper;
import org.nv.dom.web.dao.player.PlayerMapper;
import org.nv.dom.web.service.AssembleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("assembleServiceImpl")
public class AssembleServiceImpl implements AssembleService {
	
	private Logger logger = Logger.getLogger(GameServiceImpl.class);
	
	@Autowired
	NewspaperMapper newspaperMapper;

	@Autowired
	PlayerMapper playerMapper;
	
	@Autowired
	MessageMapper messageMapper;
	
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
		try{
			Newspaper newspaper = newspaperMapper.getNewspaperDetailDao(newspaperId);
			if(newspaper.getType() == NVTermConstant.DAILY_PAPER){
				List<Speech> speechList = messageMapper.getSpeechListDao(newspaperId);
				result.put("speechList", speechList);
			}
			result.put("newspaperDetail", newspaper);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取报纸详情成功");
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

	@Override
	public Map<String, Object> generateSeatTable(long gameId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			List<PlayerInfo> players = playerMapper.getAlivePlayersDao(gameId);
			if(players == null || players.size()<6){
				result.put(PageParamType.BUSINESS_STATUS, -3);
				result.put(PageParamType.BUSINESS_MESSAGE, "存活玩家太少，无法生成座位表！");
			} else {
				String seatTableHtml = generateSeatTableHtml(players);
				result.put("seatTable", seatTableHtml);
				result.put(PageParamType.BUSINESS_STATUS, 1);
				result.put(PageParamType.BUSINESS_MESSAGE, "生成座位表成功");
			}	
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}
	
	private String generateSeatTableHtml(List<PlayerInfo> players){
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
		return seatTableHtml.toString();
	}

	@Override
	public Map<String, Object> createOrUpdateNewspaper(Newspaper newspaper) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			newspaperMapper.createOrUpdateNewspaperDao(newspaper);
			result.put("newspaperId", newspaper.getNewspaperId());
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "新增或更新报纸成功！");
		}catch(Exception e){  
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}
	
}
