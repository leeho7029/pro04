<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path2" value="<%=request.getContextPath() %>"/>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>

<style>
    .swiper {
        z-index: 2;
    }

    .text-overlay {
        position: absolute;
        top: 50%; /* 원하는 높이 조절 */
        left: 50%; /* 원하는 좌표 조절 */
        transform: translate(-50%, -50%);
        background: rgba(0, 0, 0, 0.7); /* 배경 색상 설정 (투명도 조절 가능) */
        color: gold; /* 텍스트 색상 설정 */
        padding: 10px 20px; /* 텍스트의 내부 여백 설정 */
        border-radius: 5px; /* 텍스트 박스의 둥근 모서리 설정 */
        font-size: 40px;
        font-weight: bold;
    }
</style>

<!-- Swiper -->
<div class="swiper mySwiper">
    <div class="swiper-wrapper">
        <div class="swiper-slide">
            <a href="${path2}/fileboard/list.do" style="position: relative; display: inline-block;">
                <img src="${path2}/resources/img/slide/camera.jpg" alt="메인페이지 배너3" style="width: 100vw; height: 50vW">
                <div class="text-overlay">
                    <p>최고의 교육, 최고의 시스템</p>
                </div>
            </a>
        </div>
        <div class="swiper-slide">
            <a href="${path2}/fileboard/list.do" style="position: relative; display: inline-block;">
                <img src="${path2}/resources/img/slide/classroom.jpg" alt="메인페이지 배너3" style="width: 100vw; height: 50vW">
                <div class="text-overlay">
                    <p>넓은 강의실, 쾌적한 환경</p>
                </div>
            </a>
        </div>
        <div class="swiper-slide">
            <a href="${path2}/fileboard/list.do" style="position: relative; display: inline-block;">
                <img src="${path2}/resources/img/slide/hallway.jpg" alt="메인페이지 배너3" style="width: 100vw; height: 50vW">
                <div class="text-overlay">
                    <p>24시간 상담가능</p>
                </div>
            </a>
        </div>

    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-pagination"></div>
</div>

<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

<!-- Initialize Swiper -->
<script>
    var swiper = new Swiper(".mySwiper", {
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: {
            delay: 2500,
            disableOnInteraction: false,
        },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });
</script>