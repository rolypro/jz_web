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



@Service("evaluateService")
public class EvaluateService{

	
	@Autowired
	private EvaluateDao evaluateDao;
	
	public List<Evaluate> findSomeEvaluate(int sId,int isCompany){
		if(isCompany == 0) {
			return evaluateDao.findPeopleById(sId);
		}else {
			return evaluateDao.findCompanyById(sId);
		}
	}
	
}
