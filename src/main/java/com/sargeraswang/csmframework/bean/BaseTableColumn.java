package com.sargeraswang.csmframework.bean;

import java.sql.Types;
import java.util.List;

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
    /**
     * 处理方式
     */
    private int toDealWith;
    /**
     * 翻译字段
     */
    private String statusKey;
    /**
     * 翻译字段类型(1:单选,2:多选)
     */
    private int statusType;
    /**
     * 上传文件类型(1:图片,2:任意)
     */
    private int uploadFileType;
    /**
     * 上传文件只允许一个(1:是,2:否)
     */
    private int uploadOnlyOne;
    private List<String[]> statusList;

    public List<String[]> getStatusList() {
        return statusList;
    }

    public void setStatusList(List<String[]> statusList) {
        this.statusList = statusList;
    }

    public int getStatusType() {
        return statusType;
    }

    public void setStatusType(int statusType) {
        this.statusType = statusType;
    }

    public String getStatusKey() {
        return statusKey;
    }

    public void setStatusKey(String statusKey) {
        this.statusKey = statusKey;
    }

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
        if (type == Types.DATE || type == Types.TIME || type == Types.TIMESTAMP) {
            this.simpleType = 1;
        } else if (type == Types.CHAR || type == Types.NCHAR || type == Types.VARCHAR || type == Types.NVARCHAR
                || type == Types.LONGVARCHAR || type == Types.LONGNVARCHAR) {
            this.simpleType = 2;
        } else if (type == Types.INTEGER || type == Types.BIGINT || type == Types.SMALLINT || type == Types.TINYINT
                || type == Types.DECIMAL || type == Types.DOUBLE) {
            this.simpleType = 3;
        } else {
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

    public int getToDealWith() {
        return toDealWith;
    }

    public void setToDealWith(int toDealWith) {
        this.toDealWith = toDealWith;
    }

    public boolean isPrimaryKey() {
        return isPrimaryKey;
    }

    public void setIsPrimaryKey(boolean isPrimaryKey) {
        this.isPrimaryKey = isPrimaryKey;
    }

    public int getUploadOnlyOne() {
        return uploadOnlyOne;
    }

    public void setUploadOnlyOne(int uploadOnlyOne) {
        this.uploadOnlyOne = uploadOnlyOne;
    }

    public int getUploadFileType() {
        return uploadFileType;
    }

    public void setUploadFileType(int uploadFileType) {
        this.uploadFileType = uploadFileType;
    }
}
