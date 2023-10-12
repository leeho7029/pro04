<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title> 커뮤니티 </title>
    <jsp:include page="../setting/head.jsp" />
    <script type="text/javascript" src="${path}/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" />

<br>
<section id="breadcrumbs" class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2>커뮤니티</h2>
            <ol>
                <li><a href="${path}">Home</a></li>
                <li>커뮤니티</li>
            </ol>
        </div>
    </div>
</section><!-- End Breadcrumbs -->

<section class="section">
    <form action="${path}/community/edit.do" method="post" class="container">
        <div class="row mb-3">
            <label for="cate" class="col-md-2 col-form-label">카테고리</label>
            <div class="col-md-4">
                <select name="cate" id="cate" class="form-select">
                    <c:forEach var="category" items="${categories}">
                        <c:choose>
                            <c:when test="${detail.cateName eq category.cateName}">
                                <option value="${category.cate}" selected>${category.cateName}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${category.cate}">${category.cateName}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </div>
            <label for="title" class="col-md-2 col-form-label">제목</label>
            <div class="col-md-4">
                <input type="text" id="title" name="title" class="form-control" value="${detail.title}">
            </div>
        </div>
        <div class="mb-3">
            <label for="content" class="form-label">내용</label>
            <textarea name="content" id="content" class="form-control" placeholder="내용 입력" rows="8" cols="100" maxlength="1400" required>${detail.content}</textarea>
            <script>
                CKEDITOR.replace('content', { filebrowserUploadUrl: '${path}/community/imageUpload.do' });
            </script>
        </div>
        <div class="mb-3">
            <input type="hidden" name="cno" id="cno" value="${detail.cno}">
            <input type="submit" class="btn btn-primary btn-block" value="등록하기">
        </div>
    </form>
</section>
<br><br>
<%@ include file="../layout/footer.jsp"%>

<form action="#">
    <input type="hidden" id="cno" name="cno" value="${detail.cno}">
    <button id="toTop" title="Go to top">
        <i class="fas fa-angle-up"></i>
    </button>
</form>

<!-- jQuery -->
<script src="${path}/resources/plugins/jQuery/jquery.min.js"></script>
<!-- slick slider -->
<script src="${path}/resources/plugins/slick/slick.min.js"></script>
<!-- filter -->
<script src="${path}/resources/plugins/shuffle/shuffle.min.js"></script>

<!-- Main Script -->
<script src="${path}/resources/js/script.js"></script>
</body>
</html>
