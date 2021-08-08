package com.e_um.model.sevice.serviceInfo.faq;

import java.util.List;

import com.e_um.model.vo.serviceinfo.faq.Faq;

public interface FaqServiceInterface {
	
	List<Faq> selectFAQList(String flag);
	
	List<Faq> searchFAQ(String keyword);

}
