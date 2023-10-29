<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link rel="icon" href="${path}/resources/img/favicon.png" type="image/png"/>
    <title> 해법 </title>
    <jsp:include page="./layout/head.jsp" />
    <style>
        .reviewLectureName {
            background: linear-gradient(to top, #FFE400 40%, transparent 40%);
            display: inline-block;
            padding: 0px 10px 3px 10px;
            font-weight: 700;
        }
    </style>
</head>
<body>
<!-- Preloader -->
<div class="preloader d-flex align-items-center justify-content-center">
    <div class="lds-ellipsis">
        <div></div>
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>
<jsp:include page="./layout/header.jsp"/>

<jsp:include page="./layout/slidemenu.jsp"/>

<!-- ##### Hero Area Start ##### -->
<section class="hero-area">
    <div class="hero-slides owl-carousel">
        <!-- Single Hero Slide -->
        <div class="single-hero-slide d-flex align-items-center justify-content-center">
            <!-- Slide Img -->
            <div class="slide-img bg-img" style="background-image: url('${path}/resources/img/slideBanner01.jpg');"></div>
            <!-- Slide Content -->
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="hero-slides-content text-center">
                            <h6 data-animation="fadeInUp" data-delay="100ms"> 꿈을 이루는 학습의 열쇠 </h6>
                            <h2 data-animation="fadeInUp" data-delay="300ms"> <span>해법과 함께해요</span> 해법과 함께해요 </h2>
                            <a data-animation="fadeInUp" data-delay="500ms" href="${path}/lecture/list" class="btn oneMusic-btn mt-50"> 수강신청하기 <i class="fa fa-angle-double-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Single Hero Slide -->
        <div class="single-hero-slide d-flex align-items-center justify-content-center">
            <!-- Slide Img -->
            <div class="slide-img bg-img" style="background-image: url('${path}/resources/img/slideBanner02.jpg');"></div>
            <!-- Slide Content -->
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="hero-slides-content text-center">
                            <h6 data-animation="fadeInUp" data-delay="100ms"> 후회하지말고 지금부터 준비하자 </h6>
                            <h2 data-animation="fadeInUp" data-delay="300ms"> 2030 대비 선행학습반 <span> 2030 대비 선행학습반 </span></h2>
                            <a data-animation="fadeInUp" data-delay="500ms" href="${path}/lecture/list" class="btn oneMusic-btn mt-50"> 수강신청하기 <i class="fa fa-angle-double-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ##### Hero Area End ##### -->

<!-- ##### TodoList Area Start ##### -->
<c:if test="${not empty sid}">
<section class="latest-albums-area section-padding-100 bg-gray">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-12">
                <jsp:include page="./todo/todoList.jsp" />
            </div>
            <div class="col-lg-7 col-md-12 ml-lg-5 ml-md-0 mt-lg-0 mt-md-3">
                <table class="table table-hover text-center">
                    <thead>
                        <tr>
                            <td> 강의명 </td>
                            <td> 시작시간 </td>
                            <td> 강의실 </td>
                            <td> 비고 </td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="lecture" items="${myLectureList}">
                            <tr>
                                <td class="text-left align-middle"> ${lecture.lname} </td>
                                <c:if test="${lecture.state eq 'off'}">
                                    <td class="align-middle"> ${lecture.stime} </td>
                                    <td class="align-middle"> ${lecture.classroom} </td>
                                    <td><a href="${path}/lectureAttend/studentAttend?lcode=${lecture.lcode}" class="btn btn-primary">출석하기</a></td>
                                </c:if>
                                <c:if test="${lecture.state eq 'on'}">
                                    <td class="align-middle"> - </td>
                                    <td class="align-middle"> - </td>
                                    <td><a href="${path}/lecture/detail?lcode=${lecture.lcode}" class="btn btn-primary">강의 듣기</a></td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty myLectureList}">
                            <tr>
                                <td colspan="4"> 현재 수강 가능한 강의가 없습니다. </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
</c:if>
<!-- ##### TodoList Area End ##### -->

<!-- ##### Popular Lecture Area Start ##### -->
<section class="latest-albums-area section-padding-100" id="popular">
    <div class="container">
        <div class="section-heading style-2">
            <p> 수강생들이 추천하는 </p>
            <h2> 인기 강의 </h2>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="albums-slideshow owl-carousel">
                    <c:forEach var="lecture" items="${popularLectures}">
                        <div class="single-album">
                            <img src="${path}/resources/upload/lecture/${lecture.saveFile}" alt="${lecture.lname} 커버 이미지">
                            <div class="album-info">
                                <a href="${path}/lecture/detail?lcode=${lecture.lcode}">
                                    <h5>${lecture.lname}</h5>
                                </a>
                                <p>${lecture.tname} 선생님</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ##### Popular Lecture Area End ##### -->

<!-- ##### Offline Lecture Area Start ##### -->
<section class="latest-albums-area section-padding-100 mt-50 mb-50 bg-gray wow fadeInUp" id="offline">
    <div class="container">
        <div class="section-heading style-2">
            <p> 실시간 대면을 통한 최고의 학습 경험 </p>
            <h2> 오프라인 강의 </h2>
        </div>
        <div class="row">
            <c:forEach var="lecture" items="${offLectures}">
                <div class="col-4 text-center">
                    <a href="${path}/lecture/detail?lcode=${lecture.lcode}">
                        <img src="${path}/resources/upload/lecture/${lecture.saveFile}" alt="${lecture.lname} 커버 이미지">
                        <h5 class="mt-4 text-center">${lecture.lname}</h5>
                        <p class="text-center">${lecture.tname} 선생님</p>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- ##### Offline Lecture Area End ##### -->

