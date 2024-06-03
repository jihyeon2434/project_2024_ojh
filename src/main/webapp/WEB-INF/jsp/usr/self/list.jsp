<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="pageTitle" value="#{board.code } SELF LIST"></c:set>
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
	height: 430px;
	display: flex;
	justify-content: center;
	border: 1px solid #EFE7E5;
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
	border: 1px solid #EFE7E5;
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
	font-family: Inter, sans-serif;
	font-weight: 500;
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

.img > img{
	object-fit: cover;
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
	border: 1px solid #EFE7E5;
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
	height: 400px;
	border: 1px solid #EFE7E5;
	justify-content: space-between;
	border-radius: 7px;
	display: flex;
	margin-top: 15px;
	padding: 10px;
}

.img-outer-box-2 {
	width: 1000px;
	border: 1px solid #EFE7E5;
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
	width: 400px; /* 각 항목의 너비 정의 */
	height: 350px;
	margin-top: 15px;
	padding: 30px;
	margin: 10px;
	box-sizing: border-box; /* 너비에 패딩과 테두리를 포함 */
		border-radius: 10px;
}

.small-img-outer-box {
	width: auto;
	overflow-x: auto; /* x 축으로 넘칠 경우 스크롤 생성 */
	 white-space: nowrap; /* 요소들을 한 줄에 나열*/
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

.img-box-1 {
  transition: transform 0.3s ease, box-shadow 0.3s ease; /* 애니메이션 효과를 부드럽게 만듭니다 */
}

.img-box-1:hover {
  transform: scale(1.05); /* 이미지를 살짝 키웁니다 */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 효과를 추가하여 포인트를 줍니다 */
}

/* 커스텀 스크롤바 스타일링 */
::-webkit-scrollbar {
  width: 10px; /* 스크롤바의 너비 */
}

::-webkit-scrollbar-track {
  background: #f1f1f1; /* 스크롤바 트랙의 배경색 */
}

::-webkit-scrollbar-thumb {
  background: white; /* 스크롤바 썸의 배경색 */
  border-radius: 25px; /* 스크롤바 썸의 모서리를 둥글게 만듭니다 */

}

::-webkit-scrollbar-thumb:hover {
  background: #rgba(239, 231, 229, 0.3); /* 사용자가 스크롤바에 호버할 때의 배경색 */
}
.store{

width: 300px;}

.time{
width: 300px;}
</style>
<div class="outer-box">
	<div class="small-outer-box">
		<div class="search-box">

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
								광주 <br /> 전라
							</div>
							<div class="area-9 btn btn-outline btn-sm">
								대구 <br /> 경상
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
			<div class=price-big-outer-box>
				<div class="price-outer-box">
					<div class="price-box">
						<div class="price">가격(만원)</div>
					</div>

					<div class="price-option-box">
						<div class="price-option-box-1">
							<div class="price-1 btn btn-outline btn-sm">70,000</div>
							<div class="price-2 btn btn-outline btn-sm">100,000</div>
						</div>
						<div class="price-option-box-2">
							<div class="price-3 btn btn-outline btn-sm">200,000</div>
							<div class="price-4 btn btn-outline btn-sm">300,000</div>
						</div>
					</div>
				</div>
			</div>
			

		</div>

	</div>
	<div class="content-outer-box">

		<div class="small-outer-box-2">



<%
// 로그인 여부 확인
if (session.getAttribute("loginedMember") != null) {
    // 로그인한 경우
    com.example.demo.vo.Member loginedMember = (com.example.demo.vo.Member) session.getAttribute("loginedMember");
%>
    <div class="main-text"><%= loginedMember.getNickname() %>님만을 위한 헤어/메이크업 샵</div>
<%
} else {
    // 로그인하지 않은 경우
%>
    <div class="main-text">당신만을 위한 추천 헤어/메이크업 샵</div>
<%
}
%>




			
			<div class="con-box">
				<!-- <div class="menu-box">
					<div class="theme">

						<div class="img-making">이미지메이킹</div>
						<div class="personal">퍼스널컬러</div>
					</div>

					<div class="line1"></div>
				</div> -->
				<div class="img-outer-box-2">
					<div class="small-img-outer-box">
						<div class="img-outer-box personal-img-outer-box">
							<c:forEach var="i" begin="${startIndex}" end="${endIndex}">
								<c:if test="${i < fn:length(shopInfoList)}">
									<!-- shopInfoList의 길이를 확인하여 유효한 인덱스인지 검사합니다 -->
									<c:set var="shop" value="${shopInfoList[i]}" />
									<div class="img-box-1 personal-img-box">
										<div class="sm-img-outer-box personal-sm-img-outer-box">
											<div class="img">
												<img class="banner" style="width: 290px; height: 263px" src="${shopInfoList[0].photoUrl1}" />

											</div>
											<div>가게 ${shop.shopName}</div>
											<div>위치 ${shop.roadName }</div>
										</div>
									</div>
								</c:if>
							</c:forEach>

						</div>
					</div>
				</div>

			</div>
			<div class="list-box">
				<div class="main-text">TrendX들의 선택</div>

				<div class="menu-box">
					<div class="theme">

						<button class="theme-button recommend-1">별점이 높은</button>
						<button class="theme-button recommend-2">가장 저렴한</button>
						<!-- 	<button class="theme-button recommend-3">전문가가 친절한</button> -->
					</div>

					<div class="line1"></div>
				</div>

				<div class="self-box">
					<div class="menu-box">
						<div class="theme">

							<button class="category-button img-making">헤어</button>
							<button class="category-button personal">메이크업</button>
						</div>

						<div class="line1"></div>
					</div>
					<!-- 추천 업체 목록 -->
					<div class="img-outer-box-2">
						<div class="small-img-outer-box">
							<div class="img-big-outer-box">
								
								<c:forEach var="shop" items="${shopInfoList }">


									<!-- shopInfoList의 길이를 확인하여 유효한 인덱스인지 검사합니다 -->
									<div class="img-box-1">
										<a href="detail?id=${shop.id}&categoryId=${shop.categoryId}&themeId=${shop.themeId}">
											<div class="sm-img-outer-box">
												<div class="img">
													<img class="banner" style="width: 290px; height: 263px" src="${shop.photoUrl1}" />
												</div>
												<div class="content">

													<div class="store">${shop.shopName}</div>
													<div class="time">${shop.roadName}</div>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>
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
    var selectedRecommend = ""; // 선택된 recommend 옵션 초기화
    var selectedCategory = ""; // 선택된 category 옵션 초기화

    // 이미지메이킹 또는 퍼스널컬러 버튼 클릭 시
    $(".category-button").click(function() {
        selectedCategory = $(this).text().trim() === "헤어" ? 3 : 4; // 선택된 category 옵션을 저장

        // 선택된 버튼에 활성화된 클래스를 추가합니다.
        $(".category-button").removeClass("btn-active");
        $(this).addClass("btn-active");

        // 선택된 recommend와 category 옵션을 기반으로 데이터를 가져오는 함수 호출
        getShopsByOptions(selectedRecommend, selectedCategory);
    });

    // 별점이 높은 또는 가장 저렴한 버튼 클릭 시
    $(".recommend-1, .recommend-2").click(function() {
        selectedRecommend = $(this).hasClass("recommend-1") ? "별점이 높은" : "가장 저렴한"; // 선택된 recommend 옵션을 저장

        // 선택된 버튼에 활성화된 클래스를 추가합니다.
        $(".recommend-1, .recommend-2").removeClass("btn-active");
        $(this).addClass("btn-active");

        // 선택된 recommend와 category 옵션을 기반으로 데이터를 가져오는 함수 호출
        getShopsByOptions(selectedRecommend, selectedCategory);
    });

    // 선택된 옵션들을 기반으로 데이터를 가져오는 함수
    function getShopsByOptions(recommend, category) {
        // AJAX를 통해 서버에 선택된 옵션들을 전달하여 데이터를 가져옵니다.
        $.ajax({
            type: "GET",
            url: "/usr/self/getShopsByOptions",
            data: { recommend: recommend, category: category },
            success: function(response) {
                drawImages(response); // 가져온 데이터를 사용하여 이미지를 그리는 함수 호출
            },
            error: function(xhr, status, error) {
                // 요청이 실패했을 때의 처리
                console.error("Error:", error);
            }
        });
    }

    // 이미지를 그리는 함수
    function drawImages(shopInfoList) {
        console.log("Received shopInfoList:", shopInfoList); // shopInfoList를 콘솔에 출력하여 확인

        $(".img-big-outer-box").empty(); // 이미지 박스를 초기화합니다.
        // shopInfoList를 반복하여 이미지를 그립니다.
        $.each(shopInfoList, function(index, shop) {
            var html = '<div class="img-box-1">';
            html += '<a href="detail?id=' + shop.id + '&categoryId=' + shop.categoryId + '&themeId=' + shop.themeId + '">';
            html += '<div class="sm-img-outer-box">';
            html += '<div class="img">';
            html += '<img class="banner" style="width: 290px; height: 263px" src="' + shop.photoUrl1 + '" />';
            html += '</div>';
            html += '<div class="store">' + shop.shopName + '</div>';
            html += '<div class="time">' + shop.roadName + '</div>';
            html += '</div>';
            html += '</a>';
            html += '</div>';

            $(".img-big-outer-box").append(html);
        });
    }
});

