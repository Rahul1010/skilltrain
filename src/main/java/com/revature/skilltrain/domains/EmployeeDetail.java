package com.revature.skilltrain.domains;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "employee_details")
@Data
public class EmployeeDetail implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 882150516920388956L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;
	
	@Column(name = "code", nullable = false, unique = true)
	private String code;
	
	@Column(name = "name", nullable = false)
	private String name;
	
	@Column(name = "roles_id", nullable = false)
	private int rolesId;
	
	@Column(name = "email_id", nullable = false, unique = true)
	private String emailid;
	
	@Column(name = "phone", nullable = false, unique = true)
	private String phone;
	
	@Column(name = "date_of_joining", nullable = false)
	private Date dateOfJoining;
	
	@Column(name = "is_active", nullable = false)
	private boolean isActive;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getRolesId() {
		return rolesId;
	}

	public void setRolesId(int rolesId) {
		this.rolesId = rolesId;
	}

	public String getEmailid() {
		return emailid;
	}

	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getDateOfJoining() {
		return dateOfJoining;
	}

	public void setDateOfJoining(Date dateOfJoining) {
		this.dateOfJoining = dateOfJoining;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}	
	
	
	
}
