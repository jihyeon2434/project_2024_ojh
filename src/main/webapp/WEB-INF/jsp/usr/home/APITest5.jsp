<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API TEST5"></c:set>

<%@ include file="../common/head.jspf"%>

<script>
	
	async function getData3() {
		const API_KEY = 'kZWNGpWj8Ik6lGY4vyOCXej0OGm7AsvLB9L697cwC%2FDtS9b18qZCKdLna5yW0RAnnDCP8eLHVBFiQAx3spiEzQ%3D%3D';
		const url = 'http://apis.data.go.kr/6300000/storyDaejeonService/storyDaejeonList?serviceKey=kZWNGpWj8Ik6lGY4vyOCXej0OGm7AsvLB9L697cwC%2FDtS9b18qZCKdLna5yW0RAnnDCP8eLHVBFiQAx3spiEzQ%3D%3D';
		const response = await fetch(url);
		const data = await response.json();
		console.log("data", data);
	}
	
	getData3();
	
	
	
	
</script>


<%@ include file="../common/foot.jspf"%>