///////////////////////////////////////////////




/* 서치박스 스크립트 */
 
$(document).ready(function() {
	 // 페이지 로드 시 서울 지역에 대한 데이터를 가져오는 함수 호출
    getShopsByArea("서울");
    var selectedPrice = ""; // 선택한 가격대
    var selectedArea = ""; // 선택한 지역
    var selectedSituation = ""; // 선택한 상황

    // 가격대 버튼 클릭 이벤트
    $(".price-1, .price-2, .price-3, .price-4").click(function() {
        // 클릭된 버튼의 텍스트 가져오기
        selectedPrice = $(this).text().trim().replace(/[^0-9]/g, '');
        
        // 선택된 옵션들을 기반으로 데이터를 가져오는 함수 호출
        getShopsByOptions(selectedPrice, selectedArea, selectedSituation);
        // 모든 가격대 버튼에서 활성 클래스 제거
        $(".price-1, .price-2, .price-3, .price-4").removeClass("btn-active");

        // 클릭된 버튼에 활성 클래스 추가
        $(this).addClass("btn-active");
        
    });

    // 상황 버튼 클릭 이벤트
    $(".situation-1, .situation-2").click(function() {
        // 클릭된 버튼의 텍스트 가져오기
        selectedSituation = $(this).text().trim();
        
        // 선택된 옵션들을 기반으로 데이터를 가져오는 함수 호출
        getShopsByOptions(selectedPrice, selectedArea, selectedSituation);

        // 모든 상황 버튼에서 활성 클래스 제거
        $(".situation-1, .situation-2").removeClass("btn-active");

        // 클릭된 버튼에 활성 클래스 추가
        $(this).addClass("btn-active");
     

    });

    // 지역 버튼 클릭 이벤트
    $(".area-1, .area-2, .area-3, .area-4, .area-5, .area-6, .area-7, .area-8, .area-9, .area-10, .area-11").click(function() {
        // 클릭된 버튼의 텍스트 가져오기
        selectedArea = $(this).text().trim();
        // 선택된 옵션들을 기반으로 데이터를 가져오는 함수 호출
        getShopsByOptions(selectedPrice, selectedArea, selectedSituation);
        // 모든 지역 버튼에서 활성 클래스 제거
        $(".area-1, .area-2, .area-3, .area-4, .area-5, .area-6, .area-7, .area-8, .area-9, .area-10, .area-11").removeClass("btn-active");

        // 클릭된 버튼에 활성 클래스 추가
        $(this).addClass("btn-active");
        

    });


    function getShopsByOptions(priceRange, area, situation) {
        // 선택한 옵션을 사용하여 가게 정보를 가져오는 AJAX 호출
        $.ajax({
            type: "GET",
            url: "/usr/self/getShopsByMyOptions",
            data: { priceRange: priceRange, area: area, situation: situation },
            success: function(response) {
                // 페이지에 새로운 가게 정보 업데이트
                setShopInfo(response);
            },
            error: function(xhr, status, error) {
                console.error("에러:", error);
            }
        });
    }
    
 // 지역에 따른 가게 정보를 가져오는 함수
    function getShopsByArea(area) {
        $.ajax({
            type: "GET",
            url: "/usr/self/getShopsByArea",
            data: { area: area },
            success: function(response) {
                setShopInfo(response); // 받아온 데이터를 페이지에 세팅하는 함수 호출
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
            }
        });
    }

    // 페이지에 가게 정보 업데이트하는 함수
    function setShopInfo(shopInfoList) {
        // 페이지에서 기존 가게 정보 삭제
        $(".img-outer-box").empty();

        // 새로운 가게 정보로 페이지 업데이트
        $.each(shopInfoList, function(index, shop) {
            var html = '<div class="img-box-1">';
            html += '<a href="detail?id=' + shop.id + '&categoryId=' + shop.categoryId + '&themeId=' + shop.themeId + '">';
            html += '<div class="personal-sm-img-outer-box">';
            html += '<div class="img">';
            html += '<img class="banner" style="width: 290px; height: 263px" src="' + shop.photoUrl1 + '" />';
            html += '</div>';
            html += '<div class="store">' + shop.shopName + '</div>';
            html += '<div class="time">' + shop.roadName + '</div>';
            html += '</div>';
            html += '</a>';
            html += '</div>';

            $(".img-outer-box").append(html);
        });
    }
});







