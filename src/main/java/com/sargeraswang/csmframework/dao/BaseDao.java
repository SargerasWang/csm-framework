package com.sargeraswang.csmframework.dao;

import com.sargeraswang.csmframework.bean.BaseExecuteParamater;
import com.sargeraswang.csmframework.bean.BaseParamater;
import com.sargeraswang.csmframework.bean.BaseQueryParamater;
import com.sargeraswang.csmframework.bean.BaseTableColumn;
import com.sargeraswang.csmframework.common.Constants;
import com.sargeraswang.csmframework.common.util.JsonUtil;
import com.sargeraswang.csmframework.common.util.StringUtil;
import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.scripting.defaults.DefaultParameterHandler;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by SagerasWang on 14/11/24.
 */
@Service
public class BaseDao {

    private static final Logger LG = Logger.getLogger(BaseDao.class);

    @Autowired
    SqlSessionFactory sqlSessionFactory;

    /**
     * 查询结果集
     *
     * @param index     index
     * @param paramater 查询条件
     * @return
     */
    public List<Object> queryForList(String index, Map<String, Object> paramater) {
        SqlSession session = sqlSessionFactory.openSession();
        try {
            List<Object> list = session.selectList(index, paramater);
            if (LG.isInfoEnabled()) {
                String sql = session.getConfiguration().getMappedStatement(index).getBoundSql(paramater).getSql();
                LG.info("[" + index + "]" + "[SQL]" + StringUtil.smartTrim(sql));
                LG.info("[" + index + "]" + "[PARAMATER]" + JsonUtil.toJson(paramater));
            }
            return list;
        } finally {
            session.close();
        }
    }

    /**
     * 查询结果集
     *
     * @param paramater
     * @return
     */
    public List<Object> queryForList(BaseQueryParamater paramater) {
        SqlSession session = sqlSessionFactory.openSession();

        try {
            List<Object> list = session.selectList(paramater.getIndex(), paramater);

            if (LG.isInfoEnabled()) {
                logInfo(paramater, session);
            }
            return list;
        } finally {
            session.close();
        }
    }

    private void logInfo(BaseParamater paramater, SqlSession session) {
        String index = paramater.getIndex();
        String sql = session.getConfiguration().getMappedStatement(paramater.getIndex()).getBoundSql(paramater).getSql();
        LG.info("[" + index + "]" + "[SQL]" + StringUtil.smartTrim(sql));
        LG.info("[" + index + "]" + "[PARAMATER]" + paramater);
    }

    /**
     * 查询总数
     *
     * @param paramater
     * @return
     */
    public Integer queryCount(BaseQueryParamater paramater) {
        SqlSession session = sqlSessionFactory.openSession();
        try {
            String sql = session.getConfiguration().getMappedStatement(paramater.getIndex()).getBoundSql(paramater).getSql();
            String countSql = generateCountSql(sql);
            try {
                MappedStatement mappedStatement = session.getConfiguration().getMappedStatement(paramater.getIndex());
                PreparedStatement stat = session.getConnection().prepareStatement(countSql);
                BoundSql countBoundSql = new BoundSql(mappedStatement.getConfiguration(), countSql,
                        mappedStatement.getBoundSql(paramater).getParameterMappings(), paramater);
                ParameterHandler ph = new DefaultParameterHandler(mappedStatement, paramater, countBoundSql);
                ph.setParameters(stat);
                ResultSet rs = stat.executeQuery();
                if (rs.next()) {
                    int count = rs.getInt(1);
                    return count;
                }
            } catch (SQLException e) {
                LG.error(e.toString(), e);
            }
            return 0;
        } finally {
            session.close();
        }
    }

    /**
     * 生成差总数sql
     *
     * @param sql
     * @return
     */
    private static String generateCountSql(String sql) {
        int i = sql.toUpperCase().indexOf("FROM");
        StringBuffer sb = new StringBuffer();
        sb.append("select count(0) ");
        sb.append(sql.substring(i));
        if (LG.isInfoEnabled()) {
            LG.info("[GetCountSql]" + StringUtil.smartTrim(sb.toString()));
        }
        return sb.toString();
    }

    /**
     * 执行更新
     *
     * @param paramater
     * @return
     */
    public Integer execute(BaseExecuteParamater paramater) {
        SqlSession session = sqlSessionFactory.openSession();
        try {
            if (LG.isInfoEnabled()) {
                logInfo(paramater, session);
            }
            return session.update(paramater.getIndex(), paramater);
        } finally {
            session.close();
        }
    }

    /**
     * 获得所有表名
     *
     * @return
     */
    public List<String> getTables() {
        List<String> tables = new ArrayList<>();
        SqlSession session = sqlSessionFactory.openSession();
        try {
            DatabaseMetaData metaData = session.getConnection().getMetaData();
            ResultSet rs = metaData.getTables(null, null, "%", null);
            while (rs.next()) {
                tables.add(rs.getString(3));
            }
        } catch (SQLException e) {
            LG.error(e.toString(), e);
        } finally {
            session.close();
        }
        return tables;
    }

    /**
     * 获得表的列信息
     *
     * @param table
     * @return
     */
    public List<BaseTableColumn> getColumns(String table) {
        List<BaseTableColumn> list = new ArrayList<>();
        SqlSession session = sqlSessionFactory.openSession();
        try {
            DatabaseMetaData md = session.getConnection().getMetaData();
            ResultSet primaryKeys = md.getPrimaryKeys(null, null, table);
            List<String> primary = new ArrayList<>();
            while (primaryKeys.next()) {
                primary.add(primaryKeys.getString(4));
            }

            ResultSet columns = md.getColumns(null, null, table, "%");

            while (columns.next()) {
                BaseTableColumn col = new BaseTableColumn();
                //http://docs.oracle.com/javase/7/docs/api/java/sql/DatabaseMetaData.html
                col.setColumnName(columns.getString(4));//column name
                col.setType(columns.getInt(5));//java.sql.Types
                col.setSize(columns.getInt(7));//size
                col.setDecimalDigits(columns.getInt(9));//decimal_digits
                col.setNullable(columns.getInt(11));//nullable
                col.setRemarks(columns.getString(12));//remarks
                col.setLength(columns.getInt(16));//length
                col.setSeq(columns.getInt(17));//seq
                col.setAutoIncrement(columns.getString(23));//auto_increment
                if (primary.contains(col.getColumnName())) {
                    col.setPrimaryKey(true);
                }
                list.add(col);
            }
        } catch (SQLException e) {
            LG.error(e.toString(), e);
        } finally {
            session.close();
        }
        return list;
    }
}
