package org.nv.dom.web.service;

import java.util.Map;

public interface StatisticsService {
	
	Map<String,Object> getCharacterData();

	Map<String, Object> getCharacterRecord(Integer characterId);

}
