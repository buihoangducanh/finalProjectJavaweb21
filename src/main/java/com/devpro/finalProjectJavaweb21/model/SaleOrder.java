package com.devpro.finalProjectJavaweb21.model;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_saleorder")
public class SaleOrder extends BaseEntity {
	@Column(name = "code", length = 45, nullable = false)
	private String orderCode;

	@Column(name = "total", precision = 13, scale = 2, nullable = true)
	private BigDecimal total;

	@Column(name = "customer_name", length = 100, nullable = false)
	private String customerName;

	@Column(name = "customer_address", length = 200, nullable = false)
	private String customerAddress;

	@Column(name = "customer_phone", length = 100, nullable = false)
	private String customerPhone;

	@Column(name = "cutomer_email", length = 100, nullable = true)
	private String customerEmail;

	@Column(name = "note", length = 500, nullable = true)
	private String note;

	private boolean cancel_status;
	private boolean recieved;
	private boolean cancel_request;
	// product and sale order

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;

	public boolean isRecieved() {
		return recieved;
	}

	public void setRecieved(boolean recieved) {
		this.recieved = recieved;
	}

	public boolean isCancel_request() {
		return cancel_request;
	}

	public void setCancel_request(boolean cancel_request) {
		this.cancel_request = cancel_request;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@OneToMany(mappedBy = "saleOrder", cascade = CascadeType.ALL)
	Set<SaleOrderProduct> orderProducts = new HashSet<SaleOrderProduct>();

	public void addSaleOrderProduct(SaleOrderProduct saleOrderProduct) {
		orderProducts.add(saleOrderProduct);
		saleOrderProduct.setSaleOrder(this);
	}

	public void deleteSaleOrderProduct(SaleOrderProduct saleOrderProduct) {
		orderProducts.remove(saleOrderProduct);
		saleOrderProduct.setSaleOrder(null);
	}

	public Set<SaleOrderProduct> getOrderProducts() {
		return orderProducts;
	}

	public void setOrderProducts(Set<SaleOrderProduct> orderProducts) {
		this.orderProducts = orderProducts;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public boolean isCancel_status() {
		return cancel_status;
	}

	public void setCancel_status(boolean cancel_status) {
		this.cancel_status = cancel_status;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

}
