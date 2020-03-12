package com.guet.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.guet.entity.JzOrder;
import com.guet.entity.ServiceCompany;

public interface JzOrderDao {
	
	//查已经完成订单，未完成订单
	public List<JzOrder> findState(@Param("state")int state);
	//查客户已经完成订单，未完成订单
	public List<JzOrder> findCState(@Param("state")int state,@Param("id")int id);
	//查服务商已经完成订单，未完成订单
	public List<JzOrder> findSState(@Param("state")int state,@Param("id")int id);
	//查所有
	public List<JzOrder> findAll();
	//查询有无重复时间的订单
	public List<JzOrder> findOrderTime(JzOrder jo);
	//查询一周的成交订单
	public List<JzOrder> findOrderWeek();
	
	public List<JzOrder> findServerOrder(@Param("id")int id,@Param("isCompany")int isCompany);
	
	//根据id查询
	public JzOrder findById(int id);
	//删除
	public int delete(int id);
	//更新
	public int update(JzOrder jo);
	//更新state
	public int updateState(int id ,int state);	
	//插入一条
	public int insert(JzOrder jo);
	
	
	
	
	//给工号集合返回id  声明gonghao直接用
	//public int findByEmployee_id(@Param("gonghao")String gonghao);
	
	
	
}
