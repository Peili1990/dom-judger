package org.nv.dom.web.service;

import java.util.Map;

import org.nv.dom.domain.user.User;

public interface AuthorityService {
	
	public Map<String, Object> getAllJudegers();

	public Map<String, Object> addJudger(String judgerName, User user);

	public Map<String, Object> removeJudger(long judgerId, User user);

	public Map<String, Object> generateInvCode(Integer codeNum, User user);

	public Map<String, Object> saveRule(String content, User user);

}
