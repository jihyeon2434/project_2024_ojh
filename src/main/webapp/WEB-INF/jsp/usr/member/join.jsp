<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="가입"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.centered {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh; /* 화면 세로 중앙 정렬 */
}

.join-box {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	width: 350px; /* 조정된 너비 */
    
	border-collapse: collapse;
	border-radius: 8px; /* 테두리를 둥글게 만듭니다. */
	
	padding: 20px; /* 패딩 추가 */
	background: rgba(239, 231, 229, 0.50) !important;
}

.join-box input[type="text"] {
	background: rgba(239, 231, 229, 0.50) !important;
	/* join-box의 input 태그 배경색 변경 */
}



.outer-container {
	width: 700px; /* 수정된 너비 */
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	border-radius: 8px;
	overflow: hidden;
	background: rgba(239, 231, 229, 0.50);
	height: 600px;
}

.btn-submit {
	text-align: center;
	height: 50px;
	
}

.btn-submit input[type="submit"] {
	display: block; /* 인라인 요소를 블록 요소로 변환하여 가로 폭을 100%로 만듭니다. */
	width: 100%;
	max-width: 200px; /* 버튼의 최대 너비 설정 */
	margin: 0 auto; /* 가운데 정렬 */
	
}

.btn {
	
     width: 150px; /* 버튼의 너비를 150px로 조정 */
 
}

table>tbody>tr>td {
	height: 70px;
}
</style>


<section class="mt-8 text-xl px-4 centered">
	<div class="outer-container">
		<div class="outer-box">
			<div class="mx-auto">
				<form action="../member/doJoin" method="POST">
					<table class="join-box">
						<tbody>
							<tr>
								<th class="text-xs">아이디</th>
								<td><input class="input input-bordered input-primary w-full max-w-xs text-xs" autocomplete="off"
									type="text" placeholder="아이디를 입력해주세요" name="loginId" ! important; width: 100%;" /></td>
							</tr>
							<tr>
								<th class="text-xs">비밀번호</th>
								<td><input class="input input-bordered input-primary w-full max-w-xs text-xs" autocomplete="off"
									type="text" placeholder="비밀번호를 입력해주세요" name="loginPw"
									style="background-color: rgba(239, 231, 229, 0.50); ! important; width: 100%;" /></td>
							</tr>
							<tr>
								<th class="text-xs">비밀번호 확인</th>
								<td><input class="input input-bordered input-primary w-full max-w-xs text-xs" autocomplete="off"
									type="text" placeholder="비밀번호를 다시 입력해주세요" name="loginPwCheck"
									style="background-color: rgba(239, 231, 229, 0.50); ! important; width: 100%;" /></td>
							</tr>
							<tr>
								<th class="text-xs">이름</th>
								<td><input class="input input-bordered input-primary w-full max-w-xs text-xs" autocomplete="off"
									type="text" placeholder="이름을 입력해주세요" name="name"
									style="background-color: rgba(239, 231, 229, 0.50); ! important; width: 100%;" /></td>
							</tr>
							<tr>
								<th class="text-xs">닉네임</th>
								<td><input class="input input-bordered input-primary w-full max-w-xs text-xs" autocomplete="off"
									type="text" placeholder="닉네임을 입력해주세요" name="nickname"
									style="background-color: rgba(239, 231, 229, 0.50); ! important; width: 100%;" /></td>
							</tr>
							<tr>
								<th class="text-xs">전화번호</th>
								<td><input class="input input-bordered input-primary w-full max-w-xs text-xs" autocomplete="off"
									type="text" placeholder="전화번호를 입력해주세요" name="cellphoneNum"
									style="background-color: rgba(239, 231, 229, 0.50); ! important; width: 100%;" /></td>
							</tr>
							<tr>
								<th class="text-xs">이메일</th>
								<td><input class="input input-bordered input-primary w-full max-w-xs text-xs" autocomplete="off"
									type="text" placeholder="이메일을 입력해주세요" name="email"
									style="background-color: rgba(239, 231, 229, 0.50); ! important; width: 100%;" /></td>
							</tr>
							<tr>
								<td colspan="2" class="text-center mt-10"><input class="btn btn-outline btn-info w-full rounded-lg"
									type="submit" value="가입" /></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</section>
