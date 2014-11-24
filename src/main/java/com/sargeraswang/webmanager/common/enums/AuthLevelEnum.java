package com.sargeraswang.webmanager.common.enums;

public enum AuthLevelEnum {
	
	UNCHECK((String)"0", "不验证"),//不需要
	GENERAL((String)"1", "一般验证（普通）"),//不需要登录，正常访问
	SENIOR((String)"2", "高级验证"),//需要登录，有短时间过期时间
	LOGIN((String)"3", "登录加一般验证"),//一般登录
	;
	
	final public String value;
	final public String show;
	
	private AuthLevelEnum(String value, String show) {
		this.value = value;
		this.show = show;
	}
	
	public AuthLevelEnum getEnumInstance(Byte value){
		return values()[value];
	}
	
	public String value() {
		return value;
	}

	public String show() {
		return show;
	}
}
