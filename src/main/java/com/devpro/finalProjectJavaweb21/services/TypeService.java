package com.devpro.finalProjectJavaweb21.services;

import org.springframework.stereotype.Service;

import com.devpro.finalProjectJavaweb21.model.Type;

@Service
public class TypeService extends BaseService<Type> {

	@Override
	protected Class<Type> clazz() {
		return Type.class;
	}

}
