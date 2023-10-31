<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <jsp:include page="../layout/head.jsp"/>
    <style>
        .card { border: none; margin-bottom: 24px; -webkit-box-shadow: 0 0 13px 0 rgba(236,236,241,.44);box-shadow: 0 0 13px 0 rgba(236,236,241,.44);}
        #profile {margin-top: 10px;border-radius: 30px; width: 150px;}
    </style>
</head>
<body>
<!-- header Start -->
<jsp:include page="../layout/header.jsp" />
<!-- header End -->

<!-- banner Start -->
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url('${path}/resources/img/breadcrumb.jpg');">
    <div class="bradcumbContent">
        <p style="color: white; font-weight: bold; font-size:30px;">마이페이지</p>
    </div>
</section>
<!-- banner End -->

<!-- mypage Start -->
<!-- sidemenu Start -->
<div class="container-fluid d-flex justify-content-end p-0 mt-15">
    <div class="d-flex justify-content-between">
        <a class="nav-link active" aria-current="page" href="${path}/user/myPage" >${user.name} 님</a>
        <a class="nav-link" href="${path}/user/edit">내 정보 수정</a>
    </div>
</div>
<!--sidemenu End -->
<div class="row" style="width: 85%; margin: 0 auto; padding-bottom: 50px;">
    <!-- section1(info) Start-->
    <div class="row" style="width: 90%; margin: 150px auto;">
        <div class="row">
            <h5>온라인 수강내역</h5>
        </div>
        <div class="col-lg-12" style="width: 100%;">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive project-list">
                        <table class="table project-table table-centered table-nowrap text-center">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">강좌명</th>
                                <th scope="col">강사</th>
                                <th scope="col">수강기간</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="lecture" items="${myLecture}" >
                                <c:if test="${lecture.state eq 'on'}">
                                    <tr onclick="javascript: location.href='${path}/lecture/detail?lcode=${lecture.lcode}';" style="cursor:pointer;">
                                        <th scope="row">${lecture.lcode}</th>
                                        <td class="text-left">${lecture.lname}</td>
                                        <td>${lecture.tname}</td>
                                        <td>${lecture.sdate} ~ ${lecture.edate}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            <c:if test="${empty myLecture}">
                                <tr>
                                    <td colspan="4" class="text-center"> 수강신청한 강의가 없습니다. </td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                    </div>

                    <nav aria-label="Page navigation example">
                        <c:if test="${curPage > 5}">
                            <a href="${path}/user/lecture?page=${page.blockStartNum - 1}" class="page-link">Previous</a>
                        </c:if>
                        <c:if test="${page.blockLastNum < page.totalPageCount}">
                            <a href="${path}/user/lecture?page=${page.blockLastNum + 1}" class="page-link">Next page</a>
                        </c:if>

                        <ul class="pagination justify-content-center">
                            <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                <c:choose>
                                    <c:when test="${i == curPage}">
                                        <li class="page-item">
                                            <a href="${path}/user/lecture?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="page-link active" aria-label="Page ${i}" aria-current="page" style="background-color: #545050; color:#FFFFFF">${i}</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item">
                                            <a href="${path}/user/lecture?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>" class="page-link" aria-label="Page ${i}" aria-current="page">${i}</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </ul>
                    </nav>

                </div>
            </div>
        </div>
    </div>

<!-- mypage End -->
<div class="row" style="width: 85%; margin: 0 auto; padding-bottom: 50px;">
    <div class="row">
        <h5>오프라인 수강내역</h5>
    </div>
    <div class="col-lg-12" style="width: 100%;">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive project-list">
                    <table class="table project-table table-centered table-nowrap text-center">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">강좌명</th>
                            <th scope="col">강사</th>
                            <th scope="col">수강기간</th>
                            <th scope="col">비고</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="lecture" items="${offLecture}" >
                            <c:if test="${lecture.state eq 'off'}">
                                <tr>
                                    <th scope="row">${lecture.lcode}</th>
                                    <td class="text-left">${lecture.lname}</td>
                                    <td>${lecture.tname}</td>
                                    <td>${lecture.sdate} ~ ${lecture.edate}</td>
                                    <td><a href="${path}/lectureAttend/studentAttend?lcode=${lecture.lcode}"
                                           class="btn btn-primary">출석하기</a></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty offLecture}">
                            <tr>
                                <td colspan="5"> 수강신청한 강의가 없습니다. </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>

                <nav aria-label="Page navigation example">
                    <c:if test="${curPage > 5}">
                        <a href="${path}/user/lecture?page=${page2.blockStartNum - 1}" class="page-link">Previous</a>
                    </c:if>
                    <c:if test="${page2.blockLastNum < page2.totalPageCount}">
                        <a href="${path}/user/lecture?page=${page2.blockLastNum + 1}" class="page-link">Next page</a>
                    </c:if>

                    <ul class="pagination justify-content-center">
                        <c:forEach var="i" begin="${page2.blockStartNum}" end="${page2.blockLastNum}">
                            <c:choose>
                                <c:when test="${i == curPage}">
                                    <li class="page-item">
                                        <a href="${path}/user/lecture?page=${i}<c:if test="${!empty page2.keyword}">&type=${page2.type}&keyword=${page2.keyword}</c:if>" class="page-link active" aria-label="Page ${i}" aria-current="page" style="background-color: #545050; color:#FFFFFF">${i}</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item">
                                        <a href="${path}/user/lecture?page=${i}<c:if test="${!empty page2.keyword}">&type=${page2.type}&keyword=${page2.keyword}</c:if>" class="page-link" aria-label="Page ${i}" aria-current="page">${i}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
</div>

<!-- Footer Start -->
<jsp:include page="../layout/footer.jsp" />
<!-- Footer End -->

</script>
</body>
</html>