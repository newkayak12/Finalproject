package com.e_um.model.vo.userInfo.alarmToggle;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.groupinfo.comment.Comment;
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
public class AlarmToggle {
	private String alarmKey, userId, alarmToggle;
}
