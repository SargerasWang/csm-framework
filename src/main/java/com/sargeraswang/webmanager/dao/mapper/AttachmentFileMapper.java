package com.sargeraswang.webmanager.dao.mapper;

import com.sargeraswang.webmanager.bean.sys.AttachmentFile;

public interface AttachmentFileMapper {
    int insertAttachmentFile(AttachmentFile attachmentFile);
    AttachmentFile selectAttachmentFileByKey(String key);
}