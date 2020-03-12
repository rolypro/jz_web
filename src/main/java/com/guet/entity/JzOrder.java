package com.guet.entity;

import java.util.Date;

public class JzOrder {
	
	private int id;
	private String oId;
	private int xiadanId;
	private int jiedanId;
	private int serverId;   //服务商ID
	private int isCompany;
	private String serverType;
	private Date startTime;
	private Date endTime;
	private Date createTime;
	private int gold;
	private int state; //0下单，1接单，2已支付，3拒绝，4退款 5 已退款 6 已完成 7 已评价
	
	private Account xAccount; //下单人
	private Account jAccount; //接单人
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getoId() {
		return oId;
	}
	public void setoId(String oId) {
		this.oId = oId;
	}
	public int getXiadanId() {
		return xiadanId;
	}
	public void setXiadanId(int xiadanId) {
		this.xiadanId = xiadanId;
	}
	public int getJiedanId() {
		return jiedanId;
	}
	public void setJiedanId(int jiedanId) {
		this.jiedanId = jiedanId;
	}
	
	public int getIsCompany() {
		return isCompany;
	}
	public void setIsCompany(int isCompany) {
		this.isCompany = isCompany;
	}
	public String getServerType() {
		return serverType;
	}
	public void setServerType(String serverType) {
		this.serverType = serverType;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public int getGold() {
		return gold;
	}
	public void setGold(int gold) {
		this.gold = gold;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Account getxAccount() {
		return xAccount;
	}
	public void setxAccount(Account xAccount) {
		this.xAccount = xAccount;
	}
	public Account getjAccount() {
		return jAccount;
	}
	public void setjAccount(Account jAccount) {
		this.jAccount = jAccount;
	}
	public int getServerId() {
		return serverId;
	}
	public void setServerId(int serverId) {
		this.serverId = serverId;
	}
	
	
}
