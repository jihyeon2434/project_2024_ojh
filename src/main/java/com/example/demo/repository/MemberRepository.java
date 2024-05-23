package com.example.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Member;

@Mapper
public interface MemberRepository {
	// 로그인 아이디로 회원 정보 가져오기
	@Select("""
			SELECT *
			FROM `member`
			WHERE loginId = #{loginId}
			""")
	public Member getMemberByLoginId(String loginId);

	 // 이름과 이메일로 회원 정보 가져오기
	@Select("""
			SELECT *
			FROM `member`
			WHERE name = #{name}
			AND email = #{email}
			""")
	public Member getMemberByNameAndEmail(String name, String email);

	// 회원 가입 정보 추가
	@Insert("""
	        INSERT INTO
	        `member` SET
	        regDate = NOW(),
	        updateDate = NOW(),
	        loginId = #{loginId},
	        loginPw = #{loginPw},
	        `name` = #{name},
	        nickname = #{nickname},
	        cellphoneNum = #{cellphoneNum},
	        email = #{email},
	        memberType = #{memberType},
	        companyName = #{companyName}
	        """)
	public void join(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email, String memberType, String companyName);

	// 마지막 삽입된 회원 정보의 ID 가져오기
	@Select("SELECT LAST_INSERT_ID()")
	public int getLastInsertId();

	 // ID로 회원 정보 가져오기
	@Select("SELECT * FROM `member` WHERE id = #{id}")
	public Member getMember(int id);

	 // 회원 정보 수정
	@Update("""
			<script>
			UPDATE `member`
			<set>
				<if test="loginPw != null">
					loginPw = #{loginPw},
				</if>
				<if test="name != null">
					name = #{name},
				</if>
				<if test="nickname != null">
					nickname = #{nickname},
				</if>
				<if test="cellphoneNum != null">
					cellphoneNum = #{cellphoneNum},
				</if>
				<if test="email != null">
					email = #{email},
				</if>
				updateDate= NOW()
			</set>
			WHERE id = #{loginedMemberId}
			</script>
			""")
	public void modify(int loginedMemberId, String loginPw, String name, String nickname, String cellphoneNum,
			String email);

	// 비밀번호를 포함하지 않은 회원 정보 수정
	@Update("""
			<script>
			UPDATE `member`
			<set>
				<if test="name != null">
					name = #{name},
				</if>
				<if test="nickname != null">
					nickname = #{nickname},
				</if>
				<if test="cellphoneNum != null">
					cellphoneNum = #{cellphoneNum},
				</if>
				<if test="email != null">
					email = #{email},
				</if>
				updateDate= NOW()
			</set>
			WHERE id = #{loginedMemberId}
			</script>
			""")
	public void modifyWithoutPw(int loginedMemberId, String name, String nickname, String cellphoneNum, String email);

	
	// ID로 회원 정보 가져오기
	@Select("""
			SELECT *
			FROM `member`
			WHERE id = #{memberId}
			""")
	public Member getMemberById(int memberId);


	// 회원 삭제 상태 업데이트
	@Update("""
	        UPDATE member
	        SET delStatus = #{delStatus}, delDate = NOW()
	        WHERE id = #{memberId}
	        """)
	int updateDelStatus(int memberId, int delStatus);
	
	 // 이메일로 비밀번호 가져오기
	@Select("""
	        SELECT loginPw
	        FROM `member`
	        WHERE email = #{email}
	        """)
	public String getPasswordByEmail(String email);
	
	   // 이메일로 로그인 아이디 가져오기
	@Select("""
	        SELECT loginId
	        FROM `member`
	        WHERE email = #{email}
	        """)
	public String getLoginIdByEmail(String email);

	/*
	 * public void sendResetPasswordEmail(String email);
	 * 
	 * @Update("UPDATE member SET loginPw = #{newPassword} WHERE email = #{email}")
	 * public void updatePasswordByEmail(String email, String newPassword);
	 */

}