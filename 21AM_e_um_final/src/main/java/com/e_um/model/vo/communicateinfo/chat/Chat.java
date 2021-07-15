package com.e_um.model.vo.communicateinfo.chat;

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
public class Chat {
	/*
	 * user에 대한 전체적인 정보가 필요하다 판단하여 User를 가져옴
	 * string으로 변경해도 무방
	 * mybatis, db에서 association, 별칭 부여 필요
	 */
	private User chatSender, chatReceiver;
	private String chatContent, chatPhote;
	private Date chatSendTime;
}
