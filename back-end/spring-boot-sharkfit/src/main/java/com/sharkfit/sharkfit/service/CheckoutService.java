package com.sharkfit.sharkfit.service;

import com.sharkfit.sharkfit.dto.Paiement;
import com.sharkfit.sharkfit.dto.PaiementResponse;
import com.sharkfit.sharkfit.dto.PaymentInfo;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;

public interface CheckoutService {
    PaiementResponse placeOrder (Paiement paiement);

    PaymentIntent createPaymentIntent (PaymentInfo paymentInfo) throws StripeException;
}
