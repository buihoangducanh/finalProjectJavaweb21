package com.devpro.finalProjectJavaweb21.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;

@Entity
@Table(name = "tbl_role")
public class Role extends BaseEntity implements GrantedAuthority {
	@Column(name = "name", length = 45, nullable = false)
	private String name;
	@Column(name = "description", length = 45, nullable = false)
	private String description;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "roles")
	private Set<User> users = new HashSet<User>();

	public void addUser(User user) {
		user.getRoles().add(this);
		users.add(user);
	}

	public void deleteUser(User user) {
		user.getRoles().remove(this);
		users.remove(user);
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String getAuthority() {
		// TODO Auto-generated method stub
		return this.name;
	}

}
