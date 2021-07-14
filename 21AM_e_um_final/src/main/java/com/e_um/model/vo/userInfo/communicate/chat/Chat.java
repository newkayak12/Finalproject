package com.e_um.model.vo.userInfo.communicate.chat;

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
	
	private User chatSender, chatReceiver;
	private String chatContent, chatPhote;
	private Date chatSendTime;
}
