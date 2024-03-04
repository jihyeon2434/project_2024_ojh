<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<style>

.img1 {
  width: 800px;
  height: 188px;
  position: relative;
  left: 310px;
  top: 50px;
}

.Group98 {
  width: 1327px;
  height: 97.16px;
  position: relative;
  top: 250px;
  left: 230px;
}

.Line5 {
  width: 970px;
  height: 0px;
  left: 10px;
  top: 130px;
  position: absolute;
  border: 3px rgba(239, 231, 229, 0.7) solid;
}

.Group42 {
  width: 933.41px;
  height: 67.81px;
  left: 220px;
  top: 60px;
  position: absolute;
}

.Group42 > div {
  width: 174.41px;
  height: 67.81px;
  position: absolute;
  text-align: center;
  color: black;
  font-size: 24px;
  font-family: "Inria Serif", serif;
  font-weight: 400;
  word-wrap: break-word;
  font-size: medium;
}

.Group42 > div:nth-child(1) {
  left: 0px;
}

.Group42 > div:nth-child(2) {
  left: 379px;
}

.Group42 > div:nth-child(3) {
  left: 759px;
}

.Group102 {
  width: 1037.8px;
  height: auto;
  position: relative;
  margin-top: 20px;
}

.Group101 {
  width: 1037.8px;
  height: 191.83px;
  position: absolute;
  top: 0;
  left: 0;
}

.Group99 {
  width: 924.8px;
  height: 71.83px;
  position: absolute;
  top: 0;
  left: 0;
}

.Group99 > div {
  width: 444.8px;
  height: 71.83px;
  position: absolute;
}

.Rectangle35 {
  width: 110.8px;
  height: 50.83px;
  left: 330px;
  top: 70px;
  position: absolute;
  background: rgba(239, 231, 229, 0.7);
  border-radius: 18px;
  text-align: center;
  font-size: small;
  display: flex;
  justify-content: center; /* 가로 중앙 정렬 */
  align-items: center; /* 세로 중앙 정렬 */
}

.Group99 > div:nth-child(2) {
  left: 19px;
  top: 10.02px;
  text-align: center;
  color: black;
  font-size: 22px;
  font-family: "Inria Serif", serif;
  font-weight: 400;
  word-wrap: break-word;
}

.Group97 {
  width: 444.8px;
  height: 71.83px;
  position: absolute;
  top: 0;
  right: 0;
}

.Group97 > div {
  width: 444.8px;
  height: 71.83px;
  position: absolute;
}

.Group97 > div:nth-child(2) {
  left: 19px;
  top: 10.02px;
  text-align: center;
  color: black;
  font-size: 22px;
  font-family: "Inria Serif", serif;
  font-weight: 400;
  word-wrap: break-word;
}

.Group96 {
  width: 320px;
  height: 120px;
  position: absolute;
  top: -40px;
  left: 240px;
}

.Group96 > div {
  position: relative;
  color: black;
  font-size: 21px;
  font-family: "Inter", sans-serif;
  font-weight: 400;
  word-wrap: break-word;
  top: 350px;
  left: 100px;
}

.score {
  width: 267px;
  height: 77px;
  top: 43px;
}



</style>

<img class="img1" src="https://via.placeholder.com/1151x288" />
<div class="Group96">
  <div class="name">청담 뮤아이</div>
  <div class="score">★4.96(420)</div>

</div>

<div class="Group98">

  <div class="Group42">
    <div>정보</div>

    <div>후기</div>
  </div>
  <div class="Line5"></div>
</div>
<div class="Group102">
  <div class="Group101">
    <div class="Group99">
      <div class="Group41">
        <div class="Rectangle35">
          <div>♡ 관심</div>
        </div>

      </div>
      <div class="Group97">

      </div>
    </div>

  </div>

</div>

				<%@ include file="../common/foot.jspf"%>