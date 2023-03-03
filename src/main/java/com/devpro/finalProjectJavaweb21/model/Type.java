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
@Table(name = "tbl_type")
public class Type extends BaseEntity {

	@Column(name = "type_name", length = 45, nullable = false)
	private String typeName;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "type")
	private Set<Product> products = new HashSet<Product>();

	public void addProduct(Product product) {
		products.add(product);
		product.setType(this);
	}

	public void deleteProduct(Product product) {
		products.remove(product);
		product.setType(null);
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

}
