package com.nz.dao;

import com.nz.db.DBHelp;
import com.nz.db.rowmapper.BeanPropertyRowMapper;
import com.nz.entity.User;

public class UserDao {

	private DBHelp dbHelp=new DBHelp();
	public void save(User newU) {

		String sql="insert into t_user (uname,pwd) values(?,?)";
		dbHelp.executeUpdate(sql,newU.getUname(),newU.getPwd());
		
	}
	public User findByName(String uname) {
		String sql="select uname,pwd from t_user where uname=?";
		return (User)dbHelp.queryForObject(sql, new BeanPropertyRowMapper(User.class),uname);
		 
		
	}
	public User findByNameAndPwd(String uname, String pwd) {
		
		String sql="select uname,pwd from t_user where uname=?,pwd=?";
		return (User)dbHelp.queryForObject(sql, new BeanPropertyRowMapper(User.class),uname,pwd);
	}

}
