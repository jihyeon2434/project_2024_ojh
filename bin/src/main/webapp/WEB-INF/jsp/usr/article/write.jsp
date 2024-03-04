<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ARTICLE WRITE"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.text-1 {
	font-size: medium;
}

table>tbody>tr>th {
	width: 100px;
	height: 35px;
}



.write-box {
	position: relative;
	left: 100px;
	top: 15px;
	width: 800px;
}

.left-menu {
	width: 148px;
	height: 32px;
	left: 20px;
	top: 50px;
	position: absolute;
	color: black;
	font-size: 10px;
	font-family: Inria Serif;
	font-weight: 700;
	word-wrap: break-word;
}

.left-line {
	width: 700px;
	height: 0px;
	transform: rotate(90deg);
	transform-origin: 0 0;
	border: 1px #c6c6c6 solid;
	margin-left: 170px;
	position: relative;
	top: 30px;
}

.btn-back {
	position: absolute;
	right: -10px;
	top: 529px;
	width: 60px;
	border: 1px solid black; /* 검정색 테두리 */
	border-radius: 5px;
}

.btn {
	border-radius: 5px;
}

.title {
	width: 700px;
}

.content {
	height: 400px;
	width: 700px;
}

.btn-column {
	position: absolute;
	right: -90px;
	top: 529px;
	width: 60px;
	border: 1px solid black; /* 검정색 테두리 */
	border-radius: 5px;
	text-align: center;
	cursor:pointer;
}

.input-bordered {
	border: none;
}

.table-box-1 {
	border-collapse: collapse; /* 테이블 셀 경계를 병합하여 한 줄의 테두리로 표시 */
}

.table-box-1 th, .table-box-1 td {
	border: 1px solid black; /* 검정색 테두리 */
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



<div class="write-box">
	<div class="mx-auto">
		<form action="../article/doWrite" method="POST">
			<table class="write-box table-box-1">
				<tbody>
					<tr>
						<th>작성자</th>
						<td>
							<div>${rq.loginedMember.nickname }</div>
						</td>
					</tr>
					<tr>
						<th>게시판</th>
						<td>
							<select class="select select-ghost w-full max-w-xs" name="boardId">
								<!-- 									<option selected="selected" disabled>게시판을 선택해주세요</option> -->
								<option value="1">공지사항</option>
								<option value="2">consulting</option>
								<option value="2">self</option>
								<option value="3">QNA</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input class="title input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="제목을 입력해주세요" name="title" />
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<input class=" content input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text"
								placeholder="내용을 입력해주세요" name="body" />
						</td>
					</tr>


					<tr>

					</tr>
				</tbody>
			</table>
			<div class="btn-column">
				<input class="btn btn-outline btn-info" type="submit" value="작성" />
			</div>
		</form>
		<div class="btn-back">
			<button class="btn btn-outline " type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</div>



<%@ include file="../common/foot.jspf"%>