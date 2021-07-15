package com.e_um.model.vo.serviceinfo.faq;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.userInfo.interest.Interest;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class Faq {
	
	/*
	 * faq는 시퀀스, 카테고리 제목 내욜이 있다.
	 * */
	private String faqSeq, questionCategory, faqTitle, faqContents;
}
