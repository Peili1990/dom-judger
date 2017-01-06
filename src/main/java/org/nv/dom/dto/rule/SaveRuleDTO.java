package org.nv.dom.dto.rule;

public class SaveRuleDTO {
	
	private Integer row;
	private Integer index;	
	private Integer newIndex;
	private String header;
	private String content;
	public Integer getRow() {
		return row;
	}
	public void setRow(Integer row) {
		this.row = row;
	}	
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public Integer getNewIndex() {
		return newIndex;
	}
	public void setNewIndex(Integer newIndex) {
		this.newIndex = newIndex;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

}
