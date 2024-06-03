<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } REVIEW WRITE"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.outer-box {
	display: flex;
	justify-content: center;
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

.submit-button, .cancel-button {
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
	margin-top: 30px;
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

.feedback-title-box {
	margin-top: 20px;
	width: 1200px;
	height: 50px;
	background-color: #ffffff; /* input 텍스트의 배경을 하얀색으로 설정 */
	border: 1px solid #ccc;
	background-color: #ffffff; /* 테두리 추가 */
}
</style>

<div class="outer-box">
	<div class="small-outer-box">
		<form action="../self/doReviewWrite" method="POST">
			<input type="hidden" name="id" value="${shop.id}" /> <input type="hidden" name="themeId" value="${shop.themeId}" />
			<input type="hidden" name="categoryId" value="${shop.categoryId}" />

			<div class="Group1">
				<div class="satisfaction-text">별점으로 만족도를 표현해주세요!</div>
				<div class="line"></div>
			</div>

			<div class="star-box">
				<div class="star-rating">
					<input type="radio" id="star5" name="rating" value="5" /><label for="star5"></label> <input type="radio"
						id="star4" name="rating" value="4" /><label for="star4"></label> <input type="radio" id="star3" name="rating"
						value="3" /><label for="star3"></label> <input type="radio" id="star2" name="rating" value="2" /><label
						for="star2"></label> <input type="radio" id="star1" name="rating" value="1" /><label for="star1"></label>
				</div>
			</div>

			<div class="feed-text-1">
				<div class="feedback-text">어떤 점이 좋았나요?</div>
			</div>

			<div class="feedback-title-box">
				<input type="text" class="title-box" name="title" placeholder="제목을 입력해주세요." />
			</div>

			<div>
				<textarea class="text-box" name="body" placeholder="소중한 후기를 작성해주세요."></textarea>
			</div>

			<div class="feedback-write-btn">
				<div class="submit-button">
					<input class="" type="submit" value="등록" />
				</div>
				<div class="cancel-button">취소</div>
			</div>
		</form>

	</div>
</div>


<script>
	// 별점을 선택하면 해당 별점에 대응하는 값을 숫자로 변환하여 저장
	document
			.querySelectorAll('.star-rating input[type="radio"]')
			.forEach(
					function(radio) {
						radio
								.addEventListener(
										'change',
										function() {
											// 선택된 별점 값 가져오기
											const rating = parseInt(this.value);
											// 별점 값 출력 (테스트용)
											console.log('Selected rating:',
													rating);
											// 선택된 별점 값을 폼 데이터에 추가 (이름은 'rating')
											document
													.querySelector('input[name="rating"]').value = rating;
										});
					});
</script>

<%@ include file="../common/foot.jspf"%>