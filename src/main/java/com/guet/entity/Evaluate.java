package com.guet.entity;

import java.util.Date;

public class Evaluate {
	private int id;
	private int uId;
	private int sId;
	private int dId;
	private int isCompany;
	private Date createTime;
	private String content;
	
	private Account acc;
	private ServicePeople servicePeople;
	private ServiceCompany serviceCompany;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
	public int getIsCompany() {
		return isCompany;
	}
	public void setIsCompany(int isCompany) {
		this.isCompany = isCompany;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public ServicePeople getServicePeople() {
		return servicePeople;
	}
	public void setServicePeople(ServicePeople servicePeople) {
		this.servicePeople = servicePeople;
	}
	public ServiceCompany getServiceCompany() {
		return serviceCompany;
	}
	public void setServiceCompany(ServiceCompany serviceCompany) {
		this.serviceCompany = serviceCompany;
	}
	public int getdId() {
		return dId;
	}
	public void setdId(int dId) {
		this.dId = dId;
	}
	public Account getAcc() {
		return acc;
	}
	public void setAcc(Account acc) {
		this.acc = acc;
	}
	
	
	
}
