package com.sargeraswang.csmframework.service;

import com.sargeraswang.csmframework.bean.BaseExecuteParamater;
import com.sargeraswang.csmframework.bean.BaseGenerateCodeCfg;
import com.sargeraswang.csmframework.bean.BaseQueryParamater;
import com.sargeraswang.csmframework.bean.BaseTableColumn;
import com.sargeraswang.csmframework.common.util.JsonUtil;
import com.sargeraswang.csmframework.common.util.StatusUtil;
import com.sargeraswang.csmframework.common.util.StringUtil;
import com.sargeraswang.csmframework.dao.BaseDao;
import org.apache.log4j.Logger;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.RuntimeConstants;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * Created by SagerasWang on 14/11/24.
 */
@Service
public class BaseService {

    @Resource
    BaseDao baseDao;

    public static final Logger LG = Logger.getLogger(BaseService.class);

    public List<Object> queryForList(String index, Map<String, Object> paramater) {

        return baseDao.queryForList(index, paramater);
    }

    public List<Object> queryForList(BaseQueryParamater paramater) {

        return baseDao.queryForList(paramater);
    }

    public Integer queryCount(BaseQueryParamater paramater) {

        return baseDao.queryCount(paramater);
    }

    /**
     * 根据数据集和标题行,组成数据数组
     *
     * @param statusColumn 状态列
     * @param datalist     数据集
     * @param columns      列集合
     * @return 数据数组
     */
    public String[][] assembleTableData(String statusColumn, List datalist, String columns) {
        //处理需要翻译字段
        List statList = JsonUtil.fromJson(statusColumn, List.class);
        for (Object o : statList) {
            Map<String, String> map = (Map<String, String>) o;
            String column = map.get("column");
            String statusArr = map.get("statusArr");
            String statusType = map.get("statusType");

            Map<String, String> statusMap = StatusUtil.getStatus(statusArr);
            if (statusMap == null) {
                LG.warn("导出数据时,在status.XML中找不到名为[" + statusArr + "]的翻译字段");
                continue;
            }

            for (Object od : datalist) {
                Map<String, Object> dataMap = (Map<String, Object>) od;
                if (dataMap.get(column) != null) {
                    String value = String.valueOf(dataMap.get(column));
                    if ("2".equals(statusType)) {
                        //多选
                        StringBuffer realValue = new StringBuffer();
                        String[] values = value.split(",");
                        for (int i = 0; i < values.length; i++) {
                            if (i != 0) {
                                realValue.append(",");
                            }
                            realValue.append(statusMap.get(values[i]));
                        }
                        dataMap.put(column, realValue);
                    } else {
                        dataMap.put(column, statusMap.get(value));
                    }
                }
            }
        }
        //翻译结束

        //将标题+数据处理成二维数组
        List colList = JsonUtil.fromJson(columns, List.class);
        String[][] dataArray = new String[datalist.size() + 1][colList.size()];
        String[] titleRow = dataArray[0];
        for (int i = 0; i < colList.size(); i++) {
            Object ot = colList.get(i);
            Map<String, Object> map = (Map<String, Object>) ot;
            titleRow[i] = String.valueOf(map.get("title"));
        }
        for (int i = 0; i < datalist.size(); i++) {
            Object od = datalist.get(i);
            Map<String, Object> map = (Map<String, Object>) od;
            String[] dataRow = dataArray[i + 1];
            for (int j = 0; j < colList.size(); j++) {
                Object key = ((Map<String, Object>) colList.get(j)).get("data");
                if (map.get(key) != null) {
                    dataRow[j] = String.valueOf(map.get(key));
                } else {
                    dataRow[j] = StringUtil.EMPTY;
                }
            }
        }
        return dataArray;
    }

    public Integer execute(BaseExecuteParamater paramater) {
        return baseDao.execute(paramater);
    }

    public List<String> getTables() {
        return baseDao.getTables();
    }

    public List<BaseTableColumn> getColumns(String table) {
        return baseDao.getColumns(table);
    }

    /**
     * 生成代码
     *
     * @param types   生成类型(JSP/XML)
     * @param cfgList 自定义配置
     */
    public ByteArrayOutputStream generateCode(String[] types, List<BaseGenerateCodeCfg> cfgList) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ZipOutputStream zos = null;
        try {
            zos = new ZipOutputStream(baos, Charset.forName("UTF-8"));
            for (BaseGenerateCodeCfg tableCfg : cfgList) {
                String table = tableCfg.getTableName();
                List<BaseTableColumn> columns = baseDao.getColumns(table);
                tableCfg.setFinalColumnCfgList(columns);
                List<Map<String, String>> columnCfgList = tableCfg.getColumnCfgList();
                if (columnCfgList != null) {
                    //用户在页面的设置要覆盖读出来的设置
                    for (BaseTableColumn btc : columns) {
                        String columnName = btc.getColumnName();
                        for (Map<String, String> detail : columnCfgList) {
                            if (columnName.equals(detail.get("column"))) {
                                if (detail.containsKey("remarks")) {
                                    btc.setRemarks(detail.get("remarks"));
                                }
                                if (detail.containsKey("statusKey")) {
                                    String key = detail.get("statusKey");
                                    btc.setStatusKey(key);
                                    btc.setStatusList(StatusUtil.getStatusArr(key));
                                    btc.setStatusType(Integer.valueOf(detail.get("statusType")));
                                }
                            }
                        }
                    }
                }
                List<String> typeList = Arrays.asList(types);
                if (typeList.contains("XML")) {
                    ZipEntry tEntry = new ZipEntry(table + "/" + table + ".xml");
                    zos.putNextEntry(tEntry);
                    byte[] xml = createFile(tableCfg, "template/GenerateCodeXml.vm");
                    zos.write(xml);
                    zos.closeEntry();
                }
                if (typeList.contains("JSP")) {
                    ZipEntry tEntry = new ZipEntry(table + "/" + table + ".jsp");
                    zos.putNextEntry(tEntry);
                    byte[] jsp = createFile(tableCfg, "template/GenerateCodeJsp.vm");
                    zos.write(jsp);
                    zos.closeEntry();
                }
            }
        } catch (Exception e) {
            LG.error(e.toString(), e);
        } finally {
            try {
                zos.close();
            } catch (IOException e) {
                LG.error(e.toString(), e);
            }
        }
        return baos;
    }

    private byte[] createFile(BaseGenerateCodeCfg tableCfg, String vmPath) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            VelocityEngine ve = new VelocityEngine();
            ve.setProperty(RuntimeConstants.RESOURCE_LOADER, "classpath");
            ve.setProperty("classpath.resource.loader.class", ClasspathResourceLoader.class.getName());
            ve.init();
            VelocityContext context = new VelocityContext();
            context.put("columns", tableCfg.getFinalColumnCfgList());
            context.put("align", tableCfg.getAlign());
            context.put("table", tableCfg.getTableName());
            Template t = ve.getTemplate(vmPath, "UTF-8");
            OutputStreamWriter osw = new OutputStreamWriter(baos, "UTF-8");
            t.merge(context, osw);
            osw.close();
        } catch (Exception e) {
            LG.error(e.toString(), e);
        }
        return baos.toByteArray();
    }

    public Map<String, List<String>> getAllSqlIndex() {
        return baseDao.getAllSqlIndex();
    }

}
