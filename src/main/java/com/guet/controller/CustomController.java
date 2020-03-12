package com.guet.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.guet.entity.Account;
import com.guet.entity.ImageUp;
import com.guet.entity.JzType;
import com.guet.entity.ServerType;
import com.guet.entity.ServiceCompany;
import com.guet.entity.ServicePeople;
import com.guet.service.AccountService;
import com.guet.service.JzTypeService;
import com.guet.service.ServiceCompanyService;
import com.guet.service.ServicePeopleService;

import sun.misc.BASE64Decoder;

@Controller
@SessionAttributes("rolemap")
@RequestMapping("/custom.do")
public class CustomController {
	
	//客户controller
	
	/*@Autowired
	private Sys_RoleService sys_RoleService;
	@Autowired
	private Sys_UserDao sys_UserDao;*/
	@Autowired
	private ServicePeopleService servicePeopleService;
	@Autowired
	private ServiceCompanyService serviceCompanyService;
	@Autowired
	private JzTypeService jzTypeServie;
	@Autowired
	private AccountService accountService;
	
	@RequestMapping
	public String index(ModelMap mm,HttpSession session){
		
		return "jsp/custom/Home";
	}
	
	
	@RequestMapping(params="method=userInfoView")
	public String userInfoView(ModelMap mm,HttpSession session,int id){
		Account acc = accountService.findById(id);
		mm.put("acc", acc);
		return "jsp/custom/userInfo";
	}
	
	@RequestMapping(params="method=updateUserInfo")
	public String updateUserInfo(Account acc){
		accountService.updateUserInfo(acc);
		return "redirect:/custom.do?methond=userInfoView&&id="+acc.getId();
	}
	
	@RequestMapping(params="method=passView")
	public String passView(){
		//EL直接从session拿user了
		return "jsp/custom/password";
	}
	
	@RequestMapping(params="method=recharge")
	public @ResponseBody String recharge(int id ,int gold,HttpSession session ){
		int i = accountService.chageGold(id, gold);
		if(i>0)
			return "{\"msg\":\"ok\"}";
		return "{\"msg\":\"error\"}";
	}
	
	@RequestMapping(params="method=updatepass")
	public @ResponseBody String updatePass(String oldpass,String newpass,HttpSession session ){
		Account acc = (Account) session.getAttribute("user");
		if(null==acc){
			return "{\"msg\":\"error\"}";
		}
		if(!oldpass.equals(acc.getPassword())) {
			return "{\"msg\":\"passError\"}";
		}
		
		int i = accountService.updatePass(acc.getId(), newpass);
		if(i>0) {
			return "{\"msg\":\"ok\"}";
		}
		return "{\"msg\":\"error\"}";
	}
	
	@RequestMapping(params="method=beComePeopleView")
	public String BeComePeopleVIew(ModelMap mm,HttpSession session){
		Account acc = (Account) session.getAttribute("user");
		ServicePeople sp = servicePeopleService.findByUid(acc.getId());
		if(sp != null) {
			mm.put("sp", sp);
			String serverType = sp.getServerType();
			Gson gson = new Gson();		
			List<ServerType> sts = gson.fromJson(serverType, new TypeToken<List<ServerType>>() {}.getType());
			mm.put("sts", sts);
		}
		
		//2.查服务类型
		List<JzType> jts = jzTypeServie.findAll();
		mm.put("jts", jts);
		
		return "jsp/custom/beComePeople";
	}
	
	@RequestMapping(params="method=beComeCompanyView")
	public String BeComeCompanyView(ModelMap mm,HttpSession session){
		Account acc = (Account) session.getAttribute("user");
		ServiceCompany sc = serviceCompanyService.findByUid(acc.getId());
		if(sc != null) {
			mm.put("sc", sc);
			String serverType = sc.getServerType();
			Gson gson = new Gson();		
			List<ServerType> sts = gson.fromJson(serverType, new TypeToken<List<ServerType>>() {}.getType());
			mm.put("sts", sts);
		}
		//2.查服务类型
		List<JzType> jts = jzTypeServie.findAll();
		mm.put("jts", jts);
		return "jsp/custom/beComeCompany";
	}
	
	@RequestMapping(params="method=uploadImage")
	public String UploadImage(ModelMap mm,HttpSession session,int id,int isCompany){
		String image;
		if(isCompany == 1) {
			ServiceCompany sc = serviceCompanyService.findById(id);
			image = sc.getImage();
		}else {
			ServicePeople sp = servicePeopleService.findById(id);
			image = sp.getImage();
		}
		mm.put("image", image);
		mm.put("id", id);
		mm.put("isCompany", isCompany);
		return "jsp/custom/uploadImage";
	}
	
	@RequestMapping(params="method=upload",produces="application/json;charset=UTF-8")
	public @ResponseBody String Upload(HttpServletRequest request,ModelMap mm,HttpSession session,@RequestBody String imgBase64){
		
		Gson gson = new Gson();		
		ImageUp iu = gson.fromJson(imgBase64, new TypeToken<ImageUp>() {}.getType());
		String image = iu.getImageBase64();
		
		    
	    String path= request.getServletContext().getRealPath("/");  
        String filePath="upload/";  
        String[] imageArr=image.split(",");  
        image = imageArr[1];
        String msg="default"; 
	    BASE64Decoder  decoder = new BASE64Decoder(); 
	    String imageName = "";
        if(image!=null&&!"".equals(image)){  
            try {  
                byte[] b=decoder.decodeBuffer(image);  
                String name=System.currentTimeMillis()+".jpg"; 
                imageName = name;
                File targetFile = new File(path+filePath);  
                if(!targetFile.exists()){    
                    targetFile.mkdirs();    
                }
                
                filePath+=name;  
                   

                FileOutputStream out = new FileOutputStream(path+filePath);        //新建一个文件输出器，并为它指定输出位置imgFilePath  
                out.write(b); //利用文件输出器将二进制格式decodedBytes输出  
                out.flush(); 
                                         
                System.out.println("上传成功！ "+targetFile.getCanonicalPath());  
            } catch (Exception e) {  
                e.printStackTrace();  
                msg="上传失败";  
                System.err.print("上传失败");  
                return "{\"msg\":\"error\"}";
            }  
        }else{  
            msg="上传失败";  
            System.err.print("上传失败");  
            return "{\"msg\":\"error\"}";
        }  
        
        int i = 0;
		//上传成功写入数据库
        if(iu.getIsCompany() == 0) {
        	//个人
        	i = servicePeopleService.uploadImage(iu.getId(), imageName);
        }else {
        	//公司
        	i = serviceCompanyService.uploadImage(iu.getId(), imageName);
        }
        
		
        if(i > 0){
			return "{\"msg\":\"ok\"}";
		}else{
			return "{\"msg\":\"error\"}";
		}
		
		
		
	}
	
	
}
