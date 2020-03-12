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
@RequestMapping("/c.do")
public class CController {
	
	@Autowired
	private AccountDao accountDao;
	
	
	
	@RequestMapping(params="method=findAll")
	public String findAll(ModelMap mm,HttpSession session){
		
		List<Account> accs =  accountDao.findAll();
		mm.put("accs", accs);
		return "jsp/c/allAcc";
		
	}
	
	
	
	@RequestMapping(params="method=updatePower")
	public  String updatePower(ModelMap mm,HttpSession session,int id,int power){		
		int i = accountDao.updatePower(id, power);
		if(i>0) {
			return "redirect:/c.do?method=findAll";
		}
		return "redirect:jsp/common/404.jsp";
		
	}
	
	@RequestMapping(params="method=delete")
	public String delete(ModelMap mm,HttpSession session,int id){		
		int i = accountDao.delete(id);
		if(i>0) {
			return "redirect:/c.do?method=findAll";
		}
		return "redirect:jsp/common/404.jsp";
		
	}
	
	
	
}
