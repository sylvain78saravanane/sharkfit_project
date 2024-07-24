package com.sharkfit.sharkfit.service;

import com.sharkfit.sharkfit.dao.CustomerRepository;
import com.sharkfit.sharkfit.dto.Paiement;
import com.sharkfit.sharkfit.dto.PaiementResponse;
import com.sharkfit.sharkfit.dto.PaymentInfo;
import com.sharkfit.sharkfit.entity.Customer;
import com.sharkfit.sharkfit.entity.Order;
import com.sharkfit.sharkfit.entity.OrderItem;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class CheckoutServiceImpl implements CheckoutService {

    private CustomerRepository customerRepository;

    public CheckoutServiceImpl (CustomerRepository customerRepository,
                                @Value("${stripe.key.secret}") String secretKey) {
        this.customerRepository = customerRepository;
        Stripe.apiKey = secretKey;
    }
    @Override
    @Transactional
    public PaiementResponse placeOrder(Paiement paiement) {
        Order order = paiement.getOrder();

        String orderTrackingNumber = generateOrderTrackingNumber();
        order.setOrderTrackingNumber(orderTrackingNumber);

        Set<OrderItem> orderItems = paiement.getOrderItems();
        orderItems.forEach(item -> order.add(item));

        order.setBillingAddress(paiement.getBillingAddress());
        order.setShippingAddress(paiement.getShippingAddress());

        Customer customer = paiement.getCustomer();

        String theEmail = customer.getEmail();

        Customer customerFromDB = customerRepository.findByEmail(theEmail);

        if(customerFromDB !=null) {
            customer = customerFromDB;
        }

        customer.add(order);

        customerRepository.save(customer);

        return new PaiementResponse(orderTrackingNumber);
    }

    @Override
    public PaymentIntent createPaymentIntent(PaymentInfo paymentInfo) throws StripeException {

        List<String> paymentMethodTypes = new ArrayList<>();
        paymentMethodTypes.add("card");

        Map<String, Object> params = new HashMap<>();
        params.put("amount", paymentInfo.getAmount());
        params.put("currency", paymentInfo.getCurrency());
        params.put("payment_method_types", paymentMethodTypes);
        params.put("description","SharkFit Achats Boutique");
        params.put("receipt_email", paymentInfo.getReceiptEmail());

        return PaymentIntent.create(params);
    }

    private String generateOrderTrackingNumber() {

        //generer un UUID (UUID = Universally Unique IDentifier)
        // Usage de UUID version 4 -> génere un UUID totalement aléatoire
        return UUID.randomUUID().toString();

    }
}


