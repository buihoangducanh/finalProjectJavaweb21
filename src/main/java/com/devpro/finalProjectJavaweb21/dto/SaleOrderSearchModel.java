package com.devpro.finalProjectJavaweb21.dto;

/**
 * DTO này chứa các tiêu chí để tìm kiếm sản phẩm
 *
 * 
 */
public class SaleOrderSearchModel extends BaseSearchModel {

	// tìm theo category
	private Integer type;

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

}
