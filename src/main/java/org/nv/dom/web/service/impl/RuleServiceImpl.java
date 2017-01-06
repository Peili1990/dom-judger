package org.nv.dom.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nv.dom.config.PageParamType;
import org.nv.dom.config.RedisConstant;
import org.nv.dom.domain.rule.RuleIndex;
import org.nv.dom.domain.rule.RuleRow;
import org.nv.dom.domain.user.User;
import org.nv.dom.dto.rule.GetRuleContentDTO;
import org.nv.dom.dto.rule.SaveRuleDTO;
import org.nv.dom.util.StringUtil;
import org.nv.dom.util.json.JacksonJSONUtils;
import org.nv.dom.web.dao.rule.RuleMapper;
import org.nv.dom.web.service.RuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ruleServiceImpl")
public class RuleServiceImpl extends BasicServiceImpl implements RuleService {
	
	private static Logger logger = Logger.getLogger(RuleServiceImpl.class);
	
	@Autowired
	RuleMapper ruleMapper;

	@Override
	public String getRuleContent(GetRuleContentDTO getRuleContentDTO) {
		try{
			String rule = redisClient.getHSet(RedisConstant.RULE_ROW+getRuleContentDTO.getRow(), RedisConstant.RULE_INDEX+getRuleContentDTO.getIndex());
			if(StringUtil.isNullOrEmpty(rule)){
				rule = ruleMapper.getRuleIndexContent(getRuleContentDTO);				
			}
			return rule;
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			return null;
		}		
	}

	@Override
	public Map<String, Object> getRuleRow() {
		Map<String, Object> result = new HashMap<>();
		try{
			List<RuleRow> ruleRows = JacksonJSONUtils.jsonToList(redisClient.get(RedisConstant.RULE_ROW_CONTENT, ""), RuleRow.class);
			if(ruleRows == null || ruleRows.isEmpty()){
				ruleRows = ruleMapper.getRuleRowContent();
			}
			GetRuleContentDTO getRuleContentDTO = new GetRuleContentDTO();
			for(int row=0;row<ruleRows.size();row++){
				for(RuleIndex ruleIndex:ruleRows.get(row).getIndexs()){
					getRuleContentDTO.setRow(row+1);
					getRuleContentDTO.setIndex(ruleIndex.getIndexId());
					ruleIndex.setContent(getRuleContent(getRuleContentDTO));
				}
			}
			result.put("rules", ruleRows);
			result.put(PageParamType.BUSINESS_STATUS, 1);
			result.put(PageParamType.BUSINESS_MESSAGE,"获取规则成功");
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE,"系统异常");
		}
		return result;
	}
	
	@Override
	public Map<String, Object> saveRule(SaveRuleDTO saveRuleDTO, User user) {
		Map<String, Object> result = new HashMap<String, Object>();
		if( user==null || user.getAuthority() == null || user.getAuthority() < 2){
			result.put(PageParamType.BUSINESS_STATUS, -2);
			result.put(PageParamType.BUSINESS_MESSAGE,"权限不够，无法修改规则");
			return result;
		}
		try{
			if(ruleMapper.saveRule(saveRuleDTO)==1){
				if(saveRuleDTO.getIndex()==null){
					List<RuleRow> ruleRows = JacksonJSONUtils.jsonToList(redisClient.get(RedisConstant.RULE_ROW_CONTENT, ""), RuleRow.class);
					ruleRows.get(saveRuleDTO.getRow()-1).setContent(saveRuleDTO.getContent());
					redisClient.set(RedisConstant.RULE_ROW_CONTENT, JacksonJSONUtils.beanToJSON(ruleRows));
				} else if (saveRuleDTO.getNewIndex()==1){
					List<RuleRow> ruleRows = JacksonJSONUtils.jsonToList(redisClient.get(RedisConstant.RULE_ROW_CONTENT, ""), RuleRow.class);
					ruleRows.get(saveRuleDTO.getRow()-1).getIndexs().add(new RuleIndex(saveRuleDTO.getIndex(),saveRuleDTO.getRow(),saveRuleDTO.getHeader()));
					redisClient.set(RedisConstant.RULE_ROW_CONTENT, JacksonJSONUtils.beanToJSON(ruleRows));
					redisClient.setHSet(RedisConstant.RULE_ROW+saveRuleDTO.getRow(), RedisConstant.RULE_INDEX+saveRuleDTO.getIndex(), saveRuleDTO.getContent());			
				} else {
					redisClient.setHSet(RedisConstant.RULE_ROW+saveRuleDTO.getRow(), RedisConstant.RULE_INDEX+saveRuleDTO.getIndex(), saveRuleDTO.getContent());
				}
				result.put(PageParamType.BUSINESS_STATUS, 1);
				result.put(PageParamType.BUSINESS_MESSAGE,"修改规则成功");
			} else {
				result.put(PageParamType.BUSINESS_STATUS, -3);
				result.put(PageParamType.BUSINESS_MESSAGE,"修改规则失败");
			}		
		}catch(Exception e){
			logger.error(e.getMessage(),e);
			result.put(PageParamType.BUSINESS_STATUS, -1);
			result.put(PageParamType.BUSINESS_MESSAGE,"系统异常");
		}	
		return result;
	}

}