<!-- ##### Online Lecture Area Start ##### -->
<section class="latest-albums-area section-padding-100 mt-50 mb-50 wow fadeInUp" id="online">
    <div class="container">
        <div class="section-heading style-2">
            <p> 언제 어디서든 해법과 함께 </p>
            <h2> 온라인 강의 </h2>
        </div>
        <div class="row">
            <c:forEach var="lecture" items="${onLectures}">
                <div class="col-4 text-center">
                    <img src="${path}/resources/upload/lecture/${lecture.saveFile}" alt="${lecture.lname} 커버 이미지">
                    <a href="${path}/lecture/detail?lcode=${lecture.lcode}">
                        <h5 class="mt-4 text-center">${lecture.lname}</h5>
                    </a>
                    <p class="text-center">${lecture.tname} 선생님</p>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- ##### Online Lecture Area End ##### -->

<!-- ##### Review Area Start ##### -->
<section class="latest-albums-area mt-50 bg-gray wow fadeInUp" style="padding: 150px 0px;" id="reviews">
    <div class="section-heading style-2">
        <p> 다른 수강생들이 들려주는 </p>
        <h2> 수강평 </h2>
    </div>
    <div id="carouselExampleIndicators" class="carousel slide container" data-ride="carousel">
        <ol class="carousel-indicators">
            <c:forEach var="idx" begin="1" end="${fn:length(reviews)}">
                <li class="carousel-list" data-target="#carouselExampleIndicators" data-slide-to="${idx}"></li>
            </c:forEach>
        </ol>
        <div class="carousel-inner">
            <c:forEach var="review" items="${reviews}">
                <div class="carousel-item">
                    <div class="container rounded border bg-white" style="padding: 50px 120px;">
                        <c:set var="random" value="<%= (int) (java.lang.Math.random() * 4) + 1 %>"/>
                        <div class="row">
                            <div class="col-2">
                                <img src="${path}/resources/img/user0${random}.jpg" alt="회원 이미지" class="rounded-circle">
                            </div>
                            <div class="col">
                                <h3 class="reviewLectureName"> ${review.lname} </h3>
                                <p class="text-dark"> ${review.content} </p>
                                <p> ${review.id} 님 </p>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <script>
                $(document).ready(() => {
                    $(".carousel-item:eq(0)").addClass("active");
                    $(".carousel-list:eq(0)").addClass("active");
                });
            </script>
        </div>
        <button class="carousel-control-prev border-0" style="background: none;" type="button" data-target="#carouselExampleIndicators" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </button>
        <button class="carousel-control-next border-0" style="background: none;" type="button" data-target="#carouselExampleIndicators" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </button>
    </div>
    <c:if test="${empty reviews}">
        <p class="text-center"> 등록된 수강평이 없습니다. </p>
    </c:if>
</section>
<!-- ##### Review Area End ##### -->

<!-- ##### Location Area Start ##### -->
<section class="latest-albums-area mb-100 wow fadeInUp" id="location">
    <div class="content">
        <div class="text-center">
            <div id="map" style="margin: 0px auto; width: 100%; height: 600px; background: white;"></div>
        </div>
        <div class="container">
            <h3 class="mt-50"> 해법 Haebeop </h3>
            <div class="row mt-30">
                <div class="col-2">
                    <h5> 오시는 길 </h5>
                </div>
                <div class="col">
                    <h5> 서울시 금천구 디지털로 9길 23 </h5>
                    <p class="mb-0"> 지하철 &nbsp; 1호선 7호선 가산디지털단지역 </p>
                    <p> 버스 &nbsp; 가산로데오거리, 한신IT타워, 이앤씨드림타워7차 정류장 하차 </p>
                </div>
            </div>
            <div class="row mt-15">
                <div class="col-2">
                    <h5> 상담운영 </h5>
                </div>
                <div class="col">
                    <h5> 02-1234-5678 </h5>
                    <p> 방문시 사전 전화예약 부탁드립니다. </p>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=${naverMapKey}"></script>
    <script>
        let mapOptions = {
            center: new naver.maps.LatLng(37.4786713,126.8864968),
            zoom: 17,
            draggable: false,
            keyboardShortcuts: false,
            logoControl: false,
            mapDataControlOptions: false,
            scrollWheel: false
        };

        let map = new naver.maps.Map('map', mapOptions);

        let marker = new naver.maps.Marker({
            position: new naver.maps.LatLng(37.4786713,126.8864968),
            map: map
        });
    </script>
</section>
<!-- ##### Location Area Start ##### -->

<!-- ##### Banner Area Start ##### -->
<section class="mt-100 pt-5">
    <img src="${path}/resources/img/mainBanner.jpg" alt="메인페이지 하단 배너" style="width: 100%; height: auto;">
</section>

<!-- ##### Chat ##### -->
<script type="text/javascript">
    var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
    (function(){
        var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
        s1.async=true;
        s1.src='https://embed.tawk.to/6538c67ef2439e1631e82d27/1hdisent5';
        s1.charset='UTF-8';
        s1.setAttribute('crossorigin','*');
        s0.parentNode.insertBefore(s1,s0);
    })();
</script>

<jsp:include page="./layout/footer.jsp"/>
</body>
</html>
