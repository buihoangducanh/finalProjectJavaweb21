package com.devpro.finalProjectJavaweb21.model;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name = "tbl_user")
public class User extends BaseEntity implements UserDetails {

	@Column(name = "email", length = 45, nullable = false)
	private String username;

	@Column(name = "password", length = 100, nullable = false)
	private String password;

	@Column(name = "first_name", length = 45, nullable = false)
	private String first_name;

	@Column(name = "last_name", length = 45, nullable = false)
	private String last_name;

	@Column(name = "phone", length = 100, nullable = true)
	private String phone;

	@Column(name = "shipping_address", length = 1000, nullable = true)
	private String shipping_address;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "tbl_user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))

	private Set<Role> roles = new HashSet<Role>();

	public void addRole(Role role) {
		role.getUsers().add(this);
		roles.add(role);
	}

	public void deleteRole(Role role) {
		role.getUsers().remove(this);
		roles.remove(role);
	}

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	Set<SaleOrder> orders = new HashSet<SaleOrder>();

	public void addSaleOrder(SaleOrder saleOder) {
		orders.add(saleOder);
		saleOder.setUser(this);
	}

	public void deleteSaleOrder(SaleOrder saleOder) {
		orders.remove(saleOder);
		saleOder.setUser(null);
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return username;
	}

	public void setEmail(String username) {
		this.username = username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getShipping_address() {
		return shipping_address;
	}

	public void setShipping_address(String shipping_address) {
		this.shipping_address = shipping_address;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {

		return this.roles;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public String getUsername() {
		return username;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}
