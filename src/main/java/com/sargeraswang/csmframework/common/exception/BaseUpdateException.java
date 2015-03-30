package com.sargeraswang.csmframework.common.exception;

/**
 * Created by SagerasWang on 15/3/30.
 */
public class BaseUpdateException extends RuntimeException {
    public BaseUpdateException(Exception e){
        super(e);
    }
}
