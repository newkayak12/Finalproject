package com.e_um.model.vo.groupinfo.member;

import java.util.Date;

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
public class Member {
	private String userId, group_user_role, group_user_age;
	private Date group_user_date;
	private String group_user_flag;
}
