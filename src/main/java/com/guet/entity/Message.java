package com.guet.entity;

import java.util.Date;
import java.util.List;

public class Message {
	
	
	private int id;
	private int uId;
	private String name;
	private String content;	
	private Date createTime;
	
	private List<SubMessage> subMessage;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public List<SubMessage> getSubMessage() {
		return subMessage;
	}
	public void setSubMessage(List<SubMessage> subMessage) {
		this.subMessage = subMessage;
	}
	
	
	
}
