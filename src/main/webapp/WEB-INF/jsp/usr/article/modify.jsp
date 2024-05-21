<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE MODIFY"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.all {
	width: 80%;
	margin-left: 370px;
	margin-top: 30px;
}

.all-content {
	width: 80%;
	margin: 30px auto;
}

.top-box {
	margin-top: 30px;
}

.line-main {
	width: 70%;
	position: relative;
	top: 5px;
	border: 1.5px #929294 solid;
}

.line1 {
	width: 70%;
	position: relative;
	top: 5px;
	border: 1px #929294 solid;
}

.title-box-1 {
	width: 70%;
	height: 100px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.title-box>div {
	font-size: 35px;
}

.top-content-2 {
	width: 70%;
	height: 80px;
	display: flex;
	justify-content: space-between; /* 수평으로 간격을 벌립니다 */
	align-items: flex-end;
	margin-left: 0;
	display: block;
}

.writer {
	font-weight: bold;
}

.repliesCount {
	width: 130px;
	margin-left: auto; /* 해당 div를 가장 오른쪽으로 이동시킵니다 */
}

.hit-rel-count {
	display: flex;
	justify-content: space-between; /* 자식 요소를 양 끝으로 이동시킵니다 */
	align-items: center; /* 내용을 수직으로 중앙에 정렬합니다 */
}

.body-box {
	width: 70%;
	height: 500px;
	border: 1px solid black;
	margin-top: 20px;
	display: flex; /* body-box를 flex container로 설정 */
}

.body-box input {
	flex-grow: 1; /* input 요소가 남은 공간을 모두 차지하도록 설정 */
}

.line2 {
	width: 70%;
	height: 0px;
	margin-top: 20px;
	border: 1px #929294 solid;
}

.under-box {
	width: 70%;
	height: 50px;
	display: flex; /* 자식 요소들을 수직선상에서 정렬하기 위해 플렉스박스 속성을 추가합니다 */
	align-items: center; /* 자식 요소들을 수직으로 가운데 정렬합니다 */
	justify-content: space-between;
}

.good {
	display: flex;
}

.good-count {
	margin-left: 10px;
	font-weight: bold;
}

.modify-btn {
	width: 50px;
	height: 30px;
	margin-right: 10px;
	border: 1px #929294 solid;
	border-radius: 5px;
	text-align: center;
}

.delete-btn {
	width: 50px;
	height: 30px;
	margin-right: 10px;
	border: 1px #929294 solid;
	border-radius: 5px;
	text-align: center;
}

.line3 {
	width: 70%;
	height: 0px;
	border: 1px #929294 solid;
}

.write-box .text {
	width: 2000px;
	height: 30px;
	border-radius: 5px;
}

.write-box .text-box .text {
	width: 2000px;
}

.text-box {
	border: 1px solid;
}

.btns{
display: flex;
justify-content: center;
width: 70%;
}

</style>



<section class="mt-8 text-xl px-4">
	<div class="all">
		<div class="all-content">
			<form action="../article/doModify" method="POST">
				<input type="hidden" name="id" value="${article.id }" />
				<div class="top-box">
					<div class="line-main"></div>
					<div class="title-box-1">

						<div>
							<input class="input w-full max-w-xs" autocomplete="off" type="text" placeholder="제목을 입력해주세요" name="title"
								value="${article.title }" />
						</div>

					</div>
					<div class="top-content">
						<div class="line-main"></div>
						<br />
						<div class="top-content-2">
							<div class="writer">${article.extra__writer }</div>

							<div class="updateDate">
								<div>${article.updateDate }</div>
							</div>
							<div class="hit-rel-count"></div>
						</div>
						<div class="line1"></div>
					</div>
				</div>
				<div class="body-box">
					<div>
						<input class="input  " autocomplete="off" type="text" placeholder="내용을 입력해주세요" name="body"
							value="${article.body }" />
					</div>
				</div>
				<div class="line2"></div>

				<div class="btns">
				<div>
					<input class="btn btn-outline" type="submit" value="수정" />
					<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>

					<c:if test="${article.userCanDelete }">
						<a class="btn btn-outline" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;"
							href="../article/doDelete?id=${article.id }">삭제</a>
					</c:if>
				
				</div>
				
				</div>
			</form>









			<div class="line3"></div>

		</div>

	</div>
</section>



<%@ include file="../common/foot.jspf"%>