/**
 * @author SargerasWang
 */
package com.sargeraswang.csmframework.common.util;

import org.apache.log4j.Logger;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * The <code>TreeUtil</code>
 *
 * @author SargerasWang Created at 2014年8月22日 上午10:08:16
 */
public class TreeUtil {

    private static Logger LG = Logger.getLogger(TreeUtil.class);

    /**
     * 把数据库中查出来的扁平数据转换成树
     *
     * @param list         sql 数据集
     * @param selfKey      id
     * @param parentKey    pid
     * @param childrenName children
     * @return
     */
    @SuppressWarnings("unchecked")
    public static List<Map<String, Object>> generateTree(List<Object> list, String selfKey,
                                                         String parentKey, String childrenName, Boolean hasAttributes) {
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<Map<String, Object>> rootList = new ArrayList<>();

        //第一层
        Map<Object,Map<String,Object>> referenceMap = new HashMap<>();
        for (Object object : list) {
            Map<String, Object> map = (Map<String, Object>) object;
            Object pid = map.get(parentKey);
            if (pid == null || "0".equals(pid.toString())) {
                rootList.add(map);
                referenceMap.put(map.get(selfKey), map);
            }
        }
        list.removeAll(rootList);
        //递归出所有子节点
        recursion(parentKey,childrenName,referenceMap,list,selfKey);

        LG.info(JsonUtil.toJson(rootList));
        return rootList;
    }

    /**
     * @param parentKey
     * @param childrenName
     * @param referenceMap
     * @param list
     * @return
     */
    private static void recursion(String parentKey, String childrenName,
                                  Map<Object, Map<String, Object>> referenceMap,
                                  List<Object> list, String selfKey) {
        List<Object> executedObjectList = new ArrayList<>();
        for(Object object : list){
            Map<String, Object> map = (Map<String, Object>) object;
            Object pid = map.get(parentKey);
            Map<String, Object> parentMap = referenceMap.get(pid);
            if(parentMap != null){
                List<Map<String, Object>> children;
                if (parentMap.containsKey(childrenName)) {
                    children = (List<Map<String, Object>>) parentMap.get(childrenName);
                } else {
                    children = new ArrayList<>();
                    parentMap.put(childrenName, children);
                }
                children.add(map);
                referenceMap.put(map.get(selfKey),map);
                executedObjectList.add(map);
            }
        }
        list.removeAll(executedObjectList);
        if(list.size() > 0){
            recursion(parentKey, childrenName, referenceMap, list, selfKey);
        }
    }
}
