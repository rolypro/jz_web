package com.guet.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.guet.entity.ServicePeople;

public interface ServicePeopleDao {
	
	//查停用 查启用 查待审核
	public List<ServicePeople> findState(@Param("state")int state);
	
	//根据id查询
	public ServicePeople findById(@Param("id")int id);
	//根据uId查询
	public ServicePeople findByUid(@Param("uId")int uId);
	
	//模糊查找
	public List<ServicePeople> findDim(@Param("str")String str);
	
	//更加服城市务学历查询
	public List<ServicePeople> findByType(@Param("city")String city,@Param("server")String server,@Param("edu")String edu);
	
	//删除
	public int delete(int id);
	//更新
	public int update(ServicePeople s);
	//修改得分
	public int updateGrade(@Param("id")int id,@Param("grade")int grade);
	//更新状态
	public int updateState(int id, int state);
	//插入一条
	public int insert(ServicePeople s);
	
	public int uploadImage(int id,String imageName);
	
	
	
	
	//给工号集合返回id  声明gonghao直接用
	//public int findByEmployee_id(@Param("gonghao")String gonghao);
	
	
	
}
