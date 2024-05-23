<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="LOGIN"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.big-outer-box {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh; /* 화면 세로 중앙 정렬 */
}

.outer-box {
	display: flex;
	width: auto;
	height: auto;
	justify-content: center;
}

.small-outer-box {
	width: 755px;
	height: 500px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	border-radius: 8px;
	background: rgba(239, 231, 229, 0.25); /* 투명도를 25%로 설정 */
}

.logo {
	width: 755px;
	height: 50px;
	text-align: center;
}

.outer-container {
	width: 100%;
	height: auto;
	display: flex;
	justify-content: center;
}

.small-outer-container {
	width: 450px;
	height: 300px;
	background: rgba(239, 231, 229, 0.25);
	border-radius: 9px;
	display: flex;
	justify-content: center;
	align-items: center; /* 이 부분을 추가해줍니다 */
}

.login-container {
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 10px;
	height: 300px;
}

.login-box {
	border: none;
}

.login-footer {
	text-align: center;
	margin-top: 20px width: 300px;
	height: 30px;
	font-size: 0.7em; /* 글씨 크기를 작게 조정 */
	margin-top: 20px;
}

.search-id, .search-pw, .do-join {
	display: inline-block;
	margin-right: 30px;
}

.input {
	width: 100%;
	/* 필요에 따라 너비를 조절할 수 있습니다 */
}
</style>

<section class="big-outer-box text-xl">
	<div class="outer-box">
		<div class="small-outer-box">
			<div class="logo" style="font-size: 30px">ItrendX</div>
			<div class="outer-container">
				<div class="small-outer-container">
					<div class="login-container">
						<form action="../member/doLogin" method="POST" class="mx-auto max-w-xs">
							<input type="hidden" name="afterLoginUri" value="${param.afterLoginUri}" />

							<div class="login-box">
								<table class="table-box-1" style="width: 100%;">

									<label class="input input-bordered flex items-center gap-2"> <svg xmlns="http://www.w3.org/2000/svg"
											viewBox="0 0 16 16" fill="currentColor" class="w-4 h-4 opacity-70">
											<path
												d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM12.735 14c.618 0 1.093-.561.872-1.139a6.002 6.002 0 0 0-11.215 0c-.22.578.254 1.139.872 1.139h9.47Z" /></svg>
										<input type="text" class="grow" name="loginId" placeholder="Username" />
									</label>


									<tr>

										<label class="input input-bordered flex items-center gap-2"> <svg xmlns="http://www.w3.org/2000/svg"
												viewBox="0 0 16 16" fill="currentColor" class="w-4 h-4 opacity-70">
												<path fill-rule="evenodd"
													d="M14 6a4 4 0 0 1-4.899 3.899l-1.955 1.955a.5.5 0 0 1-.353.146H5v1.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-2.293a.5.5 0 0 1 .146-.353l3.955-3.955A4 4 0 1 1 14 6Zm-4-2a.75.75 0 0 0 0 1.5.5.5 0 0 1 .5.5.75.75 0 0 0 1.5 0 2 2 0 0 0-2-2Z"
													clip-rule="evenodd" /></svg> <input type="password" class="grow" name="loginPw" placeholder="password" />
										</label>



									</tr>
									<tr>
										<!-- 로그인 버튼을 폼 안에 위치 -->
										<td colspan="2" class="text-center mt-4" style="height: 90px;"><input class="btn btn-outline"
											type="submit" value="로그인" /></td>
									</tr>
									</tbody>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="login-footer">
				<div class="search-id">
    <a class="searchid" href="../member/findLoginId" style="margin-right: 30px;">아이디 찾기</a>
</div>
				<div class="search-pw">
					<a class="searchpw" href="#" style="margin-right: 30px;">비밀번호 찾기</a>
				</div>
				<div class="do-join">
					<a class="dojoin" href="../member/join">회원가입</a>
				</div>
			</div>
		</div>

	</div>
</section>

