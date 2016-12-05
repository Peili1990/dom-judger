package org.nv.dom.web.service;

import java.util.Map;

import org.nv.dom.domain.user.User;
import org.nv.dom.dto.authority.AddUserCardDTO;

public interface AuthorityService {
	
	public Map<String, Object> getAllJudegers();

	public Map<String, Object> addJudger(String judgerName, User user);

	public Map<String, Object> removeJudger(long judgerId, User user);

	public Map<String, Object> generateInvCode(Integer codeNum, User user);

	public Map<String, Object> saveRule(String content, User user);

	public String getInfoMessage();

	public Map<String, Object> submitInfoMessage(String infoMessage, User user);

	public Map<String, Object> addUserCard(AddUserCardDTO addUserCardDTO, User user);

}
