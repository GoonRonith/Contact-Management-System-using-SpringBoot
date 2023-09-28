package com.example.demo.Interceptors;

import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class InterceptorDashbord implements HandlerInterceptor {
	
	 public boolean preHandle(HttpServletRequest req, HttpServletResponse res,Object handler) throws Exception {
	        // Logic to execute before the controller method
		  System.out.println("dashbord inteceptor is called...");
		  
		  HttpSession session=req.getSession();
		  if(session.getAttribute("email")!=null) {
			  return true;
		  }

		  res.sendRedirect("/login");
	        return false; // Continue processing or return false to stop the request
		  
 }

}
