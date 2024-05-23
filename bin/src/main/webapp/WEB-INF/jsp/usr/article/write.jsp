<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE WRITE"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>
<c:set var="shopName" value="${param.shopName}" />
<!-- Article write 관련 -->
<script type="text/javascript">
	let ArticleWrite__submitFormDone = false;
	function ArticleWrite__submit(form) {
		if (ArticleWrite__submitFormDone) {
			return;
		}
		form.title.value = form.title.value.trim();
		if (form.title.value == 0) {
			alert('제목을 입력해주세요');
			return;
		}
		const editor = $(form).find('.toast-ui-editor').data(
				'data-toast-editor');
		const markdown = editor.getMarkdown().trim();
		if (markdown.length == 0) {
			alert('내용 써라');
			editor.focus();
			return;
		}
		
// 		alert(${currentId});

		$('#fileInput').attr('name', 'file__article__' + ${currentId} + '__extra__Img__1');

		form.body.value = markdown;

		ArticleWrite__submitFormDone = true;
		form.submit();
	}
</script>

<div class="write-box">
	<div class="write-container">
		<section class="mt-8 text-xl px-4">
			<div class="mx-auto">
			<%-- 	<div>${currentId }</div> --%>
				<form action="../article/doWrite" method="POST" onsubmit="ArticleWrite__submit(this); return false;"
					enctype="multipart/form-data">
					<input type="hidden" name=">${currentId }"> <input type="hidden" name="body">
					 <input type="hidden" name="shopName" value="${shopName}" />
					<table class="write-box table-box-1" border="1">
						<tbody>
							<tr>

								<td>
									<div>${rq.loginedMember.nickname }</div>
								</td>
							</tr>
							<tr>

								<td><select class="select select-ghost w-full max-w-xs" name="boardId">
										<!-- 									<option selected="selected" disabled>게시판을 선택해주세요</option> -->
										<option value="1">온라인 컨설팅</option>
								</select></td>
							</tr>
							<tr>

								<td><input class="input  w-full max-w-xs" autocomplete="off" type="text" placeholder="제목을 입력해주세요"
									name="title" /></td>
							</tr>
							<tr>

								<td><input id="fileInput" placeholder="이미지를 선택해주세요" type="file" /></td>
							</tr>
							<tr>

								<td>
									<div class="toast-ui-editor">
										<script type="text/x-template">

                    </script>
									</div>
								</td>
							</tr>

							<tr>

								<th class="bottom-line">
									<button class="btn btn-ghost" type="submit" value="작성">작성</button>
									<button class="btn btn-ghost" class="" type="button" onclick="history.back();">뒤로가기</button>
								</th>
							</tr>
						</tbody>
					</table>
				</form>
				<div class="btns"></div>
			</div>
		</section>
	</div>

</div>

<div class="photo-guide">
	<div class="photo-guide-container">
		<div class="photo-guide-content">
			<h1 class="photo-guide-title">ItrendX Photo Guide</h1>
			<p class="photo-guide-description">
				ITrendX 사진 촬영 가이드 입니다.<br> 사진의 경우 눈으로 직접보는 실물보다 골격상의 특징이 더 명확하게 드러나고, 촬영각도나 거리에 따라 실물에 대한 왜곡정도가 매우 달라집니다.<br>
				따라서 아래의 가이드에 맞게 사진을 찍어주시면, 실물 역추론을 통해서 정확한 분석이 가능합니다.
			</p>

			<section class="photo-guide-section">
				<h2 class="photo-guide-section-title">촬영전 준비사항/가이드</h2>
				<!-- 			<div class="photo-guide-divider"></div> -->
				<div class="photo-guide-section-content">
					<h3 class="photo-guide-section-subtitle">촬영전 준비사항</h3>
					<p class="photo-guide-section-text">
						어깨 쇄골이 보이는 타이트한 민무늬 검정 민소매를 착용해주세요.(필수)<br>
						<br> - 잘못된 의상 착용 시 분석 정확도가 떨어질 수 있습니다.<br> <br>
						<br> 무늬 없는 배경/밝은 곳에서 촬영해주세요.<br>
						<br> - 사진이 어두우면 불석 정확도가 떨어집니다.<br>
						<br> <br> 후면/기본 카메라 모드(광각X)<br> <br>
						<br> 간단한 데일리 메이크업 또는 맨 얼굴로 촬영해주세요.<br>
					</p>
				</div>
			</section>
			<h2 class="photo-guide-example-title">좋은 사진 촬영 예시</h2>

			<div class="image-box">
				<img
					src="https://cdn.builder.io/api/v1/image/assets/TEMP/c500c83b53279eb4d94d8593aad510e385ad90bd273c354edd8ab271e70e2d41?apiKey=f834c4360ac549c5b5237c00b19938c4&"
					alt="좋은 사진 촬영 가이드 예시 이미지" class="photo-guide-example-image">
			</div>

			<h2 class="photo-guide-example-title">잘못된 사진 촬영 예시</h2>
			<!--  <div class="photo-guide-divider"></div> -->
			<div class="image-box">
				<img
					src="https://cdn.builder.io/api/v1/image/assets/TEMP/948be7371e6ef03c7bffdc02b4834d387cd7ec42be7f8759ea57cfc2c2896405?apiKey=f834c4360ac549c5b5237c00b19938c4&"
					alt="잘못된 사진 예시 이미지" class="photo-guide-example-image">
			</div>

		</div>
	</div>
