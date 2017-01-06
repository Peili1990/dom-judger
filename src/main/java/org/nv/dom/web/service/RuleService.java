package org.nv.dom.web.service;

import java.util.Map;

import org.nv.dom.domain.user.User;
import org.nv.dom.dto.rule.GetRuleContentDTO;
import org.nv.dom.dto.rule.SaveRuleDTO;

public interface RuleService {
	
	public Map<String, Object> getRuleRow();

	public String getRuleContent(GetRuleContentDTO getRuleContentDTO);
	
	public Map<String, Object> saveRule(SaveRuleDTO saveRuleDTO, User user);

}
