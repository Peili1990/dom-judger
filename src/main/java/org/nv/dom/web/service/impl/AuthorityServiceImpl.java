package org.nv.dom.web.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.PageParamType;
import org.nv.dom.domain.user.User;
import org.nv.dom.domain.user.UserAuthority;
import org.nv.dom.enums.PlayerStatus;
import org.nv.dom.util.RandomCodeUtil;
import org.nv.dom.util.RandomCodeUtil.CodeType;
import org.nv.dom.web.dao.account.AccountMapper;
import org.nv.dom.web.dao.authority.AuthorityMapper;
import org.nv.dom.web.service.AuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("authorityServiceImpl")
public class AuthorityServiceImpl implements AuthorityService {
	
	private static Logger logger = Logger.getLogger(AuthorityServiceImpl.class);
	
	@Autowired
	AuthorityMapper authorityMapper;
	
	@Autowired
	AccountMapper accountMapper;
	
	@Override
	public Map<String, Object> getAllJudegers() {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			List<UserAuthority> authorities = authorityMapper.getAllJudegersDao();
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
			List<String> invcodes = authorityMapper.getInvCodeListDao();
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
				if(authorityMapper.insertJudgerDao(userId)==1){
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
			authorityMapper.deleteJudgerDao(judgerId);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "删除成功");	
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE, "系统异常"); 
		}
		return result;
	}
	
	@Override
	public Map<String, Object> generateInvCode(Integer codeNum, User user) {
		Map<String, Object> result = new HashMap<String, Object>();
		if( user==null || user.getAuthority() == null || user.getAuthority() < 2){
			result.put(PageParamType.BUSINESS_STATUS, -2);
			result.put(PageParamType.BUSINESS_MESSAGE,"权限不够，无法生成邀请码");
			return result;
		}
		if(codeNum == null || codeNum < 1L){
			result.put(PageParamType.BUSINESS_STATUS, -2);
			result.put(PageParamType.BUSINESS_MESSAGE,"请输入正整数");
			return result;
		}
		try{
			List<String> invCodes = new ArrayList<String>();
			for(int i=0;i<codeNum;i++){
				invCodes.add(RandomCodeUtil.createRandomCode(6, CodeType.LETTER_NUMBER));
			}
			authorityMapper.insertInvCodeBatch(invCodes);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE, "批量生成邀请码成功！");
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE,"系统异常");
		}
		return result;
	}

	@Override
	public Map<String, Object> saveRule(String content, User user) {
		Map<String, Object> result = new HashMap<String, Object>();
		if( user==null || user.getAuthority() == null || user.getAuthority() < 2){
			result.put(PageParamType.BUSINESS_STATUS, -2);
			result.put(PageParamType.BUSINESS_MESSAGE,"权限不够，无法修改规则");
			return result;
		}
		try{
			
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE,"系统异常");
		}
		return result;
	}



}
