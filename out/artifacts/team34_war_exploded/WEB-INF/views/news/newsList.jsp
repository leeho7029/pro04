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
    <title>교육 뉴스</title>
    <jsp:include page="../layout/head.jsp"/>
    <style>

    </style>
</head>
<body>
<!-- 헤더 시작 -->
<jsp:include page="../layout/header.jsp"/>
<!-- 헤더 끝 -->
<!-- 브레드크럼 시작 -->
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url('${path}/resources/img/breadcrumb.jpg');">
    <div class="bradcumbContent">
        <p>교육 분야의 최신 소식을 빠르게 확인해요</p>
        <h2>교육뉴스</h2>
    </div>
</section>
<!-- 브레드크럼 끝 -->
<div class="blog-area section-padding-100">
    <div class="container">
        <div class="col-lg-9" style="margin: 0 auto">
            <c:forEach var="url" items="${urls}" varStatus="status">
                <!-- Single Post Start -->
                <div class="single-blog-post mb-15 wow fadeInUp" data-wow-delay="100ms">
                    <!-- Blog Content -->
                    <div class="blog-content">
                        <!-- 게시 시간 -->
                        <div class="post-date">
                            <span>${regdates[status.index]}</span>
                        </div>
                        <!-- Post Title -->
                        <a href="${url}" class="post-title">${titles[status.index]}</a>
                        <!-- Post Meta -->
                        <div class="post-meta d-flex mb-30">
                            <p class="post-author">By<a href="#">${writers[status.index]}</a></p>
                        </div>
                        <!-- Post Excerpt -->
                        <p>${contents[status.index]}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
</body>
</html>
