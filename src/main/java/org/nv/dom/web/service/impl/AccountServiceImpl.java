package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.account.LoginDTO;
import org.nv.dom.util.StringUtil;
import org.nv.dom.web.dao.account.AccountMapper;
import org.nv.dom.web.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

@Service("accountServiceImpl")
public class AccountServiceImpl implements AccountService {
		
	@Autowired
	private AccountMapper accountMapper;

	@Override
	public Map<String, Object> loginAction(LoginDTO loginDTO) {
		Map<String, Object> result = new HashMap<String, Object>();
		Assert.isTrue(loginDTO != null && 
				!StringUtil.isNullOrEmpty(loginDTO.getAccount()) && 
				!StringUtil.isNullOrEmpty(loginDTO.getPassword()), "参数异常");
		User user = accountMapper.getUserByAccountDao(loginDTO);
		Assert.notNull(user, "用户名或密码错误");
		result.put(PageParamType.BUSINESS_STATUS, 1);
		result.put(PageParamType.BUSINESS_MESSAGE, "登录成功");
		result.put("user", user);
		return result;
	}

}
