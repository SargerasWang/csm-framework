package com.sargeraswang.csmframework.common.annotation;

import com.sargeraswang.csmframework.common.ControllerPermissionType;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Created by SagerasWang on 15/3/2.
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface ControllerPermission {
    ControllerPermissionType value();
    String[] prefix() default "";
}
