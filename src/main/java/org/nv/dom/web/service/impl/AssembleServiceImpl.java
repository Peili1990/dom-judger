package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.newspaper.Newspaper;
import org.nv.dom.web.dao.newspaper.NewspaperMapper;
import org.nv.dom.web.service.AssembleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("assembleServiceImpl")
public class AssembleServiceImpl implements AssembleService {
	
	private Logger logger = Logger.getLogger(GameServiceImpl.class);
	
	@Autowired
	NewspaperMapper newspaperMapper;

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
			result.put("newspaperDetail", newspaper);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_STATUS, "获取报纸详情成功");
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_STATUS, "系统异常");
		}
		return result;
	}
	
}
