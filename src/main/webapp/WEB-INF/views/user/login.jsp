<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <script src="assets/js/main.js"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Custom Theme files -->
    <link href="${path}/resources/css/join.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //Custom Theme files -->
    <!-- web font -->
    <link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <jsp:include page="../setting/head.jsp"/>
</head>

<body>
<jsp:include page="../layout/header.jsp"/>
<!-- 헤더 영역 시작 -->

<!-- 헤더 영역 끝 -->

<!-- 배너 영역 시작 -->
<br>
<section id="breadcrumbs" class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2>로그인</h2>
            <ol>
                <li><a href="${path}">Home</a></li>
                <li>로그인</li>
            </ol>
        </div>
    </div>
</section><!-- End Breadcrumbs -->
<br>
<div class="main-w3layouts wrapper">
    <h1>로그인</h1>
    <div class="main-agileinfo">
        <div class="agileits-top">
            <form action="${path}/user/login.do" method="post">
                <input type="text" name="id" id="id" class="form-control" placeholder="아이디 입력">
                <input type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호 입력">

                <div class="wthree-text">
                    <label class="anim">
                        <input type="checkbox" class="checkbox" name="saveId" value="save" ${checked}>
                        <span>아이디 기억하기</span>
                    </label>
                    <div class="clear"> </div>
                </div>
                <input type="submit" value="로그인">
            </form>
            <p>아이디가 없으신가요? <a href="${path}/user/term.do"> 가입하기 </a></p>
        </div>
    </div>
    <!-- //copyright -->
    <ul class="colorlib-bubbles">
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>
<jsp:include page="../layout/footer.jsp"/>
</body>
</html>
