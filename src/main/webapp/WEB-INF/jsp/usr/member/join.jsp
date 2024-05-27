<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="JOIN"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.big-outer-box {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh; /* 화면 세로 중앙 정렬 */
}

.outer-box {
	width: 700px; /* 수정된 너비 */
	height: 800px;
	display: flex;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	border-radius: 8px;
	background: rgba(239, 231, 229, 0.25); /* 투명도를 25%로 설정 */
}

.outer-container {
	width: 1000px; /* 수정된 너비 */
	display: flex;
	justify-content: center;
	padding: 20px;
}

.join-box {
	display: block;
	width: 350px; /* 조정된 너비 */
	border-radius: 8px; /* 테두리를 둥글게 만듭니다. */
	padding: 20px; /* 패딩 추가 */
	background: rgba(239, 231, 229, 0.25);
}

.join-box input[type="text"],.join-box input[type="password"],.join-box input[type="email"],
.join-box select {
    background: rgba(239, 231, 229, 0.25);
    /* join-box의 input[type="text"]와 select 태그 배경색 변경 */
}


.submit-btn {
	text-align: center;
	margin-top: 20px;
}

.btn {
	width: 150px; /* 버튼의 너비를 150px로 조정 */
}

table>tbody>tr>td {
	height: 70px;
}

table>tbody>tr>td .input {
	font-size: small;
}

table>tbody>tr>th {
	font-size: small;
}

th {
	width: 100px; /* 원하는 너비로 조정 */
}
</style>


<section class="big-outer-box mt-8 text-xl px-4 centered">
	<div class="outer-box">
		<div class="outer-container">
			<div class="mx-auto">
				<form id="joinForm" action="../member/doJoin" method="POST">
					<table class="join-box">
						<tbody>
							<tr>
								<th>아이디</th>
								<td><input type="text" placeholder="" autocomplete="off"
									class="input input-bordered input-sm w-full max-w-xs" name="loginId" required /></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" placeholder="" autocomplete="off"
									class="input input-bordered input-sm w-full max-w-xs" name="loginPw" required /></td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td><input type="password" placeholder="" autocomplete="off"
									class="input input-bordered input-sm w-full max-w-xs" name="loginPwCheck" required /></td>
							</tr>
							<tr>
								<th>회원종류</th>
								<td><select name="memberType" id="memberType" class="input input-bordered input-sm w-full max-w-xs" required>
										<option value="">선택하세요</option>
										<option value="업체">업체</option>
										<option value="고객">고객</option>
								</select></td>
							</tr>
							<tr>
								<th>업체명</th>
								<td><input type="text" placeholder="" autocomplete="off"
									class="input input-bordered input-sm w-full max-w-xs" name="companyName" id="companyName" disabled /></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" placeholder="" autocomplete="off"
									class="input input-bordered input-sm w-full max-w-xs" name="name" required /></td>
							</tr>
							<tr>
								<th>닉네임</th>
								<td><input type="text" placeholder="" autocomplete="off"
									class="input input-bordered input-sm w-full max-w-xs" name="nickname" required /></td>
							</tr>
							<tr>
								<th class="text-xs">전화번호</th>
								<td><input type="text" placeholder="" autocomplete="off"
									class="input input-bordered input-sm w-full max-w-xs" name="cellphoneNum" required /></td>
							</tr>
							<tr>
								<th class="text-xs">이메일</th>
								<td><input type="email" placeholder="" autocomplete="off"
									class="input input-bordered input-sm w-full max-w-xs" name="email" required /></td>
							</tr>
						</tbody>
					</table>
					<div class="submit-btn">
						<input class="btn btn-outline" type="submit" value="가입" />
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<script>
document.addEventListener("DOMContentLoaded", function() {
    var memberTypeSelect = document.getElementById('memberType');
    var companyNameInput = document.getElementById('companyName');

    memberTypeSelect.addEventListener('change', function() {
        if (this.value === "업체") {
            companyNameInput.disabled = false;
        } else {
            companyNameInput.disabled = true;
            companyNameInput.value = '';
        }
    });

    var joinForm = document.getElementById('joinForm');
    joinForm.addEventListener('submit', function(event) {
        var email = joinForm.email.value;
        var loginPw = joinForm.loginPw.value;
        var loginPwCheck = joinForm.loginPwCheck.value;
        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!emailPattern.test(email)) {
            alert('이메일 형식이 올바르지 않습니다.');
            event.preventDefault();
            return;
        }

        if (loginPw.length < 8) {
            alert('비밀번호는 최소 8자 이상이어야 합니다.');
            event.preventDefault();
            return;
        }

        if (!/[A-Z]/.test(loginPw)) {
            alert('비밀번호에는 최소 하나의 대문자가 포함되어야 합니다.');
            event.preventDefault();
            return;
        }

        if (!/[a-z]/.test(loginPw)) {
            alert('비밀번호에는 최소 하나의 소문자가 포함되어야 합니다.');
            event.preventDefault();
            return;
        }

        if (!/[0-9]/.test(loginPw)) {
            alert('비밀번호에는 최소 하나의 숫자가 포함되어야 합니다.');
            event.preventDefault();
            return;
        }

        if (loginPw !== loginPwCheck) {
            alert('비밀번호가 일치하지 않습니다.');
            event.preventDefault();
        }
    });
});
</script>