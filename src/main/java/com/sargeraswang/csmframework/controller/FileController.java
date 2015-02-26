package com.sargeraswang.csmframework.controller;

import com.sargeraswang.csmframework.bean.sys.AttachmentFile;
import com.sargeraswang.csmframework.common.Constants;
import com.sargeraswang.csmframework.service.AttachmentService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Created by SagerasWang on 15/2/8.
 */
@Controller
@RequestMapping("file")
public class FileController {

    private static final Logger LG=Logger.getLogger(FileController.class);
    @Resource
    AttachmentService service;

    private String getCurrentUserId() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession();
        Object uid = session.getAttribute(Constants.SESSION_KEY_UID);
        if (uid == null) {
            return null;
        }
        return uid.toString();
    }

    @ResponseBody
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public String fileUpload(@RequestParam("file") MultipartFile file,@RequestParam Map<String, String> allRequestParams) {
        if (!file.isEmpty()) {
            try {
                Integer type = Constants.ATTACHMENT_FILE_TYPE_DEFAULT;
                if(allRequestParams.containsKey("type")){
                    type = Integer.valueOf(allRequestParams.get("type"));
                }
                AttachmentFile attachmentFile = service.insertAttachmentFile(file, type, Integer.valueOf(getCurrentUserId()));
                return attachmentFile.getUniqueKey();
            } catch (Exception e) {
                LG.error("文件上传失败",e);
                return "-1";
            }
        } else {
            return "0";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/downloadFile")
    public AttachmentFile fileDownload(@RequestParam Map<String, String> allRequestParams) {
        if(! allRequestParams.containsKey("key")){
           throw new RuntimeException("下载文件key不可为空!");
        }
        String key = allRequestParams.get("key");
        AttachmentFile file = service.selectAttachmentFileByKey(key);
        if(file == null){
            throw new RuntimeException("key不存在!");
        }
        return file;
    }
}
