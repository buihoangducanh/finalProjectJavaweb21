package com.devpro.finalProjectJavaweb21.services;

import org.springframework.stereotype.Service;

import com.devpro.finalProjectJavaweb21.model.Contact;

@Service
public class ContactService extends BaseService<Contact> {

	@Override
	protected Class<Contact> clazz() {
		return Contact.class;
	}

}
