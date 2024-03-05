<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>


<style>

.text-1{
font-size: medium;
}

.left-menu {
	width: 148px;
	height: 32px;
	left: 20px;
	top: 90px;
	position: absolute;
	color: black;
	font-size: 10px;
	font-family: Inria Serif;
	font-weight: 700;
	word-wrap: break-word;
}

.left-line {
	width: 900px;
	height: 0px;
	transform: rotate(90deg);
	transform-origin: 0 0;
	border: 1px #c6c6c6 solid;
	margin-left: 170px;
	position: relative;
	top: 30px;
}

.list-box {
	position: absolute;
	left: 250px;
	width: 1500px;
	height: 800px;
	top: 15%;
}

.list-box table {
	border-collapse: collapse; /* 테이블 테두리 결합 */
}

.list-box table td, .list-box table th {
	border: 1px solid #c6c6c6; /* 테이블 셀에 테두리 적용 */
}

.search-box-1 {
	 width: 60%;
    
    display: flex;
    align-items: center; /* 세로 중앙 정렬 */
}


.search-box-2 {
     margin-left: auto; /* 오른쪽 여백을 최대한으로 확보하여 가장 오른쪽에 위치 */
   
  
}


.table-box-1 {
	width: 60%;
	text-align: center;
}

.pagination {
	display: flex;
	justify-content: center;
}

.pagination-container {
	position: absolute;
	bottom: 10px; /* 바닥으로부터의 거리를 조절하세요 */
	width: 100%; /* 컨테이너를 가득 차도록 설정 */
}

/* 텍스트 필드에 테두리 추가 */
input[type="text"] {
	border: 1px solid #ccc; /* 테두리 스타일 및 색상 지정 */
	border-radius: 4px; /* 테두리의 모서리를 둥글게 만듭니다. */
	padding: 6px 10px; /* 텍스트와 테두리 간 여백 지정 */
}

/* 검색 버튼에 테두리 추가 */
button[type="submit"] {
	border: 1px solid #ccc; /* 테두리 스타일 및 색상 지정 */
	border-radius: 4px; /* 테두리의 모서리를 둥글게 만듭니다. */
	padding: 6px 10px; /* 버튼 내용과 테두리 간 여백 지정 */
}

.select {
	border: 1px solid #ccc; /* 테두리 스타일 및 색상 지정 */
	border-radius: 4px; /* 테두리의 모서리를 둥글게 만듭니다. */
	padding: 6px 10px; /* 내용과 테두리 간 여백 지정 */
}


</style>


<div class="left-menu">
	<div class="text-1">전체</div>
	<br>

	<div>consulting</div>
	<br>
	<br>

	<div>self</div>
	<br>
	<br>

	<div>공지사항</div>
	<br>
	<br>

	<div>QnA</div>
</div>
<div class="left-line"></div>
<div class="list-box">
	<div class="mx-auto overflow-x-auto">
		<div class="mb-4 flex">
			<div class="search-box-1">
				<div class="search-box-2">
					<form action="">
						<input type="hidden" name="boardId" value="${param.boardId }" />

						<select data-value="${param.searchKeywordTypeCode }" class="select select-bordered select-sm "
							name="searchKeywordTypeCode">
							<option value="title">제목</option>
							<option value="body">내용</option>
							<option value="title,body">제목+내용</option>
						</select>

						<input value="${param.searchKeyword }" name="searchKeyword" type="text" placeholder="searchKeyword?"
							class="input-sm input input-bordered w-48 max-w-xs" />

						<button class="btn btn-ghost btn-sm" type="submit">검색</button>
						<div class="badge badge-outline">${articlesCount }개</div>
					</form>
				</div>

			</div>

		</div>
	</div>
	<table class="table-box-1 table" border="1">
		<colgroup>
			<col style="width: 50%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
		</colgroup>
		<thead>
			<tr>

				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>좋아요</th>
				<th>싫어요</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="article" items="${articles }">
				<tr class="hover">

					<td>
						<a href="detail?id=${article.id }">${article.title }
							<c:if test="${article.extra__repliesCnt > 0 }">
								<span style="color: red;">[${article.extra__repliesCnt }]</span>
							</c:if>
						</a>
					</td>
					<td>${article.extra__writer }</td>
					<td>${article.regDate.substring(0,10) }</td>

					<td>${article.hitCount }</td>
					<td>${article.goodReactionPoint }</td>
					<td>${article.badReactionPoint }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 페이지네이션 컨테이너 -->
	<div class="pagination-container">
		<!-- 	동적 페이징 -->
		<div class="pagination flex justify-center mt-3">
			<c:set var="paginationLen" value="3" />
			<c:set var="startPage" value="${page -  paginationLen  >= 1 ? page - paginationLen : 1}" />
			<c:set var="endPage" value="${page +  paginationLen  <= pagesCount ? page + paginationLen : pagesCount}" />

			<c:set var="baseUri" value="?boardId=${boardId }" />
			<c:set var="baseUri" value="${baseUri }&searchKeywordTypeCode=${searchKeywordTypeCode}" />
			<c:set var="baseUri" value="${baseUri }&searchKeyword=${searchKeyword}" />

			<c:if test="${startPage > 1 }">
				<a class="btn btn-sm" href="${baseUri }&page=1">1</a>
				<button class="btn btn-sm btn-disabled">...</button>
			</c:if>

			<c:forEach begin="${startPage }" end="${endPage }" var="i">
				<a class="btn btn-sm ${param.page == i ? 'btn-active' : '' }" href="${baseUri }&page=${i }">${i }</a>
			</c:forEach>

			<c:if test="${endPage < pagesCount }">
				<button class="btn btn-sm btn-disabled">...</button>
				<a class="btn btn-sm" href="${baseUri }&page=${pagesCount }">${pagesCount }</a>
			</c:if>

		</div>
	</div>
</div>


<%@ include file="../common/foot.jspf"%>