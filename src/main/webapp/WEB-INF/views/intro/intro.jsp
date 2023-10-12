<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <jsp:include page="../setting/head.jsp"/>
</head>

<body>
<jsp:include page="../layout/header.jsp"/>
<br>
<section id="breadcrumbs" class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2>학원소개</h2>
            <ol>
                <li><a href="${path}">Home</a></li>
                <li>학원소개</li>
            </ol>
        </div>
    </div>
</section><!-- End Breadcrumbs -->
<div class="container">
    <br><br>
    <div class="navbar navbar-expand-lg navbar-light bg-dark">
        <div class="container">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#company">소개</a>
                </li>
                <li class="nav-item">
                    <a class a="nav-link" href="#location">회사 위치</a>
                </li>
            </ul>
        </div>
    </div>
</div>
    <div class="main-content" style="padding-top: 0;">


        <!-- section1(소개) 영역 시작 -->
        <jsp:include page="./section1.jsp"></jsp:include>
        <!-- section1(소개) 영역 끝 -->

        <!-- section6(회사 위치) 영역 시작 -->
        <jsp:include page="./section2.jsp"></jsp:include>
        <!-- section6(회사 위치) 영역 시작 -->
    </div>

</div>

<jsp:include page="../layout/footer.jsp"/>
</body>
</html>
