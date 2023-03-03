package com.devpro.finalProjectJavaweb21.dto;

import java.util.List;

/**
 * DTO này chứa các tiêu chí để tìm kiếm sản phẩm
 *
 * 
 */
public class ProductSearchModel extends BaseSearchModel {

	// tìm theo keyword
	private String keyword;

	// tìm theo category
	private Integer brandId;

	private List<Integer> brandID_list;
	private List<Integer> typeID_list;
	private List<Integer> colorsID_list;

	private String orderBy;

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public List<Integer> getBrandID_list() {
		return brandID_list;
	}

	public void setBrandID_list(List<Integer> brandID_list) {
		this.brandID_list = brandID_list;
	}

	public List<Integer> getTypeID_list() {
		return typeID_list;
	}

	public void setTypeID_list(List<Integer> typeID_list) {
		this.typeID_list = typeID_list;
	}

	public List<Integer> getColorsID_list() {
		return colorsID_list;
	}

	public void setColorsID_list(List<Integer> colorsID_list) {
		this.colorsID_list = colorsID_list;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getBrandId() {
		return brandId;
	}

	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}

}
