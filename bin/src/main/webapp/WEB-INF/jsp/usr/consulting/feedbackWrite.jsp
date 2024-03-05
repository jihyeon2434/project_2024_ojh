<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.outer-box{
 display:flex;
  justify-content:center;
  
    margin-top: 5%;
  
}

.Group1 {
  width: 1200px;
  height: 90px;
  position: relative;
  
}

.satisfaction-text {
  width: 1100px;
  height: 90px;
  position: absolute;
  left: 0px;
  top: 0px;
  text-align: center;
  color: black;
  font-size: 33px;
  font-family: Inria Serif;
  font-weight: 400;
  word-wrap: break-word;
}

.line {
  width: 1200px;
  height: 0px;
  position: absolute;
  left: 0px;
  top: 90px;
  border: 1px black solid;
}

.feed-text-1 {
  width: 1200px;
  display: flex;
  text-align: center;
  justify-content: center;
 
}

.feedback-text {
  width: 475px;
  height: 63px;
  text-align: center;
  color: black;
  font-size: 50px;
  font-family: Inria Serif;
  font-weight: 400;
  word-wrap: break-word;
  margin-top: 70px;
}

.feedback-write-btn {
  display: flex;
  justify-content: center;
  margin-top: 20px;
 
}

.submit-button,
.cancel-button {
  width: 129px;
  height: 41px;
  text-align: center;
  color: black;
  font-size: 15px;
  font-family: Inter;
  font-weight: 400;
  line-height: 41px;
  word-wrap: break-word;
  cursor: pointer;
}

.submit-button {
  background: #d9d9d9;
  border-radius: 5px;
}

.cancel-button {
  background: #fefafa;
  border-radius: 5px;
  border: 0.5px black solid;
  margin-left: 10px;
}

.screenshot {
  display: block;
  margin: 20px auto;
}

.text-box {
  margin-top: 60px;
  margin-bottom: 60px;
  width: 1200px;
  height: 200px;
  background-color: #ffffff; /* input 텍스트의 배경을 하얀색으로 설정 */
  border: 1px solid #ccc; /* 테두리 추가 */
  padding: 8px; /* 내부 여백 설정 */
  box-sizing: border-box; /* 내부 여백과 테두리를 포함하여 너비 계산 */
}

.star-box {
  
  width: 1200px;
  height: 50px;
  display: flex;
  justify-content: center;
}
.star-rating {
  display: inline-block;
  
}

.star-rating input[type="radio"] {
  display: none;
}

.star-rating label {
  font-size: 50px;
  color: #ccc;
  float: right;
  padding: 0 2px;
  cursor: pointer;
  padding: 3px; /* padding 값 조정 */
  margin: 10px;
}

.star-rating label:before {
  content: "\2605";
}

.star-rating input[type="radio"]:checked ~ label {
  color: #ffcc00;
}

</style>

<div class="outer-box"><div class="small-outer-box">
  
  <div class="Group1">
  <div class="satisfaction-text">별점으로 만족도를 표현해주세요!</div>
  <div class="line"></div>

</div>
<div class="star-box">
  <div class="star-rating">
    <input type="radio" id="star5" name="rating" value="5" /><label for="star5"></label>
    <input type="radio" id="star4" name="rating" value="4" /><label for="star4"></label>
    <input type="radio" id="star3" name="rating" value="3" /><label for="star3"></label>
    <input type="radio" id="star2" name="rating" value="2" /><label for="star2"></label>
    <input type="radio" id="star1" name="rating" value="1" /><label for="star1"></label>
  </div>
</div>
<div class="feed-text-1">
  <div class="feedback-text">어떤 점이 좋았나요?</div>
</div>

<input type="text" class="text-box" placeholder="소중한 후기를 작성해주세요." />
<div class="feedback-write-btn">
  <div class="submit-button">
    <div class="button-text">등록</div>
  </div>
  <div class="cancel-button">취소</div>
</div>
</div></div>


				<%@ include file="../common/foot.jspf"%>