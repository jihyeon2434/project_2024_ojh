<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="checkPw"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* 화면 높이 기준으로 가운데 정렬 */
}

.Rectangle {
    position: relative; /* 변경된 부분 */
    width: 700px;
    height: 513px;
    background: rgba(239, 231, 229, 0.33);
    border-radius: 33px;
}

.line {
    width: 532px;
    height: 0px;
    border: 1px rgba(198, 198, 198, 0.5) solid;
    margin-left: 10px;
}

.content-line {
    display: flex; /* 변경된 부분 */
    align-items: center; /* 변경된 부분 */
    margin-bottom: 20px; /* 변경된 부분 */
}

.content {
    display: inline;
    margin-left: 10px;
}

.all-content {
    position: absolute;
    top: 100px;
    left: 70px;
}

.id {
    width: 147px;
    height: 51px;
    color: black;
    font-size: 20px;
    font-family: Inria Serif;
    font-weight: 700;
    word-wrap: break-word;
    margin-left: 20px;
    margin-top: 20px;
    display: inline-block;
}

.btn-1 {
    position: absolute;
    bottom: -100px;
    left: 250px;
}

.ok-btn {
    width: 135px;
    height: 45px;
    background: #232020;
    border-radius: 5px;
    margin-left: 600px;
    margin-top: 100px;
    text-align: center;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
    position: absolute; /* 변경된 부분 */
    bottom: 20px; /* 변경된 부분 */
    right: -10px;
}

.back-btn {
    width: 135px;
    height: 45px;
    background: #929294;
    border-radius: 5px;
    margin-left: 10px;
    margin-top: 100px;
    text-align: center;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
    position: absolute; /* 변경된 부분 */
    bottom: 20px; /* 변경된 부분 */
    left: 30px; /* 변경된 부분 */
}

.input {
    width: 400px; /* 변경된 부분 */
    height: 30px; /* 변경된 부분 */
    border: none;
    border-radius: 5px;
    padding: 5px;
    background: rgba(239, 231, 229, 0.33);
}
</style>









<section>
<div class="container">
	<div class="Rectangle">
		<div class="all-content">
			<div class="line"></div>
			<br>
			<form action="../member/doCheckPw" method="POST">
				<div class="content-line">
					<div class="id">아이디 :</div>
					<div class="content">${rq.loginedMember.loginId }</div>
				</div>
				<div class="content-line">
					<div class="id">비밀번호 :</div>
					<div class="content">
						<input class="input input-bordered  w-full max-w-xs" autocomplete="off" type="text"
							placeholder="비밀번호를 입력해주세요" name="loginPw" />
					</div>
				</div>
				<br> <br>
				<div class="line"></div>
				<!-- 확인 버튼 추가 -->
				<div class="btn-1">
					<div class="ok-btn">
						<button class="btn-outline btn-info" type="submit">확인</button>
					</div>
					<div class="back-btn">
						<button class="btn-outline" type="button" onclick="history.back();">뒤로가기</button>
					</div>
				</div>
			</form>

		</div>
		
	</div>
</div>
</section>


<%@ include file="../common/foot.jspf"%>