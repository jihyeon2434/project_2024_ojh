package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


import com.example.demo.vo.Payment;

@Mapper
public interface PaymentRepository {

    @Insert("""
            INSERT INTO payment (memberId, amount, shopName, paymentDate, paymentStatus)
            VALUES (#{memberId}, #{amount}, #{shopName}, Now(), 1)
            """)
    void save(Payment payment);

    
    @Select("""
    		SELECT *
    		FROM payment
    		WHERE memberId = #{memberId}
    		""")
	List<Payment> getPaymentsByMemberId(int memberId);
}