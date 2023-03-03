package com.devpro.finalProjectJavaweb21.services;

import org.springframework.stereotype.Service;

import com.devpro.finalProjectJavaweb21.model.User;

@Service
public class UserService extends BaseService<User> {

	@Override
	protected Class<User> clazz() {
		return User.class;
	}

	public User loadUserByUsername(String userName) {
		String sql = "select * from tbl_user u where u.email = '" + userName + "' and status = 1";
		return this.getEntityByNativeSQL(sql);
	}

}
