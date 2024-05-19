<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MYPAGE"></c:set>
<%@ include file="../common/head.jspf"%>


<style>
.container {
	background-color: #fff;
	display: flex;
	gap: 20px;
	color: #000;
	padding: 50px 80px 50px 17px;
}

@media ( max-width : 991px) {
	.container {
		flex-wrap: wrap;
		padding-right: 20px;
	}
}

.sidebar {
	align-self: start;
	display: flex;
	margin-top: 23px;
	flex-direction: column;
	font-size: 10px;
	font-weight: 500;
}


.member-info {
	font-family: Inter, sans-serif;
	width: 150px;
}

.my-calendar {
	font-family: Inter, sans-serif;
	width: 150px;
	margin-top: 44px;
}

@media ( max-width : 991px) {
	.my-calendar {
		margin-top: 40px;
	}
}

.online-reservation {
	font-family: Inter, sans-serif;
	width: 150px;
	margin-top: 43px;
}

@media ( max-width : 991px) {
	.online-reservation {
		margin-top: 40px;
	}
}


.divider {
	border-color: rgba(232, 232, 232, 1);
	border-style: solid;
	border-width: 1px;
	background-color: #e8e8e8;
	width: 1px;
	height: 924px;
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

.content-outer-box {
	width: 900px;
	height: 500px;
}

.all-Content {
	position: absolute;
	top: 75px;
}

.Rectangle {
	width: 900px;
	height: 500px;
	background: rgba(239, 231, 229, 0.33);
	border-radius: 33px;
	position: relative;
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
	margin-left: 200px;
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

.conBtn-outer-box {
	display: flex;
	justify-content: center;
	flex-direction: column;
}

.btn-outer-box {
	font-size: small;
	width: 900px;
	height: 100px;
	display: flex;
	justify-content: center;
	margin-top: 30px;
}

.btn-small-box {
	width: 200px;
	text-align: center;
}

.modify-btn, .modifyBack-btn {
	display: inline-block;
}
</style>




<div class="container">
	<aside class="sidebar">
		<div class="member-info">
			<a href="/usr/member/myPage">회원정보</a>
		</div>
		<div class="my-calendar">
			<a href="/usr/member/myCalendar">마이 캘린더</a>
		</div>
		<div class="online-reservation">
			<a href="/usr/member/myReservation">온라인 컨설팅 예약 내역</a>
		</div>
		<div class="online-reservation">
			<a href="/usr/member/myScrapShops">관심 매장</a>
		</div>
	</aside>
	<div class="divider"></div>

	<main class="main-content">
		<div class="content-wrapper">
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
				<div class="btn-small-box">
					<div class="modify-btn">
						<a href="../member/checkPw" class="btn btn-outline">회원정보 수정</a>
					</div>
					<div class="modifyBack-btn">
						<button class="btn btn-active btn-ghost" type="button" onclick="history.back();">취소</button>
					</div>
				</div>

			</div>
		</div>
	</main>





</div>









<%@ include file="../common/foot.jspf"%>