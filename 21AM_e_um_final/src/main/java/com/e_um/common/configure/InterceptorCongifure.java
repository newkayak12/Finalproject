package com.e_um.common.configure;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.e_um.common.interceptor.LoginCheckInterceptor;


@Configuration
public class InterceptorCongifure implements WebMvcConfigurer {

	@Autowired
	LoginCheckInterceptor loginCheck;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		
		List<String> pattern = Arrays.asList("/user/**/*","/report/**/*","/profile/**/*","/alarm/**/*","/qna/**/*","/faq/**/*","/movie/**/*","/food/**/*","/group/**/*","/friend/**/*","/feed/**/*");
		
		List<String> exclude = Arrays.asList("/user/login/start","/user/lostandfound/start","/user/findmyid/start","/user/findmypw/start","/user/findmy/middle","/user/idfound","/user/pwfound","/user/changepw","/user/signup/start/zero","/user/signup/start/first","/user/signup/start/second","/user/signup/start/third","/user/nickCheker","/user/idchecker","/user/emailchecker","/user/loginverify","/user/kakaologin","/user/kakaoInsert");
		registry.addInterceptor(loginCheck).addPathPatterns(pattern).excludePathPatterns(exclude);
		
		WebMvcConfigurer.super.addInterceptors(registry);
	}

}
