<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MYRESERVATION"></c:set>
<%@ include file="../common/head.jspf"%>


<style>
.text {
  width: 212px;
  height: 76px;
  color: black;
  font-size: 20px;
  font-weight: 400;
  word-wrap: break-word;
  position: relative;
  top: 24px;
  
}

.Rectangle-box {
  width: 1070px;
  height: 143px;
  position: relative;
}

.line {
  width: 1060px;
  height: 0px;
  top: 70px;
  position: absolute;
  border: 3px rgba(239, 231, 229, 0.7) solid;
}

.box-line2 {
  width: 1060px;
  height: 0px;
  margin-top: 25px;
  position: absolute;
  border: 3px rgba(239, 231, 229, 0.7) solid;
}

.Rectangle {
  width: 500px;
  height: 110px;
  margin-top: 10px;
  top: 7px;
  position: absolute;
  background: white;
  border-radius: 10px;
  border: 1px black solid;
}

.reservation-content1 {
  color: black;
  font-size: 18px;
  font-weight: 700;
  word-wrap: break-word;
}

.reservation-content2 {
  width: 65.72px;
  height: 20.5px;
  left: 25.82px;
  top: 63px;
  position: absolute;
  color: black;
  font-size: 15px;
  font-weight: 400;
  word-wrap: break-word;
}
.reservation-content2-1 {
  width: 231.62px;
  height: 20.5px;
  left: 94px;
  top: 61px;
  position: absolute;
  color: black;
  font-size: 18px;
  font-weight: 700;
  word-wrap: break-word;
}

.content2-all {
  display: inline-block;
}

.group1 {
  width: 984.19px;
  height: 51px;
  left: 25.82px;
  top: 20px;
  position: absolute;
}

.red-alert {
  width: 1051px;
  height: 34px;
  color: #fa0909;
  font-size: 13px;
  font-family: Inria Serif;
  font-weight: 400;
  word-wrap: break-word;
  position: absolute;
  top: 220px;
  left: 10px;
}

.text2 {
  width: 212px;
  height: 76px;
  color: black;
  font-size: 20px;
  font-weight: 400;
  word-wrap: break-word;
  position: absolute;
  top: 300px;
}

.line2 {
  width: 1060px;
  height: 0px;
  top: 350px;
  position: absolute;
  border: 3px rgba(239, 231, 229, 0.7) solid;
}

.name {
  width: 127px;
  height: 43px;
  color: black;
  font-size: 24px;
  font-family: Inria Serif;
  font-weight: 400;
  word-wrap: break-word;
  position: absolute;
  left: 30px;
  top: 50px;
}

.shopname {
  width: 137px;
  height: 52px;
  margin-left: 20px; /* 요소들 사이의 간격 조정 */
  color: black;
  font-size: 24px;
  font-family: Inria Serif;
  font-weight: 400;
  word-wrap: break-word;
  position: absolute;
  left: 280px;
  top: 50px;
}

.time {
  width: 174px;
  height: 65px;
  margin-left: 20px; /* 요소들 사이의 간격 조정 */
  color: black;
  font-size: 24px;
  font-family: Inria Serif;
  font-weight: 400;
  word-wrap: break-word;
  position: absolute;
  left: 550px;
  top: 50px;
}
.uri {
  width: 174px;
  height: 65px;
  margin-left: 20px; /* 요소들 사이의 간격 조정 */
  color: black;
  font-size: 24px;
  font-family: Inria Serif;
  font-weight: 400;
  word-wrap: break-word;
  position: absolute;
  left: 800px;
  top: 50px;
}
.chat-menu {
  display: flex;
  flex-direction: row;
  align-items: center;
  position: absolute;
  top: 330px; /* 조정된 위치 */
}

.line3 {
  width: 1060px;
  height: 0px;
  top: 420px;
  position: absolute;
  border: 1px black solid;
}

.chat-info {
  display: flex;
  flex-direction: row;
  align-items: center;
  position: absolute;
  top: 400px; /* 조정된 위치 */
}


.chat-menu>div{
font-size: 13px;
}
.chat-info > div {
  font-size: 12px;
}


.modify-btn {
  background: #232020;
  margin-left: 600px;
  top: 550px;
  left: -30px;
}

.modifyBack-btn {
  background: #929294;
  margin-left: 760px;
  top: 550px;
  left: -30px;
}

.btn-1 {
  position: relative;
}

.modify-btn,
.modifyBack-btn {
  width: 130px;
  height: 50px;
  border-radius: 5px;
  float: left;
  text-align: center;
  display: flex; /* 추가된 부분 */
  justify-content: center; /* 추가된 부분 */
  align-items: center; /* 추가된 부분 */
  color: white;
  position: absolute;
  font-size: small;
}

.left-menu {
  width: 148px;
	height: 32px;
	left: 20px;
	top: 100px;
	position: absolute;
	color: black;
	font-size: 10px;
	font-family: Inria Serif;
	font-weight: 700;
	word-wrap: break-word;
}

.left-line {
   width: 700px;
  height: 0px;
  transform: rotate(90deg);
  transform-origin: 0 0;
  border: 1px #c6c6c6 solid;
  margin-left: 170px;
  position: relative;
  top: 30px;
}

.reserve-section{
  position: absolute;
  left: 220px;
}
</style>



<div class="left-menu">
  <div>
    회원정보
  </div>
  <br>
  <br>
  <br>
  <div>
    마이 캘린더
  </div>
  <br>
  <br>
  <br>
  <div>
    온라인 컨설팅 예약내역
  </div>
</div>

<div class="left-line"> </div>
<div class="reserve-section"><div class="text">예약내역</div>

<div class="line"></div>
<div class="Rectangle-box">
  <div class="Rectangle">
    <div class=group1>
      <div class="reservation-content1">
        1:1 30 분 컨설팅
      </div>
    </div>

    <div class="content2-all">
      <div class="reservation-content2"> 일정 </div>
      <div class="reservation-content2-1">2.26(월) 10:00
      </div>
    </div>
  </div>
</div>

<div class="red-alert">30분 내로 채팅방이 MY채팅방에 생성됩니다.</div>

<div class="text2">My 채팅방</div>
<div class="line2"></div>

<div class="chat-menu">
  <div class="name">
    채팅방명
  </div>
  <div class="shopname">업체정보</div>
  <div class="time">시간</div>
  <div class="uri">채팅방 주소</div>
</div>
<div class="line3"></div>
<div class="chat-info">
  <div class="name">
    JH 님 30분 컨설팅_이미지컨설팅
  </div>
  <div class="shopname">ㅇㅇ뷰티</div>
  <div class="time">2024.02.26 14:00-15:00</div>
  <div class="uri">https://bbomicoding.tistory.com/32</div>
</div>
</div>

<div class="btn-1">
  <div class="modify-btn">수정</div>
  <div class="modifyBack-btn">취소</div>





<%@ include file="../common/foot.jspf"%>