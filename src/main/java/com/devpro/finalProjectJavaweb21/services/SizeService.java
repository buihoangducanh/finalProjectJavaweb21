package com.devpro.finalProjectJavaweb21.services;

import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.stereotype.Service;

import com.devpro.finalProjectJavaweb21.model.Product;
import com.devpro.finalProjectJavaweb21.model.Size;
import com.devpro.finalProjectJavaweb21.repository.ProductRepository;

@Service
@EnableJpaAuditing
public class SizeService extends BaseService<Size> {

	@Autowired
	private ProductRepository productRepository;

	@Override
	protected Class<Size> clazz() {
		return Size.class;
	}

	@Transactional
	public void add(Product p, String[] sizesID) throws IllegalStateException, IOException {
		for (String sizeID : sizesID) {
			Integer id = Integer.parseInt(sizeID);
			Size newSize = this.getById(id);
			p.addSize(newSize);
			newSize.addProduct(p);
		}
		productRepository.save(p);
	}

}
