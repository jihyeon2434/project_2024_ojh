<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } SELF LIST"></c:set>
<%@ include file="../common/head.jspf"%>


<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop Information</title>
    <style>
        /* CSS 스타일은 여기에 작성합니다 */
        .hidden {
            display: none;
        }
    </style>
</head>


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
	border: 1px solid #EFE7E5;
	display: flex;
	justify-content: center;
	height: 300px;
}

.img1 {
	width: 800px;
	height: 188px;
	border: 0.5px solid #EFE7E5;
}

.shop-info-box {
	width: 1000px;
	height: 80px;
}

.Group96 {
	width: 400px;
	height: 80px;
}

.Group96>div {
	margin-top: 10px;
}

.name {
	font-size: 25px;
	font-weight: 20px;
}

.Group98 {
	width: 1000px;
	height: 97.16px;
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
	font-family: 'Pretendard-Regular';
	font-weight: 400;
	font-size: medium;
	display: flex;
	justify-content: space-around;
	align-items: center;
	border: 3px solid blue;
	position: relative;
}

.Group102 {
	width: 1037.8px;
	height: auto;
	position: relative;
	margin-top: 20px;
}

.Group97 {
	margin-left: 10px;
}

.Group41 {
	margin-right: 10px;
}

.Group99 {
	width: 1000px;
	display: flex;
	justify-content: center;
}

.click-box {
	display: flex;
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
}

.Rectangle35 img {
	position: relative;
	top: 5px;
	margin-right: 11px;
}

.Group101 {
	width: 1000px;
	height: 80px;
}

.Group102 {
	height: 800px;
	width: 1000px;
	display: flex;
	justify-content: center;
	border: 3px solid red;
}

.info-content-outer-box {
	width: 1000px;
	height: 800px;
	display: flex;
	justify-content: center;
	flex-direction: column;
	border: 7px solid pink;
}

.info-content-box {
	width: 1000px;
	height: 800px;
	border: 3px solid green;
	padding-left: 20px;
}

.info-content-portfolio {
	width: 1000px;
	height: 800px;
	border: 5px solid yellow;
	padding-left: 20px;
}

.info-content-review {
	width: 1000px;
	height: 800px;
	border: 1px solid #EFE7E5;
	padding-left: 20px;
	border: 3px solid green;
}

.info-box {
	height: 60px;
	display: flex; /* 수정: 세로 정렬을 위해 flex로 변경 */
	align-items: center; /* 수직 가운데 정렬 */
	border: 3px solid orange;
}

.info-img {
	width: 30px;
	height: 28px;
	text-align: center;
	margin-right: 10px; /* 추가: 이미지와 텍스트 간격 조정 */
}

.info {
	width: 770px;
	height: 30px;
	font-size: 17px;
	margin-left: 10px;
	font-weight: 10px;
}

.option {
	width: 770px;
	height: 400px;
	display: inline-block; /* 한 줄에 위치하도록 설정 */
	font-size: 17px;
	margin-top: 0; /* 수정: 상단 마진 제거 */
}

.img-box .img1 {
	width: 400px;
	height: 280px;
	margin-left: 5px;
	margin-right: 5px;
	margin-top: 6px;
}

/* 모달의 CSS 추가 */
.modal {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%); /* 정중앙으로 이동 */
	background-color: rgba(0, 0, 0, 0.8);
	z-index: 9999; /* 다른 요소 위에 위치하도록 설정 */
	display: none; /* 초기에는 숨김 */
}

.modal-content {
	max-width: 90vw;
	max-height: 90vh;
}

.close {
	position: absolute;
	top: 10px;
	right: 20px;
	color: white;
	font-size: 30px;
	font-weight: bold;
	cursor: pointer;
}


</style>

