<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MYRESERVATION"></c:set>
<%@ include file="../common/head.jspf"%>


<style>

.content-wrapper {
	display: flex;
	margin-left: 99px;
	width: 1296px;
	max-width: 100%;
	flex-direction: column;
}

.section-title {
	color: #000;
}

@media ( max-width : 991px) {
	.section-title {
		max-width: 100%;
	}
}

.filter-options {
	background-color: #fff;
	align-self: start;
	display: flex;
	margin-top: 30px;
	gap: 20px;
	font-size: 15px;
	color: #000;
	font-weight: 400;
	text-align: center;
	justify-content: space-between;
	padding: 17px 0 8px;
}

.filter-option-1 {
	border-radius: 24px;
	background-color: #d9d9d9;
	justify-content: center;
	padding: 20px 32px;
}

.filter-option-2 {
	border-radius: 24px;
	background-color: #f9f9f9;
	white-space: nowrap;
	justify-content: center;
	padding: 20px 32px;
}

@media ( max-width : 991px) {
	.filter-option-2 {
		white-space: initial;
		padding: 0 20px;
	}
}

.store-card {
	background-color: #fff;
	display: flex;
	margin-top: 15px;
	padding-top: 16px;
	flex-direction: column;
}

@media ( max-width : 991px) {
	.store-card {
		max-width: 100%;
	}
}

.store-card-content {
	width: 400px;
	max-width: 100%;
}

.store-card-row {
	gap: 20px;
	display: flex;
}

@media ( max-width : 991px) {
	.store-card-row {
		flex-direction: column;
		align-items: stretch;
		gap: 0px;
	}
}

.store-image-column {
	display: flex;
	flex-direction: column;
	line-height: normal;
	width: 69%;
	margin-left: 0px;
}

@media ( max-width : 991px) {
	.store-image-column {
		width: 100%;
	}
}

.store-image {
	aspect-ratio: 1.28;
	object-fit: auto;
	object-position: center;
	width: 100%;
	flex-grow: 1;
}

@media ( max-width : 991px) {
	.store-image {
		margin-top: 39px;
	}
}

.store-details-column {
	display: flex;
	flex-direction: column;
	line-height: normal;
	width: 31%;
	margin-left: 20px;
}

@media ( max-width : 991px) {
	.store-details-column {
		width: 100%;
	}
}

.store-details {
	display: flex;
	margin-top: 7px;
	flex-direction: column;
	font-size: 15px;
	color: #000;
	font-weight: 600;
}

@media ( max-width : 991px) {
	.store-details {
		margin-top: 40px;
	}
}

.store-name {
	width: 500px;
}

.store-rating {
	color: #888;
	margin-top: 29px;
}

.store-location {
	color: #888;
	font-weight: 400;
	margin-top: 29px;
	width: 500px;
}

.store-price {
	color: #888;
	font-weight: 400;
	margin-top: 31px;
}

.divider {
	border-color: rgba(232, 232, 232, 1);
	border-style: solid;
	background-color: #e8e8e8;
	margin-top: 29px;
	height: 1px;
}

.divider1 {
	border-color: rgba(232, 232, 232, 1);
	border-style: solid;
	border-width: 1px;
	background-color: #e8e8e8;
	width: 1px;
	height: 924px;
}

@media ( max-width : 991px) {
	.divider {
		max-width: 100%;
	}
}

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
	font-size: 15px;
	font-weight: 450;
}

.member-info {

	width: 100px;
}

.my-calendar {

	width: 150px;
	margin-top: 44px;
}

@media ( max-width : 991px) {
	.my-calendar {
		margin-top: 40px;
	}
}

.online-reservation {
	width: 150px;
	margin-top: 43px;
}

@media ( max-width : 991px) {
	.online-reservation {
		margin-top: 40px;
	}
}

