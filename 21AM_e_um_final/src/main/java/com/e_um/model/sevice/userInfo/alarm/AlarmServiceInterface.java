package com.e_um.model.sevice.userInfo.alarm;

import java.util.List;

import com.e_um.model.vo.userInfo.alarm.Alarm;

public interface AlarmServiceInterface {
	public int alarmCount(String userId);
	public List<Alarm>fetchAlarm(String userId);
}
