<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- 테일윈드 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" />


<style>
.big-outer-box {
	width: auto;
	height: 1500px;
	display: flex;
	align-items: center;
	flex-direction: column;
  justify-content: center;
}

.small-outer-box {
	width: 1500px;
	height: 1000px;
	display: flex;
	justify-content: space-around;
	flex-direction: column;
  margin-bottom: 250px;
}

.con-self-outer-box {
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.consulting-box {
	width: 380px;
  
}

.self-box {
	width: 380px;
	display: inline-block;
}

.self-box>.grey-box>.theme-text-box {
	position: relative;
	top: 21px;
}

.grey-box {
	background-color: #A0AEC0;
	opacity: 0.2;
	width: 380px;
	height: 130px;
	color: black; /* 텍스트 색상을 검정색으로 설정합니다 */
}

.grey-box div {
	color: black; /* 모든 자손 div의 텍스트 색상을 검정색으로 설정합니다 */
}

.theme-big-box {
	color: #FFFFFF;
	display: flex;
	justify-content: space-between;
	padding-left: 10px;
	padding-right: 10px;
}

.theme-small-box-1 {
	display: inline-block;
}

.theme-small-box-2 {
	display: inline-block;
}

.theme-small-box-2:hover {
	transform: scale(1.35); /* Increase size by 10% */
}

.theme-big-box>div {
	text: white; text-left;
	text-size: 2xl;
	font-weight: bold;
}


.news-outer-box {
	display: flex;
	justify-content: center;
}

.news-head-box {
	font-weight: bold;
	text-align: center;
	font-size: 30px;
	margin-bottom: 20px;
}

.small-img-box{
  width: 300px;
  margin-left: 15px;
  margin-right: 15px;
 display: flex;
  flex-direction: column; /* 세로 정렬로 변경 */
  
  
}


.news-img-box {
	text-align: center;
	display: flex;
	justify-content: space-around;
	height: 300px;
  width: 900px;
}

.title-box{
  height: 70px;
}

.title{
  text-align: center; /* 텍스트 가운데 정렬 */
  flex-grow: 1; /* 남은 공간을 차지하도록 설정 */
  font-size: 15px;
  padding-top: 10px;
  padding-bottom: 10px;
   margin-top: auto; /* 위쪽 여백을 자동으로 설정하여 하단으로 이동 */
  margin-bottom: 10px; /* 하단 여백 추가 */
  
}


.img-outer-box{
  width: 270px;
  height: 300px;
}

.small-img-box a{
  height: 300px;
}

.vogue-outer-box{
  display: flex;
	justify-content: center;
	align-items: center;
 	width: 1500px;
  height: 500px;
}

.img-outer-box img {
    width: 270px;
    height: 300px;
}
</style>
<div class="big-outer-box">
  <!-- 컨설팅/셀프 메인이미지 -->
  <div class="small-outer-box">
    <div class="con-self-outer-box">
      <div class="consulting-box">
      <a href="../consulting/list">
          <!-- 첫 번째 이미지 -->
          <img src="//chahong.com/web/product/big/202312/b53d9968c9e75b28da2c2052b3219019.jpg" width="380px" height="350px" alt="차홍" class="BigImage">
          <!-- 회색 네모 박스 -->
          <div class="grey-box">
            <div class="theme-big-box">
              <div class="theme-small-box-1">
                <div class="text-white text-left text-2xl font-bold">ONLINE</div>
                <div class="text-white text-left text-2xl font-bold">CONSULTING</div>
              </div>
              <!-- 텍스트 -->
              <div class="theme-small-box-2">
                <div class="text-white text-right text-2xl font-bold mr-3">→</div>
              </div>

            </div>
            <div class="theme-text-box">
              <div class="text-white text-left text-sm mt-2">단 시간에 당신의 이미지가 돋보이도록 도와주는</div>
              <div class="text-white text-left text-sm">간편 온라인 이미지 컨설팅 서비스</div>
            </div>

          </div>
        </a>
      </div>

      <div class="self-box">

        <a href="../self/list">
          <!-- 첫 번째 이미지 -->
          <img src="//chahong.com/web/product/big/202312/b53d9968c9e75b28da2c2052b3219019.jpg" width="380px" height="350px" alt="차홍" class="BigImage">
          <!-- 회색 네모 박스 -->
          <div class="grey-box">
            <div class="theme-big-box">
              <div class="theme-small-box-1">
                <div class="text-white text-left text-2xl font-bold">SELF</div>
              </div>
              <!-- 텍스트 -->
              <div class="theme-small-box-2">
                <div class="text-white text-right text-2xl font-bold mr-3">→</div>
              </div>

            </div>
            <div class="theme-text-box">
              <div class="text-white text-left text-sm mt-2">고객 니즈 맞춤 헤어, 옷 , 메이크업</div>
              <div class="text-white text-left text-sm">정보 제공 서비스</div>
            </div>
          </div>
        </a>
      </div>
    </div>

    <div class="news-outer-box">
      <div class="news">

        <!-- 보그 최신뉴스 -->
        <div class="vogue-outer-box">
          <div>
            <div class="news-head-box ">LATEST IN TRENDS</div>
            <div class=" news-img-box">

              <div class="small-img-box">
                <a href="${articles[0].link }">
                  <div class="img-outer-box">
                    <img src="${articles[0].imageUrl }" alt="" width="270px" height="300px">
                  </div>
                  <div class="title-box">
                    <div class="title">
                      ${articles[0].title }
                    </div>
                  </div>
                  <div class="date">
                    ${articles[0].date }
                  </div>
                </a>
              </div>
              <div class="small-img-box">
                <a href="${articles[1].link }">
                  <div class="img-outer-box">
                    <img src="${articles[1].imageUrl }" alt="" width="270px" height="300px">
                  </div>
                  <div class="title-box">
                    <div class="title">
                      ${articles[1].title }
                    </div>
                  </div>
                  <div class="date">
                    ${articles[1].date }
                  </div>
                </a>
              </div>
              <div class="small-img-box">
                <a href="${articles[2].link }">
                  <div class="img-outer-box">
                    <img src="${articles[2].imageUrl }" alt="" width="270px" height="300px">
                  </div>
                  <div class="title-box">
                    <div class="title">
                      ${articles[2].title }
                    </div>
                  </div>
                  <div class="date">
                    ${articles[2].date }
                  </div>
                </a>
              </div>

            </div>
          </div>

        </div>
      </div>
    </div>

  </div>
</div>
<%@ include file="../common/foot.jspf"%>