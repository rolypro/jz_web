package com.guet.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.guet.entity.Evaluate;
import com.guet.entity.JzOrder;
import com.guet.entity.JzType;
import com.guet.entity.Life;
import com.guet.entity.Message;
import com.guet.entity.News;
import com.guet.entity.Recruit;
import com.guet.entity.ServerType;
import com.guet.entity.ServiceCompany;
import com.guet.entity.ServicePeople;
import com.guet.service.EvaluateService;
import com.guet.service.JzOrderService;
import com.guet.service.JzTypeService;
import com.guet.service.LifeService;
import com.guet.service.MessageService;
import com.guet.service.NewsService;
import com.guet.service.RecruitService;
import com.guet.service.ServiceCompanyService;
import com.guet.service.ServicePeopleService;
import com.guet.util.SearchMap;

import sun.misc.BASE64Decoder;

@Controller
@SessionAttributes("rolemap")
@RequestMapping("/main.do")
public class MainController {
	
	/*@Autowired
	private Sys_RoleService sys_RoleService;
	@Autowired
	private Sys_UserDao sys_UserDao;*/
	@Autowired
	private NewsService newsService;
	@Autowired
	private LifeService lifeService;
	@Autowired
	private RecruitService recruitService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private JzTypeService jzTypeServie;
	@Autowired
	private ServicePeopleService servicePeopleService;
	@Autowired
	private ServiceCompanyService serviceCompanyService;
	@Autowired
	private EvaluateService evaluateService;
	@Autowired
	private JzOrderService jzOrderService;
	
	
	private SearchMap sm = new SearchMap();
	
	@InitBinder   	
    public void initBinder(WebDataBinder binder) {   
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
        dateFormat.setLenient(true);   
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   
    } 
	
	@RequestMapping
	public String index(ModelMap mm,HttpSession session){
		
		return "jsp/main/main";
	}
	
	@RequestMapping(params="method=searchInfo")
	public String SearchInfo(ModelMap mm,HttpSession session,int id,int isCompany) {
		
		if(isCompany==0) {
			//搜索个人
			ServicePeople sp = servicePeopleService.findById(id);
			mm.put("sp", sp);
			String serverType = sp.getServerType();
			Gson gson = new Gson();		
			List<ServerType> sts = gson.fromJson(serverType, new TypeToken<List<ServerType>>() {}.getType());
			mm.put("sts", sts);
			List<Evaluate> es = evaluateService.findSomeEvaluate(id, isCompany);
			mm.put("es",es);
			List<JzOrder> jos = jzOrderService.findServerOrder(id, isCompany);
			mm.put("jos", jos);
			return "jsp/main/searchPeople";
		}else {
			//搜索公司
			ServiceCompany sc = serviceCompanyService.findById(id);
			mm.put("sc", sc);
			String serverType = sc.getServerType();
			Gson gson = new Gson();		
			List<ServerType> sts = gson.fromJson(serverType, new TypeToken<List<ServerType>>() {}.getType());
			mm.put("sts", sts);
			List<Evaluate> es = evaluateService.findSomeEvaluate(id, isCompany);
			mm.put("es",es);
			List<JzOrder> jos = jzOrderService.findServerOrder(id, isCompany);
			mm.put("jos", jos);
			return "jsp/main/searchCompany";
		}
		
	}
	
