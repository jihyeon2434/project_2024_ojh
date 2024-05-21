<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>


<%
com.example.demo.vo.Member loginedMember = (com.example.demo.vo.Member) session.getAttribute("loginedMember");
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
	font-family: "Inter";
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

.calendar-box {
	display: flex;
	justify-content: center;
	height: 600px;
}

.calendar {
	font-family: "" Inter "";
	border-collapse: collapse;
	width: 80%;
	position: relative;
	margin-top: 20px;
}

.calendar th {
	background-color: #f2f2f2;
}

.calendar th, .calendar td {
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
}

.time-outer-box {
	display: flex;
	height: 50px;
	justify-content: center;
	align-items: center;
}

.time-box {
	width: 500px;
	height: auto;
	text-align: center;
}

.time-selection {
	margin-top: 20px;
}

.time-selection label {
	font-weight: bold;
}

.time-selection select {
	padding: 5px;
	font-size: 16px;
}

.con-title {
	padding-left: 10px;
	font-weight: bold;
	font-size: 20px;
	margin-top: 20px;
}

.consulting-item {
	padding-left: 20px;
}

.calendar td:hover {
	background-color: black;
	color: white;
	cursor: pointer;
}

.consulting-reservation {
	text-align: center;
}

.reservation-button {
	display: inline-block;
	padding: 10px 20px;
	background-color: black;
	color: white;
	font-family: "Inter";
	font-size: 23px;
	border-radius: 5px;
	cursor: pointer;
}

.text {
	display: flex;
	justify-content: center;
}
</style>

<div class="outer-box">
	<div class="small-outer-box">
		<div class="title-box">
			<div class="title">
				<%=loginedMember.getNickname()%>님 <br />빠른 예약 도와드릴게요.
			</div>
			<div class="line"></div>
		</div>
		<div class="text">
			<div>답변 받고싶은 날짜를 선택해주세요.</div>
		</div>

		<form id="dateForm" action="reservation3?shopId=<%=shopId%>" method="POST">
			<input type="hidden" name="shopId" value="<%=shopId%>">
			
			
			<!-- 업체 ID를 숨겨진 필드로 추가 -->
			<div class="outer-calendar-box">
				<div class="calendar-month">
					<%
					java.util.Calendar cal = java.util.Calendar.getInstance();
					int year = cal.get(java.util.Calendar.YEAR);
					int month = cal.get(java.util.Calendar.MONTH) + 1;
					%>
					<%-- 					<p class="font-bold">현재 연도: <%=year%></p> --%>
					<p class="present-MonthDay"></p>
				</div>
				<div class="calendar-box">
					<table class="calendar">
						<thead>
							<tr>
								<th colspan="7">
									<div>
										<button type="button" onclick="prevMonth()">Previous</button>
										<div class="present-MonthYear"><%=year%>.<%=(month < 10 ? '0' + month : month)%></div>
										<button type="button" onclick="nextMonth()">Next</button>
									</div>
								</th>
							</tr>
							<tr>
								<th>Sun</th>
								<th>Mon</th>
								<th>Tue</th>
								<th>Wed</th>
								<th>Thu</th>
								<th>Fri</th>
								<th>Sat</th>
							</tr>
						</thead>
						<tbody id="calendar-body">
							<!-- 달력 내용은 JavaScript로 채웁니다 -->
						</tbody>
					</table>
				</div>
				<input type="hidden" id="selectedDateInput" name="selectedDate">
			</div>

			<div class="con-title">상담 옵션 선택</div>
			<div class="line"></div>

			<div class="consulting-item-box">
				<div>
					<input type="radio" name="consultingOption" value="1:1 30분 컨설팅 30,000원" checked="checked"> 1:1 30분 컨설팅
					30,000원<br>
					<!-- 	<input type="radio" name="consultingOption" value="1:1 60분 컨설팅 60,000원"> 1:1 60분 컨설팅 60,000원-->
					<br>
				</div>
			</div>
			<div class="consulting-reservation">
				<button type="submit" class="reservation-button">예약하기</button>
			</div>
		</form>
	</div>
</div>

<%@ include file="../common/foot.jspf"%>

<script>
	var year =
<%=year%>
	;
	var month =
<%=month%>
	;

	function prevMonth() {
		month--;
		if (month < 1) {
			month = 12;
			year--;
		}
		generateCalendar(year, month);
	}

	function nextMonth() {
		month++;
		if (month > 12) {
			month = 1;
			year++;
		}
		generateCalendar(year, month);
	}

	function generateCalendar(year, month) {
		var firstDay = new Date(year, month - 1, 1);
		var lastDay = new Date(year, month, 0);
		var startingDay = firstDay.getDay();
		var monthLength = lastDay.getDate();

		var table = document.getElementById("calendar-body");
		table.innerHTML = "";

		var date = 1;
		var row = document.createElement("tr");
		for (var i = 0; i < startingDay; i++) {
			var cell = document.createElement("td");
			row.appendChild(cell);
		}

		for (var i = 0; i < monthLength; i++) {
			if (row.children.length === 7) {
				table.appendChild(row);
				row = document.createElement("tr");
			}
			var cell = document.createElement("td");
			cell.appendChild(document.createTextNode(date));
			cell.onclick = function() {
				updateSelectedDate(this.textContent);
			};
			row.appendChild(cell);
			date++;
		}
		if (row.children.length > 0) {
			while (row.children.length < 7) {
				var cell = document.createElement("td");
				cell.appendChild(document.createTextNode(""));
				row.appendChild(cell);
			}
			table.appendChild(row);
		}
	}

	function updateSelectedDate(day) {
		var selectedDate = year + '-' + (month < 10 ? '0' + month : month)
				+ '-' + (day < 10 ? '0' + day : day);
		document.getElementById('selectedDateInput').value = selectedDate;
	}

	window.onload = function() {
		generateCalendar(year, month);
	};
</script>