$(document).ready(function() {
    // 이미지메이킹 또는 퍼스널컬러 버튼 클릭 시
    $(".category-button").click(function() {
        var categoryId = $(this).text().trim() === "헤어샵" ? 3 : 4;
        // AJAX 요청을 보내기 전에 활성화된 버튼 클래스를 제거합니다.
        $(".category-button").removeClass("btn-active");

        // 클릭된 버튼에 활성화된 클래스를 추가합니다.
        $(this).addClass("btn-active");

        $.ajax({
            type: "GET",
            url: "/usr/self/showList",
            data: { categoryId: categoryId },
            success: function(response) {
                drawImages(response);
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
            }
        });
    }); 
});



 



// 이미지를 그리는 함수
function drawImages(shopInfoList) {
    console.log("Received shopInfoList:", shopInfoList); // shopInfoList를 콘솔에 출력하여 확인

    $(".img-big-outer-box").empty(); // 이미지 박스를 초기화합니다.
    // shopInfoList를 반복하여 이미지를 그립니다.
    $.each(shopInfoList, function(index, shop) {
        var html = '<div class="img-box-1">';
        html += '<a href="detail?id=' + shop.id + '&categoryId=' + shop.categoryId + '&themeId=' + shop.themeId + '">';
        html += '<div class="sm-img-outer-box">';
        html += '<div class="img">';
        html += '<img class="banner" style="width: 290px; height: 263px" src="' + shop.photoUrl1 + '" />';
        html += '</div>';
        html += '<div class="store">' + shop.shopName + '</div>';
        html += '<div class="time">' + shop.roadName + '</div>';
        html += '</div>';
        html += '</a>';
        html += '</div>';

        $(".img-big-outer-box").append(html);
    });
} 

