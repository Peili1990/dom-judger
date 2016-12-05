package org.nv.dom.domain.user;

public class UserCard {
	
	private long userId;
	private String nickname;
	private Integer campCardNum;
	private Integer identityCardNum;
	
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Integer getCampCardNum() {
		return campCardNum;
	}
	public void setCampCardNum(Integer campCardNum) {
		this.campCardNum = campCardNum;
	}
	public Integer getIdentityCardNum() {
		return identityCardNum;
	}
	public void setIdentityCardNum(Integer identityCardNum) {
		this.identityCardNum = identityCardNum;
	}
	
	

}
