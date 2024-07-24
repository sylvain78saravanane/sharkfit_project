package com.sharkfit.sharkfit.controller;

import com.sharkfit.sharkfit.dto.Paiement;
import com.sharkfit.sharkfit.dto.PaiementResponse;
import com.sharkfit.sharkfit.dto.PaymentInfo;
import com.sharkfit.sharkfit.service.CheckoutService;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.logging.Logger;


@RestController
@RequestMapping("/api/checkout")
public class CheckoutController {

    private Logger logger = Logger.getLogger(getClass().getName());
    private CheckoutService checkoutService;

    public CheckoutController(CheckoutService checkoutService) {
        this.checkoutService = checkoutService;
    }

    @PostMapping("/paiement")
    public PaiementResponse placeOrder (@RequestBody Paiement paiement) {

        PaiementResponse paiementResponse = checkoutService.placeOrder(paiement);

        return paiementResponse;
    }

    @PostMapping("/payment-intent")
    public ResponseEntity<String> createPaymentIntent (@RequestBody PaymentInfo paymentInfo) throws StripeException {

        logger.info("paymentInfo.amount:" + paymentInfo.getAmount());
        PaymentIntent paymentIntent = checkoutService.createPaymentIntent(paymentInfo);

        String paymentStr = paymentIntent.toJson();

        return new ResponseEntity<>(paymentStr, HttpStatus.OK);
    }
}
