package com.e_um.model.vo.userInfo.interest;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class Interest {
	
/*
 * 다섯 가지의 관심사를 갖고 있고
 * 모두 null일 수도 있다. 
 */
	private String profileInterestName1, profileInterestName2, profileInterestName3, profileInterestName4, profileInterestName5;
	
	
}
