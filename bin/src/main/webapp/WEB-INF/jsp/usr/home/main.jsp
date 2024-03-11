<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- 테일윈드 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" />


<style>
.big-outer-box{
  width: auto;
  height: 1500px;
  display: flex;
  align-items: center;
  flex-direction: column;
 
}
.small-outer-box{
  width: 1500px;
  height: 1000px;
  display: flex;
  justify-content: space-around;
  flex-direction: column;
  
}
.con-self-outer-box {
  display: flex;
  justify-content: space-around;
  align-items: center;
}


.consulting-box{
  width: 380px;
  
}



.self-box{
  width: 380px;
display: inline-block;
}

.self-box > .grey-box > .theme-text-box{
  position: relative;
  top: 21px;
}

.grey-box{
background-color: #A0AEC0;
  opacity: 0.2;
  width: 380px;
  height: 130px;
  color: black; /* 텍스트 색상을 검정색으로 설정합니다 */

}

.grey-box div {
  color: black; /* 모든 자손 div의 텍스트 색상을 검정색으로 설정합니다 */
}

.theme-big-box{
  color: #FFFFFF;
display: flex;
  justify-content: space-between;
  padding-left: 10px;
  padding-right: 10px;
  
  
}

.theme-small-box-1{
   display: inline-block;
}

.theme-small-box-2{
   display: inline-block;
}


.theme-small-box-2:hover {
  transform: scale(1.35); /* Increase size by 10% */
}



.theme-big-box > div{
  text: white; 
  text-left;
  text-size: 2xl;
  font-weight: bold;
}

.news{
  width: 700px;
}

.news-outer-box{
display: flex;
  justify-content: center;

}

.news-head-box {
  font-weight: bold;
  text-align: center;
  font-size: 30px;
  margin-bottom: 20px;
  
}
.news-img-box{
 text-align: center;
  display: flex;
  justify-content: space-around;
  height: 200px;
  
}

</style>
<div class="big-outer-box">
  <!-- 컨설팅/셀프 메인이미지 -->
  <div class="small-outer-box">
    <div class="con-self-outer-box">
      <div class="consulting-box">
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
      </div>

      <div class="self-box">
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
      </div>
    </div>

    <div class="news-outer-box">
      <div class="news">
        <!-- 보그 최신뉴스 -->
        <div>
          <div class="news-head-box ">LATEST IN TRENDS</div>
          <div class=" news-img-box">
            <img src="https://img.vogue.co.kr/vogue/2024/02/style_65dd82f42ef76-960x1440.jpg?x=1600&amp;y=2400" alt="" width="150px" height="180px">
            <img src="https://img.vogue.co.kr/vogue/2024/02/style_65dd82f42ef76-960x1440.jpg?x=1600&amp;y=2400" alt="" width="150px" height="180px">
            <img src="https://img.vogue.co.kr/vogue/2024/02/style_65dd82f42ef76-960x1440.jpg?x=1600&amp;y=2400" alt="" width="150px" height="180px">
          </div>

        </div>
      </div>
    </div>

  </div>
</div>

<%@ include file="../common/foot.jspf"%>