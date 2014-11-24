package com.sargeraswang.webmanager.common.condition;

import java.util.HashMap;
import java.util.Map;

public class SimpleCondition {
	
	public SimpleCondition(){
		criteria = new HashMap<String, Object>();
	}
	
	protected Map<String,Object> criteria;
	protected boolean distinct;
	
	protected int limit;

    protected String orderByClause;

    protected int start;
    
    public void setPageInfo(int page, int maxNum) {
		if (page < 1) {
			page = 1;
		}
		if (maxNum < 1) {
			maxNum = 10;
		}
		this.start = (page-1) * maxNum;
		this.limit = maxNum;
	}

	public Map<String, Object> getCriteria() {
		return criteria;
	} 

	public int getLimit() {
		return limit;
	}

	public String getOrderByClause() {
		return orderByClause;
	}

	public int getStart() {
		return start;
	}

	public boolean isDistinct() {
		return distinct;
	}

	public void setCriteria(Map<String, Object> criteria) {
		this.criteria = criteria;
	}

	public void setDistinct(boolean distinct) {
		this.distinct = distinct;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	public void setStart(int start) {
		this.start = start;
	}
	
	public Map<String,Object> put(String key,Object value){
		criteria.put(key, value);
		return criteria;
	}

}
