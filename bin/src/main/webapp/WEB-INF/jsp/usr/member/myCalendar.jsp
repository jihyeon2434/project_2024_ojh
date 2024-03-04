<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MYCALENDAR"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.left-menu {
    width: 148px;
    height: 32px;
    left: 20px;
    top: 100px;
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
    border: 1px #C6C6C6 solid;
    margin-left: 170px;
}

.calendar-month {
    position: relative; /* 상대 위치 지정 */
}

/* 달력위치 조정 */
.calendar-box {
    position: relative; /* 상대 위치 지정 */
    left: 15%;
    top: 12%;
}

/* 달력 스타일링 */
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
</style>
</head>
<body>
<div class="left-menu">
    <div>
        <button type="button" onclick="usr/member/myPage">회원정보</button>
    </div>
    <br>
    <div>
        <button type="button" onclick="usr/member/myCalendar">마이 캘린더</button>
    </div>
    <br>
    <div>온라인 컨설팅 예약내역</div>
</div>

<div class="left-line"></div>

<div class="calendar-box">
    <div class="calendar-month">
        <h2 class="font-bold text-lg">${rq.loginedMember.nickname }'s Calendar</h2>
        <!-- 현재 연도와 월을 표시합니다 -->
        <% java.util.Calendar cal = java.util.Calendar.getInstance();
           int year = cal.get(java.util.Calendar.YEAR);
           int month = cal.get(java.util.Calendar.MONTH) + 1; // 0부터 시작하므로 1을 더해줌 %>
        <p class="font-bold ">현재 연도: <%= year %></p>
        <p class="present-MonthDay"></p>
    </div>

    <table class="calendar">

        <thead>
        <tr>
            <th colspan="7">
                <button onclick="prevMonth()">Previous</button>
                <div class="present-MonthYear"><%= year %>. <%= (month < 10 ? '0' + month : month) %></div>
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

<script>
    var year = <%= year %>; // JSP에서 받아온 년도
    var month = <%= month %>; // JSP에서 받아온 월

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
        monthYearElement.textContent = year + '. ' + (month < 10 ? '0' + month : month);
    }

    // 페이지 로드시에 초기 달력 생성
    window.onload = function () {
        generateCalendar(year, month);
    };
</script>
</body>
</html>

<%@ include file="../common/foot.jspf"%>
