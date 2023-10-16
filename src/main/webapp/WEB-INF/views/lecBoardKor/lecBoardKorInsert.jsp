<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <title>국어게시판 글쓰기</title>
    <jsp:include page="../setting/head.jsp"></jsp:include>
</head>
<body>

<!-- 헤더 영역 시작 -->
<jsp:include page="../layout/header.jsp"/>
<!-- 헤더 영역 끝 -->

<!-- 배너 영역 시작 -->
<br>
<section id="breadcrumbs" class="breadcrumbs">
    <div class="container" style="width: 80%">

        <div class="d-flex justify-content-between align-items-center">
            <h2>국어게시판  추가하기</h2>
            <ol>
                <li><a href="${path}">Home</a></li>
                <li>공지사항</li>
            </ol>
        </div>
    </div>
</section>
<!-- 배너 영역 끝 -->


<!-- 공지사항 글쓰기 시작 -->
<div class="container mt-5">
    <div class="row">
        <div class="col-md-3">
            <aside class="menu is-hidden-mobile">
                <ul class="list-group" style="text-align: center; height: 400px; color: orange; font-weight: bold;">
                    <li class="list-group-item " style="background-color: black; color: white">모든강좌</li>
                    <li class="list-group-item "><a href="${path}/lecture/home">메인</a></li>
                    <li class="list-group-item"><a href="${path}/lecture/korean">국어</a></li>
                    <li class="list-group-item"><a href="${path}/lecture/english">영어</a></li>
                    <li class="list-group-item"><a href="${path}/lecture/math">수학</a></li>
                </ul>
            </aside>
        </div>
        <div class="col-md-9">
            <div class="container">
                <form action="${path }/lecBoardKor/insert.do" method="post">
                    <div class="mb-3">
                        <label class="form-label" for="title">제목</label>
                        <input class="form-control" type="text" name="title" id="title">
                    </div>
                    <div class="mb-3">
                        <label for="content" class="form-label">내용 입력</label>
                        <textarea class="form-control" name="content" id="content" rows="3"></textarea>
                    </div>
                    <div class="col-auto">
                        <a class="button" href="${path }/notice/list.do">목록으로</a>
                        <%--                        <c:if test='${sid eq "admin"}'>--%>
                        <input type="submit" class="link-primary" value="글 등록">
                        <%--                        </c:if>--%>
                    </div>
                </form>
            </div>
    </div>
</div>
<!-- 공지사항 글 상세보기 끝 -->
<br><br>
<!-- 푸터 영영 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 영역 끝 -->

</body>
</html>