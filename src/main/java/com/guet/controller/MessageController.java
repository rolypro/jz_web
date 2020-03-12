package com.guet.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guet.entity.Account;
import com.guet.entity.Message;
import com.guet.entity.SubMessage;
import com.guet.service.MessageService;
import com.guet.service.SubMessageService;

@Controller
//@SessionAttributes("rolemap")
@RequestMapping("/message.do")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	@Autowired
	private SubMessageService subMessageService;
	
	
	
	@RequestMapping
	public String findAll(ModelMap mm,HttpSession session){
		
		List<Message> ms = messageService.findAll();
		mm.put("ms", ms);
		return "jsp/message/message";
		
	}
	
	@RequestMapping(params="method=sub")
	public String findById(ModelMap mm,HttpSession session,int id){
		
		Message m = messageService.findById(id);
		mm.put("m", m);
		return "jsp/message/messageSub";
		
	}
	
	/*@RequestMapping(params="method=insertView")
	public String insertView(ModelMap mm,HttpSession session){		
		
		return "jsp/news/insertView";
		
	}*/
	
	@RequestMapping(params="method=insert")
	public String insert(ModelMap mm,HttpSession session ,Message m){		
		
		boolean isLogin = (boolean) session.getAttribute("is_login");
		Account acc = (Account) session.getAttribute("user");
		
		if(!isLogin && null == acc) {
			//未登录
			return "redirect:/index.do";
		}
		
		m.setuId(acc.getId());
		m.setName(acc.getName());
		int i = messageService.insert(m);
		if(i>0) {
			//return "{\"msg\": \"ok\"}";
			return "redirect:/main.do?method=message";
		}
		//return "{\"msg\": \"error\"}";
		return "redirect:jsp/common/404.jsp";
		
	}
	
	@RequestMapping(params="method=insertSub")
	public String insertSub(ModelMap mm,HttpSession session ,SubMessage sm){		
		boolean isLogin = (boolean) session.getAttribute("is_login");
		Account acc = (Account) session.getAttribute("user");
		
		if(!isLogin && null == acc) {
			//未登录
			return "redirect:/index.do";
		}
		
		
		sm.setuId(acc.getId());
		sm.setName(acc.getName());
		int i = subMessageService.insert(sm);
		if(i>0) {
			//return "{\"msg\": \"ok\"}";
			return "redirect:/main.do?method=messageById&&id="+sm.getfId();
		}
		//return "{\"msg\": \"error\"}";
		return "redirect:jsp/common/404.jsp";
		
	}
	
	/*@RequestMapping(params="method=updateView")
	public String updateView(ModelMap mm,HttpSession session,int id){		
		mm.put("n", newsService.findById(id));
		return "jsp/news/updateView";
		
	}*/
	
	/*@RequestMapping(params="method=update")
	public @ResponseBody String update(ModelMap mm,HttpSession session,News n){		
		int i = newsService.update(n);
		if(i>0) {
			return "{\"msg\": \"ok\"}";
		}
		return "{\"msg\": \"error\"}";
		
	}*/
	
	@RequestMapping(params="method=delete")
	public String delete(ModelMap mm,HttpSession session,int id){		
		int i = messageService.delete(id);
		if(i>0) {
			return "redirect:/message.do";
		}
		return "redirect:jsp/common/404.jsp";
		
	}
	
	@RequestMapping(params="method=deleteSub")
	public String deleteSub(ModelMap mm,HttpSession session,int id){		
		int i = subMessageService.delete(id);
		if(i>0) {
			return "redirect:/message.do";
		}
		return "redirect:jsp/common/404.jsp";
		
	}
	
	
	
}
