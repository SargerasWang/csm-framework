package com.sargeraswang.csmframework.controller;

import com.sargeraswang.csmframework.bean.BaseExecuteAjaxBean;
import com.sargeraswang.csmframework.bean.BaseFileMeta;
import com.sargeraswang.csmframework.bean.sys.AttachmentFile;
import com.sargeraswang.csmframework.common.Constants;
import com.sargeraswang.csmframework.common.util.JsonUtil;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
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
    public String fileUpload(MultipartHttpServletRequest request,@RequestParam Map<String, String> allRequestParams) {
        MultipartFile file ;
        List<BaseFileMeta> files = new ArrayList<>();
        Iterator<String> itr = request.getFileNames();
        while (itr.hasNext()) {
            BaseFileMeta bfm = new BaseFileMeta();
            try {
                file = request.getFile(itr.next());

                Integer type = Constants.ATTACHMENT_FILE_TYPE_DEFAULT;
                if(allRequestParams.containsKey("type")){
                    type = Integer.valueOf(allRequestParams.get("type"));
                }
                AttachmentFile attachmentFile = service.insertAttachmentFile(file, type, Integer.valueOf(getCurrentUserId()));

                bfm.setFileName(file.getOriginalFilename());
                bfm.setFileSize(file.getSize() / 1024 + " Kb");
                bfm.setFileType(file.getContentType());
                bfm.setKey(attachmentFile.getUniqueKey());
            } catch (Exception e) {
                LG.error("文件上传失败",e);
                bfm.setErrMsg("文件上传失败");
            }
            files.add(bfm);
        }
        return JsonUtil.toJson(files);
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
            throw new RuntimeException("key["+key+"]不存在!");
        }
        return file;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteFile")
    public String fileDelete(@RequestParam Map<String, String> allRequestParams) {
        if(! allRequestParams.containsKey("key")){
           throw new RuntimeException("删除文件key不可为空!");
        }
        BaseExecuteAjaxBean bean = new BaseExecuteAjaxBean();
        String key = allRequestParams.get("key");
        boolean result = service.deleteAttachmentFileByKey(key);
        bean.setStatus(result? BaseExecuteAjaxBean.Status.SUCCESS: BaseExecuteAjaxBean.Status.FAILURE);
        return JsonUtil.toJson(bean);
    }
}
