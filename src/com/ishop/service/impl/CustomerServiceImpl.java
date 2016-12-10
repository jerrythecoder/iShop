package com.ishop.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ishop.dao.CustomerOrderDao;
import com.ishop.exceptions.CustomerIdMismatchException;
import com.ishop.exceptions.InvalidCustomerAddressCategoryException;
import com.ishop.exceptions.NullEntityObjectException;
import com.ishop.model.CartItem;
import com.ishop.model.Customer;
import com.ishop.model.CustomerAddress;
import com.ishop.model.CustomerOrder;
import com.ishop.model.OrderItem;
import com.ishop.service.CartService;
import com.ishop.service.CustomerService;
import com.ishop.service.UserService;

/**
 * Customer service implementation.
 * 
 * @author Jerry
 *
 */
@Service("customerService")
public class CustomerServiceImpl extends GenericServiceImpl<Customer, Long> 
								implements CustomerService {
	
	private static final int BILLING_ADDRESS_CAT_CODE = 0;
	private static final int SHIPPING_ADDRESS_CAT_CODE = 1;
	private static final int ORDER_ADDRESS_CAT_CODE = 2;
	
	private static final String ORDER_STATUS_NEW = "New Order";
	
	private static final String ERROR_CUSTOMER_NOT_FOUND = 
			"Customer was not found, username: %s";
	private static final String ERROR_INVALID_ADDRESS_CODE =
			"Invalid customer address category code, expected code: %s";
	private static final String ERROR_CUSTOMER_ORDER_NOT_FOUND = 
			"Customer order was not found, order ID: %s";
	private static final String ERROR_CUSTOMER_ID_MISMATCH = 
			"Customer ID mismatch, expected ID: %s, actual ID: %s";
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private CustomerOrderDao customerOrderDao;
	

	@Override
	public Customer getNonNullCustomer(String username) throws NullEntityObjectException {
		Customer customer = userService.getCustomer(username);
		if (customer == null) {
			throw new NullEntityObjectException(String.format(ERROR_CUSTOMER_NOT_FOUND, username));
		}
		return customer;
	}
	
	@Override
	public CustomerAddress getOrCreateBillingAddress(String username) 
			throws NullEntityObjectException {
		
		CustomerAddress address = this.getNonNullCustomer(username).getBillingAddress();
		if (address == null) {
			address = new CustomerAddress();
			// Set category code as 0 to indicate this is a billing address.
			address.setCategoryCode(BILLING_ADDRESS_CAT_CODE);
		}
		return address;
	}

	@Override
	public CustomerAddress getOrCreateShippingAddress(String username) 
			throws NullEntityObjectException {
		CustomerAddress address = this.getNonNullCustomer(username).getShippingAddress();
		if (address == null) {
			address = new CustomerAddress();
			// Set category code as 1 to indicate this is a shipping address.
			address.setCategoryCode(SHIPPING_ADDRESS_CAT_CODE);
		}
		return address;
	}

	@Override
	public void saveBillingAddress(String username, CustomerAddress billingAddress)
			throws NullEntityObjectException, InvalidCustomerAddressCategoryException {
		
		// Checking address category code.
		if (billingAddress.getCategoryCode() != BILLING_ADDRESS_CAT_CODE) {
			throw new InvalidCustomerAddressCategoryException(
					String.format(ERROR_INVALID_ADDRESS_CODE, BILLING_ADDRESS_CAT_CODE));
		}
		
		Customer customer = this.getNonNullCustomer(username);
		customer.setBillingAddress(billingAddress);
		this.update(customer);
	}

	@Override
	public void saveShippingAddress(String username, CustomerAddress shippingAddress)
			throws NullEntityObjectException, InvalidCustomerAddressCategoryException {
		
		// Checking address category code.
		if (shippingAddress.getCategoryCode() != SHIPPING_ADDRESS_CAT_CODE) {
			throw new InvalidCustomerAddressCategoryException(
					String.format(ERROR_INVALID_ADDRESS_CODE, SHIPPING_ADDRESS_CAT_CODE));
		}
		
		Customer customer = this.getNonNullCustomer(username);
		customer.setShippingAddress(shippingAddress);
		this.update(customer);
	}

	@Override
	public CustomerAddress getBillingAddress(String username) throws NullEntityObjectException {
		return this.getNonNullCustomer(username).getBillingAddress();
	}

	@Override
	public CustomerAddress getShippingAddress(String username) throws NullEntityObjectException {
		return this.getNonNullCustomer(username).getShippingAddress();
	}
	
	/**
	 * Utility method that converts cart items to order items.
	 */
	private List<OrderItem> convertCartItemsToOrderItems(Customer customer, CustomerOrder order) {
		
		// Create a new OrderItem List.
		ArrayList<OrderItem> orderItemList = new ArrayList<>();
		
		for (CartItem cartItem : customer.getCart().getCartItems()) {
			// Create a new OrderItem and populate all fields from the data of CartItem.
			OrderItem orderItem = new OrderItem();
			
			orderItem.setCustomerOrder(order);
			orderItem.setItemProductId(cartItem.getProduct().getProductId());
			orderItem.setItemProductName(cartItem.getProduct().getProductName());
			orderItem.setItemProductPrice(cartItem.getProduct().getProductPrice());
			orderItem.setItemProductQuantity(cartItem.getQuantity());
			// Price deduction is a dummy data for now.
			orderItem.setItemPriceDeduction(0.0);
			orderItem.setItemTotalPrice(cartItem.getTotalPrice());
			
			// Save OrderItem to list.
			orderItemList.add(orderItem);
		}
		
		return orderItemList;
	}
	
	/**
	 * Utility method that gets an OrderAddress copy of CustomerAddress object
	 * from another category.
	 */
	private CustomerAddress getOrderAddressCopy(CustomerAddress address) {
		
		// Create a new order address and set the appropriate category code.
		CustomerAddress orderAddress = new CustomerAddress();
		orderAddress.setCategoryCode(ORDER_ADDRESS_CAT_CODE);
		
		// Copy other fields.
		orderAddress.setApartmentNumber(address.getApartmentNumber());
		orderAddress.setStreetName(address.getStreetName());
		orderAddress.setCity(address.getCity());
		orderAddress.setState(address.getState());
		orderAddress.setCountry(address.getCountry());
		orderAddress.setZipCode(address.getZipCode());
		
		return orderAddress;
	}
	
	/**
	 * Utility method that generate a new CustomerOrder object from current 
	 * Customer's data (profile, shopping cart, addresses etc.)
	 */
	private CustomerOrder createCustomerOrderObject(Customer customer) {
		
		// Create a new order.
		CustomerOrder order = new CustomerOrder();
		
		// Bind order to the current customer.
		order.setCustomer(customer);
		
		// Set current date and time to be order creation time.
		order.setCreationTime(new Date());
		
		// Populate order items.
		order.setOrderItems(this.convertCartItemsToOrderItems(customer, order));
		
		order.setGrandTotal(customer.getCart().getGrandTotal());
		order.setRecipientFirstName(customer.getCustomerFirstName());
		order.setRecipientLastName(customer.getCustomerLastName());
		
		order.setBillingAddress(this.getOrderAddressCopy(customer.getBillingAddress()));
		order.setShippingAddress(this.getOrderAddressCopy(customer.getShippingAddress()));
		
		// Set status to new.
		order.setOrderStatus(ORDER_STATUS_NEW);
		
		return order;
	}
	
	@Override
	public Long saveCustomerOrder(String username) throws NullEntityObjectException {
		Customer customer = this.getNonNullCustomer(username);
		
		// Generate new order object.
		CustomerOrder order = this.createCustomerOrderObject(customer);
		// Persist the order.
		this.customerOrderDao.add(order);
		
		// Clear cart after new order persisted.
		this.cartService.clearCart(username);
		
		return order.getOrderId();
	}

	@Override
	public CustomerOrder getNonNullCustomerOrder(String username, Long orderId)
			throws NullEntityObjectException, CustomerIdMismatchException {
		
		CustomerOrder order = this.customerOrderDao.find(orderId);
		
		if (order == null) {
			throw new NullEntityObjectException(
					String.format(ERROR_CUSTOMER_ORDER_NOT_FOUND, orderId));
		}
		
		// Verify if the order being accessed has a matching customer ID of the current user.
		Long expectedId = this.userService.getCustomer(username).getCustomerId();
		Long actualId = order.getCustomer().getCustomerId();
		
		if (actualId != expectedId) {
			throw new CustomerIdMismatchException(
					String.format(ERROR_CUSTOMER_ID_MISMATCH, expectedId, actualId));
		}
		
		return order;
	}

	@Override
	public int getCustomerOrderTotalCount(String username) throws NullEntityObjectException {
		return this.getNonNullCustomer(username).getOrderList().size();
	}
	
	@Override
	public int getCustomerOrderPageCount(String username, int pageSize) 
			throws NullEntityObjectException {
		if (pageSize <= 0) {
			throw new IllegalArgumentException("Page size must be greater than 0.");
		}
		return (this.getCustomerOrderTotalCount(username) / pageSize) + 1;
	}

	@Override
	public List<CustomerOrder> getCustomerOrderPagedList(String username, int pageNumber, int pageSize) 
			throws NullEntityObjectException {
		if (pageNumber < 1 || pageNumber > this.getCustomerOrderPageCount(username, pageSize)) {
			throw new IllegalArgumentException("Invalid page number: " + pageNumber);
		}
		
		// Index of first row.
		int first = (pageNumber - 1) * pageSize;
		
		List<CustomerOrder> allOrders = this.getNonNullCustomer(username).getOrderList();
		
		// Determine whether index is out of bound.
		int maxIndex = allOrders.size() > first + pageSize ? first + pageSize : allOrders.size();
		
		return allOrders.subList(first, maxIndex);
	}

}
