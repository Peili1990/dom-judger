package org.nv.dom.enums;

public enum IdentityCode {
	
	POLICE(-1,"警察",false),
	OFFICER(10,"官员",true),
	ASSASSIN(8,"刺客",true),
	DOCTER(9,"医生",true),
	PRIEST(7,"牧师",true),
	CIVILIAN(11,"平民",false),
	PIONEER(12,"先驱",false),
	KILLER(99,"杀手",false),
	MOB(22,"暴徒",true),
	SPY(20,"间谍",true),
	THIEF(19,"小偷",true),
	WIZARD(21,"巫师",true),
	GANG(23,"帮众",false);
	
	private final Integer code;
	private final String message;
	private final boolean special;
	
	private IdentityCode(Integer _code, String _message, boolean _special) {
		this.code = _code;
		this.message = _message;
		this.special = _special;
	}
	public Integer getCode() {
		return code;
	}
	public String getMessage() {
		return message;
	}	
	public boolean isSpecial() {
		return special;
	}
	/**
	 * 通过枚举code获取对应的message
	 * @return 取不到时返回null
	 * @create 2015-6-8 下午3:41:47
	 * @author 玄玉<http://blog.csdn.net/jadyer>
	 */
	public static IdentityCode getMessageByCode(Integer code) {
		for (IdentityCode _enum : values()) {
			if (code.equals(_enum.getCode())) {
				return _enum;
			}
		}
		if(code >= 1 && code <= 6){
			return POLICE;
		} else if(code >= 13 && code <= 18){
			return KILLER;
		}
		return null;
	}
	
	

}


