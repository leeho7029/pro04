<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> 이벤트 관리 </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>
    <!-- 관리자 페이지 스타일 적용 -->
    <link href="${path}/resources/css/sb-admin-2.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <style>
        table th {
            border-bottom: 1px solid;
        }
    </style>
</head>
<body>
<section class="album-catagory">
    <div id="wrapper">
        <jsp:include page="../layout/adminSidebar.jsp" />
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <ul class="navbar-nav ml-auto">
                        <div class="topbar-divider d-none d-sm-block"></div>

                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"> 안녕하세요, 관리자님 </span>
                                <img class="img-profile rounded-circle"
                                     src="${path}/resources/img/adminProfile.svg">
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="container-fluid" style="padding: 100px">
                    <div class="col-12 mb-5">
                        <div class="card w-100" style="border: 1px solid">
                            <div class="card-body">
                                <div class="table-responsive project-list">
                                    <%--이벤트 목록--%>
                                    <table class="table project-table table-centered table-nowrap" id="event-table">
                                        <thead>
                                        <tr>
                                            <th class="text-center" style="border-bottom: 1px solid;" width="5%">#</th>
                                            <th class="text-center" style="border-bottom: 1px solid;">제목</th>
                                            <th class="text-center" style="border-bottom: 1px solid;" width="10%">이벤트상태</th>
                                            <th class="text-center" style="border-bottom: 1px solid;" width="10%">작성일</th>
                                            <th class="text-center" style="border-bottom: 1px solid;" width="10%">당첨</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${eventList }" var="event" varStatus="status">
                                            <tr class="table-hover">
                                                <th class="text-center" style="vertical-align: middle;">${event.eno }</th>
                                                <th style="vertical-align: middle;"><a href="${path}/event/detail?eno=${event.eno}&page=${curPage}" style="color: #000000; text-decoration: none;">${event.title }</a></th>
                                                <c:if test='${event.status eq "1"}'>
                                                    <th class="text-center" style="vertical-align: middle;"><span class="ba badge-pill badge-success p-2">진행 중</span></th>
                                                </c:if>
                                                <c:if test='${event.status eq "0"}'>
                                                    <th class="text-center" style="vertical-align: middle;"><span class="ba badge-pill badge-danger p-2">종료</span></th>
                                                </c:if>
                                                <th class="text-center" style="vertical-align: middle;">
                                                    <fmt:parseDate value="${event.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                                    <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                                                </th>
                                                <th class="text-center" style="vertical-align: middle;">
                                                    <div class="btn-group" style="align-items: center">
                                                        <a class="btn btn-dark" href="${path}/admin/applyList?eno=${event.eno}">참여자 확인</a>
                                                    </div>
                                                </th>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${empty eventList}">
                                            <tr>
                                                <td colspan="6" class="has-text-centered"> 작성된 이벤트가 없습니다. </td>
                                            </tr>
                                        </c:if>
                                        </tbody>
                                    </table>
                                    <!-- 페이지 시작 -->
                                    <div class="oneMusic-pagination-area wow">
                                        <ul class="pagination justify-content-center mb-0">
                                            <c:if test="${curPage > 5}">
                                                <li class="page-item">
                                                    <a href="${path}/admin/eventMgmt?page=${page.blockStartNum - 1}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                                       class="page-item"><i class="fa-solid fa-arrow-left"></i></a>
                                                </li>
                                            </c:if>
                                            <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                                <c:choose>
                                                    <c:when test="${i == curPage}">
                                                        <li class="page-item active">
                                                            <a href="${path}/admin/eventMgmt?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                                               class="page-link" aria-label="Page ${i}"
                                                               aria-current="page">${i}</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li  class="page-item">
                                                            <a href="${path}/admin/eventMgmt?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                                               class="page-link" aria-label="Page ${i}" aria-current="page">${i}</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                            <c:if test="${page.blockLastNum < page.totalPageCount}">
                                                <li class="page-item">
                                                    <a href="${path}/admin/eventMgmt?page=${page.blockLastNum + 1}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                                       class="page-link"><i class="fa-solid fa-arrow-right"></i></a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </div>
                                    <!-- 페이지 끝 -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="../layout/footer.jsp"/>
</body>
</html>