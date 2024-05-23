<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="checkPw"></c:set>
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

.search-title{

margin-bottom: 30px;

}

.find-name , .find-email{
padding: 5px;
}

</style>

<section class="big-outer-box text-xl">
	<div class="outer-box">
		<div class="small-outer-box">
			<div class="logo" style="font-size: 30px">ItrendX</div>
			<div class="outer-container">
				<div class="small-outer-container">
					<div class="login-container">
						<form name="idfindscreen" method="POST" action="/usr/member/doFindLoginId">
							<div class="search-title">
								<h3 style ="font-size:0.7em;">이메일 본인확인</h3>
							</div>
							<table class="table-box-1" style="width: 100%;">
							<section class="form-search">
								<div class="find-name">
								<label class="input input-bordered flex items-center gap-2">
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="w-4 h-4 opacity-70"><path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM12.735 14c.618 0 1.093-.561.872-1.139a6.002 6.002 0 0 0-11.215 0c-.22.578.254 1.139.872 1.139h9.47Z" /></svg>
  <input name="name" class="grow" placeholder="Username" />
</label>
									
								</div>
								<div class="find-email">
									<label class="input input-bordered flex items-center gap-2">
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="w-4 h-4 opacity-70"><path d="M2.5 3A1.5 1.5 0 0 0 1 4.5v.793c.026.009.051.02.076.032L7.674 8.51c.206.1.446.1.652 0l6.598-3.185A.755.755 0 0 1 15 5.293V4.5A1.5 1.5 0 0 0 13.5 3h-11Z" /><path d="M15 6.954 8.978 9.86a2.25 2.25 0 0 1-1.956 0L1 6.954V11.5A1.5 1.5 0 0 0 2.5 13h11a1.5 1.5 0 0 0 1.5-1.5V6.954Z" /></svg>
  <input name="email" class="grow" placeholder="email" />
</label>
								</div>
								
							</section>
							<div class="btnSearch">
							<input style ="font-size:0.7em;"type="submit" name="enter" value="확인">
						
								<input  style ="font-size:0.7em;"type="button" name="cancel" value="취소" onClick="history.back()">
								
							</div>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>