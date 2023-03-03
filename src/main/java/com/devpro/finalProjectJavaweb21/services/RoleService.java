package com.devpro.finalProjectJavaweb21.services;

import org.springframework.stereotype.Service;

import com.devpro.finalProjectJavaweb21.model.Role;

@Service
public class RoleService extends BaseService<Role> {

	@Override
	protected Class<Role> clazz() {
		// TODO Auto-generated method stub
		return Role.class;
	}

}
