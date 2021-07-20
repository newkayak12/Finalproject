package com.e_um.common.verifyCodeMaker;

import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class VerifyCodeMaker {
	public  String codeGenerator() {
		char[] code  =new  char[4];
		VerifyCodeMaker veri =new VerifyCodeMaker();
		
		int random  =0;
		
		for(int i =0; i<4; i++) {
			
			random = (int) (Math.random()*2) ;
			
			
			if(random ==0) {
				code[i] = (char)veri.number();
			} else if(random ==1) {
				code[i] = (char)veri.alphabet();
			}
		}
		
		
		String result = new String (code);
		return result;
		
	}
	
	
	public int number() {
		return (int)(Math.random()*9) +48;
	}
	public int alphabet() {
		return (int)(Math.random()*25) +65;
	}
}
