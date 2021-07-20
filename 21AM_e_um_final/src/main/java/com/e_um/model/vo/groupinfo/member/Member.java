package com.e_um.model.vo.groupinfo.member;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.userInfo.user.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class Member {
/*
 * user에 대한 정보를 join할 경우 필요하다 판단(나이)
 * 
 * ???????
 */
	private String groupSeq;
	private User groupUser;
	
//	private String userId;
	private String groupUserRole;
	private Date groupUserDate;
	private String groupUserFlag;
}
