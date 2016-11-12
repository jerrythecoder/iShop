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
@Table(name = "ShippingAddress")
public class ShippingAddress implements Serializable {
	
	private static final long serialVersionUID = 989191150380037359L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long shippingAddressId;
	
	private String apartmentNumber;
	
	private String streetName;
	
	private String city;
	
	private String state;
	
	private String country;
	
	private String zipCode;
	

	// ---------- Getters and Setters -----------
	
	public Long getShippingAddressId() {
		return shippingAddressId;
	}

	public void setShippingAddressId(Long shippingAddressId) {
		this.shippingAddressId = shippingAddressId;
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
		return "ShippingAddress [apartmentNumber=" + apartmentNumber + ", streetName=" + streetName + ", city=" + city
				+ ", state=" + state + ", Country=" + country + ", zipCode=" + zipCode + "]";
	}
	
	
	

}
