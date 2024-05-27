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

 // 결제 정보 저장
    public void savePayment(Payment payment) {
        paymentRepository.save(payment);
    }

    // 특정 회원의 결제 목록 가져오기
	public List<Payment> getPaymentsByMemberId(int memberId) {
		return paymentRepository.getPaymentsByMemberId(memberId);
	}

	  // 특정 회원이 특정 상점에서 기사 작성 가능한지 여부 확인
	public Boolean canWriteArticle(int memberId, String shopName) {
		return paymentRepository.canWriteArticle(memberId, shopName);
	}

	   // 기사 작성 권한 사용 처리
	public void useArticleWritePermission(int memberId, String shopName) {
		paymentRepository.useArticleWritePermission(memberId, shopName);
		
	}

}
