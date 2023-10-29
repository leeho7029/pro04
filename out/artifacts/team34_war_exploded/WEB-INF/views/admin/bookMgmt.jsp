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
    <title> 교재 관리 </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>
    <!-- 관리자 페이지 스타일 적용 -->
    <link href="${path}/resources/css/sb-admin-2.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <style>
        #book-table th, #book-table td {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

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
                                <div>
                                    <div class="d-flex justify-content-end">
                                        <!-- 검색어 입력 부분 -->
                                        <form action="${path}/admin/bookMgmt" method="get" class="w-50 mb-5">
                                            <div class="row">
                                                <div class="col mt-2">
                                                    <select class="form-select" id="type" name="type">
                                                        <option value="T"> 교재명 </option>
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
                                    
                                    <%--교재 목록--%>
                                    <table class="table project-table table-centered table-nowrap" id="book-table">
                                        <thead>
                                        <tr>
                                            <th class="text-center" style="border-bottom: 1px solid;" width="5%">#</th>
                                            <th class="text-center" style="border-bottom: 1px solid;" width="40%">교재명</th>
                                            <th class="text-center" style="border-bottom: 1px solid;" width="10%">저자</th>
                                            <th class="text-center" style="border-bottom: 1px solid;" width="10%">가격</th>
                                            <th class="text-center" style="border-bottom: 1px solid;" width="20%">비고</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${bookList }" var="book" varStatus="status">
                                            <tr class="table-hover">
                                                <th class="text-center" style="vertical-align: middle;">${book.bcode }</th>
                                                <th style="vertical-align: middle;">${book.bname }</th>
                                                <th class="text-center" style="vertical-align: middle;">${book.author}</th>
                                                <th class="text-center" style="vertical-align: middle;">${book.bprice}</th>
                                                <th class="text-center" style="vertical-align: middle;">
                                                    <div class="btn-group" style="align-items: center">
                                                        <a class="btn btn-dark" style="margin-right:5px;" href="${path}/admin/bookEdit?bcode=${book.bcode}">수정</a>
                                                        <a class="btn btn-dark" href="${path}/admin/bookReceive?bcode=${book.bcode}">입고</a>
                                                    </div>
                                                </th>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${empty bookList}">
                                            <tr>
                                                <td colspan="6" class="has-text-centered"> 등록된 교재가 없습니다. </td>
                                            </tr>
                                        </c:if>
                                        </tbody>
                                    </table>
                                    <!-- 페이지 시작 -->
                                    <div class="oneMusic-pagination-area wow">
                                        <ul class="pagination justify-content-center mb-0">
                                            <c:if test="${curPage > 5}">
                                                <li class="page-item">
                                                    <a href="${path}/admin/bookMgmt?page=${page.blockStartNum - 1}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                                       class="page-item"><i class="fa-solid fa-arrow-left"></i></a>
                                                </li>
                                            </c:if>
                                            <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                                <c:choose>
                                                    <c:when test="${i == curPage}">
                                                        <li class="page-item active">
                                                            <a href="${path}/admin/bookMgmt?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                                               class="page-link" aria-label="Page ${i}"
                                                               aria-current="page">${i}</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li  class="page-item">
                                                            <a href="${path}/admin/bookMgmt?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                                               class="page-link" aria-label="Page ${i}" aria-current="page">${i}</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                            <c:if test="${page.blockLastNum < page.totalPageCount}">
                                                <li class="page-item">
                                                    <a href="${path}/admin/bookMgmt?page=${page.blockLastNum + 1}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
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