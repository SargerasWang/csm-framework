package com.sargeraswang.csmframework.bean;

import java.util.List;
import java.util.Map;

/**
 * Created by SagerasWang on 15/8/3.
 */
public class BaseGenerateCodeCfg {
    private String tableName;
    private String align;
    private List<Map<String, String>> columnCfgList;
    private List<BaseTableColumn> finalColumnCfgList;

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getAlign() {
        return align;
    }

    public void setAlign(String align) {
        this.align = align;
    }

    public List<Map<String, String>> getColumnCfgList() {
        return columnCfgList;
    }

    public void setColumnCfgList(List<Map<String, String>> columnCfgList) {
        this.columnCfgList = columnCfgList;
    }

    public List<BaseTableColumn> getFinalColumnCfgList() {
        return finalColumnCfgList;
    }

    public void setFinalColumnCfgList(List<BaseTableColumn> finalColumnCfgList) {
        this.finalColumnCfgList = finalColumnCfgList;
    }
}
