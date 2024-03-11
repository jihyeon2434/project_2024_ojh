<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MYPAGE"></c:set>
<%@ include file="../common/head.jspf"%>


<style>
.left-menu {
	width: 148px;
	height: 32px;
	left: 20px;
	top: 100px;
	position: absolute;
	color: black;
	font-size: 10px;
	font-family: Inria Serif;
	font-weight: 700;
	word-wrap: break-word;
}

.word {
	width: 85px;
	text-align: center;
	color: black;
	font-size: 19px;
	font-family: Inria Serif;
	font-weight: 700;
	word-wrap: break-word;
	position: absolute;
	top: 30px;
	left: 13px;
}

.all-Content{
position: absolute;
top: 75px;
}

.Rectangle {
	width: 900px;
	height: 500px;
	background: rgba(239, 231, 229, 0.33);
	border-radius: 33px;
	position: relative;
	left: 230px;
}

.line {
	width: 880px;
	height: 0px;
	border: 1px rgba(198, 198, 198, 0.50) solid;
	margin-left: 10px;
}

.id {
	width: 147px;
	height: 40px;
	color: black;
	font-size: 15px;
	font-family: Inria Serif;
	font-weight: 700;
	word-wrap: break-word;
	margin-left: 20px;
	margin-top: 20px;
	display: inline-block;
	font-size: small;
}

.content-line {
	display: inline-block;
}

.content {
	display: inline;
	margin-left: 70px;
	font-size: small;
}

.left-line {
	width: 700px;
	height: 0px;
	transform: rotate(90deg);
	transform-origin: 0 0;
	border: 1px #C6C6C6 solid;
	margin-left: 170px;
}

.Rectangle-line {
	width: 370px;
	height: 0px;
	transform: rotate(90deg);
	transform-origin: 0 0;
	border: 1px #C6C6C6 solid;
	margin-left: 180px;
	position: absolute; /* 수정된 부분 */
	top: 50x; /* 수정된 부분 */
}

.modify-btn {
	width: 130px;
	height: 45px;
	background: #232020;
	border-radius: 5px;
	margin-left: 500px;
	margin-top: 50px;
	float: left;
	text-align: center;
	display: flex; /* 추가된 부분 */
	justify-content: center; /* 추가된 부분 */
	align-items: center; /* 추가된 부분 */
	color: white;
}

.modifyBack-btn {
	width: 130px;
	height: 45px;
	background: #929294;
	border-radius: 5px;
	margin-left: 10px;
	margin-top: 50px;
	float: left;
	text-align: center;
	display: flex; /* 추가된 부분 */
	justify-content: center; /* 추가된 부분 */
	align-items: center; /* 추가된 부분 */
}

.btn-outer-box{
font-size: small;
}

</style>



<section class="mt-8 text-xl px-4 ">
	 <div class="left-menu">
        <div><a href="usr/member/myCalendar">회원정보</a></div>
        <br>
        <div><a href="usr/member/myCalendar">마이 캘린더</a></div>
        <br> 
        <div>온라인 컨설팅 예약내역</div>
    </div>

	<div class="left-line"></div>

	<div class="Rectangle">
		<div class="word">기본정보</div>


		<div class="all-Content">
			<div class="Rectangle-line"></div>


			<div class="line"></div>
			<div class="content-line">
				<div class="id">아이디 *</div>
				<div class="content">${rq.loginedMember.loginId }</div>
			</div>


			<div class="line"></div>
			<div class="content-line">
				<div class="id">이름</div>
				<div class="content">${rq.loginedMember.name }</div>
			</div>

			<div class="line"></div>
			<div class="content-line">
				<div class="id">닉네임</div>
				<div class="content">${rq.loginedMember.nickname }</div>
			</div>

			<div class="line"></div>
			<div class="content-line">
				<div class="id">전화번호</div>
				<div class="content">${rq.loginedMember.cellphoneNum }</div>
			</div>

			<div class="line"></div>
			<div class="content-line">
				<div class="id">이메일 *</div>
				<div class="content">${rq.loginedMember.email }</div>
			</div>



			<div class="line"></div>
			<div class="content-line">
				<div class="id">가입날짜</div>
				<div class="content">${rq.loginedMember.regDate }</div>
				<div class="line"></div>
			</div>
		</div>


	</div>

	<div class="btn-outer-box">
		<div class="modify-btn">
			<a href="../member/checkPw" class="btn btn-active btn-ghost">회원정보 수정</a>
		</div>
		<div class="modifyBack-btn">
			<button class="btn-active btn-ghost" type="button" onclick="history.back();">취소</button>
		</div>
	</div>

</section>






<%@ include file="../common/foot.jspf"%>