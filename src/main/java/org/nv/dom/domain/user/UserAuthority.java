package org.nv.dom.domain.user;

public class UserAuthority {
	
	private long id;
	private long userId;
	private Integer status;
	private String statusDesc;
	private Integer authorityLevel;
	private String nickname;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getAuthorityLevel() {
		return authorityLevel;
	}
	public void setAuthorityLevel(Integer authorityLevel) {
		this.authorityLevel = authorityLevel;
	}
	public String getStatusDesc() {
		return statusDesc;
	}
	public void setStatusDesc(String statusDesc) {
		this.statusDesc = statusDesc;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	

}
