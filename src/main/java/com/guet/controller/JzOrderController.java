package com.guet.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guet.entity.Account;
import com.guet.entity.JzOrder;
import com.guet.service.JzOrderService;
import com.guet.service.ServiceCompanyService;
import com.guet.service.ServicePeopleService;

@Controller
//@SessionAttributes("rolemap")
@RequestMapping("/jzOrder.do")
public class JzOrderController {
	
	@Autowired
	private JzOrderService jzOrderService;
	@Autowired
	private ServicePeopleService servicePeopleService;
	@Autowired
	private ServiceCompanyService serviceCompanyService;
	
	@InitBinder  
	public void initBinder(WebDataBinder binder) {  
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	    dateFormat.setLenient(false);  
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));  
	}
	
	@RequestMapping
	public String findState(ModelMap mm,HttpSession session,@RequestParam(required=false,defaultValue="2")int state){
		//state<3表示查未完成   state=6表示查已完成的
		//0下单，1接单，2已支付，3拒绝，4退款 5 已退款 6 已完成 7 已评价
		List<JzOrder> jos = jzOrderService.findState(state);
		
		mm.put("jos", jos);
		if(state == 6) {
			return "jsp/jzOrder/jzOrderComplete";
		}
		return "jsp/jzOrder/jzOrderNotComplete";
		
	}
	
	@RequestMapping(params="method=findMyState")
	public String findMyState(ModelMap mm,HttpSession session,@RequestParam(required=false,defaultValue="2")int state,int isServer){
		//state<3表示查未完成   state=6表示查已完成的
		//0下单，1接单，2已支付，3拒绝，4退款 5 已退款 6 已完成 7 已评价
		Account acc = (Account) session.getAttribute("user");
		
		List<JzOrder> jos = jzOrderService.findMyState(state, acc.getId(), isServer) ;
		
		mm.put("jos", jos);
		if(state == 6) {
			return "jsp/custom/jzOrderComplete";
		}else if(isServer == 1) {
			return "jsp/custom/serverJzOrderNotComplete";
		}
		return "jsp/custom/jzOrderNotComplete";
		
	}
	
	@RequestMapping(params="method=findById")
	public String findById(ModelMap mm,HttpSession session,int id){
		
		JzOrder jo =  jzOrderService.findById(id);
		mm.put("jo", jo);
		//String serverType = s.getServerType();
		//Gson gson = new Gson();		
		//List<ServerType> sts = gson.fromJson(serverType, new TypeToken<List<ServerType>>() {}.getType());
		//mm.put("sts", sts);
		
		return "jsp/servicePeople/checkView";
		
	}
	
	/*@RequestMapping(params="method=insertView")
	public String insertView(ModelMap mm,HttpSession session){		
		
		return "jsp/news/insertView";
		
	}*/
	/*
	 * id : id,  //服务商ID
            	isCompany : isCompany,
            	startTime : startTime,
            	endTime : endTime,
            	serverType : serverType
	 * */
	@RequestMapping(params="method=insert")
	public @ResponseBody String insert(ModelMap mm,HttpSession session ,JzOrder jo){		
		//获取下单人信息
		Account acc = (Account) session.getAttribute("user");
		if(null == acc) {
			return "{\"msg\": \"error\",\"info\":\"acc is null\"}";
		}
		jo.setXiadanId(acc.getId());
		
		//获取接单人信息
		if(0 == jo.getIsCompany()) {
			//不是公司
			jo.setJiedanId(servicePeopleService.findById(jo.getServerId()).getuId());
		}else {
			jo.setJiedanId(serviceCompanyService.findById(jo.getServerId()).getuId());
		}
		
		int i = 0;
		try {
			i = jzOrderService.insert(jo);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i==1) {
			return "{\"msg\": \"ok\"}";
		}
		
		return "{\"msg\": \"error\"}";
		
	}
	
	/*@RequestMapping(params="method=updateView")
	public String updateView(ModelMap mm,HttpSession session,int id){		
		mm.put("n", newsService.findById(id));
		return "jsp/news/updateView";
		
	}*/
	@RequestMapping(params="method=payAndReFund")
	public String payAndRefund(ModelMap mm,HttpSession session,int id,int state){		
		//支付2和退款5
		
		int i = jzOrderService.payAndReFund(id, state);
		if(i>0) {
			return "redirect:/custom.do";
		}
		
		
		return "redirect:jsp/common/404.jsp";
		
	}
	
	@RequestMapping(params="method=review")
	public String review(ModelMap mm,HttpSession session,int id,int sId,int uId,int dId ,int isCompany,int grade,String content){		
		int i = 0;
		if(isCompany == 0) {
			servicePeopleService.updateGrade(id,sId,uId,dId ,isCompany,grade,content);
			jzOrderService.updateState(id, 7);
		}else {
			i = serviceCompanyService.updateGrade(id, sId, uId, dId, isCompany, grade, content);
			jzOrderService.updateState(id, 7);
		}
		/*int i = jzOrderService.updateState(id, state);
		if(i>0) {
			return "redirect:/jzOrder.do?state="+state;
		}
		
		
		return "redirect:jsp/common/404.jsp";*/
		return "redirect:/custom.do";
		
	}
	
	@RequestMapping(params="method=reviewView")
	public String reviewView(ModelMap mm,HttpSession session,int id){		
		
		JzOrder jo = jzOrderService.findById(id);
		mm.put("jo", jo);
		
		/*int i = jzOrderService.updateState(id, state);
		if(i>0) {
			return "redirect:/jzOrder.do?state="+state;
		}
		
		
		return "redirect:jsp/common/404.jsp";*/
		return "jsp/custom/review";
		
	}
	
	
	@RequestMapping(params="method=updateMyState")
	public String updateMyState(ModelMap mm,HttpSession session,int id,int state){		
		//接单1 拒绝3 申请退款4 已完成6
		
		int i = jzOrderService.updateState(id, state);
		if(i>0) {
			return "redirect:/custom.do";
		}
		
		return "redirect:jsp/common/404.jsp";
		
	}
	
	@RequestMapping(params="method=updateState")
	public String updateState(ModelMap mm,HttpSession session,int id,int state){		
		int i = jzOrderService.updateState(id, state);
		if(i>0) {
			return "redirect:/jzOrder.do?state="+state;
		}
		
		
		return "redirect:jsp/common/404.jsp";
		
	}
	
	@RequestMapping(params="method=myDelete")
	public String myDelete(ModelMap mm,HttpSession session,int id){		
		int i = jzOrderService.delete(id);
		if(i>0) {
			return "redirect:/custom.do";
		}
		return "redirect:jsp/common/404.jsp";
		
	}
	
	@RequestMapping(params="method=delete")
	public String delete(ModelMap mm,HttpSession session,int id){		
		int i = jzOrderService.delete(id);
		if(i>0) {
			return "redirect:/jzOrder.do";
		}
		return "redirect:jsp/common/404.jsp";
		
	}
	
	
	
}
