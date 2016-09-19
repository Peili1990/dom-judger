package org.nv.dom.web.dao.user;

import java.util.List;

import org.nv.dom.domain.message.chat.ChatInfo;
import org.nv.dom.domain.message.chat.OfflineChat;
import org.nv.dom.domain.user.UserAuthority;
import org.nv.dom.domain.user.UserCurRole;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
	/**
	 * <p>查询玩家当前状态</p>
	 */
	public UserCurRole getUserCurRoleDao(long userId);
	
	/**
	 * <p>查询聊天会话信息</p>
	 */
	
	public List<ChatInfo> getChatInfoDao(List<Long> users);
	
	/**
	 * <p>获取离线消息</p>
	 */

	public List<OfflineChat> getOfflineChatDao(long userId);
	
	/**
	 * <p>获取所有法官信息</p>
	 */
	
	public List<UserAuthority> getAllJudegersDao();
}
