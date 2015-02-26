/**
 * @author SargerasWang
 */
package com.sargeraswang.csmframework.common.util;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * The <code>StatusUtil</code>
 *
 * @author SargerasWang Created at 2014年7月6日 下午2:32:11
 */
public final class StatusUtil {

    private static final transient Logger LOG = LoggerFactory.getLogger(StatusUtil.class);
    private static Map<String, Map<String, String>> statusMap;
    private static Map<String, List<String[]>> statusListMap;

    static { // 静态块，初始化资源，保证线程安全
        try {
            Resource resource = new ClassPathResource("xml/status.xml");
            File file = resource.getFile();
            SAXReader reader = new SAXReader();
            Document document = reader.read(file);
            Element root = document.getRootElement();
            List<Element> statusList = castList(Element.class, root.elements("status"));
            statusMap = new HashMap<>();
            statusListMap = new HashMap<>();
            for (Element status : statusList) {
                String id = status.attribute("id").getStringValue();
                List<Element> dataList = castList(Element.class, status.elements("data"));
                Map<String, String> dataMap = new HashMap<>();
                List<String[]> arrList = new ArrayList<>();
                for (Element data : dataList) {
                    String key = data.attribute("key").getStringValue();
                    String value = data.getStringValue();
                    dataMap.put(key, value);

                    String[] strArr = new String[2];
                    strArr[0] = key;
                    strArr[1] = value;
                    arrList.add(strArr);
                }
                statusMap.put(id, dataMap);
                statusListMap.put(id,arrList);
            }
            LOG.info("读取status.xml完成");
        } catch (IOException e) {
            LOG.error("读取status.xml失败!", e);
        } catch (DocumentException e) {
            LOG.error("读取status.xml失败!", e);
        }
    }

    /**
     * 获取状态集合
     * @param id       使用status.xml中的哪个id
     * @author SargerasWang
     * Created at 2014年7月6日 下午3:03:46
     */
    public static Map<String, String> getStatus(String id) {
        if(statusMap.containsKey(id) ==  false){
            return null;
        }
        Map<String, String> status = statusMap.get(id);
        return status;
    }

    public static List<String[]> getStatusArr(String id) {
        if(statusListMap.containsKey(id) ==  false){
            return null;
        }
        List<String[]>status = statusListMap.get(id);
        return status;
    }

    /**
     * 获取所有字典键和值
     * @return
     */
    public static Map<String, Map<String, String>> getAllStatusMap(){
        return statusMap;
    }

    private static <T> List<T> castList(Class<? extends T> clazz, Collection<?> c) {
        List<T> r = new ArrayList<>(c.size());
        for (Object o : c)
            r.add(clazz.cast(o));
        return r;
    }
}
