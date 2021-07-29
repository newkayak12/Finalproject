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
		
		List<Alarm> result =service.fetchAlarm(userId);
		log.warn("asdas{}",result);
		return result;
	}
	
	@RequestMapping("/alarm/deleteAlarm")
	@ResponseBody
	public int deleteAlarm(String alarmSeq ) {
		return service.deleteAlarm(alarmSeq);
	}
	
	@RequestMapping("/alarm/readAlarm")
	@ResponseBody
	public int readAlarm(String alarmSeq) {
		return service.readAlarm(alarmSeq);
	}
	
}
