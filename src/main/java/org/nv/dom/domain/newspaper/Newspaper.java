package org.nv.dom.domain.newspaper;

import org.nv.dom.config.NVTermConstant;

public class Newspaper {
	
	/** 游戏id */
	private long gameId;
	/** 报纸id */
	private long newspaperId;
	/** 报纸名称 */
	private String header;
	/** 头版头条 */
	private String headline;
	/** 头版头条内容 */
	private String headlineBody;
	/** 副版内容 */
	private String subedition;
	/** 重要公告 */
	private String importantNotice;
	/** 座次表 */
	private String seatTable;
	/** 发布状态 */
	private Integer status;
	/** 报纸类型 */
	private Integer type;
	
	public long getGameId() {
		return gameId;
	}
	public void setGameId(long gameId) {
		this.gameId = gameId;
	}
	public long getNewspaperId() {
		return newspaperId;
	}
	public void setNewspaperId(long newspaperId) {
		this.newspaperId = newspaperId;
	}
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public String getHeadline() {
		return headline;
	}
	public void setHeadline(String headline) {
		this.headline = headline;
	}
	public String getHeadlineBody() {
		return headlineBody;
	}
	public void setHeadlineBody(String headlineBody) {
		this.headlineBody = headlineBody;
	}
	public String getSubedition() {
		return subedition;
	}
	public void setSubedition(String subedition) {
		this.subedition = subedition;
	}
	public String getImportantNotice() {
		return importantNotice;
	}
	public void setImportantNotice(String importantNotice) {
		this.importantNotice = importantNotice;
	}
	public String getSeatTable() {
		return seatTable;
	}
	public void setSeatTable(String seatTable) {
		this.seatTable = seatTable;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Newspaper() {
		super();
	}
	public Newspaper(long gameId) {
		super();
		this.gameId = gameId;
		this.header = NVTermConstant.DEFAULT_HEADER;
		this.headline = NVTermConstant.DEFAULT_HEADLINE;
		this.headlineBody = NVTermConstant.DEFAULT_HEADLINE_BODY;
		this.subedition = NVTermConstant.DEFAULT_SUBEDITION;
		this.status = 1;
		this.type = 1;
	}
	
	
	
}
