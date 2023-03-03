package com.devpro.finalProjectJavaweb21.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_size")
public class Size extends BaseEntity implements Comparable<Size> {
	@Column(name = "size_name", length = 3, nullable = false)
	private String sizeName;

	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.REFRESH }, fetch = FetchType.EAGER, mappedBy = "sizes")
	private Set<Product> products = new HashSet<Product>();

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	public void addProduct(Product product) {
		product.getSizes().add(this);
		products.add(product);
	}

	public void deleteProduct(Product product) {
		product.getSizes().remove(this);
		products.remove(product);
	}

	public String getSizeName() {
		return sizeName;
	}

	public void setSizeName(String sizeName) {
		this.sizeName = sizeName;
	}

	public int compareTo(Size o) {
		Integer size1 = Integer.parseInt(this.getSizeName());
		Integer size2 = Integer.parseInt(o.getSizeName());
		if (size1 > size2) {
			return 1;
		} else if (size1 == size2) {
			return 0;
		} else {
			return -1;
		}
	}

}
