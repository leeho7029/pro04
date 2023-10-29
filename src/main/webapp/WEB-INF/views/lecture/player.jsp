<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> 강의 플레이어 </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>
    <link rel="stylesheet" href="${path}/resources/css/vdo.css">
    <script>
        <c:if test="${not empty studyInfo}">
        $(document).ready(() => {
            alert("이전 시청 기록이 있습니다. 이전 시청 지점부터 재생됩니다.");
            video.currentTime = ${studyInfo.studyTime};
        });
        </c:if>

        $(window).bind("beforeunload", function(e) {
            // troubleshooting
            // 1) 문제 : 창이 닫히는 속도가 ajax 처리 속도보다 빨라서 데이터를 처리하지 못하는 상황이 발생
            // 2) 해결 : navigator.sendBeacon을 사용하여 해결
            // 3) 새로운 문제 : IE에서는 navigator.sendBeacon() 함수를 지원하지 않아서 동작하지 않음
            let data = new FormData;
            data.append("ccode", "${curriculum.ccode}");
            data.append("studyTime", current);
            data.append("completed", current == total);
            navigator.sendBeacon("${path}/lecture/closeLecture", data);
        });
    </script>
</head>
<body>
<div class="contents" id="contents">
    <div class="d-flex" style="background-color: #222; color: #fff">
        <div onclick="window.close()" class="pr-4 p-3 back">
            <i class="fa-solid fa-arrow-up-right-from-square"></i> 강의 대시보드
        </div>
        <div class="p-3"> ${curriculum.cname} </div>
    </div>
    <div class="player">
        <div class="vdo_fr">
            <video id="video" class="h-100" autoplay>
                <source src="${path}/resources/upload/curriculum/${curriculum.lcode}/${curriculum.cvideo}" type="video/mp4" />
            </video>
        </div>
        <div id="progress">
            <div id="progressBar"></div>
        </div>
        <div id="buttonbar" class="d-flex justify-content-between badge-light fixed-bottom p-2">
            <div class="d-flex ml-3">
                <button id="play" class="player_btn"><i class="fa-solid fa-play"></i></button>
                <button id="pause" class="player_btn"><i class="fa-solid fa-pause"></i></button>
                <button id="stop" class="ml-2 player_btn"><i class="fa-solid fa-stop"></i></button>
                <button id="backward" class="ml-2 player_btn"><i class="fa-solid fa-backward"></i></button>
                <button id="forward" class="ml-2 player_btn"><i class="fa-solid fa-forward"></i></button>
                <span id="currentTime" class="ml-3">00:00 / 00:00</span>
            </div>
            <div class="d-flex">
                <div class="form-group mb-0">
                    <input type="range" class="form-control-range" id="vol" value="500" min="0" max="1000"
                           style="margin-top: 7px;">
                </div>
                <button id="volWrap">
                    <i class='fa-solid fa-volume-high ml-3'></i> <span id="volTxt" class="ml-1">50%</span>
                </button>
                <button id="full" class="ml-3"><i class="fa-solid fa-expand"></i></button>
            </div>
        </div>
    </div>
    <script src="${path}/resources/js/vdo.js"></script>
</div>
</body>
</html>

