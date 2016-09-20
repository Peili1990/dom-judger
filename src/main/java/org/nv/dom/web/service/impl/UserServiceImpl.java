package org.nv.dom.web.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.message.chat.ChatInfo;
import org.nv.dom.domain.message.chat.OfflineChat;
import org.nv.dom.domain.user.User;
import org.nv.dom.domain.user.UserAuthority;
import org.nv.dom.domain.user.UserCurRole;
import org.nv.dom.enums.PlayerStatus;
import org.nv.dom.web.dao.account.AccountMapper;
import org.nv.dom.web.dao.user.UserMapper;
import org.nv.dom.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {	
	
	private static Logger logger = Logger.getLogger(UserServiceImpl.class);
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	AccountMapper accountMapper;
	
	@Override
	public UserCurRole getUserCurRole(User user) {
		return userMapper.getUserCurRoleDao(user.getId());
	}
	
	@Override
	public Map<String, Object> getChatInfo(List<String> chatIdList, String userId) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<Long> users = new ArrayList<>();
		for(String chatId : chatIdList){
			String[] temp = chatId.split("-");
			users.add(Long.parseLong(temp[0].equals(userId) ? temp[1] : temp[0]));
		}
		try{
			List<ChatInfo> chatList = null;
			if(!users.isEmpty()){
				chatList = userMapper.getChatInfoDao(users); 
			}
			for(int i=0;i<chatIdList.size();i++){
				chatList.get(i).setChatId(chatIdList.get(i));
			}
			result.put("chatList", chatList);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取聊天信息成功！");
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常");
		}
		return result;
	}
	
	@Override
	public Map<String, Object> getOfflineMessage(long userId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			List<OfflineChat> offlineChat = userMapper.getOfflineChatDao(userId);
			result.put("offlineChat", offlineChat);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取离线消息数量成功");
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常"); 
		}
		return result;
	}

	@Override
	public Map<String, Object> getAllJudegers() {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			List<UserAuthority> authorities = userMapper.getAllJudegersDao();
			for(UserAuthority authority:authorities){
				if(PlayerStatus.ALTER_JUDGER.getCode().equals(authority.getStatus())){
					authority.setStatusDesc("申请版杀法官中");
				}else if(PlayerStatus.JUDGER.getCode().equals(authority.getStatus())){
					authority.setStatusDesc("主持版杀中");
				}else if(authority.getStatus() == null){
					authority.setStatus(0);
					authority.setStatusDesc("空闲中");
				}else{
					authority.setStatusDesc("游戏中");
				}
			}
			List<String> invcodes = accountMapper.getInvCodeListDao();
			result.put("invcodes", invcodes);
			result.put("authorities", authorities);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "获取成功"); 
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常"); 
		}
		return result;
	}

	@Override
	public Map<String, Object> addJudger(String judgerName, User user) {
		Map<String, Object> result = new HashMap<String, Object>();
		if( user==null || user.getAuthority() == null || user.getAuthority() < 2){
			result.put(PageParamType.BUSINESS_STATUS, -2);
			result.put(PageParamType.BUSINESS_MESSAGE,"权限不够，无法添加法官");
			return result;
		}
		try{
			Long userId = accountMapper.getUserIdByNicknameDao(judgerName);
			if(userId == null){
				result.put(PageParamType.BUSINESS_STATUS, -3);
				result.put(PageParamType.BUSINESS_MESSAGE,"无此用户");
			}else{
				if(userMapper.insertJudgerDao(userId)==1){
					result.put(PageParamType.BUSINESS_STATUS, 1);
					result.put(PageParamType.BUSINESS_MESSAGE, "添加成功");
				}else {
					result.put(PageParamType.BUSINESS_STATUS, -4);
					result.put(PageParamType.BUSINESS_MESSAGE, "已经添加，不能重复添加");
				}
			}
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常"); 
		}
		return result;
	}

	@Override
	public Map<String, Object> removeJudger(long judgerId, User user) {
		Map<String, Object> result = new HashMap<String, Object>();
		if( user==null || user.getAuthority() == null || user.getAuthority() < 2){
			result.put(PageParamType.BUSINESS_STATUS, -2);
			result.put(PageParamType.BUSINESS_MESSAGE,"权限不够，无法删除法官");
			return result;
		}
		try{
			userMapper.deleteJudgerDao(judgerId);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "删除成功");	
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常"); 
		}
		return result;
	}

}
