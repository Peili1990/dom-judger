package org.nv.dom.web.dao.account;

import java.util.List;

import org.nv.dom.domain.user.User;
import org.nv.dom.dto.account.LoginDTO;
import org.nv.dom.dto.account.RegisterDTO;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountMapper {
	
	/**
	 * <p>获取用户信息</p>
	 * @param loginDTO
	 * @return
	 * 2014年10月29日 下午3:57:12
	 * @author: z```s
	 */
	public User getUserByAccountDao(LoginDTO loginDTO);
	
	/**
	 * <p>获取同名账号数量</p>
	 * @param account
	 * @return
	 * 2014年10月29日 下午3:57:12
	 * @author: z```s
	 */
	
	public int getCountByAccountDao(String account);
	
	/**
	 * <p>创建账号</p>
	 * @param registerDTO
	 * @return
	 * 2014年10月29日 下午3:57:12
	 * @author: z```s
	 */
	
	public int insertUserDao(RegisterDTO registerDTO);
	
	/**
	 * <p>根据昵称获取账号数量</p>
	 * @param account
	 * @return
	 * 2014年10月29日 下午3:57:12
	 * @author: z```s
	 */
	
	public Long getUserIdByNicknameDao(String nickname);
	
	/**
	 * <p>批量生成邀请码</p>
	 * @param List<String>
	 * @return
	 * 2014年10月29日 下午3:57:12
	 * @author: z```s
	 */
	
	public int insertInvCodeBatch(List<String> invcodes);
	
	/**
	 * <p>获得一批邀请码</p>
	 * @param 
	 * @return
	 * 2014年10月29日 下午3:57:12
	 * @author: z```s
	 */
	public List<String> getInvCodeListDao();
}
