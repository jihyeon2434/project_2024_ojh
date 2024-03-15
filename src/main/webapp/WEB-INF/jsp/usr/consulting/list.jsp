<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } CONSULTING LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.outer-box {
	display: flex;
	margin-top: 30px;
}

.small-outer-box {
	padding-top: 20px;
	padding-bottom: 20px;
	width: 250px;
	height: 630px;
	display: flex;
	justify-content: center;
	border: solid 1px;
}

.small-outer-box-2 {
	width: 1000px;
}

.content-outer-box {
	width: 1500px;
	display: flex;
	justify-content: center;
}

.price-outer-box {
	width: 250px;
	display: flex;
	justify-content: center;
	flex-direction: column;
}

.price_option_box>div {
	width: 10px;
	height: 10px;
}

.price-box {
	display: flex;
	justify-content: center;
}

.price {
	font: 13px Inria Serif, sans-serif;
	align-content: center;
	display: block;
	font-size: 20px;
}

.price_option_box {
	width: auto;
	display: flex;
	justify-content: space-around;
}

.area-box {
	display: flex;
	justify-content: center;
}

.area {
	margin-top: 23px;
	font: 13px Inria Serif, sans-serif;
	align-content: center;
	display: block;
	font-size: 20px;
}

.area-outer-box {
	width: 250px;
	display: flex;
	margin-top: 39px;
	flex-direction: column;
	align-items: center;
	padding: 0 10px;
}

.line {
	border-color: rgba(0, 0, 0, 1);
	border-style: solid;
	border-width: 1px;
	background-color: #000;
	align-self: stretch;
	height: 1px;
}

.area-option-box-1, .area-option-box-2, .area-option-box-3,
	.area-option-box-4 {
	white-space: initial;
	display: flex;
	width: 250px;
	margin-top: 10px;
	display: flex;
	justify-content: space-around;
}

.area-outer-option-box {
	width: 250px;
}

.area-1, .area-2, .area-3, .area-4, .area-5, .area-6, .area-7, .area-8,
	.area-9, .area-10, .area-11 {
	font-family: Inria Serif, sans-serif;
	width: 20px;
	height: 20px;
}

.situation-outer-box {
	width: 250px;
}

.situation-box {
	display: flex;
	justify-content: center;
}

.situation {
	margin-top: 23px;
	font: 13px Inria Serif, sans-serif;
	align-content: center;
	display: block;
	font-size: 20px;
}

.situation-option-box {
	display: flex;
	width: 250px;
	margin-top: 10px;
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap; /* 여기서 중요한 부분입니다 */
}

.situation-option-box-1, .situation-option-box-2 {
	width: 250px;
	display: flex;
	margin-top: 10px;
	display: flex;
	justify-content: space-around;
}

.situation-1, .situation-2, .situation-3, .situation-4 {
	font-family: Inria Serif, sans-serif;
	width: 30px;
	height: 30px;
}

.main-text {
	width: 1000px;
	height: 83px;
	text-align: center;
	color: black;
	font-size: 22px;
	font-family: Inter;
	font-style: italic;
	font-weight: 700;
	word-wrap: break-word"
}

.select-option {
	font-size: 22px;
	font-weight: 700;
}

.head-box {
	margin-top: 30px;
	width: 1000px;
	height: 100px;
	text-align: center;
	display: flex;
	align-items: center;
}

.title {
	width: 1000px;
	height: 41px;
	text-align: center;
	color: black;
	font-size: 40px;
	font-family: "Inria Serif", serif;
	font-weight: 400px;
	word-wrap: break-word;
}

.outer-search-box {
	width: 1000px;
	height: 100px;
	display: flex;
	justify-content: center;
}

.search-box {
	width: 900px;
	height: 100px;
}

.search-box .grow {
	width: 90%;
	text-align: center;
}

.theme {
	width: 1000px;
	font-size: 25px;
	font-weight: bold;
	text-align: center;
}

.line1 {
	width: 1000px;
	height: 0px;
	position: absolute;
	border: 1px black solid;
}

.content-box {
	width: 1000px;
	height: 300px;
}

.menu-box {
	width: 1000px;
	border: 3px solid red;
	background-color: grey;
}

.img-outer-box {
	width: 1000px;
	border: 1px solid black;
	justify-content: space-between;
	border-radius: 7px;
	display: flex;
	margin-top: 15px;
	padding: 10px;
}

.img-outer-box-2 {
	width: 1000px;
	border: 1px solid black;
	justify-content: center; /* 수평 중앙 정렬 */
	border-radius: 7px;
	display: flex;
	margin-top: 15px;
	padding: 10px;
}

.con-box, .self-box, .trend-box, .community-box {
	margin-top: 20px;
}

.theme {
	width: 550px;
	display: flex;
}

