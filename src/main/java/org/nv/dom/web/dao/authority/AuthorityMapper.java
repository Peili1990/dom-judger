package org.nv.dom.web.dao.authority;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.nv.dom.domain.user.UserAuthority;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthorityMapper {
	
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
	
	/**
	 * <p>获取所有法官信息</p>
	 */
	
	public List<UserAuthority> getAllJudegersDao();
	
	/**
	 * <p>新增版杀法官</p>
	 */
	
	public int insertJudgerDao(long userId);
	
	/**
	 * <p>删除版杀法官</p>
	 */
	
	public int deleteJudgerDao(long userId);
	
	/**
	 * <p>获取公告</p>
	 */

	public String getInfoMessageDao();
	
	/**
	 * <p>插入公告</p>
	 */

	public int insertInfoMessageDao(@Param("infoMessage")String infoMessage, @Param("userId")long userId);

}
