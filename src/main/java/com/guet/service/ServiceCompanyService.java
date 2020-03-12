package com.guet.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guet.dao.EvaluateDao;
import com.guet.dao.ServiceCompanyDao;
import com.guet.entity.Evaluate;
import com.guet.entity.ServiceCompany;
import com.guet.entity.ServicePeople;



@Service("serviceCompanyService")
public class ServiceCompanyService{

	@Autowired
	private ServiceCompanyDao dao;
	@Autowired
	private EvaluateDao evaluateDao;
	
	
	//查停用 查启用 查待审核
	public List<ServiceCompany> findState(int state){
		return dao.findState(state);
	}
	
	//根据id查询
	public ServiceCompany findById(int id) {
		return dao.findById(id);		
	}
	//根据uId查询
	public ServiceCompany findByUid(int uId) {
		return dao.findByUid(uId);
	}
	
	//模糊查找
	public List<ServiceCompany> findDim(String str){
		return dao.findDim(str);
	}
	
	public List<ServiceCompany> findByType(String city,String server){
		return dao.findByType(city,server);
	}
	
	//删除
	public int delete(int id) {
		return dao.delete(id);
	}
	//更新
	public int update(ServiceCompany s) {
		return dao.update(s);
	}
	//更新状态
	public int updateState(int id, int state) {
		return dao.updateState(id, state);
	}
	
	public int updateGrade(int id,int sId,int uId,int dId ,int isCompany,int grade,String content) {
		Evaluate e = new Evaluate();
		e.setsId(sId);
		e.setuId(uId);
		e.setdId(dId);
		e.setIsCompany(isCompany);
		e.setContent(content);
		Date nowTime=new Date(); 
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		e.setCreateTime(nowTime);
		evaluateDao.insert(e);
		return dao.updateGrade(id, grade);
	}
		
	//插入一条
	public int insert(ServiceCompany s) {
		
		return dao.insert(s);
	}
	
	public int uploadImage(int id,String imageName) {
		return dao.uploadImage(id, imageName);
	}
	
}
