package com.sargeraswang.webmanager.common.util;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;

/**
 * Created by SagerasWang on 15/2/8.
 */
public class SpringBeanFactoryUtils implements BeanFactoryAware {

    private static BeanFactory beanFactory = null;

    public void setBeanFactory(BeanFactory beanFactory) throws BeansException {
        SpringBeanFactoryUtils.beanFactory = beanFactory;
    }

    public static Object getBean(String name) {
        return beanFactory.getBean(name);
    }

    public static <T> T getBean(Class<T> clazz){
        return beanFactory.getBean(clazz);
    }
}
