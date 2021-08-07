package com.e_um.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class LoginCheckInterceptor implements HandlerInterceptor{

	@Override
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Object obj = request.getSession().getAttribute("userSession");
		log.error("------------------interceptor is running");
		if(obj!=null) {
			
			return HandlerInterceptor.super.preHandle(request, response, handler);
		} else {
			
			request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/WEB-INF/views/common/msglogin.jsp").forward(request, response);
			return false;
		}

	}


}
