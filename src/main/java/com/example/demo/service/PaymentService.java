package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.repository.PaymentRepository;
import com.example.demo.vo.Payment;

@Service
public class PaymentService {

    @Autowired
    private PaymentRepository paymentRepository;

    
    public void savePayment(Payment payment) {
        paymentRepository.save(payment);
    }


	public List<Payment> getPaymentsByMemberId(int memberId) {
		return paymentRepository.getPaymentsByMemberId(memberId);
	}

}
