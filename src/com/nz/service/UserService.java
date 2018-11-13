package com.nz.service;

import com.nz.dao.UserDao;
import com.nz.entity.User;

public class UserService {

	private UserDao uDao=new UserDao();
	public void save(User newU) {
		uDao.save(newU);
		
	}
	public User findByName(String uname) {
		
		return uDao.findByName(uname);
	}
	public User findByNameAndPwd(String uname, String pwd) {
		
		return uDao.findByNameAndPwd(uname,pwd);
	}

}
