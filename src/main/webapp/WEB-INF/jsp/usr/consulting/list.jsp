<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="pageTitle" value="#{board.code } CONSULTING LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.outer-box {
	display: flex;
	margin-top: 30px;
}

.small-outer-box {
	padding-top: 20px;
	margin-left: 20px;
	padding-bottom: 20px;
	width: 235px;
	height: 590px;
	display: flex;
	justify-content: center;
	border: solid 1px;
	border-radius: 5px;
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

.price-box {
	display: flex;
	justify-content: center;
}

.price {
	font: 15px Inria Serif, sans-serif;
	align-content: center;
	display: block;
}

.price_option_box {
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
	font-size: 15px;
}

.area-outer-box {
	width: 250px;
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 0 10px;
}

.line {
	border-color: rgba(0, 0, 0, 1);
	border: 0.5px black solid; /* 0.5px로 변경 */
	border-style: solid;
	width: 220px;
	margin-left: 15px;
}

.area-option-box-1, .area-option-box-2, .area-option-box-3,
	.area-option-box-4 {
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
	font-size: 15px;
}

.situation-option-box, .price-option-box {
	display: flex;
	width: 250px;
	margin-top: 10px;
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap; /* 여기서 중요한 부분입니다 */
}

.situation-option-box-1, .situation-option-box-2, .price-option-box-1,
	.price-option-box-2 {
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
	font-size: 20px;
	font-style: Inria-serif;
	font-weight: 600;
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
	display: : flex;
	justify-content: center;
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
	border: 0.5px black solid; /* 0.5px로 변경 */
}

.content-box {
	width: 1000px;
	height: 300px;
}

.menu-box {
	width: 1000px;
	background-color: rgba(239, 231, 229, 0.3); /* 불투명도 조정 */
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
	border: 0.5px solid #EFE7E5;
	font-size: 15px;
	font-weight: 5px;
	padding: 5px;
}

.list-box {
	margin-top: 50px;
}

.img-box-1 {
	border: 0.5px solid #EFE7E5;
	width: 300px; /* 각 항목의 너비 정의 */
	height: 330px;
	margin-top: 15px;
	padding: 10px;
	box-sizing: border-box; /* 너비에 패딩과 테두리를 포함 */
}

.small-img-outer-box {
	width: 980px;
	overflow-x: auto; /* x 축으로 넘칠 경우 스크롤 생성 */
	white-space: nowrap; /* 요소들을 한 줄에 나열 */
}

.img-big-outer-box {
	width: 975px;
	height: 1000px;
	display: flex; /* 플렉스 박스 사용 */
	flex-wrap: wrap; /* 줄 바꿈 허용 */
	justify-content: space-between; /* 주 축을 따라 아이템을 고르게 분산 */
}

.small-img-outer-box>.img-big-outer-box>.img-box-1 {
	border: 0.5px solid #EFE7E5;
	width: 300px; /* 요소의 크기를 자동으로 조절 */
	display: inline-block;
}

.pagination-container {
	display: flex;
	justify-content: center;
}

.btn {
	width: 55px;
	font-size: 10px;
}

.price-big-outer-box {
	height: 150px;
}

.area-big-outer-box {
	height: 250px;
}

.situation-big-outer-box {
	height: 150px;
}

.ok-outer-box {
	width: 235x;
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.time {
	font-size: 10px;
}
</style>
<div class="outer-box">
	<div class="small-outer-box">
		<div class="search-box">
			<div class=price-big-outer-box>
				<div class="price-outer-box">
					<div class="price-box">
						<div class="price">가격(만원)</div>
					</div>

					<div class="price-option-box">
						<div class="price-option-box-1">
							<div class="price-1 btn btn-outline btn-sm">~7</div>
							<div class="price-2 btn btn-outline btn-sm">~10</div>
						</div>
						<div class="price-option-box-2">
							<div class="price-3 btn btn-outline btn-sm">~20</div>
							<div class="price-4 btn btn-outline btn-sm">30~</div>
						</div>
					</div>
				</div>
			</div>

			<div class="line"></div>
			<div class="area-big-outer-box">
				<div class="area-outer-box">

					<div class="area-box">
						<div class="area">지역</div>
					</div>

					<div class="area-outer-option-box">
						<div class="area-option-box-1">
							<div class="area-1 btn btn-outline btn-sm">서울</div>
							<div class="area-2 btn btn-outline btn-sm">경기</div>
							<div class="area-3 btn btn-outline btn-sm">인천</div>
						</div>
						<div class="area-option-box-2">
							<div class="area-4 btn btn-outline btn-sm">세종</div>
							<div class="area-5 btn btn-outline btn-sm">대전</div>
							<div class="area-6 btn btn-outline btn-sm">충청</div>
						</div>
						<div class="area-option-box-3">
							<div class="area-7 btn btn-outline btn-sm">부산</div>
							<div class="area-8 btn btn-outline btn-sm">
								광주
								<br />
								전라
							</div>
							<div class="area-9 btn btn-outline btn-sm">
								대구
								<br />
								경상
							</div>
						</div>
						<div class="area-option-box-4">
							<div class="area-10 btn btn-outline btn-sm">강원</div>
							<div class="area-11 btn btn-outline btn-sm">제주</div>
						</div>
					</div>

				</div>
			</div>

			<div class="line"></div>
			<div class="situation-big-outer-box">
				<div class="situation-outer-box">

					<div class="situation-box">
						<div class="situation">상황</div>
					</div>

					<div class="situation-option-box">
						<div class="situation-option-box-1">
							<div class="situation-1 btn btn-outline btn-sm">일상</div>
							<div class="situation-2 btn btn-outline btn-sm">비지니스</div>
						</div>
						<div class="situation-option-box-2">

							<div class="situation-3 btn btn-outline btn-sm">소개팅</div>
							<div class="situation-4 btn btn-outline btn-sm">면접</div>
						</div>

					</div>
				</div>

			</div>
			<div class=ok-outer-box>
				<div class="ok-btn btn btn-active btn-neutral">확인</div>
			</div>

		</div>

	</div>
	<div class="content-outer-box">

		<div class="small-outer-box-2">

			<div class="main-text">${rq.loginedMember.nickname }님만을위한추천컨설팅업체</div>

			<div class="con-box">
				<div class="menu-box">
					<div class="theme">

						<div class="img-making">이미지메이킹</div>
						<div class="personal">퍼스널컬러</div>
					</div>

					<div class="line1"></div>
				</div>
				<div class="img-outer-box">
					<div class="img-box-1">
						<div class="sm-img-outer-box">
							<div class="img">
								<img class="banner" style="width: 290px; height: 263px" src="${shopInfoList[0].photoUrl1}" />

							</div>
							<div>가게</div>
							<div>영업식간</div>
						</div>
					</div>
					<div class="img-box-1">
						<div class="sm-img-outer-box">
							<div class="img">
								<img class="banner" style="width: 290px; height: 263px" src="${shopInfoList[0].photoUrl1}" />

							</div>
							<div>가게</div>
							<div>영업식간</div>
						</div>
					</div>
					<div class="img-box-1">
						<div class="sm-img-outer-box">
							<div class="img">
								<img class="banner" style="width: 290px; height: 263px" src="${shopInfoList[0].photoUrl1}" />

							</div>
							<div>가게</div>
							<div>영업식간</div>
						</div>
					</div>
				</div>

			</div>
			<div class="list-box">
				<div class="main-text">ㅇㅇ들의 선택</div>

				<div class="menu-box">
					<div class="theme">

						<button class="theme-button recommend-1">별점이 높은</button>
						<button class="theme-button recommend-2">가장 저렴한</button>
						<button class="theme-button recommend-3">전문가가 친절한</button>
					</div>

					<div class="line1"></div>
				</div>

				<div class="self-box">
					<div class="menu-box">
						<div class="theme">

							<button class="theme-button img-making">이미지메이킹</button>
							<button class="theme-button personal">퍼스널컬러</button>
						</div>

						<div class="line1"></div>
					</div>
					<!-- 추천 업체 목록 -->
					<div class="img-outer-box-2">
						<div class="small-img-outer-box">
							<div class="img-big-outer-box">
								<%-- 페이지네이션을 위한 변수 설정 --%>
								<c:set var="pageSize" value="9" />
								<c:set var="totalShops" value="${fn:length(shopInfoList)}" />
								<c:set var="pagesCount" value="${totalShops / pageSize + (totalShops % pageSize > 0 ? 1 : 0)}" />
								<c:set var="page" value="${param.page != null ? param.page : 1}" />
								<c:set var="startIndex" value="${(page - 1) * pageSize}" />
								<c:set var="endIndex" value="${startIndex + pageSize - 1}" />

								<%-- 페이지에 표시될 가게 정보를 추출하여 표시 --%>
								<c:forEach var="i" begin="${startIndex}" end="${endIndex}">
									<c:if test="${i < fn:length(shopInfoList)}">
										<!-- shopInfoList의 길이를 확인하여 유효한 인덱스인지 검사합니다 -->
										<c:set var="shop" value="${shopInfoList[i]}" />
										<div class="img-box-1">
											<a href="detail?id=${shop.id }">
												<div class="sm-img-outer-box">
													<div class="img">
														<img class="banner" style="width: 290px; height: 263px" src="${shop.photoUrl1}" />
													</div>
													<div class="store">${shop.shopName}</div>
													<div class="time">${shop.roadName}</div>
												</div>
											</a>
										</div>
									</c:if>
								</c:forEach>
							</div>

							<%-- 페이지네이션 버튼 생성 --%>
							<div class="pagination-container">
								<div class="pagination flex justify-center mt-3">
									<%-- 이전 페이지 버튼 --%>
									<c:if test="${page > 1}">
										<a class="btn btn-xs"
											href="?boardId=${boardId}&searchKeywordTypeCode=${searchKeywordTypeCode}&searchKeyword=${searchKeyword}&page=${page - 1}">&lt;</a>
									</c:if>

									<%-- 페이지 버튼 --%>
									<c:forEach var="i" begin="1" end="${pagesCount}">
										<a class="btn btn-xs ${page == i ? 'btn-active' : ''}"
											href="?boardId=${boardId}&searchKeywordTypeCode=${searchKeywordTypeCode}&searchKeyword=${searchKeyword}&page=${i}">${i}</a>
									</c:forEach>

									<%-- 다음 페이지 버튼 --%>
									<c:if test="${page < pagesCount}">
										<a class="btn btn-xs"
											href="?boardId=${boardId}&searchKeywordTypeCode=${searchKeywordTypeCode}&searchKeyword=${searchKeyword}&page=${page+1}">&gt;</a>
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

<script>
  // 페이지 변수 설정
  var totalShops = ${fn:length(shopInfoList)};
  var pageSize = 9;
  var pagesCount = Math.ceil(totalShops / pageSize);
  var currentPage = ${param.page != null ? param.page : 1};

  // 마지막 페이지인 경우 다음 페이지 버튼을 숨김
  if (currentPage === pagesCount) {
    document.querySelector('.pagination-container .pagination').lastElementChild.style.display = 'none';
  }
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function() {
    // "이미지메이킹" 버튼 클릭 시
    $(".img-making").click(function() {
        // shopInfoList를 활용하여 이미지를 그립니다.
        drawImages();
    });

    // 이미지를 그리는 함수
    function drawImages() {
        // 이미지를 그리기 위해 shopInfoList를 사용합니다.
        $(".img-big-outer-box").empty(); // 이미지 박스를 초기화합니다.
        <%-- shopInfoList를 반복하여 이미지를 그립니다. --%>
        <c:forEach var="shop" items="${shopInfoList}">
            var html = '<div class="img-box-1">';
            html += '<a href="detail?id=${shop.id }">';
            html += '<div class="sm-img-outer-box">';
            html += '<div class="img">';
            html += '<img class="banner" style="width: 290px; height: 263px" src="${shop.photoUrl1}" />';
            html += '</div>';
            html += '<div class="store">${shop.shopName}</div>';
            html += '<div class="time">${shop.roadName}</div>';
            html += '</div>';
            html += '</a>';
            html += '</div>';

            $(".img-big-outer-box").append(html);
        </c:forEach>
    }
});
</script>



<%@ include file="../common/foot.jspf"%>