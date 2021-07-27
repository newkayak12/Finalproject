package com.e_um.model.vo.communicateinfo.friend;

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
public class HasAFriend {

	
	private String friendSeq;
	private User  friendId;
	private String friendBlockFlag;
}
