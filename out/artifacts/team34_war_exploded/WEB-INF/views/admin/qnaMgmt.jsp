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
    <title> 고객지원관리 </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>
    <!-- 관리자 페이지 스타일 적용 -->
    <link href="${path}/resources/css/sb-admin-2.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
</head>
<body>
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
                <table class="table table-hover text-center">
                    <thead>
                    <tr>
                        <th width="100"> # </th>
                        <th> 제목 </th>
                        <th width="180"> 작성자 </th>
                        <th width="210"> 작성일 </th>
                        <th width="100"> 비고 </th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="question" items="${noAnswerList}">
                        <tr>
                            <td class="align-middle"> ${question.qno} </td>
                            <td class="align-middle"> ${question.title} </td>
                            <td class="align-middle"> ${question.author} </td>
                            <td class="align-middle">
                                <fmt:parseDate value="${question.resdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                            </td>
                            <td class="align-middle">
                                <a href="${path }/qna/answerInsert?qno=${question.qno}" class="btn btn-dark">답변 추가</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty noAnswerList}">
                        <tr class="text-center">
                            <td colspan="5"> 답변 없는 질문이 없습니다 : ) </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>

                <!-- pagination -->
                <nav aria-label="Page navigation example" class="mt-25 mb-30">
                    <ul class="pagination justify-content-center">
                        <c:if test="${curPage > 5}">
                            <li class="page-item">
                                <a class="page-link" href="${path}/admin/qnaMgmt?page=${page.blockStartNum - 1}" aria-label="Previous">
                                    <span aria-hidden="true">  </span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                            <c:choose>
                                <c:when test="${i == curPage}">
                                    <li class="page-item active" aria-current="page">
                                        <a class="page-link" href="${path}/admin/qnaMgmt?page=${i}">${i}</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item">
                                        <a class="page-link" href="${path}/admin/qnaMgmt?page=${i}">${i}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${page.blockLastNum < page.totalPageCount}">
                            <li class="page-item">
                                <a class="page-link" href="${path}/admin/qnaMgmt?page=${page.blockLastNum + 1}" aria-label="Next">
                                    <span aria-hidden="true"> >> </span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../layout/footer.jsp"/>

<script src="${path}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="${path}/resources/js/sb-admin-2.min.js"></script>
</body>
</html>