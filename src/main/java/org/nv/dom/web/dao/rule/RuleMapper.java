package org.nv.dom.web.dao.rule;

import java.util.List;

import org.nv.dom.domain.rule.RuleIndex;
import org.nv.dom.domain.rule.RuleRow;
import org.nv.dom.dto.rule.GetRuleContentDTO;
import org.nv.dom.dto.rule.SaveRuleDTO;
import org.springframework.stereotype.Repository;

@Repository
public interface RuleMapper {
	
	public List<RuleRow> getRuleRowContent();
	
	public List<RuleIndex> getAllRuleIndexContent();
	
	public RuleIndex selectRuleIndex(Integer chapterId);
	
	public String getRuleIndexContent(GetRuleContentDTO getRuleContentDTO);
	
	public int saveRule(SaveRuleDTO saveRuleDTO);

}
