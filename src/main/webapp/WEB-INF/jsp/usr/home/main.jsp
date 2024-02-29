<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>

<!-- 테일윈드 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" />

<!-- 컨설팅/셀프 메인이미지 -->
<div class="flex mt-10 justify-center items-center space-x-40 relative">
	<div class="relative">
		<!-- 첫 번째 이미지 -->
		<img src="//chahong.com/web/product/big/202312/b53d9968c9e75b28da2c2052b3219019.jpg" width="350px" height="350px"
			alt="차홍" class="BigImage">
		<!-- 회색 네모 박스 -->
		<div class="absolute bg-gray-400 opacity-30 pl-3" style="width: 350px; height: 137px; bottom: 0;">
			<div class="flex items-center justify-between">
    <!-- 텍스트 -->
    <div class="text-white text-left text-2xl font-bold">ONLINE</div>
    <div class="text-white text-right text-2xl font-bold mr-3">→</div>
</div>

			<div class="text-white text-left text-2xl font-bold">CONSULTING</div>
<div class="text-white text-left text-sm mt-2">단 시간에 당신의 이미지가 돋보이도록 도와주는</div>
			<div class="text-white text-left text-sm">간편 온라인 이미지 컨설팅 서비스</div>
		</div>
	</div>
	<div class="relative">
		<!-- 두 번째 이미지 -->
		<img src="//chahong.com/web/product/big/202312/b53d9968c9e75b28da2c2052b3219019.jpg" width="350px" height="350px"
			alt="차홍" class="BigImage">
		<!-- 회색 네모 박스 -->
		<div class="absolute bg-gray-400 opacity-30 pl-3" style="width: 350px; height: 137px; bottom: 0;">
			<div class="flex items-center justify-between">
    <!-- 텍스트 -->
    <div class="text-white text-left text-2xl font-bold">SELF IMAGE</div>
    <div class="text-white text-right text-2xl font-bold mr-3">→</div>
</div>

			<div class="text-white text-left text-2xl font-bold">MAKE</div>
<div class="text-white text-left text-sm mt-2">고객 니즈 맞춤 헤어, 옷 , 메이크업</div>
			<div class="text-white text-left text-sm">정보 제공 서비스</div>
		</div>
	</div>
</div>
</div>


<!-- 보그 최신뉴스 -->
<div class="m-32 mt-10 flex flex-wrap justify-center items-center space-x-40">
	<div class="w-full mb-8 text-center text-3xl font-bold font-serif">LATEST IN TRENDS</div>
	<div class="flex justify-center items-center space-x-8">
		<img src="https://img.vogue.co.kr/vogue/2024/02/style_65dd82f42ef76-960x1440.jpg?x=1600&amp;y=2400" alt=""
			data-src="https://img.vogue.co.kr/vogue/2024/02/style_65dd82f42ef76-960x1440.jpg?x=1600&amp;y=2400" decoding="async"
			class="lazyloaded" width="150px" height="150px"> <img
			src="https://img.vogue.co.kr/vogue/2024/02/style_65dd82f42ef76-960x1440.jpg?x=1600&amp;y=2400" alt=""
			data-src="https://img.vogue.co.kr/vogue/2024/02/style_65dd82f42ef76-960x1440.jpg?x=1600&amp;y=2400" decoding="async"
			class="lazyloaded" width="150px" height="150px"> <img
			src="https://img.vogue.co.kr/vogue/2024/02/style_65dd82f42ef76-960x1440.jpg?x=1600&amp;y=2400" alt=""
			data-src="https://img.vogue.co.kr/vogue/2024/02/style_65dd82f42ef76-960x1440.jpg?x=1600&amp;y=2400" decoding="async"
			class="lazyloaded" width="150px" height="150px">
	</div>

	<div class="mobile-footer-wrap" id="mobile-footer-wrap">
		<div class="mobile-footer-close">
			<a><img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="close"
				onclick="footerBnHide('click');" data-src="//img.vogue.co.kr/vogue/ad/btn-close-w.png" decoding="async"
				class="lazyload">
				<noscript>
					<img src="//img.vogue.co.kr/vogue/ad/btn-close-w.png" alt="close" onclick="footerBnHide('click');" data-eio="l">
				</noscript></a>
		</div>

		<div class="banner_area" id="mobile-special" style="display: none;"></div>
		<div class="banner_area" id="mobile-special-3rd" style="display: none;"></div>
	</div>
</div>

<%@ include file="../common/foot.jspf"%>