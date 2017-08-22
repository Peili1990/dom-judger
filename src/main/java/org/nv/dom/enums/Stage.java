package org.nv.dom.enums;

public enum Stage {
	
	GAME_START(11,"游戏开始前",2),
	NIGHT(2,"夜间阶段",3),
	SETTLING(3,"结算阶段",5),
	DAY(5,"白天阶段",7),
	VOTING(7,"投票阶段",2);
	
	private final Integer code;
	private final String message;
	private final Integer next;

	private Stage(Integer code, String message, Integer next) {
		this.code = code;
		this.message = message;
		this.next = next;
	}
	public Integer getCode() {
		return code;
	}
	public String getMessage() {
		return message;
	}
	public Integer getNext() {
		return next;
	}
	
	
	
	

}
