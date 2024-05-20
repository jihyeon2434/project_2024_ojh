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
    
    
 // 권한을 검사하는 쿼리
    @Select("""
        SELECT canWriteArticle
        FROM payment
        WHERE memberId = #{memberId} AND shopName = #{shopName} AND canWriteArticle = 1
        """)
    Boolean canWriteArticle(int memberId, String shopName);
    
    // 권한을 사용했다는 표시를 업데이트
    @Update("""
        UPDATE payment
        SET canWriteArticle = 0
        WHERE memberId = #{memberId} AND shopName = #{shopName}
        """)
    void useArticleWritePermission(int memberId, String shopName);
}