package com.sargeraswang.csmframework.service;

import com.sargeraswang.csmframework.bean.sys.AttachmentFile;
import com.sargeraswang.csmframework.common.Constants;
import com.sargeraswang.csmframework.common.util.DateUtil;
import com.sargeraswang.csmframework.common.util.StringUtil;
import com.sargeraswang.csmframework.dao.mapper.AttachmentFileMapper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by SagerasWang on 15/2/5.
 */
@Service
public class AttachmentService {

    private static final Logger LG = Logger.getLogger(AttachmentService.class);
    @Autowired
    AttachmentFileMapper attachmentFileMapper;

    public AttachmentFile insertAttachmentFile(MultipartFile file,Integer type,Integer userId) {
        StringBuffer fileName;
        String md5;
        String path ;
        String now = DateUtil.getFormatNow("yyyyMMddHHmmssSSS");
        try {
            fileName = new StringBuffer();
            byte[] bytes = file.getBytes();
            fileName.append(userId);
            fileName.append("_");
            fileName.append(now);
            fileName.append("_");
            md5 = StringUtil.getMD5(bytes);
            fileName.append(md5);
            fileName.append(".").append(StringUtil.getFileSuffix(file.getOriginalFilename()));

            path = Constants.getSystemConfig(Constants.SystemConfigKey.FILE_UPLOAD_PATH);
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(
                    new File(path + fileName)));
            stream.write(bytes);
            stream.close();
        } catch (IOException e) {
            LG.error("上传文件写入磁盘失败", e);
            return null;
        }
        String key = StringUtil.getMD5(now + md5);

        AttachmentFile afile = new AttachmentFile();
        afile.setOriginalFileName(file.getOriginalFilename());
        afile.setType(type);
        afile.setNewFileName(fileName.toString());
        afile.setMd5(md5);
        afile.setPath(path);
        afile.setUserId(userId);
        afile.setUniqueKey(key);
        attachmentFileMapper.insertAttachmentFile(afile);
        return afile;
    }

    public AttachmentFile selectAttachmentFileByKey(String key){
        return attachmentFileMapper.selectAttachmentFileByKey(key);
    }

    public boolean deleteAttachmentFileByKey(String key){
        int i = attachmentFileMapper.deleteAttachmentFileByKey(key);
        return i ==1;
    }
}
