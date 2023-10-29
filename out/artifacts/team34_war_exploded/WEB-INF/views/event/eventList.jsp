<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이벤트 목록</title>
    <jsp:include page="../layout/head.jsp"/>
    <style>

    </style>
</head>
<body>
<!-- 헤더 시작 -->
<jsp:include page="../layout/header.jsp"/>
<!-- 헤더 끝 -->
<!-- 브레드크럼 시작 -->
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url('${path}/resources/img/breadcrumb.jpg');">
    <div class="bradcumbContent">
        <p>특별한 경험과 혜택을 누려요</p>
        <h2>이벤트</h2>
    </div>
</section>
<!-- 브레드크럼 끝 -->
<section class="album-catagory section-padding-100-0" style="min-height: 60vh">
    <!-- 검색 엔진 시작 -->
    <div class="container">
        <div class="col-xl-4 col-md-6 float-right mb-20"  style="z-index: 10">
            <form action="${path}/event/list" method="get" >
                <div class="form-group ">
                    <div class="input-group-append">
                        <div class="panel single-accordion" style="border: 1px solid #ced4da; border-radius: 0.25rem;">
                            <select id="type" name="type" class="collapseOne" style="border: none;padding: 8px;">
                                <option value="T" > 제목 </option>
                                <option value="C"> 내용 </option>
                            </select>
                        </div>
                        <input type="text" name="keyword" class="form-control" placeholder="검색하기" aria-describedby="project-search-addon" />
                        <input class="btn btn-dark" type="submit" id="project-search-addon" value="검색"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- 검색 엔진 끝 -->
    <div class="container">
        <!-- 테이블 영역 시작 -->
        <div class="col-12 mb-5">
            <div class="card w-100">
                <div class="card-body">
                    <div class="table-responsive project-list">
                        <table class="table project-table table-centered table-nowrap">
                            <thead>
                            <tr>
                                <th scope="col" class="text-center" style="width: 5%">#</th>
                                <th scope="col" class="text-center">제목</th>
                                <th scope="col" class="text-center" style="width: 10%">상태</th>
                                <th scope="col" class="text-center" style="width: 15%">시작일</th>
                                <th scope="col" class="text-center" style="width: 15%">종료일</th>
                                <th scope="col" class="text-center" style="width: 15%">작성일</th>
                                <th scope="col" class="text-center" style="width: 10%">조회수</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${eventList }" var="event" varStatus="status">
                                <tr class="table-hover">
                                    <th class="text-center">${event.eno}</th>
                                    <th>
                                        <a href="${path}/event/detail?eno=${event.eno}&page=${curPage}">${event.title}</a>
                                    </th>
                                    <th class="text-center">
                                        <c:if test="${event.status eq 0}">
                                            <span class="ba badge-pill badge-danger p-2">종료</span>
                                        </c:if>
                                        <c:if test="${event.status eq 1}">
                                            <span class="ba badge-pill badge-success p-2">진행중</span>
                                        </c:if>
                                    </th>
                                    <th class="text-center">${event.sdate}</th>
                                    <th class="text-center">${event.edate}</th>
                                    <th class="text-center">
                                        <fmt:parseDate value="${event.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
                                    </th>
                                    <th class="text-center">${event.cnt}</th>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty eventList}">
                                <tr>
                                    <td colspan="7" class="text-center"> 등록된 이벤트가 없습니다.</td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                        <!-- 페이지 시작 -->
                        <div class="oneMusic-pagination-area wow">
                            <ul class="pagination justify-content-center mb-0">
                                <c:if test="${curPage > 5}">
                                    <li class="page-item">
                                        <a href="${path}/event/list?page=${page.blockStartNum - 1}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                           class="page-item"><i class="fa-solid fa-arrow-left"></i></a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="${page.blockStartNum}" end="${page.blockLastNum}">
                                    <c:choose>
                                        <c:when test="${i == curPage}">
                                            <li class="page-item active">
                                                <a href="${path}/event/list?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                                   class="page-link" aria-label="Page ${i}"
                                                   aria-current="page">${i}</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li  class="page-item">
                                                <a href="${path}/event/list?page=${i}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                                   class="page-link" aria-label="Page ${i}" aria-current="page">${i}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${page.blockLastNum < page.totalPageCount}">
                                    <li class="page-item">
                                        <a href="${path}/event/list?page=${page.blockLastNum + 1}<c:if test="${!empty page.keyword}">&type=${page.type}&keyword=${page.keyword}</c:if>"
                                           class="page-link"><i class="fa-solid fa-arrow-right"></i></a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                        <!-- 페이지 끝 -->
                        <c:if test="${sid eq 'admin'}">
                            <div class="btn float-right mt-10">
                                <a href="${path}/event/insert" class="btn btn-outline-dark">글쓰기</a>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 테이블 영역 끝 -->
</section>
<!-- 푸터 시작 -->
<jsp:include page="../layout/footer.jsp"/>
<!-- 푸터 끝 -->
</body>
</html>
