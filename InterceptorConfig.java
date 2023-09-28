package com.example.demo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.demo.Interceptors.InterceptorDashbord;
import com.example.demo.Interceptors.InterceptorLogin;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new InterceptorLogin()).addPathPatterns("/login");
//		registry.addInterceptor(new InterceptorLogin()).addPathPatterns("/");
		registry.addInterceptor(new InterceptorDashbord()).addPathPatterns("/dashbord/***");
		registry.addInterceptor(new InterceptorDashbord()).addPathPatterns("/dashbord/***/***");
		
	}
}
