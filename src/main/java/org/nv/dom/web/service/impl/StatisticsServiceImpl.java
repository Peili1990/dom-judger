package org.nv.dom.web.service.impl;

import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.character.CharacterData;
import org.nv.dom.util.json.JacksonJSONUtils;
import org.nv.dom.web.dao.character.CharacterMapper;
import org.nv.dom.web.service.StatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("statisticsServiceImpl")
public class StatisticsServiceImpl implements StatisticsService {
	
	private Logger logger = Logger.getLogger(PlayerServiceImpl.class);

	@Autowired
	CharacterMapper characterMapper;
	
	@Override
	public Map<String, Object> getCharacterData() {
		Map<String, Object> result = new HashMap<String, Object>();
		NumberFormat numberFormat = NumberFormat.getInstance();  
        numberFormat.setMaximumFractionDigits(2); 
		try{
			List<CharacterData> data = characterMapper.getCharacterData();
			for(CharacterData character : data){
				character.setGoodCampRate(numberFormat.format((float)character.getGoodCampTimes()/(float)character.getTotalPlayTimes()*100)+"%");
				character.setKillerCampRate(numberFormat.format((float)character.getKillerCampTimes()/(float)character.getTotalPlayTimes()*100)+"%");
				character.setTotalWinTimes(character.getGoodCampWinTimes()+character.getKillerCampWinTimes());
				character.setGoodCampWinrate(character.getGoodCampTimes()==0 ? "N/A": numberFormat.format((float)character.getGoodCampWinTimes()/(float)character.getGoodCampTimes()*100)+"%");
				character.setKillerCampWinrate(character.getKillerCampTimes()==0 ? "N/A": numberFormat.format((float)character.getKillerCampWinTimes()/(float)character.getKillerCampTimes()*100)+"%");
				character.setTotalWinrate(numberFormat.format((float)character.getTotalWinTimes()/(float)character.getTotalPlayTimes()*100)+"%");
				character.setUndefeatedRate(numberFormat.format((float)(character.getTotalWinTimes()+character.getTiedTimes())/(float)character.getTotalPlayTimes()*100)+"%");
			}
			result.put("characterData", data);
			result.put("characterDataStr",JacksonJSONUtils.beanToJSON(data));
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取角色数据成功");
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}

}
