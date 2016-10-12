package org.nv.dom.web.service;

import java.util.Map;

import org.nv.dom.domain.user.User;
import org.nv.dom.domain.user.UserCurRole;
import org.nv.dom.dto.message.GetChatRecordDTO;

public interface UserService {
	
	public UserCurRole getUserCurRole(User user);
	
	public Map<String, Object> getChatInfo(String chatId, String userId);

	public Map<String, Object> getOfflineMessage(long userId);
	
	public Map<String, Object> getChatRecord(GetChatRecordDTO getChatRecordDTO);
 
}