</div>

<style>
form {
	font-weight: 500;
	font-size: 16px;
	line-height: 22px;
}

/* 입력 필드 및 버튼에도 동일한 스타일 적용 */
form input, form button {
	font-weight: 500;
	font-size: 16px;
	line-height: 22px;
}

.bottom-line {
	display: flex;
	justify-content: center;
	margin-top: 30px;
}

.write-box {
	display: flex;
	justify-content: center;
}

.write-container {
	
}

.photo-guide {
	background: linear-gradient(0deg, #fff 0%, #fff 100%), #fff;
	display: flex;
	flex-direction: column;
	align-items: center;
	font-size: 14px;
	color: #000;
	font-weight: 350;
	padding: 50px 60px 80px;
}

@media ( max-width : 991px) {
	.photo-guide {
		padding: 0 20px;
	}
}

.photo-guide-container {
	display: flex;
	width: 1200px;
	max-width: 100%;
	flex-direction: column;
	align-items: center;
}

.photo-guide-content {
	background-color: #fff;
	align-self: stretch;
	display: flex;
	flex-direction: column;
	padding: 80px 40px;
}

.image-box {
	display: flex;
	justify-content: center;
}

@media ( max-width : 991px) {
	.photo-guide-content {
		max-width: 100%;
		padding: 0 20px;
	}
}

.photo-guide-title {
	margin-top: 64px;
	font: 700 30px/167% Noto Sans KR, -apple-system, Roboto, Helvetica,
		sans-serif;
}

@media ( max-width : 991px) {
	.photo-guide-title {
		max-width: 100%;
		margin-top: 40px;
	}
}

.photo-guide-description {
	margin-top: 63px;
}

@media ( max-width : 991px) {
	.photo-guide-description {
		max-width: 100%;
		margin-top: 40px;
	}
}

.photo-guide-divider {
	border-color: rgba(0, 0, 0, 0.25);
	border-style: solid;
	border-top-width: 1px;
	margin-top: 49px;
	height: 1px;
}

@media ( max-width : 991px) {
	.photo-guide-divider {
		max-width: 100%;
		margin-top: 40px;
	}
}

.photo-guide-section {
	border-color: rgba(0, 0, 0, 0.25);
	border-style: solid;
	border-bottom-width: 1px;
	display: flex;
	padding-top: 52px;
	flex-direction: column;
}

@media ( max-width : 991px) {
	.photo-guide-section {
		max-width: 100%;
	}
}

.photo-guide-section-title {
	line-height: 100%;
}

@media ( max-width : 991px) {
	.photo-guide-section-title {
		max-width: 100%;
	}
}

.photo-guide-section-content {
	background-color: RGBA(104, 104, 104, 0.3); /* 반투명 회색 */
	display: flex;
	margin-top: 17px;
	flex-direction: column;
	padding: 13px 0 71px;
}

@media ( max-width : 991px) {
	.photo-guide-section-content {
		max-width: 100%;
	}
}

.photo-guide-section-subtitle {
	line-height: 100%;
	margin-left: 10px;
}

@media ( max-width : 991px) {
	.photo-guide-section-subtitle {
		max-width: 100%;
	}
}

.photo-guide-section-text {
	color: ffffff;
	line-height: 14px;
	margin-top: 22px;
	margin-left: 10px;
}

@media ( max-width : 991px) {
	.photo-guide-section-text {
		max-width: 100%;
	}
}

.photo-guide-example-title {
	border-color: rgba(0, 0, 0, 0.25);
	border-style: solid;
	border-bottom-width: 1px;
	margin-bottom: 323px;
	line-height: 100%;
	justify-content: center;
	padding: 21px 0;
}

@media ( max-width : 991px) {
	.photo-guide-example-title {
		max-width: 100%;
		margin-bottom: 40px;
	}
}

.photo-guide-example-image {
	aspect-ratio: 0.74;
	object-fit: auto;
	object-position: center;
	width: 914px;
	z-index: 10;
	margin-top: -300px;
	max-width: 100%;
}

@media ( max-width : 991px) {
	.photo-guide-example-image {
		margin-top: -200px;
	}
}

.photo-guide-bad-example-title {
	border-color: rgba(0, 0, 0, 0.25);
	border-style: solid;
	border-bottom-width: 1px;
	margin-top: 22px;
	line-height: 100%;
	justify-content: center;
	padding: 22px 0;
}

@media ( max-width : 991px) {
	.photo-guide-bad-example-title {
		max-width: 100%;
	}
}

.photo-guide-bad-example-image {
	aspect-ratio: 1.15;
	object-fit: auto;
	object-position: center;
	width: 998px;
	margin-top: 17px;
	max-width: 100%;
	border: 3px solid;
}

@media ( max-width : 991px) {
	.photo-guide-bad-example-image {
		margin-top: 40px;
	}
}
</style>

<%@ include file="../common/foot.jspf"%>



<%@ include file="../common/foot.jspf"%>