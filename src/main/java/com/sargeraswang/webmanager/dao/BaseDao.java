package com.sargeraswang.webmanager.dao;

import com.sargeraswang.webmanager.bean.BaseExecuteParamater;
import com.sargeraswang.webmanager.bean.BaseQueryParamater;
import com.sargeraswang.webmanager.common.Constants;
import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.scripting.defaults.DefaultParameterHandler;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by SagerasWang on 14/11/24.
 */
@Service
public class BaseDao {

    private static final Logger LG = Logger.getLogger(BaseDao.class);

    @Autowired
    SqlSessionFactory baseSqlSessionFactory;

    /**查询结果集
     * @param paramater
     * @return
     */
    public List<Object> queryForList(BaseQueryParamater paramater) {
        SqlSession session = baseSqlSessionFactory.openSession();
        Object oLength = paramater.get(Constants.BASEPARAMATER_LENGTH);
        List<Object> list;
        if (oLength != null && !oLength.equals("-1")) {
            Integer start = Integer.valueOf((String) paramater.get(Constants.BASEPARAMATER_START));
            Integer length = Integer.valueOf(oLength.toString());
            RowBounds rb = new RowBounds(start, length);
            list = session.selectList(paramater.getIndex(), paramater, rb);
        } else {
            list = session.selectList(paramater.getIndex(), paramater);
        }
        if(LG.isInfoEnabled()){
            LG.info("SQL:"+session.getConfiguration().getMappedStatement(paramater.getIndex()).getBoundSql(paramater).getSql().replaceAll("\n",""));
            LG.info("PARAMATER:"+paramater);
        }
        return list;
    }

    /**查询总数
     * @param paramater
     * @return
     */
    public Integer queryCount(BaseQueryParamater paramater) {
        SqlSession session = baseSqlSessionFactory.openSession();
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
            if(LG.isInfoEnabled()){
                LG.info("SQL:"+countBoundSql.getSql().replaceAll("\n", ""));
                LG.info("PARAMATER:"+paramater);
            }
            if (rs.next()) {
                int count = rs.getInt(1);
                return count;
            }
        } catch (SQLException e) {
            LG.error(e.toString(), e);
        }
        return 0;
    }

    /**生成差总数sql
     * @param sql
     * @return
     */
    private static String generateCountSql(String sql) {
        StringBuffer sb = new StringBuffer();
        sb.append("select count(0) from (");
        sb.append(sql);
        sb.append(") t");

        return sb.toString();
    }

    /**执行更新
     * @param paramater
     * @return
     */
    public Integer execute(BaseExecuteParamater paramater){
        SqlSession session = baseSqlSessionFactory.openSession();
        if(LG.isInfoEnabled()){
            LG.info("SQL:"+session.getConfiguration().getMappedStatement(paramater.getIndex()).getBoundSql(paramater).getSql().replaceAll("\n",""));
            LG.info("PARAMATER:"+paramater);
        }
        return session.update(paramater.getIndex(),paramater);
    }

}
