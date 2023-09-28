
package com.example.demo.Interceptors;


import org.springframework.web.servlet.HandlerInterceptor;



import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class InterceptorLogin implements HandlerInterceptor {

	
	
	  public boolean preHandle(HttpServletRequest req, HttpServletResponse res,Object handler) throws Exception {
	        // Logic to execute before the controller method
		  System.out.println("inteceptor is called...");
		  
		  HttpSession session=req.getSession();
		  if(session.getAttribute("email")==null) {
//			  res.sendRedirect("/dashbord");
			  return true;
		  }

		  
//		  jakarta.servlet.RequestDispatcher dispatcher = req.getRequestDispatcher("/views/Login.jsp");
//	       dispatcher.forward(req, res);
		  res.sendRedirect("/dashbord");
		return false;
		  	
		  	
	        // Continue processing or return false to stop the request
		  
    }
	

}
