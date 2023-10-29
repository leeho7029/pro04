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
    <title> 배송관리 </title>
    <jsp:include page="../layout/head.jsp"></jsp:include>
    <!-- 관리자 페이지 스타일 적용 -->
    <link href="${path}/resources/css/sb-admin-2.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
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
                <h4 style="padding-left: 10px;"><i class="fa-solid fa-check-to-slot" style="color: #595959; padding-right: 10px;"></i>결제완료 목록</h4>
                <div style="margin-top: 22px;">
                    <%--결제완료 목록--%>
                    <table class="table" id="payment-table">
                        <thead>
                        <tr>
                            <th width="80">번호</th>
                            <th>상품명</th>
                            <th width="200">주문자ID</th>
                            <th width="120">결제일</th>
                            <th width="100">배송상태</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${deliveryList }" var="delivery">
                            <tr>
                                <td>${delivery.dno }</td>
                                <td><a href="javascript:void(0);" onclick="openChildWindow(${delivery.dno})">${delivery.title}</a></td>
                                <td>${delivery.id }</td>
                                <td>
                                    <fmt:parseDate value="${delivery.resdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                    <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                                </td>
                                <td class="text-center">
                                    <c:if test="${delivery.dstatus == 0}">배송준비중</c:if>
                                    <c:if test="${delivery.dstatus == 1}">배송중</c:if>
                                    <c:if test="${delivery.dstatus == 2}">배송완료</c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty deliveryList}">
                            <tr>
                                <td colspan="6" class="text-center"> 결제내역이 없습니다. </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                    <%--페이지 --%>
                    <nav aria-label="Page navigation example" class="mt-25 mb-30">
                            <ul class="pagination justify-content-center">
                                <c:if test="${curPage > 5}">
                                    <li class="page-item">
                                        <a class="page-link" href="${path}/admin/deliveryMgmt?page=${page.blockStartNum - 1}" aria-label="Previous">
                                            <span aria-hidden="true"></span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                    <c:choose>
                                        <c:when test="${i == curPage}">
                                            <li class="page-item active" aria-current="page">
                                                <a class="page-link" href="${path}/admin/deliveryMgmt?page=${i}">${i}</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item">
                                                <a class="page-link" href="${path}/admin/deliveryMgmt?page=${i}">${i}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${page.blockLastNum < page.totalPageCount}">
                                    <li class="page-item">
                                        <a class="page-link" href="${path}/admin/deliveryMgmt?page=${page.blockLastNum + 1}" aria-label="Next">
                                            <span aria-hidden="true"> >> </span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                </div>
            </div>
            <div class="container-fluid" style="padding: 100px">
                <h4 style="padding-left: 10px;"><i class="fa-solid fa-truck" style="color: #3c3d3e; padding-right: 10px;"></i>배송관리</h4>
                <div style="margin-top: 22px;">
                    <%--배송관리 목록--%>
                    <table class="table" id="del-table">
                        <thead>
                        <tr>
                            <th width="250">송장번호</th>
                            <th width="300">상품명</th>
                            <th width="150">배송시작일</th>
                            <th width="150">배송예정일</th>
                            <th width="100">배송상태</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${deliveryList }" var="delivery" varStatus="status">
                            <c:if test="${!empty delivery.dcode}">
                            <tr>
                                <td>${delivery.dcode }</td>
                                <td><a href="${path}/admin/deliveryUpdate?dno=${delivery.dno }" style="color: #000000; text-decoration: none;">${delivery.title }</a></td>
                                <td>
                                    <fmt:parseDate value="${delivery.resdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                                    <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd" />
                                </td>
                                <td>
                                    <c:if test="${empty delivery.edate}">배송준비중</c:if>
                                    <c:if test="${!empty delivery.edate}">${delivery.edate}</c:if>
                                </td>
                                <td>
                                    <c:if test="${delivery.dstatus eq '0'}">배송준비중</c:if>
                                    <c:if test="${delivery.dstatus eq '1'}">배송중</c:if>
                                    <c:if test="${delivery.dstatus eq '2'}">배송완료</c:if>
                                </td>
                            </tr>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty deliveryList}">
                            <tr>
                                <td colspan="6" class="text-center"> 배송내역이 없습니다. </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                    <%--페이지 --%>
                    <nav aria-label="Page navigation example" class="mt-25 mb-30">
                            <ul class="pagination justify-content-center">
                                <c:if test="${curPage > 5}">
                                    <li class="page-item">
                                        <a class="page-link" href="${path}/admin/deliveryMgmt?page=${page.blockStartNum - 1}" aria-label="Previous">
                                            <span aria-hidden="true"></span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                    <c:choose>
                                        <c:when test="${i == curPage}">
                                            <li class="page-item active" aria-current="page">
                                                <a class="page-link" href="${path}/admin/deliveryMgmt?page=${i}">${i}</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item">
                                                <a class="page-link" href="${path}/admin/deliveryMgmt?page=${i}">${i}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${page.blockLastNum < page.totalPageCount}">
                                    <li class="page-item">
                                        <a class="page-link" href="${path}/admin/deliveryMgmt?page=${page.blockLastNum + 1}" aria-label="Next">
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
</div>
<script>
    function openChildWindow(dno) {
        var child = window.open("${path}/admin/dcodeUpdate?dno=" + dno, "child", "width=900, height=800");
    }
</script>


<!-- 푸터 영역 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 영역 끝 -->

</body>
</html>