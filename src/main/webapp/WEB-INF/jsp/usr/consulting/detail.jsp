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

.Group96 > div {
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
}

.info-content-outer-box {
  width: 1000px;
  height: 67.81px;
  display: flex;
  justify-content: center;
}

.info-content-box {
  width: 800px;
  height: 720px;
  border: 1px solid;
  padding-left: 20px;
}

.info-box {
  height: 60px;
  display: flex; /* 자식 요소를 플렉스 항목으로 만듭니다. */
  align-items: center; /* 수직 가운데 정렬 */
}

.info-img {
  width: 30px;
  height: 28px;
  text-align: center;
  display: inline-block; /* 한 줄에 위치하도록 설정 */
}

.info {
  width: 770px;
  height: 30px;
  font-size: 17px;
  display: inline-block; /* 한 줄에 위치하도록 설정 */
  margin-left: 10px;
  	font-weight: 10px;
}

.option{
  width: 770px;
  height: 400px;
  display: inline-block; /* 한 줄에 위치하도록 설정 */
  margin-top: 370px;
  margin-left: 10px;
  font-size: 17px;
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

    <div class="img-box"><img class="img1" src="${shop.photoUrl2}" /><img class="img1" src="${shop.photoUrl3}" /></div>
    <div class="shop-info-box">
      <div class="Group96">
        <div class="name">${shop.shopName}</div>
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
          <a href="../consulting/reservation2">
          <div class="Rectangle35">
            <div class="text-box"><img src="//velog.velcdn.com/images/jihyeon2434/post/ca6de2e7-1690-4f95-a522-50fdee8b9637/image.png">온라인 컨설팅 신청</div>
          </div>
          </a>
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
            <div class="info-content-outer-box">
              <div class="info-content-box">
                <div class="info-box">
                  <div class="info-img">
                    <img src="//velog.velcdn.com/images/jihyeon2434/post/be21fa1d-ca66-4249-b330-499a19a0d24b/image.png" alt="">
                  </div>
                  <div class="info">${shop.roadName}
                  </div>
                </div>
                <div class="info-box">
                  <div class="info-img">
                    <img src="//velog.velcdn.com/images/jihyeon2434/post/7b298eae-ecbc-4b82-9a7e-e47ed79e5d72/image.png" alt="">
                  </div>
                  <div class="info" id="operateTime"></div>
                </div>
                <div class="info-box">
                  <div class="info-img">
                    <img src="//velog.velcdn.com/images/jihyeon2434/post/1dbfa1f4-abf8-43e3-bc51-17cf5d175fad/image.png" alt="">
                  </div>
                  <div class="info">${shop.phoneNum}
                  </div>
                </div>
                <div class="info-box">
                  <div class="info-img">
                    <img src="//velog.velcdn.com/images/jihyeon2434/post/4be9d909-b32d-4d8c-8ae0-9dd6177115a1/image.png" alt="">
                  </div>
                  <div class="option" id="menuItems"></div> <!-- 이 부분이 추가된 부분입니다 -->
                  </div>
                </div>

              </div>
            </div>

          </div>

        </div>

      </div>

    </div>

  </div>
</div>


<script>
  var shopMenu = "${shop.menu}";
  var optionDiv = document.getElementById('menuItems');

  if (shopMenu) { // 만약 ${shop.menu}이 존재한다면
    var menuItems = shopMenu.split(';');
    menuItems.forEach(function(item) {
      optionDiv.innerHTML += item.trim() + "<br>";
    });
  } else { // ${shop.menu}이 null이라면
    optionDiv.innerHTML = "정보없음";
  }
</script>

<script>
  var shopOperateTime = "${shop.operateTime}";
  var operateTimeDiv = document.getElementById('operateTime');

  if (shopOperateTime) { // 만약 ${shop.operateTime}이 존재한다면
    operateTimeDiv.innerHTML = shopOperateTime;
  } else { // ${shop.operateTime}이 null이라면
    operateTimeDiv.innerHTML = "운영시간: 정보없음";
  }
</script>
<!-- 모달에 닫기 버튼 추가 -->
<div id="modal" class="modal">
  <span class="close">&times;</span>
  <div class="modal-content"></div>
</div>

<script>
//JavaScript 코드 수정
document.addEventListener('DOMContentLoaded', function() {
  var images = document.querySelectorAll('.img1');
  images.forEach(function(image) {
    image.addEventListener('click', function() {
      // 클릭한 이미지의 src 가져오기
      var src = this.getAttribute('src');
      // 이미지를 표시할 모달 요소 생성
      var modal = document.createElement('div');
      modal.classList.add('modal');
      modal.innerHTML = '<span class="close">&times;</span><img src="' + src + '" class="modal-content">';
      // 모달을 body에 추가
      document.body.appendChild(modal);
      // 모달 창의 스타일을 조정하여 더 크게 표시
      modal.style.maxWidth = '90vw';
      modal.style.maxHeight = '90vh';
      modal.style.overflow = 'auto';
      modal.style.display = 'flex';
      modal.style.justifyContent = 'center';
      modal.style.alignItems = 'center';
      modal.style.backgroundColor = 'rgba(0, 0, 0, 0.8)';
      modal.style.position = 'fixed';
      modal.style.top = '0';
      modal.style.left = '0';
      modal.style.width = '100%';
      modal.style.height = '100%';
      // 이미지 크기를 10배로 설정
      var modalImage = modal.querySelector('.modal-content');
      modalImage.style.width = '1000%'; // 현재 크기보다 10배 더 크게 설정
      // 닫기 버튼 클릭 시 모달 제거
      var closeBtn = modal.querySelector('.close');
      closeBtn.addEventListener('click', function() {
        modal.remove();
      });
    });
    
    // 마우스를 올렸을 때 확대되는 기능 제거
    // image.addEventListener('mouseover', function() {
    //   // 이미지 위에 마우스를 올렸을 때 확대되도록 함
    //   this.style.transform = 'scale(1.1)';
    //   this.style.transition = 'transform 0.2s ease';
    // });
    // image.addEventListener('mouseout', function() {
    //   // 이미지에서 마우스가 벗어났을 때 확대 효과 제거
    //   this.style.transform = 'scale(1)';
    //   this.style.transition = 'transform 0.2s ease';
    // });
  });
});

</script>
				<%@ include file="../common/foot.jspf"%>