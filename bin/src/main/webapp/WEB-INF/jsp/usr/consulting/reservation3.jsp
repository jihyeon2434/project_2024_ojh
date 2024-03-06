<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.outer-box {
  display: flex;
  width: auto;
  height: auto;
  justify-content: center;
}

.small-outer-box {
  width: 1000px;
  height: 900px;
  margin-top: 30px;
}

.title {
  width: 441px;
  height: 154px;
  text-align: center;
  color: black;
  font-size: 34px;
  font-family: "Inria Serif", serif;
  font-weight: 400;
  word-wrap: break-word;
  margin: 0 auto;
}

.line {
  width: 100%;
  height: 0px;
  border: 3px rgba(239, 231, 229, 0.7) solid;
  margin: 10px auto;
}

.content-box {
  height: 150px;
}

.Group129 {
  width: 600px;
  height: 70px;
  position: relative;
  margin-left: 30px;
}

.Rectangle62 {
  width: 600px;
  height: 70px;
  left: 0px;
  top: 0px;
  position: absolute;
  background: white;
  border-radius: 10px;

}

.Rectangle62 div {
  font-weight: normal;
  font-size: 25px;
}

.time {
  font-weight: normal;
  font-size: 25px;
}
.price-box {
  width: 600px;
  height: 70px;
  margin-top: 70px;
}

.consulting-reservation {
  text-align: center;
}

.reservation-button {
  display: inline-block;
  padding: 10px 20px;
  background-color: black;
  color: white;
  font-family: "Inria Serif", serif;
  font-size: 23px;
  border-radius: 5px;
  cursor: pointer;
}

.price {
  color: red;
  font-size: larger;
}

.price-title {
  font-size: large;
}


</style>
<div class="outer-box">
  <div class="small-outer-box">
    <div class="title-box">
      <div class="title">JH님 <br />빠른 예약 도와드릴게요.</div>
      <div class="line"></div>
    </div>
    <div class="content-box">
      <div class="Group129">
        <div class="Rectangle62">
          <div>2.26(월) 10:00</div>
          <div class="time">일정 1:1 30 분 컨설팅</div>
        </div>
        <div class="price-box">
          <div class="price-title">결제 금액</div>
          <div class="price">30,000원</div>
        </div>

      </div>
    </div>

    <div class="consulting-reservation">
      <div class="reservation-button">예약하기</div>
    </div>

  </div>
</div>



<%@ include file="../common/foot.jspf"%>