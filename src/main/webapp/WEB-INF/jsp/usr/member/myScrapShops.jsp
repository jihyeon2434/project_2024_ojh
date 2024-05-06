<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MYRESERVATION"></c:set>
<%@ include file="../common/head.jspf"%>


<style>
/* .container {
	background: linear-gradient(0deg, #fff 0%, #fff 100%), #fff;
	display: flex;
	flex-direction: column;
	align-items: start;
	padding: 45px 60px 80px;
} */

/* @media ( max-width : 991px) {
	.container {
		padding: 0 20px;
	}
} */
.content-wrapper {
	display: flex;
	margin-left: 99px;
	width: 1296px;
	max-width: 100%;
	flex-direction: column;
}

.section-title {
	color: #000;
	font: 600 17px Inter, sans-serif;
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
	font-family: Inter, sans-serif;
	border-radius: 24px;
	background-color: #d9d9d9;
	justify-content: center;
	padding: 20px 32px;
}

.filter-option-2 {
	font-family: Inter, sans-serif;
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
	font-family: Inter, sans-serif;
}

.store-rating {
	font-family: Inter, sans-serif;
	margin-top: 29px;
}

.store-location {
	color: #888;
	font-family: Inter, sans-serif;
	font-weight: 400;
	margin-top: 29px;
}

.store-price {
	color: #888;
	font-family: Inter, sans-serif;
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
	font-size: 10px;
	font-weight: 500;
}

.member-info {
	font-family: Inter, sans-serif;
	width: 100px;
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
		<div class="member-info">회원 정보</div>
		<div class="my-calendar">마이 캘린더</div>
		<div class="online-reservation">온라인 컨설팅 예약 내역</div>
		<div class="online-reservation">관심 매장</div>
	</aside>

	<div class="divider1"></div>


	<main class="main-content">
		<div class="content-wrapper">
			<h2 class="section-title">내 관심 매장</h2>
			<div class="filter-options">
				<div class="filter-option-1">IMAGE MAKING</div>
				<div class="filter-option-2">SELF</div>
			</div>
			<div class="store-card">
				<div class="store-card-content">
					<div class="store-card-row">
						<div class="store-image-column">
							<img
								src="https://cdn.builder.io/api/v1/image/assets/TEMP/dbf6557681cb72efd5904a5310a453378dafc79a95ab93c4217897cf3cc19986?apiKey=4d3772835b8a4f38b4ea30894b56681e&"
								alt="" class="store-image" />
						</div>
						<div class="store-details-column">
							<div class="store-details">
								<div class="store-name">앤셜리에허 세종점</div>
								<div class="store-rating">★ 4.9</div>
								<div class="store-location">위치 정보</div>
								<div class="store-price">커트 30,000원</div>
							</div>
						</div>
					</div>
				</div>
				<div class="divider"></div>
			</div>
			<div class="store-card">
				<div class="store-card-content">
					<div class="store-card-row">
						<div class="store-image-column">
							<img
								src="https://cdn.builder.io/api/v1/image/assets/TEMP/dbf6557681cb72efd5904a5310a453378dafc79a95ab93c4217897cf3cc19986?apiKey=4d3772835b8a4f38b4ea30894b56681e&"
								alt="" class="store-image" />
						</div>
						<div class="store-details-column">
							<div class="store-details">
								<div class="store-name">앤셜리에허 세종점</div>
								<div class="store-rating">★ 4.9</div>
								<div class="store-location">위치 정보</div>
								<div class="store-price">커트 30,000원</div>
							</div>
						</div>
					</div>
				</div>
				<div class="divider"></div>
			</div>
		</div>
	</main>
</div>
<%@ include file="../common/foot.jspf"%>