.main-content {
	display: flex;
	gap: 20px;
	font-weight: 400;
	flex-grow: 1;
	flex-basis: auto;
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

	<div class="divider1"></div>

	<main class="main-content">
		<div class="content-wrapper">
			<h2 class="section-title">내 관심 매장</h2>
			<div class="filter-options">
				<div class="filter-option-1" id="imageMakingButton">IMAGE MAKING</div>
				<div class="filter-option-2" id="selfButton">SELF</div>

			</div>
			<div id="storeListContainer">
				<!-- 매장 정보 동적 출력 -->
				<c:forEach var="shop" items="${conShopList}">
					<div class="store-card">
						<div class="store-card-content">
							<div class="store-card-row">
								<div class="store-image-column">
									<!-- 이미지 URL 조건 처리 (null 체크 등) -->
									<img src="${not empty shop.photoUrl1 ? shop.photoUrl1 : 'default-image-path'}" alt="" class="store-image" />
								</div>
								<div class="store-details-column">
									<div class="store-details">
										<div class="store-name">${shop.shopName}</div>
										<div class="store-rating">★ ${shop.totalStarPoint}</div>
										<div class="store-location">${shop.roadName}</div>

									</div>
								</div>
							</div>
						</div>
						<div class="divider"></div>
					</div>
				</c:forEach>
			</div>
		</div>
	</main>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$('#imageMakingButton')
								.click(
										function() {
											$
													.ajax({
														url : '/usr/member/conShopList',
														type : 'GET',
														success : function(data) {
															var html = '';
															$
																	.each(
																			data,
																			function(
																					index,
																					shop) {
																				html += '<div class="store-card">';
																				html += '<div class="store-card-content">';
																				html += '<div class="store-card-row">';
																				html += '<div class="store-image-column">';
																				html += '<img src="'
																						+ (shop.photoUrl1 ? shop.photoUrl1
																								: 'default-image-path')
																						+ '" alt="" class="store-image" />';
																				html += '</div>'; // End of store-image-column
																				html += '<div class="store-details-column">';
																				html += '<div class="store-details">';
																				html += '<div class="store-name">'
																						+ shop.shopName
																						+ '</div>';
																				html += '<div class="store-rating">★ '
																						+ shop.totalStarPoint
																						+ '</div>';
																				html += '<div class="store-location">'
																						+ shop.roadName
																						+ '</div>';
																				html += '</div>'; // End of store-details
																				html += '</div>'; // End of store-details-column
																				html += '</div>'; // End of store-card-row
																				html += '</div>'; // End of store-card-content
																				html += '<div class="divider"></div>';
																				html += '</div>'; // End of store-card
																			});
															$(
																	'#storeListContainer')
																	.html(html);
														}
													});
										});

						$('#selfButton')
								.click(
										function() {
											$
													.ajax({
														url : '/usr/member/selfShopList',
														type : 'GET',
														success : function(data) {
															console.log(data); // 서버에서 받은 전체 데이터 로깅

															var html = '';
															$
																	.each(
																			data,
																			function(
																					index,
																					shop) {
																				console
																						.log(shop.totalStarPoint); // 각 항목의 totalStarPoint를 로그로 확인s
																				html += '<div class="store-card">';
																				html += '<div class="store-card-content">';
																				html += '<div class="store-card-row">';
																				html += '<div class="store-image-column">';
																				html += '<img src="'
																						+ (shop.photoUrl1 ? shop.photoUrl1
																								: 'default-image-path')
																						+ '" alt="" class="store-image" />';
																				html += '</div>'; // End of store-image-column
																				html += '<div class="store-details-column">';
																				html += '<div class="store-details">';
																				html += '<div class="store-name">'
																						+ shop.shopName
																						+ '</div>';
																				html += '<div class="store-rating">★ '
																						+ shop.totalStarPoint
																						+ '</div>';
																				html += '<div class="store-location">'
																						+ shop.roadName
																						+ '</div>';
																				html += '</div>'; // End of store-details
																				html += '</div>'; // End of store-details-column
																				html += '</div>'; // End of store-card-row
																				html += '</div>'; // End of store-card-content
																				html += '<div class="divider"></div>';
																				html += '</div>'; // End of store-card
																			});
															$(
																	'#storeListContainer')
																	.html(html);
														}
													});
										});
					});
</script>


<%@ include file="../common/foot.jspf"%>