<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MYRESERVATION"></c:set>
<%@ include file="../common/head.jspf"%>


<style>

/* 왼쪽 메뉴 박스 */
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

/* 왼쪽 메뉴 박스 끝 */





.main-content {
	display: flex;
	gap: 20px;
	font-weight: 400;
	flex-grow: 1;
	flex-basis: auto;
}

@media ( max-width : 991px) {
	.main-content {
		flex-wrap: wrap;
	}
}


.content-wrapper {
	align-self: start;
	display: flex;
	margin-top: 12px;
	flex-direction: column;
	flex-grow: 1;
	flex-basis: 0;
	width: fit-content;
}

@media ( max-width : 991px) {
	.content-wrapper {
		max-width: 100%;
	}
}

.payment-history-header {
	display: flex;
	align-items: start;
	gap: 20px;
	font-size: 12px;
	font-weight: 300;
	text-align: center;
	justify-content: space-between;
}

@media ( max-width : 991px) {
	.payment-history-header {
		max-width: 100%;
		flex-wrap: wrap;
		padding-right: 20px;
	}
}

.payment-history-title {
	font-family: Inria Serif, sans-serif;
	margin-bottom: 28px;
}

.write-post-button {
	font-family: Inria Serif, sans-serif;
	border-radius: 5px;
	background-color: rgba(239, 231, 229, 0.4);
	margin-top: 10px;
	margin-bottom: 10px;
	justify-content: center;
	padding: 12px 29px;
}

@media ( max-width : 991px) {
	.write-post-button {
		padding: 0 20px;
	}
}

.payment-history-table-header {
	border-color: rgba(226, 226, 226, 1);
	border-style: solid;
	border-bottom-width: 1px;
	background-color: #efe7e5;
	display: flex;
	margin-top: 7px;
	gap: 20px;
	font-size: 13px;
	white-space: nowrap;
	text-align: center;
	letter-spacing: -0.7px;
	line-height: 262%;
	justify-content: space-between;
	padding: 11px 19px;
}

@media ( max-width : 991px) {
	.payment-history-table-header {
		max-width: 100%;
		flex-wrap: wrap;
		white-space: initial;
	}
}

.payment-history-table-header-number,
	.payment-history-table-header-title,
	.payment-history-table-header-amount,
	.payment-history-table-header-company,
	.payment-history-table-header-date {
	font-family: Inter, sans-serif;
}

.payment-history-table-row {
	border-color: rgba(226, 226, 226, 1);
	border-style: solid;
	border-bottom-width: 1px;
	display: flex;
	width: 100%;
	gap: 20px;
	color: #3b3b3b;
	white-space: nowrap;
	letter-spacing: -0.7px;
	justify-content: space-between;
	padding: 12px 23px;
}

@media ( max-width : 991px) {
	.payment-history-table-row {
		max-width: 100%;
		flex-wrap: wrap;
		white-space: initial;
		padding: 0 20px;
	}
}

.payment-history-table-row-number-title {
	display: flex;
	gap: 20px;
	font-size: 13px;
	line-height: 262%;
}

@media ( max-width : 991px) {
	.payment-history-table-row-number-title {
		white-space: initial;
	}
}

.payment-history-table-row-number {
	text-align: center;
	font-family: Inter, sans-serif;
}

.payment-history-table-row-title {
	font-family: Inter, sans-serif;
}

.payment-history-table-row-details {
	align-self: start;
	display: flex;
	gap: 20px;
	font-size: 12px;
	text-align: center;
	line-height: 286%;
	justify-content: space-between;
}

@media ( max-width : 991px) {
	.payment-history-table-row-details {
		white-space: initial;
	}
}

.payment-history-table-row-amount, .payment-history-table-row-company,
	.payment-history-table-row-date {
	font-family: Inter, sans-serif;
}

.payment-history-table-row-date {
	line-height: 284%;
}

.inquiry-history-title {
	text-align: center;
	align-self: start;
	margin: 285px 0 0 10px;
	font: 300 12px Inria Serif, sans-serif;
	margin-bottom: 30px;
}

@media ( max-width : 991px) {
	.inquiry-history-title {
		margin: 40px 0 0 10px;
	}
}

.inquiry-history-table-header {
	border-color: rgba(226, 226, 226, 1);
	border-style: solid;
	border-bottom-width: 1px;
	background-color: #efe7e5;
	display: flex;
	margin-top: 31px;
	width: 100%;
	gap: 20px;
	font-size: 13px;
	white-space: nowrap;
	text-align: center;
	letter-spacing: -0.7px;
	line-height: 262%;
	justify-content: space-between;
	padding: 11px 19px;
}

@media ( max-width : 991px) {
	.inquiry-history-table-header {
		max-width: 100%;
		flex-wrap: wrap;
		white-space: initial;
	}
}

