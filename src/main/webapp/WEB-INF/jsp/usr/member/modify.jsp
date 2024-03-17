<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MEMBER MODIFY"></c:set>
<%@ include file="../common/head.jspf"%>


<style>
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

.word {
  width: 85px;
  text-align: center;
  color: black;
  font-size: 19px;
  font-family: Inria Serif;
  font-weight: 700;
 margin-left: 30px;
 padding-top: 10px;
 
}

.Rectangle {
  width: 700px;
  height: 550px;
  background: rgba(239, 231, 229, 0.33);
  border-radius: 33px;
 
}

.line {
  width: 680px;
  height: 0px;
  border: 1px rgba(198, 198, 198, 0.5) solid;
}

.id {
  width: 147px;
  height: 51px;
  color: black;
  font-size: 15px;
  font-family: Inria Serif;
  font-weight: 700;
  word-wrap: break-word;
  margin-left: 20px;
  margin-top: 20px;
  display: inline-block;
  font-size: small;
}

.content-line {
  display: flex; /* 변경된 부분 */
  align-items: center; /* 변경된 부분 */
  margin-bottom: -18px; /* 변경된 부분 */
}

.content {
  display: inline;
  margin-left: 70px;
  font-size: small;
}

.left-line {
  width: 700px;
  height: 0px;
  transform: rotate(90deg);
  transform-origin: 0 0;
  border: 1px #c6c6c6 solid;
  margin-left: 170px;
}

.Rectangle-line {
  width: 435px;
  height: 0px;
  transform: rotate(90deg);
  transform-origin: 0 0;
  border: 1px #c6c6c6 solid;
  position: relative;
  left: 150px;
  top: 65px;
  
}

.btn-1 {
  font-size: small;
  width: 700px;
  height: 100px;
  display: flex;
  justify-content: center;
  padding-top: 20px;
  
}

.all-Content {
position: relative;
top: 25px;
left: 10px;
}

.input {
  width: 400px; /* 변경된 부분 */
  height: 30px; /* 변경된 부분 */
  border: none;
  border-radius: 5px;
  padding: 5px;
  background: rgba(239, 231, 229, 0.33);
}
.outer-box {
  width: auto;
  height: 700px;
  display: flex;
  justify-content: center;
}

.small-outer-box {
  width: 1000px;
  margin-top: 30px;
  display: flex;
  justify-content: center;
}



.modify-btn, .modifyBack-btn{
  display: inline-block;
  margin-left: 10px;
  margin-right: 10px;
  
  
}
</style>

<!-- Member modify 관련 -->

<script type="text/javascript">
	let MemberModify__submitFormDone = false;
	function MemberModify__submit(form) {
		if (MemberModify__submitFormDone) {
			return;
		}
		form.loginPw.value = form.loginPw.value.trim();
		if (form.loginPw.value.length > 0) {
			form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
			if (form.loginPwConfirm.value.length == 0) {
				alert('비번 확인 써라');
				form.loginPwConfirm.focus();
				return;
			}
			if (form.loginPw.value != form.loginPwConfirm.value) {
				alert('비번 불일치');
				form.loginPw.focus();
				return;
			}
		}
		form.name.value = form.name.value.trim();
		form.nickname.value = form.nickname.value.trim();
		form.cellphoneNum.value = form.cellphoneNum.value.trim();
		form.email.value = form.email.value.trim();

		MemberModify__submitFormDone = true;
		form.submit();
	}
</script>

<div class="outer-box">
  <div class="small-outer-box">
    <section class="content-box mt-8 text-xl px-4">

      <form action="../member/doModify" method="POST" onsubmit="MemberModify__submit(this); return false;">

        <div class="Rectangle">

          <div class="Rectangle-line"></div>
          <div class="word">기본정보</div>

          <div class="all-Content">
            <div class="line"></div>
            <div class="content-line">
              <div class="id">아이디</div>
              <div class="content">${rq.loginedMember.loginId }</div>
            </div>

            <div class="line"></div>
            <div class="content-line">
              <div class="id">새 비밀번호</div>
              <div class="content">
                <input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text" placeholder="새 비밀번호를 입력해주세요" name="loginPw" />
              </div>
            </div>

            <div class="line"></div>
            <div class="content-line">
              <div class="id">새 비밀번호 확인</div>
              <div class="content">
                <input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text" placeholder="새 비밀번호 확인을 입력해주세요" name="loginPwConfirm" />
              </div>
            </div>

            <div class="line"></div>
            <div class="content-line">
              <div class="id">이름</div>
              <div class="content">
                <input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text" placeholder="이름을 입력해주세요" name="name" value="${rq.loginedMember.name }" />
              </div>
            </div>

            <div class="line"></div>
            <div class="content-line">
              <div class="id">닉네임</div>
              <div class="content">
                <input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text" placeholder="닉네임을 입력해주세요" name="nickname" value="${rq.loginedMember.nickname }" />
              </div>
            </div>

            <div class="line"></div>
            <div class="content-line">
              <div class="id">전화번호</div>
              <div class="content">
                <input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text" placeholder="전화번호를 입력해주세요" name="cellphoneNum" value="${rq.loginedMember.cellphoneNum }" />
              </div>
            </div>

            <div class="line"></div>
            <div class="content-line">
              <div class="id">이메일</div>
              <div class="content">
                <input class="input input-bordered input-primary w-full max-w-xs" autocomplete="off" type="text" placeholder="이메일을 입력해주세요" name="email" value="${rq.loginedMember.email }" />
              </div>
            </div>

            <div class="line"></div>
            <div class="content-line">
              <div class="id">가입날짜</div>
              <div class="content">${rq.loginedMember.regDate }</div>
            </div>
            <div class="line"></div>
          </div>
        </div>
        <div class="btn-1">
          <div class="modify-btn">
            <button class="btn btn-outline type="submit">수정</button>
          </div>
          <div class="modifyBack-btn">
            <button class="btn btn-active btn-ghost" type="button" onclick="history.back();">취소</button>
          </div>
        </div>
      </form>
    </section>

  </div>
</div>


<%@ include file="../common/foot.jspf"%>