package com.e_um.model.sevice.userInfo.user;

import com.e_um.model.vo.userInfo.user.User;

public interface UserServiceInterface {
	public int idChecker(String userId);
	public int emailChecker(String userEmail);
	public int nickChecker(String userNick);
	public int InsertUser(User user);
	public User login(User user);
	public User verify(User user);
	public int changepw(User user);
}
