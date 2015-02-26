package com.sargeraswang.csmframework.dao.mapper;

import com.sargeraswang.csmframework.bean.sys.AttachmentFile;

public interface AttachmentFileMapper {
    int insertAttachmentFile(AttachmentFile attachmentFile);
    AttachmentFile selectAttachmentFileByKey(String key);
}