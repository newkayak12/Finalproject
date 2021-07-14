package com.e_um.model.vo.userInfo.communicate.friend;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.userInfo.interest.Interest;
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
public class Friend {

//		private User myId, freindsId;
		private String friendBlockFlag;
}
