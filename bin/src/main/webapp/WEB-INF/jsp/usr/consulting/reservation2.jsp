<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } ARTICLE LIST"></c:set>
<%@ include file="../common/head.jspf"%>

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


.calendar-box {
	display: flex;
	justify-content: center;
	height: 600px;
}

.calendar {
	font-family: Arial, sans-serif;
	border-collapse: collapse;
	width: 80%;
	position: relative; /* 상대 위치 지정 */
	margin-top: 20px; /* calendar-month와 겹치지 않도록 상단 여백 추가 */
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
	font-family: 'Inria Serif', serif;
	font-size: 23px;
	border-radius: 5px;
	cursor: pointer;
}
</style>

<div class="outer-box">
	<div class="small-outer-box">
		<div class="title-box">
			<div class="title">
				JH님 <br />빠른 예약 도와드릴게요.
			</div>
			<div class="line"></div>
		</div>

		<div class="outer-calendar-box">
			<div class="calendar-month">
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
			<div class="calendar-box">
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
			<div class="time-outer-box">
				<div class="time-box">
					<!-- 시간 선택 -->
					<div class="time-selection">
						<label for="time">시간 선택:</label> <select class="form-control w-full max-w-xs select select-bordered" id="time">
							<option value="09:00">09:00</option>
							<option value="10:00">10:00</option>
							<option value="11:00">11:00</option>
							<!-- 시간 옵션을 필요에 따라 추가할 수 있습니다 -->
						</select>
					</div>

				</div>
			</div>

		</div>

		<div class="con-title">상담 옵션 선택</div>
		<div class="line"></div>

		<div class="consulting-item-box">
			<div class="consulting-item">
				<div>
					<input type="checkbox" checked="checked" class="checkbox" />
				</div>
				<div class="consulting-title">1:1 30분 컨설팅</div>
				<div class="consulting-price">30,000원</div>
			</div>
			<div class="line"></div>
			<div class="consulting-item">
				<div>
					<input type="checkbox" checked="checked" class="checkbox" />
				</div>
				<div class="consulting-title">1:1 60분 컨설팅</div>
				<div class="consulting-price">60,000원</div>
			</div>
		</div>
		<div class="consulting-reservation">
			<div class="reservation-button">예약하기</div>
		</div>
	</div>
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

	// 모든 캘린더 셀에 이벤트 리스너를 추가합니다.
	window.onload = function() {
		var cells = document.querySelectorAll('.calendar td');
		cells.forEach(function(cell) {
			cell.addEventListener('mouseover', function() {
				this.style.backgroundColor = 'black';
				this.style.color = 'white';
			});

			cell.addEventListener('mouseout', function() {
				this.style.backgroundColor = '';
				this.style.color = '';
			});
		});

		// 페이지 로드 시 캘린더를 초기화합니다.
		generateCalendar(year, month);
	};
</script>


<%@ include file="../common/foot.jspf"%>