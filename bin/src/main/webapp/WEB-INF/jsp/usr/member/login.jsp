<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="LOGIN"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.centered {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh; /* 화면 세로 중앙 정렬 */
}

.outer-container {
	width: 755px;
	height: 403px;
	position: relative;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	border-radius: 8px;
	overflow: hidden;
	border: 1px rgba(0, 0, 0, 0.20) solid;
	background: rgba(239, 231, 229, 0.50);
}

.logo {
	font-size: 70px;
	font-family: Inria Serif;
	font-weight: 400;
	word-wrap: break-word;
}

.outer-box {
	width: 450px;
	height: 300px;
	left: 193px;
	top: 125px;
	position: absolute;
	background: rgba(239, 231, 229, 0.89);
	border-radius: 9px;
	border: 1px rgba(0, 0, 0, 0.20) solid"></div>
}

.login-container {
	text-align: center;
	border-radius: 10px;
	padding-top: 20px; /* 로고와 로그인 폼 사이의 간격 조절 */
}

.login-box {
	background-color: #EFE7E5; /* 배경색 */
	background-color: rgba(239, 231, 229, 0.89); /* 배경색 (진하기 89%) */
	border: none;
	
}

.login-footer {
	text-align: center;
	margin-top: 20px;
}

.login-footer a {
	font-size: 0.5em; /* 글씨 크기를 작게 조정 */
}
.input {
        width:100%;
    /* 필요에 따라 너비를 조절할 수 있습니다 */
}




</style>



<section class="text-xl px-5 centered">
    <div class="outer-container" style="height: 450px;">
        <!-- 높이 조정 -->
        <div class="outer-box" style="left: 50%; top: 50%; transform: translate(-50%, -50%);">
            <div class="login-container">
                <div class="logo" style="position: absolute; top: -10%; left: 50%; transform: translate(-50%, -50%); font-size: 30px; font-family: 'Inria Serif', serif;">LOGO</div>
                <form action="../member/doLogin" method="POST" class="mx-auto max-w-xs">
                    <input type="hidden" name="afterLoginUri" value="${param.afterLoginUri}" />
                    <div class="login-box">
                        <table class="table-box-1 mx-20">
                            <tbody>
                                <tr>
                                    <th class="text-xs">아이디</th>
                                    <td>
                                        <input class="input input-bordered input-primary w-full text-xs" autocomplete="off" type="text"
                                            placeholder="아이디를 입력해주세요" name="loginId"
                                            style="color: #000 !important; background-color: rgba(239, 231, 229, 0.89) !important;" />
                                    </td>
                                </tr>
                                <tr>
                                    <th class="text-xs">비밀번호</th>
                                    <td>
                                        <input class="input input-bordered input-primary w-full text-xs" autocomplete="off" type="password"
                                            placeholder="비밀번호를 입력해주세요" name="loginPw"
                                            style="color: #000 !important; background-color: rgba(239, 231, 229, 0.89) !important;" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
            <div class="text-center mt-4">
                <!-- 추가된 부분 -->
                <input class="btn btn-outline btn-info w-1/2 rounded-lg" type="submit" value="로그인" />
            </div>
        </div>
        <div class="login-footer" style="position: absolute; bottom: 100px; left: 50%; transform: translateX(-50%);">
            <a class="searchid" href="#" style="margin-right: 30px;">아이디 찾기</a>
            <a class="searchpw" href="#" style="margin-right: 30px;">비밀번호 찾기</a>
            <a class="dojoin" href="#">회원가입</a>
        </div>
    </div>
</section>