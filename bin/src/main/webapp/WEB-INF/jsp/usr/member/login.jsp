<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="LOGIN"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.centered {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh; /* 화면 세로 중앙 정렬 */
}

.outer-container {
	width: 755px;
	height: 403px;
	position: relative;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	border-radius: 8px;
	overflow: hidden;
	background: rgba(239, 231, 229, 0.50);
}

.logo {
	font-size: 70px;
	font-family: Inria Serif;
	border: word-wrap: break-word;
}

.outer-box {
	width: 450px;
	height: 300px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: rgba(239, 231, 229, 0.89);
	border-radius: 9px;
	border: 1px rgba(0, 0, 0, 0.20) solid grey;
}

.login-container {
	text-align: center;
	border-radius: 10px;
	padding-top: 20px; /* 로고와 로그인 폼 사이의 간격 조절 */
	position: absolute;
}

.login-box {
	border: none;
	margin-left: 1rem;
	margin-right: 3rem;
	margin-top: 2.5rem;
}

.login-footer {
	text-align: center;
	margin-top: 20px;
}

.login-footer a {
	font-size: 0.5em; /* 글씨 크기를 작게 조정 */
}

.input {
	width: 100%;
	/* 필요에 따라 너비를 조절할 수 있습니다 */
}
</style>



<section class="text-xl px-5 centered">
	<div class="outer-container" style="height: 450px;">
		<div class="logo"
			style="position: absolute; top: 5%; left: 50%; transform: translateX(-50%); font-size: 30px; font-family: 'Inria Serif', serif;">LOGO</div>
		<!-- 높이 조정 -->
		<div class="outer-box">
			<div class="login-container">
				<form action="../member/doLogin" method="POST" class="mx-auto max-w-xs">
					<input type="hidden" name="afterLoginUri" value="${param.afterLoginUri}" />
					<div class="login-box">
						<table class="table-box-1 mx-20" style="width: 100%;">
							<tbody>
								<tr>
									<th style="text-align: center;"><img
										src="//velog.velcdn.com/images/jihyeon2434/post/3b37dbd1-67e6-4309-895c-65560a0c95cf/image.png"
										style="display: block; margin: 0 auto;"></th>
									<td><input class="input input-bordered input-primary w-full text-xs" autocomplete="off" type="text"
										placeholder="아이디를 입력해주세요" name="loginId"
										style="color: #000 !important; background-color: rgba(239, 231, 229, 0.89) !important; width: 100%;" /></td>
								</tr>
								<tr>
									<th style="text-align: center;"><img
										src="//velog.velcdn.com/images/jihyeon2434/post/2c552296-491b-44f2-a266-b27497cfec7b/image.png"
										style="display: block; margin: 0 auto;"></th>
									<td><input class="input input-bordered input-primary w-full text-xs" autocomplete="off" type="password"
										placeholder="비밀번호를 입력해주세요" name="loginPw"
										style="color: #000 !important; background-color: rgba(239, 231, 229, 0.89) !important; width: 100%;" /></td>
								</tr>
								<tr>
									<!-- 로그인 버튼을 폼 안에 위치 -->
									<td colspan="2" class="text-center mt-4" style="height: 90px;"><input
										class="btn btn-outline btn-info w-full rounded-lg" type="submit" value="로그인" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
		<div class="login-footer" style="position: absolute; bottom: 100px; left: 50%; transform: translateX(-50%);">
			<a class="searchid" href="#" style="margin-right: 30px;">아이디 찾기</a> <a class="searchpw" href="#"
				style="margin-right: 30px;">비밀번호 찾기</a> <a class="dojoin" href="#">회원가입</a>
		</div>
	</div>
</section>