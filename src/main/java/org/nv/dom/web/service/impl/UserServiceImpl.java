package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.message.chat.ChatDetail;
import org.nv.dom.domain.message.chat.ChatInfo;
import org.nv.dom.domain.message.chat.OfflineChat;
import org.nv.dom.domain.user.User;
import org.nv.dom.domain.user.UserCurRole;
import org.nv.dom.dto.message.GetChatRecordDTO;
import org.nv.dom.web.dao.account.AccountMapper;
import org.nv.dom.web.dao.user.UserMapper;
import org.nv.dom.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {	
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	AccountMapper accountMapper;
	
	@Override
	public UserCurRole getUserCurRole(User user) {
		return userMapper.getUserCurRoleDao(user.getId());
	}
	
	@Override
	public Map<String, Object> getChatInfo(String chatId, String userId) {
		Map<String, Object> result = new HashMap<String, Object>();
		String[] temp = chatId.split("-");
		long toUserId = Long.parseLong(temp[0].equals(userId) ? temp[1] : temp[0]);
		ChatInfo chatInfo = userMapper.getChatInfoDao(toUserId);
		chatInfo.setChatId(chatId);
		result.put("chatInfo", chatInfo);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取聊天信息成功！");
		return result;
	}
	
	@Override
	public Map<String, Object> getOfflineMessage(long userId) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<OfflineChat> offlineChat = userMapper.getOfflineChatDao(userId);
		result.put("offlineChat", offlineChat);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取离线消息数量成功");
		return result;
	}

	@Override
	public Map<String, Object> getChatRecord(GetChatRecordDTO getChatRecordDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		Assert.isTrue(getChatRecordDTO.getChatId().indexOf(String.valueOf(getChatRecordDTO.getUserId()))>=0, "无法获取非本人聊天记录");
		getChatRecordDTO.setOffset(10*getChatRecordDTO.getPageNum());
		List<ChatDetail> chatDetails = userMapper.getChatRecordDao(getChatRecordDTO);
		if(getChatRecordDTO.getPageNum() == 0){
			userMapper.updateChatRecordDao(getChatRecordDTO);
		}
		result.put("chatDetails", chatDetails);
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "获取聊天记录成功");
		return result;
	}
}
