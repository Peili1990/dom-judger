package org.nv.dom.domain.message.chat;

public class OfflineChat {
	
	private String chatId;
	private Integer num;
	private String toUserAvatar;
	private String toUserNickname;
	private String toUserMotto;
	public String getChatId() {
		return chatId;
	}
	public void setChatId(String chatId) {
		this.chatId = chatId;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getToUserAvatar() {
		return toUserAvatar;
	}
	public void setToUserAvatar(String toUserAvatar) {
		this.toUserAvatar = toUserAvatar;
	}
	public String getToUserNickname() {
		return toUserNickname;
	}
	public void setToUserNickname(String toUserNickname) {
		this.toUserNickname = toUserNickname;
	}
	public String getToUserMotto() {
		return toUserMotto;
	}
	public void setToUserMotto(String toUserMotto) {
		this.toUserMotto = toUserMotto;
	}

}
