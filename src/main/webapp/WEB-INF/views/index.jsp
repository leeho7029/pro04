<%@ page contentType="text/html;" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>725</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <jsp:include page="setting/head.jsp"/>
</head>

<body>

<!-- ======= Header ======= -->
<jsp:include page="layout/header.jsp"/>

<!-- ======= Hero Section ======= -->
<jsp:include page="./main/slideBanner.jsp"/>

<main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
        <div class="container">
            <div class="row content">
                <div class="col-lg-6">
                    <h2>"어제보다 나은 내일을 함께 만들어가는 곳"</h2> <br>
                    <h2>"수많은 지식과 경험, 열정이 꽃피는 곳"</h2>
                </div>
                <div class="col-lg-6 pt-4 pt-lg-0">
                    <p>
                        "저희 온라인 강의 사이트는 교육에 대한 새로운 관점을 제시하며, 지식을 확장하고 경험을 공유하는 플랫폼입니다.

                        우리의 열정적인 교수진과 학습자 커뮤니티는 지속적인 성장과 배움의 즐거움을 경험하도록 도와줍니다.

                        최신 교육 기술을 활용하여 효율적이고 유익한 학습 경험을 제공하며, 모든 학습자가 미래를 위해 잘 준비될 수 있도록 돕습니다."
                    </p>
                    <ul>
                        <li><i class="ri-check-double-line"></i> 세상의 변화에 대응하는 학습 경험 제공</li>
                        <li><i class="ri-check-double-line"></i> 지식의 확장과 공유를 통한 역량 강화</li>
                        <li><i class="ri-check-double-line"></i> 강의에 집중할 수 있는 최적의 환경 제공</li>
                    </ul>
                    <p class="fst-italic">
                        무엇을 배울 것인가를 선택하고 어떤 환경에서 배울 것인가를 고민해보세요.
                    </p>
                </div>
            </div>
        </div>
    </section><!-- End About Section -->

    <!-- ======= Clients Section ======= -->
    <section id="clients" class="clients section-bg">
        <div class="container">

            <div class="row">

                <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
                    <img src="assets/img/clients/client-1.png" class="img-fluid" alt="">
                </div>

                <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
                    <img src="assets/img/clients/client-2.png" class="img-fluid" alt="">
                </div>

                <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
                    <img src="assets/img/clients/client-3.png" class="img-fluid" alt="">
                </div>

                <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
                    <img src="assets/img/clients/client-4.png" class="img-fluid" alt="">
                </div>

                <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
                    <img src="assets/img/clients/client-5.png" class="img-fluid" alt="">
                </div>

                <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
                    <img src="assets/img/clients/client-6.png" class="img-fluid" alt="">
                </div>

            </div>

        </div>
    </section><!-- End Clients Section -->

    <!-- ======= Services Section ======= -->
    <section id="services" class="services">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="icon-box">
                        <i class="bi bi-briefcase"></i>
                        <h4><a href="#">맞춤형 교재</a></h4>
                        <p>강사가 직접 만든 맞춤형 교재</p>
                    </div>
                </div>
                <div class="col-md-6 mt-4 mt-md-0">
                    <div class="icon-box">
                        <i class="bi bi-card-checklist"></i>
                        <h4><a href="#">단계별 학습목표</a></h4>
                        <p>학생에 맞춘 단계별 학습목표를 설정</p>
                    </div>
                </div>
                <div class="col-md-6 mt-4 mt-md-0">
                    <div class="icon-box">
                        <i class="bi bi-bar-chart"></i>
                        <h4><a href="#">눈에 띄는 성적 향상</a></h4>
                        <p>매주 시험으로 성적을 확인합니다</p>
                    </div>
                </div>
                <div class="col-md-6 mt-4 mt-md-0">
                    <div class="icon-box">
                        <i class="bi bi-binoculars"></i>
                        <h4><a href="#">학생에게 집중</a></h4>
                        <p>언제나 학생들을 지켜보고 관리합니다</p>
                    </div>
                </div>
                <div class="col-md-6 mt-4 mt-md-0">
                    <div class="icon-box">
                        <i class="bi bi-brightness-high"></i>
                        <h4><a href="#">24시간 운영</a></h4>
                        <p>언제든지 이용가능하도록 운영중입니다.</p>
                    </div>
                </div>
                <div class="col-md-6 mt-4 mt-md-0">
                    <div class="icon-box">
                        <i class="bi bi-calendar4-week"></i>
                        <h4><a href="#">학습 스케줄관리</a></h4>
                        <p>개개인의 학습 스케줄을 관리해줍니다.</p>
                    </div>
                </div>
            </div>

        </div>
    </section><!-- End Services Section -->

    <!-- ======= Portfolio Section ======= -->

</main><!-- End #main -->

<!-- ======= Footer ======= -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>


<jsp:include page="layout/footer.jsp"/>
</body>

</html>