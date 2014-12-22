package com.sargeraswang.webmanager.bean;

import java.sql.Types;

/**
 * Created by SagerasWang on 14/12/22.
 */
public class BaseTableColumn {
    private String columnName;
    private int type;
    /**
     * 0.其他
     * 1.日期
     * 2.字符串
     * 3.数字
     */
    private int simpleType;
    private int size;
    private int decimalDigits;
    private int nullable;
    private String remarks;
    private int length;
    private int seq;
    private String autoIncrement;
    private boolean isPrimaryKey;

    public boolean getIsPrimaryKey() {
        return isPrimaryKey;
    }

    public void setPrimaryKey(boolean isPrimaryKey) {
        this.isPrimaryKey = isPrimaryKey;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public int getSimpleType() {
        return simpleType;
    }

    public void setSimpleType(int type) {
        if(type == Types.DATE || type == Types.TIME || type == Types.TIMESTAMP){
            this.simpleType = 1;
        }else if(type == Types.CHAR || type == Types.NCHAR || type == Types.VARCHAR || type==Types.NVARCHAR
                || type == Types.LONGVARCHAR || type == Types.LONGNVARCHAR){
            this.simpleType = 2;
        }else if(type == Types.INTEGER || type == Types.BIGINT || type == Types.SMALLINT || type == Types.TINYINT
                || type == Types.DECIMAL || type == Types.DOUBLE){
            this.simpleType = 3;
        }else{
            this.simpleType = 0;
        }
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
        setSimpleType(type);
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getDecimalDigits() {
        return decimalDigits;
    }

    public void setDecimalDigits(int decimalDigits) {
        this.decimalDigits = decimalDigits;
    }

    public int getNullable() {
        return nullable;
    }

    public void setNullable(int nullable) {
        this.nullable = nullable;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getAutoIncrement() {
        return autoIncrement;
    }

    public void setAutoIncrement(String autoIncrement) {
        this.autoIncrement = autoIncrement;
    }
}
