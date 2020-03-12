package com.guet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guet.dao.AccountDao;
import com.guet.entity.Account;
import com.guet.entity.JzType;
import com.guet.entity.News;
import com.guet.service.NewsService;

@Controller
//@SessionAttributes("rolemap")
@RequestMapping("/admin.do")
public class AdminController {
	
	@Autowired
	private AccountDao accountDao;
	
	
	
	@RequestMapping(params="method=findAll")
	public String findAll(ModelMap mm,HttpSession session){
		
		List<Account> accs =  accountDao.findAllAdmin();
		mm.put("accs", accs);
		return "jsp/admin/allAdmin";
		
	}
	
	@RequestMapping(params="method=addPowerView")
	public  String addPowerView(ModelMap mm,HttpSession session){		
		
		return "jsp/admin/insertView";
		
	}
	
	@RequestMapping(params="method=updatePower")
	public  String updatePower(ModelMap mm,HttpSession session,int id){		
		int i = accountDao.updatePower(id, 0);
		if(i>0) {
			return "redirect:/admin.do?method=findAll";
		}
		return "redirect:jsp/common/404.jsp";
		
	}
	
	@RequestMapping(params="method=delete")
	public String delete(ModelMap mm,HttpSession session,int id){		
		int i = accountDao.updatePower(id, 3);
		if(i>0) {
			return "redirect:/admin.do?method=findAll";
		}
		return "redirect:jsp/common/404.jsp";
		
	}
	
	
	
}
