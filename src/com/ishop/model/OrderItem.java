package com.ishop.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "OrderItem")
public class OrderItem implements Serializable {
	
	private static final long serialVersionUID = -2386054434697866438L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long orderItemId;
	
	@ManyToOne
	@JoinColumn(name = "orderId")
	private CustomerOrder customerOrder;
	
	private Long itemProductId;
	
	private String itemProductName;
	
	private double itemProductPrice;
	
	private int itemProductQuantity;
	
	private double itemPriceDeduction;
	
	private double itemTotalPrice;

	
	public Long getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(Long orderItemId) {
		this.orderItemId = orderItemId;
	}

	public CustomerOrder getCustomerOrder() {
		return customerOrder;
	}

	public void setCustomerOrder(CustomerOrder customerOrder) {
		this.customerOrder = customerOrder;
	}

	public Long getItemProductId() {
		return itemProductId;
	}

	public void setItemProductId(Long itemProductId) {
		this.itemProductId = itemProductId;
	}

	public String getItemProductName() {
		return itemProductName;
	}

	public void setItemProductName(String itemProductName) {
		this.itemProductName = itemProductName;
	}

	public double getItemProductPrice() {
		return itemProductPrice;
	}

	public void setItemProductPrice(double itemProductPrice) {
		this.itemProductPrice = itemProductPrice;
	}

	public int getItemProductQuantity() {
		return itemProductQuantity;
	}

	public void setItemProductQuantity(int itemProductQuantity) {
		this.itemProductQuantity = itemProductQuantity;
	}

	public double getItemPriceDeduction() {
		return itemPriceDeduction;
	}

	public void setItemPriceDeduction(double itemPriceDeduction) {
		this.itemPriceDeduction = itemPriceDeduction;
	}

	public double getItemTotalPrice() {
		return itemTotalPrice;
	}

	public void setItemTotalPrice(double itemTotalPrice) {
		this.itemTotalPrice = itemTotalPrice;
	}
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((customerOrder == null) ? 0 : customerOrder.hashCode());
		long temp;
		temp = Double.doubleToLongBits(itemPriceDeduction);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((itemProductId == null) ? 0 : itemProductId.hashCode());
		result = prime * result + ((itemProductName == null) ? 0 : itemProductName.hashCode());
		temp = Double.doubleToLongBits(itemProductPrice);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + itemProductQuantity;
		temp = Double.doubleToLongBits(itemTotalPrice);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((orderItemId == null) ? 0 : orderItemId.hashCode());
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
		OrderItem other = (OrderItem) obj;
		if (customerOrder == null) {
			if (other.customerOrder != null)
				return false;
		} else if (!customerOrder.equals(other.customerOrder))
			return false;
		if (Double.doubleToLongBits(itemPriceDeduction) != Double.doubleToLongBits(other.itemPriceDeduction))
			return false;
		if (itemProductId == null) {
			if (other.itemProductId != null)
				return false;
		} else if (!itemProductId.equals(other.itemProductId))
			return false;
		if (itemProductName == null) {
			if (other.itemProductName != null)
				return false;
		} else if (!itemProductName.equals(other.itemProductName))
			return false;
		if (Double.doubleToLongBits(itemProductPrice) != Double.doubleToLongBits(other.itemProductPrice))
			return false;
		if (itemProductQuantity != other.itemProductQuantity)
			return false;
		if (Double.doubleToLongBits(itemTotalPrice) != Double.doubleToLongBits(other.itemTotalPrice))
			return false;
		if (orderItemId == null) {
			if (other.orderItemId != null)
				return false;
		} else if (!orderItemId.equals(other.orderItemId))
			return false;
		return true;
	}
	

}
