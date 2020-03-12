package com.guet.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	
	//登录
	public boolean preHandle(HttpServletRequest request,    
	            HttpServletResponse response, Object handler) throws Exception {    
	     System.out.println("loginint");   
		 HttpSession session = request.getSession();
		 
		 
		 String contextPath = request.getContextPath();
		 String requestUri = request.getRequestURI();
		 String url = requestUri.substring(contextPath.length());
		 System.out.println(contextPath);
	     System.out.println(requestUri);   
         System.out.println(url);
         System.out.println(request.getQueryString());
         
         if(session.getAttribute("is_login")!=null){
        	 
        	 boolean is_login = (boolean) session.getAttribute("is_login");
        	 if(is_login)
        		 return true;
		 }
		  
         request.getRequestDispatcher("/").forward(request, response);  
          
		 return false;
	}
}
