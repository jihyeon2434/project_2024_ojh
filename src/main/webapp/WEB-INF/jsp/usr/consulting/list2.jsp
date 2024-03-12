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

.content-outer-box{
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

.price_option_box > div{
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

.area-option-box-1,
.area-option-box-2,
.area-option-box-3,
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

.area-1,
.area-2,
.area-3,
.area-4,
.area-5,
.area-6,
.area-7,
.area-8,
.area-9,
.area-10,
.area-11 {
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

.situation-option-box-1,
.situation-option-box-2 {
  width: 250px;
  display: flex;
  margin-top: 10px;
  display: flex;
  justify-content: space-around;
}


.situation-1,
.situation-2,
.situation-3,
.situation-4 {
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

.select-option{
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
}

.img-box {
	width: 1000px;
	border: 1px solid black;
	justify-content: space-between;
	border-radius: 7px;
	display: flex;
	margin-top: 15px;
	padding: 10px;
}

.con-box, .self-box, .trend-box, .community-box {
	margin-top: 20px;
}


.theme{
  width: 350px;
  display: flex;

}
.img-making, .personal{
  display: inline-block;
  border: 1px solid;
  font-size: 20px;
  padding: 5px;
  
}

.list-box{
margin-top: 50px;
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

      <div class="main-text"> ${rq.loginedMember.nickname }님만을 위한 추천 컨설팅 업체
      </div>

      <div class="con-box">
        <div class="menu-box">
          <div class="theme">

            <div class="img-making">이미지메이킹</div>
            <div class="personal">퍼스널컬러</div>
          </div>

          <div class="line1"></div>
        </div>
        <div class="img-box">
          <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
          <div class="img">
            <img class="banner" style="width: 290px; height: 263px;" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
           <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
          <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
          <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
          <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
          
        </div>

      </div>
<div class="list-box">
      <div class="main-text"> ㅇㅇ들의 선택
      </div>
      <div class="select-option">
        별점이 높은
      </div>

      <div class="self-box">
        <div class="menu-box">
          <div class="theme">

            <div class="img-making">이미지메이킹</div>
            <div class="personal">퍼스널컬러</div>
          </div>

          <div class="line1"></div>
        </div>
        <div class="img-box">
          <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
          <div class="img">
            <img class="banner" style="width: 290px; height: 263px;" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
           <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
          <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
            <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
            <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
        </div>

      </div>
      <div class="select-option">
        현재 가장 저렴한
      </div>
      <div class="trend-box">
        <div class="menu-box">
          <div class="theme">

            <div class="img-making">이미지메이킹</div>
            <div class="personal">퍼스널컬러</div>
          </div>

          <div class="line1"></div>
        </div>
        <div class="img-box">
          <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
           <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
           <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
           <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
          <div class="img">
            <img class="banner" style="width: 290px; height: 263px;" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
          <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
        </div>

      </div>

      <div class="select-option">
        ㅇㅇ가 보장하는 친절한 전문가
      </div>
      <div class="trend-box">
        <div class="menu-box">
          <div class="theme">

            <div class="img-making">이미지메이킹</div>
            <div class="personal">퍼스널컬러</div>
          </div>

          <div class="line1"></div>
        </div>
        <div class="img-box">
          <div class="img-container">
          <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
          <div class="img">
            <img class="banner" style="width: 290px; height: 263px;" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
          <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>    
          </div>
        <div  class="img-container">
          <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
           <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>
          <div class="img">
            <img class="banner" style="width: 290px; height: 263px" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20231028_158%2F16984822151220mGR2_PNG%2F%25C1%25A4%25C7%25FD%25B7%25C3%25B4%25D4-%25BA%25AF%25C8%25AF.png" />
          </div>  
        </div>
        
        </div>

      </div>
      </div>
    </div>
  </div>

</div>

				<script>
				$(document).ready(function(){
				    let containerIndex = 0; // 현재 보여지고 있는 이미지 그룹의 인덱스
				    let containerCount = $('.img-container').length; // 전체 이미지 그룹의 개수
				    let containerWidth = $(window).outerWidth(); // 브라우저 가로 사이즈
				    
				    function updateContainer() {
				        $('.img-container').css({
				            width: containerCount * containerWidth, // 전체 컨테이너의 가로 길이 조정
				            height: '100vh',
				            position: 'fixed',
				            top: 0,
				            left: -containerIndex * containerWidth // 현재 보여지는 이미지 그룹으로 이동
				        });

				        // body의 높이 조정하여 스크롤 가능하도록 설정
				        $('body').css({
				            height: '100vh'
				        });
				    }

				    updateContainer(); // 초기 설정 적용

				    $(window).resize(function(){
				        containerWidth = $(window).outerWidth(); // 브라우저 사이즈 변경시 가로 사이즈 업데이트
				        updateContainer(); // 변경된 사이즈에 맞춰 다시 설정
				    });

				    // 마우스 휠 이벤트 처리
				    $(window).on('mousewheel DOMMouseScroll', function(event) {
				        let delta = event.originalEvent.wheelDelta || -event.originalEvent.detail;

				        if (delta < 0 && containerIndex < containerCount - 1) {
				            // 스크롤 다운시 다음 이미지 그룹으로 이동
				            containerIndex++;
				            $('.img-container').animate({
				                left: -containerIndex * containerWidth
				            }, 500);
				        } else if (delta > 0 && containerIndex > 0) {
				            // 스크롤 업시 이전 이미지 그룹으로 이동
				            containerIndex--;
				            $('.img-container').animate({
				                left: -containerIndex * containerWidth
				            }, 500);
				        }
				    });
				});

</script>


				<%@ include file="../common/foot.jspf"%>