package com.e_um.model.vo.userInfo.user;

import java.util.Date;

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
public class User {
	/*
	 * 유저 안에 관심사를 갖고 있음, 관심사는 다섯개의 필드를 갖고 있다. 
	 * 
	 * 
	 * */

	
	private String userId, userPassword, userName, userNick, userEmail, userAddrBasic, userAddrDetails, userAddrZip, userPhone, userRole;
	private Date userDate;
	private String userGender;
	private String userYear;
	private String profileImageFile;
	private String profileStatus;
	
	private Interest interest;
	
	private int userReportCount;
	private String userBlock, userExit;
}