// 별점이 높은 가게 목록을 가져오는 함수
function getHighPointShops() {
    // AJAX를 통해 서버로부터 별점이 높은 가게 목록을 요청합니다.
    $.ajax({
        type: "GET",
        url: "/usr/self/getHighPointShops",
        success: function(response) {
            drawImages(response); // 가져온 가게 목록을 이미지로 그리는 함수 호출
        },
        error: function(xhr, status, error) {
            // 요청이 실패했을 때의 처리
            console.error("Error:", error);
        }
    });
}




$(document).ready(function() {
    // 지역 버튼 클릭 시
    $(".area-1, .area-2, .area-3, .area-4, .area-5, .area-6, .area-7, .area-8, .area-9, .area-10, .area-11").click(function() {
        var area = $(this).text().trim(); // 클릭된 버튼의 텍스트를 가져옵니다.
        
        // AJAX를 통해 서버에 요청을 보냅니다.
        $.ajax({
            type: "GET",
            url: "/usr/self/getShopsByArea", // 해당 URL은 실제 사용하는 URL로 변경해야 합니다.
            data: { area: area },
            success: function(response) {
                // 가져온 데이터를 사용하여 이미지를 그리는 함수를 호출합니다.
              
                console.log(response);
                setShopInfo(response);
            },
            error: function(xhr, status, error) {
                // 요청이 실패했을 때의 처리
                console.error("Error:", error);
            }
        });
    });
});
//받아온 업체 정보를 페이지에 세팅하는 함수
function setShopInfo(shopInfoList) {
    // 이미지 박스 초기화
    $(".img-outer-box").empty();
    
    if (shopInfoList.length === 0) {
        // 만약 shopInfoList가 비어있는 경우, 메시지를 표시하거나 아무 작업도 수행하지 않도록 처리할 수 있습니다.
        // 여기서는 간단히 아무 작업도 수행하지 않습니다.
        return;
    }


    // 받아온 업체 정보를 반복하여 페이지에 세팅합니다.
    $.each(shopInfoList, function(index, shop) {
        var html = '<div class="img-box-1">';
        html += '<a href="detail?id=' + shop.id + '&categoryId=' + shop.categoryId + '&themeId=' + shop.themeId + '">';
        html += '<div class="personal-sm-img-outer-box">';
        html += '<div class="img">';
        html += '<img class="banner" style="width: 290px; height: 263px" src="' + shop.photoUrl1 + '" />';
        html += '</div>';
        html += '<div class="store">' + shop.shopName + '</div>';
        html += '<div class="time">' + shop.roadName + '</div>';
        html += '</div>';
        html += '</a>';
        html += '</div>';

        $(".img-outer-box").append(html);
    });
}

</script>

<%@ include file="../common/foot.jspf"%>