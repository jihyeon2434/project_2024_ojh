<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MYCALENDAR"></c:set>
<%@ include file="../common/head.jspf"%>

<style>

/* 왼쪽 메뉴 박스 */
.container {
	background-color: #fff;
	display: flex;
	gap: 20px;
	color: #000;
	padding: 50px 80px 50px 17px;
}

@media ( max-width : 991px) {
	.container {
		flex-wrap: wrap;
		padding-right: 20px;
	}
}

.sidebar {
	align-self: start;
	display: flex;
	margin-top: 23px;
	flex-direction: column;
	font-size: 10px;
	font-weight: 500;
}

.member-info {
	font-family: Inter, sans-serif;
	width: 150px;
}

.my-calendar {
	font-family: Inter, sans-serif;
	width: 150px;
	margin-top: 44px;
}

@media ( max-width : 991px) {
	.my-calendar {
		margin-top: 40px;
	}
}

.online-reservation {
	font-family: Inter, sans-serif;
	width: 150px;
	margin-top: 43px;
}

@media ( max-width : 991px) {
	.online-reservation {
		margin-top: 40px;
	}
}


.divider {
	border-color: rgba(232, 232, 232, 1);
	border-style: solid;
	border-width: 1px;
	background-color: #e8e8e8;
	width: 1px;
	height: 924px;
}

/* 왼쪽 메뉴 박스 끝 */


.calendar-month {
	position: relative; /* 상대 위치 지정 */
}

.small-outer-box {
	display: flex;
	justify-content: center;
}

.right-box {
	width: 1800px;
	margin-top: 30px;
}

/* 달력위치 조정 */
.calendar-box {
	width: 1000px;
	margin-left: 30px;
}

/* 달력 스타일링 */
.calendar {
	font-family: Arial, sans-serif;
	border-collapse: collapse;
	width: 1000px;
}

.calendar th {
	background-color: #f2f2f2;
}

.calendar th, .calendar td {
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
}
</style>




<body>


	<div class="container">
		<aside class="sidebar">
			<div class="member-info">
				<a href="/usr/member/myPage">회원정보</a>
			</div>
			<div class="my-calendar">
				<a href="/usr/member/myCalendar">마이 캘린더</a>
			</div>
			<div class="online-reservation">
				<a href="/usr/member/myReservation">온라인 컨설팅 예약 내역</a>
			</div>
			<div class="online-reservation">
				<a href="/usr/member/myScrapShops">관심 매장</a>
			</div>
		</aside>

		<div class="divider"></div>

		<main class="main-content">
			<div class="content-wrapper">
				<div class="calendar-box">
					<div class="calendar-month">
						<h2 class="font-bold text-lg">${rq.loginedMember.nickname }'sCalendar</h2>
						<!-- 현재 연도와 월을 표시합니다 -->
						<%
						java.util.Calendar cal = java.util.Calendar.getInstance();
						int year = cal.get(java.util.Calendar.YEAR);
						int month = cal.get(java.util.Calendar.MONTH) + 1; // 0부터 시작하므로 1을 더해줌
						%>
						<p class="font-bold ">
							현재 연도:
							<%=year%></p>
						<p class="present-MonthDay"></p>
					</div>

					<table class="calendar">

						<thead>
							<tr>
								<th colspan="7">
									<button onclick="prevMonth()">Previous</button>
									<div class="present-MonthYear"><%=year%>.
										<%=(month < 10 ? '0' + month : month)%></div>
									<button onclick="nextMonth()">Next</button>
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
			</div>
		</main>
	</div>






	<script>
		var year =
	<%=year%>
		; // JSP에서 받아온 년도
		var month =
	<%=month%>
		; // JSP에서 받아온 월

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
				cell.appendChild(document.createTextNode(""));
				row.appendChild(cell);
			}

			for (var i = 0; i < monthLength; i++) {
				if (row.children.length === 7) {
					table.appendChild(row);
					row = document.createElement("tr");
				}
				var cell = document.createElement("td");
				cell.appendChild(document.createTextNode(date));
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

			// 현재 년도와 월 표시
			var monthYearElement = document.querySelector('.present-MonthYear');
			monthYearElement.textContent = year + '. '
					+ (month < 10 ? '0' + month : month);
		}

		// 페이지 로드시에 초기 달력 생성
		window.onload = function() {
			generateCalendar(year, month);
		};
	</script>
</body>


<%@ include file="../common/foot.jspf"%>
