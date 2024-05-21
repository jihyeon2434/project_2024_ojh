<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="ARTICLE DETAIL"></c:set>
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>

<!-- <iframe src="http://localhost:8081/usr/article/doIncreaseHitCountRd?id=372" frameborder="0"></iframe> -->
<style>
.full-content-outer-box {
	display: flex;
	justify-content: center;
	width: 100%;
	height: auto;

}

.content-outer-box {
	width: 1000px;
		
}

.small-content-outer-box {
	border: 3px solid #efefef;
	border-radius: 10px;
	width: 1000px;
}

.small-reply-outer-box {
	border: 3px solid #efefef;
	width: 1000px;
}

th {
	width: 50px; /* 원하는 너비로 변경하세요 */
}

tr {
	
}

.body {
	height: 600px;
	
}

.btn-box {
	display: flex;
	justify-content: center;
}

.title {
	font-size: 30px;
	padding: 20px;
}

.text {
	width: auto;
}

.custom-textarea-width {
	width: 850px; /* 또는 다른 특정 너비 */
	margin-right: 13px;
}

/* .reply-body{
width: 
} */
.content-box th {
	width: 150px; /* 원하는 너비로 변경하세요 */
	padding-left: 10px; /* 왼쪽 패딩을 추가합니다 */
}
</style>
<!-- 변수 -->
<script>
	const params = {};
	params.id = parseInt('${param.id}');
	params.memberId = parseInt('${loginedMemberId}');

	console.log(params);
	console.log(params.memberId);

	var isAlreadyAddGoodRp = $
	{
		isAlreadyAddGoodRp
	};
	var isAlreadyAddBadRp = $
	{
		isAlreadyAddBadRp
	};
</script>

<!-- 조회수 -->
<script>
	function ArticleDetail__doIncreaseHitCount() {
		const localStorageKey = 'article__' + params.id + '__alreadyView';

		if (localStorage.getItem(localStorageKey)) {
			return;
		}

		localStorage.setItem(localStorageKey, true);

		$.get('../article/doIncreaseHitCountRd', {
			id : params.id,
			ajaxMode : 'Y'
		}, function(data) {
			$('.article-detail__hit-count').empty().html(data.data1);
		}, 'json');
	}

	$(function() {
		// 		ArticleDetail__doIncreaseHitCount();
		setTimeout(ArticleDetail__doIncreaseHitCount, 2000);
	});
</script>



<!-- 댓글 -->
<script>
	var ReplyWrite__submitDone = false;

	function ReplyWrite__submit(form) {
		if (ReplyWrite__submitDone) {
			alert('이미 처리중입니다');
			return;
		}
		console.log(123);

		console.log(form.body.value);

		if (form.body.value.length < 3) {
			alert('댓글은 3글자 이상 입력해');
			form.body.focus();
			return;
		}

		ReplyWrite__submitDone = true;
		form.submit();

	}
</script>
<!-- 댓글 수정 -->
<script>
	function toggleModifybtn(replyId) {

		console.log(replyId);

		$('#modify-btn-' + replyId).hide();
		$('#save-btn-' + replyId).show();
		$('#reply-' + replyId).hide();
		$('#modify-form-' + replyId).show();
	}

	function doModifyReply(replyId) {
		console.log(replyId); // 디버깅을 위해 replyId를 콘솔에 출력

		// form 요소를 정확하게 선택
		var form = $('#modify-form-' + replyId);
		console.log(form); // 디버깅을 위해 form을 콘솔에 출력

		// form 내의 input 요소의 값을 가져옵니다
		var text = form.find('input[name="reply-text-' + replyId + '"]').val();
		console.log(text); // 디버깅을 위해 text를 콘솔에 출력

		// form의 action 속성 값을 가져옵니다
		var action = form.attr('action');
		console.log(action); // 디버깅을 위해 action을 콘솔에 출력

		$.post({
			url : '/usr/reply/doModify', // 수정된 URL
			type : 'POST', // GET에서 POST로 변경
			data : {
				id : replyId,
				body : text
			}, // 서버에 전송할 데이터
			success : function(data) {
				$('#modify-form-' + replyId).hide();
				$('#reply-' + replyId).text(data);
				$('#reply-' + replyId).show();
				$('#save-btn-' + replyId).hide();
				$('#modify-btn-' + replyId).show();
			},
			error : function(xhr, status, error) {
				alert('댓글 수정에 실패했습니다: ' + error);
			}
		})
	}
