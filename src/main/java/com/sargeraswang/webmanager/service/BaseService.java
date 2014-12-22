package com.sargeraswang.webmanager.service;

import com.sargeraswang.webmanager.bean.BaseExecuteAjaxBean;
import com.sargeraswang.webmanager.bean.BaseExecuteParamater;
import com.sargeraswang.webmanager.bean.BaseQueryParamater;
import com.sargeraswang.webmanager.bean.BaseTableColumn;
import com.sargeraswang.webmanager.common.util.JsonUtil;
import com.sargeraswang.webmanager.common.util.StatusUtil;
import com.sargeraswang.webmanager.common.util.StringUtil;
import com.sargeraswang.webmanager.dao.BaseDao;
import org.apache.log4j.Logger;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.RuntimeConstants;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXWriter;
import org.dom4j.io.XMLWriter;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.*;
import java.nio.charset.Charset;
import java.util.*;
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

    public List<Object> queryForList(String index,Map<String,Object> paramater) {

        return baseDao.queryForList(index,paramater);
    }

    public List<Object> queryForList(BaseQueryParamater paramater) {

        return baseDao.queryForList(paramater);
    }

    public Integer queryCount(BaseQueryParamater paramater) {

        return baseDao.queryCount(paramater);
    }

    /**
     * 根据数据集和标题行,组成数据数组
     * @param statusColumn
     * @param datalist
     * @param columns
     * @return
     */
    public String[][] assembleTableData(String statusColumn, List datalist, String columns){
        //处理需要翻译字段
        List statList = JsonUtil.fromJson(statusColumn, List.class);
        //用来翻译的字典集合
        Map<String, Map<String, String>> dictMap = new HashMap<>();
        for (Object o : statList) {
            Map<String, String> map = (Map<String, String>) o;
            String c = map.get("column");
            String a = map.get("statusArr");
            Map<String, String> s = StatusUtil.getStatus(a);
            if (s == null) {
                LG.warn("导出数据时,在status.XML中找不到名为[" + a + "]的翻译字段");
                continue;
            }
            dictMap.put(c, s);//c字段用s翻译
        }
        if (dictMap.size() > 0) {
            for (Object od : datalist) {
                Map<String, Object> map = (Map<String, Object>) od;
                for (String key : dictMap.keySet()) {
                    String value = String.valueOf(map.get(key));
                    String realValue = dictMap.get(key).get(value);
                    map.put(key, realValue);
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
                if(map.get(key) != null) {
                    dataRow[j] = String.valueOf(map.get(key));
                }else{
                    dataRow[j] = StringUtil.EMPTY;
                }
            }
        }
        return dataArray;
    }

    public Integer execute(BaseExecuteParamater paramater){
        return baseDao.execute(paramater);
    }

    public List<String> getTables(){
        return baseDao.getTables();
    }

    /**
     * 生成代码
     * @param tables 表名集合
     * @param types 生成类型(JSP/XML)
     */
    public ByteArrayOutputStream generateCode(String[] tables,String[] types){
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ZipOutputStream zos = null;
        try {
             zos = new ZipOutputStream(baos, Charset.forName("UTF-8"));
            for(String table : tables){
                List<BaseTableColumn> columns = baseDao.getColumns(table);
                List<String> typeList = Arrays.asList(types);
                if(typeList.contains("XML")){
                    ZipEntry tEntry = new ZipEntry(table+"/"+table+".xml");
                    zos.putNextEntry(tEntry);
                    byte[] xml = createFile(table, columns, "template/GenerateCodeXml.vm");
                    zos.write(xml);
                    zos.closeEntry();
                }
                if(typeList.contains("JSP")){
                    ZipEntry tEntry = new ZipEntry(table+"/"+table+".jsp");
                    zos.putNextEntry(tEntry);
                    byte[] jsp = createFile(table, columns, "template/GenerateCodeJsp.vm");
                    zos.write(jsp);
                    zos.closeEntry();
                }
            }
        } catch (Exception e) {
            LG.error(e.toString(),e);
        } finally {
            try {
                zos.close();
            } catch (IOException e) {
                LG.error(e.toString(),e);
            }
        }
        return baos;
    }

    private byte[] createFile(String tableName,List<BaseTableColumn> columns,String vmPath){
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            VelocityEngine ve = new VelocityEngine();
            ve.setProperty(RuntimeConstants.RESOURCE_LOADER, "classpath");
            ve.setProperty("classpath.resource.loader.class", ClasspathResourceLoader.class.getName());
            ve.init();
            VelocityContext context = new VelocityContext();
            context.put("columns", columns);
            context.put("table", tableName);
            Template t = ve.getTemplate(vmPath,"UTF-8");
            OutputStreamWriter osw = new OutputStreamWriter(baos,"UTF-8");
            t.merge(context,osw);
            osw.close();
        } catch (Exception e) {
            LG.error(e.toString(),e);
        }
        return baos.toByteArray();
    }

}
