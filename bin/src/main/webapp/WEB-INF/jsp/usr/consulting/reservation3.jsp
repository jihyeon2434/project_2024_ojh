<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<%
com.example.demo.vo.Member loginedMember = (com.example.demo.vo.Member) session.getAttribute("loginedMember");
%>
<%
String selectedDate = request.getParameter("selectedDate");
/*     String selectedTime = request.getParameter("selectedTime"); */
String consultingOption = request.getParameter("consultingOption");
%>
<%@ page import="com.example.demo.vo.conShop"%>

<%
String shopId = request.getParameter("id");
%>

<style>
.outer-box {
	display: flex;
	width: auto;
	height: auto;
	justify-content: center;
}

.small-outer-box {
	width: 1000px;
	height: 900px;
	margin-top: 30px;
}

.title {
	width: 441px;
	height: 154px;
	text-align: center;
	color: black;
	font-size: 34px;
	font-weight: 200;
	word-wrap: break-word;
	margin: 0 auto;
}

.line {
	width: 100%;
	height: 0px;
	border: 3px rgba(239, 231, 229, 0.7) solid;
	margin: 10px auto;
}

.content-box {
	height: 150px;
}

.Group129 {
	width: 600px;
	height: 70px;
	position: relative;
	margin-left: 30px;
}

.Rectangle62 {
	width: 600px;
	height: 70px;
	left: 0px;
	top: 0px;
	position: absolute;
	background: white;
	border-radius: 10px;
}

.Rectangle62 div {
	font-weight: normal;
	font-size: 25px;
}

.time {
	font-weight: normal;
	font-size: 25px;
}

.price-box {
	width: 600px;
	height: 70px;
	margin-top: 70px;
}

.consulting-reservation {
	text-align: center;
}

.reservation-button {
	display: inline-block;
	padding: 10px 20px;
	background-color: black;
	color: white;
	font-size: 23px;
	border-radius: 5px;
	cursor: pointer;
}

.price {
	color: red;
	font-size: larger;
}

.price-title {
	/*   font-size: large; */
	
}
</style>

<div class="outer-box">
	<div class="small-outer-box">
		<div class="title-box">
			<div class="title">
				<%=loginedMember.getNickname()%>님<br />빠른 예약 도와드릴게요.
			</div>
			<div class="line"></div>
		</div>
		<div class="content-box">
			<div class="Group129">
				<div class="Rectangle62">
					<div>
						<%=selectedDate%></div>
					<div class="time">
						<%=consultingOption%></div>
					<div class="shopName"><%=request.getAttribute("shopName") != null
		? request.getAttribute("shopName").toString()
		: "Shop information unavailable"%></div>
				</div>
				<div class="price-box">
					<div class="price-title">결제 금액</div>
					<div class="price">30,000원</div>
				</div>
			</div>
		</div>
		<div class="consulting-reservation">
			<button onclick="payment()" class="reservation-button">예약하기</button>
		</div>
	</div>
</div>

<script src="https://js.tosspayments.com/v1"></script>
<script>
const buyerName = '<%= loginedMember != null ? loginedMember.getNickname() : "Guest" %>';
const shopName = '<%= request.getAttribute("shopName") != null ? request.getAttribute("shopName").toString() : "Shop information unavailable" %>'; 

const tossPayments = TossPayments("test_ck_mBZ1gQ4YVXg1XpDRqdO93l2KPoqN");

function payment() {
    const method = "카드"; 
    const orderName = "1:1 30분 컨설팅 - " + shopName; 

    const paymentData = {
        amount: 30000,
        orderId: "order__" + new Date().getTime(),
        orderName: orderName, 
        customerName: buyerName, 
        successUrl: window.location.origin + "/payment/success?shopName=" + encodeURIComponent(shopName),
        failUrl: window.location.origin + "/fail",
    };

    tossPayments.requestPayment(method, paymentData);
}
</script>



<%@ include file="../common/foot.jspf"%>s
