<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>출석 체크</title>
    <jsp:include page="../layout/head.jsp"/>
    <style>
        .popup-wrapper {
            position: fixed;
            z-index: 100;
            top: 50%;
            margin-top: -250px;
            left: 50%;
            margin-left: -250px;
        }
        .popup {
            position: relative;
            background-image: url("${path}/resources/img/attendPoint.png");
            background-size: cover;
            border-radius: 20px;
            box-shadow: 5px 5px 10px #555;
            padding: 20px;
            text-align: center;
            width: 500px;
            height: 500px;
        }
        .close-btn {
            position: absolute;
            background-color: transparent;
            border: none;
            right: 20px;
            top: 20px;
        }
        .info {
            margin-top: 140px;
        }
        .point {
            line-height: 100px;
            font-family: "Roboto", sans-serif;
            color: #007cf0;
            font-weight: bold;
        }
    </style>
</head>
<body>
<!-- 헤더 시작 -->
<jsp:include page="../layout/header.jsp"/>
<!-- 헤더 끝 -->
<!-- 브레드크럼 시작 -->
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url('${path}/resources/img/breadcrumb.jpg');">
    <div class="bradcumbContent">
        <p>포인트 적립해요</p>
        <h2>출석 체크</h2>
    </div>
</section>
<!-- 브레드크럼 끝 -->
<section class="album-catagory section-padding-100-0">
    <div class="container">
        <div class="col-md-7" style="margin: 0 auto">
            <div class="container text-center">
                <h2 class="mb-15" style="font-family:'Roboto', sans-serif; font-weight: bold"> ${calendarInfo.month}월 출석 <i class="fa-regular fa-calendar"></i> </h2>
                <h5 class="mb-50" style="color: #1c8137;font-weight: bold;"> 출석체크하고 포인트 받자 <i class="fa-solid fa-face-laugh-squint fa-bounce"></i> </h5>
                <c:forEach var="i" begin="0" end="5">
                    <div class="d-flex">
                        <c:forEach var="j" begin="0" end="6">
                            <c:set var="date" value="${(7 * i + j) - (calendarInfo.startDayOfWeek - 1)}"></c:set>
                            <c:if test="${date < 1 or date > calendarInfo.endDay}">
                                <div class="column m-1 rounded-lg" style="height: 80px;"></div>
                            </c:if>
                            <c:if test="${date > 0 and date <= calendarInfo.endDay and !fn:contains(list, ' '+=date+=' ')}">
                                <div class="column m-1 rounded-lg" style="height: 75px; background-color: #DDD; width: 75px; border-radius: 7px;">
                                    <h5> ${date} </h5>
                                </div>
                            </c:if>
                            <c:if test="${date > 0 and date <= calendarInfo.endDay and fn:contains(list, ' '+=date+=' ')}">
                                <div class="column m-1 rounded-lg" style="height: 75px; background-color: #94cf92; width: 75px; border-radius: 7px;">
                                    <h5> ${date} </h5>
                                    <i class="fa-solid fa-heart fa-fade fa-2xl"></i>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </c:forEach>

                <!-- 오늘 이미 출석체크를 했다면 버튼 비활성화 -->
                <div class="has-text-centered">
                    <c:if test="${attendChk}">
                        <button type="button" class="btn btn-dark mb-100" style="width: 150px;" disabled> 출석체크 완료 </button>
                    </c:if>
                    <!-- 오늘 출석체크를 하지 않았다면 버튼 활성화 -->
                    <c:if test="${!attendChk}">
                        <a href="${path}/attendance/addAttend"  class="btn btn-dark mb-100" style="width: 150px;"> 출석체크 </a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 적립된 포인트 팝업창 -->
<c:if test="${!empty point}">
    <div class="popup-wrapper">
        <div class="popup">
            <button class="close-btn" onclick="closePopup()"><i class="fa-solid fa-x" style="color: white"></i></button>
            <h1 class="info"> 출석체크하고 </h1>
            <h2 class="point">  </h2>
            <h1> 받았어요! </h1>
        </div>
    </div>
    <script>
        $(document).ready(() => {
            let beforeNum, ranNum = 0;
            let startRandom = setInterval(() => {
                let beforeNum = ranNum;
                while(true) {
                    if(beforeNum != ranNum) {
                        break;
                    }
                    ranNum = Math.floor(Math.random()*100+10);
                }
                $(".point").text(ranNum + ' point');
            }, 50);

            setTimeout(() => {
                clearInterval(startRandom);
                $(".point").text(`${point} point`);
            }, 1500);
        });

        function closePopup() {
            $(".popup-wrapper").css("display","none");
        }
    </script>
</c:if>
<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
</body>
</html>
