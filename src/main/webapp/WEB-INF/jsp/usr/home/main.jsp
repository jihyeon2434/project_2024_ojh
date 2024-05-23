<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- 테일윈드 불러오기 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" />


<style>
.big-outer-box {
	width: 100%;
	height: 1500px;
	display: flex;
	align-items: center;
	flex-direction: column;
	justify-content: center;
}

.small-outer-box {
	width: 80%;
	height: 100%;
	display: flex;
	justify-content: space-around;
	flex-direction: column;
	/* 	border: 3px solid red; */
}

.con-self-outer-box {
	display: flex;
	justify-content: space-around;
	align-items: center;
	/* 	border: 3px solid; */
	width: auto;
	height: 100%;
}

.self-box {
	width: 380px;
	display: inline-block;
}
/* 
.self-box>.grey-box>.theme-text-box {
	position: relative;

} */
.grey-box {
	width: 380px;
	color: black;
	position: relative;
	transition: transform 0.5s ease; /* 변화가 0.5초 동안 천천히 일어나도록 설정 */
	cursor: pointer; /* 마우스 오버 시 커서 변경 */
	object-fit: cover;
}

.grey-box>img {
	object-fit: cover;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	border: 1px solid #c2c2c2;
}

.grey-box:hover {
	transform: scale(1.05); /* 마우스를 올렸을 때 크기를 5% 확대 */
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
	/* 	border: 3px solid green; */
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
	height: 100%;
	/* 	border: 3px solid; */
}

.news-head-box {
	font-weight: bold;
	text-align: center;
	font-size: 30px;
	margin-bottom: 20px;
}

.small-img-box {
	width: 100%;
	height: 100%;
	/* 	margin-left: 15px;
	margin-right: 15px; */
	display: flex;
	flex-direction: column; /* 세로 정렬로 변경 */
	/* 	border: 3px solid yellow; */
}

.news-img-box {
	text-align: center;
	display: flex;
	justify-content: space-around;
	height: 80%;
	width: 100%;
	/* 	border: 3px solid pink; */
}

.title-box {
	height: 70px;
	/* 	border: 3px solid green; */
}

.title {
	text-align: center; /* 텍스트 가운데 정렬 */
	flex-grow: 1; /* 남은 공간을 차지하도록 설정 */
	font-size: 15px;
	padding-top: 10px;
	padding-bottom: 10px;
	margin-top: auto; /* 위쪽 여백을 자동으로 설정하여 하단으로 이동 */
	margin-bottom: 10px; /* 하단 여백 추가 */
}

.img-outer-box {
	width: 570px;
	height: 400px;
	/* 	border: 3px solid blue; */
	display: flex;
	justify-content: center;
}

.img-outer-box > img {
	object-fit:cover;
	border-radius: 20px;
}


.small-img-box a {
	height: 300px;
}

.vogue-outer-box {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 2000px;
	height: 500px;
	/* 	border: 3px solid blue; */
}

.img-outer-box img {
	width: 370px;
	height: 350px;
}

.consulting-box img, .self-box img {
	width: 380px;
	height: 350px; /* Maintain aspect ratio */
}

/* 보그 기사 효과  */
.news-outer-box {
	display: flex;
	justify-content: center;
	height: 100%;
	/*    border: 3px solid; */
	opacity: 0;
	transform: translateY(50px);
	transition: opacity 0.8s ease-out, transform 1.8s ease-out;
	/* 부드러운 효과를 위한 전환 설정 */
}

.news-outer-box.before-visible {
	opacity: 0;
	//
	초기
	투명도
	설정
	transform
	:
	translateY(
	50px
	);
	//
	초기
	위치
	설정
	transition
	:
	opacity
	0.8s
	ease-out
	,
	transform
	0.8s
	ease-out;
	//
	부드러운
	전환
	설정
}

.news-outer-box.is-visible {
	opacity: 1;
	//
	투명도를
	1로
	변경
	transform
	:
	translateY(
	0
	);
	//
	원래
	위치로
	이동
}

.theme-outer-box {
	border: 1px solid #c2c2c2;
	padding-bottom: 20px;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
}
</style>