<div class="outer-box">
    <div class="small-outer-box">

        <!-- 이미지 박스 -->
        <div class="img-box">
            <img class="img1" src="${shop.photoUrl2}" />
            <img class="img1" src="${shop.photoUrl3}" />
        </div>

        <!-- 가게 정보 -->
        <div class="shop-info-box">
            <div class="Group96">
                <div class="name">${shop.shopName}</div>
                <div class="score">★4.96(420)</div>
            </div>
        </div>

        <!-- 관심 버튼 -->
        <div class="Group101">
            <div class="click-box">
                <div class="Rectangle35">
                    <div>♡ 관심</div>
                </div>
            </div>

            <!-- 정보, 포트폴리오, 후기 버튼 그룹 -->
            <div class="Group102">
                <div class="info-top-bar">
                    <div class="infotop-small-box">
                        <div class="Group42">
                            <div class="group42-small-box">
                                <button class="information">정보</button>
                                <button class="portfolio">포트폴리오</button>
                                <button class="review">후기</button>
                            </div>
                        </div>
                        <div class="line-box">
                            <div class="Line5"></div>
                        </div>
                        <div class="info-content-outer-box">
                            <!-- 정보 섹션 -->
                            <div class="info-content-box">
                                <div>
                                    <div class="info-box">
                                        <div class="info-img">
                                            <img src="//velog.velcdn.com/images/jihyeon2434/post/be21fa1d-ca66-4249-b330-499a19a0d24b/image.png" alt="">
                                        </div>
                                        <div class="info">${shop.roadName}</div>
                                    </div>
                                    <div class="info-box">
                                        <div class="info-img">
                                            <img src="//velog.velcdn.com/images/jihyeon2434/post/7b298eae-ecbc-4b82-9a7e-e47ed79e5d72/image.png" alt="">
                                        </div>
                                        <div>${shop.operateTime}</div>
                                        <div class="info" id="operateTime">${shop.operateTime ? shop.operateTime : '운영시간: 정보없음'}</div>
                                    </div>
                                    <div class="info-box">
                                        <div class="info-img">
                                            <img src="//velog.velcdn.com/images/jihyeon2434/post/1dbfa1f4-abf8-43e3-bc51-17cf5d175fad/image.png" alt="">
                                        </div>
                                        <div class="info">${shop.phoneNum}</div>
                                    </div>
                                    <div class="info-box" id="optionDiv">
                                        <div class="info-img">
                                            <img src="//velog.velcdn.com/images/jihyeon2434/post/4be9d909-b32d-4d8c-8ae0-9dd6177115a1/image.png" alt="">
                                        </div>
                                        <div class="option">
                                            <!-- 여기에 메뉴 항목이 표시됩니다 -->
                                        </div>
                                        <!-- 이 부분이 추가된 부분입니다 -->
                                    </div>
                                </div>
                            </div>

                            <!-- 포트폴리오 섹션 -->
                            <div class="info-content-portfolio hidden">
                                <!-- 포트폴리오 내용을 표시할 공간 -->
                                <div class="info-box">
                                    <div class="info-img">
                                        <img src="//velog.velcdn.com/images/jihyeon2434/post/be21fa1d-ca66-4249-b330-499a19a0d24b/image.png" alt="">
                                    </div>
                                    <div class="info">안녕..</div>
                                </div>
                            </div>

                            <!-- 후기 섹션 -->
                            <div class="info-content-review hidden">
                                <!-- 후기 내용을 표시할 공간 -->
                                <div class="info-box">
                                    <div class="info-img">
                                        <img src="//velog.velcdn.com/images/jihyeon2434/post/7b298eae-ecbc-4b82-9a7e-e47ed79e5d72/image.png" alt="">
                                    </div>
                                    <div class="info" id="operateTime">gg</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




<%-- 여기에 JavaScript 코드를 작성합니다 --%>
<script>
    // 정보, 포트폴리오, 후기 버튼 클릭 시 해당 섹션을 표시하도록 설정
    document.querySelector('.information').addEventListener('click', function() {
        showSection('.info-content-box');
    });

    document.querySelector('.portfolio').addEventListener('click', function() {
        showSection('.info-content-portfolio');
    });

    document.querySelector('.review').addEventListener('click', function() {
        showSection('.info-content-review');
    });

    // 섹션을 표시하도록 하는 함수
    function showSection(sectionClass) {
        document.querySelectorAll('.info-content-box, .info-content-portfolio, .info-content-review').forEach(function(box) {
            box.classList.add('hidden');
        });
        document.querySelector(sectionClass).classList.remove('hidden');
    }
</script>
</body>
</html>
<%@ include file="../common/foot.jspf"%>