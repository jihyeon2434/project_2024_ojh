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
  width: 170px;
  height: 550px;
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

.search-box {
  width: 200px;
  border: 2px solid red;
}

.price-outer-box {
  width: 150px;
  display: flex;
  justify-content: center;
  border: 3px solid pink;
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
  border: 1px solid;
  align-content: center;
  display: block;
  font-size: 20px;
}
.price_option_box {
  width: auto;
  border: 3px solid;
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
  border: 3px solid;
  align-content: center;
  display: block;
  font-size: 20px;
}

.area-outer-box {
  width: 150px;
  display: flex;
  margin-top: 39px;
  flex-direction: column;
  align-items: center;
  padding: 0 10px;
  border: 3px solid red;
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
  border: 3px solid purple;
  display: flex;
  width: 150px;
  margin-top: 10px;
  display: flex;
  justify-content: space-around;
}

.area-outer-option-box {
  width: 150px;

  border: 5px solid yellow;
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
  border: 7px solid red;
  width: 150px;
}

.situation-box {
  display: flex;
  justify-content: center;
}
.situation {
  margin-top: 23px;
  font: 13px Inria Serif, sans-serif;
  border: 1px solid;
  align-content: center;
  display: block;
  font-size: 20px;
}
.situation-option-box {
  border: 5px solid blue;
  display: flex;
  width: 150px;
  margin-top: 10px;
  display: flex;
  justify-content: space-around;
 
  flex-wrap: wrap; /* 여기서 중요한 부분입니다 */
}

.situation-option-box-1,
.situation-option-box-2 {
  width: 170px;
  border: 3px solid yellow;
  display: flex;
  width: 150px;
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
  border: 3px solid green;
  
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
        </div>

      </div>

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
    </div>
  </div>

</div>

				<script>
				let intervalId;

				function startScroll() {
				  intervalId = setInterval(() => {
				    const group = document.querySelector(".box-1");
				    group.scrollLeft += 5; // 스크롤 속도를 조절합니다
				  }, 50); // 스크롤 간격을 조절합니다
				}

				function stopScroll() {
				  clearInterval(intervalId);
				}

				function scrollHandler(event) {
				  event.preventDefault();
				  const group = document.querySelector(".box-1");
				  group.scrollLeft += event.deltaY;
				}

</script>


				<%@ include file="../common/foot.jspf"%>