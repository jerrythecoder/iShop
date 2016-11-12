package com.ishop.model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Cart")
public class Cart implements Serializable {
	
	private static final long serialVersionUID = 4705768177687620031L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long cartId;
	
	@OneToMany(mappedBy = "cart", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<CartItem> cartItems;
	
	private double grandTotal;

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
		return grandTotal;
	}

	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}
	
	
	
	
	
	
	
	
	
	/* Legacy code
	
	private String cartId;
	
	private Map<String, CartItem> cartItems;
	
	private double grandTotal;
	
	private Cart() {
		this.cartItems = new HashMap<>();
		this.grandTotal = 0;
	}
	
	public Cart(String id) {
		this();
		this.cartId = id;
	}

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public Map<String, CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(Map<String, CartItem> cartItem) {
		this.cartItems = cartItem;
	}

	public double getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}
	
	
	//---------- Cart Functionalities ------------
	
	private void updateGrandTotal() {
		this.grandTotal = 0;
		for (CartItem item : this.cartItems.values()) {
			this.grandTotal += item.getTotalPrice();
		}
	}
	
	public void addCartItem (CartItem item) {
		String productId = item.getProduct().getIdAsString();
		
		if (this.cartItems.containsKey(productId)) {
			int existingQuantity = this.cartItems.get(productId).getQuantity();
			this.cartItems.get(productId).setQuantity(existingQuantity + item.getQuantity());
		} else {
			this.cartItems.put(productId, item);
		}
		
		this.updateGrandTotal();
	}
	
	public void removeCartItem(CartItem item) {
		String productId = item.getProduct().getIdAsString();
		this.cartItems.remove(productId);
		
		this.updateGrandTotal();
	}
	
	*/

}