.inquiry-history-table-header-number,
	.inquiry-history-table-header-title,
	.inquiry-history-table-header-company,
	.inquiry-history-table-header-date {
	font-family: Inter, sans-serif;
}

.inquiry-history-table-header-company-date {
	align-self: start;
	display: flex;
	gap: 20px;
	justify-content: space-between;
}

@media ( max-width : 991px) {
	.inquiry-history-table-header-company-date {
		white-space: initial;
	}
}

.inquiry-history-table-row {
	border-color: rgba(226, 226, 226, 1);
	border-style: solid;
	border-bottom-width: 1px;
	display: flex;
	width: 100%;
	gap: 20px;
	color: #3b3b3b;
	text-align: center;
	letter-spacing: -0.7px;
	padding: 12px 23px;
}

@media ( max-width : 991px) {
	.inquiry-history-table-row {
		max-width: 100%;
		flex-wrap: wrap;
		padding: 0 20px;
	}
}

.inquiry-history-table-row-number-title {
	display: flex;
	gap: 20px;
	font-size: 13px;
	line-height: 262%;
	flex: 1;
}

.inquiry-history-table-row-number {
	font-family: Inter, sans-serif;
}

.inquiry-history-table-row-title {
	font-family: Inter, sans-serif;
	flex-grow: 1;
	flex-basis: auto;
}

.inquiry-history-table-row-details {
	align-self: start;
	display: flex;
	gap: 20px;
	font-size: 12px;
	white-space: nowrap;
	justify-content: space-between;
	flex: 1;
}

@media ( max-width : 991px) {
	.inquiry-history-table-row-details {
		white-space: initial;
	}
}

.inquiry-history-table-row-company {
	font-family: Inter, sans-serif;
	line-height: 286%;
}

.inquiry-history-table-row-date {
	font-family: Inter, sans-serif;
	line-height: 284%;
}

.list-table {
	border-color: rgba(226, 226, 226, 1);
	background-color: #efe7e5;
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
			<c:choose>
				<c:when test="${memberType == '업체'}">
					<!-- 업체가 로그인했을 때 표시할 컨텐츠 -->
					<header class="payment-history-header">
						<h2 class="payment-history-title">나에게 들어온 컨설팅 문의</h2>
						<c:if test="${not empty inquiries}">
							<button class="write-post-button">
								<a href="../onlineConsulting/respond">문의 답변하기</a>
							</button>
						</c:if>
					</header>
					<!-- 문의 내역 테이블 렌더링 -->
				</c:when>
				<c:otherwise>
					<!-- 고객이 로그인했을 때 표시할 컨텐츠 -->
					<header class="payment-history-header">
						<h2 class="payment-history-title">나의 결제내역</h2>
						<c:if test="${not empty payments}">
							<button class="write-post-button">
								<a href="../onlineConsulting/write">상담글 작성</a>
							</button>
						</c:if>
					</header>
					<!-- 결제 내역 테이블 렌더링 -->
				</c:otherwise>
			</c:choose>


			<table class="table ">
				<colgroup>
					<col style="width: 5%" />
					<col style="width: 35%" />
					<col style="width: 20%" />
					<col style="width: 25%" />
					<col style="width: 15%" />
				</colgroup>
				<thead class="list-table">
					<tr>
						<th>번호</th>
						<th>옵션</th>
						<th>결제금액</th>
						<th>업체명</th>
						<th>결제일</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${payments}" var="payment" varStatus="status">
						<tr>
							<td>${status.index + 1}</td>
							<td>옵션내용1:1 컨설팅</td>
							<td>${payment.amount}</td>
							<td>${payment.shopName}</td>
							<td>${payment.paymentDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</table>

			<h2 class="inquiry-history-title">나의 문의내역</h2>

			<table class="table ">
				<colgroup>
					<col style="width: 5%" />
					<col style="width: 60%" />
					<col style="width: 30%" />
					<col style="width: 5%" />
				</colgroup>
				<thead class="list-table">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>업체명</th>
						<th>등록/수정일</th>
					</tr>
				</thead>


				<tbody>
					<%-- 						<c:forEach items="${competitions}" var="competition"> --%>
					<tr>
						<td>${competition.id}</td>
						<!-- 첫 번째 td에 학회의 ID -->
						<td><a href="detail?themeId=${competition.themeId}&id=${competition.id}">${competition.title}</a></td>
						<!-- 두 번째 td에 학회의 제목 -->
						<%-- 		<td>${competition.applicationPeriod}</td> --%>
						<!-- 세 번째 td에 행사 기간 -->
						<td>블라블라 이미지컨설팅</td>
						<!-- 네 번째 td에 등록/수정일 -->
						<td>2024.05.01</td>
						<!-- 다섯 번째 td에 조회수 -->
					</tr>
					<%-- 					</c:forEach> --%>
				</tbody>



			</table>
		</div>
	</main>
</div>

<%@ include file="../common/foot.jspf"%>