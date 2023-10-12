<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자료 상세보기</title>
    <jsp:include page="../setting/head.jsp"></jsp:include>
</head>
<body>

<!-- 헤더 영역 시작 -->
<%@ include file="../layout/header.jsp"%>
<%--<jsp:include page="../layout/header.jsp"/>--%>
<!-- 헤더 영역 끝 -->

<!-- 배너 영역 시작 -->
<br>
<section id="breadcrumbs" class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2>자료실</h2>
            <ol>
                <li><a href="${path}">Home</a></li>
                <li>자료실</li>
            </ol>
        </div>
    </div>
</section><!-- End Breadcrumbs -->
<!-- 배너 영역 끝 -->

<!-- 공지사항 글 상세보기 시작-->
<div class="container mt-5">
    <!-- 내용 부분 -->
    <table class="table">
        <thead>
        <tr>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${fileboard.title}</td>
            <td>${fileboard.id}</td>
            <td>${fileboard.regdate}</td>
        </tr>
        <tr>
            <td colspan="3">
                <div style="min-height: 300px;">
                    ${fileboard.content}
                </div>
            </td>
        </tr>
        <tr>
            <th colspan="3">학습자료 (클릭하여 다운로드)</th>
        </tr>
        <tr>
            <td colspan="3">
                <c:forEach var="item" items="${fileboard2}">
                    <a href="${pageContext.request.contextPath}/resources/upload/${item.saveFolder}/${item.saveFile}" download="${item.originFile}" class="btn btn-secondary m-2">
                        <i class="fa-solid fa-file"></i> ${item.originFile}
                    </a>
                </c:forEach>
            </td>
        </tr>
        </tbody>
    </table>

    <!-- 버튼 그룹부분 -->
    <div class="buttons text-right mt-4">
        <a class="btn btn-primary" href="${path}/fileboard/list.do">목록</a>
        <c:if test='${sid eq "admin"}'>
            <a class="btn btn-warning" href="${path}/fileboard/edit.do?articleno=${fileboard.articleno}">수정</a>
            <a class="btn btn-danger" href="${path}/fileboard/delete.do?articleno=${fileboard.articleno}">삭제</a>
        </c:if>
    </div>
</div>

<!-- 공지사항 글 상세보기 끝 -->

<!-- 푸터 영영 시작 -->
<br><br>
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 영역 끝 -->

<form action="#">
    <input type="hidden" id="articleno" name="articleno" value="${fileboard.articleno}">
    <button id="toTop" title="Go to top">
        <i class="fas fa-angle-up"></i>
    </button>
</form>

</body>
</html>