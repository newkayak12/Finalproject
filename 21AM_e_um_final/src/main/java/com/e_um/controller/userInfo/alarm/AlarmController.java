package com.e_um.controller.userInfo.alarm;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.e_um.model.sevice.userInfo.alarm.AlarmServiceInterface;
import com.e_um.model.vo.userInfo.alarm.Alarm;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class AlarmController {
	@Autowired
	AlarmServiceInterface service;
	
	@ResponseBody
	@RequestMapping("/alarm/count")
	public int alarmCount(String userId) {
		
		return service.alarmCount(userId);
	}
	
	@ResponseBody
	@RequestMapping("/alarm/fetchAlarm")
	public List<Alarm>fetchAlarm(String userId){
		log.warn("asdasdasdasdassssssssssssssssss"+userId)
		;
		return service.fetchAlarm(userId);
	}
	
}
