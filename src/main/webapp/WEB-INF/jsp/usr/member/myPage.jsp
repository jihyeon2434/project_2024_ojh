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

.modify_btn {
	width: 110px;
	height: 70px;
	font-size: 16px;
	line-height: 72px;
	border-radius: 18px;
	background: rgba(239, 231, 229, 0.33);
	color: black;
	text-align: center;
	box-shadow: 4px 4px 4px 0px rgba(0, 0, 0, 0.25);
}

.info_box {
	height: 87px;
	width: 1000px;
	position: relative;
	border-bottom-width: 1px;
	border-color: #878787;
}

.info1 {
	width: 160px;
	height: 87px;
	background: rgba(239, 231, 229, 0.33);
	color: black;
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	border-bottom-width: 1px;
	border-color: #878787;
}

.info2 {
	top: -55px;
	left: 19%;
	width: 200px;
	position: relative;
}

.info_name {
	height: 89px;
	border-top-width: 2px;
	border-top-color: #535353;
}

.pw_btn, .withdraw_btn {
	top: -65px;
	width: 95px;
	height: 38px;
	font-size: 14px;
	border-radius: 10px;
		background: rgba(239, 231, 229, 0.33);
	color: black;
	box-shadow: 4px 3px 3px 0px rgba(0, 0, 0, 0.25);
}

.content-wrapper {
margin-top: 20px;
	height: 700px;
	display: flex;
	justify-content: center;
	height: 700px;
}

.mod-btn-box {
	display: flex;
	justify-content: center;
	margin-top: 20px;
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
			<div class="small-content-wrapper">
				<div class="info_box info_name">
					<div class="info1">이름</div>
					<div class="info2">${rq.loginedMember.name }</div>
				</div>

				<div class="info_box info_id">
					<div class="info1">아이디</div>
					<div class="info2">${rq.loginedMember.loginId }</div>
				</div>

				<div class="info_box info_pw">
					<div class="info1">비밀번호</div>
					<button class="info2 pw_btn">
						<a href="../member/checkPw">변경하기</a>
					</button>
				</div>

				<div class="info_box info_pn">
					<div class="info1">핸드폰 번호</div>
					<div class="info2">${rq.loginedMember.cellphoneNum }</div>
				</div>

				<div class="info_box info_email">
					<div class="info1">이메일</div>
					<div class="info2">${rq.loginedMember.email }</div>
				</div>
				<div class="info_box info_email">
					<div class="info1">닉네임</div>
					<div class="info2">${rq.loginedMember.nickname }</div>
				</div>
				<div class="info_box info_withdraw">
					<div class="info1">탇퇴</div>

					<!-- 탈퇴하기 버튼, 한 번만 선언합니다 -->
					<button class="info2 withdraw_btn" onclick="return confirmWithdrawal();">탈퇴하기</button>

				</div>
				<div class="mod-btn-box">
					<button class="modify_btn">
						<a href="../member/checkPw">수정하기</a>
					</button>
				</div>

			</div>



		</div>
	</main>





</div>





<script>
	function confirmWithdrawal() {
		if (confirm('정말 탈퇴하시겠습니까?')) {
			window.location.href = '../member/doWithdraw'; // 서버의 탈퇴 처리 URL로 이동
		}
	}
</script>





<%@ include file="../common/foot.jspf"%>