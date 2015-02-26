package com.sargeraswang.csmframework.bean;

import java.util.List;

/**
 * Created by SagerasWang on 14/11/25.
 */
public class BaseQueryAjaxBean {
    private Integer draw;
    private Integer recordsTotal;
    private Integer recordsFiltered;
    private List<?> data;

    public BaseQueryAjaxBean() {
        draw = 1;
    }

    public Integer getDraw() {
        return draw;
    }

    public void setDraw(Integer draw) {
        this.draw = draw;
    }

    public Integer getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(Integer recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public Integer getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(Integer recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public List<?> getData() {
        return data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }
}
