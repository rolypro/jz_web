package com.guet.util;

import java.util.HashMap;
import java.util.Map;

public class SearchMap {
	
	private Map<String,String> cityMap = new HashMap<String,String>();
	private Map<String,String> eduMap = new HashMap<String,String>();
	
	public SearchMap() {
		cityMap.put("1", "");
		cityMap.put("2", "北京");
		cityMap.put("3", "上海");
		cityMap.put("4", "广州");
		cityMap.put("5", "深圳");
		cityMap.put("6", "南宁");
		cityMap.put("7", "柳州");
		cityMap.put("8", "桂林");
	
		eduMap.put("1", "");
		eduMap.put("2", "小学");
		eduMap.put("3", "初中");
		eduMap.put("4", "高中");
		eduMap.put("5", "大学");
		eduMap.put("6", "研究生");
		
	}
	
	public String getValue(String type,String index) {
		if(type=="city") {
			return cityMap.get(index);
		}else {
			return eduMap.get(index);
		}
	}
	
	
	
	
}
