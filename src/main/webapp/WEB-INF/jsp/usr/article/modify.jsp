<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-8 text-xl px-4">
	<div class="mx-auto">

		<h1>${article.id }번게시물 수정</h1>
		<div>번호 : ${article.id }</div>
		<div>작성날짜 : ${article.regDate }</div>

	<form method="POST" action="doModify">
		<div>
			제목 :
			<input type="text" name="title" value="${article.title }"/ >
		</div>
		<div>
			내용 :
			<input type="text" name="body" value="${article.body }"/ >
		</div>
		<button type="submit">수정</button>
		


		<div class="btns">
			<button class="hover:underline" type="button" onclick="history.back();">뒤로가기</button>

			<a href="../article/modify?id=${article.id }">수정</a>



		
		</div>
	</div>
</section>



<%@ include file="../common/foot.jspf"%>