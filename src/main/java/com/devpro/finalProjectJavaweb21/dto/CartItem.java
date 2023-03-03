package com.devpro.finalProjectJavaweb21.dto;

import java.math.BigDecimal;

/**
 * Biểu thị cho 1 sản phẩm trong giỏ hàng.
 * 
 */
public class CartItem {
	// mã sản phẩm
	private int productId;
	// avatar
	private String avatar;
	// tên sản phẩm
	private String productName;

	// số lương sản phẩm
	private int quantity;

	// đơn giá sản phẩm
	private BigDecimal priceUnit;
	//
	private String size;

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getPriceUnit() {
		return priceUnit;
	}

	public void setPriceUnit(BigDecimal priceUnit) {
		this.priceUnit = priceUnit;
	}

}
