package com.example.demo.controller;

import com.example.demo.service.PaymentService;
import com.example.demo.service.PaymentService;
import com.example.demo.vo.Payment;
import com.example.demo.vo.Rq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrPaymentController {

    @Autowired
    private Rq rq;

    @Autowired
    private PaymentService paymentService;

    // 액션 메서드
    // 결제 성공 시 처리하는 메서드
    @GetMapping("/payment/success")
    public String handlePaymentSuccess(HttpServletRequest request) {
        int loginedMemberId = rq.getLoginedMemberId();
        String shopName = request.getParameter("shopName"); // 쿼리 파라미터에서 shopName 추출

        Payment payment = new Payment();
        payment.setMemberId(loginedMemberId);
        payment.setAmount(Integer.parseInt(request.getParameter("amount")));// 금액 설정
        payment.setShopName(shopName); // shopName 설정
        payment.setPaymentDate(request.getParameter("paymentDate"));// 결제일 설정
        payment.setPaymentStatus(request.getParameter("paymentStatus"));// 결제 상태 설정

        paymentService.savePayment(payment);// 결제 정보 저장

        return "redirect:/usr/member/myReservation";// 예약 페이지로 리다이렉트
    }

}