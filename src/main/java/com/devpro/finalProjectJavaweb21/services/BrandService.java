package com.devpro.finalProjectJavaweb21.services;

import org.springframework.stereotype.Service;

import com.devpro.finalProjectJavaweb21.model.Brand;

@Service
public class BrandService extends BaseService<Brand> {

	@Override
	protected Class<Brand> clazz() {
		return Brand.class;
	}

}
