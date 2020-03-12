package com.guet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.guet.entity.Account;
import com.guet.entity.ServerType;
import com.guet.entity.ServicePeople;
import com.guet.service.ServicePeopleService;

@Controller
//@SessionAttributes("rolemap")
@RequestMapping("/servicePeople.do")
public class ServicePeopleController {
	
	@Autowired
	private ServicePeopleService servicePeopleService;
	
	
	
	@RequestMapping
	public String findState(ModelMap mm,HttpSession session,int state){
		
		List<ServicePeople> ss = servicePeopleService.findState(state);
		mm.put("ss", ss);
		if(state == 2 || state == 3) {
			return "jsp/servicePeople/servicePeopleState2";
		}
		return "jsp/servicePeople/servicePeopleState";
		
	}
	
	@RequestMapping(params="method=findById")
	public String findById(ModelMap mm,HttpSession session,int id){
		
		ServicePeople s =  servicePeopleService.findById(id);
		mm.put("s", s);
		String serverType = s.getServerType();
		Gson gson = new Gson();		
		List<ServerType> sts = gson.fromJson(serverType, new TypeToken<List<ServerType>>() {}.getType());
		mm.put("sts", sts);
		
		return "jsp/servicePeople/checkView";
		
	}
	
	/*@RequestMapping(params="method=insertView")
	public String insertView(ModelMap mm,HttpSession session){		
		
		return "jsp/news/insertView";
		
	}*/
	
	@RequestMapping(params="method=insert")
	public String insert(ModelMap mm,HttpSession session ,ServicePeople sp){		
		int sId = sp.getId();		
		int i = 0;
		if(sId <= 0 ) {
			//没有记录插入一条
			Account acc = (Account) session.getAttribute("user");
			sp.setuId(acc.getId());
			i = servicePeopleService.insert(sp);
		}else {
			//更新
			sp.setState(2);
			i = servicePeopleService.update(sp);
			
		}
		
		if(i>0) {
			return "redirect:/custom.do";
		}
		return "redirect:jsp/common/404.jsp";
		
	}
	
	/*@RequestMapping(params="method=updateView")
	public String updateView(ModelMap mm,HttpSession session,int id){		
		mm.put("n", newsService.findById(id));
		return "jsp/news/updateView";
		
	}*/
	
	@RequestMapping(params="method=updateState")
	public String updateState(ModelMap mm,HttpSession session,int id,int state){		
		int i = servicePeopleService.updateState(id, state);
		if(i>0) {
			return "redirect:/servicePeople.do?state="+state;
		}
		
		
		return "redirect:jsp/common/404.jsp";
		
	}
	
	@RequestMapping(params="method=delete")
	public String delete(ModelMap mm,HttpSession session,int id){		
		int i = servicePeopleService.delete(id);
		if(i>0) {
			return "redirect:/servicePeople.do?state=0";
		}
		return "redirect:jsp/common/404.jsp";
		
	}
	
	
	
}
