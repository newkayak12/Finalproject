package com.e_um.model.dao.userInfo.alarm;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.e_um.model.sevice.userInfo.user.UserService;
import com.e_um.model.vo.userInfo.alarm.Alarm;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AlarmDao implements AlarmDaoInterface {@Override
	public int alarmCount(String userId, SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectOne("alarm.alarmCount",userId);
	}

@Override
public List<Alarm> fetchAlarm(String userId, SqlSessionTemplate session) {
	// TODO Auto-generated method stub
	
	return session.selectList("alarm.fetchAlarm",userId, new RowBounds(0,20));
}

@Override
public int deleteAlarm(String seq, SqlSessionTemplate session) {
	// TODO Auto-generated method stub
	return session.update("alarm.deleteAlarm", seq);
}

}
