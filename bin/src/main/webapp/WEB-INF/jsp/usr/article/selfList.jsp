<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<style>

/* "Group60" 클래스에 대한 CSS 스타일 */
.Group60 {
  width: 225.66px;
  height: 41px;
  position: absolute;
  top: 142px;
  left: 290px;
  text-align: center;
  font-size: 15px;
  font-family: "Inria Serif", serif;
  font-weight: 400;
  word-wrap: break-word;

  display: flex;
  align-items: center; /* 세로 중앙 정렬 */
}

/* "Rectangle40" 클래스에 대한 CSS 스타일 */
.Rectangle40,
.Rectangle41 {
  height: 41px;
  width: 113.34px;
  position: absolute;
  background: rgba(239, 231, 229, 0.27);

  display: flex;
  justify-content: center; /* 가로 중앙 정렬 */
  align-items: center; /* 세로 중앙 정렬 */
}

.Rectangle41 {
  left: 112.42px;
}

/* "Line10" 클래스에 대한 CSS 스타일 */
.Line10 {
  width: 41px;
  height: 0px;
  position: absolute;
  top: 0;
  left: 113px;
  transform: rotate(90deg);
  transform-origin: 0 0;
  border: 1px black solid;
}

.Line11 {
  width: 41px;
  height: 0px;
  position: absolute;
  top: 0;
  left: 227px;
  transform: rotate(90deg);
  transform-origin: 0 0;
  border: 1px black solid;
}
/* "box-1" 클래스에 대한 CSS 스타일 */
.box-1 {
  width: 900px;
  height: 260px;
  position: relative;
  left: 290px;
  top: 50px;
  white-space: nowrap;
  overflow: hidden;
  border: 2px solid black;
  padding: 10px;
}

/* "Group163" 클래스에 대한 CSS 스타일 */
.Group163 {
  width: 1168px;
  height: 261px;
  position: relative;
  display: inline-block;
  overflow: hidden;
}

/* "Rectangle" 클래스에 대한 CSS 스타일 */
.Rectangle {
  width: 260px;
  height: 260px;
  background: #d9d9d9;
  border-radius: 5px;
  display: inline-block;
  margin-right: 20px;
}

/* "Rectangle43" 클래스에 대한 CSS 스타일 */
.Rectangle43 {
  width: 223px;
  height: 350px;
  background: rgba(239, 231, 229, 0.28);
  position: absolute;
  top: 50px;
}

.Rectangle2434 {
  width: 120px;
  height: 40px;
  background: rgba(239, 231, 229, 0.28);
  position: relative;
  top: 0px;
  left: 225px;
  display: flex;
  justify-content: center; /* 가로 중앙 정렬 */
  align-items: center; /* 세로 중앙 정렬 */
}

.scrollbar-price {
  top: 15px;
}
.scrollbar-area {
  top: 30px;
}
.scrollbar-situation {
  top: 80px;
}

.price-option {
  text-align: center;
}

.area-option {
  text-align: center;
}

/* "scrollbar-price", "scrollbar-area", "scrollbar-situation" 클래스에 대한 CSS 스타일 */
.scrollbar-price,
.scrollbar-area,
.scrollbar-situation {
  width: 222px;
  height: 39px;
  text-align: center;
  color: black;
  font-size: 13px;
  font-weight: 400;
  word-wrap: break-word;
  position: relative;
}

/* "price-option", "area-option", "st-option" 클래스에 대한 CSS 스타일 */
.price-option > div,
.area-option > div,
.st-option > div {
  width: 40px;
  height: 20px;
  border-radius: 5px;
  margin: 3px;
  display: inline-block;
  text-align: center;
  color: black;
  background: grey;
  font-size: 10px;
  position: relative;
}

.area-option > div {
  display: inline-block;
}

.area-option > div > div {
  display: inline-block;
}

/* "line1", "line2" 클래스에 대한 CSS 스타일 */
.line1,
.line2 {
  width: 220px;
  height: 0px;
  position: relative;
  border: 1px rgba(239, 231, 229, 0.7) solid;
}

.line1 {
  top: 20px;
}

.line2 {
  top: 25px;
}
.section-2 {
  position: absolute;
  top: 190px;
}

.section-2-wrapper {
  position: relative;
}

.section-2 > .Group60 {
  position: absolute;
  left: 290px;
  top: 90px;
}

.section-2 > .box-1 > .Group163 {
  position: absolute;
  left: -8px;
}

