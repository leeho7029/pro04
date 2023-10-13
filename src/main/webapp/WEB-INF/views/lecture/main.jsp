<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <jsp:include page="../setting/head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<br>
<section id="breadcrumbs" class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2>강의</h2>
            <ol>
                <li><a href="${path}">Home</a></li>
                <li>강의</li>
            </ol>
        </div>
    </div>
</section><!-- End Breadcrumbs -->



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
            <section id="math" class="content-section">
                <div class="section-heading">
                    <h1>나의 강의</h1>
                    <table class="table">
                        <thead>
                        <tr>
                            <th width="200">수강중인 강의</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><a href=""
                                       style="color: #000000;">영어</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <section class="info-tiles">
                    <div class="row">
                        <div class="col-md-6">
                            <h2>이주의 강의</h2>
                            <table class="table" id="notice-table">
                                <thead>
                                <tr>
                                    <th width="200">제목</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${noticeList}" var="notice" varStatus="status">
                                    <tr>
                                        <td><a href="${path}/notice/detail.do?seq=${notice.seq}"
                                               style="color: #000000;">${notice.title}</a></td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty noticeList}">
                                    <tr>
                                        <td colspan="5" class="has-text-centered"> 등록된 자료가 없습니다.</td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-md-6">
                            <h2>이주의 강사</h2>
                            <table class="table" id="fileboard-table">
                                <thead>
                                <tr>
                                    <th width="200">제목</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${fileboardList}" var="fileboard" varStatus="status">
                                    <tr>
                                        <td><a href="${path}/fileboard/detail.do?articleno=${fileboard.articleno}"
                                               style="color: #000000;">${fileboard.title}</a></td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty fileboardList}">
                                    <tr>
                                        <td colspan="5" class="has-text-centered"> 등록된 자료가 없습니다.</td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </section>
            </section>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp"/>
</body>
</html>
