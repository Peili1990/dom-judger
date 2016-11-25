package org.nv.dom.domain.character;

public class CharacterData {
	/** 角色Id */
	private Integer characterId;
	/** 角色名称 */
	private String characterName;
	/** 总登场次数 */
	private Integer totalPlayTimes;
	/** 好人方次数 */
	private Integer goodCampTimes;
	/** 杀手方次数 */
	private Integer killerCampTimes;
	/** 好人方胜利次数 */
	private Integer goodCampWinTimes;
	/** 杀手方胜利次数 */
	private Integer killerCampWinTimes;
	/** 平局次数 */
	private Integer tiedTimes;
	/** 好人方概率 */
	private String goodCampRate; 
	/** 杀手方概率 */
	private String killerCampRate; 
	/** 总胜利次数 */
	private Integer totalWinTimes;
	/** 好人方胜率 */ 
	private String goodCampWinrate;
	/** 杀手方胜率 */
	private String killerCampWinrate;
	/** 总胜率 */
	private String totalWinrate;
	/** 不败率 */
	private String undefeatedRate;
	
	public Integer getCharacterId() {
		return characterId;
	}
	public void setCharacterId(Integer characterId) {
		this.characterId = characterId;
	}
	public String getCharacterName() {
		return characterName;
	}
	public void setCharacterName(String characterName) {
		this.characterName = characterName;
	}
	public Integer getTotalPlayTimes() {
		return totalPlayTimes;
	}
	public void setTotalPlayTimes(Integer totalPlayTimes) {
		this.totalPlayTimes = totalPlayTimes;
	}
	public Integer getGoodCampTimes() {
		return goodCampTimes;
	}
	public void setGoodCampTimes(Integer goodCampTimes) {
		this.goodCampTimes = goodCampTimes;
	}
	public Integer getKillerCampTimes() {
		return killerCampTimes;
	}
	public void setKillerCampTimes(Integer killerCampTimes) {
		this.killerCampTimes = killerCampTimes;
	}
	public Integer getGoodCampWinTimes() {
		return goodCampWinTimes;
	}
	public void setGoodCampWinTimes(Integer goodCampWinTimes) {
		this.goodCampWinTimes = goodCampWinTimes;
	}
	public Integer getKillerCampWinTimes() {
		return killerCampWinTimes;
	}
	public void setKillerCampWinTimes(Integer killerCampWinTimes) {
		this.killerCampWinTimes = killerCampWinTimes;
	}
	public Integer getTiedTimes() {
		return tiedTimes;
	}
	public void setTiedTimes(Integer tiedTimes) {
		this.tiedTimes = tiedTimes;
	}
	public String getGoodCampRate() {
		return goodCampRate;
	}
	public void setGoodCampRate(String goodCampRate) {
		this.goodCampRate = goodCampRate;
	}
	public String getKillerCampRate() {
		return killerCampRate;
	}
	public void setKillerCampRate(String killerCampRate) {
		this.killerCampRate = killerCampRate;
	}
	public Integer getTotalWinTimes() {
		return totalWinTimes;
	}
	public void setTotalWinTimes(Integer totalWinTimes) {
		this.totalWinTimes = totalWinTimes;
	}
	public String getGoodCampWinrate() {
		return goodCampWinrate;
	}
	public void setGoodCampWinrate(String goodCampWinrate) {
		this.goodCampWinrate = goodCampWinrate;
	}
	public String getKillerCampWinrate() {
		return killerCampWinrate;
	}
	public void setKillerCampWinrate(String killerCampWinrate) {
		this.killerCampWinrate = killerCampWinrate;
	}
	public String getTotalWinrate() {
		return totalWinrate;
	}
	public void setTotalWinrate(String totalWinrate) {
		this.totalWinrate = totalWinrate;
	}
	public String getUndefeatedRate() {
		return undefeatedRate;
	}
	public void setUndefeatedRate(String undefeatedRate) {
		this.undefeatedRate = undefeatedRate;
	}
	
	
}
