package com.devpro.finalProjectJavaweb21.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_brand")
public class Brand extends BaseEntity {
	@Column(name = "brand_name", length = 45, nullable = false)
	private String brandName;
	@Column(name = "desc", length = 500, nullable = true)
	private String description;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "brand")
	private Set<Product> products = new HashSet<Product>();

	public void addProduct(Product product) {
		products.add(product);
		product.setBrand(this);
	}

	public void deleteProduct(Product product) {
		products.remove(product);
		product.setBrand(null);
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	public Brand() {

	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