.section-2-wrapper > .section-2 > .popular {
  left: 180px; /* 원래 코드에서 제거 */
  top: 47px; /* 원래 코드에서 제거 */
}

.section-3 {
  position: absolute;
  top: 390px;
}

.section-3-wrapper {
  position: relative;
}

.section-3 > .box-1 > .Group163 {
  position: absolute;
  left: -8px;
}

.section-3 > .box-1 {
  position: absolute;
  top: 340px;
  left: 240px;
}

.popular {
  width: 333px;
  height: 48px;
  color: black;
  font-size: 22px;
  font-family: Inter;
  font-weight: 400;
  word-wrap: break-word;
  position: absolute;
  left: 155px;
  top: 260px;
  font-weight: bold;
}

.section-3 > .Group60 {
  position: absolute;
  left: 240px;
  top: 300px;
}

</style>

<div class="section-1">
  <div style="width: 1196px; height: 83px; text-align: center; color: black; font-size: 22px; font-family: Inter; font-style: italic; font-weight: 700; word-wrap: break-word; position: relative; top: 20px;">님만을 위한 self 정보 추천</div>

  <div class="Group60">
    <div class="Rectangle40">
      <div>헤어</div>
    </div>
    <div class="Rectangle41">
      <div>메이크업</div>
    </div>

    <div class="Rectangle2434">
      <div>옷</div>
    </div>
    <div class="Line10"></div>
    <div class="Line11"></div>
  </div>

  <div class="box-1">
    <div class="Group163">
      <div class="Rectangle" id="rect1"></div>
      <div class="Rectangle" id="rect2"></div>
      <div class="Rectangle" id="rect3"></div>
      <div class="Rectangle" id="rect4"></div>
    </div>
  </div>
</div>

<div class="Rectangle43">
  <div class="all">
    <div class="price">
      <div class="scrollbar-price">가격</div>
      <div class="price-option">
        <div>~7</div>
        <div>~10</div>
        <div>~20</div>
        <div>~30</div>
      </div>
    </div>
    <div class="line1"></div>
    <div class="area">
      <div class="scrollbar-area">지역</div>
      <div class="area-option">
        <div class="option-1">
          <div>서울</div>
          <div>경기</div>
          <div>인천</div>
        </div>
        <div class="option-2">
          <div>세종</div>
          <div>대전충청</div>
          <div>부산</div>
        </div>
        <div class="option-3">
          <div>광주전라</div>
          <div>대구경상</div>
          <div>강원</div>
        </div>
        <div class="option-4">
          <div>제주</div>
        </div>
      </div>
    </div>
    <div class="line2"></div>
    <div class="situation">
      <div class="scrollbar-situation">상황</div>
      <div class="st-option">
        <div>일상</div>
        <div>비지니스</div>
        <div>소개팅</div>
        <div>면접</div>

        <div class="section-2-wrapper">
          <div class="section-2">
            <div style="width: 1196px; height: 83px; text-align: center; color: black; font-size: 22px; font-family: Inter; font-style: italic; font-weight: 700; word-wrap: break-word">ㅇㅇ들의 선택</div>

            <div class="popular">별점이 높은</div>
            <div class="Group60">
              <div class="Rectangle40">
                <div>헤어</div>
              </div>
              <div class="Rectangle41">
                <div>메이크업</div>
              </div>
              <div class="Rectangle2434">
                <div>옷</div>
              </div>
              <div class="Line10">
              </div>
              <div class="Line11"></div>
            </div>
            <div class="box-1">
              <div class="Group163">
                <div class="Rectangle" id="rect1"></div>
                <div class="Rectangle" id="rect2"></div>
                <div class="Rectangle" id="rect3"></div>
                <div class="Rectangle" id="rect4"></div>
              </div>
            </div>
          </div>
        </div>

        <div class="section-3-wrapper">
          <div class="section-3">
            <div class="popular">현재 가장 저렴한</div>

            <div class="Group60">
              <div class="Rectangle40">
                <div>헤어</div>
              </div>
              <div class="Rectangle41">
                <div>메이크업</div>
              </div>
              <div class="Rectangle2434">
                <div>옷</div>
              </div>
              <div class="Line10"></div>
              <div class="Line11"></div>
            </div>

            <div class="box-1">
              <div class="Group163">
                <div class="Rectangle" id="rect1"></div>
                <div class="Rectangle" id="rect2"></div>
                <div class="Rectangle" id="rect3"></div>
                <div class="Rectangle" id="rect4"></div>
              </div>
            </div>

          </div>
        </div>


				<%@ include file="../common/foot.jspf"%>