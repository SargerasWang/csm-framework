/**
 * 
 */
package com.sargeraswang.webmanager.common.util;

import java.util.ArrayList;
import java.util.List;

/**
 * 列表 数组相关工具
 */
public class ListUtil {
	
	/**
	 * 将字符串数组转成  整型 List
	 * @param strNums
	 * @return
	 */
	public static List<Long> parseLongArray(String... strNums){
		List<Long> result = new ArrayList<Long>(strNums.length);
		for (String strNum : strNums) {
			result.add(Long.valueOf(strNum));
		}
		return result;
	}
	
	/**
	 * 将字符串数组转成  List
	 * @param strNums
	 * @return
	 */
	public static List<Object> parseStringArray(String... strNums){
		List<Object> result = new ArrayList<Object>(strNums.length);
		for (String strNum : strNums) {
			result.add(strNum);
		}
		return result;
	}
	
	/**
	 * 将字符串数组转成  整型 List
	 * @param strNums
	 * @return
	 */
	public static List<Long> parseLongArray(Long... longNums){
		List<Long> result = new ArrayList<Long>(longNums.length);
		for (Long longNum : longNums) {
			result.add(Long.valueOf(longNum));
		}
		return result;
	}
	
	/**
	 * 将字符串数组转成  整型 List
	 * @param strNums
	 * @return
	 */
	public static List<Integer> parseIntegerArray(String... strNums){
		List<Integer> result = new ArrayList<Integer>(strNums.length);
		for (String strNum : strNums) {
			result.add(Integer.valueOf(String.valueOf(strNum)));
		}
		return result;
	}
	
	/**
	 * 将字符串数组转成  整型 List
	 * @param strNums
	 * @return
	 */
	public static List<Integer> parseIntegerArray(Integer... integerNums){
		List<Integer> result = new ArrayList<Integer>(integerNums.length);
		for (Integer integerNum : integerNums) {
			result.add(integerNum);
		}
		return result;
	}

}
