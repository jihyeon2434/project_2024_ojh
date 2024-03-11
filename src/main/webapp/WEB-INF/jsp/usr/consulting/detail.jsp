<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } CONSULTING LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<style>

.outer-box {
margin-top: 50px;
  width: auto;
  display: flex;
  justify-content: center;
}

.small-outer-box {
  width: 1000px;
}

.img-box {
  border: 3px solid pink;
  display: flex;
  justify-content: center;
}

.img1 {
  width: 800px;
  height: 188px;
  border: 3px solid pink;
}

.shop-info-box {
  width: 1000px;
  height: 80px;
}

.Group96 {
  width: 320px;
  height: 80px;
  border: 2px solid;
}

.Group96 > div {
  margin-top: 10px;
}

.name {
  font-size: 20px;
  font-weight: bold;
}

.Group98 {
  width: 1000px;
  height: 97.16px;
  border: 5px solid;
}
.line-box {
  width: 1000px;
  display: flex;
  justify-content: center;
}

.Line5 {
  width: 800px;
  height: 0px;
  display: block;
  border: 3px solid red;
}

.info-top-bar {
  width: 1000px;
  display: flex;
  justify-content: center;
}

.Group42 {
  width: 1000px;
  height: 67.81px;
  display: flex;
  justify-content: center;
}

.group42-small-box {
  width: 800px;
  height: 67.81px;
  text-align: center;
  color: black;
  font-family: "Inria Serif", serif;
  font-weight: 400;
  font-size: medium;
  display: flex;
  justify-content: space-around;
  align-items: center;
}

.Group102 {
  width: 1037.8px;
  height: auto;
  position: relative;
  margin-top: 20px;
}

.Group41 {
  display: inline-block;
}

.Group97 {
  display: inline-block;
}

.Group99 {
  width: 1000px;
  display: flex;
  justify-content: center;
}

.click-box {

  display:flex;
  justify-content: center;
}

.Rectangle35 {
  width: 200.8px;
  height: 71.83px;
  background: rgba(239, 231, 229, 0.7);
  border-radius: 18px;
  text-align: center;
  font-size: small;
  display: flex;
  justify-content: center; /* 가로 중앙 정렬 */
  align-items: center; /* 세로 중앙 정렬 */
  border: solid red;
}

.Rectangle36 {
  width: 200.8px;
  height: 71.83px;
  background: rgba(239, 231, 229, 0.7);
  border-radius: 18px;
  text-align: center;
  font-size: small;
  display: flex;
  justify-content: center;
  align-items: center;
}

.Rectangle36 img {
  position: relative;
  top: 2px;
  margin-right: 11px;
}

.text-box {
  border: 3px solid;
}

.Group101 {
  border: 6px solid pink;
  width: 1000px;
  height: 80px;
}

.Group102 {
  border: 7px solid green;
  height: 800px;
  width: 1000px;
}


</style>

<div class="outer-box">
  <div class="small-outer-box">

    <div class="img-box"><img class="img1" src="https://via.placeholder.com/1151x288" /></div>
    <div class="shop-info-box">
      <div class="Group96">
        <div class="name">청담 뮤아이</div>
        <div class="score">★4.96(420)</div>

      </div>
    </div>

<div class="Group101">
        
          <div class="click-box">
            <div class="Group41">
              <div class="Rectangle35">
                <div>♡ 관심</div>
              </div>
            </div>
            <div class="Group97">
              <div class="Rectangle36">
                <div class="text-box"><img src="//velog.velcdn.com/images/jihyeon2434/post/ca6de2e7-1690-4f95-a522-50fdee8b9637/image.png">온라인 컨설팅 신청</div>
              </div>
            </div>
          </div>


   

    <div class="Group102">
      
         <div class="info-top-bar">
      <div class="infotop-small-box">
        <div class="Group42">
          <div class="group42-small-box">
            <div>정보</div>
            <div>포트폴리오</div>
            <div>후기</div>
          </div>

        </div>
        <div class="line-box">
          <div class="Line5"></div>
        </div>

      </div>

    </div>

      </div>

    </div>

  </div>
</div>
				<%@ include file="../common/foot.jspf"%>