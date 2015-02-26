package com.sargeraswang.csmframework.common.interceptor;

import com.sargeraswang.csmframework.bean.BaseQueryParamater;
import com.sargeraswang.csmframework.common.Constants;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.factory.DefaultObjectFactory;
import org.apache.ibatis.reflection.factory.ObjectFactory;
import org.apache.ibatis.reflection.wrapper.DefaultObjectWrapperFactory;
import org.apache.ibatis.reflection.wrapper.ObjectWrapperFactory;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.RowBounds;

import java.sql.Connection;
import java.util.Properties;

/**
 * Created by SagerasWang on 15/2/26.
 */
@Intercepts({@Signature(type = StatementHandler.class, method = "prepare", args = {Connection.class})})
public class PageInterceptor implements Interceptor {

    private static final ObjectFactory DEFAULT_OBJECT_FACTORY = new DefaultObjectFactory();
    private static final ObjectWrapperFactory DEFAULT_OBJECT_WRAPPER_FACTORY = new DefaultObjectWrapperFactory();

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        StatementHandler statementHandler = (StatementHandler) invocation.getTarget();
        MetaObject metaStatementHandler = MetaObject.forObject(statementHandler, DEFAULT_OBJECT_FACTORY,
                DEFAULT_OBJECT_WRAPPER_FACTORY);

        // 分离代理对象链(由于目标类可能被多个拦截器拦截，从而形成多次代理，通过下面的两次循环可以分离出最原始的的目标类)
        while (metaStatementHandler.hasGetter("h")) {
            Object object = metaStatementHandler.getValue("h");
            metaStatementHandler = MetaObject.forObject(object, DEFAULT_OBJECT_FACTORY, DEFAULT_OBJECT_WRAPPER_FACTORY);
        }
        // 分离最后一个代理对象的目标类
        while (metaStatementHandler.hasGetter("target")) {
            Object object = metaStatementHandler.getValue("target");
            metaStatementHandler = MetaObject.forObject(object, DEFAULT_OBJECT_FACTORY, DEFAULT_OBJECT_WRAPPER_FACTORY);
        }

        Object parameterObject = metaStatementHandler.getValue("delegate.parameterHandler.parameterObject");
        if(parameterObject == null || ! (parameterObject instanceof BaseQueryParamater)){
            return invocation.proceed();
        }
        BaseQueryParamater bqp = (BaseQueryParamater)parameterObject;
        Object ol = bqp.get(Constants.BASEPARAMATER_LENGTH);
        if(ol == null || ol.equals("") || ol.equals("-1")){
            return invocation.proceed();
        }
        int length = Integer.valueOf(ol.toString());
        int start = Integer.valueOf(bqp.get(Constants.BASEPARAMATER_START).toString());
        BoundSql boundSql = (BoundSql) metaStatementHandler.getValue("delegate.boundSql");
        String sql = boundSql.getSql();
        // 重写sql
        String pageSql = buildPageSql(sql, start,length);
        metaStatementHandler.setValue("delegate.boundSql.sql", pageSql);
        // 采用物理分页后，就不需要mybatis的内存分页了，所以重置下面的两个参数
        metaStatementHandler.setValue("delegate.rowBounds.offset", RowBounds.NO_ROW_OFFSET);
        metaStatementHandler.setValue("delegate.rowBounds.limit", RowBounds.NO_ROW_LIMIT);
        return invocation.proceed();
    }

    private String buildPageSql(String sql, int start, int length) {
        StringBuffer sb = new StringBuffer(sql.trim());
        while(sb.lastIndexOf(";") == sb.length()-1){
            sb.deleteCharAt(sb.lastIndexOf(";"));
        }
        sb.append(" limit ").append(start).append(",").append(length).append(";");
        return sb.toString();
    }

    @Override
    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }

    @Override
    public void setProperties(Properties properties) {

    }
}
