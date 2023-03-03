package com.devpro.finalProjectJavaweb21.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_contact")
public class Contact extends BaseEntity {
	@Column(name = "full_name", length = 45, nullable = false)
	private String fullName;
	@Column(name = "email", length = 45, nullable = false)
	private String email;
	@Column(name = "request_type", length = 100, nullable = true)
	private String requestType;
	@Column(name = "message", length = 1000, nullable = false)
	private String message;

	public Contact() {
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRequestType() {
		return requestType;
	}

	public void setRequestType(String requestType) {
		this.requestType = requestType;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
