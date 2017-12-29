package org.nv.dom.web.dao.newspaper;

import java.util.List;

import org.nv.dom.domain.newspaper.Newspaper;
import org.springframework.stereotype.Repository;

@Repository
public interface NewspaperMapper {
	
	public int createOrUpdateNewspaperDao(Newspaper newspaper);
	
	public List<Newspaper> getNewspaperListDao(long gameId);
	
	public long getLatestNewspaperId(long gameId);
	
	public Newspaper getNewspaperDetailDao(long newspaperId);
	
	public int updateNewspaperStatusDao(long gameId);
	

}
