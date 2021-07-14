package com.e_um.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class LogAop {

	@Around("execution(* com.e_um..*.*(..))") 
	public Object logger(ProceedingJoinPoint join) throws Throwable{
		Signature sig = join.getSignature();
		
		log.debug("goto ___ "+sig.getName() +" : "+ sig.getDeclaringTypeName());
		Object[] models = join.getArgs();
		
		for(Object model : models) {
			System.out.println(model);
		}
		
		Object obj = join.proceed();
	
		
		log.debug("departed from ___ "+sig.getName() +" : "+ sig.getDeclaringTypeName());
	
	
		return obj;
	}
	
	
	
}
