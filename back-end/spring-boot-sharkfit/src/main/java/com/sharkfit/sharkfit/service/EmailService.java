package com.sharkfit.sharkfit.service;

public interface EmailService {

    void sendEmail(String to, String subject, String message);

}
