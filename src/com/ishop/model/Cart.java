package com.ishop.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "Cart")
public class Cart implements Serializable {
	
	private static final long serialVersionUID = 4705768177687620031L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long cartId;
	
	@OneToMany(mappedBy = "cart", cascade = CascadeType.ALL, 
			fetch = FetchType.EAGER, orphanRemoval = true)
	private List<CartItem> cartItems;
	
	private double grandTotal;
	
	@Transient
	private int totalQuantity;

	// ---------- Getters and Setters -----------
	
	public Long getCartId() {
		return cartId;
	}

	public void setCartId(Long cartId) {
		this.cartId = cartId;
	}

	public List<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public double getGrandTotal() {
		double total = 0.0;
		for (CartItem item : cartItems) {
			total += item.getTotalPrice();
		}
		return total;
	}

	public int getTotalQuantity() {
		int totalQuantity = 0;
		for (CartItem item : cartItems) {
			totalQuantity += item.getQuantity();
		}
		return totalQuantity;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cartId == null) ? 0 : cartId.hashCode());
		result = prime * result + ((cartItems == null) ? 0 : cartItems.hashCode());
		long temp;
		temp = Double.doubleToLongBits(grandTotal);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cart other = (Cart) obj;
		if (cartId == null) {
			if (other.cartId != null)
				return false;
		} else if (!cartId.equals(other.cartId))
			return false;
		if (cartItems == null) {
			if (other.cartItems != null)
				return false;
		} else if (!cartItems.equals(other.cartItems))
			return false;
		if (Double.doubleToLongBits(grandTotal) != Double.doubleToLongBits(other.grandTotal))
			return false;
		return true;
	}
	

}
