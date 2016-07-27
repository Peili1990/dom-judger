package org.nv.dom.web.service;

import java.util.List;
import java.util.Map;

import org.nv.dom.domain.newspaper.Newspaper;

public interface AssembleService {
	
	public List<Newspaper> getNewspaperList(long gameId);
	
	public Map<String, Object> getNewspaperDetail(long newspaperId);
	
	public Map<String, Object> generateSeatTable(long gameId);

}
