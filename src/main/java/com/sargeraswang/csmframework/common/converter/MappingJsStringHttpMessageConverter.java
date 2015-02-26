package com.sargeraswang.csmframework.common.converter;

import com.sargeraswang.csmframework.bean.BaseJsString;
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
 * Created by SagerasWang on 15/1/21.
 */
public class MappingJsStringHttpMessageConverter extends AbstractHttpMessageConverter<BaseJsString> {

    public MappingJsStringHttpMessageConverter() {
        super(new MediaType("*","*"));
    }

    @Override
    protected boolean supports(Class<?> clazz) {
        return false;
    }

    @Override
    public boolean canWrite(Class<?> clazz, MediaType mediaType) {
        return clazz.equals(BaseJsString.class);
    }

    @Override
    protected BaseJsString readInternal(Class<? extends BaseJsString> clazz, HttpInputMessage inputMessage) throws IOException, HttpMessageNotReadableException {
        return null;
    }

    @Override
    protected void writeInternal(BaseJsString baseJsString, HttpOutputMessage outputMessage) throws IOException, HttpMessageNotWritableException {
        Charset charset = Charset.forName("UTF-8");
        outputMessage.getHeaders().setContentType(new MediaType("text", "javascript", charset));
        StreamUtils.copy(baseJsString.getContent(), charset, outputMessage.getBody());
    }
}
