<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>




		<div>
			<td>번호: ${article.id }</td>
		</div>
		<div>
			<td>날짜: ${article.regDate.substring(0,10) }</td>
		</div>

		<div>
			<td>작성자: ${article.memberId }</td>
		</div>
		<div>
			<td>제목: ${article.title }</td>
		</div>
		<div>
			<td>내용: ${article.body }</td>
		</div>







<%@ include file="../common/foot.jspf"%>