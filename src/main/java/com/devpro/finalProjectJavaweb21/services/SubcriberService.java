package com.devpro.finalProjectJavaweb21.services;

import org.springframework.stereotype.Service;

import com.devpro.finalProjectJavaweb21.model.Subcriber;

@Service
public class SubcriberService extends BaseService<Subcriber> {

	@Override
	protected Class<Subcriber> clazz() {
		// TODO Auto-generated method stub
		return Subcriber.class;
	}

}
