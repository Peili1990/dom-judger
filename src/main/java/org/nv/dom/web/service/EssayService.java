package org.nv.dom.web.service;

import java.util.Map;

import org.nv.dom.domain.essay.Essay;

public interface EssayService {

	public Map<String, Object> publishEssay(Essay essay, long gameId);

	public Essay getReplayEssay(long gameId);

	public Map<String, Object> simpleEssayBuild(long gameId);

}
