package org.nv.dom.web.dao.newspaper;

import org.nv.dom.domain.newspaper.Newspaper;
import org.springframework.stereotype.Repository;

@Repository
public interface NewspaperMapper {
	
	public int createOrUpdateNewspaperDao(Newspaper newspaper);

}
