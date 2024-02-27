<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="JOIN"></c:set>
<%@ include file="../common/head.jspf"%>
<style type="text/css">
.msg {
	border: 1px solid black;
	margin-top: 10px;
	padding: 20px;
	font-size: 1rem;
}
</style>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>function callByJoinCheckAjax() {

	console.log(1);
	var joinCheck = document.joinCheck;
	console.log(2);
	var loginId = joinCheck.loginId.value;
	console.log(2);
	var action = joinCheck.action;

	$.get(action, {
		loginId : loginId
	
	}, function(data) {
		$('.msg').text(data);
	}, 'html');
	}

</script>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form name="joinCheck" action="../member/doJoin" method="POST">
			<table class="join-box table-box-1" border="1">
				<tbody>
					<tr>
						<th>아이디</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="아이디를 입력해주세요" name="loginId" />
							<button onclick="callByJoinCheckAjax();" class="btn btn-outline" class="" type="button" onclick="">아이디중복체크</button>
							<div class="msg"></div>
						</td>
					<tr>
						<th>비밀번호</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="비밀번호를 입력해주세요" name="loginPw" />
						</td>
					</tr>

					</tr>
					<tr>
						<th>이름</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="이름을 입력해주세요" name="name" />
						</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="닉네임을 입력해주세요" name="nickname" />
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="전화번호를 입력해주세요" name="cellphoneNum" />
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="이메일을 입력해주세요" name="email" />
						</td>
					</tr>

					<tr>
						<th></th>
						<td>
							<input class="btn btn-outline btn-info" type="submit" value="가입" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="btns">
			<button class="btn btn-outline" class="" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>