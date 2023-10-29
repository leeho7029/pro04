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
    <title> 회원관리 </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>
    <!-- 관리자 페이지 스타일 적용 -->
    <link href="${path}/resources/css/sb-admin-2.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <c:if test="${not empty msg}">
        <script>
            alert("${msg} 회원을 강제 탈퇴시켰습니다.");
        </script>
    </c:if>
</head>
<body>
<div id="wrapper">
    <jsp:include page="../layout/adminSidebar.jsp" />

    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
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
                <div class="d-flex justify-content-end">
                    <!-- 검색어 입력 부분 -->
                    <form action="${path}/admin/userMgmt" method="get" class="w-50 mb-5">
                        <div class="row">
                            <div class="col mt-2">
                                <select class="form-select" id="type" name="type">
                                    <option value="I"> 아이디 </option>
                                    <option value="N"> 이름 </option>
                                </select>
                            </div>
                            <div class="col-xl-8 col-lg-12 col-md-12 mt-2">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="keyword" name="keyword"
                                           placeholder="검색어를 입력해주세요" autocomplete="off" aria-label="검색어를 입력해주세요"
                                           aria-describedby="button-addon2" value="${page.keyword}">
                                    <div class="input-group-append">
                                        <button class="btn btn-dark" type="submit" id="button-addon2"> 검색</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <table class="table table-hover text-center">
                    <thead>
                    <tr>
                        <th> 아이디 </th>
                        <th width="150"> 이름 </th>
                        <th width="180"> 연락처 </th>
                        <th width="180"> 이메일 </th>
                        <th width="210"> 가입일 </th>
                        <th width="150"> 접속횟수 </th>
                        <th width="100"> 보유포인트 </th>
                        <th width="150"> 비고 </th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${userList}">
                        <tr>
                            <td class="align-middle"> ${user.id} </td>
                            <td class="align-middle"> ${user.name} </td>
                            <td class="align-middle"> ${user.tel} </td>
                            <td class="align-middle"> ${user.email} </td>
                            <td class="align-middle"> ${user.regdate} </td>
                            <td class="align-middle"> ${user.visited} 회 </td>
                            <td class="align-middle"> ${user.pt} pt </td>
                            <td class="align-middle">
                                <a href="${path}/admin/userDelete?id=${user.id}" class="btn btn-danger"> 강제탈퇴 </a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty userList}">
                        <tr class="text-center">
                            <td colspan="8"> 가입된 회원이 없습니다. </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>

                <!-- pagination -->
                <nav aria-label="Page navigation example" class="mt-25 mb-30">
                    <ul class="pagination justify-content-center">
                        <c:if test="${curPage > 5}">
                            <li class="page-item">
                                <a class="page-link" href="${path}/admin/userMgmt?page=${page.blockStartNum - 1}" aria-label="Previous">
                                    <span aria-hidden="true"> </span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                            <c:choose>
                                <c:when test="${i == curPage}">
                                    <li class="page-item active" aria-current="page">
                                        <a class="page-link" href="${path}/admin/userMgmt?page=${i}">${i}</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item">
                                        <a class="page-link" href="${path}/admin/userMgmt?page=${i}">${i}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${page.blockLastNum < page.totalPageCount}">
                            <li class="page-item">
                                <a class="page-link" href="${path}/admin/userMgmt?page=${page.blockLastNum + 1}" aria-label="Next">
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