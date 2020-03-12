package com.guet.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.guet.entity.ServiceCompany;
import com.guet.entity.ServicePeople;

public interface ServiceCompanyDao {
	
	//查停用 查启用 查待审核
	public List<ServiceCompany> findState(@Param("state")int state);
	
	//根据id查询
	public ServiceCompany findById(int id);
	//根据uId查询
	public ServiceCompany findByUid(int uId);
	
	//模糊查找
	public List<ServiceCompany> findDim(@Param("str")String str);
	
	public List<ServiceCompany> findByType(@Param("city")String city,@Param("server")String server);

	//删除
	public int delete(int id);
	//更新
	public int update(ServiceCompany s);
	//更新状态
	public int updateState(int id, int state);
	//修改得分
	public int updateGrade(@Param("id")int id,@Param("grade")int grade);
	
	//插入一条
	public int insert(ServiceCompany s);
	
	public int uploadImage(int id,String imageName);
	
	
	
	//给工号集合返回id  声明gonghao直接用
	//public int findByEmployee_id(@Param("gonghao")String gonghao);
	
	
	
}
