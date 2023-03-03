package com.devpro.finalProjectJavaweb21.model;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_product")
public class Product extends BaseEntity {
	@Column(name = "product_name", length = 100, nullable = false)
	private String productName;

	@Column(name = "price", precision = 13, scale = 2, nullable = false)
	private BigDecimal productPrice;

	@Column(name = "price_sale", precision = 13, scale = 2, nullable = true)
	private BigDecimal salePrice;

	@Lob
	@Column(name = "description", nullable = false, columnDefinition = "LONGTEXT")
	private String productDescription;

	@Column(name = "avatar", nullable = true)
	private String avatar;

	@Column(name = "material", length = 45, nullable = false)
	private String material;

	@Column(name = "manufactory", length = 45, nullable = false)
	private String manufactory;

	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;

	@Column(name = "is_hot", nullable = true)
	private Boolean isHot = Boolean.FALSE;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "brand_id")
	private Brand brand;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "color_id")
	private Color color;
	// type
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "type_id")
	private Type type;
	// size
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
	@JoinTable(name = "tbl_size_product", joinColumns = @JoinColumn(name = "productID"), inverseJoinColumns = @JoinColumn(name = "sizeID"))

	private Set<Size> sizes = new HashSet<Size>();

	public Set<Size> getSizes() {
		return sizes;
	}

	public void setSizes(Set<Size> sizes) {
		this.sizes = sizes;
	}

	public void addSize(Size size) {
		size.getProducts().add(this);
		sizes.add(size);
	}

	public void deleteSize(Size size) {
		size.getProducts().remove(this);
		sizes.remove(size);
	}

	// product and sale order

	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
	Set<SaleOrderProduct> orderProducts = new HashSet<SaleOrderProduct>();

	public void addSaleOrderProduct(SaleOrderProduct saleOrderProduct) {
		orderProducts.add(saleOrderProduct);
		saleOrderProduct.setProduct(this);
	}

	public void deleteSaleOrderProduct(SaleOrderProduct saleOrderProduct) {
		orderProducts.remove(saleOrderProduct);
		saleOrderProduct.setProduct(null);
	}

	// images
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
	private Set<ProductImage> productImages = new HashSet<ProductImage>();

	public Set<ProductImage> getProductImages() {
		return productImages;
	}

	public void setProductImages(Set<ProductImage> productImages) {
		this.productImages = productImages;
	}

	public void addProductImage(ProductImage productImg) {
		productImages.add(productImg);
		productImg.setProduct(this);
	}

	public void deleteProductImage(ProductImage productImg) {
		productImages.remove(productImg);
		productImg.setProduct(null);
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public Color getColor() {
		return color;
	}

	public void setColor(Color color) {
		this.color = color;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public Product() {

	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public BigDecimal getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(BigDecimal productPrice) {
		this.productPrice = productPrice;
	}

	public BigDecimal getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getManufactory() {
		return manufactory;
	}

	public void setManufactory(String manufactory) {
		this.manufactory = manufactory;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Boolean getIsHot() {
		return isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}

}