<div class="big-outer-box">
	<!-- 컨설팅/셀프 메인이미지 -->
	<div class="small-outer-box">
		<div class="con-self-outer-box">
			<div class="consulting-box">
				<a href="../consulting/list">
					<div class="grey-box image-container">
						<img
							src="//velog.velcdn.com/images/jihyeon2434/post/932a6dd8-db76-44d4-8dae-71539f5e955f/image.jpg"
							width="380px" height="350px">
						<div class="theme-outer-box">
							<div class="theme-big-box">
								<div class="theme-small-box-1">
									<div class="text-white text-left text-2xl font-bold "
										style="color: black;">ONLINE</div>
									<div class="text-white text-left text-2xl font-bold  "
										style="color: black;">CONSULTING</div>
								</div>
								<div class="theme-small-box-2">
									<div class="text-white text-right text-2xl font-bold mr-3">→</div>
								</div>
							</div>
							<div class="theme-text-box">
								<div class="text-white text-left text-sm mt-2 mx-3"
									style="color: black;">단 시간에 당신의 이미지가 돋보이도록 도와주는</div>
								<div class="text-white text-left text-sm mx-3"
									style="color: black;">간편 온라인 이미지 컨설팅 서비스</div>
							</div>
						</div>

					</div>
				</a>

			</div>

			<div class="self-box">
				<a href="../self/list">
					<div class="grey-box image-container">
						<!-- 첫 번째 이미지 -->
						<img
							src="//chahong.com/web/product/big/202312/b53d9968c9e75b28da2c2052b3219019.jpg">
						<!-- 회색 네모 박스 -->
						<div class="theme-outer-box">
							<div class="theme-big-box">
								<div class="theme-small-box-1">
									<div class="text-white text-left text-2xl font-bold  "
										style="color: black;">
										SELF<br />
										<br />
									</div>
								</div>
								<!-- 텍스트 -->
								<div class="theme-small-box-2">
									<div class="text-white text-right text-2xl font-bold mr-3">→</div>
								</div>

							</div>
							<div class="theme-text-box">
								<div class="text-white text-left text-sm mt-2 mx-3"
									style="color: black;">고객 니즈 맞춤 헤어, 메이크업</div>
								<div class="text-white text-left text-sm mx-3"
									style="color: black;">정보 제공 서비스</div>
							</div>
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
						<div class="news-head-box  ">LATEST IN TRENDS</div>
						<div class=" news-img-box">
							<div class="small-img-box">
								<a href="${articles[0].link }">
									<div class="img-outer-box">
										<img src="${articles[0].imageUrl }" alt="">
									</div>
									<div class="title-box">
										<div class="title">${articles[0].title }<br />${articles[0].date }</div>
									</div>

								</a>
							</div>
							<div class="small-img-box">
								<a href="${articles[1].link }">
									<div class="img-outer-box">
										<img src="${articles[1].imageUrl }" alt="">
									</div>
									<div class="title-box">
										<div class="title">${articles[1].title }<br />${articles[1].date }</div>
									</div>
								</a>
							</div>
							<div class="small-img-box">
								<a href="${articles[2].link }">
									<div class="img-outer-box">
										<img src="${articles[2].imageUrl }" alt="">
									</div>
									<div class="title-box">
										<div class="title">${articles[2].title }<br />${articles[2].date }</div>
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



<script>
document.addEventListener('DOMContentLoaded', function () {
    const observer = new IntersectionObserver(entries => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('is-visible');
            } else {
                entry.target.classList.remove('is-visible');
            }
        });
    }, { threshold: 0.1 });

    // 감시 대상 등록
    const targets = document.querySelectorAll('.news-outer-box');
    targets.forEach(target => {
        observer.observe(target);
    });
});

// CSS 클래스를 통해 애니메이션을 제어
document.addEventListener('DOMContentLoaded', () => {
    const targets = document.querySelectorAll('.news-outer-box');
    targets.forEach(target => {
        target.classList.add('before-visible');
    });
});
</script>


<%@ include file="../common/foot.jspf"%>