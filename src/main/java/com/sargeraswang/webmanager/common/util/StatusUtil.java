/**
 * @author SargerasWang
 */
package com.sargeraswang.webmanager.common.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

/**
 * The <code>StatusUtil</code>
 * 
 * @author SargerasWang Created at 2014年7月6日 下午2:32:11
 */
public final class StatusUtil {

    private static final transient Logger LOG = LoggerFactory.getLogger(StatusUtil.class);
    private static Map<String, Map<String, String>> statusMap;
    
    static { // 静态块，初始化资源，保证线程安全
    	try {
            Resource resource = new ClassPathResource("xml/status.xml");
            File file = resource.getFile();
            SAXReader reader = new SAXReader();
            Document document = reader.read(file);
            Element root = document.getRootElement();
            List<Element> statusList = castList(Element.class,root.elements("status"));
            statusMap = new HashMap<String, Map<String, String>>();
            for (Element status : statusList) {
                String id = status.attribute("id").getStringValue();
                List<Element> dataList = castList(Element.class,status.elements("data"));
                Map<String, String> dataMap = new HashMap<>();
                for (Element data : dataList) {
                    String key = data.attribute("key").getStringValue();
                    String value = data.getStringValue();
                    dataMap.put(key, value);
                }
                statusMap.put(id, dataMap);
            }

        } catch (IOException e) {
            LOG.error("读取status.xml失败!", e);
        } catch (DocumentException e) {
            LOG.error("读取status.xml失败!", e);
        }
    }

    /**绑定在status.xml中设计好的key-value
     * @author SargerasWang
     * Created at 2014年7月6日 下午3:03:46
     * @param dataList sql结果集
     * @param colName 结果集中的哪一列
     * @param id 使用status.xml中的哪个id
     */
    public static void mappingStatus(List<Map<String, Object>> dataList, String colName, String id) {

        if (CollectionUtils.isEmpty(dataList)) {
            LOG.warn("dataList 为空");
            return;
        }
        if(statusMap.containsKey(id) == false){
            LOG.warn("status.xml 不存在id=["+id+"]的数据");
            return;
        }
        Map<String, String> status = statusMap.get(id);
        for(Map<String,Object> dataMap : dataList){
            Object o = dataMap.get(colName);
            if(o!=null){
                String value = status.get(o.toString());
                dataMap.put(colName, value);
                dataMap.put("_"+colName, o.toString());
            }
        }
    }
    
    public static <T> List<T> castList(Class<? extends T> clazz, Collection<?> c) {
        List<T> r = new ArrayList<T>(c.size());
        for(Object o: c)
          r.add(clazz.cast(o));
        return r;
    }
}