.img-making, .personal, .recommend-1, .recommend-2, .recommend-3 {
	width: 350px;
	display: inline-block;
	border: 1px solid;
	font-size: 20px;
	padding: 5px;
}

.list-box {
	margin-top: 50px;
}

.img-box-1, .img-box-2, .img-box-3 {
	border: 3px solid green;
	width: 1000px;
	border: 1px solid black;
	justify-content: space-between;
	border-radius: 7px;
	display: flex;
	margin-top: 15px;
	padding: 10px;
}

.small-img-outer-box {
	width: 980px;
	border: 3px solid red; \
	overflow-x: auto; /* x 축으로 넘칠 경우 스크롤 생성 */
	white-space: nowrap; /* 요소들을 한 줄에 나열 */
}

.img-big-outer-box {
	border: 3px solid blue;
	width: 975px;
}

.small-img-outer-box>.img-big-outer-box>.img-box-1 {
	border: 3px solid green;
	width: auto; /* 요소의 크기를 자동으로 조절 */
	flex-shrink: 0; /* 요소가 자동으로 축소되지 않도록 설정 */
}

.pagination-container {
	border: 3px solid blue;
	display: flex;
	justify-content: center;
}
</style>
<div class="outer-box">
	<div class="small-outer-box">
		<div class="search-box">
			<div class="price-outer-box">
				<div class="price-box">
					<div class="price">가격</div>
				</div>

				<div class="price_option_box">
					<div class="price-1 btn btn-outline">~7</div>
					<div class="price-2 btn btn-outline">~10</div>
					<div class="price-3 btn btn-outline">~20</div>
					<div class="price-4 btn btn-outline">30~</div>
				</div>
			</div>

			<div class="area-outer-box">
				<div class="line"></div>
				<div class="area-box">
					<div class="area">지역</div>
				</div>

				<div class="area-outer-option-box">
					<div class="area-option-box-1">
						<div class="area-1 btn btn-outline">서울</div>
						<div class="area-2 btn btn-outline">경기</div>
						<div class="area-3 btn btn-outline">인천</div>
					</div>
					<div class="area-option-box-2">
						<div class="area-4 btn btn-outline">세종</div>
						<div class="area-5 btn btn-outline">대전</div>
						<div class="area-6 btn btn-outline">충청</div>
					</div>
					<div class="area-option-box-3">
						<div class="area-7 btn btn-outline">부산</div>
						<div class="area-8 btn btn-outline">
							광주
							<br />
							전라
						</div>
						<div class="area-9 btn btn-outline">
							대구
							<br />
							경상
						</div>
					</div>
					<div class="area-option-box-4">
						<div class="area-10 btn btn-outline">강원</div>
						<div class="area-11 btn btn-outline">제주</div>
					</div>
				</div>

			</div>
			<div class="situation-outer-box">
				<div class="line"></div>
				<div class="situation-box">
					<div class="situation">상황</div>
				</div>

				<div class="situation-option-box">
					<div class="situation-option-box-1">
						<div class="situation-1 btn btn-outline">일상</div>
						<div class="situation-2 btn btn-outline">비지니스</div>
					</div>
					<div class="situation-option-box-2">

						<div class="situation-3 btn btn-outline">소개팅</div>
						<div class="situation-4 btn btn-outline">면접</div>
					</div>

				</div>
			</div>
		</div>

	</div>
	<div class="content-outer-box">

		<div class="small-outer-box-2">

			<div class="main-text">${rq.loginedMember.nickname }님만을위한추천 컨설팅 업체</div>

			<div class="con-box">
				<div class="menu-box">
					<div class="theme">

						<div class="img-making">이미지메이킹</div>
						<div class="personal">퍼스널컬러</div>
					</div>

					<div class="line1"></div>
				</div>
				<div class="img-outer-box">
					<div class="sm-img-outer-box">
						<div class="img">
							<img class="banner" style="width: 290px; height: 263px" src="${shopInfoList[0].photoUrl1}" />

						</div>
						<div>가게</div>
						<div>영업식간</div>
					</div>

					<div class="sm-img-outer-box">
						<div class="img">
							<img class="banner" style="width: 290px; height: 263px" src="${shopInfoList[0].photoUrl1}" />

						</div>
						<div>가게</div>
						<div>영업식간</div>
					</div>
					<div class="sm-img-outer-box">
						<div class="img">
							<img class="banner" style="width: 290px; height: 263px" src="${shopInfoList[0].photoUrl1}" />

						</div>
						<div>가게</div>
						<div>영업식간</div>
					</div>
				</div>

			</div>
			<div class="list-box">
				<div class="main-text">ㅇㅇ들의 선택</div>

				<div class="menu-box">
					<div class="theme">

						<div class="recommend-1">별점이 높은</div>
						<div class="recommend-2">가장 저렴한</div>
						<div class="recommend-3">전문가가 친절한</div>
					</div>

					<div class="line1"></div>
				</div>

				<div class="self-box">
					<div class="menu-box">
						<div class="theme">

							<div class="img-making">이미지메이킹</div>
							<div class="personal">퍼스널컬러</div>
						</div>

						<div class="line1"></div>
					</div>
					<div class="img-outer-box-2">
						<div class="small-img-outer-box">

							<div class="img-big-outer-box">
								<c:forEach items="${shopInfoList}" var="shop">
									<div class="img-box-1">
										<div class="sm-img-outer-box">
											<div class="img">
												<img class="banner" style="width: 290px; height: 263px" src="${shop.photoUrl1}" />

											</div>
											<div class="store">${shop.shopName}</div>
											<div class="time">${shop.roadNameNum}</div>
										</div>
										<div class="sm-img-outer-box">
											<div class="img">
												<img class="banner" style="width: 290px; height: 263px" src="${shop.photoUrl1}" />

											</div>
											<div class="store">${shop.shopName}</div>
											<div class="time">${shop.roadNameNum}</div>
										</div>
										<div class="sm-img-outer-box">
											<div class="img">
												<img class="banner" style="width: 290px; height: 263px" src="${shop.photoUrl1}" />

											</div>
											<div class="store">${shop.shopName}</div>
											<div class="time">${shop.roadNameNum}</div>
										</div>
									</div>
									<div class="img-box-2">
										<div class="sm-img-outer-box">
											<div class="img">
												<img class="banner" style="width: 290px; height: 263px" src="${shop.photoUrl1}" />

											</div>
											<div class="store">${shop.shopName}</div>
											<div class="time">${shop.roadNameNum}</div>
										</div>
										<div class="sm-img-outer-box">
											<div class="img">
												<img class="banner" style="width: 290px; height: 263px" src="${shop.photoUrl1}" />

											</div>
											<div class="store">${shop.shopName}</div>
											<div class="time">${shop.roadNameNum}</div>
										</div>
										<div class="sm-img-outer-box">
											<div class="img">
												<img class="banner" style="width: 290px; height: 263px" src="${shop.photoUrl1}" />

											</div>
											<div class="store">${shop.shopName}</div>
											<div class="time">${shop.operateTime}</div>
										</div>
									</div>
									<div class="img-box-3">
										<div class="sm-img-outer-box">
											<div class="img">
												<img class="banner" style="width: 290px; height: 263px" src="${shop.photoUrl1}" />

											</div>
											<div class="store">${shop.shopName}</div>
											<div class="time">${shop.operateTime}</div>
										</div>
										<div class="sm-img-outer-box">
											<div class="img">
												<img class="banner" style="width: 290px; height: 263px" src="${shop.photoUrl1}" />

											</div>
											<div class="store">${shop.shopName}</div>
											<div class="time">${shop.operateTime}</div>
										</div>
										<div class="sm-img-outer-box">
											<div class="img">
												<img class="banner" style="width: 290px; height: 263px" src="${shop.photoUrl1}" />

											</div>
											<div class="store">${shop.shopName}</div>
											<div class="time">${shop.operateTime}</div>
										</div>
									</div>
								</c:forEach>
							</div>






							<!-- 페이지네이션 컨테이너 -->
							<div class="pagination-container">
								<!-- 	동적 페이징 -->
								<div class="pagination flex justify-center mt-3">
									<c:set var="paginationLen" value="3" />
									<c:set var="startPage" value="${page -  paginationLen  >= 1 ? page - paginationLen : 1}" />
									<c:set var="endPage" value="${page +  paginationLen  <= pagesCount ? page + paginationLen : pagesCount}" />

									<c:set var="baseUri" value="?boardId=${boardId }" />
									<c:set var="baseUri" value="${baseUri }&searchKeywordTypeCode=${searchKeywordTypeCode}" />
									<c:set var="baseUri" value="${baseUri }&searchKeyword=${searchKeyword}" />

									<c:if test="${startPage > 1 }">
										<a class="btn btn-sm" href="${baseUri }&page=1">1</a>
										<button class="btn btn-sm btn-disabled">...</button>
									</c:if>

									<c:forEach begin="${startPage }" end="${endPage }" var="i">
										<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }" href="${baseUri }&page=${i }">${i }</a>
									</c:forEach>

									<c:if test="${endPage < pagesCount }">
										<button class="btn btn-sm btn-disabled">...</button>
										<a class="btn btn-sm" href="${baseUri }&page=${pagesCount }">${pagesCount }</a>
									</c:if>

								</div>
							</div>






						</div>


					</div>



				</div>

			</div>
		</div>
	</div>

</div>


<%@ include file="../common/foot.jspf"%>