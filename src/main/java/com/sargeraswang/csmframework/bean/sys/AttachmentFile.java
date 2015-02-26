package com.sargeraswang.csmframework.bean.sys;

import java.util.Date;

/**
 * Created by SagerasWang on 15/2/5.
 */
public class AttachmentFile {
    private Integer id;
    /**
     * 类型
     */
    private Integer type;
    /**
     * 原文件名称
     */
    private String originalFileName;
    /**
     * 新文件名称
     */
    private String newFileName;
    /**
     * 文件路径
     */
    private String path;
    /**
     * 文件md5
     */
    private String md5;
    /**
     * 上传时间
     */
    private Date uploadDate;
    /**
     * 上传人
     */
    private Integer userId;
    /**
     * 文件识别码
     */
    private String uniqueKey;

    public String getUniqueKey() {
        return uniqueKey;
    }

    public void setUniqueKey(String uniqueKey) {
        this.uniqueKey = uniqueKey;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getOriginalFileName() {
        return originalFileName;
    }

    public void setOriginalFileName(String originalFileName) {
        this.originalFileName = originalFileName;
    }

    public String getNewFileName() {
        return newFileName;
    }

    public void setNewFileName(String newFileName) {
        this.newFileName = newFileName;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getMd5() {
        return md5;
    }

    public void setMd5(String md5) {
        this.md5 = md5;
    }

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
