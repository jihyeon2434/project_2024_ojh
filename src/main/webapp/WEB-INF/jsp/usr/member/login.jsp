<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="LOGIN"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
    .centered {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh; /* Adjust as needed */
    }

    .outer-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
    }

    .outer-box {
        background-color: rgba(255, 255, 255, 0.8); /* Adjust transparency as needed */
        border: 1px solid #ccc;
        border-radius: 10px;
        padding: 100px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        width: 100%; /* 작은 네모박스의 크기 */
    }

    .login-container {
        text-align: center;
    }

    .login-footer {
        text-align: center;
        margin-top: 20px;
    }

    .login-footer a {
        font-size: 0.5em; /* 글씨 크기를 작게 조정 */
    }
</style>

<section class="mt-8 text-xl px-4 centered">
    <div class="outer-container">
        <div class="outer-box">
            <div class="login-container">
                <form action="../member/doLogin" method="POST" class="mx-auto max-w-xs">
                    <input type="hidden" name="afterLoginUri" value="${param.afterLoginUri}" />
                    <table class="login-box table-box-1" border="1">
                        <tbody>
                        <tr>
                            <th>아이디</th>
                            <td>
                                <input class="input input-bordered input-primary w-full" autocomplete="off" type="text"
                                       placeholder="아이디를 입력해주세요" name="loginId" />
                            </td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td>
                                <input class="input input-bordered input-primary w-full" autocomplete="off" type="password"
                                       placeholder="비밀번호를 입력해주세요" name="loginPw" />
                            </td>
                        </tr>
                        <tr>
                            <th></th>
                            <td>
                                <input class="btn btn-outline btn-info w-full" type="submit" value="로그인" />
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
                <div class="login-footer">
                    <a href="#">아이디 찾기</a> |
                    <a href="#">비밀번호 찾기</a> |
                    <a href="#">회원가입</a>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../common/foot.jspf"%>