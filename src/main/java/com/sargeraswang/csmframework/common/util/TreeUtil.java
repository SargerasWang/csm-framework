/**
 * @author SargerasWang
 */
package com.sargeraswang.csmframework.common.util;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.util.CollectionUtils;

import java.util.*;

/**
 * The <code>TreeUtil</code>
 * 
 * @author SargerasWang Created at 2014年8月22日 上午10:08:16
 */
public class TreeUtil {

    private static Logger LG = Logger.getLogger(TreeUtil.class);

    public static List<Map<String, Object>> generateTree(List<Object> list) {
        return generateTree(list, "id", "pid", "children",false);
    }
    public static List<Map<String, Object>> generateTree(List<Object> list,Boolean hasAttributes) {
      return generateTree(list, "id", "pid", "children",hasAttributes);
    }

    /**
     * 把数据库中查出来的扁平数据转换成树
     * 
     * @author SargerasWang Created at 2014年8月22日 上午10:29:15
     * @param list sql 数据集
     * @param selfKey id
     * @param parentKey pid
     * @param childrenName children
     * @return
     */
    @SuppressWarnings("unchecked")
    public static List<Map<String, Object>> generateTree(List<Object> list, String selfKey,
            String parentKey, String childrenName,Boolean hasAttributes) {
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<Map<String, Object>> rootList = new ArrayList<>();
        if(list.size() == 1){
            Map<String,Object>  root = new HashMap<>();
            root.putAll((Map)list.get(0));
            rootList.add(root);
        }else {
            Map<String, Map<String, Object>> dataMap = new HashMap<>();
            // 遍历所有pid到set中
            Set<String> pidSet = new HashSet<>();
            for (Object object : list) {
                Map<String, Object> map = (Map<String, Object>) object;
                String pid = String.valueOf(map.get(parentKey));
                pidSet.add(pid);
                if (hasAttributes) {
                    Map<String, Object> attr = new HashMap<String, Object>();
                    attr.putAll(map);
                    map.put("attributes", attr);
                }
                dataMap.put(String.valueOf(map.get(selfKey)), map);
            }
            // 从叶子节点向上遍历
            Map<String, Map<String, Object>> parentMap = new HashMap<String, Map<String, Object>>();
            for (Object object : list) {
                Map<String, Object> map = (Map<String, Object>) object;
                String id = String.valueOf(map.get(selfKey));
                if (pidSet.contains(id) == false) {
                    // 叶子节点
                    bindParent(parentKey, childrenName, dataMap, parentMap, map, selfKey);
                }
            }

            recursion(parentKey, childrenName, dataMap, parentMap, rootList, selfKey);
        }
        LG.info(JsonUtil.toJson(rootList));
        return rootList;
    }

    /**
     * @author SargerasWang Created at 2014年8月22日 下午2:20:33
     * @param parentKey
     * @param childrenName
     * @param dataMap
     * @param parentMap
     * @param rootList
     * @return
     */
    private static void recursion( String parentKey, String childrenName,
            Map<String, Map<String, Object>> dataMap, Map<String, Map<String, Object>> parentMap,
            List<Map<String, Object>> rootList,String selfKey) {
        Map<String, Map<String, Object>> tempMap = new HashMap<String, Map<String, Object>>();
        for (String key : parentMap.keySet()) {
            Map<String, Object> map = dataMap.get(key);
            Object parent = map.get(parentKey);
            rootList.add(map);
            if (parent != null && StringUtils.isNotBlank(parent.toString())) {
                bindParent(parentKey, childrenName, dataMap, tempMap, map,selfKey);
            }
        }
        if (tempMap.size() > 0) {
            rootList.clear();
            parentMap = tempMap;
            recursion( parentKey, childrenName, dataMap, parentMap,rootList,selfKey);
        }
    }

    /**
     * @author SargerasWang Created at 2014年8月22日 下午2:16:19
     * @param parentKey
     * @param childrenName
     * @param dataMap
     * @param parentMap
     * @param map
     */
    @SuppressWarnings("unchecked")
    private static void bindParent(String parentKey, String childrenName,
            Map<String, Map<String, Object>> dataMap, Map<String, Map<String, Object>> parentMap,
            Map<String, Object> map,String selfKey) {
        Map<String, Object> parent;
        String pid = String.valueOf(map.get(parentKey));
        if (parentMap.containsKey(pid)) {
            parent = parentMap.get(pid);
        } else {
            parent = dataMap.get(pid);
            if (parent == null) {
                // 孤儿节点,丢弃
                return;
            }
            parentMap.put(pid, parent);
        }
        List<Map<String, Object>> children;
        if (parent.containsKey(childrenName)) {
            children = (List<Map<String, Object>>) parent.get(childrenName);
        } else {
            children = new ArrayList<>();
            parent.put(childrenName, children);
        }
        boolean had = false;
        for(Map<String,Object> c : children){
            if(c.get(selfKey).equals(map.get(selfKey))){
                had = true;
                break;
            }
        }
        if(!had) {
            children.add(map);
        }
    }
}
