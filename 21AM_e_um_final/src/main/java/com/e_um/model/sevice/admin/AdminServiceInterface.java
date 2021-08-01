package com.e_um.model.sevice.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.e_um.model.vo.userInfo.user.User;

public interface AdminServiceInterface {
	public List<User> manageUser(int cPage, int numPerPage);
	public int userTotalData();
	public int blockUser(String userId);
	public int unblockUser(String userId);
}
