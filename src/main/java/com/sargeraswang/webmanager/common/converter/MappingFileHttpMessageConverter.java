package com.sargeraswang.webmanager.common.converter;

import com.sargeraswang.webmanager.bean.sys.AttachmentFile;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.http.converter.AbstractHttpMessageConverter;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.util.StreamUtils;

import java.io.IOException;
import java.nio.charset.Charset;

/**
 *
 */
public class MappingFileHttpMessageConverter extends AbstractHttpMessageConverter<AttachmentFile> {

    public MappingFileHttpMessageConverter() {
        super(new MediaType("*", "*"));
    }

    @Override
    protected boolean supports(Class<?> clazz) {
        return false;
    }

    @Override
    public boolean canWrite(Class<?> clazz, MediaType mediaType) {
        return clazz.equals(AttachmentFile.class);
    }

    @Override
    protected AttachmentFile readInternal(Class<? extends AttachmentFile> clazz, HttpInputMessage inputMessage) throws IOException, HttpMessageNotReadableException {
        return null;
    }

    @Override
    protected void writeInternal(AttachmentFile file, HttpOutputMessage outputMessage) throws IOException, HttpMessageNotWritableException {
        Charset charset = Charset.forName("UTF-8");
        outputMessage.getHeaders().setContentType(new MediaType("application", "octet-stream", charset));
        outputMessage.getHeaders().set("Content-Disposition", "attachment; filename=\"" + file.getOriginalFileName() + "\"");
        StreamUtils.copy(new java.io.FileInputStream(file.getPath() + file.getNewFileName()), outputMessage.getBody());
    }
}
