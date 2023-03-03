package com.devpro.finalProjectJavaweb21.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_subcriber")
public class Subcriber extends BaseEntity {
	@Column(name = "suber_email", length = 60, nullable = false)
	private String suber_email;

	public String getSuber_email() {
		return suber_email;
	}

	public void setSuber_email(String suber_email) {
		this.suber_email = suber_email;
	}

}
