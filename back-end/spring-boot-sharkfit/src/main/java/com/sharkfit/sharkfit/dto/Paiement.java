package com.sharkfit.sharkfit.dto;

import com.sharkfit.sharkfit.entity.Address;
import com.sharkfit.sharkfit.entity.Customer;
import com.sharkfit.sharkfit.entity.Order;
import com.sharkfit.sharkfit.entity.OrderItem;
import lombok.Data;

import java.util.Set;

@Data
public class Paiement {

    private Customer customer;
    private Address shippingAddress;
    private Address billingAddress;
    private Order order;
    private Set<OrderItem> orderItems;
}