	@RequestMapping(params="method=searchDim")
	public String SearchDim(ModelMap mm,HttpSession session,String searchInfo){
		//新建覆盖原有的viewMap
		Map<String, String>viewMap = new HashMap<String, String>();
		session.setAttribute("viewMap", viewMap);
		Gson gson = new Gson();
		mm.put("viewMap", gson.toJson(viewMap));
		
		List<ServicePeople> sps;
		List<ServiceCompany> scs;
		
		if(!"".equals(searchInfo) && searchInfo != null) {
			//不为空
			//解码base64
			BASE64Decoder  decoder = new BASE64Decoder(); 
			try {
				searchInfo = new String(decoder.decodeBuffer(searchInfo), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			sps = servicePeopleService.findDim(searchInfo);
			scs = serviceCompanyService.findDim(searchInfo);			
			
		}else {
			//为空

			String city = "";
			String server = "";
			String edu = "";
			sps = servicePeopleService.findByType(city, server, edu);
			scs = serviceCompanyService.findByType(city,server);
		}
		//2.查服务类型
		List<JzType> jts = jzTypeServie.findAll();
		mm.put("jts", jts);
		
		mm.put("sps", sps);
		mm.put("scs", scs);
		
		return "jsp/main/search";
		
	}
	
	@RequestMapping(params="method=search")
	public String Search(ModelMap mm,HttpSession session,String searchInfo){
		//1.session记录点了什么
		Map<String,String> viewMap = (Map<String, String>) session.getAttribute("viewMap");
		if(viewMap == null) {
			viewMap = new HashMap<String, String>();
		}
		
		if(!"".equals(searchInfo) && searchInfo != null) {
			//解码base64
			BASE64Decoder  decoder = new BASE64Decoder(); 
			try {
				searchInfo = new String(decoder.decodeBuffer(searchInfo), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		Gson gson = new Gson();
		Map<String, String> map = gson.fromJson(searchInfo, new TypeToken<Map<String, String>>() {}.getType());
		if(map !=null&&!map.isEmpty()) {
			for (String key : map.keySet()) { 
				viewMap.put(key, map.get(key));
			}
		}
		
		
		session.setAttribute("viewMap", viewMap);
		
		mm.put("viewMap", gson.toJson(viewMap));
		
		
		//2.查服务类型
		List<JzType> jts = jzTypeServie.findAll();
		mm.put("jts", jts);
		
		//查服务员和公司
		String city = "";
		String server = "";
		String edu = "";
		for (String key : viewMap.keySet()) { 
			if("city".equals(key)) {
				city = sm.getValue(key, viewMap.get(key));
			}else if("server".equals(key)) {
				if("1".equals(viewMap.get(key)))
					continue;
				server = jts.get(Integer.parseInt(viewMap.get(key))-2).getName();
			}else {
				edu = sm.getValue(key, viewMap.get(key));
			}
		}
		
		
		
		List<ServicePeople> sps = servicePeopleService.findByType(city, server, edu);
		List<ServiceCompany> scs = serviceCompanyService.findByType(city,server);
		
		mm.put("sps", sps);
		mm.put("scs", scs);
		
				
		
		return "jsp/main/search";
	}
	
	@RequestMapping(params="method=news")
	public String News(ModelMap mm,HttpSession session){
		List<News> ns = newsService.findAll();
		mm.put("ns", ns);
		return "jsp/main/news";
	}
	
	@RequestMapping(params="method=newsById")
	public String NewsById(ModelMap mm,HttpSession session,int id){
		News n = newsService.findById(id);
		mm.put("n", n);
		return "jsp/main/newsById";
	}

	@RequestMapping(params="method=life")
	public String Life(ModelMap mm,HttpSession session){
		List<Life> ls = lifeService.findAll();
		mm.put("ls", ls);
		return "jsp/main/life";
	}
	
	@RequestMapping(params="method=lifeById")
	public String LifeById(ModelMap mm,HttpSession session,int id){
		Life l = lifeService.findById(id);
		mm.put("l", l);
		return "jsp/main/lifeById";
	}
	
	@RequestMapping(params="method=recruit")
	public String Recruit(ModelMap mm,HttpSession session){
		List<Recruit> rs = recruitService.findAll();
		mm.put("rs", rs);
		return "jsp/main/recruit";
	}
	
	@RequestMapping(params="method=recruitById")
	public String RecruitById(ModelMap mm,HttpSession session,int id){
		Recruit r = recruitService.findById(id);
		mm.put("r", r);
		return "jsp/main/recruitById";
	}
	
	@RequestMapping(params="method=message")
	public String Message(ModelMap mm,HttpSession session){
		List<Message> ms = messageService.findAll();
		mm.put("ms", ms);
		return "jsp/main/message";
	}
	
	@RequestMapping(params="method=messageById")
	public String MessageById(ModelMap mm,HttpSession session,int id){
		Message m = messageService.findById(id);
		mm.put("m", m);
		return "jsp/main/messageById";
	}
	
	/*@RequestMapping(params="method=updateview")
	public String updateview(ModelMap mm,HttpSession session){
		Sys_User user = (Sys_User) session.getAttribute("user");
		mm.put("u",sys_UserDao.findById(user.getId()));
		return "jsp/home/User";
	}
	
	@RequestMapping(params="method=update")
	public String update(Sys_User su){
		//sys_UserDao.updateUser2(su);
		return "redirect:/main.do?method=updateview";
	}
	
	@RequestMapping(params="method=passview")
	public String passview(){
		//EL直接从session拿user了
		return "jsp/home/Pass";
	}
	
	@RequestMapping(params="method=passbefor")
	public @ResponseBody String passBefor(String pass,HttpSession session){
		Sys_User user = (Sys_User) session.getAttribute("user");
		String password = user.getPassword();
		if(pass.equals(password)){
			return "{\"msg\":\"ok\"}";
		}else{
			return "{\"msg\":\"error\"}";
		}
	}
	
	@RequestMapping(params="method=updatepass")
	public String updatePass(String pass,HttpSession session ){
		Sys_User user = (Sys_User) session.getAttribute("user");
		int id = user.getId();
		sys_UserDao.updatePass(pass, id);
		return "redirect:/index.do?method=logout";
	}*/
	
	
}
