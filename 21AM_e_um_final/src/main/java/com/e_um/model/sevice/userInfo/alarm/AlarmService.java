package com.e_um.model.sevice.userInfo.alarm;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.e_um.model.dao.userInfo.alarm.AlarmDaoInterface;
import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.userInfo.alarm.Alarm;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AlarmService implements AlarmServiceInterface {
	@Autowired
	AlarmDaoInterface dao;
	@Autowired
	SqlSessionTemplate session;
	@Override
	public int alarmCount(String userId) {
		// TODO Auto-generated method stub
		return dao.alarmCount(userId, session);
	}
	@Override
	public List<Alarm> fetchAlarm(String userId) {
		// TODO Auto-generated method stub
		return dao.fetchAlarm(userId, session);
	}
	@Override
	public int deleteAlarm(String seq) {
		// TODO Auto-generated method stub
		return dao.deleteAlarm(seq, session);
	}
}
