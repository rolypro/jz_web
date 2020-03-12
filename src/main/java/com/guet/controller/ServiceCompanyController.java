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
import com.guet.entity.ServiceCompany;
import com.guet.entity.ServicePeople;
import com.guet.service.ServiceCompanyService;

@Controller
//@SessionAttributes("rolemap")
@RequestMapping("/serviceCompany.do")
public class ServiceCompanyController {
	
	@Autowired
	private ServiceCompanyService serviceCompanyService;
	
	
	
	@RequestMapping
	public String findState(ModelMap mm,HttpSession session,int state){
		
		List<ServiceCompany> scs = serviceCompanyService.findState(state);
		mm.put("scs", scs);
		if(state == 2 || state == 3) {
			return "jsp/serviceCompany/serviceCompanyState2";
		}
		return "jsp/serviceCompany/serviceCompanyState";
		
	}
	
	@RequestMapping(params="method=findById")
	public String findById(ModelMap mm,HttpSession session,int id){
		
		ServiceCompany sc =  serviceCompanyService.findById(id);
		mm.put("sc", sc);
		String serverType = sc.getServerType();
		Gson gson = new Gson();		
		List<ServerType> sts = gson.fromJson(serverType, new TypeToken<List<ServerType>>() {}.getType());
		mm.put("sts", sts);
		
		return "jsp/serviceCompany/checkView";
		
	}
	
	/*@RequestMapping(params="method=insertView")
	public String insertView(ModelMap mm,HttpSession session){		
		
		return "jsp/news/insertView";
		
	}*/
	
	@RequestMapping(params="method=insert")
	public String insert(ModelMap mm,HttpSession session ,ServiceCompany sc){		
		int sId = sc.getId();		
		int i = 0;
		if(sId <= 0 ) {
			//没有记录插入一条
			Account acc = (Account) session.getAttribute("user");
			sc.setuId(acc.getId());
			i = serviceCompanyService.insert(sc);
		}else {
			//更新
			sc.setState(2);
			i = serviceCompanyService.update(sc);
			
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
		int i = serviceCompanyService.updateState(id, state);
		if(i>0) {
			return "redirect:/serviceCompany.do?state="+state;
		}
		
		
		return "redirect:jsp/common/404.jsp";
		
	}
	
	@RequestMapping(params="method=delete")
	public String delete(ModelMap mm,HttpSession session,int id){		
		int i = serviceCompanyService.delete(id);
		if(i>0) {
			return "redirect:/serviceCompany.do?state=0";
		}
		return "redirect:jsp/common/404.jsp";
		
	}
	
	
	
}
