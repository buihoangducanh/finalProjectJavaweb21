package com.devpro.finalProjectJavaweb21.services;

import org.springframework.stereotype.Service;

import com.devpro.finalProjectJavaweb21.model.ProductImage;

@Service
public class ProductImagesService extends BaseService<ProductImage> {

	@Override
	protected Class<ProductImage> clazz() {
		// TODO Auto-generated method stub
		return ProductImage.class;
	}

}
