package com.e_um.model.vo.userInfo.alarm;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.userInfo.alarmToggle.AlarmToggle;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class Alarm {
	private AlarmToggle alarmToggle;
	private String alarmContent;
	private Date alarmDate;
	private String alarmRead;
	
}
