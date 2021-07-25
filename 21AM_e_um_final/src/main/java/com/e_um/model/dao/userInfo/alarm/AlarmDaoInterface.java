package com.e_um.model.dao.userInfo.alarm;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.e_um.model.vo.userInfo.alarm.Alarm;

public interface AlarmDaoInterface {
	public int alarmCount(String userId, SqlSessionTemplate session);
	public List<Alarm>fetchAlarm(String userId, SqlSessionTemplate session);
}
