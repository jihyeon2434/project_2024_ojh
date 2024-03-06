<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.outer-box {
	border: 5px solid green;
	width: auto;
	display: flex;
	justify-content: center;
}

.small-outer-box {
	width: 1000px;
	border: 2px solid red;
	margin-top: 30px;
}

.title-box {
	margin-top: 30px;
	border: 2px solid yellow;
}

.content-box {
	margin-top: 10px;
	border: 3px solid pink;
}

.container {
  width: 100%;
  text-align: center;
  margin-bottom: 20px;
  border: 5px solid purple;
}

.title {
	width: 441px;
	height: 154px;
	text-align: center;
	color: black;
	font-size: 34px;
	font-family: "Inria Serif", serif;
	font-weight: 400;
	word-wrap: break-word;
	margin: 0 auto;
}

.subtitle {
	width: 215px;
	height: 63px;
	color: black;
	font-size: 27px;
	font-family: "Inria Serif", serif;
	font-weight: 400;
	word-wrap: break-word;
	margin: 0 auto;
}

.line {
	width: 100%;
	height: 0px;
	border: 3px rgba(239, 231, 229, 0.7) solid;
	margin: 10px auto;
}

.description {
	width: 100%;
	color: black;
	font-size: 16px;
	font-family: "Inria Serif", serif;
	font-weight: 400;
	word-wrap: break-word;
	margin: 0 auto;
}

.button-container {
	width: 100%;
	text-align: center;
}

.button {
	display: flex;
	justify-content: center;
	width: 100px;
	height: 50px;
	background: white;
	border-radius: 5px;
	border: 1px black solid;
	margin: 0 auto;
	margin-top: 30px;
	align-items: center;
}
</style>

<div class="outer-box">
	<div class="small-outer-box">
		<div class="container">
			<div class="title-box">
				<div class="title">
					${rq.loginedMember.nickname }님
					<br />
					빠른 예약 도와드릴게요.
				</div>
			</div>
			<div class="line"></div>
			<div class="content-box">
				<div class="subtitle">이안 부원장</div>

				<div class="description">[맞춤 교정 메이크업] 고객님께 가장 잘어울리는 메이크업을 찾아 아름다운 하루를 만들어주는 친구가 되어드려요.</div>
				<div class="button-container">
					<div class="button btn btn-outline">
						<div">예약</div>
					</div>
					<div class="line"></div>
				</div>
			</div>
			<div class="content-box">
				<div class="subtitle">이안 부원장</div>

				<div class="description">[맞춤 교정 메이크업] 고객님께 가장 잘어울리는 메이크업을 찾아 아름다운 하루를 만들어주는 친구가 되어드려요.</div>
				<div class="button-container">
					<div class="button btn btn-outline">
						<div>예약</div>
					</div>
					<div class="line"></div>
				</div>
			</div>
			<div class="content-box">
				<div class="subtitle">이안 부원장</div>

				<div class="description">[맞춤 교정 메이크업] 고객님께 가장 잘어울리는 메이크업을 찾아 아름다운 하루를 만들어주는 친구가 되어드려요.</div>
				<div class="button-container">
					<div class="button btn btn-outline">
						<div>예약</div>
					</div>
					<div class="line"></div>
				</div>
			</div>

		</div>

	</div>
</div>

<%@ include file="../common/foot.jspf"%>