package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MemberRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

@Service
public class MemberService {
	@Autowired
	private MemberRepository memberRepository;

	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
		
	}
	public ResultData<Integer> join(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email, String memberType, String companyName) {
		Member existsMember = getMemberByLoginId(loginId);

		if (existsMember != null) {
			return ResultData.from("F-7", Ut.f("이미 사용중인 아이디(%s)입니다", loginId));
		}

		existsMember = getMemberByNameAndEmail(name, email);

		if (existsMember != null) {
			return ResultData.from("F-8", Ut.f("이미 사용중인 이름(%s)과 이메일(%s)입니다", name, email));
		}

		if (!Ut.isValidEmail(email)) {
			return ResultData.from("F-9", "이메일 형식이 올바르지 않습니다.");
		}

		if (!Ut.isValidPassword(loginPw)) {
			return ResultData.from("F-10", "비밀번호는 최소 8자 이상, 대문자, 소문자, 숫자를 포함해야 합니다.");
		}

		memberRepository.join(loginId, loginPw, name, nickname, cellphoneNum, email, memberType, companyName);
		int id = memberRepository.getLastInsertId();

		return ResultData.from("S-1", "회원가입이 완료되었습니다.", "id", id);
	}


	private Member getMemberByNameAndEmail(String name, String email) {
		return memberRepository.getMemberByNameAndEmail(name, email);
	}

	public Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberByLoginId(loginId);
	}

	public Member getMember(int id) {
		return memberRepository.getMember(id);
	}

	public ResultData modify(int loginedMemberId, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {
		memberRepository.modify(loginedMemberId, loginPw, name, nickname, cellphoneNum, email);
		return ResultData.from("S-1", "회원정보 수정 완료");
	}

	public ResultData modifyWithoutPw(int loginedMemberId, String name, String nickname, String cellphoneNum,
			String email) {
		memberRepository.modifyWithoutPw(loginedMemberId, name, nickname, cellphoneNum, email);
		return ResultData.from("S-1", "회원정보 수정 완료");
	}
	public Member getMemberById(int memberId) {
		// TODO Auto-generated method stub
		return memberRepository.getMemberById(memberId);
	}
	public ResultData withdrawMember(int memberId) {
	    int affectedRows = memberRepository.updateDelStatus(memberId, 1); // delStatus를 1로 설정
	    if (affectedRows == 0) {
	        return ResultData.from("F-1", "회원 탈퇴에 실패했습니다.");
	    }
	    return ResultData.from("S-1", "회원 탈퇴에 성공했습니다.");
	}
	public String getLoginIdByEmail(String email) {
		return memberRepository.getLoginIdByEmail(email);
	}
	public String sendResetPasswordEmail(String email) {
		return memberRepository.getLoginIdByEmail(email);
	}
	
	 public String resetPasswordByEmail(String email) {
	        // 해당 이메일로 등록된 사용자가 있는지 확인
	        String loginId = memberRepository.getLoginIdByEmail(email);
	        if (loginId != null) {
	            // 새로운 임시 비밀번호 생성
	            String newPassword = generateRandomPassword();
	            // 비밀번호 업데이트
	            memberRepository.updatePasswordByEmail(email, newPassword);
	            return newPassword;
	        } else {
	            // 해당 이메일로 등록된 계정이 없을 경우 null 반환
	            return null;
	        }
	    }

	    // 임시 비밀번호 생성 메서드
	    private String generateRandomPassword() {
	        // 임시 비밀번호 생성 로직 구현
	        return "temporaryPassword123"; // 임시로 고정된 값 사용, 실제로는 랜덤으로 생성되어야 함
	    }


}