package org.nv.dom.domain.game;

public class GameForm {
	
	/** 表格id */
	private long formId;
	/** 游戏id */
	private long gameId;
	/** 表格标题 */
	private String header;
	/** 表格内容 */
	private String content;
	public long getFormId() {
		return formId;
	}
	public void setFormId(long formId) {
		this.formId = formId;
	}
	public long getGameId() {
		return gameId;
	}
	public void setGameId(long gameId) {
		this.gameId = gameId;
	}
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
