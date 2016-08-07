package org.nv.dom.domain.player;

public class PlayerReplaceSkin {
	
	private Integer id;
	private long playerId;
	private String characterName;
	private String characterAvatar;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public long getPlayerId() {
		return playerId;
	}
	public void setPlayerId(long playerId) {
		this.playerId = playerId;
	}
	public String getCharacterName() {
		return characterName;
	}
	public void setCharacterName(String characterName) {
		this.characterName = characterName;
	}
	public String getCharacterAvatar() {
		return characterAvatar;
	}
	public void setCharacterAvatar(String characterAvatar) {
		this.characterAvatar = characterAvatar;
	}
}
