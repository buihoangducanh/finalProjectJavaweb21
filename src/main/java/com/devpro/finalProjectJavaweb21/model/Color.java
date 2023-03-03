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
@Table(name = "tbl_color")

public class Color extends BaseEntity {
	@Column(name = "color_name", length = 45, nullable = false)
	private String colorName;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "color")
	private Set<Product> products = new HashSet<Product>();

	public void addProduct(Product product) {
		products.add(product);
		product.setColor(this);
	}

	public void deleteProduct(Product product) {
		products.remove(product);
		product.setColor(null);
	}

	public Color() {

	}

	public String getColorName() {
		return colorName;
	}

	public void setColorName(String colorName) {
		this.colorName = colorName;
	}

}
