package org.nv.dom.domain.game;

import java.util.List;

import org.nv.dom.domain.user.UserApplyInfo;

public class ApplyingGame {
	
	/** 游戏id */
	private long id;
	/** 游戏名称 */
	private String gameDesc;
	/** 游戏状态 */
	private Integer gameStatus;
	/** 游戏状态描述 */
	private String gameStatusDesc;
	/** 玩家名单 */
	private List<UserApplyInfo> players;
	/** 玩家人数 */
	private Integer playerNum;
	/** 当前报名人数 */
	private Integer playCurNum;
	/** 预计开始时间 */
	private String startDate;
	/** 外在身份选择方式 */
	private String characterSelect;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getGameDesc() {
		return gameDesc;
	}
	public void setGameDesc(String gameDesc) {
		this.gameDesc = gameDesc;
	}
	public Integer getGameStatus() {
		return gameStatus;
	}
	public void setGameStatus(Integer gameStatus) {
		this.gameStatus = gameStatus;
	}
	public String getGameStatusDesc() {
		return gameStatusDesc;
	}
	public void setGameStatusDesc(String gameStatusDesc) {
		this.gameStatusDesc = gameStatusDesc;
	}
	public List<UserApplyInfo> getPlayers() {
		return players;
	}
	public void setPlayers(List<UserApplyInfo> players) {
		this.players = players;
	}
	public Integer getPlayerNum() {
		return playerNum;
	}
	public void setPlayerNum(Integer playerNum) {
		this.playerNum = playerNum;
	}
	public Integer getPlayCurNum() {
		return playCurNum;
	}
	public void setPlayCurNum(Integer playCurNum) {
		this.playCurNum = playCurNum;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getCharacterSelect() {
		return characterSelect;
	}
	public void setCharacterSelect(String characterSelect) {
		this.characterSelect = characterSelect;
	}
	
}
