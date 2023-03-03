package com.devpro.finalProjectJavaweb21.services;

import com.devpro.finalProjectJavaweb21.model.BaseEntity;

public interface MappingCustomEntity<E extends BaseEntity> {
	public E convert(Object[] data);
}