</script>


<section class="mt-8">
	<div class="full-content-outer-box">
		<div class="content-outer-box">
			<div class="small-content-outer-box">
				<table class="table-box-1 content-box" border="1">
					<tbody>

						<tr>
							<td colspan="2" class="title"">${article.title }</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${article.extra__writer }</td>
						</tr>
						<tr>
							<th>작성날짜</th>
							<td>${article.regDate }</td>
						</tr>
						<tr>
							<th>조회수</th>
							<td><span class="article-detail__hit-count">${article.hitCount }</span></td>
						</tr>

						<tr>
							<td colspan="2"><img class="w-full rounded-xl" src="${rq.getImgUri(article.id)}"
								onerror="${rq.profileFallbackImgOnErrorHtml}" alt="" /></td>
						</tr>

						<tr class="body">
							<td colspan="2">
								<div class="toast-ui-viewer">
									<script type="text/x-template">${article.body}</script>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btns mt-5 btn-box">
					<div>
						<button class="btn btn-outline" type="button" onclick="history.back();">뒤로가기</button>
						<c:if test="${article.userCanModify }">
							<a class="btn btn-outline" href="../article/modify?id=${article.id }">수정</a>
						</c:if>
						<c:if test="${article.userCanDelete }">
							<a class="btn btn-outline" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;"
								href="../article/doDelete?id=${article.id }">삭제</a>
						</c:if>
					</div>

				</div>
			</div>
			<div class="mt-5 px-3 small-reply-outer-box">
				<c:if test="${rq.isLogined() }">
					<form action="../reply/doWrite" method="POST" onsubmit="ReplyWrite__submit(this); return false;">
						<input type="hidden" name="relTypeCode" value="article" /> <input type="hidden" name="relId"
							value="${article.id }" />
						<table class="write-box table-box-1" border="1">
							<tbody class="reply-box">
								<tr>

									<td colspan="2"><textarea class="input input-bordered custom-textarea-width" autocomplete="off"
											placeholder="답변을 입력해주세요" name="body"> </textarea></td>
									<td><input class="btn btn-outline" type="submit" value="답변 작성" /></td>
								</tr>

							</tbody>
						</table>
					</form>
				</c:if>
				<c:if test="${!rq.isLogined() }">
					<a class="btn btn-outline btn-ghost" href="${rq.loginUri }">LOGIN</a> 하고 댓글 써
	</c:if>
				<div class="mx-auto">
					<%-- <h2>댓글 리스트(${repliesCount })</h2> --%>
					<table class="table-box-1 table" border="1">
						<colgroup>
							<col style="width: 65%" />
							<col style="width: 10%" />
							<col style="width: 15%" />
							<col style="width: 10%" />
							<col style="width: 10%" />
						</colgroup>
						<thead>
							<tr>


								<th>내용</th>
								<th>작성자</th>

								<th>날짜</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="reply" items="${replies }">
								<tr class="hover">


									<td><span id="reply-${reply.id }">${reply.body }</span>
										<form method="POST" id="modify-form-${reply.id }" style="display: none;" action="/usr/reply/doModify">
											<input type="text" value="${reply.body }" name="reply-text-${reply.id }" />
										</form></td>
									<td>${reply.extra__writer }</td>

									<td>${reply.regDate.substring(0,10) }</td>
									<td><c:if test="${reply.userCanModify }">
											<%-- 							href="../reply/modify?id=${reply.id }" --%>
											<button onclick="toggleModifybtn('${reply.id}');" id="modify-btn-${reply.id }" style="white-space: nowrap;"
												class="btn btn-outline">수정</button>
											<button onclick="doModifyReply('${reply.id}');" style="white-space: nowrap; display: none;"
												id="save-btn-${reply.id }" class="btn btn-outline">저장</button>
										</c:if></td>
									<td><c:if test="${reply.userCanDelete }">
											<a style="white-space: nowrap;" class="btn btn-outline"
												onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="../reply/doDelete?id=${reply.id }">삭제</a>
										</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
</section>



<script>
	
</script>

<%@ include file="../common/foot.jspf"%>