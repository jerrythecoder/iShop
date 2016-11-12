package com.ishop.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "BillingAddress")
public class BillingAddress implements Serializable {

	private static final long serialVersionUID = -6091579459463730482L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long billingAddressId;
	
	private String apartmentNumber;
	
	private String streetName;
	
	private String city;
	
	private String state;
	
	private String country;
	
	private String zipCode;
	
	
	// ---------- Getters and Setters -----------

	public Long getBillingAddressId() {
		return billingAddressId;
	}

	public void setBillingAddressId(Long billingAddressId) {
		this.billingAddressId = billingAddressId;
	}

	public String getApartmentNumber() {
		return apartmentNumber;
	}

	public void setApartmentNumber(String apartmentNumber) {
		this.apartmentNumber = apartmentNumber;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	@Override
	public String toString() {
		return "BillingAddress [apartmentNumber=" + apartmentNumber + ", streetName=" + streetName + ", city=" + city
				+ ", state=" + state + ", Country=" + country + ", zipCode=" + zipCode + "]";
	}
	
	
	

}
