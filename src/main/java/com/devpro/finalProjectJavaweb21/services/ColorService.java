package com.devpro.finalProjectJavaweb21.services;

import org.springframework.stereotype.Service;

import com.devpro.finalProjectJavaweb21.model.Color;

@Service
public class ColorService extends BaseService<Color> {

	@Override
	protected Class<Color> clazz() {
		return Color.class;
	}

}
