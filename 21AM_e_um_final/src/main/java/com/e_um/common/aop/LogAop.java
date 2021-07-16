package com.e_um.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class LogAop {
	
	@Around("execution(* com.e_um..*(..))") 
	public Object logger(ProceedingJoinPoint join) throws Throwable{
		Signature sig = join.getSignature();
		
		log.warn("\n into! :"+sig.getName() +" : "+ sig.getDeclaringTypeName()+"\n");
		Object[] models = join.getArgs();
		
		if(models!=null) {
			for(Object model : models) {
				Model a = (Model) model;
				log.warn("parameter {}: "+ a);
			}
		}
		Object obj = join.proceed();
	
		
		log.warn("\n from! : "+sig.getName() +" : "+ sig.getDeclaringTypeName()+"\n");
	
	
		return obj;
	}
	
	
	
}
